import 'package:flutter/material.dart';
import 'screens/store_list_screen.dart';
import 'widgets/app_bar_row.dart';
import 'widgets/name_input.dart';
import 'widgets/date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GK Sommerobst',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarRow(),
      ),
      body: Column(
        children: <Widget>[
          Date(),
          Spacer(flex: 1),
          NameInput(),
          Spacer(flex: 3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreListScreen(),
            ),
          );
        },
      ),
    );
  }
}
