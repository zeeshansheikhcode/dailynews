
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../components/news_box.dart';
import '../../model/news_model.dart';
import '../../res/routes/route_name.dart';
import '../../viewmodel/home_viewmodel/home_viewmodel.dart';
import '../../viewmodel/search_viewmodel/search_viewmodel.dart';
class HomeView extends StatelessWidget {
   HomeView({super.key});
   
  final HomeController homeController = Get.put(HomeController());
  final SearchController searchviewmodel = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Daily News'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: 
           
         Column(
          children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: 
               [ 
                 
                 Expanded(
                 child: 
                 TextFormField
                 (
                   controller: searchviewmodel.searchControllerText,
                    
                    validator: (value) {
                   if (value!.isEmpty) {
                    return 'Please enter an address';
                    }
                    return null;
                    },
                     
                   style:const TextStyle(color: Colors.black),
                   decoration: InputDecoration(
                     hintText: 'Search',
                     focusedBorder: InputBorder.none,
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                     ), 
                    ),  
                  ),
                 ),
                 SizedBox(
                   width: 5.w,
                 ),
                 ElevatedButton(onPressed: 
                  ()
                  {
                    searchviewmodel.onSearchFromApi();
                    Get.toNamed(RouteName.searchview);
                  },
                  child:const Text('Search')
                  )
              ]),
            ),
          ),
          Expanded(
            flex: 6,
            child: 
            PagedListView<int, Article>(
              pagingController:homeController.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Article>(
                itemBuilder: (context, item, index) => Column(
                  children: [
                    NewsBox(
                      data: item,
                      ),
                    if (index == homeController.pagingController.itemList!.length- 1)
                      Container(
                        padding:const EdgeInsets.all(15.0),
                        child:const Text("No More Data"),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    ); 
  }
}
