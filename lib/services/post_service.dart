















import 'dart:convert';
import 'dart:html';

Uri url = Uri.parse(endPoint);

return await http.get(
  url,
  headers: RequestHelper.basicHeader(),
);
}

Future<http.Response> post(Post post) async{
  String endPoint = EndPoint.post;
  Uri url = Uri.parse(endPoint);
  var jsonBody = post.toMap();

return await http.post(
  url,
  body: jsonEncode(jsonBody),
  headers: RequestHelper.basicHeader(),
);
}
 Future<http.Response> put(Post post) async {
   String endPoint = "${EndPoint.post}/${post.id}";
   Uri url = Uri.parse(endPoint);
   var jsonBody = post.toMap();

   return await http.put(
    url,
    body: jsonEncode(jsonBody),
    headers: RequestHelper.basicHeader(),
    );
 }

 Future<http.Response> patch({
  required int id,
  String? tittle,
  String? body,
  }) async {
    String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint);

    Map<String, dynamic> jsonBody = {};

    if (title != null) {
      jsonBody["title"] = title;
    }
     if (body != null) {
      jsonBody["body"] = body;
  }

  return await http.patch(
    url,
    body: jsonEncode(jsonBody),
    headers: RequestHelper.basicHeader(),
  );
}
Future<http.Response> delete(int id)async{
 String endPoint = "${EndPoint.post}/$id";
    Uri url = Uri.parse(endPoint); 

    return await http.delete(
      url,
      headers: RequestHelper.basicHeader(),
    );
}
}
