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

