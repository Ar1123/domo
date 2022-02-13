import 'package:domo/src/core/errors/execptions.dart';
import 'package:domo/src/injector.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signInWithPhone(
      {required PhoneAuthCredential phoneAuthCredential});
  Future<bool> verifySession();
  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  UserCredential? _userCredential;
  User? user;

  // final useCase = locator<SharedPreferencesUseCase>();

  AuthRemoteDataSourceImpl({required this.auth});

  @override
  Future<void> logOut() async{
     try {
      await auth.signOut();
    } catch (e) {
      Future.error('Error al cerrar sesión $e');
      throw ServerExceptions();
    }
  }

  @override
  Future<UserCredential> signInWithPhone(
      {required PhoneAuthCredential phoneAuthCredential}) async{
     try {
      final result = await auth.signInWithCredential(phoneAuthCredential);

      if (result.user != null) {
            //  await useCase.setKeyString(
            // key: 'uid', value: result.user!.uid);
        return result;
      }

      throw ServerExceptions();
    } on FirebaseAuthException catch (e) {
      throw ServerExceptions();
    }
  }

  @override
  Future<bool> verifySession() async {
    bool status = false;

    try {
      user = auth.currentUser;
      if (user != null) {
        status = true;
      }
      return status;
    } catch (e) {
      Future.error('Error al verificar sesión $e');
      status = false;
      throw ServerExceptions(message: '');
    }
  }
}
