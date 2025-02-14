import 'package:bluestone_assignment/services/routes/route_path.dart';
import 'package:bluestone_assignment/src/views/screens/product_details.dart';
import 'package:bluestone_assignment/src/views/screens/product_home_page.dart';
import 'package:bluestone_assignment/src/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  static GoRouter goRouter = GoRouter(
      navigatorKey: Get.key,
      initialLocation: RoutePath.initial,
      routes: [
        GoRoute(
          path: RoutePath.initial,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RoutePath.home,
          builder: (context, state) {
            return const ProductHomePage();
          },
        ),
        GoRoute(
          path: RoutePath.details,
          builder: (context, state) {
            final productId = int.parse(state.pathParameters['productId']!);
            return ProductDetails(productId: productId);
          },
        ),
      ]);
}
