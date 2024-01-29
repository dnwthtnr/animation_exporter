# include <iostream>
# include <Windows.h>

int main(){
	std::cout << "Hellow World";
	MessageBoxW(
		NULL,
		L"Hello World",
		L"Hello box",
		MB_OK
	);
	return 0;
};