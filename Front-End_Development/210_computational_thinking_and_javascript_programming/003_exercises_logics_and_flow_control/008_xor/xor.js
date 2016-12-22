// Xor

function isXor(a, b) {
  a = !!a;
  b = !!b;
  
  if (a && !b) {
    return true;
  } else if (b && !a) {
    return true;
  } else {
    return false;
  }
}
  
