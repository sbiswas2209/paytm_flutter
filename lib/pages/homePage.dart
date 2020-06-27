import 'package:flutter/material.dart';
import 'package:paytm_naaniz/pages/paymentScreen.dart';
class HomePage extends StatefulWidget {
  static final String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paytm Sample'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Amount',
            ),
            onChanged: (value) {
              setState(() {
                amount = value;
              });
            },
          ),
          RaisedButton(
            child: Text('Pay'),
            onPressed: (){
              if(amount != null){
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new PaymentScreen(amount: this.amount)));
              }
            },
          ),
        ],
      ),
    );
  }
}