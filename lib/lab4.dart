class Book {
  String title;
  String author;
  int numberOfPages;

  Book(this.title, this.author, this.numberOfPages);
}

class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, this.grades);

  double calculateAverageGrade() {
    if (grades.isEmpty) return 0.0;
    double sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}

class BankAccount {
  int accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print(
      "Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}",
    );
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print(
        "Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${balance.toStringAsFixed(2)}",
      );
    } else {
      print(
        "Error: Not enough balance on you, brother. Current balance: \$${balance.toStringAsFixed(2)}",
      );
    }
  }
}

class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;
  double get perimeter => (width + height) * 2;
}

enum OrderStatus { pending, processing, shipped, delivered, cancelled }

enum TrafficLight {
  red,
  yellow,
  green;

  int get durationInSeconds {
    switch (this) {
      case TrafficLight.red:
        return 30;
      case TrafficLight.yellow:
        return 5;
      case TrafficLight.green:
        return 45;
    }
  }
}

void tfLight(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      print("Stop");
      break;
    case TrafficLight.yellow:
      print("Caution");
      break;
    default:
      print("Go");
  }
}

enum UserRole { admin, editor, guest }

class User {
  String name;
  UserRole role;

  User(this.name, this.role);

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

class Animal {
  void makeSound() {
    print("Some animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

class Shape {
  String color;

  Shape(this.color);
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;

  Square(String color, this.sideLength) : super(color);
}

class Employee {
  String name;
  int baseSalary;

  Employee(this.name, this.baseSalary);

  int calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  int bonus;

  Manager(String name, int baseSalary, this.bonus) : super(name, baseSalary);

  @override
  int calculateSalary() {
    return baseSalary + bonus;
  }
}

class LibraryItem {
  String title;
  int id;

  LibraryItem(this.title, this.id);

  String getDetails() {
    return "Title: $title, ID: $id";
  }
}

class Book1 extends LibraryItem {
  String author;

  Book1(String title, int id, this.author) : super(title, id);

  @override
  String getDetails() {
    return "Book -> Title: $title, Author: $author, ID: $id";
  }
}

class DVD extends LibraryItem {
  String director;

  DVD(String title, int id, this.director) : super(title, id);

  @override
  String getDetails() {
    return "DVD -> Title: $title, Director: $director, ID: $id";
  }
}

mixin Flyer {
  void fly() {
    print("Taking off!");
  }
}

class Bird with Flyer {}

class Plane with Flyer {}

mixin Logger {
  void log(String message) {
    print("[LOG] $message");
  }
}

class DataService with Logger {
  void fetchData() {
    log("Fetching data...");
  }
}

mixin Validator {
  bool isEmailValid(String email) {
    return email.contains("@") && email.contains(".");
  }

  bool isPasswordStrong(String password) {
    return password.length > 8;
  }
}


class UserSignup with Validator {
  void validateUser(String email, String password) {
    print("Email valid: ${isEmailValid(email)}");
    print("Password strong: ${isPasswordStrong(password)}");
  }
}


mixin Performer {
  void perform() {
    print("Performing!");
  }
}

mixin Musician {
  void playInstrument() {
    print("Playing an instrument!");
  }
}

class Artist {
  String name;
  Artist(this.name);
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);
}

class Guitarist extends Artist with Performer, Musician {
  Guitarist(String name) : super(name);
}

void lab4Main() {
  print("Classes\n\n\n");

  final myBook = Book("Angular for dummies", "Someone Jr", 24);
  print(
    "Title: ${myBook.title} & " +
        "Author: ${myBook.author} & " +
        "Number of pages: ${myBook.numberOfPages}",
  );
  final student = Student("Mekan", 21, [90.5, 85.0, 78.5, 92.0]);
  print(
    "Average grade for ${student.name}: ${student.calculateAverageGrade()}",
  );
  final account = BankAccount(12345, "John Doe", 500.0);

  account.deposit(200); // increase balance to 700
  account.withdraw(100); // decrease balance to 600
  account.withdraw(700); // show error (insufficient funds)

  final rect = Rectangle(53, 34);

  print("Area: ${rect.area}");
  print("Perimeter: ${rect.perimeter}");

  print('\n\n\nEnums\n\n\n');

  OrderStatus status = OrderStatus.processing;

  print("Current order status: $status");

  switch (status) {
    case OrderStatus.pending:
      print("Your order is pending. Please wait.");
      break;
    case OrderStatus.processing:
      print("Your order is being processed.");
      break;
    case OrderStatus.shipped:
      print("Your order has been shipped!");
      break;
    case OrderStatus.delivered:
      print("Your order has been delivered.");
      break;
    case OrderStatus.cancelled:
      print("Your order has been cancelled.");
      break;
  }
  tfLight(TrafficLight.red);
  tfLight(TrafficLight.yellow);
  tfLight(TrafficLight.green);

  final user1 = User("User1", UserRole.admin);
  final user2 = User("User2", UserRole.editor);
  final user3 = User("User3", UserRole.guest);

  print(
    "${user1.name} (Admin) has edit permission: ${user1.hasEditPermission()}",
  );
  print(
    "${user2.name} (Editor) has edit permission: ${user2.hasEditPermission()}",
  );
  print(
    "${user3.name} (Guest) has edit permission: ${user3.hasEditPermission()}",
  );

  for (var light in TrafficLight.values) {
    print("${light.name} light lasts ${light.durationInSeconds} seconds");
  }

  print("\n\n\nInheritance\n\n\n");

  final dog = Dog();
  final cat = Cat();

  dog.makeSound();
  cat.makeSound();

  final circle = Circle("Red", 5.0);
  final square = Square("Blue", 4.0);

  print("Circle -> Color: ${circle.color}, Radius: ${circle.radius}");
  print("Square -> Color: ${square.color}, Side length: ${square.sideLength}");

  final emp = Employee("Employee", 3000);
  final mgr = Manager("Manager", 4000, 1000);

  print("${emp.name}'s salary: ${emp.calculateSalary()}");
  print("${mgr.name}'s salary: ${mgr.calculateSalary()}");

  final book = Book1("Angular for Dummies", 101, "Someone Jr.");
  final dvd = DVD("Inception", 202, "Christopher Nolan");

  print(book.getDetails());
  print(dvd.getDetails());

  final bird = Bird();
  final plane = Plane();

  bird.fly();
  plane.fly();

  final service = DataService();
  service.fetchData();
  
  final signup = UserSignup();
  signup.validateUser("someone@example.com", "Password123");
  
  final dancer = Dancer("O'yinchi qiz");
  final guitarist = Guitarist("Gitarist");

  print("${dancer.name}:");
  dancer.perform();

  print("\n${guitarist.name}:");
  guitarist.perform();
  guitarist.playInstrument();
}
