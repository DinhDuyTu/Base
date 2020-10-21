import 'package:flutter/material.dart';
import 'list_view_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool isShow = true;
  String _email = "tudd@fabbi.io";
  String _password = "123456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF303c54),
        body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                              image: new DecorationImage(
                            image: new AssetImage("images/logoFabbi2.png"),
                            fit: BoxFit.cover,
                          )))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                  controller:
                                      TextEditingController(text: _email),
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.email),
                                    border: InputBorder.none,
                                    labelText: 'Email',
                                  ),
                                  onChanged: (value) {
                                    _email = value;
                                  })))),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                          alignment: const Alignment(0, 0),
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: _password),
                                      obscureText: isShow,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.vpn_key),
                                        border: InputBorder.none,
                                        labelText: 'Your password',
                                      ),
                                      onChanged: (value) {
                                        _password = value;
                                      },
                                    ))),
                            Positioned(
                                right: 15,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isShow = !isShow;
                                    });
                                  },
                                  icon: isShow
                                      ? Icon(Icons.remove_red_eye)
                                      : Icon(Icons.visibility_off),
                                ))
                          ])),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () => _checkLogin(_email, _password),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                // side: BorderSide(color: Colors.grey),
                              ))))
                ]))));
  }

  void _checkLogin(String email, String password) {
    if (email == 'tudd@fabbi.io' && password == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListViewScreen(),
        ),
      );
    } else {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Notification"),
              content: new Text("Login Fail"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}
