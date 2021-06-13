import 'dart:io';

import 'package:photo_machine/data/dto/photo_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UnsplashAPI {

  final key = 'HIfCUiJKMoasScfIStATH6rl3Chj0ks-MGGGJimft-Y';
  final path = 'api.unsplash.com';

  Future<List<PhotoDTO>> getRandomPhotoList(int count) async{
    final endpoint = '/photos/random';

    final queryParameters = {
      'client_id': key,
      'count': count.toString(),
    };

    final uri = Uri.https(path, endpoint, queryParameters);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      return jsonResponse.map((photoDTOJson) => PhotoDTO.fromJson(photoDTOJson)).toList();
    } else {
      throw HttpException("Request failed with status: ${response.statusCode}.");
    }
  }

}