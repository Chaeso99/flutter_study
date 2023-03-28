//다트는 모든 타입이 1급 객체다.
String str = "aa";

Function hello = () {
  print("hello");
};

Function runFunction = (Function myFunction) {
  myFunction();
};

void main(List<String> args) {
  runFunction(() {
    print("hello");
  });
}
