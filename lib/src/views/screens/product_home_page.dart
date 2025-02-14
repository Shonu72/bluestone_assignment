import 'package:animations/animations.dart';
import 'package:bluestone_assignment/src/controllers/product_controller.dart';
import 'package:bluestone_assignment/src/views/screens/product_details.dart';
import 'package:bluestone_assignment/src/views/screens/product_tile.dart';
import 'package:bluestone_assignment/src/views/widgets/app_bar.dart';
import 'package:bluestone_assignment/src/views/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  final productController = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar.bsAppBar(
        theme: theme,
        title: "Products",
        onBack: () {},
        showLeading: false,
        suffixIcon: Icons.grid_view,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 1.h),
            const ImageSlider(),
            SizedBox(
              height: 60.h,
              child: Obx(() {
                if (productController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.products.length,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OpenContainer(
                        transitionType: ContainerTransitionType.fade,
                        transitionDuration: const Duration(milliseconds: 300),
                        closedBuilder: (context, action) {
                          return ProductTile(
                            product: productController.products[index],
                            onTap: () {},
                          );
                        },
                        openBuilder: (context, action) {
                          return ProductDetails(
                            productId: productController.products[index].id,
                          );
                        },
                      );
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
