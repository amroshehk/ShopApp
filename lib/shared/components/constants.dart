

import '../../modules/login/shop_login_screen.dart';
import '../shared_preferences.dart';
import 'components.dart';

String baseUrl = "https://student.valuxapps.com/api/";


String IS_ON_BPARDING_NEEDED = "isOnBoardingNeeded";
String USER_TOKEN = "userToken";
String token = '';

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  )?.then((value)
  {
    if (value)
    {
      navigateToAndFinish(
        context,
        ShopLoginScreen(),
      );
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
