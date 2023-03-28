//instance.dart

class Cat {
  //필드 - 객체의 데이터
  String name;

  //메소드 - 객체의 기능
  void say() {
    print("야옹");
  }

  //생성자 = 객체를 생성하는 함수 (내용이 없으면 중괄호 생략 가능)
  Cat(this.name);
}

void main(List<String> args) {
  //오브젝트 - 대상의 타입(실체가 아닌 상태)
  Cat cat;

  //인스턴스 - 실체화된 대상
  new Cat("나비").say();
}

//클래스는 의자 조립도임
//오브젝트는 의자 타입임
//객체(인스턴스) 는 의자 실물임(new ~로 만듬)