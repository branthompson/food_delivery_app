import 'package:dishdash/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget{
  const PaymentScreen({super.key});

  @override 
  State<PaymentScreen> createState()=> _PaymentScreenState();
}


class _PaymentScreenState extends State<PaymentScreen>{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expireDate = '';
  String cardOwner= '';
  String cvvNum= '';
  bool isCvvSelected= false;
  //user taps pay now
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //show confirm dialog if form info is valid
      showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("Confirm"),
          content: SingleChildScrollView(
            child: ListView(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expire Date: $expireDate"),
                Text("Card Owner Name: $cardOwner"),
                Text("CVV: $cvvNum"),
              ],
            ),
          ),
          actions: [
            //cancel payment
            TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel")
            ),
            
            //continue paying
             TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveryProgressScreen(),
                ),
            ), 
            child: Text("Yes"))
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          //payment info
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expireDate, 
            cardHolderName: cardOwner, 
            cvvCode: cvvNum, 
            showBackView: isCvvSelected, 
            onCreditCardWidgetChange:(p0) {} ,
            ),
            
          //payment form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expireDate, 
            cardHolderName: cardOwner, 
            cvvCode: cvvNum, 
            onCreditCardModelChange:(data) {
              setState(() {
                cardNumber: data.cardNumber; 
                expiryDate: expireDate; 
                cardHolderName: cardOwner; 
                cvvCode: data.cvvCode;
                });
            } ,
            formKey: formKey,
          ),
          const Spacer(),
          MyButton(onTap: userTappedPay,
           text: "Pay Now",
           ),
           const SizedBox(
            height: 25,
           ),
        ],
      ),
    );
  }
}