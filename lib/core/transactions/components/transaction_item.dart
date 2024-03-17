import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String? hash, time;

  const TransactionItem({super.key, this.hash, this.time});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hash ?? "0x00000009248209482984024802aaa000",
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      "2019-08-24",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "15:43",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
