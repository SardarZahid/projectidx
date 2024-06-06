import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> items;

  HomeScreen({required this.items});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, String>> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
  }

  void _deleteItem() {
    if (_items.isNotEmpty) {
      setState(() {
        _items.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Home Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _deleteItem,
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  shadowColor: Colors.blue,
                  child: ListTile(
                    title: Text(item['title']!),
                    subtitle: Text(item['description']!),
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
