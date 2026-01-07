import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universe/features/setting/feedback/data/models/get_reports/get_reports_response.dart';

part 'get_reports_state.freezed.dart';

@freezed
class GetReportsState<T> with _$GetReportsState<T> {
  const factory GetReportsState.initial() = _Initial;
  const factory GetReportsState.loading() = Loading;
  const factory GetReportsState.success(
    ReportsResponse getFeedbacksResponse,
  ) = Success;
  const factory GetReportsState.error({required String error}) = Error;
}
