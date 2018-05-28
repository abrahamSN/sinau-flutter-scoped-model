import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:sinau_scoped_model/model/item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ItemModel>(
      builder: (context, child, model) => ListView(
            children: model.items
                .map(
                  (item) => new ListTile(
                        title: new Text(item.name),
                        onLongPress: () => model.deleteItem(item),
                      ),
                )
                .toList(),
          ),
    );
  }
}
