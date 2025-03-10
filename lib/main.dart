import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/dependency_injection.dart';
import 'package:movies/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GlobalLoaderOverlay(
          overlayWidgetBuilder: (progress) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
                value: progress,
              ),
            );
          },
          overlayColor: Colors.transparent.withOpacity(.7),
          child: MaterialApp(
             theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.white, // Cursor color
                selectionColor:
                    Colors.white.withOpacity(0.5), // Selected text background
                selectionHandleColor: Colors.white, // Handle color
              ),
            ),
            debugShowCheckedModeBanner: false,
            // theme: themeData,
            initialRoute: AppRoutes.home,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}

// class PlaceHolderScreen extends StatelessWidget {
//   const PlaceHolderScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('place holder'),
//       ),
//       body: const Center(child: Text('place holder'),
//     ),
//     );
//   }
// }
