import 'package:busha_flutter_assessment/config/network.dart';
import 'package:dio/dio.dart';

abstract class Transactionservice {
  final dio = Dio();

  Transactionservice() {
    dio.options.baseUrl = Network.BASE_URL;
  }

  Future<Map<String, dynamic>> getLatestBlock();
  Future<Map<String, dynamic>> getTransactions({required String blockHash});
}
