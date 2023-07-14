import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/src/widgets/image_list.dart';
import 'package:http/http.dart' as http show get;
import 'src/models/image_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    String baseUrl = 'https://jsonplaceholder.typicode.com/photos/';
    _counter++;
    Uri url = Uri.parse('$baseUrl$_counter');
    var response = await http.get(url);
    ImageModel imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
