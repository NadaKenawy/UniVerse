import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:universe/core/networking/server_error_handler.dart';
import 'package:universe/core/networking/server_result.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';
import '../../../../../core/networking/api_service.dart';

class GetReportsRepo {
  final ApiService _apiService;
  GetReportsRepo(this._apiService);

  Future<ServerResult<ReportsResponse>> getFeedbacks(String token) async {
    try {
      log('📝 GetReportsRepo: Calling API...');
      final response = await _apiService.getFeedbacks(token);
      log('📝 GetReportsRepo: API call successful');
      log('📝 GetReportsRepo: Status: ${response.status}');
      log('📝 GetReportsRepo: Reports count: ${response.reports.length}');
      log('📝 GetReportsRepo: Filter type: ${response.filter.type}');
      log('📝 GetReportsRepo: Stats - avgRating: ${response.stats.averageRating}, percentage: ${response.stats.percentage}, total: ${response.stats.totalReports}');
      return ServerResult.success(response);
    } catch (error, stackTrace) {
      log('📝 GetReportsRepo: Error type: ${error.runtimeType}');
      log('📝 GetReportsRepo: Error occurred: $error');
      if (error is DioException) {
        log('📝 GetReportsRepo: DioException type: ${error.type}');
        log('📝 GetReportsRepo: Response data: ${error.response?.data}');
      }
      log('📝 GetReportsRepo: Stack trace: $stackTrace');
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
