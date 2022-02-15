import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/asset_images.dart';
import 'package:domo/src/data/model/service_model.dart';
import 'package:domo/src/domain/entities/service_entities.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailService extends StatelessWidget {
  DetailService({Key? key}) : super(key: key);
  ServiceEntities? serviceEntities;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      final encodeData = jsonEncode(arguments);
      final decodeData = jsonDecode(encodeData);
      serviceEntities =
          ServiceModel.fromJson(decodeData['service'] as Map<String, dynamic>);
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
                margin: EdgeInsets.only(
                  top: size.height * .05,
                ),
                alignment: Alignment.center,
                child: Text(
                  serviceEntities!.category!,
                  style: textStyle(
                    color: colorText,
                    size: size.height * .05,
                  ),
                ),
              ),
              _item(
                text1: "Ciudad: ",
                text2: "${serviceEntities!.city} (${serviceEntities!.dep})",
                size: size,
              ),
              _item(
                text1: "Fecha: ",
                text2: serviceEntities!.date!,
                size: size,
              ),
              _item(
                text1: "Ciudad: ",
                text2: "${serviceEntities!.city} (${serviceEntities!.dep})",
                size: size,
              ),
              _title(size: size, text: "Descripción"),
              Container(
                height: size.height * .2,
                width: size.width * .8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colorText,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  serviceEntities!.description!,
                  style: textStyle(
                    color: colorText,
                    size: size.height * .023,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _card(img: "", size: size),
                  _card(img: "", size: size),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    required String text1,
    required String text2,
    required Size size,
  }) =>
      Container(
        margin: EdgeInsets.only(left: size.width * .1, top: size.height * .01),
        child: Row(
          children: [
            Container(
              width: size.width * .2,
              child: Text(
                text1,
                style: textStyle(
                  color: colorText,
                  size: size.height * .022,
                ),
              ),
            ),
            Container(
              child: Text(
                text2,
                style: textStyle(
                  color: colorText,
                  size: size.height * .022,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
  Widget _title({required Size size, required String text}) => Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: size.width * .1, top: size.height * .04),
        child: Text(
          text,
          style: textStyle(
            color: colorText,
            size: size.height * .025,
          ),
        ),
      );

  Widget _card({required String img, required Size size}) => Container(
        // child: ,
        height: size.height * .25,
        width: size.width * .4,
        child: CachedNetworkImage(
          imageUrl: img,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Image.asset(kNotImage),
        ),
        margin: EdgeInsets.only(top: size.height * .04),
        decoration: BoxDecoration(
          color: blueColorTwo,
          borderRadius: BorderRadius.circular(10),
          
          boxShadow: [
            BoxShadow(
              color: colorText,
              offset: Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
      );
}
