import 'package:domo/src/config/style/style.dart';
import 'package:flutter/material.dart';

class ProgressService extends StatelessWidget {
  const ProgressService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .04,
          ),
          SizedBox(
            height: size.height*.65,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (_, index) => _card(
                size: size,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _card({required Size size}) => Container(
        height: size.height * .16,
        width: size.width * .9,
        margin: EdgeInsets.symmetric(vertical: size.height * .01, horizontal: size.width*.04),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .04,
            ),
            _itemCard(
                text1: 'Ciudad:', text2: 'Montería (Córdoba)', size: size),
            _itemCard(text1: 'Fecha:', text2: '12/Feb/2022', size: size),
            _itemCard(text1: 'Hora:', text2: '8: 45 AM', size: size),
          ],
        ),
        decoration: BoxDecoration(
          color: blueColorTwo,
          borderRadius: BorderRadius.circular(10),
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
