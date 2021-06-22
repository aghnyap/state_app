import 'package:flutter/material.dart';
import 'package:state_app/view/home_page.dart';

void main() => runApp(StateApp());

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(title: 'Flutter State'));
  }
}
