import 'package:flutter/material.dart';
import 'Engineering.dart';
import 'Business.dart';
import 'Pharmacy.dart';
import 'Art&Sciences.dart';
import 'Education.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('LIU Guide'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Image(
            image: AssetImage('assets/liu.jpg'),
            height: 300,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(context, MyApp());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // Button color
              textStyle: TextStyle(color: Colors.white), // Text color
            ),
            child: const Text('School Of Engineering'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(context, MyApps());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // Button color
              textStyle: TextStyle(color: Colors.white), // Text color
            ),
            child: const Text('School Of Business'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(context, App());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // Button color
              textStyle: TextStyle(color: Colors.white), // Text color
            ),
            child: const Text('School Of Pharmacy'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(context, Apps());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // Button color
              textStyle: TextStyle(color: Colors.white), // Text color
            ),
            child: const Text('School Of Art And Sciences'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _navigateToPage(context, EducationApp());
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal, // Button color
              textStyle: TextStyle(color: Colors.white), // Text color
            ),
            child: const Text('School Of Education'),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
