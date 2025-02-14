import 'package:bluestone_assignment/core/helpers/dependency_injection.dart';
import 'package:bluestone_assignment/core/utils/environment.dart';
import 'package:bluestone_assignment/core/utils/theme.dart';
import 'package:bluestone_assignment/services/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await mainDependencies();
  final GoRouter router = CustomRouter.goRouter;
  runApp(MyApp(router: router));
}

Future<void> mainDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await DependenciesInjector.initializeController();
}

class MyApp extends StatefulWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: "Bluestone Ecommerce",
        routerDelegate: widget.router.routerDelegate,
        routeInformationParser: widget.router.routeInformationParser,
        routeInformationProvider: widget.router.routeInformationProvider,
        builder: EasyLoading.init(),
      ),
    );
  }
}
