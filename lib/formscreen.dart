import 'package:flutter/material.dart';
import 'formWidgetClass.dart'; // Make sure this imports the correct file

class Formscreen extends StatefulWidget {
  const Formscreen({super.key});

  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  bool _isFormVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 204, 204),
  
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 182, 255),
        title: Text(
          'Form App',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _isFormVisible = !_isFormVisible;
                });
              },
            ),
          ),
        ],
      ),
      body: _isFormVisible
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormWidget(),
              ),
            )
          : Center(
              child: Text(
                'Press the + button to Show a form',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }
}
