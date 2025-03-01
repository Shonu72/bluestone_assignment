import 'package:animations/animations.dart';
import 'package:bluestone_assignment/core/constants/string_constant.dart';
import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/src/controllers/product_controller.dart';
import 'package:bluestone_assignment/src/views/screens/product_details.dart';
import 'package:bluestone_assignment/src/views/screens/product_tile.dart';
import 'package:bluestone_assignment/src/views/widgets/app_bar.dart';
import 'package:bluestone_assignment/src/views/widgets/image_slider.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  final productController = Get.find<ProductController>();
  final RxBool isGridTwoColumns = true.obs;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProducts();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      productController.fetchProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return CustomAppBar.bsAppBar(
            theme: theme,
            title: "Products",
            onBack: () {},
            showLeading: false,
            suffixIcon: isGridTwoColumns.value ? Icons.grid_view : Icons.list,
            onSuffixTap: () {
              isGridTwoColumns.value = !isGridTwoColumns.value;
            },
          );
        }),
      ),
      body: Obx(() {
        if (productController.isLoading.value &&
            productController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: const ImageSlider(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const AppText(AppString.trendingProd),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                sliver: Obx(() => SliverStaggeredGrid.countBuilder(
                      key: ValueKey(isGridTwoColumns.value),
                      crossAxisCount: isGridTwoColumns.value ? 2 : 1,
                      itemCount: productController.products.length,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      itemBuilder: (context, index) {
                        return OpenContainer(
                          transitionType: ContainerTransitionType.fade,
                          transitionDuration: const Duration(milliseconds: 300),
                          closedBuilder: (context, action) {
                            return ProductTile(
                              product: productController.products[index],
                              onTap: action,
                            );
                          },
                          openBuilder: (context, action) {
                            return ProductDetails(
                              productId: productController.products[index].id,
                            );
                          },
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    )),
              ),
              if (productController.isLoading.value)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child:
                            CircularProgressIndicator(color: AppColors.blue)),
                  ),
                ),
            ],
          );
        }
      }),
    );
  }
}
