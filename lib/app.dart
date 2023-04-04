import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:thunderapp/screens/carrousel/carrousel_screen.dart';
import 'package:thunderapp/screens/my%20store/my_store_screen.dart';
import 'package:thunderapp/screens/orders/orders_screen.dart';
import 'package:thunderapp/screens/payments/payments_screen.dart';
import 'package:thunderapp/screens/products/products_screen.dart';
import 'package:thunderapp/screens/screens_index.dart';
import 'package:thunderapp/screens/sign%20up/sign_up_screen.dart';
import 'package:thunderapp/screens/start/start_screen.dart';
import 'package:thunderapp/shared/constants/app_theme.dart';
import 'package:thunderapp/shared/core/navigator.dart';
import 'screens/home/home_screen.dart';
import 'screens/order detail/order_detail_screen.dart';
import 'screens/signin/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return DevicePreview.appBuilder(
            context,
            ResponsiveWrapper.builder(child,
                minWidth: 640,
                maxWidth: 1980,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(480,
                      name: MOBILE),
                  ResponsiveBreakpoint.resize(768,
                      name: TABLET),
                  ResponsiveBreakpoint.resize(1024,
                      name: DESKTOP),
                ]));
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: AppTheme().getCurrentTheme(context),
      routes: {
        Screens.splash: (BuildContext context) =>
            const SplashScreen(),
        Screens.carrousel: (BuildContext context) =>
            const CarrouselScreen(),
        Screens.start: (context) => const StartScreen(),
        Screens.home: (BuildContext context) =>
            const HomeScreen(),
        Screens.signin: (BuildContext context) =>
            const SignInScreen(),
        Screens.signUp: (context) => SignUpScreen(),
        Screens.myStore: (context) => MyStoreScreen(),
        Screens.orders: (context) => OrdersScreen(),
        Screens.orderDetail: (context) =>
            OrderDetailScreen(),
        Screens.payments: (context) => PaymentsScreen(),
        Screens.products: (context) => ProductsScreen(),
      },
    );
  }
}
