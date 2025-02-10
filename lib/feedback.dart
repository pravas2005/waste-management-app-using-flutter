import 'package:flutter/material.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({super.key});

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  final TextEditingController _feedBack = TextEditingController();
  bool _isSubmitButtonEnabled = false;
  void _checkFormValidity() {
    setState(() {
      _isSubmitButtonEnabled = _feedBack.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _feedBack.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _feedBack.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Feedback')),
          backgroundColor: Color.fromARGB(255, 3, 253, 11),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            TextField(
              controller: _feedBack,
              decoration: const InputDecoration(
                labelText: 'Feedback',
                hintText: 'Enter your feedback',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isSubmitButtonEnabled
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Your feedback submited successfully')),
                      );
                    }
                  : null,
              child: const Text('Submit'),
            ),
          ]),
        ));
  }
}
