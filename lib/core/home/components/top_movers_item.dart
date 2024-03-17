import 'package:flutter/material.dart';

class TopMoversItem extends StatelessWidget {
  const TopMoversItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Ethereum"),
          SizedBox(
            height: 5,
          ),
          Text("1.76-"),
        ],
      ),
    );
  }
}
