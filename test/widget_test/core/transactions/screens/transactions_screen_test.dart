import 'package:busha_flutter_assessment/core/transactions/components/transaction_item.dart';
import 'package:busha_flutter_assessment/core/transactions/screens/transactions_screen.dart';
import 'package:busha_flutter_assessment/core/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../../../mocks/mock_transaction_repo.dart';

void main() {
  testWidgets('Transaction screen shows list view if calls are successful',
      (tester) async {
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TransactionViewmodel(MockTransactionRepo()),
        child: const MaterialApp(
          home: TransactionsScreen(),
        ),
      ),
      const Duration(seconds: 1),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final loaderFinder = find.byType(ListView);
    expect(loaderFinder, findsOneWidget);

    final transactionItem = find.byType(TransactionItem);
    expect(transactionItem, findsAtLeast(4));
  });

  testWidgets('Transaction screen shows list view if calls fail',
      (tester) async {
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TransactionViewmodel(MockFailedTransactionRepo()),
        child: const MaterialApp(
          home: TransactionsScreen(),
        ),
      ),
      const Duration(seconds: 1),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final loaderFinder = find.text("Sorry an error occurred");
    expect(loaderFinder, findsOneWidget);
  });
}
