import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String text;
  final double margem;

  LabelWidget({required this.text, required this.margem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margem),
      child: Row(
        children: [
          Text(text),
        ],
      ),
    );
  }
}
