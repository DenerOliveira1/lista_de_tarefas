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
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
          useMaterial3: true,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            iconColor: AppColors.iconColorEnabled,
            prefixIconColor: AppColors.iconColorEnabled,
            suffixIconColor: AppColors.iconColorEnabled,
            disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.inputBorderColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(25))),
            hintStyle: TextStyle(color: AppColors.inputTextColor),
            labelStyle: TextStyle(color: AppColors.inputTextColor),
          ),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: AppColors.inputTextColor),
          ),
          disabledColor: Colors.grey,
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
                  /*if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  }*/

                  return Colors.blue;
                },
              ),
            ),
          ),
        ),
        routerConfig: routers,
      ),
    );
  }
}
