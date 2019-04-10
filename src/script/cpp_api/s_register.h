// This class was created for the sole purpose of allowing the Client to register
// a new item using WAVM since the Client and Server have different IItemDefManagers
// and IWritable__DefManagers. Based on current implementation, the Client registers
// the new item successfully on their side, but since the Server knows nothing about it,
// the server's detached inventory overwrites the localplayer's inventory.
// Written by Bryan Rooke - 4/10/19
// Last modified - 4/10/19
// Senior Project

#ifndef REGISTER_WASM_H
#define REGISTER_WASM_H

#include "cpp_api/s_base.h"
#include <itemdef.h>
#include <server.h>

class RegisterWasm : public ScriptApiBase {
public:
	RegisterWasm(ItemDefinition *def);

	void registerCommand();

private:
	const ItemDefinition *m_def;
	IWritableItemDefManager *m_idef;
	Server *server;
};

#endif
