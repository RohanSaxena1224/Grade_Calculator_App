import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradecalculator/widgets/main_drawer.dart';

class PredictionsScreen extends StatefulWidget {
  static const routeName = '/predictions-screen';

  @override
  _PredictionsScreenState createState() => _PredictionsScreenState();
}

class _PredictionsScreenState extends State<PredictionsScreen> {
  final _currentGradeController = TextEditingController();
  final _courseWeightController = TextEditingController();
  final _userPrefController = TextEditingController();
  var calculatedExamMark = 0.0;

  void _calculateFinal() {
    if (_currentGradeController.text.isEmpty ||
        _courseWeightController.text.isEmpty ||
        _userPrefController.text.isEmpty) {
      return;
    }

    final currentGrade = double.parse(_currentGradeController.text);
    final courseWeight = double.parse(_courseWeightController.text);
    final userPref = double.parse(_userPrefController.text);

    setState(() {
      calculatedExamMark = ((userPref - currentGrade * (courseWeight / 100)) /
              (100 - courseWeight)) *
          100;
      print(calculatedExamMark);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Finals Grade Calculator"
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  'Enter your current grade:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.only(
                          topRight: const Radius.circular(15),
                          topLeft: const Radius.circular(15))),
                  child: TextField(
                    controller: _currentGradeController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'How much is your course worth (%):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.only(
                          topRight: const Radius.circular(15),
                          topLeft: const Radius.circular(15))),
                  child: TextField(
                    controller: _courseWeightController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'What do you aim to finish with (%):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 280,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.only(
                          topRight: const Radius.circular(15),
                          topLeft: const Radius.circular(15))),
                  child: TextField(
                    controller: _userPrefController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  child: Text('Calculate Final Grade'),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: _calculateFinal,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 8,
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        'You need a ${calculatedExamMark.toStringAsFixed(0)}% to get your desired mark',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
