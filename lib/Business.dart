import 'package:flutter/material.dart';

void main() {
  runApp(MyApps());
}

class Business {
  String major;
  int price;
  int year = 1;

  Business(this.major, this.price);

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

List<Business> majors = [
  Business('Accounting Information Systems', 2500),
  Business('Economics', 2550),
  Business('Banking And Finance', 2600),
  Business('Hospitality Management', 2650),
  Business('Business Management', 2700),
  Business('Management Information Systems', 2750),
  Business('Marketing', 2800),
  Business('International Business Management', 2850)
];

class MyApps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApps> {
  String selectedMajor = majors[0].major;
  int selectedYear = majors[0].year;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Business'),
          centerTitle: true,
          backgroundColor: Colors.teal, // Set app bar background color
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Select a Business Major:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
                items: majors.map<DropdownMenuItem<String>>((Business major) {
                  return DropdownMenuItem<String>(
                    value: major.major,
                    child: Text(major.major, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
                style: TextStyle(color: Colors.black), // Set dropdown text color
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select number of years:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
                      Text('1 Year', style: TextStyle(color: Colors.black)),
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
                      Text('2 Years', style: TextStyle(color: Colors.black)),
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
                      Text('3 Years', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Total Price: \$${majors.firstWhere((element) => element.major == selectedMajor).getTotalPrice()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
