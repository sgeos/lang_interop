#include "hello.h"

int main(int argc, char **argv) {
  const char *from_context = "C++";
  hello(from_context);
  return 0;
}

