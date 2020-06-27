import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:paytm_naaniz/constants/constants.dart';
class PaymentScreen extends StatefulWidget {
  final String amount;
  PaymentScreen({this.amount});
  static final String tag = 'payment-screen';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewController _webController;
  String _loadHTML() {
    return "<html> <body onload='document.f.submit();'> <form id='f' name='f' method='post' action='$PAYMENT_URL'><input type='hidden' name='orderID' value='ORDER_${DateTime.now().millisecondsSinceEpoch}'/>" +
        "<input  type='hidden' name='custID' value='${ORDER_DATA["custID"]}' />" +
        "<input  type='hidden' name='amount' value='${widget.amount}' />" +
        "<input type='hidden' name='custEmail' value='${ORDER_DATA["custEmail"]}' />" +
        "<input type='hidden' name='custPhone' value='${ORDER_DATA["custPhone"]}' />" +
        "</form> </body> </html>";
  }
  @override
  void dispose(){
    _webController = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PayTM'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            debuggingEnabled: false,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              setState(() {
                _webController = controller;
                _webController.loadUrl(new UriData.fromString(_loadHTML(), mimeType: 'text/html').toString());
              });
            },
          ),
        ),  
      ),
    );
  }
}