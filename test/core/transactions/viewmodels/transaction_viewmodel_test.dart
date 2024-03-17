import 'package:busha_flutter_assessment/core/transactions/viewmodels/transaction_viewmodel.dart';
import 'package:busha_flutter_assessment/util/resource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_transaction_repo.dart';

void main() {
  test('Verify state returned on get current block is the correct on success',
      () async {
    final vm = TransactionViewmodel(MockTransactionRepo());
    await vm.getCurrentBlock();

    expect(vm.currentBlockResource.ops, NetworkStatus.successful);
    expect(vm.currentBlockResource.modelResponse, {"status": "success"});
  });

  test('Verify state returned on get current block is the correct on failed',
      () async {
    final vm = TransactionViewmodel(MockFailedTransactionRepo());
    await vm.getCurrentBlock();

    expect(vm.currentBlockResource.ops, NetworkStatus.failed);
    expect(vm.currentBlockResource.networkError!.contains("Omoo"), true);
  });

  test('Verify state returned on get transaction is the correct on success',
      () async {
    final vm = TransactionViewmodel(MockTransactionRepo());
    await vm.getTransactions(blockHash: "1223344");

    expect(vm.transactionsResource.ops, NetworkStatus.successful);
    expect(vm.transactionsResource.modelResponse,
        {"status": "success", "hash": "1223344"});
  });

  test('Verify state returned on get transaction is the correct on failed',
      () async {
    final vm = TransactionViewmodel(MockFailedTransactionRepo());
    await vm.getTransactions(blockHash: "1223344");

    expect(vm.transactionsResource.ops, NetworkStatus.failed);
    expect(vm.transactionsResource.networkError!.contains("Omoo"), true);
  });
}
