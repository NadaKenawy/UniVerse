import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pass_state.freezed.dart';

@freezed
class UpdatePassState<T> with _$UpdatePassState<T> {
  const factory UpdatePassState.initial() = _Initial;
  const factory UpdatePassState.loading() = Loading;
  const factory UpdatePassState.success(T data) = Success;
  const factory UpdatePassState.error({required String error}) = Error;
}
