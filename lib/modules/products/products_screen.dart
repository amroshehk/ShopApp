import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home/home_model.dart';

import '../../layouts/shop/cubit.dart';
import '../../layouts/shop/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<ShopCubit, ShopStates>(
        builder: (BuildContext context, ShopStates state) {
          ShopCubit cubit = ShopCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) =>
                productBuilder(cubit.homeModel?.data?.banners),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
        listener: (BuildContext context, ShopStates state) {},
      ),
    );
  }

  Widget productBuilder(List<BannerModel>? banners) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items: banners?.map((banner) {
            return Image(
              image: NetworkImage('${banner.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            );
          }).toList(),
        )
      ],
    );
  }
}
