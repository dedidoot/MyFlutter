import 'package:http/http.dart';

class HeadersClient extends BaseClient {
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['test1'] = "x1";
    request.headers['test2'] = "x2";
    request.headers['test3'] = "x3";
    return Client().send(request);
  }
}
