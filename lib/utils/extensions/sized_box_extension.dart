import 'package:flutter/cupertino.dart';

extension SizeBoxExtension on double {
  SizedBox get verticalSpace => SizedBox(height: this);

  SizedBox get horizontalSpace => SizedBox(width: this);
}
