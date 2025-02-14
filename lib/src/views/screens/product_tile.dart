import 'package:bluestone_assignment/core/constants/asset_constant.dart';
import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/src/model/product_response.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductTile extends StatelessWidget {
  final ProductResponse product;
  final VoidCallback onTap;

  const ProductTile({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    product.image.isNotEmpty
                        ? product.image
                        : AssetConstant.logo,
                    height: 40.h,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        AppText(
                          product.rating.rate.toStringAsFixed(1),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: AppColors.white, size: 16),
                        SizedBox(width: 4),
                        AppText(
                          "|  ${product.rating.count}",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    product.title,
                  ),
                  SizedBox(height: 4),
                  AppText(
                    product.category,
                  ),
                  SizedBox(height: 8),
                  AppText(
                    "\$${product.price.toStringAsFixed(2)}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
