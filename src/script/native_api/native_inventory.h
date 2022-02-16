/*
Minetest
Copyright (C) 2013 celeron55, Perttu Ahola <celeron55@gmail.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

#pragma once

//#include "native_api/native_base.h"
#include "inventory.h"
#include "inventorymanager.h"
#include "server.h"
#include "./../lua_api/l_inventory.h"

class RemotePlayer;

/*
	NativeInvRef
*/

class NativeInvRef
{
public:
	InventoryLocation m_loc;

	static Inventory *getinv(Server *server, InvRef *ref);

	static InventoryList *getlist(Server *server, InvRef *ref, const char *listname);

	static void reportInventoryChange(Server *server, InvRef *ref);

	// Exported functions

	// garbage collector
	static int gc_object(InvRef *ref);

	// is_empty(self, listname) -> true/false
	static bool native_is_empty(Server *server, InvRef *ref, const char *listname);

	// get_size(self, listname)
	static int native_get_size(Server *server, InvRef *ref, const char *listname);

	// get_width(self, listname)
	static int native_get_width(Server *server, InvRef *ref, const char *listname);

	// set_size(self, listname, size)
	static bool native_set_size(
			Server *server, InvRef *ref, const char *listname, int size);

	// set_width(self, listname, size)
	static int native_set_width(
			Server *server, InvRef *ref, const char *listname, int size);

	// get_stack(self, listname, i) -> itemstack
	static ItemStack NativeInvRef::native_get_stack(
			Server *server, InvRef *ref, const char *listname, int i);

	// set_stack(self, listname, i, stack) -> true/false
	static bool NativeInvRef::native_set_stack(Server *server, InvRef *ref, const char *listname,
			int i, ItemStack newitem);

	// get_list(self, listname) -> list or nil
	static std::vector<ItemStack> NativeInvRef::native_get_list(
			Server *server, InvRef *ref, const char *listname);

	// set_list(self, listname, list)
	static int NativeInvRef::native_set_list(Server *server, InvRef *ref, const char *listname,
			std::vector<ItemStack> items);

	// get_lists(self) -> list of InventoryLists
	static std::vector<const InventoryList *> NativeInvRef::native_get_lists(
			Server *server, InvRef *ref);

	// set_lists(self, lists)
	static int NativeInvRef::native_set_lists(Server *server, InvRef *ref,
			std::vector<const InventoryList *> lists);

	// add_item(self, listname, itemstack or itemstring or table or nil) -> itemstack
	// Returns the leftover stack
	static ItemStack NativeInvRef::native_add_item(Server *server, InvRef *ref,
			const char *listname, ItemStack item);

	// room_for_item(self, listname, itemstack or itemstring or table or nil) ->
	// true/false Returns true if the item completely fits into the list
	static bool NativeInvRef::native_room_for_item(Server *server, InvRef *ref,
			const char *listname, ItemStack item);

	// contains_item(self, listname, itemstack or itemstring or table or nil,
	// [match_meta]) -> true/false Returns true if the list contains the given count
	// of the given item name
	static bool NativeInvRef::native_contains_item(Server *server, InvRef *ref,
			const char *listname, ItemStack item);

	// remove_item(self, listname, itemstack or itemstring or table or nil) ->
	// itemstack Returns the items that were actually removed
	static ItemStack NativeInvRef::native_remove_item(Server *server, InvRef *ref,
			const char *listname, ItemStack item);

	// get_location() -> location (like get_inventory(location))
	static InventoryLocation NativeInvRef::native_get_location(InvRef *ref);


	NativeInvRef(const InventoryLocation &loc);
	~NativeInvRef() = default;
};
	class NativeModApiInventory
	{
	private:
		static int native_create_detached_inventory_raw(Server *server,
				const char *name, std::string player_name);

		static bool native_remove_detached_inventory_raw(
				Server *server, std::string name);

		static Inventory* native_get_inventory(Server *server, InventoryLocation loc);
	};
