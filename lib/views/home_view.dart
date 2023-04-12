import 'package:flutter/material.dart';
import 'package:gallery_app/models/user_model.dart';
import 'package:gallery_app/views/login_view.dart';
import 'package:gallery_app/widgets/home_grid_view.dart';
import 'package:gallery_app/widgets/upload_item.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home-view';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'items/item3.png',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 28, color: Colors.grey[700]),
                      ),
                      Text(
                        userModel.user['name'],
                        style: TextStyle(fontSize: 28, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w, top: 1.h),
                  child: CircleAvatar(
                    maxRadius: 3.h,
                    child: Image.asset('items/item4.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.grey[200],
                  ),
                  icon: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                  label: Text(
                    'log out',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.grey[200],
                  ),
                  icon: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 247, 228, 57),
                    child: Icon(
                      Icons.arrow_upward,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => UploadItem(
                        token: userModel.token,
                      ),
                    );
                  },
                  label: Text(
                    'upload',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            Expanded(
              child: HomeGridView(token: userModel.token),
            )
          ],
        ),
      ]),
    );
  }
}
