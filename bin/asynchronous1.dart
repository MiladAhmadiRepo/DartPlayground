Future<void> main(List<String> args) async {
  print(getString());
  print(await getString());
  print(await getAddress());
  print(await getTel());
}

Future<String> getString() async => "Foo Bar";
//we can compute a future by future.value
Future<String> getAddress() => Future.value("123 Main St");
//future with delay
Future<String> getTel() => Future.delayed(const Duration(seconds: 1),()=>'124-778-5555');
