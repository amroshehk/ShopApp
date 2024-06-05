import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/shop/states.dart';
import 'package:shop_app/models/home/home_model.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../modules/categories/categories_screen.dart';
import '../../modules/favorites/favorites_screen.dart';
import '../../modules/products/products_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  void getHome() {
    emit(ShopHomeLoadingState());
    DioHelper.getData(path: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.toString());
      print(value.data.toString());
      emit(ShopLHomeSuccessState());
    }).catchError((error) {
      print(error);
      emit(ShopHomeErrorState(error));
    });
  }
}
