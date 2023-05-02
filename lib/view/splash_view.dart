import 'dart:async';
import 'package:flutter/material.dart';

import '../res/routes/route_name.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds:3),
    () 
     {
       Navigator.pushNamed(context, RouteName.homeview);
     });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}