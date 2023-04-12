import 'package:flutter/material.dart';
import 'package:gallery_app/models/user_model.dart';
import 'package:gallery_app/services/auth_service.dart';
import 'package:gallery_app/views/home_view.dart';
import 'package:gallery_app/widgets/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

class LoginItem extends StatefulWidget {
  const LoginItem({super.key});

  @override
  State<LoginItem> createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Form(
        key: formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            Text(
              'LOG IN',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 74, 74, 74),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            CustomTextFormField(
              hintText: 'User Name',
              textController: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your User Name';
                }
                return null;
              },
            ),
            SizedBox(height: 3.h),
            CustomTextFormField(
              hintText: 'Password',
              textController: passController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Password';
                }
                return null;
              },
            ),
            SizedBox(height: 3.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size.fromHeight(5.h),
              ),
              onPressed: () async {
                var navigator = Navigator.of(context);
                if (formKey.currentState!.validate()) {
                  UserModel userModel = await AuthService().auth(
                    email: emailController.text,
                    password: passController.text,
                  );
                  navigator.pushReplacementNamed(
                    HomeView.routeName,
                    arguments: userModel,
                  );
                }
              },
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
