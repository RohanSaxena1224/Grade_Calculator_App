import 'package:flutter/material.dart';
import 'package:gradecalculator/models/course.dart';

class CourseList extends StatelessWidget {

  final List<Course> courses;
  final Function deletec;
  final Function setHighestAverage;
  final Function calculateGPA;

  CourseList(this.courses, this.deletec, this.setHighestAverage, this.calculateGPA);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: courses.length,
        itemBuilder: (ctx, index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                        '${courses[index].courseAverage}'
                    ),
                  ),
                ),
              ),
              title: Text(
                courses[index].courseName,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                  'Course Weight: ${courses[index].courseWeight}'
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onPressed: () {
                  deletec(courses[index].courseName);
                  setHighestAverage(courses);
                  calculateGPA(courses);
                },
              ),
            ),
          );
        }
    );
  }
}
