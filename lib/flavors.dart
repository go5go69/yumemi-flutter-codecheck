enum Flavor {
  dev,
  prd,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'GitHub Search Dev';
      case Flavor.prd:
        return 'GitHub Search';
      default:
        return 'title';
    }
  }

}
