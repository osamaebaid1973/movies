import 'package:flutter/material.dart';
import 'package:movies/core/routes/app_routes.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,initialRoute: AppRoutes.placeHolder,
      routes: AppRoutes.routes,
    );
  }
}
class PlaceHolderScreen extends StatelessWidget {
  const PlaceHolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('place holder'),
      ),
      body: const Center(child: Text('place holder'),
    ));
  }
}
