import 'package:covid/screens/case_page.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xff395B64))),
      routes: {
        '/': (context) => const HomePage(),
        'case_page': (context) => const CasePage(),
      },
    ),
  );
}
