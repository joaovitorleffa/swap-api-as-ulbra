import 'package:as_api/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final controller = HomeController();

  _success() {
    return ListView.builder(
      itemCount: controller.swap.length,
      itemBuilder: (context, index) {
        var swap = controller.swap[index];
        return Card (
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name: ${swap.name}',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Height ${swap.height}',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
                Text(
                  'Hair color: ${swap.hairColor}',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  _error() {
    return Center(
      child: RaisedButton(onPressed: () { controller.start(); }, child: Text('Try again'),),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start :
        return _start();
      case HomeState.loading :
        return _loading();
      case HomeState.error :
        return _error();
      case HomeState.success :
        return _success();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peoples'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      )
    );
  }
}