import 'package:fluencybank/views/dashboard/Accounts/SeeallLastAction.dart';
import 'package:fluencybank/views/dashboard/Accounts/account_details.dart';
import 'package:fluencybank/views/dashboard/Accounts/accountcreated.dart';
import 'package:fluencybank/views/dashboard/Accounts/accounts.dart';
import 'package:fluencybank/views/dashboard/Accounts/addacount.dart';
import 'package:fluencybank/views/dashboard/Accounts/enteremail.dart';
import 'package:fluencybank/views/dashboard/Accounts/statement.dart';
import 'package:fluencybank/views/dashboard/Accounts/statementsent.dart';
import 'package:fluencybank/views/dashboard/dashboard.dart';
import 'package:fluencybank/views/home.dart';
import 'package:fluencybank/views/topup/passcode.dart';
import 'package:fluencybank/views/topup/topup_payment.dart';
import 'package:fluencybank/views/topup/topup_success.dart';
import 'package:flutter/material.dart';
import 'package:fluencybank/views/delivery/confirm_delivery_address.dart';
import 'package:fluencybank/views/delivery/delivery_address.dart';
import 'package:fluencybank/views/delivery/delivery_done.dart';
import 'package:fluencybank/views/delivery/delivery_option.dart';
import 'package:fluencybank/views/delivery/delivery_payment.dart';
import 'package:fluencybank/views/splash.dart';
import 'package:fluencybank/views/signup/signup_1.dart';
import 'package:fluencybank/views/signup/signup_2.dart';
import 'package:fluencybank/views/signup/signup_3.dart';
import 'package:fluencybank/views/signup/signup_4.dart';
import 'package:fluencybank/views/signup/signup_end.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:fluencybank/views/verify/add_card.dart';
import 'package:fluencybank/views/topup/topup.dart';
import 'package:fluencybank/views/verify/vcard_done.dart';
import 'package:fluencybank/views/verify/verify_1.dart';
import 'package:fluencybank/views/verify/verify_3.dart';
import 'package:fluencybank/views/verify/verify_4.dart';

import 'dashboard/Accounts/CurrencyOptions.dart';
import 'dashboard/Accounts/Exchange.dart';
import 'dashboard/Accounts/ExchangeSuccess.dart';
import 'dashboard/Accounts/topupaccount.dart';
import 'dashboard/Accounts/topupaccountSuccess.dart';
import 'dashboard/Cards/InviteFriends.dart';
import 'dashboard/Cards/InvitefriendsfromContacts.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      home: Dashboard(),
      routes: {
        'splash': (_) => Splash(),
        'home': (_) => Home(),

        'signup_1': (_) => Signup1(),
        'signup_2': (_) => Signup2(),
        'signup_3': (_) => Signup3(),
        'signup_4': (_) => Signup4(),
        'signup_end': (_) => SignupEnd(),

        'verify_1': (_) => Verify1(),
        'verify_3': (_) => Verify3(),
        'verify_4': (_) => Verify4(),
        'vcard_done': (_) => VCardDone(),

        'topup': (_) => Topup(),
        'topup_payment': (_) => TopupPayment(),
        'topup_success': (_) => TopupSuccess(),
        'passcode': (_) => Passcode(),

        'add_card': (_) => AddCard(),

        'confirm_delivery_address': (_) => ConfirmDeliveryAddress(),
        'delivery_address': (_) => DeliveryAddress(),
        'delivery_option': (_) => DeliveryOption(),
        'delivery_done': (_) => DeliveryDone(),
        'delivery_payment': (_) => DeliveryPayment(),

        'dashboard': (_) => Dashboard(),
        'accounts' : (_) => Accounts(),
        'add_acount': (_) => Addaccount(),
        'topupaccount': (_) => TopUpAccount(),
        'account_details': (_) => Account_details(),
        'statement': (_) => Statement(),
        'enteremail': (_) => EnterEmail(),
        'statementsent':(_) => Statementsent(),
        'topupaccountsuccess':(_) => TopupaccountSuccess(),
        'account_created': (_) => Accountcreated(),
        'seealllastactions': (_) => SeeAllLastActions(),
        'exchange' :(_) => Exchange(),
        'ExchangeCurrencyTOoptions' : (_) => ExchangeCurrencyTOoptions(),
        'ExchangeSuccess': (_) => ExchangeSuccess(),

        //card 
        'InviteFriends': (_) => InviteFriends(),
        'InviteFriendsFromcontacts': (_) => InviteFriendsFromcontacts(),
      },
    );
  }

}