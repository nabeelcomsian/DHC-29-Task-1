import 'package:flutter/material.dart';

import 'package:form_validation/Screens/login_screen.dart';

void main() {
  runApp(
    const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(useMaterial3: true),
        home: LoginScreen()),
  );
}
