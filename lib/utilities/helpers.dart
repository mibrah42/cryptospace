import 'package:flutter/material.dart';

import 'constants.dart';

Icon getPrefixIcon(double percentChange, {Color? color}) {
  return percentChange <= 0
      ? Icon(
          Icons.arrow_drop_down_rounded,
          size: 32,
          color: color ?? kRedColor,
        )
      : Icon(
          Icons.arrow_drop_up_rounded,
          size: 32,
          color: color ?? kGreenColor,
        );
}
