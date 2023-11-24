import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import './shared/shared.dart';
import './stores/stores.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _setupStores();

  await LocalizeAndTranslate.init(
    assetLoader: const AssetLoaderRootBundleJson(
      'assets/lang/',
    ),
    supportedLanguageCodes: Helper.appLanguageCodes,
  );

  runApp(
    const MyApp(),
  );
}

void _setupStores() {
  GetIt.I.registerSingleton(TasksStore());
  GetIt.I.registerSingleton(PageViewStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      child: MaterialApp.router(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          child = LocalizeAndTranslate.directionBuilder(
            context,
            child,
          );

          return child;
        },
        theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            iconColor: AppColors.iconColor,
            prefixIconColor: AppColors.iconColor,
            suffixIconColor: AppColors.iconColor,
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            labelStyle: TextStyle(color: AppColors.inputTextColor),
            floatingLabelStyle: TextStyle(color: AppColors.inputTextColor),
            helperStyle: TextStyle(color: AppColors.inputTextColor),
            hintStyle: TextStyle(color: AppColors.inputTextColor),
            errorStyle: TextStyle(color: AppColors.inputTextColor),
            prefixStyle: TextStyle(color: AppColors.inputTextColor),
            suffixStyle: TextStyle(color: AppColors.inputTextColor),
            //filled: true,
            //fillColor: Colors.orange
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(color: AppColors.inputTextColor),
            titleLarge: TextStyle(color: AppColors.inputTextColor),
          ),
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 15,
            ),
            leadingAndTrailingTextStyle: TextStyle(
              color: AppColors.textPrimaryColor,
              fontSize: 15,
            ),
          ),
          checkboxTheme: const CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          disabledColor: AppColors.disabledColor,
          iconTheme: const IconThemeData(
            color: AppColors.iconColor,
          ),
          dialogBackgroundColor: AppColors.backgroundColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: AppColors.iconColor,
            unselectedItemColor: AppColors.disabledColor,
          ),
        ),
        routerConfig: routers,
      ),
    );
  }
}
