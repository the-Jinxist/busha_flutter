import 'package:busha_flutter_assessment/core/transactions/components/transaction_detail_section.dart';
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Transaction Details"),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransactionDetailSection(label: "label", detail: "detail"),
          TransactionDetailSection(label: "label", detail: "detail"),
          TransactionDetailSection(label: "label", detail: "detail"),
          TransactionDetailSection(label: "label", detail: "detail"),
          TransactionDetailSection(label: "label", detail: "detail"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.link),
                  Text("View on blockchain explorer"),
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          )
        ],
      ),
    );
  }
}
