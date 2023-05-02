import 'package:dio/dio.dart' ;
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../model/news_model.dart';



class SearchController extends GetxController
{
  final PagingController<int, Article> searchpagingController =
  PagingController(firstPageKey: 0);
  RxInt page     = 1.obs;
  RxInt pageSize = 10.obs;
 // RxBool isLoading = false.obs;
  final searchControllerText = TextEditingController();
  final dio = Dio();

   onSearchFromApi()
   {
       searchpagingController.addPageRequestListener((page) {
       fetchNewPage();
       }); 
   }

   Future<List<Article>> searchDataFromApi() async {
  final response = await dio.get(
    "https://newsapi.org/v2/top-headlines?country=us&category=${searchControllerText.text}&apiKey=4d7078b22de54b479b19cbafdab122e0&pageSize=$pageSize&page=$page",
    options: Options(responseType: ResponseType.json),
  );
  searchControllerText.clear();
  if (response.statusCode == 200) {
    final decodedData = response.data;
    final List<dynamic> articlesData = decodedData['articles'];
    final List<Article> articles =
        articlesData.map((article) => Article.fromJson(article)).toList();
        
    return articles;
  } else {
    throw Exception('Failed to load data');
  }
  }

  
  Future<void> fetchNewPage() async {
    try {
      final newItems = await searchDataFromApi();
      final isLastPage = newItems.length < pageSize.value;
      if (isLastPage) {
           print('Last Page $page');
        searchpagingController.appendLastPage(newItems);
      } else {  
        print('\nPage $page');
         searchpagingController.appendPage(newItems, page.value++);
      }

    } catch (e) {    
       print('here error $e');
      searchpagingController.error = e;
    }
  }
}