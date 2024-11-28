import 'package:teste_be_talent/app/data/http/http_client_employee.dart';
import 'package:http/http.dart' as http;

class HttpClientEmployeeImpl implements HttpClientEmployee {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
