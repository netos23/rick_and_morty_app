extension PathId on String {
  int get id {
    return int.parse(substring(lastIndexOf('/') + 1));
  }
}