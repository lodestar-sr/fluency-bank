import 'package:fluencybank/components/masked_textinput_formatter.dart';
import 'package:fluencybank/components/raised_gradient_button.dart';
import 'package:fluencybank/views/theme.dart';
import 'package:flutter/material.dart';

class DeliveryPayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliveryPaymentState();
  }
}

class _DeliveryPaymentState extends State<DeliveryPayment> {
  final cardNumberController = TextEditingController();
  final expireDateController = TextEditingController();
  final cvvController = TextEditingController();

  bool canContinue = false;
  bool addCard = false;

  @override
  void initState() {
    super.initState();

    cardNumberController.addListener(checkCanContinue);
    expireDateController.addListener(checkCanContinue);
    cvvController.addListener(checkCanContinue);
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expireDateController.dispose();
    cvvController.dispose();

    super.dispose();
  }

  checkCanContinue() {
    String cardNumber = cardNumberController.text;
    String expireDate = expireDateController.text;
    String cvv = cvvController.text;

    if (cardNumber.length == 19 && expireDate.length == 5 && cvv.length == 3) {
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
    Navigator.of(context).pushNamed('delivery_option');
  }

  onPay() {
    Navigator.of(context).pushNamed('delivery_done');
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
                          height: 16,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: onBack,
                                  child: Image.asset("assets/images/arrow_back.png", width: 24, height: 24),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Enter card number",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.font16.copyWith(color: Colors.black),
                                ),
                              )
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 28, 16, 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(26, 36, 32, 55),
                              offset: Offset(0, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(16, 20, 16, 16),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: AppColors.cE0E0E0),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Card number",
                                            style: AppStyles.font12.copyWith(color: AppColors.cBDBDBD),
                                          ),
                                          TextField(
                                            controller: cardNumberController,
                                            inputFormatters: [
                                              MaskedTextInputFormatter(
                                                mask: 'xxxx xxxx xxxx xxxx',
                                                separator: ' ',
                                              ),
                                            ],
                                            style: AppStyles.font14,
                                            cursorWidth: 1,
                                            cursorColor: AppColors.c212121,
                                            keyboardType: TextInputType.number,
                                            decoration:
                                                InputDecoration(hintText: 'XXXX  XXXX  XXXX  XXXX', border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
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
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: AppColors.cE0E0E0),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Expire date", style: AppStyles.font12.copyWith(color: AppColors.cBDBDBD)),
                                            TextField(
                                              controller: expireDateController,
                                              inputFormatters: [
                                                MaskedTextInputFormatter(
                                                  mask: 'xx/xx',
                                                  separator: '/',
                                                ),
                                              ],
                                              style: AppStyles.font14,
                                              cursorWidth: 1,
                                              cursorColor: AppColors.c212121,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(hintText: 'MM/YY', border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.only(left: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(color: AppColors.cE0E0E0),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("CVV", style: AppStyles.font12.copyWith(color: AppColors.cBDBDBD)),
                                            TextField(
                                              controller: cvvController,
                                              inputFormatters: [
                                                MaskedTextInputFormatter(mask: '***', separator: ''),
                                              ],
                                              style: AppStyles.font14,
                                              cursorWidth: 1,
                                              cursorColor: AppColors.c212121,
                                              keyboardType: TextInputType.number,
                                              obscureText: true,
                                              decoration: InputDecoration(hintText: '***', border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 4, top: 8)),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Add this card in Wealthpal account",
                              style: AppStyles.font12.copyWith(
                                color: Color.fromARGB(180, 34, 34, 56),
                              ),
                            ),
                            Switch(
                              value: addCard,
                              onChanged: onChangeAddCard,
                              activeTrackColor: AppColors.c6CCA51.withOpacity(0.5),
                              activeColor: AppColors.c6CCA51,
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
                                  "Pay £11.99",
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
                                shadows: canContinue
                                    ? [
                                        BoxShadow(
                                          color: Color.fromARGB(64, 145, 0, 247),
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                        )
                                      ]
                                    : [
                                        BoxShadow(
                                          color: AppColors.cBDBDBD,
                                          offset: Offset(0, 4),
                                          blurRadius: 10,
                                        )
                                      ],
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
