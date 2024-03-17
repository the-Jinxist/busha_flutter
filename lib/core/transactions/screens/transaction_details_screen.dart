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
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.chevron_left),
        ),
        title: const Text(
          "BTC Transactions",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TransactionDetailSection(
                label: "Hash",
                detail: "000000000000000000jw794729482buhi2749278922"),
            TransactionDetailSection(label: "Time", detail: "2019-08-24"),
            TransactionDetailSection(label: "Size", detail: "9195"),
            TransactionDetailSection(label: "Block index", detail: "881100"),
            TransactionDetailSection(label: "Height", detail: "1227"),
            TransactionDetailSection(
                label: "Recieved time", detail: "2019-08-24"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "View on blockchain explorer",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
