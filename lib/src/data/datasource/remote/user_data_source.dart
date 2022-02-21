import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domo/src/data/model/user_model.dart';

import '../../../core/errors/execptions.dart';

abstract class UserRemoteDataSource {
  Future<bool> createUser({required Map<String, dynamic> data});
  Future<bool> update({required Map<String, dynamic> data, required String id});
  Future<USerModel> get({required String id});
  Future<USerModel> getUserServer({required String id});
  Future<String> getToken({required String id});

}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('user');
       final CollectionReference _ref =
      FirebaseFirestore.instance.collection('token');
       final CollectionReference _refe =
      FirebaseFirestore.instance.collection('server');
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
        log("444444444444444444444");
      if (user.exists) {
        uSerModel = USerModel.fromJson(user.data() as Map<String, dynamic>);
      }else{
        log("4444444444444444444441234");

        uSerModel = USerModel.fromJson({});
      }
      return uSerModel;
    } on FirebaseException catch (e) {
      log('Error al obtener usuario $e');
      throw ServerExceptions();
    }
  }

  @override
  Future<bool> update(
      {required Map<String, dynamic> data, required String id}) async {
    try {
      await _reference.doc(id).update(data);
      return true;
    } on FirebaseException catch (e) {
      log('Error al actualizar usuario $e');

      throw ServerExceptions();
    }
  }

  @override
  Future<String> getToken({required String id}) async {
      String token = "";
    try {
      log("$id   ${token}" , name: "aaaaaaaaaaaaa");
      final getToken = await _ref.doc(id).get();
      final encodeData = (jsonEncode(getToken.data()));
      final decodeData = (jsonDecode(encodeData));
      token = decodeData['token'];
      return token;
    } on FirebaseException catch (e) {
      log("$e");
      throw ServerExceptions();
    }
  }

  @override
  Future<USerModel> getUserServer({required String id})async {
       try {
      USerModel uSerModel = USerModel();
      final user = await _refe.doc(id).get();
        log("444444444444444444444");
      if (user.exists) {
        uSerModel = USerModel.fromJson(user.data() as Map<String, dynamic>);
      }else{
        log("4444444444444444444441234");

        uSerModel = USerModel.fromJson({});
      }
      return uSerModel;
    } on FirebaseException catch (e) {
      log('Error al obtener usuario $e');
      throw ServerExceptions();
    }
  }
}
