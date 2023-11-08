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
        ),
        routerConfig: routers,
      ),
    );
  }
}
