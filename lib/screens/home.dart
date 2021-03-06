import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plan2learn/main.dart';
import 'package:plan2learn/objects/assignment.dart';
import 'package:plan2learn/objects/course.dart';
import 'package:collapsible/collapsible.dart';
import 'package:plan2learn/objects/test.dart';

class HomeScreen extends StatefulWidget {

  static List<bool> isCollapsed = [];

  //Test course list that will be implemented for the user
  static List<Course> courseList = [
    new Course("ENGINEER 1P13", [
      new Assignment("Design Report", DateTime.utc(2021, 3, 7)),
      new Assignment("Individual Research Report", DateTime.utc(2021, 3, 10)),
    ], [
      new Test("Computing Practicum", DateTime.utc(2021, 3, 20)),
      new Test("Graphics Practicum", DateTime.utc(2021, 3, 25)),
    ]),
    new Course("PHYS 1E03", [
      new Assignment("LONCAPA 6", DateTime.utc(2021, 3, 6)),
      new Assignment("Lab 4", DateTime.utc(2021, 3, 17))
    ], [
      new Test("Midterm 2", DateTime.utc(2021, 3, 17))
    ])
  ];

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Course Page"),
      ),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: createCourseWidgets(courseList)),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Add a course',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();

  //Takes in a list of courses, creates a new homepage widget for each one
  static List<Widget> createCourseWidgets(List<Course> courseList) {

    List<Widget> courses = List<Widget>();
    isCollapsed = [];

    for (int i = 0; i < courseList.length; i++) {
      int numAssignments = courseList[i].assignments.length;
      int numTests = courseList[i].tests.length;

      List<Widget> assignments = [];

      for (int j = 0; j < numAssignments; j++) {

        Widget assignment = Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    new Text(courseList[i].assignments[j].title),
                    new Text(DateFormat("MM/dd/yyyy")
                        .format(courseList[i].assignments[j].deadline)),
                ]),
            );

        assignments.add(assignment);

      }

      Widget assignmentsWidget = Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: assignments,
          ),
        ],
      );

      isCollapsed.add(true);

      Widget course = Column(children: [
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
        Collapsible(
        child: Container(
            padding: const EdgeInsets.only(left: 40),
            child: assignmentsWidget
        ),
        collapsed: isCollapsed[i],
        )
      ]);

      courses.add(course);
    }

    return courses;
  }
}

class _MyHomePageState extends State<HomeScreen> {
  List<bool> isCollapsed = HomeScreen.isCollapsed;

  void updateCollapsible() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      isCollapsed = HomeScreen.isCollapsed;
    });
  }

  List<Widget> createCourseWidgets(List<Course> courseList) {

    List<Widget> courses = List<Widget>();
    isCollapsed = [];

    for (int i = 0; i < courseList.length; i++) {
      int numAssignments = courseList[i].assignments.length;
      int numTests = courseList[i].tests.length;

      List<Widget> assignments = [];

      for (int j = 0; j < numAssignments; j++) {

        Widget assignment = Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(courseList[i].assignments[j].title),
                new Text(DateFormat("MM/dd/yyyy")
                    .format(courseList[i].assignments[j].deadline)),
              ]),
        );

        assignments.add(assignment);

      }

      Widget assignmentsWidget = Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: assignments,
          ),
        ],
      );

      isCollapsed.add(true);

      Widget course = Column(children: [
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
        Collapsible(
          child: Container(
              padding: const EdgeInsets.only(left: 40),
              child: assignmentsWidget
          ),
          collapsed: isCollapsed[i],
        )
      ]);

      courses.add(course);
    }

    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Course Page"),
      ),
      body: ListView(
          padding: const EdgeInsets.all(8),
          children: HomeScreen.createCourseWidgets(HomeScreen.courseList)),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Add a course',
        child: Icon(Icons.add),
      ),
    );
  }
}
