import 'dart:developer';

import 'package:domo/src/config/style/style.dart';
import 'package:domo/src/presentation/widgets/custom_widget/custom.dart';
import 'package:domo/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfessionalData extends StatelessWidget {
  ProfessionalData({Key? key}) : super(key: key);
  final TextEditingController _yearExperience = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * .06,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: InputWidget(
              labeltext: 'Experiencia en años',
              onchanged: (e) {},
              textEditingController: _yearExperience,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * .02,
              left: size.width * .06,
              right: size.width * .06,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              'Agrega las labores que dominas',
              style: textStyle(
                  color: colorText,
                  size: size.height * .02,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * .02,
              left: size.width * .06,
              right: size.width * .06,
            ),
            child: CustomContainer(
              child: ListTile(
                onTap: () {
                  log("ssssssssssss");
                },
                title: Text(
                  'Seleccionar',
                  style: textStyle(
                    color: colorText,
                    size: size.height * .02,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                trailing: Icon(
                  Icons.add_circle_outline_outlined,
                  color: colorText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
