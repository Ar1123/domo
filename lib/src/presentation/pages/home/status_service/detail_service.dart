import 'dart:convert';

import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/data/model/service_model.dart';
import 'package:domo/src/domain/entities/service_entities.dart';
import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailService extends StatelessWidget {
   DetailService({Key? key}) : super(key: key);
  ServiceEntities ? serviceEntities;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if(arguments!=null){
      final encodeData = jsonEncode(arguments);
      final decodeData = jsonDecode(encodeData);
      serviceEntities = ServiceModel.fromJson(decodeData['service'] as Map<String, dynamic>);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: apbar(
          title: "Detalle del servicio",
          size: size,
          action: () {
            Navigator.pop(context);
          },
          
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(serviceEntities!.category!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
