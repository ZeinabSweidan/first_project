import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Engineerings {
  String major;
  int price;
  int year = 1;

  Engineerings(this.major, this.price);

  String getTotalPrice() {
    if (this.year == 1) {
      return (price).toStringAsFixed(0);
    }
    if (this.year == 2) {
      return (price * 2).toStringAsFixed(0);
    }
    return (price * 3).toStringAsFixed(0);
  }
}

List<Engineerings> majors = [
  Engineerings('Computer Engineering', 3000),
  Engineerings('Electrical Engineering', 3050),
  Engineerings('Electronics Engineering', 3100),
  Engineerings('Mechanical Engineering', 3150),
  Engineerings('Surveying Engineering', 3200),
  Engineerings('Communication Engineering', 3250),
  Engineerings('Industrial Engineering', 3300),
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedMajor = majors[0].major;
  int selectedYear = majors[0].year;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Engineering'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Select an Engineering Major:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedMajor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMajor = newValue!;
                  });
                  print('Selected Major: $newValue');
                },
                items: majors.map<DropdownMenuItem<String>>((Engineerings major) {
                  return DropdownMenuItem<String>(
                    value: major.major,
                    child: Text(major.major),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select number of years:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: selectedYear,
                        onChanged: (int? value) {
                          print('Selected Years: $value');
                          setState(() {
                            selectedYear = value!;
                            majors
                                .firstWhere((element) => element.major == selectedMajor)
                                .year = value!;
                          });
                        },
                      ),
                      Text('1 Year'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        value: 2,
                        groupValue: selectedYear,
                        onChanged: (int? value) {
                          print('Selected Years: $value');
                          setState(() {
                            selectedYear = value!;
                            majors
                                .firstWhere((element) => element.major == selectedMajor)
                                .year = value!;
                          });
                        },
                      ),
                      Text('2 Years'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                        value: 3,
                        groupValue: selectedYear,
                        onChanged: (int? value) {
                          print('Selected Years: $value');
                          setState(() {
                            selectedYear = value!;
                            majors
                                .firstWhere((element) => element.major == selectedMajor)
                                .year = value!;
                          });
                        },
                      ),
                      Text('3 Years'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Total Price: \$${majors.firstWhere((element) => element.major == selectedMajor).getTotalPrice()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, // Button color
                  textStyle: TextStyle(color: Colors.white), // Text color
                  elevation: 5, // Elevation
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Button shape with rounded corners
                ),
                child: Text('Back to Home Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
