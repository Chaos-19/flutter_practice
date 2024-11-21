import 'dart:async';

void main(List<String> args) {
  print(args);
  //(fetchUser().then((v) => print(v)));

  /*getUser().then((i) {
    print(i);
  }, onError: (e) => print(e));*/

  print(welcome('F', name: 'Dagi', age: 6));

  var list_num = it();

  print(list_num.where((ele) => ele > 5));

  for (var element in [
    1,
    4,
    5,
    6,
    6,
  ]) {
    print(element);
  }

  if ([1, 'Test!'] case [int x, String y]) {
    print("$x  and $y");
  }

  var [a, b, ..., g, t] = [1, 2, 4, 5, 6, 7, 8, 9, 9, 0, 23];

  print('$a,$b, $g,$t');

  assert(8 > 7, 'Test fail');
}

Future<String> getUser() async {
  return await fetchUser();
}

Future<String> fetchUser() async {
  return Future.delayed(const Duration(seconds: 2), () => 'Delayed');
}

Iterable<int> it() sync* {
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

String welcome(
  String sex, {
  String? name = "Abebe",
  required int? age,
}) {
  return '$name and $age';
}
