enum Flavor {
  CLIENT,
  OWNER,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.CLIENT:
        return 'Dig In client';
      case Flavor.OWNER:
        return 'Dig In owner';
      default:
        return 'title';
    }
  }

}
