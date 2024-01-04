extension StringExtensions on String {
  String capitalizeFirstChar() =>
      "${this[0].toUpperCase()}${this.substring(1)}";
  String capitalizeEveryWordsFirstChar() =>
      this.split(" ").map((e) => e.capitalizeFirstChar()).join(" ");
}
