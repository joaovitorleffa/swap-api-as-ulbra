import 'package:as_api/pages/films_page.dart';
import 'package:as_api/pages/people_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Peoples', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => PeoplePage()));
            },
          ),
          GestureDetector(
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Films', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),               
              ), 
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => FilmsPage()));
            },
          )
        ],
      ),
    );
  }
}
