import 'dart:io';

void main() {
  var indexFile = File('build/web/index.html');
  var notFoundFile = File('build/web/404.html');

  var content = indexFile.readAsStringSync();
  var script = '''
<script>
  // Check if a path is given and if it's not the root
  if (location.pathname != "/" && location.pathname.length > 1) {
    // If a path is given and it's not the root, add a meta refresh tag to the head to redirect to the root and append the path as a query parameter
    var meta = document.createElement('meta');
    meta.httpEquiv = "refresh";
    meta.content = "0;url=" + location.origin + "/?path=" + location.pathname.slice(1) + location.hash;
    document.head.appendChild(meta);
  }
</script>
''';

  content = content.replaceFirst('</head>', '$script</head>');

  notFoundFile.writeAsStringSync(content);
}
