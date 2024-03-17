import 'package:flutter/material.dart';

class TransactionDetailSection extends StatelessWidget {
  final String label, detail;

  const TransactionDetailSection({
    super.key,
    required this.label,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Text(detail)],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
