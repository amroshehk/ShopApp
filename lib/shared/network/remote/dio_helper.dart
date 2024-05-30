import 'package:dio/dio.dart';

import '../../components/constants.dart';


class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }
      )
    );
  }

  static Future<Response> getData({required path , required Map<String, dynamic> queryParameters }) async {
    return await dio.get(path ,queryParameters:queryParameters);
  }

  static Future<Response> postData({required path ,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data,
    String lang ='ar',
    String? token,

  }) async {
    dio.options.headers =  {
      'lang':lang,
      'Authorization':token
    };
    return await dio.post(path ,queryParameters:queryParameters, data: data);
  }

  static Future<Response> getArticlesByCategoryData(category,isEnglish) async {
    return
        await getData(path: "", queryParameters: {
        }
        );
  }

}