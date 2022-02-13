import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/errors/execptions.dart';

abstract class UserRemoteDataSource {
  Future<bool> createUser({required Map<String, dynamic> data});
  Future<bool> update({required Map<String, dynamic> data, required String id});
  Future<dynamic> get({required String id});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('user');
  @override
  Future<bool> createUser({required Map<String, dynamic> data}) async {
    try {
      await _reference.doc(data['uid']).set(data);

      return true;
    } on FirebaseException catch (e) {
      log('Error al crear usuario $e');
      throw ServerExceptions();
    }
  }

  @override
  Future<dynamic> get({required String id}) async {
    try {
      final user = await _reference.doc(id).get();
      log("$user");
      return [];
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
