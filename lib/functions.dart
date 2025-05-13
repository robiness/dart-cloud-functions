import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main() async {
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
    .deploy-time {
      margin-top:2em;
      font-size:0.95em;
      color:#a1a1aa;
    }
    a { color: #93c5fd; }
  </style>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const now = new Date();
      const options = { year: 'numeric', month: 'long', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
      document.getElementById('deploy-time').textContent =
        'Deployed at: ' + now.toLocaleString(undefined, options) + ' (' + Intl.DateTimeFormat().resolvedOptions().timeZone + ')';
    });
  </script>
</head>
<body>
  <h1>Dart Cloud Function</h1>
  <p>Welcome! Your Dart backend is running 🚀</p>
  <p id="deploy-time" class="deploy-time"></p>
</body>
</html>
''',
        headers: {'content-type': 'text/html; charset=utf-8'},
      );
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
