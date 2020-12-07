import 'package:as_api/controllers/films_controller.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatefulWidget {
  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  final controller = FilmsController();

  _success() {
    return ListView.builder(
      itemCount: controller.films.length,
      itemBuilder: (context, index) {
        var films = controller.films[index];
        return Card (
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title: ${films.title}',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Director: ${films.director}',
                  style: TextStyle(fontSize: 18.0, color: Colors.black54),
                ),
                Text(
                  'Release date: ${films.releaseDate}',
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
      child: RaisedButton(onPressed: () { controller.start(); }, child: Text('Tentar novamente'),),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(FilmsState state) {
    switch (state) {
      case FilmsState.start :
        return _start();
      case FilmsState.loading :
        return _loading();
      case FilmsState.error :
        return _error();
      case FilmsState.success :
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
        title: Text('Films'),
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