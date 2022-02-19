import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domo/src/core/errors/execptions.dart';
import 'package:domo/src/data/model/offer_model.dart';

abstract class OfferRemoteDataSource {
  Future<List<OfferModel>> getOfferById({required String id});
  Future<int> offerAmmount({required String idService, required String id});
}

class OfferRemoteDataSourceImpl implements OfferRemoteDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('offer');
  @override
  Future<List<OfferModel>> getOfferById({required String id}) async {
    try {
      List<OfferModel> list = [];
      List<OfferModel> list2 = [];
      final getOffer = await _reference.where("client", isEqualTo: id).get();
      list = getOffer.docs
          .map((e) => OfferModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      var uniqueList = list.map((o) => o.idService).toSet();

      final listTemp = uniqueList.toList();
      OfferModel offerModel = OfferModel();
      for (var i = 0; i < listTemp.length; i++) {
        log("${listTemp[i]}", name: "aaa");
        final result = await _reference
            .where("client", isEqualTo: id)
            .where("idService", isEqualTo: listTemp[i])
            .get();

        offerModel =
            OfferModel.fromJson(result.docs[0].data() as Map<String, dynamic>);
        list2.add(offerModel);
      }

      return list2;
    } on FirebaseException catch (e) {
      log("$e");
      throw ServerExceptions();
    }
  }

  @override
  Future<int> offerAmmount(
      {required String idService, required String id}) async {
    try {
      final result = await _reference
          .where("client", isEqualTo: id)
          .where("idService", isEqualTo: idService)
          .get();
      return result.docs.length;
    } on FirebaseException catch (e) {
      throw ServerExceptions();
    }
  }
}
