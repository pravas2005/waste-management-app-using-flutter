import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int currentIndex = 0;
  String buttonName = 'Login';
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Waste management')),
          backgroundColor: Color.fromARGB(255, 3, 253, 11),
        ),
        body: Center(
          child: currentIndex == 0
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Congratulations! You are eligible for rewards.\nYou can see in the calendar which dates you are eligible for rewards.\nA red circle indicates you are not eligible. \nA green circle indicates you are eligible. \n If there is no circle, it means you have not submitted waste to us\nEach green circle earns you 10 points. \nYou currently have 150 points in your account.\nThank You!.',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked = !_isClicked;
                    });
                  },
                  child: _isClicked
                      ? Image.asset(
                          'images/image for miniproject.jpeg',
                        )
                      : Image.asset('images/june%20Calander2.jpg')),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 8, 229, 15),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 14, 14, 14),
                size: 65.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            BottomNavigationBarItem(
                label: 'Calander',
                icon: Icon(
                  Icons.calendar_today_sharp,
                  color: Color.fromARGB(255, 14, 14, 14),
                  size: 65.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ))
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
