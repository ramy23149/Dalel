// import 'package:dalel_app/core/functions/custom_navigation.dart';
// import 'package:dalel_app/core/routes/app_router.dart';
import 'dart:developer';

import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    log(credential!.email.toString());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
             customReplaceNavigation(AppRouter.kLogInView);
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
          child: Text(
        'HomeVeiw',
        style: TextStyle(fontSize: 30, color: Colors.black),
      )),
    );
  }
}
