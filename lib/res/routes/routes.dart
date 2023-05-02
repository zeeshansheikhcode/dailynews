
import 'package:get/get.dart';
import '../../model/news_model.dart';
import '../../view/detail/detail_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/search/search_view.dart';
import '../../view/splash_view.dart';
import '../../viewmodel/detail_viewmodel/detail_viewmodel.dart';
import 'route_name.dart';

class AppRoutes 
{
  static appRoutes() => 
  [
    GetPage(
      name: RouteName.splashScreen, page: ()=>const SplashView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
    
     GetPage(
      name: RouteName.homeview, page: ()=> HomeView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.searchview, page: ()=> SearchView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade
     ),
     GetPage(
      name: RouteName.detailview, page: () => DetailView(),
      transitionDuration:const Duration(milliseconds: 250), 
      transition: Transition.leftToRightWithFade,
      binding: BindingsBuilder(() {
      Get.lazyPut(() => DetailController());
     }),
     arguments: Article(),
     ),
  ];
}