// Implement the functions of the RegisterWasm class defined in s_register.h
// Written by Bryan Rooke - 4/10/19
// Last modified - 4/10/19
// Senior Project

#include "s_register.h"
#include "s_base.h"
#include <itemdef.h>
#include <server.h>

RegisterWasm::RegisterWasm(ItemDefinition *def) :
	ScriptApiBase()
{
	m_def = new ItemDefinition(*def);
	server = getServer();
	m_idef = server->getWritableItemDefManager();
}

void RegisterWasm::registerCommand() {
	m_idef->registerItem(*m_def);
}
