class FormatterStringValue {
  String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (phoneNumber.length == 13) {
      return '+${phoneNumber.substring(0, 2)} (${phoneNumber.substring(2, 4)}) ${phoneNumber.substring(4, 9)}-${phoneNumber.substring(9)}';
    } else {
      return 'Número inválido';
    }
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
