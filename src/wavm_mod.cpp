// Contents of wavm_mod.cpp
// Takes the chat message, parses it for the file specified, and runs the WAVM
// executable, returning that result
// Written by Bryan Rooke and Eric Daff - 2/6/19
// Last modified - 2/6/19
// Senior Project

#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdlib.h>

std::string wavm_mod(std::string message) {
	std::string output_file_name = "wavm_output.txt";
	int result;

	// Message contains the '-wavm' part, so just get the filename
	std::string filename = message.substr(7);

	// Set the command to be executed by cmd
	std::string path_command = "cd > wavm_output.txt";

	result = system(path_command.c_str());
	std::string current_path = retrieve_output_from_file(output_file_name);

	std::cout << current_path << std::endl;

	// Find the path to the WAVM executable
        std::string wavm_exe = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/wavm-run.exe";

	// Find the path to the specified file
        std::string path = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/WAST_files/" + filename;

	// Run the executable and pipe the output to a text file
        std::string command = wavm_exe + " " + filename + " > wavm_output.txt";
        result = system(command.c_str());

        return retrieve_output_from_file(output_file_name);
}

// Citation: www.cplusplus.com/doc/tutorial/files/
// Below code to read from a file was influenced by the sample code provided by the above link
// Grab the content of the text file and return it
std::string retrieve_output_from_file(std::string filename) {
	std::string content;
	std::ifstream output(filename);
	if(output.is_open()){
		std::getline(output, content);
	}
	output.close();

	return content;
}
