#include <iostream>

int main() {
    int* ptr = new int;
    *ptr = 10;

    // Memory leak: 'ptr' is not deallocated
    // Potential null pointer dereference: 'ptr' is not checked for null before dereferencing
    std::cout << "Value: " << *ptr << std::endl;

    // Potential memory leak: 'ptr' is not deallocated
    return 0;
}
