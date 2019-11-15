import 'package:fluencybank/components/circular_image.dart';
import 'package:fluencybank/components/rounded_rect_image.dart';
import 'package:flutter/material.dart';
import 'package:fluencybank/components/masked_textinput_formatter.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class TopupPayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopupPaymentState();
  }
}

class _TopupPaymentState extends State<TopupPayment> {
  final cardNumberController = TextEditingController();
  final expireDateController = TextEditingController();
  final cvvController = TextEditingController();
  final amountController = MoneyMaskedTextController(leftSymbol: '£', decimalSeparator: '.', thousandSeparator: ',');

  bool canContinue = false;
  bool addCard = false;

  @override
  void initState() {
    super.initState();

    cardNumberController.addListener(checkCanContinue);
    expireDateController.addListener(checkCanContinue);
    cvvController.addListener(checkCanContinue);
    amountController.addListener(checkCanContinue);
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expireDateController.dispose();
    cvvController.dispose();
    amountController.dispose();

    super.dispose();
  }

  checkCanContinue() {
    String cardNumber = cardNumberController.text;
    String expireDate = expireDateController.text;
    String cvv = cvvController.text;
    double amount = amountController.numberValue;

    if (cardNumber.length == 19 && expireDate.length == 5 && cvv.length == 3 && amount > 0) {
      setState(() {
        canContinue = true;
      });
    } else {
      setState(() {
        canContinue = false;
      });
    }
  }

  onChangeAddCard(bool changed) {
    setState(() {
      addCard = changed;
    });
  }

  onBack() {
    Navigator.of(context).pushNamed('topup');
  }

  onPay() {
    Navigator.of(context).pushNamed('topup_success');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 16, left: 16),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onTap: onBack,
                                child: Image.asset("assets/images/close.png", width: 24, height: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Top up account",
                              style: AppStyles.font12.copyWith(
                                color: AppColors.c131113,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                              margin: EdgeInsets.only(top: 8, bottom: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(26, 36, 32, 55),
                                    offset: Offset(0, 2),
                                    blurRadius: 10,
                                  ),
                                ],
                                color: AppColors.cF9F9F9,
                              ),
                              child: Row(
                                children: <Widget>[
                                  RoundedRectImage(
                                    image: AssetImage("assets/flags/gb.png"),
                                    radius: 5,
                                    width: 24,
                                    height: 24,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('GBP', style: AppStyles.font16),
                                          Text('£5,000.10', style: AppStyles.font12),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Text(
                              "Top up with debit or credit card",
                              style: AppStyles.font12.copyWith(
                                color: AppColors.c131113,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(26, 36, 32, 55),
                                offset: Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                            color: AppColors.cF9F9F9,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 20, 16, 16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextField(
                                            controller: cardNumberController,
                                            inputFormatters: [
                                              MaskedTextInputFormatter(
                                                mask: 'xxxx xxxx xxxx xxxx',
                                                separator: ' ',
                                              ),
                                            ],
                                            style: AppStyles.font16,
                                            cursorWidth: 1,
                                            cursorColor: AppColors.c212121,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                InputDecoration(labelText: 'Card Number', hintText: 'XXXX  XXXX  XXXX  XXXX', contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 32),
                                      child: Image.asset("assets/images/card-scan.png", width: 24, height: 24),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            TextField(
                                              controller: expireDateController,
                                              inputFormatters: [
                                                MaskedTextInputFormatter(
                                                  mask: 'xx/xx',
                                                  separator: '/',
                                                ),
                                              ],
                                              style: AppStyles.font16,
                                              cursorWidth: 1,
                                              cursorColor: AppColors.c212121,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(hintText: 'MM/YY', labelText: 'Expiry date', contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            TextField(
                                              controller: cvvController,
                                              inputFormatters: [
                                                MaskedTextInputFormatter(mask: 'xxx', separator: ''),
                                              ],
                                              style: AppStyles.font16,
                                              cursorWidth: 1,
                                              cursorColor: AppColors.c212121,
                                              keyboardType: TextInputType.number,
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                hintText: '***',
                                                labelText: 'CVV',
                                                contentPadding: EdgeInsets.only(bottom: 4, top: 8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Save this card?", style: AppStyles.font16),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Switch(
                                              value: addCard,
                                              onChanged: onChangeAddCard,
                                              activeTrackColor: AppColors.c6CCA51.withOpacity(0.5),
                                              activeColor: AppColors.c6CCA51,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Amount",
                              style: AppStyles.font12.copyWith(
                                color: AppColors.c131113,
                              ),
                            ),
                            TextField(
                              controller: amountController,
                              style: AppStyles.font32,
                              textAlign: TextAlign.center,
                              cursorWidth: 1,
                              cursorColor: AppColors.c212121,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: '£ 0', contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(16),
                              child: RaisedGradientButton(
                                child: Text(
                                  "Top Up",
                                  style: AppStyles.buttonTextStyle,
                                ),
                                gradient: canContinue
                                    ? LinearGradient(
                                        colors: [AppColors.c00B3DF, AppColors.c00B3DF],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : LinearGradient(
                                        colors: [AppColors.cBDBDBD, AppColors.cBDBDBD],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                onPressed: canContinue ? onPay : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
