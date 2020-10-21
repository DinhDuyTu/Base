import 'package:flutter/material.dart';

import 'dart:convert';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
  int resId;
  String productImage;
  List<CartDetail> cartDetails;

  Payload({
    this.resId,
    this.productImage,
    this.cartDetails,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    resId: json["resId"] == null ? null : json["resId"],
    productImage: json["productImage"] == null ? null : json["productImage"],
    cartDetails: json["CartDetails"] == null ? null : List<CartDetail>.from(json["CartDetails"].map((x) => CartDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resId": resId == null ? null : resId,
    "productImage": productImage == null ? null : productImage,
    "CartDetails": cartDetails == null ? null : List<dynamic>.from(cartDetails.map((x) => x.toJson())),
  };
}

class CartDetail {
  int productId;
  int quantity;

  CartDetail({
    this.productId,
    this.quantity,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
    productId: json["productId"] == null ? null : json["productId"],
    quantity: json["quantity"] == null ? null : json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId == null ? null : productId,
    "quantity": quantity == null ? null : quantity,
  };
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String jsonString = '''
 {
    "resId":123,
   "productImage":"http",
   "CartDetails" : 
   [
       {"productId":1,
        "quantity":2},
       {"productId":3,
        "quantity":4}
  ]
}
  ''';
  List<CartDetail> listCart = [];

  void _incrementCounter() {
    listCart.add(CartDetail(productId: 1, quantity: 2));
    listCart.add(CartDetail(productId: 3, quantity: 4));
    Payload payload =
    Payload(resId: 1, productImage: "", cartDetails: listCart);
    print('${payload.cartDetails[0].quantity.toString()}');

    String payloadStr = payloadToJson(payload);
    print('${payloadStr}');

    final payload1 = payloadFromJson(jsonString);
    print('${payload1.cartDetails[0].productId.toString()}');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$listCart',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
