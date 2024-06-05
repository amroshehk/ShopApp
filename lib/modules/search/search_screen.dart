import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        leading: IconButton(onPressed: () {
Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_outlined)),
      ),

      body: Container(
        child: Text("Search"),
      ),
    );
  }
}
