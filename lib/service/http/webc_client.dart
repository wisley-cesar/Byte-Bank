import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class LoggerInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print('----- Request -----');
    print('${request.toString()}');
    print('Url: ${request.url}');
    print('Method: ${request.method}');
    print('Headers: ${request.headers}');
    if (request is Request) {
      print('Body: ${request.body}');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('----- Response -----');
    print('Code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    if (response is Response) {
      print('Body: ${response.body}');
    }
    return response;
  }
}

void findAll() async {
  // Corrigido: 'findeAll' para 'findAll'
  final Client client = InterceptedClient.build(
    interceptors: [LoggerInterceptor()],
  );
  final response = await client.get(
    Uri.parse('http://192.168.1.16:8080/transactions'),
  );
}
