import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:testappbc/utils/route.dart';
import 'package:testappbc/utils/size_config.dart';
import 'package:testappbc/views/day3/cart_model.dart';
import 'package:testappbc/views/day8/mainaoi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return Listener(
          onPointerUp: (_) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: const GetMaterialApp(
            onGenerateRoute: RoutesGenarator.getRoute,
            debugShowCheckedModeBanner: false,
            home: HomePageDay8(),

            // initialRoute: Routes.splashRoute,
            // getPages: AppPages.routes,
          ),
        );
      }),
    );
  }
}
