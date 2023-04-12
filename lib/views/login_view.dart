import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery_app/widgets/login_item.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  static const routeName = 'login-view';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('items/item1.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 8.h),
            child: Image.asset('items/item2.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromARGB(255, 74, 74, 74),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Gallery',
                style: TextStyle(
                    fontSize: 28.sp,
                    color: const Color.fromARGB(255, 74, 74, 74),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.5.h),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 42.h,
                      width: 85.w,
                      child: const LoginItem(),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
