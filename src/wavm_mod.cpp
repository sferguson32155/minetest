// Contents of wavm_mod.cpp
// Takes the chat message, parses it for the file specified, and runs the WAVM
// executable, returning that result
// Written by Bryan Rooke and Eric Daff - 2/6/19
// Last modified - 2/24/19
// Senior Project

#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <strsafe.h>
#include <windows.h>
#include "stdafx.h"
#include "wavm-run.h"

// Function Prototypes
std::string get_dll_output(std::string, std::string);

// wavm_mod main function
std::string wavm_mod(std::string message) {
	// Message contains the '-wavm' part, so just get the filename
	std::string filename = message.substr(6);

	// Get the current path
	char path_buffer[MAX_PATH];
	GetCurrentDirectory(MAX_PATH, path_buffer);
	std::string current_path = path_buffer;
	current_path = current_path.substr(0, current_path.size()-3);

	// Find the path to the WAVM executable
        std::string wavm_dll = current_path + "\\bin\\wavm-run.dll";

	// Find the path to the specified file
        std::string path = current_path + "\\bin\\WAST_files\\" + filename;

        return get_dll_output(wavm_dll, path);
}

// Call the function from the DLL
std::string get_dll_output(std::string dll_path, std::string wast_path) {
	typedef VOID(*DLLPROC) (int argc, char** argv);
	HINSTANCE hinst;
	DLLPROC wavm_function;
	BOOL free_dll;
	std::string result = "Inside Minetest DLL function";

	// Load the DLL
	hinst = LoadLibrary(dll_path);

	if(hinst != NULL) {
		wavm_function = (DLLPROC)GetProcAddress(hinst, "mainWAVM");

		if(wavm_function != NULL) {
			// Define the different argument elements explicitly
			char project_name[] = "project name";

			int len = wast_path.length();
			char* file = new char[len + 1];
			strncpy(file, wast_path.c_str(), len);
			file[len] = 0;

			char** arg = new char*[3];
			arg[0] = project_name;
			arg[1] = file;
			arg[2] = NULL;

			wavm_function(1, &arg[0]);
			result = "Successfully called WAVM DLL";
		} else {
			result = "Failed to open function";
		}

		// Unload the library after
		free_dll = FreeLibrary(hinst);
	} else {
		result = "Failed to open DLL";
	}

	return result;
}
