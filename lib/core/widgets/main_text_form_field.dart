import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_images_paths.dart';

class MainTextFormField extends StatefulWidget {
  String? Function(String?) validator;
  Widget prefixIcon;
  String hintText;
  TextEditingController controller;

  MainTextFormField(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
      required this.validator,
      required this.controller});

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  //Widget? suffixIcon;
  String imagePath = AppImagesPaths.eyeOn;
   

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: widget.prefixIcon,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: const Color(0XFF282A28),
        hintText: widget.hintText,
        suffixIcon: widget.hintText.contains("Password")
            ? GestureDetector(
                onTap: () {
                  if (imagePath == AppImagesPaths.eyeOn) {
                    setState(() {
                      imagePath = AppImagesPaths.eyeOff;
                    });
                  } else {
                    setState(() {
                      imagePath = AppImagesPaths.eyeOn;
                    });
                  }
                },
                child: Image.asset(imagePath),
              )
            : null,
      ),
    );
  }
}
