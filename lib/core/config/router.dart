import 'package:fluro/fluro.dart';
import 'package:recog_plantify/presentation/modules/auth/login/login_screen.dart';
import 'package:recog_plantify/presentation/modules/auth/register/register_screen.dart';
import 'package:recog_plantify/presentation/modules/home/home_screen.dart';
import 'package:recog_plantify/presentation/modules/onboarding/onboarding_screen.dart';
import 'package:recog_plantify/presentation/modules/onboarding/onboarding_last_screen.dart';
import 'package:recog_plantify/presentation/modules/result/result_screen.dart';

class RouterMain {
  static FluroRouter router = FluroRouter();

  // Auth
  static final Handler _loginHandler =
      Handler(handlerFunc: (context, params) => const LoginScreen());
  static final Handler _registerHandler =
      Handler(handlerFunc: (context, params) => const RegisterScreen());
  
  // Onboarding
  static final Handler _onBoarding =
      Handler(handlerFunc: (context, params) => const OnboardingScreen());
  static final Handler _onBoarding4 =
      Handler(handlerFunc: (context, params) => const OnboardingLastScreen());

  static final Handler _home =
      Handler(handlerFunc: (context, params) => const HomeScreen());

  
  static final Handler _result = Handler(handlerFunc: (context, params) {
    final String response = context?.settings?.arguments as String;
    return ResultScreen(response: response);
  });

  static void setupRouter() {
    router.define('login', handler: _loginHandler, transitionType: TransitionType.inFromRight);
    router.define('register', handler: _registerHandler, transitionType: TransitionType.inFromRight);
    router.define('onboarding',
        handler: _onBoarding, transitionType: TransitionType.inFromRight);
    router.define('onboardingLast',
        handler: _onBoarding4, transitionType: TransitionType.inFromRight);
    router.define('home',
        handler: _home, transitionType: TransitionType.inFromRight);
    router.define('result',
        handler: _result, transitionType: TransitionType.inFromRight);
  }
}
