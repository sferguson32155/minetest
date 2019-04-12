// Contents of wavm_mod.cpp
// Takes the chat message, parses it for the file specified, and runs the NodeJS
// executable, returning that result
// Written by Bryan Rooke and Eric Daff - 2/6/19
// Last modified - 4/10/19
// Senior Project

#include <iostream>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <serverenvironment.h>
#include <itemdef.h>
#include <nodedef.h>
#include <gamedef.h>
#include <server.h>
#include <inventory.h>
#include <localplayer.h>
#include <player.h>
#include "util/numeric.h"

// Function Prototypes
std::string* retrieve_output_from_file(std::string);

// wasm_mod main function
std::string wasm_mod(std::string message, IWritableItemDefManager *serveridef,
		IWritableItemDefManager *idef, IWritableNodeDefManager *serverndef,
		IWritableNodeDefManager *ndef) {
	std::string output_file_name = "node_output.txt";
	int result;

	// Message contains the '-wasm' part, so just get the filename
	std::string filename = message.substr(6);

	// Get the current path
	char path_buffer[MAX_PATH];
	GetCurrentDirectory(MAX_PATH, path_buffer);

	//result = system(path_command.c_str());
	std::string current_path = path_buffer;
	current_path = current_path.substr(0, current_path.size()-3);

	// Find the path to the WAVM executable
        std::string node_exe = current_path + "\\NodeJS\\node.exe";

	// Find the path to the specified file
        std::string path = current_path + "\\bin\\WAST_files\\" + filename;

	// Run the executable and pipe the output to a text file
        //std::string command = node_exe + " " + path + " > " + output_file_name;
        //result = system(command.c_str());

	// Get the data from the file
	std::string* data = retrieve_output_from_file(filename);
	return data[0];
/*
	if(data[0].compare("Empty") == 0)
		return "New Item Not Added";

	// Populate ItemDefinition instance with output of the text file
	ItemDefinition *def = new ItemDefinition();
	def->name = data[0];
	if(data[1].compare("ITEM_NODE") == 0)
		def->type = ITEM_NODE;
	else if(data[1].compare("ITEM_CRAFT") == 0)
		def->type = ITEM_CRAFT;
	else if (data[1].compare("ITEM_TOOL") == 0)
		def->type = ITEM_TOOL;
	def->description = data[2];
	def->inventory_image = "[inventorycube"
		"{" + data[3] +
		"{" + data[3] +
		"{" + data[3];
	def->wield_image = "[inventorycube"
		"{" + data[4] +
		"{" + data[4] +
		"{" + data[4] +
		"{" + data[4] +
		"{" + data[4] +
		"{" + data[4];
	def->groups["crumbly"] = 3;
	const ItemDefinition *def2 = new ItemDefinition(*def);

	// Populate the ContentFeatures Struct - Might not be needed
	ContentFeatures f = ContentFeatures();
	f.name = def->name;
	for(int i = 0; i < 6; i++) {
		f.tiledef[i].name = data[3];
	}

	// Register the ItemDefinition (both Client + Server) and set the ContentFeature
	serveridef->registerItem(*def2);
	idef->registerItem(*def2);
	serverndef->set(f.name, f);
	ndef->set(f.name, f);

        return "New Block Added";
*/
	}

// Citation: www.cplusplus.com/doc/tutorial/files/
// Below code to read from a file was influenced by the sample code provided by the above link
// Grab the content of the text file and return it
std::string* retrieve_output_from_file(std::string filename) {
	std::string* data = new std::string[5];
	std::string temp;
	int i = 0;

	// Read in the text file, removing undefined values
	std::ifstream output(filename.c_str());
	while(true) {
                if(i == 5) {
                        break;
                }

                std::getline(output, temp);
		std::command = "echo " + temp + " > temp_output.txt";
		system(command.c_str());
                if(temp.compare("undefined") != 0 && i < 5) {
                        data[i] = temp;
                        i++;
                }
        }
        output.close();

	// If an empty file was provided, set the first value to Empty
	if(i == 0)
		data[0] = "Empty";

	return data;
}
