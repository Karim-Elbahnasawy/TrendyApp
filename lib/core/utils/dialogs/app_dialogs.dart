import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

class AppDialogs {
 static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: CupertinoAlertDialog(
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

 static void showDialogMessgage(String message,Color bgColor) {
   Fluttertoast.showToast(
        msg: message,
        backgroundColor: bgColor,
        fontSize: 20,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
  }
}
