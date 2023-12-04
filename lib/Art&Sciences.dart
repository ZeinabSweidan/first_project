import 'package:flutter/material.dart';

void main() {
  runApp(Apps());
}

class ArtAndSciences {
  String major;
  int price;
  int year = 1;

  ArtAndSciences(this.major, this.price);

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

List<ArtAndSciences> majors = [
  ArtAndSciences('Advertising', 3000),
  ArtAndSciences('BioChemistry', 3050),
  ArtAndSciences('Biology', 3100),
  ArtAndSciences('BiomedicalScience', 3150),
  ArtAndSciences('Chemistry', 3200),
  ArtAndSciences('Computer Science', 3250),
  ArtAndSciences('Information Technology', 3300),
  ArtAndSciences('Food & Science Technology', 3350),
  ArtAndSciences('Graphic Design', 3400),
  ArtAndSciences('Interior Design', 3450),
  ArtAndSciences('Journalism', 3500),
  ArtAndSciences('Mathematics', 3550),
  ArtAndSciences('Nutrition & Dietetics', 3600),
  ArtAndSciences('Physics', 3650),
  ArtAndSciences('Public Relations', 3700),
  ArtAndSciences('Radio & Tv', 3750),
];

class Apps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Apps> with SingleTickerProviderStateMixin {
  String selectedMajor = majors[0].major;
  int selectedYear = 1;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Trigger the animation when the widget is first initialized
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Art and Sciences'),
          centerTitle: true,
          backgroundColor: Colors.blue, // Set app bar background color
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Select a Major:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              // Create the dropdown menu
              DropdownButton<String>(
                value: selectedMajor,
                onChanged: (String? newValue) {
                  // Handle the selection
                  setState(() {
                    selectedMajor = newValue!;
                  });
                  print('Selected Major: $newValue');
                },
                items: majors.map<DropdownMenuItem<String>>((ArtAndSciences major) {
                  return DropdownMenuItem<String>(
                    value: major.major,
                    child: Text(major.major, style: TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Create the radio buttons
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
                          // Update the year and recalculate the price
                          setState(() {
                            selectedYear = value!;
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
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
                          // Update the year and recalculate the price
                          setState(() {
                            selectedYear = value!;
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
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
                          // Update the year and recalculate the price
                          setState(() {
                            selectedYear = value!;
                            majors.firstWhere((element) => element.major == selectedMajor).year = value!;
                          });
                        },
                      ),
                      Text('3 Years', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Display the total price based on the selected major and years
              Text(
                'Total Price: \$${majors.firstWhere((element) => element.major == selectedMajor).getTotalPrice()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              // Create a button to return to the Home Page
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
