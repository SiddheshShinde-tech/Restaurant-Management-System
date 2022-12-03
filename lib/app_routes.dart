import 'package:isdp/index.dart';
import 'package:isdp/splashscreen/splash_screen.dart';

class AppRoutes {

  static const String SplashScreenRoute = '/splashscreen';
  static const String SignInRoute = '/signin';
  static const String SignUpRoute = '/signup';
  static const String HomeRoute = '/home';
  static const String MenuRoute = '/menu';

  static final routes = {
    SplashScreenRoute : (context) => SplashScreenWidget(),
    SignInRoute : (context) => SigninWidget(),
    SignUpRoute : (context) => SignupWidget(),
    HomeRoute : (context) => HomeWidget(),
    MenuRoute : (context) => MenuWidget(),
  };
}