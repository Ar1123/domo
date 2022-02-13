import 'package:bloc/bloc.dart';
import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:domo/src/domain/usecase/use_case_domain.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SharedPrefencesUseCase sharedPrefencesUseCase;
  final UserUSerCaseDomain uSerCaseDomain;
  UserBloc({
    required this.sharedPrefencesUseCase,
    required this.uSerCaseDomain,
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) {
    });
  }

  Future<UserEntities> getUser()async{
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
}
