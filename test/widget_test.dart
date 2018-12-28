// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qious/data_provider.dart';

import 'package:qious/main.dart';

void main() {
 final regSatz = new RegExp(r"^\s*\((\d+[a-z]*)\)\s+(.*)$");
 print(regSatz.hasMatch("(2) Zur Veräußerung und Belastung"));

}
