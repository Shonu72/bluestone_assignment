import 'package:bluestone_assignment/core/helpers/helpers.dart';
import 'package:bluestone_assignment/services/api/product_api_service.dart';
import 'package:bluestone_assignment/src/model/product_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late final ProductApiService _productApiService;
  
  ProductController({required ProductApiService productApiService})
      : _productApiService = productApiService;

  final products = <ProductResponse>[].obs;
  RxBool isLoading = false.obs;

// fetch all products
  Future<void> fetchProducts() async {
    isLoading.value = true;
    final successOrFailure = await _productApiService.fetchProducts();
    successOrFailure.fold(
      (failure) {
        isLoading.value = false;
        Helpers.logger.e(failure);
      },
      (response) {
        isLoading.value = false;
        products.value = response;
      },
    );
  }

  // fetch single product
  Future<void> fetchSingleProduct(int id) async {
    isLoading.value = true;
    final successOrFailure = await _productApiService.fetchSingleProduct(id);
    successOrFailure.fold(
      (failure) {
        isLoading.value = false;
        Helpers.logger.e(failure);
      },
      (response) {
        isLoading.value = false;
        products.value = [response];
      },
    );
  }
}
