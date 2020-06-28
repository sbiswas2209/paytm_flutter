import 'package:flutter/material.dart';
import 'package:paytm_naaniz/pages/paymentScreen.dart';
class HomePage extends StatefulWidget {
  static final String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String amount;
  List title = ['Potato',
                'Onion',
                'Beans'];
  List images = ['assets/images/potato.jpg',
                'assets/images/onion.jpg',
                'assets/images/beans.jpg'];
  List price = [30.0,40.0,50.0];
  List count = [0 , 0 , 0];
  double _amount = 0.0;
  _calcTotal(){
    double temp = 0;
    for(int i = 0 ; i < title.length ; i++){
      temp += price[i]*count[i];
    }
    setState(() {
      _amount = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paytm Sample'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.payment),
            label: Text('$_amount'),
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new PaymentScreen(amount : _amount.toString()))),
          ),
        ],
      ),
      body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context , int index){
              return Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: <Widget>[
                        Text('${title[index]}',
                          style: TextStyle(
                            backgroundColor: Colors.white,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: (){
                                if(count[index] > 0){
                                  setState(() {
                                    count[index] = count[index] - 1;
                                  });
                                  _calcTotal();
                                }
                              },
                              child: Icon(Icons.remove_circle_outline),
                            ),
                            Text('${count[index]}kg',
                              style: TextStyle(
                                color: Colors.black,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            FlatButton(
                              onPressed: (){
                                setState(() {
                                  count[index] = count[index] + 1;
                                });
                                _calcTotal();
                              },
                              child: Icon(Icons.add_circle_outline),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            childCount: 3,
          ),
        ),
          ],
      ),
    );
  }
}