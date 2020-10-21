import 'package:flutter/material.dart';

class ShowItemList extends StatefulWidget {
  const ShowItemList({this.itemList});
  final String itemList;

  @override
  State<StatefulWidget> createState() {
    return ShowItemListState();
  }
}

class ShowItemListState extends State<ShowItemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item List View"),
      ),
      body: Center(
        child: Text('${widget.itemList}'),
      ),
    );
  }
}
