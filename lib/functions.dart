import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
  final deploymentDate = DateTime.now().toUtc().toIso8601String();
  final handler =
      (Request req) => Response.ok(
        '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dart Cloud Function</title>
  <style>
    body {
      font-family: sans-serif;
      text-align: center;
      padding: 3em;
      background: #18181b;
      color: #f4f4f5;
    }
    h1 {
      color: #60a5fa;
    }
    p {
      color: #d4d4d8;
    }
    a { color: #93c5fd; }
  </style>
</head>
<body>
  <h1>Dart Cloud Function</h1>
  <p>Welcome! Your Dart backend is running 🚀</p>
  <p style="margin-top:2em;font-size:0.95em;color:#a1a1aa;">Deployed at: $deploymentDate UTC</p>
</body>
</html>
''',
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
