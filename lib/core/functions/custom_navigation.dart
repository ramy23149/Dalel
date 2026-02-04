import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customPushNavigation(BuildContext context, String routePath) {
  context.push(routePath);
}
void customGoNavigation(BuildContext context, String routePath) {
  context.go(routePath);
}
