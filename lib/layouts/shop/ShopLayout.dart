import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/shop/cubit.dart';
import 'package:shop_app/layouts/shop/states.dart';
import 'package:shop_app/modules/search/search_screen.dart';

import '../../modules/login/shop_login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/shared_preferences.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getHome()..getCategories()..getFavorites()..getUserData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        builder: (BuildContext context,ShopStates state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Salla'),
              actions: [
                IconButton(onPressed: () {
                  navigateTo(context, const SearchScreen());
                }, icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(items:
            [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNav(value);
            },),
            body: cubit.bottomScreens[cubit.currentIndex],
          );
        },
        listener: (BuildContext context, ShopStates state) {},
      ),
    );
  }


}
