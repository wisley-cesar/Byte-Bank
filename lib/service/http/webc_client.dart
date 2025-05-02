import 'dart:convert';

import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/Model/my_transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';
import 'package:sqflite/sqflite.dart';

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

const String url = 'http://localhost:8080/transactions';

final Client client = InterceptedClient.build(
  interceptors: [LoggerInterceptor()],
);

Future<List<MyTransaction>> findAll() async {
  // Corrigido: 'findeAll' para 'findAll'
  final response = await client.get(Uri.parse(url));

  final List<dynamic> decodeJson = jsonDecode(response.body);

  // print('decodeJson: $decodeJson');

  final List<MyTransaction> transactions = [];

  for (Map<String, dynamic> transactionJson in decodeJson) {
    final Map<String, dynamic> conctactJson = transactionJson['contact'];

    final MyTransaction transaction = MyTransaction(
      value: transactionJson['value'],
      contact: Contact(
        id: 0,
        name: conctactJson['name'],
        accountNumber: conctactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

void save(MyTransaction transaction) async {
  final Map<String, dynamic> transactionsMap = {
    'value': transaction.value,
    'contact': {
      'id': transaction.contact.id,
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    },
  };
  final String transactionsJson = jsonEncode(transactionsMap);

  client.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json', 'password': '1000'},
    body: transactionsJson,
  );
}
