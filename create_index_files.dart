import 'dart:io';

List<String> routeNames = [
  'portfolio/teklifimgelsin',
  'portfolio/decision-ai',
  'portfolio/ticktodo'
];

void main() {
  var indexFile = File('build/web/index.html');
  var content = indexFile.readAsStringSync();

  for (var path in routeNames) {
    var file = File('build/web/$path/index.html');
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }
}
