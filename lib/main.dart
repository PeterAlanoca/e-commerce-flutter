import 'package:e_commerce_flutter/application/product/product_state.dart';
import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/presentation/screens/login/login_creen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('users'); 
  await Hive.openBox('products');

  final container = ProviderContainer();
  await container.read(productProvider.notifier).preload(products);

  runApp(
    UncontrolledProviderScope(container: container, child: const MyApp()),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: accentColor, width: 2),
          ),
          labelStyle: TextStyle(
            color: textLightColor,
          ),
          floatingLabelStyle: TextStyle(
            color: textLightColor,
          ),
          hintStyle: TextStyle(
            color: textLightColor,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
