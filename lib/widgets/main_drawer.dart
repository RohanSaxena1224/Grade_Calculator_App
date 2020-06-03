import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradecalculator/screens/home_page.dart';
import 'package:gradecalculator/screens/predictions_screens.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.grey[400],
            child: Text(
              "Smarten up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.red
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Final Exam Calculator", Icons.scatter_plot,(){Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => PredictionsScreen()
          ));} ),
        ],
      ),
    );
  }
}
