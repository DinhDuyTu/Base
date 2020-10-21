import 'package:flutter/material.dart';
import 'show_item.dart';
import 'dart:convert';
import 'edit_item.dart';

ListViewItem payloadFromJson(String str) =>
    ListViewItem.fromJson(json.decode(str));
String payloadToJson(ListViewItem data) => json.encode(data.toJson());

class ListViewItem {
  int id;
  String itemName;

  ListViewItem({
    this.id,
    this.itemName,
  });

  factory ListViewItem.fromJson(Map<String, dynamic> json) => ListViewItem(
        id: json["id"] == null ? null : json["id"],
        itemName: json["itemName"] == null ? null : json["itemName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "itemName": itemName == null ? null : itemName,
      };
}

class ListViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewScreenState();
  }
}

class ListViewScreenState extends State<ListViewScreen> {
  List<ListViewItem> itemList = [];
  String _listSaved;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List View',
        home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('List View'),
                ),
                body: Container(
                    child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                            title: Text(itemList[index].itemName),
                            trailing: _selectPopup(index),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowItemList(
                                      itemList: itemList[index].itemName),
                                ),
                              );
                            }));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _showDialogEnterText();
                    });
                  },
                ))));
  }

  Widget _selectPopup(index) => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("Edit"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Delete"),
          ),
        ],
        onCanceled: () {
          print("You have canceled the menu.");
        },
        onSelected: (value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditItem(itemList: itemList[index].itemName),
              ),
            );
          } else if (value == 2) {
            setState(() {
              itemList.remove(itemList[index]);
            });
          }
        },
        icon: Icon(Icons.list),
      );

  void _showDialogEnterText() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Create List"),
              content: TextField(
                autofocus: true,
                onChanged: (value) {
                  _listSaved = value;
                },
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("Add"),
                  onPressed: () {
                    setState(() {
                      itemList.add(ListViewItem(id: 1, itemName: _listSaved));
                    });
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}
