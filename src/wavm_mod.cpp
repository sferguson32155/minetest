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
	// Message contains the '-wavm' part, so just get the filename
	std::string filename = message.substr(6);

	// Find the path to the WAVM executable
        std::string wavm_exe = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/wavm-run.exe";

	// Find the path to the specified file
        std::string path = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/WAST_files/" + filename;

	// Run the executable and pipe the output to a text file
        std::string command = wavm_exe + " " + filename + " > wavm_output.txt";
        int result = system(command.c_str());

        // Citation: www.cplusplus.com/doc/tutorial/files/
        // Below code to read from a file was influenced by the sample code provided by the above link
	// Grab the content of the text file and return it
        std::string content;
        std::ifstream output("wavm_output.txt");
        if(output.is_open())
                std::getline(output, content);
        output.close();

        return content;
}
