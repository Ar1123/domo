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
          _text(text: 'Ciudad de residencia', size: size),
          _tapContainer(
            size: size,
            action: () {
              _modalSheet(
                context: context,
                size: size,
              );
            },
          ),
          _text(text: 'Agrega las labores que dominas', size: size),
          _tapContainer(
            size: size,
            action: () {},
          ),
          SizedBox(
            height: size.height * .02,
          ),
          ButtonWidget(
            backGroundColor: colorText,
            borderColor: colorText,
            textColor: whiteColor,
            text: 'Guardar',
            action: () {
              Navigator.pushNamed(context, 'listServicePage');
            },
          ),
        ],
      ),
    );
  }

  Widget _text({
    required String text,
    required Size size,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: size.height * .02,
          left: size.width * .06,
          right: size.width * .06,
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: textStyle(
              color: colorText,
              size: size.height * .02,
              fontWeight: FontWeight.normal),
        ),
      );

  Widget _tapContainer({
    required Size size,
    required Function() action,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: size.height * .01,
          left: size.width * .06,
          right: size.width * .06,
        ),
        child: CustomContainer(
          child: ListTile(
            onTap: action,
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
      );
  void _modalSheet({
    required BuildContext context,
    required Size size,
  }) =>
      showBottomSheet(
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 10,
        context: context,
        builder: (context) => Container(
          height: size.height * .4,
          width: size.width,
          child: Column(
            children: [],
          ),
        ),
      );
}
