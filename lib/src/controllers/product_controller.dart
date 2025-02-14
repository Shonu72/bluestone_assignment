import 'package:bluestone_assignment/core/helpers/helpers.dart';
import 'package:bluestone_assignment/services/api/product_api_service.dart';
import 'package:bluestone_assignment/src/model/product_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late final ProductApiService _productApiService;

  ProductController({required ProductApiService productApiService})
      : _productApiService = productApiService;

  final products = <ProductResponse>[].obs;
  final selectedProduct = Rx<ProductResponse?>(null);
  RxBool isLoading = false.obs;

  // Fetch all products
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

  // Fetch single product
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
        ProductResponse newProduct =
            ProductResponse.fromJson(response.toJson());
        bool isDuplicate =
            products.any((product) => product.id == newProduct.id);
        if (!isDuplicate) {
          products.add(newProduct);
        }
      },
    );
  }

  void clearSelectedProduct() {
    selectedProduct.value = null;
  }
}
