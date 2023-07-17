extension PathId on String {
  String get id {
    return substring(lastIndexOf('/') + 1);
  }
}
