import 'package:flutter/foundation.dart';
import 'package:utilities/utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: false,
  timeout: const Duration(minutes: 60),
  allowAutoSignedCert: true,
  sendUserAgent: true,
  userAgent: "SinaMN75",
  maxRedirects: 10,
  maxAuthRetries: 3,
);

Future<void> request(
  final String url,
  final EHttpMethod httpMethod,
  final Function(Response<dynamic> response) action,
  final Function(Response<dynamic> response) error, {
  final String? queryOrMutation,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
}) async {
  final Map<String, String> header = <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""};

  if (headers != null) header.addAll(headers);

  Response<dynamic> response = Response<dynamic>();
  try {
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    if (httpMethod == EHttpMethod.get) response = await getConnect.get(url, headers: header);
    if (httpMethod == EHttpMethod.post) response = await getConnect.post(url, params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await getConnect.put(url, params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await getConnect.patch(url, params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await getConnect.delete(url, headers: header);
    if (httpMethod == EHttpMethod.query) response = await getConnect.query(queryOrMutation!, url: url, headers: headers);
    if (httpMethod == EHttpMethod.mutation) response = await getConnect.mutation(queryOrMutation!, url: url, headers: header);
  } catch (e) {
    error(response);
    logger.e("RESPONSE ERROR: $e");
  }

  if (kDebugMode) delay(100, () => response.log(params: (body == null || !encodeBody) ? "" : body.toJson()));

  if (httpMethod == EHttpMethod.query || httpMethod == EHttpMethod.mutation) {
    action(response);
  } else {
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  }
}

Future<void> httpGet({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.get, action, error, headers: headers);

Future<void> httpPost({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> httpPut({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> patch({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> httpDelete({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.delete, action, error, headers: headers);

Future<void> query({
  required String url,
  required String query,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(
      url,
      EHttpMethod.query,
      action,
      error,
      headers: headers,
      queryOrMutation: query,
    );

Future<void> mutation({
  required String url,
  required String mutation,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(
      url,
      EHttpMethod.mutation,
      action,
      error,
      headers: headers,
      queryOrMutation: mutation,
    );

enum EHttpMethod { get, post, put, patch, delete, query, mutation }

extension HTTP on Response {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void log({final String params = ""}) {
    logger.i(
      "${this.request?.method} - ${this.request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body",
    );
  }

  void prettyLog({final String params = ""}) {
    logger.i(
      "${this.request?.method} - ${this.request?.url} - $statusCode \nPARAMS: ${JsonEncoder.withIndent(" ").convert(params)} \nRESPONSE: ${JsonEncoder.withIndent(" ").convert(body)}",
    );
  }
}
