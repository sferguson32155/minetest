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

#include "native_api/n_inventory.h"
//#include "native_api/n_internal.h"
//#include "native_api/n_item.h"
#include "common/c_converter.h"
#include "common/c_content.h"
#include "server.h"
#include "server/serverinventorymgr.h"
#include "remoteplayer.h"

/*
	InvRef
*/

Inventory* NativeInvRef::getinv(Server *server, InvRef *ref)
{
	return server->getInventoryMgr()->getInventory(ref->m_loc);
}

InventoryList* NativeInvRef::getlist(Server *server, InvRef *ref,
		const char *listname)
{
	Inventory *inv = getinv(server, ref);
	if(!inv)
		return NULL;
	return inv->getList(listname);
}

void NativeInvRef::reportInventoryChange(Server *server, InvRef *ref)
{
	// Inform other things that the inventory has changed
	server->getInventoryMgr()->setInventoryModified(ref->m_loc);
}

// Exported functions

// garbage collector
int NativeInvRef::gc_object(InvRef *ref) {
	delete ref;
	return 0;
}

// is_empty(self, listname) -> true/false
bool NativeInvRef::native_is_empty(Server *server, InvRef *ref, const char *listname)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list && list->getUsedSlots() > 0){
		return false;
	} else {
		return true;
	}
}

// get_size(self, listname)
int NativeInvRef::native_get_size(Server *server, InvRef *ref, const char *listname)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list){
		return list->getSize();
	} else {
		return 0;
	}
}

// get_width(self, listname)
int NativeInvRef::native_get_width(Server *server, InvRef *ref, const char *listname)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list){
		return list->getWidth();
	} else {
		return 0;
	}
}

// set_size(self, listname, size)
bool NativeInvRef::native_set_size(Server *server, InvRef *ref, const char *listname, int size)
{

	int newsize = size;
	if (newsize < 0) {
		return false;
	}

	Inventory *inv = getinv(server, ref);
	if(inv == NULL){
		return false;
	}

	if(newsize == 0){
		inv->deleteList(listname);
		reportInventoryChange(server, ref);
		return true;
	}
	InventoryList *list = inv->getList(listname);
	if(list){
		list->setSize(newsize);
	} else {
		list = inv->addList(listname, newsize);
		if (!list)
		{
			return false;
		}
	}
	reportInventoryChange(server, ref);
	return true;
}

// set_width(self, listname, size)
// TODO: possibly return boolean to denote status
int NativeInvRef::native_set_width(Server *server, InvRef *ref, const char *listname, int size)
{
	int newwidth = size;
	Inventory *inv = getinv(server, ref);
	if(inv == NULL){
		return 0;
	}
	InventoryList *list = inv->getList(listname);
	if(list){
		list->setWidth(newwidth);
	} else {
		return 0;
	}
	reportInventoryChange(server, ref);
	return 0;
}

// get_stack(self, listname, i) -> itemstack
ItemStack NativeInvRef::native_get_stack(Server *server, InvRef *ref, const char *listname, int i)
{
	InventoryList *list = getlist(server, ref, listname);
	ItemStack item;
	if(list != NULL && i >= 0 && i < (int) list->getSize())
		item = list->getItem(i);
	return item;
}

// set_stack(self, listname, i, stack) -> true/false
bool NativeInvRef::native_set_stack(Server *server, InvRef *ref, const char *listname, int i, ItemStack newitem)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list != NULL && i >= 0 && i < (int) list->getSize()){
		list->changeItem(i, newitem);
		reportInventoryChange(server, ref);
		return true;
	} else {
		return false;
	}
}

// get_list(self, listname) -> list or nil
std::vector<ItemStack> NativeInvRef::native_get_list(Server *server, InvRef *ref, const char *listname)
{
	Inventory *inv = getinv(server, ref);
    InventoryList *invlist = inv->getList(listname);
    std::vector<ItemStack> items;
	for(u32 i=0; i<invlist->getSize(); i++)
		items.push_back(invlist->getItem(i));
	return items;
}

