String convertFilePath(String filePath) {
  Uri uri = Uri.parse(filePath);
  return uri.path;
}
