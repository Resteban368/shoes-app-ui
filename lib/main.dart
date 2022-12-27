import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/pages/zapato_page.dart';

import 'src/models/zapatoModel.dart';

void main() {
  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ZapatoModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ZapatpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
