import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:universe/core/constants/shared_pref_helper.dart';
import 'package:universe/core/constants/shared_pref_keys.dart';
import 'user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;

  UserState({this.user, this.isLoading = false});

  UserState copyWith({UserModel? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState(isLoading: true)) {
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    await _loadUserData();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _loadUserData() async {
    try {
      final savedUser = await getSavedUserData();
      if (savedUser != null) {
        emit(state.copyWith(user: savedUser));
      }
    } catch (e) {
      log('Error loading user data: $e');
    }
  }

  void setUser(UserModel user) async {
    emit(state.copyWith(user: user));
    await saveUserDataLocally(user);
    log('User set: ${user.name}');
  }

  Future<void> clearUser() async {
    emit(UserState());
    await SharedPrefHelper.removeSecuredData('user_data');
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
  }
}

Future<void> saveUserDataLocally(UserModel user) async {
  try {
    await SharedPrefHelper.setSecuredString(
      'user_data',
      jsonEncode(user.toJson()),
    );

    if (user.token != null) {
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        user.token!,
      );
    }
  } catch (e) {
    log('Error saving user data: $e');
  }
}

Future<UserModel?> getSavedUserData() async {
  try {
    final jsonString = await SharedPrefHelper.getSecuredString('user_data');
    if (jsonString.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  } catch (_) {
    await SharedPrefHelper.removeSecuredData('user_data');
    return null;
  }
}

