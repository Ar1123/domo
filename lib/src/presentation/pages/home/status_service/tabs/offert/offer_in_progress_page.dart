import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/domain/entities/offer_entities.dart';
import 'package:flutter/material.dart';

import '../../../../../../injector.dart';
import '../../../../../blocs/blocs.dart';

class OffertInProgressPage extends StatelessWidget {
  OffertInProgressPage({Key? key}) : super(key: key);
  final serviceBloc = locator<ServiceBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: FutureBuilder<List<OfferEntities>>(
        future: serviceBloc.getOfferInProgress(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            List<OfferEntities> list = snapshot.data ?? [];
            if (list.isNotEmpty) {
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) => _card(
                      size: size,
                      offerEntities: list[index],
                      context: context));
            } else {
              return Center(
                child: Text('Sin actividad'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _card(
          {required Size size,
          required OfferEntities offerEntities,
          required BuildContext context}) =>
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "detailService",
            arguments: {
              "service": offerEntities.service,
              "isShared": false,
              "price":offerEntities.price,
              "progress":offerEntities.progress,
              "uidS":offerEntities.owner
            },
          );
        },
        child: Container(
          height: size.height * .16,
          width: size.width * .9,
          margin: EdgeInsets.symmetric(
              vertical: size.height * .01, horizontal: size.width * .04),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .04,
              ),
              _itemCard(
                  text1: 'Ciudad:',
                  text2:
                      '${offerEntities.service!.city} (${offerEntities.service!.dep})',
                  size: size),
              _itemCard(
                  text1: 'Fecha:',
                  text2: '${offerEntities.service!.date}',
                  size: size),
              _itemCard(
                  text1: 'Hora:',
                  text2: '${offerEntities.service!.hour}',
                  size: size),
            ],
          ),
          decoration: BoxDecoration(
            color: blueColorTwo,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Widget _itemCard(
          {required String text1, required String text2, required Size size}) =>
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: size.width * .1),
            width: size.width * .2,
            child: Text(
              text1,
              style: textStyle(color: colorText, size: size.height * .024),
            ),
          ),
          Container(
            child: Text(
              text2,
              style: textStyle(
                color: colorText,
                size: size.height * .024,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      );
}
