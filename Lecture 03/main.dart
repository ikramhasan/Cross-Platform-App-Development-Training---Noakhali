import 'calculator.dart';
import 'student.dart';

void main() {
  Student student = Student();

  student.show("Mahbub", 22);
  student.show("Ikram", 23);

  Calculator calculator = Calculator();

  calculator.division(28, 2);
}
