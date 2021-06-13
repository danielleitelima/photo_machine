import 'dart:typed_data';

import 'package:http/http.dart' as http;

class GeneralAPI {

  Future<Uint8List> getImage(String url) async{
    var response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

}