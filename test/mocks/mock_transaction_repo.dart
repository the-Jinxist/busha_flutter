import 'package:busha_flutter_assessment/core/transactions/service/transaction_service.dart';

class MockTransactionRepo extends Transactionservice {
  @override
  Future<Map<String, dynamic>> getLatestBlock() async {
    await Future.delayed(const Duration(seconds: 2));

    return {"status": "success"};
  }

  @override
  Future<Map<String, dynamic>> getTransactions(
      {required String blockHash}) async {
    await Future.delayed(const Duration(seconds: 2));

    return {
      "status": "success",
      "hash": blockHash,
    };
  }
}

class MockFailedTransactionRepo extends Transactionservice {
  @override
  Future<Map<String, dynamic>> getLatestBlock() async {
    await Future.delayed(const Duration(seconds: 1));

    throw Exception("Omooo");
  }

  @override
  Future<Map<String, dynamic>> getTransactions(
      {required String blockHash}) async {
    await Future.delayed(const Duration(seconds: 1));

    throw Exception("Omooo");
  }
}
