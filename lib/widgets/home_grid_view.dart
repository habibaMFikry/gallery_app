import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallery_app/services/my_gallery_service.dart';
import 'package:gallery_app/widgets/grid_view_item.dart';
import 'package:sizer/sizer.dart';

class HomeGridView extends StatefulWidget {
  final String token;
  const HomeGridView({super.key, required this.token});

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  StreamController streamController = StreamController();

  Future<void> stream() async {
    var data = await MyGalleryService().getImages(token: widget.token);
    streamController.sink.add(data);
  }

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      stream();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: StreamBuilder(
        stream: streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<dynamic> images = snapshot.data!;
            return GridView.builder(
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 3.h,
              ),
              itemBuilder: (context, index) => GridViewItem(
                image: images[index],
              ),
            );
          } else {
            return Center(
              child: Text('No images to show, upload image'),
            );
          }
        },
      ),
    );
  }
}
