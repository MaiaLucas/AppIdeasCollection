RegExp _notZeroOrOne = RegExp(r'[^01]');

int _binary(String s) => int.tryParse(s, radix: 2);
int _decimal(String s) => int.tryParse(s, radix: 10);

class Conversor {
  int bin2dec(String s) {
    if (s.indexOf(_notZeroOrOne) != -1)
      throw ArgumentError('Input must be only 0\'s and/or 1\'s');

    if (s.length == 0) return 0;

    int binary = _binary(s);
    return _decimal(binary.toRadixString(10));
  }

  int dec2dbin(String s) {
    
    if (s.length == 0) return 0;

    int decimal = _decimal(s);
    return _decimal(decimal.toRadixString(2));
  }
}