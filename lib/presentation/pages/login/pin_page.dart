import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/string.dart';
import '../homepage/home_page.dart';

class PinPage extends StatefulWidget {
  static const routeName = '/pin_page';

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/diyo_logo.png',
                height: 60,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            StringConstants.enterPIN,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: _pin.length > 0 ? Colors.black : Colors.grey,
                  radius: 10,
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: _pin.length > 1 ? Colors.black : Colors.grey,
                  radius: 10,
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: _pin.length > 2 ? Colors.black : Colors.grey,
                  radius: 10,
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: _pin.length > 3 ? Colors.black : Colors.grey,
                  radius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildNumberButton('1'),
                  _buildNumberButton('2'),
                  _buildNumberButton('3'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildNumberButton('4'),
                  _buildNumberButton('5'),
                  _buildNumberButton('6'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildNumberButton('7'),
                  _buildNumberButton('8'),
                  _buildNumberButton('9'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(width: 70),
                  _buildNumberButton('0'),
                  const SizedBox(width: 70),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _pin += number;
            if (_pin.length == 4) {
              _checkPin(_pin);
            }
          });
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            enableFeedback: false),
        child: Text(
          number,
          style: const TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
    );
  }

  void _checkPin(String pin) {
    if (pin == '1234') {
      Fluttertoast.showToast(
          msg: StringConstants.success,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pushNamed(
        context,
        HomePage.routeName,
      );
    } else {
      Fluttertoast.showToast(
          msg: StringConstants.failed,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
      _pin = '';
    }
  }
}
