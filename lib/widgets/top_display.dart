import 'package:flutter/material.dart';
import 'package:gradecalculator/models/course.dart';

class TopDisplay extends StatefulWidget {
  final List<Course> courses;
  final double maxAverage;
  final double overallGPA;

  TopDisplay(this.courses, this.maxAverage, this.overallGPA);

  @override
  _TopDisplayState createState() => _TopDisplayState();
}

class _TopDisplayState extends State<TopDisplay> {

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      color: Colors.grey[400],
      child:Row(
        children: <Widget> [
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              child: Text(
                "${widget.overallGPA.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              radius: 45,
              backgroundColor: Colors.red,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: mediaQuery.size.height * 0.07,
              ),
              Row(
                children:<Widget> [
                  const Text(
                    'Number of Courses: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '${widget.courses.length}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
              Row(
                  children: <Widget>[
                    const Text(
                      'Highest Average:  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    widget.courses.isEmpty ? Text(
                      '0.0',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    )
                        :
                    Text(
                      '${widget.maxAverage}%',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    )
                  ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}
