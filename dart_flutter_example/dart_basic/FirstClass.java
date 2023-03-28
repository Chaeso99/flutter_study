// FirstClass.java

// 1급 객체
// 변수에 할당(대입) 할 수 있어야 한다.
// 함수나 객체의 매개변수로 넘길 수 있어야 한다.
// 함수나 객체의 리턴값으로 리턴 가능해야 한다.

//자바는 최상단에 class 이외의 것이 올 수 없다.
//String str = "aa"; <-에러남
//void hello(){} <-에러남

class FirstClass {

    public static void main(String[] args) {
        FirstClass firstClass = new FirstClass();
        firstClass.runFunction(new MyInterface() {
            @Override
            public void myFunction() {
                System.out.println("함수 실행됨");
            }
        });
    }

    String str = "aa";

    void hello() {
        System.out.println("hello");
    }
    // 매개변수로 함수를 넘겨서 넘긴 함수를 실행하고 싶다.
    // 넘길 때 함수를 만들고싶다.(익명함수 사용)

    void runFunction(MyInterface inter) {
        inter.myFunction();
    }
}

interface MyInterface {
    void myFunction(); // 인터페이스라서 구현 안해도 됨
}
