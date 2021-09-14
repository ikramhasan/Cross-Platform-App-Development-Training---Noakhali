class Calculator {
  add(x, y) {
    print(x + y);
  }

  substract(x, y) {
    print(x - y);
  }

  multiplication(x, y) {
    print(x * y);
  }

  division(x, y) {
    if (y == 0) {
      print('y cannot be 0');
    } else {
      print(x / y);
    }
  }
}
