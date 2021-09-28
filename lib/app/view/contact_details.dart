import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;
      var height = constraints.biggest.height;

      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    });
  }
}
