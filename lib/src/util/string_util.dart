class SteveStringUtil {
  const SteveStringUtil._();

  static String capitalize(String input) => "${input[0].toUpperCase()}${input.substring(1).toLowerCase()}";
}
