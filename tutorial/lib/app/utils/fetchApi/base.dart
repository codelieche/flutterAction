// 习惯了用fetch，所以命名叫fetchApi
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

// 错误事件
import '../events/eventBus.dart';

// 实例化api
Dio fetchApi = Dio();

// 实例化函数
initFetchApi() async {
  // baseUrl
  String baseUrl = "http://192.168.6.1:9000";

  // 连接服务器超时时间（毫秒）
  int connectTimout = 5000; // 5秒
  fetchApi.options.baseUrl = baseUrl;
  fetchApi.options.connectTimeout = connectTimout;

  // Cookie持久化
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  // print("appDocPath: $appDocPath");

  // 实例化CookieJar
  var cookieJar = PersistCookieJar(dir: "$appDocPath/cookies");

  // dio.interceptors..add(LogInterceptor())..add(CookieManager(cookieJar));
  fetchApi.interceptors..add(CookieManager(cookieJar));

  // 添加拦截器
  fetchApi.interceptors.add(InterceptorsWrapper(
    // 发起请求的时候
    onRequest: (RequestOptions options) async {
      // print(options.headers);
      return options;
    },

    // 获取到响应的时候
    onResponse: (Response response) async {
      // print(response.data);
      // 在返回响应数据之前做一些预处理
      return response;
    },

    // 当出现错误的时候
    onError: (DioError e) async {
      int statusCode = e.response.statusCode;
      // 触发事件
      // print("触发事件:$statusCode");

      // 处理
      switch (statusCode) {
        case 401:
          {
            // 跳转登录页
            eventBus.fire(FetchApiError(401));
            break;
          }
        case 403:
          {
            eventBus.fire(FetchApiError(403));
            break;
          }
        case 404:
          {
            // 跳转404页
            eventBus.fire(FetchApiError(404));
            break;
          }
        default:
          {
            if (statusCode >= 500) {
              eventBus.fire(FetchApiError(500));
            }
          }
      }

      return e;
    },
  ));
}
