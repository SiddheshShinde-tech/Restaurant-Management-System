import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isdp/app_providers/app_providers.dart';
import 'package:isdp/app_routes.dart';
import 'package:isdp/repeat/internationalization.dart';
import 'package:isdp/signin/signin_widget.dart';
import 'package:isdp/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/supabase_credentials.dart';
import 'repeat/repeat_theme.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: SupabaseCredentials.APIURL,
    anonKey: SupabaseCredentials.APIKEY,
    // url: dotenv.env['SUPABASE_URL'],
    // anonKey: dotenv.env['SUPABASE_ANON_KEY']
  );

  runApp(Core());
}

class Core extends StatelessWidget {
  const Core({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MyApp(), providers: AppProviders.providers);
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = RepEatTheme.themeMode;

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        RepEatTheme.saveThemeMode(mode);
      });

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // initialRoute: AppRoutes.HomeRoute,
        routes: AppRoutes.routes,
        title: 'isdp',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        home: AnimatedSplashScreen(splash: 'assets/images/logo.png', nextScreen: SigninWidget(),splashTransition: SplashTransition.fadeTransition,));

  }
}
