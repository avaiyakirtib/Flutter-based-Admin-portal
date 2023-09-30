import 'package:admin/core/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/dashboard//main_screen.dart';
import 'package:admin/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: "/", routes: [
    GoRoute(
        path: "/",
        builder: ((context, state) =>
            Login(title: "Welcome to the Admin & Dashboard Panel"))),
    GoRoute(
      path: "/dashboard",
      builder: ((context, state) => MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ], child: DashboardScreen())),
    )
  ]);
}
