import 'package:bluestone_assignment/core/constants/api_config.dart';
import 'package:bluestone_assignment/core/errors/failure.dart';
import 'package:bluestone_assignment/core/helpers/helpers.dart';
import 'package:bluestone_assignment/services/api/api_base_client.dart';
import 'package:bluestone_assignment/src/model/product_response.dart';
import 'package:dartz/dartz.dart';

class ProductApiService {
  final ApiBaseClientService _apiBaseClientService;

  ProductApiService(this._apiBaseClientService);

  Future<Either<Failure, List<ProductResponse>>> fetchProducts() async {
    try {
      final response = await _apiBaseClientService.request(
          endpoint: ApiConfig.products,
          method: HttpMethod.get.name,
          queryParams: {
            'limit': '5',
          });

      final List<ProductResponse> products = [];
      for (var product in response.data) {
        products.add(ProductResponse.fromJson(product));
      }
      return Right(products);
    } catch (e) {
      Helpers.logger.e(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // fetch single product
  Future<Either<Failure, ProductResponse>> fetchSingleProduct(int id) async {
    try {
      final response = await _apiBaseClientService.request(
          endpoint: '${ApiConfig.products}/$id', method: HttpMethod.get.name);

      return Right(ProductResponse.fromJson(response.data));
    } catch (e) {
      Helpers.logger.e(e);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
