import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:domo/src/domain/usecase/use_case_domain.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SharedPrefencesUseCase sharedPrefencesUseCase;
  final UserUSerCaseDomain uSerCaseDomain;
  final AuthUseCaseDomnain authUseCaseDomnain;
  UserBloc({
    required this.sharedPrefencesUseCase,
    required this.uSerCaseDomain,
    required this.authUseCaseDomnain,
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) {});
  }

  Future<UserEntities> getUser() async {
    UserEntities? userEntities;
    String id = "";
    final resultId = await sharedPrefencesUseCase.getKeyString(key: "uid");
    resultId.fold((l) {}, (r) {
      id = r;
    });
    final user = await uSerCaseDomain.getUser(id: id);
    user.fold((l) {}, (r) {
      userEntities = r;
    });

    return userEntities!;
  }
  Future<UserEntities> getUserBydId({required String id}) async {
    UserEntities? userEntities;

    final user = await uSerCaseDomain.getUserServer(id: id);
    user.fold((l) {
      log("$l", name: "Error");
    }, (r) {
      userEntities = r;
    });

    return userEntities!;
  }

  Future<String> getIdUser() async {
    String id = "";
    final getId = await authUseCaseDomnain.getUserId();
    getId.fold((l) {}, (r) {
      id = r;
    });
    return id;
  }
   Future<String> getToken({required String id}) async {
    String token = "";
    final result = await uSerCaseDomain.getToken(id:  id);
    result.fold((l) {}, (r) {
      token = r;
    });

    return token;
  }

  Future<bool> udateUser({required Map<String, dynamic> data}) async {
    bool status = false;
    final getId = await getIdUser();
    final update = await uSerCaseDomain.updateUser(data: data, id: getId);
    update.fold((l) {}, (r) {
      status = r;
    });

    return status;
  }
}
