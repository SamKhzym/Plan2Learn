import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCourseForm extends StatefulWidget {

  AddCourseForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => AddCourseFormState();

}

class AddCourseFormState extends State<AddCourseForm> {

  final courseField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(controller: courseField),
        ElevatedButton(
          onPressed: collectData,
          child: Text('Login'),
        )
      ],
    );
  }
  
  void collectData() {
    String courseName = courseField.text;
  }

}