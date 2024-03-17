import 'package:busha_flutter_assessment/util/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Email validator works fine', () async {
    const validEmail = "nelololo@mail.co";
    const inValidEmail1 = "nelololo@mail.c";
    const inValidEmail2 = "nelololo@mail";
    const inValidEmail3 = "nelololo@";
    const inValidEmail4 = "nelololo";

    expect(Validator.isValidEmailAddress(validEmail), true);
    expect(Validator.isValidEmailAddress(inValidEmail1), false);
    expect(Validator.isValidEmailAddress(inValidEmail2), false);
    expect(Validator.isValidEmailAddress(inValidEmail3), false);
    expect(Validator.isValidEmailAddress(inValidEmail4), false);
  });
}
