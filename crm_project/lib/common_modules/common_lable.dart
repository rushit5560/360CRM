import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonLable extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final String title;
  final IconData icon;

  const CommonLable(
      {super.key,
      required this.color,
      required this.bgColor,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9.h,
      width: Get.width,
      // color: Colors.black,
      child: Stack(
        children: [
          Positioned(
            top: 1.5.h,
            bottom: 1.5.h,
            child: Container(
              height: 7.h,
              width: Get.width,
              color: color,
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              left: 2.w,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: bgColor,
                    radius: 4.2.h,
                    child: CircleAvatar(
                      backgroundColor: color,
                      radius: 4.h,
                      child: Center(
                        child: Icon(
                          icon,
                          color: bgColor,
                          size: 5.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20.sp, color: bgColor),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
