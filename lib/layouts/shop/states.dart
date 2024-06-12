import 'package:shop_app/models/favorites/change_favorites_model.dart';

import '../../models/login/ShopLoginModel.dart';

abstract class ShopStates {}
class ShopInitialState extends ShopStates {}
class ShopChangeBottomNavState extends ShopStates {}

class ShopHomeLoadingState extends ShopStates {}

class ShopLHomeSuccessState extends ShopStates {
}

class ShopHomeErrorState extends ShopStates {
  final String error;
  ShopHomeErrorState(this.error);
}


class ShopCategoriesLoadingState extends ShopStates {}

class ShopCategoriesSuccessState extends ShopStates {
}

class ShopCategoriesErrorState extends ShopStates {
  final String error;
  ShopCategoriesErrorState(this.error);
}


class ShopChangeFavoritesState extends ShopStates {
}
class ShopSuccessChangeFavoritesState extends ShopStates {
  ChangeFavoritesModel changeFavoritesModel;
  ShopSuccessChangeFavoritesState(this.changeFavoritesModel);
}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;
  ShopErrorChangeFavoritesState(this.error);
}


class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {
}

class ShopErrorGetFavoritesState extends ShopStates {
  final String error;
  ShopErrorGetFavoritesState(this.error);
}

class ShopLoadingUserDataState extends ShopStates {}
class ShopSuccessUserDataState extends ShopStates {
  final ShopLoginModel loginModel;
  ShopSuccessUserDataState(this.loginModel);
}
class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}


