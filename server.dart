import 'dart:io';
import 'dart:convert';

String _host = InternetAddress.loopbackIPv4.host;

Future main() async {
  var server = await HttpServer.bind(_host, 4049);
  print('Listening on ${server.address.host}:${server.port}');
  await for (var req in server) {
    ContentType contentType = req.headers.contentType!;
    HttpResponse response = req.response;

    if (req.method == 'POST' &&
        contentType.mimeType == 'application/json' /*1*/) {
      try {
        String content = await utf8.decoder.bind(req).join(); /*2*/
        var data = jsonDecode(content) as Map; /*3*/
        var fileName = "files/" + req.uri.pathSegments.last; /*4*/
        print("File Name : " + fileName);
        await File(fileName).writeAsString(content, mode: FileMode.write);
        req.response
          ..statusCode = HttpStatus.ok
          ..write('Wrote data for ${data['name']}.');
      } catch (e) {
        response
          ..statusCode = HttpStatus.internalServerError
          ..write('Exception during file I/O: $e.');
      }
    } else {
      response
        ..statusCode = HttpStatus.methodNotAllowed
        ..write('Unsupported request: ${req.method}.');
    }
    await response.close();
  }
}
