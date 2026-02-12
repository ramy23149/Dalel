import 'package:dalel_app/core/app/dalel_app.dart';
import 'package:go_router/go_router.dart';

void customPushNavigation(String routePath) {
  appContext.push(routePath);
}
void customGoNavigation(String routePath) {
  appContext.go(routePath);
}
