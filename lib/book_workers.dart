import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  _SubmitWasteRequestPageState createState() => _SubmitWasteRequestPageState();
}

class _SubmitWasteRequestPageState extends State<FourthPage> {
  final TextEditingController _wasteTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _numberofController = TextEditingController();

  bool _isSubmitButtonEnabled = false;

  void _checkFormValidity() {
    setState(() {
      _isSubmitButtonEnabled = _wasteTypeController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _numberofController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _wasteTypeController.addListener(_checkFormValidity);
    _descriptionController.addListener(_checkFormValidity);
    _numberofController.addListener(_checkFormValidity);
  }

  @override
  void dispose() {
    _wasteTypeController.dispose();
    _descriptionController.dispose();
    _numberofController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book the workers'),
        backgroundColor: Color.fromARGB(255, 4, 239, 12),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _wasteTypeController,
              decoration: const InputDecoration(
                labelText: 'Waste Type',
                hintText: 'Enter type of waste',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Enter address',
                hintText: 'Address of your destination',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _numberofController,
              decoration: const InputDecoration(
                labelText: 'Enter number of workers You needed',
                hintText: 'number of workers',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isSubmitButtonEnabled
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Workers Booked successfuly')),
                      );
                    }
                  : null,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
