import 'dart:developer';

import 'package:busha_flutter_assessment/core/transactions/service/transaction_service.dart';
import 'package:busha_flutter_assessment/util/resource.dart';
import 'package:flutter/material.dart';

class TransactionViewmodel extends ChangeNotifier {
  final Transactionservice _transactionservice;

  TransactionViewmodel(this._transactionservice);

  Resource<Map<String, dynamic>> currentBlockResource = Resource.idle();

  Future<Map<String, dynamic>?> getCurrentBlock() async {
    try {
      currentBlockResource = Resource.loading();
      notifyListeners();

      final res = await _transactionservice.getLatestBlock();

      currentBlockResource = Resource.success(res);
      notifyListeners();

      return res;
    } catch (e) {
      currentBlockResource = Resource.failed(e.toString());
      notifyListeners();

      return null;
    }
  }

  Resource<Map<String, dynamic>> transactionsResource = Resource.idle();

  Future<void> getTransactions({required String blockHash}) async {
    try {
      transactionsResource = Resource.loading();
      notifyListeners();

      final res =
          await _transactionservice.getTransactions(blockHash: blockHash);

      transactionsResource = Resource.success(res);
      notifyListeners();
    } catch (e) {
      transactionsResource = Resource.failed(e.toString());
      notifyListeners();
    }
  }

  Future<void> getChainTransactions() async {
    final data = await getCurrentBlock();
    if (data != null) {
      getTransactions(blockHash: "");
    }
  }
}
