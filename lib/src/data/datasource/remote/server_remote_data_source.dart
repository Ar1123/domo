import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domo/src/core/errors/execptions.dart';

abstract class ServerRemoteDataSource {
  Future<List<String>> getServer(
      {required String category, required String city});
}

class ServerRemoteDataSourceImpl implements ServerRemoteDataSource {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('server');
  @override
  Future<List<String>> getServer(
      {required String category, required String city}) async {
    List<String> uid = [];
    try {
      final result = await _collectionReference
          .where("labores", arrayContains: category)
          .where("city", isEqualTo: city)
          .get();

      final d = result.docs.toList();
      d.forEach((element) {
    final encodeData = jsonEncode(element.data());
    final decodeData = jsonDecode(encodeData);
          uid.add(decodeData['uid']);
      });
      return uid;
    } on FirebaseException catch (e) {
      log("$e");
      throw ServerExceptions();
    }
  }
}
