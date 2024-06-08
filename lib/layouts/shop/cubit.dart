import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layouts/shop/states.dart';
import 'package:shop_app/models/categories/categories_model.dart';
import 'package:shop_app/models/favorites/change_favorites_model.dart';
import 'package:shop_app/models/home/home_model.dart';
import 'package:shop_app/shared/components/constants.dart';

import '../../models/favorites/favorites_model.dart';
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
  Map<int, bool> favorites = {};

  void getHome() {
    emit(ShopHomeLoadingState());
    DioHelper.getData(path: HOME,token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products.forEach((element) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      });
      print(homeModel!.toString());
      print(value.data.toString());

      emit(ShopLHomeSuccessState());
    }).catchError((error) {
      print(error);
      emit(ShopHomeErrorState(error));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    // emit(ShopCategoriesLoadingState());
    DioHelper.getData(path: CATEGORIES ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(value.data.toString());
      emit(ShopCategoriesSuccessState());
    }).catchError((error) {
      print(error);
      emit(ShopCategoriesErrorState(error));
    });
  }


  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;

    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      path: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(ShopErrorChangeFavoritesState(error));
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      path: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState(error));
    });
  }
}



