import 'package:flutter/material.dart';
import 'package:todoshka/pages/enter_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoshka/routes/router.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: EntrancePage.routeName,
      onGenerateRoute: AppRouter.generateRoutes,
      routes: {
        EntrancePage.routeName: (_) => const EntrancePage(),
      },
    );
  }
}




/*

 */