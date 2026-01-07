import 'package:universe/features/courses_registration/data/models/register_subject/register_subject_request.dart';
import 'package:universe/features/courses_registration/data/models/register_subject/register_subject_response.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/server_error_handler.dart';
import '../../../../core/networking/server_result.dart';

class RegisterSubjectRepo {
  final ApiService _apiService;

  RegisterSubjectRepo(this._apiService);

  Future<ServerResult<RegisterSubjectResponse>> registerSubject({
    required String token,
    required RegisterSubjectRequest request,
  }) async {
    try {
      final response = await _apiService.registerSubject(request, token);
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(ServerErrorHandler.handle(error));
    }
  }
}
