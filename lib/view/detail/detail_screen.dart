
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../viewmodel/detail_viewmodel/detail_viewmodel.dart';
class DetailView extends StatelessWidget {
   DetailView({super.key});
 final DetailController detailController = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text('News'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h,),
        child: ListView(
          children: 
          [ 
             detailController.currentPlaylist.urlToImage != null 
             ?
             SizedBox(
              height: 0.5.sh,
               child: Image(
                   image: NetworkImage(detailController.currentPlaylist.urlToImage!),
                   fit: BoxFit.cover,
                  ),
             )
             :
             SizedBox(
                  height: 0.5.sh,
                  child: Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'No Image',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 10.h,),
              Text('Title: ${detailController.currentPlaylist.title}',
              maxLines: 2,
              style: TextStyle(
               fontSize: 20.sp,
               color: Colors.white,
               ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.white,
              ),
              SizedBox(height: 3.h,),
              Text('Description: ${detailController.currentPlaylist.description}',
              maxLines: 5,
              style: TextStyle(
               fontSize: 17.sp,
               color: Colors.white,
               ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.white,
              ),
              
              SizedBox(height: 3.h,),
              Text('Author: ${detailController.currentPlaylist.author}',
              style: TextStyle(
               fontSize: 15.sp,
               color: Colors.white,
               ),
              ),
               const Divider(
                thickness: 3,
                color: Colors.white,
              ),
              SizedBox(height: 3.h,),
          ],
        ),
      ),
    );
  }
}