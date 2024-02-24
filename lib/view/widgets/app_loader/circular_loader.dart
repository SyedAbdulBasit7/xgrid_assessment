import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_constants/app_colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: IgnorePointer(
            ignoring: false,
            child: Container(
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (Platform.isIOS)
                    const CupertinoActivityIndicator(
                      color: AppColors.primary,
                      radius: 16,
                    )
                  else
                    const SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        backgroundColor: AppColors.shadowRed,
                        strokeWidth: 6,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> showLoader(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CircularLoader();
      },
    );
  }

  static void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }
}
