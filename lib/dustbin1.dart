import 'package:flutter/material.dart';
import 'dustbin2.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waste Management App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WasteManagementHomePage(),
    );
  }
}

class WasteManagementHomePage extends StatefulWidget {
  @override
  _WasteManagementHomePageState createState() =>
      _WasteManagementHomePageState();
}

class _WasteManagementHomePageState extends State<WasteManagementHomePage> {
  final List<String> _wasteItems = [];

  final TextEditingController _controller = TextEditingController();
  bool _isButtonDisabled = true;

  void _updateButtonState() {
    setState(() {
      _isButtonDisabled = _controller.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateButtonState);
  }

  void _addWasteItem() {
    setState(() {
      _wasteItems.add(_controller.text);
      _controller.clear();
    });
  }

  void _removeWasteItem(int index) {
    setState(() {
      _wasteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Management'),
        backgroundColor: Color.fromARGB(255, 3, 235, 11),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter waste item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addWasteItem,
            child: Text('Cancel'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _isButtonDisabled
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeightPage(),
                      ),
                    );
                  },
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _wasteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_wasteItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeWasteItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
