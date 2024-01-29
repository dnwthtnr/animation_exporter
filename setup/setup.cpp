# include <iostream>
# include <Windows.h>

int main(){
	MessageBoxW(
		NULL,
		L"Select Maya Install Location",
		L"Anim Exporter Setup",
		MB_OK
	);
	return 0
};