#include <stdio.h>

extern "C" {
  void hello(const char *pFrom) {
    printf("Hello from %s to C++!\n", pFrom);
  }
}

