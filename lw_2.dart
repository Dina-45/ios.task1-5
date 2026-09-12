void checkBalance({required String name, required double balance}) =>
    print('$name, ваш баланс: $balance');

double deposit({required double currentBalance, double? amount}) {
  final depositAmount = amount ?? 0.0;
  final updatedBalance = currentBalance + depositAmount;
  print('Внесено: $depositAmount');
  print('Новый баланс: $updatedBalance');
  return updatedBalance;
}

double withdraw({
  required String name,
  required double currentBalance,
  double? amount,
  int? pinCode,
}) {
  const correctPin = 1234;
  final enteredPin = pinCode ?? 0000;

  if (enteredPin != correctPin) {
    print('Неверный PIN. Операция отклонена');
    return currentBalance;
  }

  final withdrawAmount = amount ?? 0.0;

  if (withdrawAmount > currentBalance) {
    print('Недостаточно средств. Операция отклонена');
    return currentBalance;
  }

  final updatedBalance = currentBalance - withdrawAmount;
  print('Снято: $withdrawAmount');
  print('Остаток: $updatedBalance');
  return updatedBalance;
}

void main() {
  double balance = 10000.0;

  checkBalance(name: 'Dina', balance: balance);

  print('\nПополнение');
  balance = deposit(currentBalance: balance, amount: 5000.0);

  print('\nСнятие (верный PIN)');
  balance = withdraw(name: 'Dina', currentBalance: balance, amount: 3000.0, pinCode: 1234);

  print('\nСнятие (неверный PIN)');
  balance = withdraw(name: 'Dina', currentBalance: balance, amount: 1000.0, pinCode: 9999);

  print('\nСнятие (сумма больше баланса)');
  balance = withdraw(name: 'Dina', currentBalance: balance, amount: 999999.0, pinCode: 1234);

  print('\nФинальный баланс');
  checkBalance(name: 'Dina', balance: balance);
}