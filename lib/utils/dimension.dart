import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dimension {
  static Size size = PlatformDispatcher.instance.views.first.physicalSize;
  static double deviceHeight = size.height;
  static double deviceWidth = size.width;

  static double height10 = deviceHeight / 214;
  static double height5 = deviceHeight / 428;
  static double height15 = deviceHeight / 143;
  static double height20 = deviceHeight / 107;
  static double height25 = deviceHeight / 90;
  static double height30 = deviceHeight / 72;

  static double sliderListHeight = deviceHeight / 10.75;
  static double categoryWidgetHeight = deviceHeight / 19.5;
  static double categoryWidgetWidth = deviceWidth / 8.3;

  static double width10 = deviceWidth / 108;
  static double width5 = deviceWidth / 216;
  static double width15 = deviceWidth / 72;
  static double width20 = deviceWidth / 54;
  static double width30 = deviceWidth / 36;
  static double searchBoxWidth = deviceWidth / 4.7;

  static double font14 = deviceHeight / 153;
  static double font15 = deviceHeight / 143;

  static double radius12 = deviceWidth / 90;

  static double icon10 = deviceWidth / 108;
  static double icon20 = deviceWidth / 54;
}