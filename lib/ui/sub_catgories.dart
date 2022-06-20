
import 'package:building_material_user/ui/components/m3_appbar.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M3AppBar(title: Text("Sub Categories")),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, i) {
          return ExpansionTile(
            title: Text(vehicles[i].title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            children: <Widget>[
              Column(
                children: _buildExpandableContent(vehicles[i]),
              ),
            ],
          );
        },
      ),
    );
  }
}
_buildExpandableContent(Vehicle vehicle) {
  List<Widget> columnContent = [];

  for (String content in vehicle.contents) {
    columnContent.add(
      ListTile(
        title: Text(content, style: TextStyle(fontSize: 18.0),),
        leading: Icon(vehicle.icon),
      ),
    );
  }

  return columnContent;
}


class Vehicle {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Vehicle(this.title, this.contents, this.icon);
}

List<Vehicle> vehicles = [
  Vehicle(
    'Bike',
    ['Vehicle no. 1', 'Vehicle no. 2', 'Vehicle no. 7', 'Vehicle no. 10'],
    Icons.motorcycle,
  ),
  Vehicle(
    'Cars',
    ['Vehicle no. 3', 'Vehicle no. 4', 'Vehicle no. 6'],
    Icons.directions_car,
  ),
];

