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
            //hintStyle: TextStyle(color: AppColors.inputTextColor),
            //labelStyle: TextStyle(color: AppColors.inputTextColor),
            //suffixStyle: TextStyle(color: AppColors.inputTextColor),
          ),
          /*textTheme: const TextTheme(
            bodySmall: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            titleMedium: TextStyle(color: AppColors.inputTextColor),
          ),*/
          primaryColor: Colors.white,
          colorScheme: const ColorScheme(
            primary: Colors.white,
            brightness: Brightness.dark,
            onPrimary: Colors.white,
            secondary: Colors.black,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: AppColors.backgroundColor,
            onBackground: AppColors.backgroundColor,
            surface: Colors.white,
            onSurface: Colors.white,
          ),
          listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(
              color: AppColors.textPrincipalColor,
              fontSize: 15,
            ),
            leadingAndTrailingTextStyle: TextStyle(
              color: AppColors.textPrincipalColor,
              fontSize: 15,
            ),
          ),
          disabledColor: AppColors.disabledColor,
          iconTheme: const IconThemeData(
            color: AppColors.iconColor,
          ),
          iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.disabledColor;
                  }

                  return AppColors.iconColor;
                },
              ),
            ),
          ),
          textTheme: const TextTheme(
            subtitle2: TextStyle(
              color: AppColors.textSecondaryColor,
            ), // Estilo para os campos de texto
          ),
        ),
        routerConfig: routers,
      ),
    );
  }
}
