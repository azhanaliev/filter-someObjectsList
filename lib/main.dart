import 'package:filter_objects/some_obj_filtered_list/some_obj_filtered_list.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter objects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SomeObjFilteredList(
        title: 'Test Task "Filtered List"',
      ),
    );
  }
}
