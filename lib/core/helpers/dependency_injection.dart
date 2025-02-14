import 'package:bluestone_assignment/core/constants/api_config.dart';
import 'package:bluestone_assignment/services/api/api_base_client.dart';
import 'package:bluestone_assignment/services/api/product_api_service.dart';
import 'package:bluestone_assignment/src/controllers/product_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependenciesInjector {
  static Future<void> initializeController() async {
    _injectDio();

    // Inject ApiBaseClientService
    Get.lazyPut<ApiBaseClientService>(() => ApiBaseClientService());

    // Inject ProductApiService with the required ApiBaseClientService
    Get.lazyPut<ProductApiService>(
        () => ProductApiService(Get.find<ApiBaseClientService>()));

    // Inject ProductController with ProductApiService
    Get.lazyPut<ProductController>(() =>
        ProductController(productApiService: Get.find<ProductApiService>()));
  }

  static void deleteControllers() {
    Get.deleteAll();
  }

  static void _injectDio() {
    final dio = Dio(BaseOptions(baseUrl: ApiConfig.baseURL));
    Get.lazyPut<Dio>(() => dio);
  }
}
