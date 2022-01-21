import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpHelper {

  //get data data response from API
  Future<Response> getResponse({required String url}) async {
    Response response = await http.get(Uri.parse(url));
    return response;
    // json.decode(response.body).map((i) => model.fromJson(i)).toList();
  }

}
