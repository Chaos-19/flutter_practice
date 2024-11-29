import 'dart:io';

void main() {
  calculator();
}

void calculator() {
  bool continue_o = false;
  do {
    print("enter num 1 ");
    num? num1 = num.tryParse(stdin.readLineSync()!);
    print("enter num 2");
    num num2 = num.parse(stdin.readLineSync()!);
    print("enter the opration + ,- ,* ,/");
    String? opration = stdin.readLineSync();

    num result = switch (opration) {
      '+' => add(num1!, num2),
      '-' => sub(num1!, num2),
      '*' => product(num1!, num2),
      '/' => divid(num1!, num2),
      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };

    print(result);

    print("would like to contnu ? enter y or n");

    continue_o = switch (stdin.readLineSync()?.toLowerCase()) {
      null => false,
      'y' => true,
      'n' => false,
      String() => throw UnimplementedError(),
    };
  } while (continue_o);
}

num add(num x, num y) {
  return x + y;
}

num sub(num x, num y) {
  return x - y;
}

num product(num x, num y) {
  return x * y;
}

num divid(num x, num y) {
  return x / y;
}
