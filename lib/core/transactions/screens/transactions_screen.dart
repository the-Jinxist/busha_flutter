import 'package:busha_flutter_assessment/core/transactions/components/transaction_item.dart';
import 'package:busha_flutter_assessment/core/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TransactionViewmodel>().getChainTransactions();
    });
  }

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
        title: const Text("BTC Transactions"),
        centerTitle: true,
      ),
      body: Consumer<TransactionViewmodel>(
        builder: (context, vm, child) {
          if (vm.currentBlockResource.hasFailed() ||
              vm.transactionsResource.hasFailed()) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("Sorry an error occurred"),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<TransactionViewmodel>().getChainTransactions();
                  },
                  child: const Icon(Icons.replay_outlined),
                ),
              ],
            );
          }

          if (vm.transactionsResource.isSuccess()) {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const TransactionItem();
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
