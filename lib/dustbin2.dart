import 'package:flutter/material.dart';
import 'rewards_page.dart';

class WeightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Transparent Dustbin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransparentDustbinPage(),
    );
  }
}

class TransparentDustbinPage extends StatefulWidget {
  @override
  _TransparentDustbinPageState createState() => _TransparentDustbinPageState();
}

class _TransparentDustbinPageState extends State<TransparentDustbinPage> {
  double weight = 0.0;
  final TextEditingController _controller = TextEditingController();
  String rewardMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('See your waste in dustbin')),
        backgroundColor: const Color.fromARGB(255, 4, 250, 13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter weight of waste',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: CustomPaint(
                  size: Size(100, 300), // Width and height of the dustbin
                  painter: DustbinPainter(weight),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      weight = double.tryParse(_controller.text) ?? 0.0;
                      if (weight < 0) weight = 0;
                      if (weight > 100) weight = 100;

                      if (weight > 50) {
                        rewardMessage = 'You are not eligible for rewards';
                      } else {
                        rewardMessage = 'You are eligible for rewards';
                      }
                    });
                  },
                  child: Text('Enter'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              rewardMessage,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            SizedBox(height: 20),
            if (rewardMessage == 'You are eligible for rewards')
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewardsPage()),
                  );
                },
                child: Text('Go to Rewards Page'),
              ),
          ],
        ),
      ),
    );
  }
}

class DustbinPainter extends CustomPainter {
  final double weight;

  DustbinPainter(this.weight);

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    // Draw the border of the dustbin
    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Rect binRect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(binRect, borderPaint);

    // Draw the weight level
    double weightLevel = height - (weight / 100 * height);
    Paint weightPaint = Paint()
      ..color = const Color.fromARGB(255, 7, 230, 14).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    Rect weightRect =
        Rect.fromLTWH(0, weightLevel, width, height - weightLevel);
    canvas.drawRect(weightRect, weightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
