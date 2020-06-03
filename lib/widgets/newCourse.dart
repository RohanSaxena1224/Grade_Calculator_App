import 'package:flutter/material.dart';

class NewCourse extends StatefulWidget {
  final Function handler;
  NewCourse(this.handler);

  @override

  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {



  final _titleController = TextEditingController();
  final _averageController = TextEditingController();
  final _weightController = TextEditingController();


  void _submitData(){

    final enteredTitle = _titleController.text;
    final enteredAverage = double.parse(_averageController.text);
    final enteredWeight  = double.parse(_weightController.text);

    if(enteredTitle.isEmpty ||  enteredWeight < 0 || enteredAverage < 0){
      return;
    }

    widget.handler(
        enteredTitle,
        enteredAverage,
        enteredWeight
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget> [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'Course Name'
                ),
              ),
              TextField(
                controller: _averageController,
                decoration: InputDecoration(
                  labelText: 'Course Average',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _weightController,
                decoration: InputDecoration(
                    labelText: 'Course Weight'
                ),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                elevation: 10,
                color: Colors.red,
                child: Text(
                  'Submit Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
    );
  }
}
