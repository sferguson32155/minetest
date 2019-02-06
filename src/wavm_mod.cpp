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
using namespace std;

string wavm_mod(string message) {
	// Message contains the '-wavm' part, so just get the filename
	string filename = message.substr(7);

	// Find the path to the WAVM executable
        string wavm_exe = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/wavm-run.exe";

	// Find the path to the specified file
        string path = "C:/Users/xarga/Desktop/minetest-windows-build/wavm_bin/WAST_files/" + filename;

	// Run the executable and pipe the output to a text file
        string command = wavm_exe + " " + filename + " > wavm_output.txt";
        int result = system(command.c_str());

        // Citation: www.cplusplus.com/doc/tutorial/files/
        // Below code to read from a file was influenced by the sample code provided by the above link
	// Grab the content of the text file and return it
        string content;
        ifstream output("wavm_output.txt");
        if(output.is_open())
                getline(output, content);
        output.close();

        return content;
}
