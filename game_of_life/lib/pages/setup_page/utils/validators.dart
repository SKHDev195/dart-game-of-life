sealed class Validators {
  static validateRowsColumns(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return 'Enter a valid integer number';
    }
  }
}
