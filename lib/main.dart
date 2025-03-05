import 'package:flutter/material.dart';
import 'package:movies/core/widgets/main_text_form_field.dart';
import 'package:movies/core/constants/app_images_paths.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MainTextFormField(
            controller: TextEditingController(),
            prefixIcon: Icon(Icons.abc),
            hintText: "Password",
            validator: (x) {},
          ),
        ),
      ),
    );
  }
}
