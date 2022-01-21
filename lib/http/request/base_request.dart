import 'package:flutter/material.dart';

enum HttpMethod { GET, POST, DELETE }

abstract class BaseRequest {

  var pathParams;
  var useHttps = true;
  Map<String, String> params = Map();
  Map<String, dynamic> header = Map();

  String authority() {
    return "api.devio.org";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    if (useHttps) {
      uri = Uri.https(authority(), path(), params);
    } else {
      uri = Uri.http(authority(), path(), params);
    }
    print("url:${uri.toString()}");
    return uri.toString();
  }

  bool needLogin();

  //添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  //添加参数
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}
