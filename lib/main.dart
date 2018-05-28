import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:sinau_scoped_model/model/item.dart';
import 'package:sinau_scoped_model/view/home_v.dart';
import 'package:sinau_scoped_model/view/list_v.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new DefaultTabController(
        length: 2,
        child: new ScopedModel<ItemModel>(
          model: ItemModel(),
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text('Scoped Model 2 tabs.'),
              bottom: new TabBar(
                tabs: <Widget>[
                  new Tab(
                    icon: new Icon(Icons.home),
                    text: 'Home Page',
                  ),
                  new Tab(
                    icon: new Icon(Icons.screen_lock_landscape),
                    text: 'Display',
                  )
                ],
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                new Home(),
                new List(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
