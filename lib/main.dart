import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'screen/home_page.dart'; 
import 'storage_service.dart'; 


void setupLocator() {
  GetIt.I.registerSingleton<StorageService>(StorageService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: MyHomePage(),
    );
  }
}
