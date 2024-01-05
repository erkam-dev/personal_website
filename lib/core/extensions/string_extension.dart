extension StringExtensions on String {
  String capitalizeFirstChar() =>
      "${this[0].toUpperCase()}${substring(1)}";
  String capitalizeEveryWordsFirstChar() =>
      split(" ").map((e) => e.capitalizeFirstChar()).join(" ");
}
