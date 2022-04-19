import 'package:imul/imul.dart';
import 'package:test/test.dart';

void main() {
  test('imul', () {
    expect(imul(2, 4), 8);
    expect(imul(-1, 8), -8);
    expect(imul(-2, -2), 4);
    expect(imul(0xffffffff, 5), -5);
    expect(imul(0xfffffffe, 5), -10);
  });

  test('imul2', () {
    expect(imul2(2, 4), 8);
    expect(imul2(-1, 8), -8);
    expect(imul2(-2, -2), 4);
    expect(imul2(0xffffffff, 5), -5);
    expect(imul2(0xfffffffe, 5), -10);
  });
}
