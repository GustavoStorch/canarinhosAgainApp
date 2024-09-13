import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/models/exception/bad_request_exception.dart';
import 'package:canarinho_again_app/models/exception/internal_error_exception.dart';
import 'package:canarinho_again_app/models/http/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpClient {
  static final Client _client = InterceptedClient.build(
    interceptors: [HttpInterceptor()],
    requestTimeout: const Duration(seconds: 120),
  );

  static Future<Response> postXWWForm({
    required String route,
    required Map<String, dynamic> jsonBody,
    required authenticate,
  }) async {
    final Uri urlEndPoint = Uri.http(AppControl.appEnvironment.API, route);

    final Response response = await HttpClient._client.post(
      urlEndPoint,
      body: jsonBody,
      headers: {
        "Content-type": "application/x-www-form-urlencoded",
        if (authenticate) "Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}",
      },
    );

    return _handleHttpError("postXWWForm", response);
  }

  static Future<Response> postJson({
    required String route,
    required Map<String, dynamic> jsonBody,
    required bool authenticate,
  }) async {
    final Uri urlEndPoint = Uri.https(AppControl.appEnvironment.API, route);

     final Response response = await HttpClient._client.post(
      urlEndPoint,
      body: jsonEncode(jsonBody),
      headers: {
        "accept": "text/plain",
        "Content-Type": "application/json-patch+json",
        if (authenticate) "Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}",
      },
    );

    return _handleHttpError("postJson", response);
  }

  static Future<Response> post({
    required String route,
    required String jsonBody,
    required bool authenticate,
  }) async {
    final Uri urlEndPoint = Uri.https(AppControl.appEnvironment.API, route);

     final Response response = await HttpClient._client.post(
      urlEndPoint,
      body: jsonBody,
      headers: {
        "accept": "text/plain",
        "Content-Type": "application/json-patch+json",
        if (authenticate) "Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}",
      },
    );

    return _handleHttpError("postJson", response);
  }

  static Future<Response> get({
    required String route,
    Map<String, String>? parameters,
    String? routeUrl,
    bool authenticate = true,
  }) async {
    final Uri urlEndPoint = Uri.https(AppControl.appEnvironment.API, route, parameters);

    final Response response = await HttpClient._client.get(
      urlEndPoint,
      headers: (authenticate) ? {"Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}"} : null,
    );

    return _handleHttpError("get", response);
  }

  static Future<Response> putJson({
    Map<String, String>? parameters,
    required String route,
    required String jsonBody,
    bool authenticate = true,
  }) async {
    final Uri urlEndPoint = Uri.http(AppControl.appEnvironment.API, route, parameters);

    final Response response = await HttpClient._client.put(
      urlEndPoint,
      body: jsonBody,
      headers: {
        "Content-type": "application/json",
        if (authenticate) "Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}",
      },
    );

    return _handleHttpError("putJson", response);
  }

  static Future<Response> delete({
    required String route,
    Map<String, dynamic>? parameters,
    bool authenticate = true,
    String? jsonBody,
  }) async {
    final Uri urlEndPoint = Uri.https(AppControl.appEnvironment.API, route);

    final Response response = await HttpClient._client.delete(
      urlEndPoint,
      headers: {
        "accept": "text/plain",
        "Content-type": "application/json-patch+json",
        if (authenticate) "Authorization": "Bearer ${AcessoControl.autenticacao.accessToken}",
      },
      body: jsonBody,
    );

    return _handleHttpError("delete", response);
  }

  static Response _handleHttpError(String method, Response response) {
    int statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode <= 299) {
      return response;
    }

    if (statusCode == 500) {
      throw InternalErrorException(error: jsonDecode(response.body));
    }

    if (statusCode == 400) {
      throw BadRequestException(error: jsonDecode(response.body));
    }

    if (statusCode == 401) {
      AppControl.defineRoute(APP_DEFAULT_ROUTE);
      return response;
    }

    throw HttpException("HttpClient ($method), Response code: $statusCode, error: ${response.body}");
  }
}
