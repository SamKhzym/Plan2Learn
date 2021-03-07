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
  String dayOfWeek = "Sun";

  @override
  Widget build(BuildContext context) {
    _initNumberPickers();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Set Rest Period"),
        ),
        body:
        Column( //highest level column
        children: [

        Container(
            padding: const EdgeInsets.all(15),
            decoration: new BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text("Day of Week:", style: TextStyle(fontSize: 20, color: Colors.black),),

          DropdownButton<String>(
            items: <String>['Sun', 'Mon', 'Tue', 'Wed', "Thurs", "Fri", "Sat"].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            hint: Text("Day of the Week:"),
            value: dayOfWeek,
            onChanged: (newValue) {
              setState(() {
                dayOfWeek = newValue;
                print(dayOfWeek);
              });
            },
          ),])),

          Container(
            padding: const EdgeInsets.all(15),
          child :Row(children: <Widget>[
            Column(children: [
              Text("Start Hour", style: TextStyle(fontSize: 20, color: Colors.black),),
              startTimeHourPicker
            ],),
            Text(":", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
            Column(children: [
              Text("Start Minute", style: TextStyle(fontSize: 20, color: Colors.black),),
              startTimeMinutePicker
            ],),],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
          ),
          ),

          Container(
              padding: const EdgeInsets.all(15),
          child: Row(children: <Widget>[
            Column(children: [
              Text("End Hour", style: TextStyle(fontSize: 20, color: Colors.black),),
              endTimeHourPicker
            ],),
            Text(":", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
            Column(children: [
              Text("End Minute", style: TextStyle(fontSize: 20, color: Colors.black),),
              endTimeMinutePicker
            ],),],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
          )),

          Container(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: collectData,
                  child: Text('Add Rest Period'),
                ),
              ))
          
        ]),
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