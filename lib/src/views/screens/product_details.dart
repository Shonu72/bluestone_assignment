import 'package:bluestone_assignment/core/constants/asset_constant.dart';
import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/src/controllers/product_controller.dart';
import 'package:bluestone_assignment/src/views/widgets/circle_container.dart';
import 'package:bluestone_assignment/src/views/widgets/small_container.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productController = Get.find<ProductController>();
  dynamic product;

  void loadProductDetails() {
    productController.fetchSingleProduct(widget.productId);
    product = productController.products.firstWhere(
      (p) => p.id == widget.productId,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProductDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5.h,
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularIconButton(
              icon: Icons.arrow_back_ios,
              onPressed: () {
                context.pop();
              },
              iconColor: Colors.white,
              backgroundColor: Colors.blue.withValues(alpha: 0.7),
              padding: EdgeInsets.only(left: 10),
            ),
            Spacer(),
            Row(
              children: [
                CircularIconButton(
                  icon: Icons.favorite_border,
                  onPressed: () {
                    // Add to wishlist
                  },
                  iconColor: Colors.white,
                  backgroundColor: Colors.blue.withValues(alpha: 0.7),
                  padding: EdgeInsets.only(left: 5, right: 5),
                ),
                SizedBox(width: 1.w),
                CircularIconButton(
                  icon: Icons.share,
                  onPressed: () {
                    // Share product
                  },
                  iconColor: Colors.white,
                  backgroundColor: Colors.blue.withValues(alpha: 0.7),
                  padding: EdgeInsets.only(left: 5, right: 5),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 45.h,
            width: double.infinity,
            color: AppColors.white,
            child: CachedNetworkImage(
              imageUrl: productController.products
                      .firstWhere((p) => p.id == widget.productId)
                      .image ??
                  AssetConstant.logo,
              fit: BoxFit.contain,
              width: double.infinity,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(
                child: AppText(
                  'Error loading image',
                  style: theme.bodyMedium,
                ),
              ),
            ),
          ),

          // Product Details
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Product Name
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    product.title ?? '',
                    style: theme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 1.h),

                // Ratings & Reviews
                Row(
                  children: [
                    SmallContainer(
                      rating: product.rating?.rate.toStringAsFixed(1) ?? '',
                      reviewCount: product.rating?.count.toString() ?? '',
                      icon: Icons.star,
                    ),
                    SizedBox(width: 3.w),
                    SmallContainer(
                      rating: "",
                      reviewCount: '',
                      icon: Icons.thumb_up,
                      endText: "90%",
                      showDivider: false,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 3.w),
                    SmallContainer(
                      rating: "",
                      reviewCount: '',
                      icon: Icons.comment_bank_rounded,
                      color: AppColors.grey,
                      endText: "5",
                      showDivider: false,
                    ),
                  ],
                ),

                SizedBox(height: 2.h),

                // Price Section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.blue.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      AppText("\$${product.price.toStringAsFixed(2)}",
                          style: theme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(width: 2.w),
                      AppText("60% off ", style: theme.labelSmall),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline,
                          size: 6.w,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 2.h),
                SizedBox(
                  height: 10.h,
                  child: SingleChildScrollView(
                    child: Text(
                      product.description ?? '',
                      style: theme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40.w,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Buy Now action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                ),
                child: Text(
                  "Add to Cart",
                  style: theme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 40.w,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Buy Now action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                ),
                child: Text(
                  "Buy Now",
                  style: theme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
