import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/res/fonts.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/routes/routes.dart';
import 'package:tech_media/view/splash/splash_screen.dart';
import 'package:tech_media/res/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
              fontSize: 32,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor,
              fontWeight: FontWeight.w500),
          headline3: TextStyle(
              fontSize: 28,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor,
              fontWeight: FontWeight.w500),
          headline4: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor,
              fontWeight: FontWeight.w500),
          headline5: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor,
              fontWeight: FontWeight.w500),
          headline6: TextStyle(
              fontSize: 17,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextTextColor,
              fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              fontSize: 17,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700),
          bodyText2: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.sfProDisplayRegular,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
          caption: TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
        ),
      ),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
