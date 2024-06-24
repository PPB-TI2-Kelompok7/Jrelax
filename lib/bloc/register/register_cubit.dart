import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medical/bloc/repositories/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final _repo = AuthRepo();

  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await _repo.Register(email: email, password: password);
      emit(RegisterSuccess('Berhasil Daftar!'));
    } catch (e) {
      print(e);
      emit(RegisterFailure(e.toString()));
    }
  }
}
