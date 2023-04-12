import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../services/upload_service.dart';

class UploadItem extends StatelessWidget {
  final String token;
  const UploadItem({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        alignment: FractionalOffset.center,
        height: 35.h,
        padding: EdgeInsets.all(1.h),
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.35),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        var navigator = Navigator.of(context);
                        PickedFile? pickedImage = await imagePicker.getImage(
                            source: ImageSource.gallery);

                        UploadService()
                            .upload(imageFile: pickedImage!.path, token: token);
                        navigator.pop();
                      },
                      child: Container(
                        width: 40.w,
                        height: 7.h,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('items/gallery.png'),
                            SizedBox(width: 2.w),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var navigator = Navigator.of(context);
                        PickedFile? pickedImage = await imagePicker.getImage(
                            source: ImageSource.camera);

                        UploadService()
                            .upload(imageFile: pickedImage!.path, token: token);
                        navigator.pop();
                      },
                      child: Container(
                        width: 40.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('items/3.png'),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
