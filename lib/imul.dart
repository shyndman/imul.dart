/// Calculates the C-like 32-bit multiplication of the two parameters
@pragma('vm:prefer-inline')
int imul(int a, int b) {
  final aHi = (a >>> 16) & 0xffff;
  final aLo = a & 0xffff;
  final bHi = (b >>> 16) & 0xffff;
  final bLo = b & 0xffff;
  // the shift by 0 fixes the sign on the high part
  // the final |0 converts the unsigned value into a signed value
  return ((aLo * bLo) + (((aHi * bLo + aLo * bHi) << 16) >>> 0)).toSigned(32);
}

/// An alternate implementation of [imul]
///
/// Appears to perform considerably better in AOT binaries.
@pragma('vm:prefer-inline')
int imul2(int a, int b) {
  var result = (a & 0x003fffff) * b;
  if (a & 0xffc00000 != 0) result += (a & 0xffc00000) * b | 0;
  return result.toSigned(32);
}
