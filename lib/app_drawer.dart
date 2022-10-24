import 'package:flutter/material.dart';
import 'package:travellingapp/screens/filters_screen.dart';
import 'package:travellingapp/screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function()? onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            'الرحلات',
            Icons.card_travel,
            () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TabsScreen(),
              ));
            },
          ),
          buildListTile(
            'الفلترة',
            Icons.filter_list,
            () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FiltersScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
