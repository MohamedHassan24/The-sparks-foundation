import 'package:basic_bank_app/Layout/bank_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(homelayout());
}

class homelayout extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BankLayout(),
    );
  }
}
