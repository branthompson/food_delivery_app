import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:dishdash/screens/delivery_progress_screen.dart';
import 'package:dishdash/components/my_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expireDate = '';
  String cardOwner= '';
  String cvvNum= '';
  bool isCvvSelected= false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm"),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ensures it takes minimum space
            children: [
              Text("Card Number: $cardNumber"),
              Text("Expire Date: $expireDate"),
              Text("Card Owner Name: $cardOwner"),
              Text("CVV: $cvvNum"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryProgressScreen()),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(  // Ensures the entire screen can scroll
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expireDate,
              cardHolderName: cardOwner,
              cvvCode: cvvNum,
              showBackView: isCvvSelected,
              onCreditCardWidgetChange: (p0) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expireDate,
              cardHolderName: cardOwner,
              cvvCode: cvvNum,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expireDate = data.expiryDate;
                  cardOwner = data.cardHolderName;
                  cvvNum = data.cvvCode;
                });
              },
              formKey: formKey,
            ),
            const SizedBox(height: 20),
            MyButton(
              text: "Pay Now",
              onTap: userTappedPay,
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
