class BankAccount {
  // TODO
  final String _username;
  final int _accountId;
  double _balance = 0;

  BankAccount.createAccount({
    required this._accountId,
    required this._username,
  }) {}

  double get balance => this._balance;
  String get username => this._username;
  int get accountId => this._accountId;

  void credit({required amount}) {
    _balance += amount;
  }

  void withdraw({required amount}) {
    if (_balance < amount) {
      throw Exception("Insufficient balance for withdrawal");
    }

    _balance -= amount;
  }
}

class Bank {
  // TODO
  final String _name;
  List<BankAccount> bankAccounts = [];
  Bank({required this._name});
  String get name => this._name;

  BankAccount createAccount(int accountId, String username) {
    for (var acc in bankAccounts) {
      if (accountId == acc.accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    BankAccount newAccount = BankAccount.createAccount(
      accountId: accountId,
      username: username,
    );
    bankAccounts.add(newAccount);

    return newAccount;
  }

}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(amount: 100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(amount : 50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(amount : 75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
