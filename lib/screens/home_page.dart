import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/course.dart';
import '../widgets/newCourse.dart';
import '../widgets/course_list.dart';
import '../widgets/top_display.dart';
import '../widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  final List<Course> visibleCourses = [];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double maxAverage = 0.00;
  double overallGPA = 0.00;
  //List for courses as users add courses, this is where they will be stored


  //Calculates the total GPA shown in the top chart
  void calculateGPA(List<Course> courseList) {
    double totalWeight = 0;
    double intermediateGPA = 0;
    for (int i = 0; i < courseList.length; i++) {
      totalWeight += courseList[i].courseWeight;
      intermediateGPA +=
      (courseList[i].courseAverage * courseList[i].courseWeight);
      overallGPA = (intermediateGPA / totalWeight);
    }
  }

  //Finds the highest average that is displayed in the top chart
  void setHighestAverage(List<Course> courseList) {
    calculateGPA(courseList);
    maxAverage = 0;
    for (int i = 0; i < courseList.length; i++) {
      if (courseList[i].courseAverage >= maxAverage) {
        maxAverage = courseList[i].courseAverage;
      }
    }
  }

  //Opens up the modal sheet that the user can use to enter a new course
  void _startAddNewCourse(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewCourse(_addNewCourse),
        );
      },
    );
  }

  //Initializes the new course and adds it to the courses list above
  void _addNewCourse(String cTitle, double cAverage, double cWeight) {
    final newc = Course(
      courseName: cTitle,
      courseAverage: cAverage,
      courseWeight: cWeight,
    );

    setState(() {
      widget.visibleCourses.add(newc);
      setHighestAverage(widget.visibleCourses);
    });
  }

  void _deleteCourse(String courseName) {

    setState(() {
      widget.visibleCourses.removeWhere((c) {
        return c.courseName == courseName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Setting up a mediaquery variable so that sizes can be determined based on phone size
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Grade Calculator"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TopDisplay(widget.visibleCourses, maxAverage, overallGPA),
              Container(
                height: mediaQuery.size.height * 0.7,
                child: CourseList(
                    widget.visibleCourses, _deleteCourse, setHighestAverage, calculateGPA),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewCourse(context),
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}