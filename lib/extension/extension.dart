extension FormatCurrency on int {
  String toCurrencyString() {
    return 'Rp ${toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }
}
