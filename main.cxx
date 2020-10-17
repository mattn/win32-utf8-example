#include <windows.h>
#include <iostream>
#include <string>

int
main(int argc, char *argv[]) {
  UINT cocp = GetConsoleOutputCP();
  UINT ccp = GetConsoleCP();
  SetConsoleOutputCP(65001);
  SetConsoleCP(CP_UTF8);

  for (auto i = 1; i < argc; i++) {
    std::cout << argv[i] << std::endl;
  }

  std::string buf;
  std::cout << "Aあーん🍣" << std::endl;
  std::getline(std::cin, buf);
  std::cout << buf << std::endl;

  SetConsoleCP(ccp);
  SetConsoleOutputCP(cocp);
  return 0;
}

