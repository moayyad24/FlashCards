import 'package:flashcards/core/theme/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future showAppToast(String message) async {
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.grey,
      textColor: AppColors.white,
      fontSize: 16.0);
}
