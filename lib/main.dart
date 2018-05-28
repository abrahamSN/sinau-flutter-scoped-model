import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new ScopedModel<AppModel>(
        model: AppModel(),
        child: new Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Penghitung'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Counter:'),
          new ScopedModelDescendant<AppModel>(
            builder: (context, child, model) => new Text(
                  model.count.toString(),
                ),
          ),
        ],
      ),
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => new ButtonBar(
          children: <Widget>[
            new IconButton(icon: new Icon(Icons.add), onPressed: model.increment),
            new IconButton(icon: new Icon(Icons.minimize), onPressed: model.decrement)
          ],
        ),
      ),
    );
  }
}
