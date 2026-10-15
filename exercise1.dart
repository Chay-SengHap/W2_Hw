enum Skill { flutter, dart, other }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee.mobileDeveloper({
    required this._name,
    required this._baseSalary,
    required this._skills,
    required this._address,
    required this._yearsOfExperience,
  });

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double total = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.flutter:
          total += 5000;
          break;
        case Skill.dart:
          total += 2000;
          break;
        case Skill.other:
          total += 3000;
          break;
      }

    }
    return total;
  }

  
}

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address({required this._street, required this._city, required this._zipCode});

  String get street => _street;
  String get city => _city;
  String get zipocde => _zipCode;
}

void main() {
  Employee emp1 = Employee.mobileDeveloper(
    name: "Chhay",
    baseSalary: 1000,
    skills: [Skill.flutter, Skill.dart, Skill.other],
    address: Address(street: "E01", city: "PP", zipCode: "0123"),
    yearsOfExperience: 10,
  );

  print('Employee Name: ${emp1.name}');
  print('Total Calculated Salary: ${emp1.computeSalary()}\$');

}
