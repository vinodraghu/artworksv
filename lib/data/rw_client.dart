
import 'dart:async';
import 'dart:convert' show json;

import 'package:article_finder/data/artwork_detils_model.dart';
import 'package:article_finder/data/artworks_model.dart';
import 'package:http/http.dart' as http;

class RWClient {
  final _host = 'api.artic.edu';
  final _contextRoot = 'api/v1';

  Future<ArtWorksModel?> fetchArtWorksData(String? query) async {
    Map<String, Object> params = {};

    if (query != null && query.isNotEmpty) {
      params['q'] = query;
    }

    final results = await request(path: 'artworks/search', parameters: params);
    final data = results;
    return ArtWorksModel.fromJson(results);
  }

  Future<ArtWorkDetilsModel?> getDetailArtWorkData(String id) async {
    final results = await request(path: 'artworks/$id', parameters: {});
    final data = results;
    return ArtWorkDetilsModel.fromJson(data);
  }

  Future<Map> request({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    final uri = Uri.https(_host, '$_contextRoot/$path', parameters);
    final headers = _headers;
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json; charset=utf-8',
        'Accept': 'application/json',
      };
}
