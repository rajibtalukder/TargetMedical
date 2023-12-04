extension StringExtension on String {
  String get enNumToBeNum {
    String text = this;
    text = text.replaceAll('0', '০');
    text = text.replaceAll('1', '১');
    text = text.replaceAll('2', '২');
    text = text.replaceAll('3', '৩');
    text = text.replaceAll('4', '৪');
    text = text.replaceAll('5', '৫');
    text = text.replaceAll('6', '৬');
    text = text.replaceAll('7', '৭');
    text = text.replaceAll('8', '৮');
    text = text.replaceAll('9', '৯');
    return text;
  }

  String get enNumToBeLetter {
    String text = this;
    text = text.replaceAll('0', 'ক');
    text = text.replaceAll('1', 'খ');
    text = text.replaceAll('2', 'গ');
    text = text.replaceAll('3', 'ঘ');
    return text;
  }

  String get enNumToEngLetter {
    String text = this;
    text = text.replaceAll('0', 'A');
    text = text.replaceAll('1', 'B');
    text = text.replaceAll('2', 'C');
    text = text.replaceAll('3', 'D');
    return text;
  }

}
