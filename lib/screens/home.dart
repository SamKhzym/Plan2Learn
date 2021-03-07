import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:plan2learn/main.dart';
import 'package:plan2learn/services.dart';
import 'package:plan2learn/objects/assignment.dart';
import 'package:plan2learn/objects/course.dart';
import 'package:collapsible/collapsible.dart';
import 'package:plan2learn/objects/test.dart';

import 'addcourse.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isCollapsed = true;

  void updateCollapsible() {
    print(isCollapsed);
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  void updateState() {
    setState(() {});
  }

  List<Widget> createCourseWidgets(List<Course> courseList) {
    List<Widget> courses = List<Widget>();

    for (int i = 0; i < courseList.length; i++) {
      int numAssignments = courseList[i].assignments.length;
      int numTests = courseList[i].tests.length;

      List<Widget> assignments = [];

      for (int j = 0; j < numAssignments; j++) {
        Widget assignment = Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Text(courseList[i].assignments[j].name + "--  "),
            new Text(courseList[i].assignments[j].deadline),
          ]),
        );
        assignments.add(assignment);
      }

      List<Widget> tests = [];

      for (int j = 0; j < numTests; j++) {
        Widget test = Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            new Text(courseList[i].tests[j].name + "--  "),
            new Text(courseList[i].tests[j].deadline),
          ]),
        );
        tests.add(test);
      }

      Widget assignmentsWidget = Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  Text("Assignments",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ))
                ] +
                assignments,
          ),
        ],
      );

      Widget testsWidget = Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  Text("Tests",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ))
                ] +
                tests,
          ),
        ],
      );

      Widget course = Row(children: [
        Column(children: [
          InkWell(
            child: Container(
                padding: const EdgeInsets.all((32)),
                child: Column(children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(courseList[i].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Text(
                              numAssignments.toString() +
                                  " assignments, " +
                                  numTests.toString() +
                                  " tests",
                              style: TextStyle(color: Colors.grey[500]))
                        ],
                      ),
                    ],
                  ),
                ])),
            onTap: updateCollapsible,
          ),
          Visibility(
              visible: isCollapsed,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(left: 40, bottom: 20),
                  child: assignmentsWidget,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: testsWidget,
                ),
              ]))
        ]),
        TextButton(
            onPressed: () async {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddWork()));
              updateState();
            },
            child: Text("+"),
            style: TextButton.styleFrom(
                primary: Colors.black, backgroundColor: Colors.black38))
      ]);

      courses.add(course);
    }

    return courses;
  }

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Course Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: createCourseWidgets(States.courseList),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCourse()));
          updateState();
        },
        tooltip: 'Add a course',
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddCourse extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a course"),
        ),
        body: Center(
          child: Column(children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Course"),
            ),
            ElevatedButton(
              onPressed: () {
                States.course = _controller.value.text;
                print(States.course);
                States.courseList.add(new Course.fromTitle(States.course));
                print(States.courseList[2]);
                Navigator.pop(context);
              },
              child: Text('Submit!'),
            ),
          ]),
        ));
  }
}

class AddWork extends StatefulWidget {
  AddWork({Key key}) : super(key: key);

  State createState() => AddWorkState();
}

class AddWorkState extends State<AddWork> {
  var courses = States.getCourseList();
  var course = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  bool isAssignment = true;

  void printStuff(int i) {
    setState(() {
      course = i;
      print(course);
    });
  }

  List<Widget> makeCourseRadioButtons() {
    List<Widget> buttons = [];

    for (int i = 0; i < States.getCourseList().length; i++) {
      var button = ListTile(
          title: Text(States.getCourseList()[i]),
          leading: Radio(
            //groupValue: course,
            value: i,
            onChanged: printStuff,
          ));

      buttons.add(button);
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a test/assignment"),
        ),
        body: Center(
            child: Column(children: [
          Column(children: makeCourseRadioButtons()),
          Row(children: [
            Text("isAssignment?"),
            Switch(
              value: isAssignment,
              onChanged: (value) {
                setState(() {
                  isAssignment = value;
                  print(isAssignment);
                });
              },
            ),
          ]),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Assignment"),
          ),
          TextField(
            controller: deadlineController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Deadline (YYYY/MM/DD)"),
          ),
          ElevatedButton(
            onPressed: () {
              if (isAssignment) {
                var assmt = new Assignment(100, States.getCourseList()[course],
                    nameController.text, deadlineController.text, "", 0, false);
                States.courseList[course].addAssignment(assmt);
              } else {
                var test = new Test(100, States.getCourseList()[course],
                    nameController.text, deadlineController.text, "", 0, false);
                States.courseList[course].addTest(test);
              }

              Navigator.pop(context);
            },
            child: Text('Submit!'),
          )
        ])));
  }
}

class States {
  static List<String> getCourseList() {
    List<String> _courses = [];

    for (int i = 0; i < States.courseList.length; i++) {
      _courses.add(States.courseList[i].title);
    }

    return _courses;
  }

  static String course = "";
  static List<Course> courseList = [];
}
