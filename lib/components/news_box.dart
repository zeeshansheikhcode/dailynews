import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/news_model.dart';
import '../res/routes/route_name.dart';
class NewsBox extends StatelessWidget {
  final Article data;
  const NewsBox({
    super.key, 
    required this.data});
  @override
  Widget build(BuildContext context) {
    
    return 
    GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, RouteName.detailview,
         
          arguments: data);
      } ,
      child: Container
      (
        height: 200.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        decoration:const BoxDecoration(
          color: Colors.white
        ),
        child:Stack(
          children: 
          [  
            if (data.urlToImage != null)
              Image(
                image: NetworkImage(data.urlToImage!),
                fit: BoxFit.cover,
              )
            else
              SizedBox(
                width: double.infinity,
                height: double.infinity,
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
            Positioned(
              bottom: 0,
              child: 
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                height: 50.h,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 217, 210, 187)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( data.title ?? 'No Title' , 
                    style:const 
                    TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                     ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    ),
                    Text(data.description ?? 'No Description' ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const 
                    TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    ),
                  ],
                ),
              )
             )
          ],
        )
      ),
    );
  }
}