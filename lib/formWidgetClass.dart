import 'package:flutter/material.dart';
import 'package:myapp/homeScreen.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Map<String, String>> _items = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (!RegExp(r'^[A-Z\s]+$').hasMatch(value)) {
                  return 'Please use only uppercase letters and spaces';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              minLines: 2,
              maxLines: 10,
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Write a Description',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _items.add({
                      'title': _titleController.text,
                      'description': _descriptionController.text,
                    });
                    _titleController.clear();
                    _descriptionController.clear();
                  });
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(items: _items),
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
