import 'package:flutter/material.dart';
import '../components.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    this.setState(()
    {
      data = json.decode(response.body);
    },
    );
    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: appName,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("App Drawer")],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  data[index]["title"],
                ),
                subtitle: Text(
                  data[index]["body"],
                ),
                trailing: Icon(Icons.check_box),
                leading: CircleAvatar(
                  backgroundColor: primaryColor,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
