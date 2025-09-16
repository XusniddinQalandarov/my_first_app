import "dart:math";
import "lab4.dart" as lab4;

void main() {
  lab4.lab4Main();
  
  print('Xusniddin Qalandarov\n\n220057\n\n');
  print('\n\n\nThe main Function \n\n\n');
  print('--- Task 2 (Full Name) ---');
  print('Xusniddin Qalandarov');
  print('');

  print('--- Task 3 (Two Lines) ---');
  print('Welcome to Dart Programming.');
  print('Let’s start coding!');
  print('');

  print('--- Task 4 (Multi-line Address) ---');
  print('1 Amir Temur Avenue\nTashkent, Uzbekistan\n100000');
  print('');

  print('--- Task 5 (Current Year) ---');
  print('The current year is 2025.');
  print('');

  print('--- Task 6 (University Welcome) ---');
  print('Welcome, students of New Uzbekistan University!');
  print('');

  print('\n\n\nVariables\n\n\n');

  print('--- Task 2 (Favorite City Variable) ---');
  String favoriteCity = 'Helsinki';
  print('My favorite city is $favoriteCity.');
  print('');

  print('--- Task 3 (Book Price Variable) ---');
  double bookPrice = 15.99;
  print('The price of the book is \$$bookPrice USD.');
  print('');

  print('--- Task 4 (isLearningDart) ---');
  bool isLearningDart = true;
  print("Am I learning Dart? The answer is $isLearningDart");
  print('');

  print('--- Task 5 (Sunny Weather) ---');
  String weather = "Sunny";
  int temperature = 32;
  print(
    " Today’s weather is $weather and the temperature is $temperature degrees Celsius",
  );
  print('');

  print('--- Task 6 (Number of apples) ---');
  var numberOfApples = 10;
  numberOfApples = 12;
  print("Number of apples $numberOfApples");

  print('\n\n\nControl Flow\n\n\n');

  print('--- Task 2 (Student Score) --- ');

  int studentScore = 75;

  if (studentScore > 60) {
    print('Pass');
  } else {
    print('Fail');
  }
  print('');

  print('--- Task 3 (Hello) ---');
  int hour = 14;
  if (hour < 12) {
    print("Good morning!");
  } else if (hour >= 12 && hour <= 18) {
    print("Good afternoon!");
  } else {
    print("Good evening");
  }
  print('');

  print('--- Task 4 (for loop until 10)---');

  for (int i = 1; i <= 10; i++) {
    print(i);
  }
  print('');

  print('--- Task 5 (Liftoff) --- ');
  for (int i = 5; i >= 1; i--) {
    print(i);
  }
  print("Liftoff!");
  print('');

  print('--- Task 6 (multiplies of 3 within 1-20)---');
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0) {
      print(i);
    }
  }
  print('');

  print('\n\n\nFunctions\n\n\n');

  print('--- Task 2 (Greet by Name) --- ');
  greetByName("Xusniddin");
  print('');

  print('--- Task 3 (Multiply two numbers) --- ');
  print(multiply(7, 6));
  print('');

  print('--- Task 4 (isPositive) ---');
  print(isPositive(1));
  print(isPositive(-4));
  print('');

  print('---Task 5 (calculateAverage)---');
  print(calculateAverage(10.5, 20.5));
  print('');

  print('---Task 6 (multiplyArrow)---');
  print(multiplyArrow(7, 6));
  print('');

  print('\n\n\nComments\n\n\n');

  print('---Task2---');
  //stores the planet Earth to the variable planet
  String planet = "Earth";
  print("We live on planet $planet");
  print('');

  print('---Task3---');
  /*
   * Xusniddin Qalandarov
   * 09.09.2025
   * This is my lab3 assignement
  */
  sayHello();
  print('');

  print("---Task4---");
  //print ( "This message should not appear.");
  print("This message should appear.");
  print('');

  print("---Task5---");
  print(calculateCircleArea(5.0));
  print('');

  print('---Task6---');
  /* This variable stores a very important universal constant. */
  int speedOfLight = 299792458; //in meters per second
  print(speedOfLight);
}

void greetByName(String name) {
  print("Hello, $name!");
}

int multiply(int a, int b) {
  return a * b;
}

bool isPositive(int a) {
  return a > 0;
}

double calculateAverage(double a, double b) {
  return (a + b) / 2;
}

int multiplyArrow(int a, int b) => a * b;

void sayHello() {
  print("Hello from a function !");
}

//calculates the area of the circle by following Math formula: S = r*r*3.14;
double calculateCircleArea(double radius) {
  return pi * radius * radius;
}
