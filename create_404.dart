import 'dart:io';

void main() {
  var indexFile = File('build/web/index.html');
  var notFoundFile = File('build/web/404.html');

  var content = indexFile.readAsStringSync();
  var script = '''
<script>
  // Check if a path is given and if it's not the root
  if (location.pathname != "/" && location.pathname.length > 1) {
    // If a path is given and it's not the root, redirect to the root and append the path as a query parameter
    location.replace(location.origin + "/?path=" + location.pathname.slice(1) + location.hash);
  }
</script>
''';

  content = content.replaceFirst('</head>', '$script</head>');

  notFoundFile.writeAsStringSync(content);
}
