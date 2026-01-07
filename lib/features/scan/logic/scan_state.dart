import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_state.freezed.dart';

@freezed
class ScanState<T> with _$ScanState<T> {
  const factory ScanState.initial() = _Initial;
  const factory ScanState.loading() = Loading;
  const factory ScanState.success(T data) = Success<T>;
  const factory ScanState.error({required String error}) = Error;
}
