import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domo/src/data/model/user_model.dart';

import '../../../core/errors/execptions.dart';

abstract class UserRemoteDataSource {
  Future<bool> createUser({required Map<String, dynamic> data});
  Future<bool> update({required Map<String, dynamic> data, required String id});
  Future<USerModel> get({required String id});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('user');
  @override
  Future<bool> createUser({required Map<String, dynamic> data}) async {
    try {
      await _reference.doc("${data['uid']}").set(data);

      return true;
    } on FirebaseException catch (e) {
      log('Error al crear usuario $e');
      throw ServerExceptions();
    }
  }

  @override
  Future<USerModel> get({required String id}) async {
    try {
      USerModel uSerModel = USerModel();
      final user = await _reference.doc(id).get();
      uSerModel  = USerModel.fromJson(user.data() as Map<String, dynamic>);
      return uSerModel;
    } on FirebaseException catch (e) {
      log('Error al obtener usuario $e');
      throw ServerExceptions();
    }
  }

  @override
  Future<bool> update(
      {required Map<String, dynamic> data, required String id}) async{
    try {
            await _reference.doc(id).update(data);
            return true;
    } on FirebaseException catch (e) {
      log('Error al actualizar usuario $e');

      throw ServerExceptions();
    }
  }
}
