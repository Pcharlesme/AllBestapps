import 'package:testappbc/utils/size_config.dart';

double widthSize(double value) {
  double size = value / 4.14;
  return size * SizeConfig.widthMultiplier;
}

double heightSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.heightMultiplier;
}

double fontSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.textMultiplier;
}
