import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medical/bloc/repositories/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final _repo = AuthRepo();

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(LoginSuccess('Login Berhasil!'));
    } catch (e) {
      print(e);
      emit(LoginFailure(e.toString()));
    }
  }
}
