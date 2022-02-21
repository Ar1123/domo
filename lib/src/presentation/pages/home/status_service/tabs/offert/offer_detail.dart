import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/core/constant/asset_images.dart';
import 'package:domo/src/data/model/offer_model.dart';
import 'package:domo/src/domain/entities/offer_entities.dart';
import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:domo/src/presentation/blocs/blocs.dart';
import 'package:domo/src/presentation/widgets/appbar.dart';
import 'package:domo/src/presentation/widgets/custom_widget/custom_snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../../../injector.dart';

// ignore: must_be_immutable
class OffertDetail extends StatefulWidget {
  OffertDetail({Key? key}) : super(key: key);

  @override
  State<OffertDetail> createState() => _OffertDetailState();
}

class _OffertDetailState extends State<OffertDetail> {
  OfferEntities? offerEntities;

  final serviceBloc = locator<ServiceBloc>();

  final userBloc = locator<UserBloc>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      final dataEncode = jsonEncode(arguments);
      final dataDeoce = jsonDecode(dataEncode);
      offerEntities =
          OfferModel.fromJson(dataDeoce['offert'] as Map<String, dynamic>);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: apbar(
            title: "Detalle de ofertas",
            size: size,
            action: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * .25,
                    width: size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Text(
                          '${offerEntities!.service!.category}',
                          style: textStyle(
                            color: colorText,
                            size: size.height * .03,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * .4,
                              height: size.height * .18,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    offerEntities!.service!.date!,
                                  ),
                                  Text(
                                    offerEntities!.service!.hour!,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: size.height * .18,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: offerEntities!
                                      .service!.imagesevice!.length,
                                  itemBuilder: (_, index) => Center(
                                    child: Container(
                                      height: size.height * .15,
                                      width: size.width * .3,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: size.width * .01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: offerEntities!
                                            .service!.imagesevice![index],
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(kNotImage),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: backGroundColor,
                        boxShadow: [
                          BoxShadow(
                              color: colorText,
                              offset: Offset(0, 3),
                              blurRadius: 3)
                        ]),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  FutureBuilder<List<OfferEntities>>(
                      future: serviceBloc.getOfferById(
                          idService: offerEntities!.idService!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<OfferEntities> list = snapshot.data ?? [];
                          if (list.isNotEmpty) {
                            return SizedBox(
                              height: size.height * .6,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: list.length,
                                  itemBuilder: (_, index) => _card(
                                      size: size,
                                      offerEntities: list[index],
                                      listOfer: list)),
                            );
                          } else {
                            return Center(
                              child: Text('Sin ofertas'),
                            );
                          }
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                ],
              ),
              (loading)
                  ? Container(
                      height: size.height,
                      color: Colors.black.withOpacity(.5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(
          {required Size size,
          required OfferEntities offerEntities,
          required List<OfferEntities> listOfer}) =>
      Container(
        height: size.height * .15,
        width: size.width * .9,
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: size.width * .3,
              child: CircleAvatar(
                radius: size.height * .06,
                // backgroundImage: Image.network(o),
              ),
            ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * .1,
                    alignment: Alignment.center,
                    child: FutureBuilder<UserEntities>(
                        future: userBloc.getUserBydId(id: offerEntities.owner!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              '${snapshot.data!.name} ha realizado una oferta de ${offerEntities.price}',
                              style: textStyle(
                                color: colorText,
                                size: size.height * .024,
                              ),
                            );
                          } else {
                            return Text(
                              '------------ ha realizado una oferta de ${offerEntities.price}',
                              style: textStyle(
                                color: colorText,
                                size: size.height * .024,
                              ),
                            );
                          }
                        }),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete_outline_outlined,
                        ),
                        SizedBox(
                          width: size.width * .07,
                        ),
                        GestureDetector(
                          onTap: () async {
                            loading = true;
                            setState(() {});

                            final result = await serviceBloc.offerAceppt(
                                owner: offerEntities.owner!,
                                idService: offerEntities.idOffer!,
                                offer: listOfer);         
                          },
                          child: Icon(
                            Icons.check,
                          ),
                        ),
                        SizedBox(
                          width: size.width * .07,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
        decoration: BoxDecoration(
          color: blueColorTwo,
          borderRadius: BorderRadius.circular(10),
        ),
      );
}
