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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Ethereum",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              Icon(
                Icons.arrow_outward,
                color: Colors.green,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "1.76-",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
