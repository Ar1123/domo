import 'package:domo/src/domain/entities/service_entities.dart';
import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

import '../../../../../config/style/style.dart';
import '../../../../../injector.dart';
import '../../../../blocs/blocs.dart';

class ProgressService extends StatelessWidget {
  ProgressService({Key? key}) : super(key: key);
  final serviceBloc = locator<ServiceBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .04,
          ),
          FutureBuilder<List<ServiceEntities>>(
              future: serviceBloc.getServicesByUser(),
              builder:
                  (context, AsyncSnapshot<List<ServiceEntities>> snapshot) {
                if (snapshot.hasData) {
                  List<ServiceEntities> list = snapshot.data ?? [];
                  if (list.isNotEmpty) {
                    return SizedBox(
                      height: size.height * .65,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (_, index) => _card(
                          context: context,
                          size: size,
                          serviceEntities: list[index]
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: size.height,
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * .3),
                        child: Text(
                          'Sin actividad',
                          style: textStyle(
                              color: colorText, size: size.height * .02),
                        ),
                      ),
                    );
                  }
                } else {
                  return SizedBox(
                    height: size.height,
                    child: Container(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }

  Widget _card({required Size size, required ServiceEntities serviceEntities, required BuildContext context}) => GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, "detailService", arguments: {"service":serviceEntities});
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
                  text1: 'Ciudad:', text2: '${serviceEntities.city} (${serviceEntities.dep})', size: size),
              _itemCard(text1: 'Fecha:', text2: '${serviceEntities.date}', size: size),
              _itemCard(text1: 'Hora:', text2: '${serviceEntities.hour}', size: size),
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
            margin: EdgeInsets.only(left: size.width * .15),
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
