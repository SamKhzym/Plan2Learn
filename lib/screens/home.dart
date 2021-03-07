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
  List<Course> courseList = [
    new Course("ENGINEER 1P13", [
      await getAssignments("safd")
      // new Assignment(0,"eng1p13","final report","a day","stuff",50,true,
      //   // id: 0,
      //   // course: "eng1p13",
      //   // name: "final report",
      //   // deadline: "a day",
      //   // workblocks: "stuff",
      //   // etc: 50,
      //   // priority: true,
      // ),
      // new Assignment(0,"eng1p13","final report","a day","stuff",50,true,
      //   // id: 1,
      //   // course: "eng1p13",
      //   // name: "individual research",
      //   // deadline: "some day",
      //   // workblocks: "things",
      //   // etc: 60,
      //   // priority: false,
      // ),

    ], [
      new Test(0,"eng1p13","final report","a day","stuff",50,true,
        // id: 0,
        // course: "eng1p13",
        // name: "midterm1",
        // deadline: "day",
        // workblocks: "yuhh",
        // etc: 120,
        // priority: true,
      ),
      new Test(0,"eng1p13","final report","a day","stuff",50,true,
        // id: 0,
        // course: "eng1p13",
        // name: "exam",
        // deadline: "ight",
        // workblocks: "ok",
        // etc: 20,
        // priority: true,
      ),
    ]),
    new Course("PHYS 1E03", [
      new Assignment(0,"eng1p13","final report","a day","stuff",50,true,
        // id: 0,
        // course: "phys1e03",
        // name: "capa",
        // deadline: "tmrw",
        // workblocks: "ughh",
        // etc: 90,
        // priority: false,
      ),
      new Assignment(0,"eng1p13","final report","a day","stuff",50,true,
        // id: 0,
        // course: "phys1e03",
        // name: "lab 4",
        // deadline: "sfjn",
        // workblocks: "stasuff",
        // etc: 400,
        // priority: true,
      )
    ], [
      new Test(0,"eng1p13","final report","a day","stuff",50,true,
        // id: 0,
        // course: "phys1e03",
        // name: "midterm 2",
        // deadline: "one day",
        // workblocks: "asfnvfn",
        // etc: 200,
        // priority: true,
      )
    ])
  ];

  bool isCollapsed = true;

  void updateCollapsible() {
    print(isCollapsed);
    setState(() {
      isCollapsed = !isCollapsed;
    });
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
            new Text(courseList[i].assignments[j].name),
            new Text(courseList[i].assignments[j].deadline),
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
        Visibility(
          visible: isCollapsed,
          child: Container(
            padding: const EdgeInsets.only(left: 40),
            child:assignmentsWidget,
          )
        )
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
        children: createCourseWidgets(courseList),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCourseForm())
          );
        },
        tooltip: 'Add a course',
        child: Icon(Icons.add),
      ),
    );
  }
}
