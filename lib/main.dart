import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/predictions_screens.dart';
import './models/course.dart';
import './screens/home_page.dart';

void main() {
  //To ensure that the app only is used in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(GradeCalculator());
}

class GradeCalculator extends StatefulWidget {
  @override
  _GradeCalculatorState createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  List<Course> coursesOnScreen = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grade Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blueAccent[200],
      ),
     //home: HomePage(),
      routes: {
        '/': (ctx) => HomePage(),
        PredictionsScreen.routeName: (ctx) => PredictionsScreen()
      },
    );
  }
}

