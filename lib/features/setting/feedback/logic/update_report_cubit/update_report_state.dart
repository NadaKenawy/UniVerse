import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_report_state.freezed.dart';

@freezed
class UpdateReportState<T> with _$UpdateReportState<T> {
  const factory UpdateReportState.initial() = _Initial;
  const factory UpdateReportState.loading() = Loading;
  const factory UpdateReportState.success(T data) = Success;
  const factory UpdateReportState.error({required String error}) = Error;
}
