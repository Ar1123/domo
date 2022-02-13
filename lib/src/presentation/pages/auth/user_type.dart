import 'package:domo/src/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

import '../../../config/style/style.dart';
import '../../../core/constant/words.dart';
import '../../../injector.dart';
import '../../blocs/blocs.dart';
import '../../widgets/button_widget.dart';

class SelectUserType extends StatelessWidget {
  SelectUserType({Key? key}) : super(key: key);
  final userBloc = locator<UserBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: FutureBuilder<UserEntities>(
            future: userBloc.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data?.typUser != 0) {
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'profilePage', (Route<dynamic> route) => false);
                  });
                  return Container(
                      height: size.height,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
                } else {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width * .1,
                            right: size.width * .1,
                            top: size.height * .1),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ktextUserType,
                                style: textStyle(
                                  color: colorText,
                                  size: size.height * .021,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: kDomo,
                                style: textStyle(
                                  color: colorText,
                                  size: size.height * .021,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _cardUSerType(
                            size: size,
                            text: 'Servidor',
                            img: '',
                          ),
                          SizedBox(
                            width: size.width * .04,
                          ),
                          _cardUSerType(
                            size: size,
                            text: 'Cliente',
                            img: '',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .1,
                      ),
                      ButtonWidget(
                        backGroundColor: colorText,
                        borderColor: colorText,
                        textColor: whiteColor,
                        text: 'Continuar',
                        action: () {},
                      ),
                    ],
                  );
                }
              } else {
                return Container(
                    height: size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              }
            }),
      ),
    );
  }

  Widget _cardUSerType({
    required Size size,
    required String text,
    required String img,
  }) =>
      GestureDetector(
        child: Column(
          children: [
            Container(
              height: size.height * .2,
              width: size.width * .4,
              decoration: BoxDecoration(
                  color: blueColorTwo,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: colorText,
                      offset: Offset(0, 5),
                      blurRadius: 2,
                    )
                  ]),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              text,
              style: textStyle(
                color: colorText,
                size: size.height * .02,
              ),
            )
          ],
        ),
      );
}
