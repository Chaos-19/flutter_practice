import "dart:io";
import 'dart:collection';

void main() {
  var list_num = geneEx().toList().then((onValue) => onValue);

  (list_num.then((onValue)=> print(onValue)));
  print("Test");
}
/*
Iterable<int> geneEx() sync* {
  for (var i = 0; i < 5; i++) yield i;
}
*/

Stream<int> geneEx() async* {
  for (var i = 0; i < 5; i++) yield i;
}

Future<String> getUser() async{
  return 'Hell world';
}