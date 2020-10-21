import 'dart:math';
import 'package:flutter/material.dart';

class DataTableScreen extends StatefulWidget {
  @override
  _DataTableScreenState createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  List<Avengers> avengers;
  List<Avengers> selectedAvengers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedAvengers = [];
    avengers = Avengers.getAvengers();
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        avengers.sort((a, b) => a.name.compareTo(b.name));
      } else {
        avengers.sort((a, b) => b.name.compareTo(a.name));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avengers DataTable"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: DataTable(
              sortAscending: sort,
              sortColumnIndex: 0,
              columns: [
                DataColumn(
                    label: Text("#", style: TextStyle(fontSize: 16)),
                    numeric: false,
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                      });
                      onSortColumn(columnIndex, ascending);
                    }),
                DataColumn(
                    label: Text("Name", style: TextStyle(fontSize: 16)),
                    numeric: false,
                    onSort: (columnIndex, ascending) {
                      setState(() {
                        sort = !sort;
                      });
                      onSortColumn(columnIndex, ascending);
                    }),
                DataColumn(
                  label: Text("Weapons", style: TextStyle(fontSize: 16)),
                  numeric: false,
                ),
              ],
              rows: avengers
                  .map(
                    (avenger) => DataRow(
                        selected: selectedAvengers.contains(avenger),
                        cells: [
                          DataCell(
                            Text('${avenger.index}'),
                            onTap: () {
                              print('Selected ${avenger.name}');
                            },
                          ),
                          DataCell(
                            Text(avenger.name),
                            onTap: () {
                              print('Selected ${avenger.name}');
                            },
                          ),
                          DataCell(
                            Text(avenger.weapon),
                          ),
                        ]),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Avengers {
  int index;
  String name;
  String weapon;

  Avengers({this.name, this.weapon, this.index});

  static List<Avengers> getAvengers() {
    return <Avengers>[
      Avengers(index: 1, name: "Captain America 1", weapon: "Shield 1"),
      Avengers(index: 2, name: "Captain America 2", weapon: "Shield 2"),
      Avengers(index: 3, name: "Captain America 3", weapon: "Shield 3"),
      Avengers(index: 4, name: "Captain America 4", weapon: "Shield 4"),
      Avengers(index: 5, name: "Captain America 5", weapon: "Shield 5"),
      Avengers(index: 6, name: "Captain America 6", weapon: "Shield 6"),
      Avengers(index: 7, name: "Captain America 7", weapon: "Shield 7"),
    ];
  }
}
