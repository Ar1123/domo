import 'package:flutter/material.dart';

import '../../../config/style/style.dart';

void custonAlert({
  required BuildContext context,
  required Widget body,
  required Widget footer,
  required Size size,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Center(
        child: Container(
          width: size.width * .8,
          height: size.height * .3,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              body,
              SizedBox(
              ),
              footer,
            ],
          ),
        ),
      ),
    );
