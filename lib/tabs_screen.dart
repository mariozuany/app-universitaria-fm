import 'package:flutter/material.dart';
import './home.dart';
import './info.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Universitária FM 104.7'),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Player'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Info(),
          ],
        ),
      ),
      length: 2,
    );
  }
}
