import 'dart:math';

// Задание 1: НОД и НОК
class DelimetersCalculator {
  late int gcd;
  late int lcm;
  late int modulo;
  late int temp;

  DelimetersCalculator(int num1, int num2, String method) {
    if (num1 == 0 || num2 == 0) {
      throw 'Деление на ноль!';
    }

    MethodGcd(num1, num2);

    if (method == "gcd")
      print("НОД = $gcd");
    else if (method == "lcm") {
      lcm = (num1 * num2) ~/ gcd;
      print("НОK = $lcm");
    } else
      print("Метод не поддерживается!");
  }

  MethodGcd(int n1, int n2) {
    modulo = n1 % n2;
    if (modulo == 0) {
      gcd = n2;
    } else
      MethodGcd(n2, modulo);
  }
}

// Задание 2: Перевод из десятичного в двоичный формат и наоборот
class DecBinTransfer {
  String binNum = "";
  num decNum = 0;
  int modulo = 0;
  int temp = 0;

  DecToBin(int n) {
    decNum = n;
    binNum = "";
    do {
      modulo = n % 2;
      n = n ~/ 2;
      binNum = modulo.toString() + binNum;
    } while (n > 0);
    print("$decNum DecToBin $binNum");
  }

  BinToDec(int n) {
    binNum = n.toString();
    decNum = 0;
    for (int i = binNum.length - 1; i >= 0; i--) {
      temp = int.parse(binNum.substring(i, i + 1));
      if (temp != 0 && temp != 1) {
        throw 'Некорректный формат!';
      }
      decNum += temp * pow(2, binNum.length - i - 1);
    }
    print("$binNum BinToDec $decNum");
  }
}

// Задание 3: Найти в строке числа и вернуть коллекцию num этих чисел
class Task3 {
  var arr;
  dynamic temp;
  List<num> result = [];

  Task3(String myString) {
    arr = myString.split(' ');
    for (var n in arr) {
      temp = num.tryParse(n);
      if (temp != null) result.add(temp);
    }
    print(myString);
    print(result);
  }
}

// Задание 4: Map должен соотносить слово и количество его вхождений в коллекцию
class Task4 {
  Map<String, int> result = {};

  Task4(List myList) {
    for (var s in myList) {
      if (result.containsKey(s)) {
        if (result[s] is int) result[s] = result[s]! + 1;
      } else
        result[s] = 1;
    }
    print(myList);
    print(result);
  }
}

// Задание 5: Метод, возвращающий цифры без повторений, которые встречаются в строке
class Task5 {
  var arr;
  Set<int> result = {};
  Map<String, int> numbers = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
  };

  Task5(String myString) {
    arr = myString.split(', ');

    for (var s in arr) {
      if (numbers[s] != null) result.add(numbers[s]!);
    }
    print(myString);
    print(result);
  }
}

// Задание 6:  Расстояние от заданной точки до точки в параметре
class Point {
  late double x;
  late double y;
  late double z;
  var result;

  Point(this.x, this.y, this.z);

  distanceTo(double x1, double y1, double z1) {
    result = sqrt(pow(x - x1, 2) + pow(y - y1, 2) + pow(z - z1, 2));
    print("Расстояние между точками = $result");
  }

  factory Point.zero() {
    return Point(0, 0, 0);
  }
}

// Задание 7: Вычисление корня любой заданной степени из числа
extension on num {
  num getRoot(num other) => extractRoot(this, other);

  extractRoot(num number, num rootDegree) {
    final accuracy = 0.0001;
    double temp;

    if (number == 0 || rootDegree == 0) {
      throw Exception("Деление на ноль!");
    }

    try {
      double root = number / rootDegree;

      do {
        temp = root;
        root = (1 / rootDegree) *
            ((rootDegree - 1) * temp + number / pow(temp, rootDegree - 1));
      } while ((root - temp).abs() > accuracy);

      return root.round();
    } on Exception catch (e) {
      print(e);
    }
  }
}

// Задание 8: Классы User, AdminUser, GeneralUser
abstract class User {
  var name;
  var email;
  bool isAdmin = false;
}

class AdminUser extends User with mailSystem {
  bool isAdmin = true;
}

class GeneralUser extends User {}

mixin mailSystem on User {
  getMailSystem(String email) {
    var arr = email.split('@');
    if (arr[1] != "null")
      return arr[1];
    else
      return false;
  }
}

class UserManager<T extends User> {
  List<AdminUser> admins = [];
  List<GeneralUser> users = [];

  addUser(var name, var email, bool isAdmin) {
    if (isAdmin) {
      admins.add(AdminUser()
        ..name = name
        ..email = email);
    } else {
      users.add(GeneralUser()
        ..name = name
        ..email = email);
    }
  }

  delUser(var email) {
    admins = admins.where((element) => element.email != email).toList();
    users = users.where((element) => element.email != email).toList();
  }

  getUsersMail() {
    for (var admin in admins) {
      var mailSystem = AdminUser().getMailSystem(admin.email);
      print(mailSystem);
    }

    for (var user in users) print(user.email);
  }
}

void main() {
  print("Задание 1: НОД и НОК");
  DelimetersCalculator(30, 9, "gcd");
  DelimetersCalculator(30, 9, "lcm");

  print("\nЗадание 2: Перевод из десятичного в двоичный формат и наоборот");
  DecBinTransfer()
    ..DecToBin(9)
    ..BinToDec(1001);

  print("\nЗадание 3: Найти в строке числа и вернуть коллекцию num этих чисел");
  Task3("test 1 task 5 2 the 9 end");

  print(
      "\nЗадание 4: Map должен соотносить слово и количество его вхождений в коллекцию");
  var myList = ["one", "more", "test", "test", "test", "task", "task"];
  Task4(myList);

  print(
      "\nЗадание 5: Метод, возвращающий цифры без повторений, которые встречаются в строке");
  var myString = "test, one, task, one, five, five, the, nine, end";
  Task5(myString);

  print("\nЗадание 6:  Расстояние от заданной точки до точки в параметре");
  Point(2.0, 2.0, 2.0)..distanceTo(3.0, 3.0, 3.0);

  print("\nЗадание 7: Вычисление корня любой заданной степени из числа");
  print(64.getRoot(6));

  print("Задание 8: Классы User, AdminUser, GeneralUser");
  UserManager manager = UserManager()
    ..addUser("bob", "bob@gmail.com", true)
    ..addUser("john", "john@yahoo.com", false)
    ..addUser("mike", "mike@mail.ru", false);

  manager.getUsersMail();
  manager.delUser("john@yahoo.com");
  manager.getUsersMail();
}
