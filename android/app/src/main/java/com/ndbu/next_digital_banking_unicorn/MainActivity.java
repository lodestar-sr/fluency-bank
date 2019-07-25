package com.ndbu.next_digital_banking_unicorn;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import com.androidnetworking.AndroidNetworking;
import com.androidnetworking.error.ANError;
import com.androidnetworking.interfaces.JSONObjectRequestListener;
import com.onfido.android.sdk.capture.ExitCode;
import com.onfido.android.sdk.capture.Onfido;
import com.onfido.android.sdk.capture.OnfidoConfig;
import com.onfido.android.sdk.capture.OnfidoFactory;
import com.onfido.android.sdk.capture.errors.OnfidoException;
import com.onfido.android.sdk.capture.ui.options.FlowStep;
import com.onfido.android.sdk.capture.ui.options.MessageScreenStep;
import com.onfido.android.sdk.capture.upload.Captures;
import com.onfido.api.client.data.Applicant;

import org.json.JSONException;
import org.json.JSONObject;

import java.time.LocalDate;
import java.util.Date;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  private static final String CHANNEL = "flutter.native/helper";
  private static final String API_TOKEN = "test_bmwfRO3al6XqKPMipTJ2TQqT7FG4Dbpl";
  private static final String MOBILE_TOKEN= "test_E9h6jzJThf21ZjGJZHcDuXtgNEMb7mf0";

  private final FlowStep[] flowSteps = new FlowStep[] {
          new MessageScreenStep("Welcome", "In the following steps you will be asked to perform a verification check", "Start"),
          FlowStep.CAPTURE_DOCUMENT,
          FlowStep.CAPTURE_FACE,
          new MessageScreenStep("Thank you", "We will use your captured document and face to perform a verification check", "Start Check")
  };

  private Onfido client;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    client = OnfidoFactory.create(this).getClient();

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("startKYC")) {
          startKYC();
          result.success("Ok, success");
        }
      }
    });
  }

  @Override
  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    client.handleActivityResult(resultCode, data, new Onfido.OnfidoResultListener() {
      @Override
      public void userCompleted(Applicant applicant, Captures captures) {
        startCheck(applicant);
      }

      @Override
      public void userExited(ExitCode exitCode, Applicant applicant) {
        showToast("User cancelled.");
      }

      @Override
      public void onError(OnfidoException e, Applicant applicant) {
        e.printStackTrace();
        showToast("Unknown error");
      }
    });
  }

  private void startKYC() {

    createApplicant(new JSONObjectRequestListener() {
      @Override
      public void onResponse(JSONObject response) {
        try {
          String applicantId = response.getString("id");
          OnfidoConfig.Builder onfidoConfigBuilder = OnfidoConfig.builder()
                  .withApplicant(applicantId)
                  .withToken(MOBILE_TOKEN);

          if (flowSteps != null) {
            onfidoConfigBuilder.withCustomFlow(flowSteps);
          }

          OnfidoConfig onfidoConfig = onfidoConfigBuilder.build();
          client.startActivityForResult(MainActivity.this, 1, onfidoConfig);
        } catch (JSONException e) {
          e.printStackTrace();
        }
      }

      @Override
      public void onError(ANError anError) {
      }
    });
  }

  private void createApplicant(JSONObjectRequestListener listener) {
    try {
      final JSONObject applicant = new JSONObject();
      applicant.put("first_name", "Test");
      applicant.put("last_name", "Onfido");
      applicant.put("email", "onfido@yopmail.com");

      AndroidNetworking.post("https://api.onfido.com/v2/applicants")
              .addJSONObjectBody(applicant)
              .addHeaders("Accept", "application/json")
              .addHeaders("Authorization", "Token token=" + API_TOKEN)
              .build()
              .getAsJSONObject(listener);

    } catch (JSONException e) {
      e.printStackTrace();
    }
  }

  private void startCheck(Applicant applicant) {
    //Call your back end to initiate the check
    completedCheck();
  }

  private void completedCheck() {
    //
  }

  private void showToast(String message) {
    Toast.makeText(this, message, Toast.LENGTH_LONG).show();
  }
}
