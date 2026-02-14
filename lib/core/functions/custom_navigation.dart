import 'package:dalel_app/core/routes/app_router.dart';


// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// BuildContext get appContext => navigatorKey.currentState!.context;


void customPushNavigation(String routePath) {
  AppRouter.router.push(routePath);
}
void customGoNavigation(String routePath) {
  AppRouter.router.go(routePath);
}

void customReplaceNavigation(String routePath) {
  AppRouter.router.replace(routePath);
}
