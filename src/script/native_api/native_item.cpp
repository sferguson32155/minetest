#include "native_item.h"
#include "itemdef.h"
#include "server.h"


int NativeModApiItemMod::native_register_item_raw(Server *server, std::string name,
		std::string description, std::string short_description,
		std::string inventory_image, std::string inventory_overlay,
		std::string wield_image, std::string wield_overlay,
		std::string palette_image, std::string feature_name, bool on_construct,
		bool on_destruct, bool after_destruct, bool rightclickable)
{

    IWritableItemDefManager *idef = server->getWritableItemDefManager();
    NodeDefManager *ndef = server->getWritableNodeDefManager();

    ItemDefinition def;

	// Set a distinctive default value to check if this is set
    def.node_placement_prediction = "__default";

    // TODO: this line is from common/c_content.cpp. It takes in lua state,
    // and then a bunch of other parameters from the stack. This makes the function 
    // signature very large.
    //
	// read_item_definition(L, table, def, def);

    // Assign the item definition values to the def object
    // TODO: I am not sure this is the best method, maybe add a new constructor to ItemDefinition
    def.name = name;
    def.description = description;
    def.short_description = short_description;
    def.inventory_image = inventory_image;
    def.inventory_overlay = inventory_overlay;
    def.wield_image = wield_image;
    def.wield_overlay = wield_overlay;
    def.palette_image = palette_image;

    if (def.node_placement_prediction == "__default") {
        if (def.type === ITEM_NODE) {
            def.node_placement_prediction = name;
        } else {
            def.node_placement_prediction = "";
        }
    }

    idef->registerItem(def);

	// Read the node definition (content features) and register it
    if (def.type == ITEM_NODE) {
        ContentFeatures f;

        // TODO: again, this is something that is rather a large function in c_content.cpp,
        // making this function signature really large.
        //
        // read_content_features(L, f, table)

        // feature fields
        f.name = feature_name;
        f.has_on_construct = on_construct;
        f.has_on_destruct = on_destruct;
        f.has_after_destruct = after_destruct;
        f.rightclickable = rightclickable;

        // TODO: feature group fields
        // lua calls read_groups(L, -1, f.groups); Not sure how to handle this one

;

		// when a mod reregisters ignore, only texture changes and such should
		// be done
		if (f.name == "ignore") {
            return 0;
        }

        content_t id = ndef->set(f.name, f);

        if (id > MAX_REGISTERED_CONTENT) {
            // TODO: this won't be a lua error anymore. Unsure which kind to throw, however.
            // for now, I will use ModError
            throw ModError("Number of registerable nodes ("
                + itos(MAX_REGISTERED_CONTENT+1)
                + ") exceeded (" + name + ")");
        }
    }

    return 0; /* number of results */
}

int NativeModApiItemMod::native_unregister_item(Server *server, std::string name)
{
    IWritableItemDefManager *idef = server->getWritableItemDefManager();

    if (idef->get(name).type == ITEM_NODE) {
        NodeDefManager *ndef = server->getWritableNodeDefManager();
        ndef->removeNode(name);
    }

    idef->unregisterItem(name);

    return 0;
}

int NativeModApiItemMod::native_register_alias_raw(Server *server, std::string name,
        std::string convert_to)
{
    IWritableItemDefManager *idef = server->getWritableItemDefManager();

    idef->registerAlias(name, convert_to);

    return 0;
}

content_t NativeModApiItemMod::native_get_content_id(Server *server, std::string name)
{
    const IItemDefManager *idef = server->getItemDefManager();
    const NodeDefManager *ndef = server->getNodeDefManager();

    std::string alias_name = idef->getAlias(name);

    content_t content_id;

    if (alias_name != name) {
        if (!ndef->getId(alias_name, content_id)) {
            throw ModError("Unknown node: " + alias_name +
					" (from alias " + name + ")");
        } else if (!ndef-><getId(name, content_id)) {
            throw ModError("Unknown node: " + name);
        }
    }

    return content_id;
}

const char* NativeModApiItemMod::native_get_name_from_content_id(Server *server, content_t c)
{
    const NodeDefManager *ndef = server->getNodeDefManager();
    
    
    return ndef->get(c).name.c_str();

}