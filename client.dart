import 'dart:io';
import 'dart:convert';

String _host = InternetAddress.loopbackIPv4.host;
String path = 'files/file.txt';

Map jsonData = {
  'name': 'Han Solo',
  'job': 'reluctant hero',
  'BFF': 'Chewbacca',
  'ship': 'Millennium Falcon',
  'weakness': 'smuggling debts'
};

Future main() async {
  HttpClientRequest request = await HttpClient().post(_host, 4049, path)
    ..headers.contentType = ContentType.json
    ..write(jsonEncode(jsonData));
  HttpClientResponse response = await request.close();
  await utf8.decoder.bind(response).forEach(print);
}