// set_list(self, listname, list)
int NativeInvRef::native_set_list(Server *server, InvRef *ref, const char *listname, std::vector<ItemStack> items)
{
	Inventory *inv = getinv(server, ref);
	if(inv == NULL){
		return 0;
	}
	if (items.size() == 0) {
		inv->deleteList(listname);
	}
	InventoryList *invlist = inv->addList(listname, items.size());
    int index = 0;
    for(std::vector<ItemStack>::const_iterator
            i = items.begin(); i != items.end(); ++i){
        if(items.size() != -1 && index == items.size())
            break;
        invlist->changeItem(index, *i);
        index++;
    }
    while(items.size() != -1 && index < items.size()){
        invlist->deleteItem(index);
        index++;
    }
	reportInventoryChange(server, ref);
	return 0;
}

// get_lists(self) -> list of InventoryLists
std::vector<const InventoryList*> NativeInvRef::native_get_lists(Server *server, InvRef *ref)
{
	Inventory *inv = getinv(server, ref);
	if (!inv) {
		std::vector<const InventoryList *> empty;
		return empty;
	}
	return inv->getLists();
}

// set_lists(self, lists)
int NativeInvRef::native_set_lists(Server *server, InvRef *ref, std::vector<const InventoryList*> lists)
{
	for (const InventoryList *list : lists)
    {
        std::vector<ItemStack> items;
        for(u32 i=0; i<list->getSize(); i++)
            items.push_back(list->getItem(i));
        n_set_list(server, ref, list->getName().c_str(), items);
    }
	return 0;
}

// add_item(self, listname, itemstack or itemstring or table or nil) -> itemstack
// Returns the leftover stack
ItemStack NativeInvRef::native_add_item(Server *server, InvRef *ref, const char *listname, ItemStack item)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list){
		ItemStack leftover = list->addItem(item);
		if(leftover.count != item.count)
			reportInventoryChange(server, ref);
		return leftover;
	} else {
		return item;
	}
}

// room_for_item(self, listname, itemstack or itemstring or table or nil) -> true/false
// Returns true if the item completely fits into the list
bool NativeInvRef::native_room_for_item(Server *server, InvRef *ref, const char *listname, ItemStack item)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list){
		return list->roomForItem(item);
	} else {
		return false;
	}
}

// contains_item(self, listname, itemstack or itemstring or table or nil, [match_meta]) -> true/false
// Returns true if the list contains the given count of the given item
bool NativeInvRef::native_contains_item(Server *server, InvRef *ref, const char *listname, ItemStack item)
{
	InventoryList *list = getlist(server, ref, listname);
	bool match_meta = false;
	if (list) {
		return list->containsItem(item, match_meta);
	} else {
		return false;
	}
}

// remove_item(self, listname, itemstack or itemstring or table or nil) -> itemstack
// Returns the items that were actually removed
ItemStack NativeInvRef::native_remove_item(Server *server, InvRef *ref, const char *listname, ItemStack item)
{
	InventoryList *list = getlist(server, ref, listname);
	if(list){
		ItemStack removed = list->removeItem(item);
		if(!removed.empty())
			reportInventoryChange(server, ref);
		return removed;
	} else {
		return ItemStack();
	}
}

// get_location() -> location (like get_inventory(location))
InventoryLocation NativeInvRef::native_get_location(InvRef *ref)
{
	return ref->m_loc;
}


NativeInvRef::NativeInvRef(const InventoryLocation &loc):
	m_loc(loc)
{
}

//Create functions removed, probably unneeded

// get_inventory(location)
Inventory* NativeModApiInventory::native_get_inventory(Server *server, InventoryLocation loc)
{
	return server->getInventoryMgr()->getInventory(loc);
}

// create_detached_inventory_raw(name, [player_name])
int NativeModApiInventory::native_create_detached_inventory_raw(Server *server, const char *name, std::string player_name)
{
	if (server->getInventoryMgr()->createDetachedInventory(name, server->idef(), player_name) != NULL) {
		InventoryLocation loc;
		loc.setDetached(name);
	} else {
		return 0;
	}
	return 1;
}

// remove_detached_inventory_raw(name)
bool NativeModApiInventory::native_remove_detached_inventory_raw(Server *server, std::string name)
{
	return server->getInventoryMgr()->removeDetachedInventory(name);
}
