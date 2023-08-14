#include "server.h"
#include "native_object.h"
#include "lua_api/l_internal.h"

//Sean Ferguson

//6-14
void nativeObjectRef::n_remove(ServerActiveObject *sao) {
    sao->clearChildAttachments();
    sao->clearParentAttachment();

    verbosestream << "ObjectRef::n_remove(): id=" << sao->getId() << std::endl;
    sao->markForRemoval();
}

v3f nativeObjectRef::n_get_pos(ServerActiveObject *sao) {
    return sao->getBasePosition() / BS;
}

void nativeObjectRef::n_set_pos(ServerActiveObject *sao, const v3f &pos) {
    sao->setPos(pos);
}

void nativeObjectRef::n_move_to(ServerActiveObject *sao, const v3f &pos, bool continuous) {
    sao->moveTo(pos, continuous);
}

//6-17
float nativeObjectRef::n_punch(ServerActiveObject *sao, ServerActiveObject *puncher, float time_from_last_punch, const ToolCapabilities &toolcap, const v3f &dir) {
    dir.normalize();
    u16 src_original_hp = sao->getHP();
    u16 dst_origin_hp = puncher->getHP();

    u16 wear = sao->punch(dir, &toolcap, puncher, time_from_last_punch);

    // If the punched is a player, and its HP changed
    if (src_original_hp != sao->getHP() && sao->getType() == ACTIVEOBJECT_TYPE_PLAYER) {
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)sao, PlayerHPChangeReason(PlayerHPChangeReason::PLAYER_PUNCH, puncher));
    }

    // If the puncher is a player, and its HP changed
    if (dst_origin_hp != puncher->getHP() && puncher->getType() == ACTIVEOBJECT_TYPE_PLAYER) {
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)puncher, PlayerHPChangeReason(PlayerHPChangeReason::PLAYER_PUNCH, sao));
    }

    return wear;
}

//Might not be changable
void nativeObjectRef::n_right_click(ServerActiveObject *sao, ServerActiveObject *sao2) {
    sao->rightClick(sao2);
}

void nativeObjectRef::n_set_hp(ServerActiveObject *sao, int hp, const PlayerHPChangeReason& reason) {
    sao->setHP(hp, reason);
    if (sao->getType() == ACTIVEOBJECT_TYPE_PLAYER)
        getServer(L)->SendPlayerHPOrDie((PlayerSAO *)sao, reason);
    if (reason.hasLuaReference())
        luaL_unref(L, LUA_REGISTRYINDEX, reason.lua_reference);
}

int nativeObjectRef::n_get_hp(ServerActiveObject *sao) {
    if (sao == nullptr) {
        // Default hp is 1
        return 1;
    }

    return sao->getHP();
}

InvRef nativeObjectRef::n_get_inventory(ServerActiveObject *sao)
{
	InventoryLocation loc = sao->getInventoryLocation();
	if (getServerInventoryMgr(sao->getEnv())->getInventory(loc) != nullptr)
		return InvRef::create(sao->getEnv(), loc);
	else
		return InvRef();
}

//6-22
std::string nativeObjectRef::n_get_wield_list(ServerActiveObject *sao) {
    if (sao == nullptr)
        return "";

    return sao->getWieldList();
}

int nativeObjectRef::n_get_wield_index(ServerActiveObject *sao)
{
    if (sao == nullptr)
        return -1;

    int wieldIndex = sao->getWieldIndex() + 1;
    return wieldIndex;
}

ItemStack nativeObjectRef::n_get_wielded_item(ServerActiveObject *sao) {
    ItemStack selected_item;
    sao->getWieldedItem(&selected_item, nullptr);
    return selected_item;
}

bool nativeObjectRef::n_set_wielded_item(ServerActiveObject *sao, const ItemStack &item)
{
    return sao->setWieldedItem(item);
}

//6-23
std::pair<bool, ItemGroupList> nativeObjectRef::n_set_armor_groups(ServerActiveObject *sao, const ItemGroupList &groups)
{
    if (sao == nullptr)
        return std::make_pair(false, ItemGroupList());

    if (sao->getType() == ACTIVEOBJECT_TYPE_PLAYER) {
        if (!g_settings->getBool("enable_damage") && !itemgroup_get(groups, "immortal")) {
            groups["immortal"] = 1;
        }
    }

    sao->setArmorGroups(groups);
    return std::make_pair(true, groups);
}

std::map<std::string, int> nativeObjectRef::n_get_armor_groups(ServerActiveObject *sao)
{
	// Assuming ServerActiveObject has a function getArmorGroups() that returns the armor groups.
	// Replace 'getArmorGroups()' with the actual function name if different.
	return sao->getArmorGroups();
}

//7-1
void nativeObjectRef:n_set_animation(ServerActiveObject *sao, v2f frame_range, float frame_speed, float frame_blend, bool frame_loop)
{
    sao->setAnimation(frame_range, frame_speed, frame_blend, frame_loop);
}

void nativeObjectRef::n_get_animation(ServerActiveObject *sao, v2f *frames, float *frame_speed, float *frame_blend, bool *frame_loop)
{
	sao->getAnimation(frames, frame_speed, frame_blend, frame_loop);
}

void nativeObjectRef::n_set_local_animation(RemotePlayer *player, v2s32 frames[4], float frame_speed)
{
	getServer(L)->setLocalPlayerAnimations(player, frames, frame_speed);
}

std::pair<std::array<v2s32, 4>, float> nativeObjectRef::n_get_local_animation(RemotePlayer *player)
{
    std::array<v2s32, 4> frames;
    float frame_speed;
    player->getLocalAnimations(frames.data(), &frame_speed);
    return std::make_pair(frames, frame_speed);
}

//Might not be changable
void nativeObjectRef::n_set_eye_offset(RemotePlayer *player, const v3f &offset_first, const v3f &offset_third)
{
    getServer(player)->setPlayerEyeOffset(player, offset_first, offset_third);
}
