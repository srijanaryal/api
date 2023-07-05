import 'package:flutter/material.dart';
import 'package:flutter_learning/project/dog/screen/dog_screen.dart';
import 'package:flutter_learning/shared/constants/providers_constant.dart';
import 'package:flutter_learning/shared/singletons/baseurl_singleton.dart';
import 'package:provider/provider.dart';

import 'shared/services/base_url_fetch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FetchUrl.getBaseUrl().then((value) {
      BaseURL.getInstance.setBaseUrl(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.listOfProviders,
      child: MaterialApp(
        title: 'Flutter Blueprint',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DogScreen(),
      ),
    );
  }
}
