import 'dart:html';

import 'package:api_berita_app/utils/endpoint.dart';
import 'package:api_berita_app/utils/request_helper.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }

  Future<http.Response> fetchComments(int id) async {
    String endPoint = "${EndPoint.post}/$id/comments";
    Uri url = Uri.parse(endPoint);

    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}
