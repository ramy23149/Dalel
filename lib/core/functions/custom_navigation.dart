import 'package:dalel_app/core/routes/app_router.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// BuildContext get appContext => navigatorKey.currentState!.context;

void customPushNavigation(String routePath, {Object? arguments}) {
  AppRouter.router.push(routePath, extra: arguments);
}

void customGoNavigation(String routePath) {
  AppRouter.router.go(routePath);
}

void customReplaceNavigation(String routePath, {Object? arguments}) {
  AppRouter.router.replace(routePath,extra: arguments);
}
