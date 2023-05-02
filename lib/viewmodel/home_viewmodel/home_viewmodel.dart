
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../model/news_model.dart';

class HomeController extends GetxController
{
  RxInt page     = 1.obs;
  RxInt pageSize = 10.obs;

  final dio = Dio();
  final PagingController<int, Article> pagingController =
  PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((page) {
      fetchNewPage();
    });
  
  }

   

   Future<List<Article>> getDataFromApi() async {
  final response = await dio.get(
    "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4d7078b22de54b479b19cbafdab122e0&pageSize=$pageSize&page=$page",
    options: Options(responseType: ResponseType.json),
  );
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
      final newItems = await getDataFromApi();
       
      final isLastPage = newItems.length < pageSize.value;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {  
       pagingController.appendPage(newItems, page.value++);
      }

    } catch (e) {
      pagingController.error = e;
    }
  }

  

}