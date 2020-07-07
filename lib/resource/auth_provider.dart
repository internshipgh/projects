import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallAuthenticationAPI {
  final String _url = 'http://192.168.137.1:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await getToken();
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  getCurrentUser(apiUrl) async {
    var fullUrl = _url + apiUrl + await getToken();
    final response = await http.post(fullUrl, headers: _setHeaders());
    var user = json.decode(response.body);
    return user;
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
