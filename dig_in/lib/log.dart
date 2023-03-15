class Log {
  static i(String tag, String description){
    print("Log/$tag : $description");
  }
  static e(String tag, String description){
    print("Log/ error $tag : $description");
  }
}