void main() {
  task1MultiplicationTable();
  task2NextDay();
  task3VowelCounter();
  task4MinMax();
  task5PrimeCheck();
}


//task1
void task1MultiplicationTable() {
  for (int i = 1; i <= 10; i++) {
    print("Таблица умножения $i");
    for (int j = 1; j <= 10; j++) {
      print("$i * $j = ${i * j}");
    }
    print("");
  }
}


//task2
void task2NextDay() {
  print(nextDay(5, 9, 2026));
  print(nextDay(28, 2, 2024));
  print(nextDay(28, 2, 2026));
  print(nextDay(29, 2, 2026) ?? "invalid date");
  print(nextDay(28, 2, 2100));
  print(nextDay(31, 12, 2025));
  print(nextDay(29, 2, 2400));
}

bool isLeapYear(int year) {
  if (year % 400 == 0) return true;
  if (year % 100 == 0) return false;
  if (year % 4 == 0) return true;
  return false;
}

int daysInMonth(int month, int year) {
  List<int> days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (month == 2 && isLeapYear(year)) return 29;
  return days[month - 1];
}

bool isValidDate(int day, int month, int year) {
  if (month < 1 || month > 12) return false;
  int maxDay = daysInMonth(month, year);
  if (day < 1 || day > maxDay) return false;
  return true;
}

String? nextDay(int day, int month, int year) {
  if (!isValidDate(day, month, year)) return null;

  int newDay = day + 1;
  int newMonth = month;
  int newYear = year;
  int maxDayInThisMonth = daysInMonth(month, year);

  if (newDay > maxDayInThisMonth) {
    newDay = 1;
    newMonth = newMonth + 1;
    if (newMonth > 12) {
      newMonth = 1;
      newYear = newYear + 1;
    }
  }

  String dayStr = newDay.toString().padLeft(2, '0');
  String monthStr = newMonth.toString().padLeft(2, '0');
  return "$dayStr.$monthStr.$newYear";
}


//task3
void task3VowelCounter() {
  String text = "flutter mobile development";
  print("Vowels in '$text': ${countVowels(text)}");
}

int countVowels(String text) {
  String vowels = "aeiouAEIOU";
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    String letter = text[i];
    if (vowels.contains(letter)) {
      count++;
    }
  }

  return count;
}


//task4
void task4MinMax() {
  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];
  List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67];

  findMinMax(numbers);
  findMinMax(numbers1);
}

void findMinMax(List<int> numbers) {
  int max = numbers[0];
  int min = numbers[0];

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) {
      max = numbers[i];
    }
    if (numbers[i] < min) {
      min = numbers[i];
    }
  }

  print("max: $max, min: $min");
}


//task5
void task5PrimeCheck() {
  checkPrime(3);
  checkPrime(6);
  checkPrime(17);
  checkPrime(20);
}

bool isPrime(int n) {
  if (n < 2) {
    return false;
  }

  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}

void checkPrime(int n) {
  if (isPrime(n)) {
    print("$n -> prime number");
  } else {
    print("$n -> not prime number");
  }
}