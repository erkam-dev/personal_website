import 'dart:io';

void main() {
  var indexFile = File('build/web/index.html');
  var notFoundFile = File('build/web/404.html');

  var content = indexFile.readAsStringSync();
  var script = '''
<script>
  // Single Page Apps for GitHub Pages
  // https://github.com/rafgraph/spa-github-pages
  // This script takes the current url and converts the path and query
  // string into just a query string, and then redirects the browser
  // to the new url with only a query string and hash fragment,
  // e.g. http://www.foo.tld/one/two?a=b&c=d#qwe, becomes
  // http://www.foo.tld/?/one/two&a=b~and~c=d#qwe
  // Note: this 404.html file must be at least 512 bytes for it to work
  // with Internet Explorer (it is currently > 512 bytes)

  // If you're creating a Project Pages site and NOT using a custom domain,
  // then set `segmentCount` to 1 (enterprise users may need to set it to > 1).
  // This way the code will only replace the route part of the path, and not
  // the real directory in which the app resides, for example:
  // https://username.github.io/repo-name/one/two?a=b&c=d#qwe becomes
  // https://username.github.io/repo-name/?/one/two&a=b~and~c=d#qwe
  // Otherwise, leave `segmentCount` as 0.
  var segmentCount = 0;

  var l = window.location;
  l.replace(
    l.protocol + '//' + l.hostname + (l.port ? ':' + l.port : '') +
    l.pathname.split('/').slice(0, 1 + segmentCount).join('/') + '/?/' +
    l.pathname.slice(1).split('/').slice(segmentCount).join('/').replace(/&/g, '~and~') +
    (l.search ? '&' + l.search.slice(1).replace(/&/g, '~and~') : '') +
    l.hash
  );
</script>
''';

  content = content.replaceFirst('</head>', '$script</head>');

  notFoundFile.writeAsStringSync(content);
}
