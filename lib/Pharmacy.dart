import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class Pharmacy {
  String major;
  int price;
  int year = 1;

  Pharmacy(this.major, this.price);

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

class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> with SingleTickerProviderStateMixin {
  Pharmacy pharmacyMajor = Pharmacy('Pharmacy', 5500);
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
          title: Text('Pharmacy'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple, // Set app bar background color
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Selected Major: ${pharmacyMajor.major}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
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
                            pharmacyMajor.year = value!;
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
                            pharmacyMajor.year = value!;
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
                            pharmacyMajor.year = value!;
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
                'Total Price: \$${pharmacyMajor.getTotalPrice()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, // Button color
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
