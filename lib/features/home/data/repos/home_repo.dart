import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';
import '../models/home_data_response.dart';

class HomeRepo{
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ServerResult<HomeDataResponse>> getHomeData(String token) async {
    try {
      final response = await _apiService.getHomeData(token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
