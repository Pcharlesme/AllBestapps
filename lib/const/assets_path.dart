const String imageAssetRoot = "assets/";

//icons  assets
// final String facebook = _getImagePath("svg/facebook.svg");
final String splash = _getImagePath("icons/famechat.svg");

//images assetsPath
final String splashlogo = _getImagePath("images/logo.png");
final String day1one = _getImagePath("images/one.jpg");
final String day1two = _getImagePath("images/two.jpg");
final String day1three = _getImagePath("images/three.jpg");
final String day1four = _getImagePath("images/four.jpg");

//lottie assetsPath
final String success = _getImagePath("lottie/success.json");

String _getImagePath(String imageName) => imageAssetRoot + imageName;
