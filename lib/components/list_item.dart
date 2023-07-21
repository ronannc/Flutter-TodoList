import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey,  
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('data', style: TextStyle(
            fontSize: 12
          ),),
          Text(this.title, style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),)
        ],
      ),
    );
  }
}
