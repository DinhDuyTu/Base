import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  const EditItem({this.itemList});
  final String itemList;

  @override
  State<StatefulWidget> createState() {
    return EditItemState();
  }
}

class EditItemState extends State<EditItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Item ${widget.itemList}"),
      ),
      body: Center(
        child: Text('${widget.itemList}'),
      ),
    );
  }
}
