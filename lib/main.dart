import 'package:flutter/material.dart';
import 'components.dart';
import './ui/test.dart';

void main() {
  runApp(new MaterialApp(
    title: appTitle,
    home: new Test(), //Class Name Of The Other Dart File
  ));
}