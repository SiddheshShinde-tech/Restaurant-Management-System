import 'package:flutter/material.dart';

class Buffer extends StatefulWidget {
  const Buffer({Key key}) : super(key: key);

  @override
  State<Buffer> createState() => _BufferState();
}

class _BufferState extends State<Buffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
        child: CircularProgressIndicator(
          color: Color(0xFFF7941E),
        ),
        height: 30.0,
        width: 30.0,
      ),),
    );
  }
}
