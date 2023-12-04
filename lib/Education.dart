import 'package:flutter/material.dart';

void main() {
  runApp(EducationApp());
}

class Education {
  String major;
  int price;
  int year = 1;

  Education(this.major, this.price);

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

List<Education> majors = [
  Education('Early Childhood Education', 3000),
  Education('Teacher Education (Biology-Chemistry)', 3050),
  Education('Teaching English as a second Language', 3100),
  Education('Teaching Education (Mathematics-Physics)', 3150),
  Education('Translation', 3200),
];

class EducationApp extends StatefulWidget {
  @override
  _EducationAppState createState() => _EducationAppState();
}

class _EducationAppState extends State<EducationApp> {
  String selectedMajor = majors[0].major;
  int selectedYear = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Education'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select a Major:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Create the dropdown menu
              DropdownButton<String>(
                value: selectedMajor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMajor = newValue!;
                  });
                  print('Selected Major: $newValue');
                },
                items: majors.map<DropdownMenuItem<String>>((Education major) {
                  return DropdownMenuItem<String>(
                    value: major.major,
                    child: Text(major.major),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Create the radio buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Select number of years:', style: TextStyle(fontSize: 18)),
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
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
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
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
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
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
                          });
                        },
                      ),
                      Text('3 Years'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Display the total price based on the selected major and years
              Text(
                'Total Price: \$${majors.firstWhere((element) => element.major == selectedMajor).getTotalPrice()}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              // Create a button to return to the Home Page
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Home Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
