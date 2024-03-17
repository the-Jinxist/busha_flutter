import 'dart:developer';

import 'package:busha_flutter_assessment/core/transactions/service/transaction_service.dart';

class TransactionRepository extends Transactionservice {
  @override
  Future<Map<String, dynamic>> getLatestBlock() async {
    try {
      final response = await dio.get("latestblock");
      log("response: $response");

      return response.data;
    } catch (e) {
      log("e: $e");
      throw e.toString();
    }
  }

  @override
  Future<Map<String, dynamic>> getTransactions(
      {required String blockHash}) async {
    try {
      final response = await dio.get("rawblock/\$$blockHash");
      log("response: $response");

      return response.data;
    } catch (e) {
      log("e: $e");

      throw e.toString();
    }
  }
}
