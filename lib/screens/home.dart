import 'package:flutter/material.dart';
import 'package:plan2learn/objects/course.dart';

class HomeScreen extends StatelessWidget {

  List<Course> courseList = [
    new Course("ENGINEER 1P13", [], []),
    new Course("PHYS 1E03", [], [])
  ];

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Course Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: createCourseWidgets(courseList)
      ),
    );
  }

  List<Widget> createCourseWidgets(List<Course> courseList) {

    List<Widget> courses = List<Widget>();

    for (int i = 0; i < courseList.length; i++) {

      int num_assignments = courseList[i].assignments.length;
      int num_tests = courseList[i].tests.length;

      Widget course = Container(
          padding: const EdgeInsets.all((32)),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                              courseList[i].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          )
                      ),
                      Text(
                          num_assignments.toString() + " assignments, " + num_tests.toString() + " test",
                          style: TextStyle(
                              color: Colors.grey[500]
                          )
                      )
                    ],
                  )
              )
            ],
          )
      );

      courses.add(course);

    }

    return courses;

  }

}

