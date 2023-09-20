sealed class Validators {
  static validateRowsColumns(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return 'Enter a valid integer number';
    } else if (int.tryParse(value)! > 100) {
      return 'Enter a number lower or equal to 100';
    } else if (int.tryParse(value)! == 0) {
      return 'Enter a number greater than 0';
    }
  }
}
