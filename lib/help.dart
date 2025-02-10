import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Help')),
          backgroundColor: Color.fromARGB(255, 3, 253, 11),
        ),
        body: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us:\nOur app aims to streamline waste management processes and promote eco-friendly practices.\nWe’re committed to reducing waste, promoting recycling, and creating a cleaner environment.\n Contact Us:\n If you have any issues email to 1**2@gmail.com\nAbout reward:\nAt the end of the year you will get prize money\n one reward Rs.10',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        )));
  }
}
