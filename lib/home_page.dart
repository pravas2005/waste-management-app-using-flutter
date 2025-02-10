import 'package:flutter/material.dart';
import 'book_workers.dart';
import 'dustbin1.dart';
import 'help.dart';
import 'feedback.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String buttonName = 'Login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Waste management')),
          backgroundColor: const Color.fromARGB(255, 3, 237, 11),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 236, 234, 232),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 12, 234, 8),
                    foregroundColor: Color.fromARGB(255, 1, 14, 3)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ThirdPage(),
                    ),
                  );
                },
                child: const Text('Check your elegible for rewards or not'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 71, 245, 9),
                    foregroundColor: Color.fromARGB(255, 12, 14, 12)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => FourthPage(),
                    ),
                  );
                },
                child: const Text('Book the workers to clean your environment'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 71, 245, 9),
                    foregroundColor: Color.fromARGB(255, 12, 14, 12)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => FifthPage(),
                    ),
                  );
                },
                child: const Text('Help'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 71, 245, 9),
                    foregroundColor: Color.fromARGB(255, 12, 14, 12)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SixthPage(),
                    ),
                  );
                },
                child: const Text('Feedback'),
              ),
            ],
          ),
        ));
  }
}
