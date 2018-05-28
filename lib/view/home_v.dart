import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:sinau_scoped_model/model/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txt_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: txt_controller,
            ),
          ),
          new ScopedModelDescendant<ItemModel>(
            builder: (context, child, model) => new RaisedButton(
                  child: new Text('Add Item'),
                  onPressed: () {
                    Item edt_item = new Item(txt_controller.text);
                    model.addItem(edt_item);
                    setState(() => txt_controller.text = '');
                  },
                ),
          ),
        ],
      ),
    );
  }
}
