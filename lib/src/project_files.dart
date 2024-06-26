import 'dart:io';

import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';

/// Get a list of all `.dart` files in the project
List<FileSystemEntity> getDartFiles(String? path) {
  final defaultPath = Directory.current.path;

  if (path == null || path.isEmpty) {
    path = defaultPath;
  }

  final dartFile = Glob("$path/lib/**.dart");
  final dartFiles = <FileSystemEntity>[];
  for (var entity in dartFile.listSync(followLinks: false)) {
    dartFiles.add(entity);
  }

  return dartFiles;
}
