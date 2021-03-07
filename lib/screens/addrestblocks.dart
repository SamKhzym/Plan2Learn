import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRestBlocksForm extends StatefulWidget {

  AddRestBlocksForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => AddRestBlocksFormState();

}

class AddRestBlocksFormState extends State<AddRestBlocksForm> {

  NumberPicker startTimeHourPicker;
  NumberPicker startTimeMinutePicker;
  NumberPicker endTimeHourPicker;
  NumberPicker endTimeMinutePicker;
  int startTimeHourValue = 0;
  int startTimeMinuteValue = 0;
  int endTimeHourValue = 0;
  int endTimeMinuteValue = 0;

  @override
  Widget build(BuildContext context) {
    _initNumberPickers();
    return Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Text(
            "Set Rest Period"
          ),
          Row(children: <Widget>[
            Column(children: [
              Text("Start Hour", style: TextStyle(fontSize: 20, color: Colors.black),),
              startTimeHourPicker
            ],),
            Column(children: [
              Text("Start Minute", style: TextStyle(fontSize: 20, color: Colors.black),),
              startTimeMinutePicker
            ],),],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ),
          Row(children: <Widget>[
            Column(children: [
              Text("End Hour", style: TextStyle(fontSize: 20, color: Colors.black),),
              endTimeHourPicker
            ],),
            Column(children: [
              Text("End Minute", style: TextStyle(fontSize: 20, color: Colors.black),),
              endTimeMinutePicker
            ],),],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: collectData,
              child: Text('Add Rest Period'),
            ),
          )
          
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
        
    );
  }
  
  void collectData() {
    //add the rest block to the db
  }

  void _initNumberPickers() {
    startTimeHourPicker = new NumberPicker.integer(
      initialValue: 0,
      minValue: 0,
      maxValue: 23,
      step: 1,
      onChanged: (value) => setState(() => startTimeHourValue = value),
    );
    startTimeMinutePicker = new NumberPicker.integer(
      initialValue: 30,
      minValue: 1,
      maxValue: 59,
      step: 1,
      onChanged: (value) => setState(() => startTimeMinuteValue = value),
    );
    endTimeHourPicker = new NumberPicker.integer(
      initialValue: 0,
      minValue: 0,
      maxValue: 23,
      step: 1,
      onChanged: (value) => setState(() => endTimeHourValue = value),
    );
    endTimeMinutePicker = new NumberPicker.integer(
      initialValue: 30,
      minValue: 1,
      maxValue: 59,
      step: 1,
      onChanged: (value) => setState(() => endTimeMinuteValue = value),
    );
  }

}