#include "native_client.h"

std::string NativeModApiClient::native_get_current_modname(std::string current_mod)
{
	// TODO: Unsure how to write native version of this
	return current_mod;
}

const char* NativeModApiClient::native_get_modpath(std::string modname)
{
	std::string path = modname + ":";
	return path.c_str();
}

const char* NativeModApiClient::native_get_last_run_mod(
		std::string current_mod, ScriptApiBase *scriptApiBase)
{
	return scriptApiBase->getOrigin().c_str();
}

bool NativeModApiClient::native_set_last_run_mod(
		const char *mod, ScriptApiBase *scriptApiBase)
{
	scriptApiBase->setOriginDirect(mod);
	return true;
}

int NativeModApiClient::native_print(std::string text)
{
	rawstream << text << std::endl;
	return 0;
}

bool NativeModApiClient::native_display_chat_message(std::string message, Client *client)
{
	client->pushToChatQueue(new ChatMessage(utf8_to_wide(message)));
	return true;
}

int NativeModApiClient::native_send_chat_message(std::string message, Client *client)
{
	client->sendChatMessage(utf8_to_wide(message));
	return 0;
}

int NativeModApiClient::native_clear_out_chat_queue(Client *client)
{
	client->clearOutChatQueue();
	return 0;
}

std::list<const char *> NativeModApiClient::native_get_player_names(Client *client)
{
	std::list<const char *> returnList;

	const std::list<std::string> &plist = client->getConnectedPlayerNames();
	std::list<std::string>::const_iterator iter;
	for (iter = plist.begin(); iter != plist.end(); ++iter) {
		returnList.push_back((*iter).c_str());
	}
	return returnList;
}

bool NativeModApiClient::native_show_formspec(
		std::string *formname, std::string *formspec, Client *client)
{
	ClientEvent *event = new ClientEvent();
	event->type = CE_SHOW_LOCAL_FORMSPEC;
	event->show_formspec.formname = formname;
	event->show_formspec.formspec = formspec;
	client->pushToEventQueue(event);
	return true;
}

int NativeModApiClient::native_send_respawn(Client *client)
{
	client->sendRespawn();
	return 0;
}

bool NativeModApiClient::native_disconnect(Client *client, MainGameCallback *g_gamecallback)
{
	g_gamecallback->disconnect();
	return true;
}

const char * NativeModApiClient::native_gettext(std::string text)
{
	return text.c_str();
}

const NodeDefManager* NativeModApiClient::native_get_node_or_nil(
		v3s16 pos, Client *client)
{
	bool pos_ok;
	MapNode n = client->CSMGetNode(pos, &pos_ok);
	if (pos_ok) {
		return client->ndef();
	} else {
		return nullptr;
	}
}

std::tuple<char*, const char*> NativeModApiClient::native_get_language()
{
	#ifdef _WIN32
		char *locale = setlocale(LC_ALL, NULL);
	#else
		char *locale = setlocale(LC_MESSAGES, NULL);
	#endif
		std::string lang = gettext("LANG_CODE");
		if (lang == "LANG_CODE")
			lang = "";

	std::tuple<char*, const char*> result;
	std::get<0>(result) = locale;
	std::get<1>(result) = lang.c_str();
	return result;
}


NodeMetadata* NativeModApiClient::native_get_meta(v3s16 p, Client *client)
{
	NodeMetadata *meta = client->getEnv().getMap().getNodeMetadata(p);
	return meta;
}

s32 NativeModApiClient::native_sound_play(Client *client, SimpleSoundSpec spec, v3f default,
				  float gain, float pitch, float looped, v3f *pos)
{
	ISoundManager *sound = client->getSoundManager();

	s32 handle;

	if (pos == nullptr) {
		handle = sound->playSoundAt(spec.name, looped, gain * spec.gain, *pos, pitch);
		return handle;
	}

	return sound->playSound(spec.name, looped, gain * spec.gain, spec.fade, pitch);
}

int NativeModApiClient::native_sound_stop(s32 handle, Client *client)
{
	client->getSoundManager()->stopSound(handle);
	return 0;
}

int NativeModApiClient::native_sound_fade(s32 handle, float step, float gain, Client *client)
{
	client->getSoundManager()->fadeSound(handle, step, gain);
	return 0;
}

std::tuple<Address, std::string, std::string, int, int>
NativeModApiClient::native_get_server_info(Client *client)
{
	Address serverAddress = client->getServerAddress();
	std::string address = client->getAddressName().c_str();
	std::string ip = serverAddress.serializeString().c_str();
	int port = serverAddress.getPort();
	int protocol_version = client->getProtoVersion();

	return std::tuple<Address, std::string, std::string, int, int>(
			serverAddress, address, ip, port, protocol_version);
}

const ItemDefinition *NativeModApiClient::native_get_item_def(
		Client *client, IGameDef *gdef, std::string name)
{
	assert(gdef);

	IItemDefManager *idef = gdef->idef();
	assert(idef);

	if (!idef->isKnown(name))
		return nullptr;
	const ItemDefinition &def = idef->get(name);

	return &def;
}

const ContentFeatures *NativeModApiClient::native_get_node_def(
		Client *client, IGameDef *gdef, std::string name)
{
	assert(gdef);

	const NodeDefManager *ndef = gdef->ndef();
	assert(ndef);

	const ContentFeatures &cf = ndef->get(ndef->getId(name));
	if (cf.name != name)
		return nullptr;

	return &cf;
}

std::map<bool, std::string> NativeModApiClient::native_get_privilege_list(Client *client)
{
	std::map<bool, std::string> result;
	for (const std::string &priv : client->getPrivilegeList()) {
		result.insert(std::pair<bool, std::string>(true, priv.c_str()));
	}
	return result;
}

const char* NativeModApiClient::native_get_builtin_path()
{
	const char * val = BUILTIN_MOD_NAME ":";
	return val;
}

std::map<const char *, bool>  NativeModApiClient::native_get_csm_restrictions(Client *client, const CSMFlagDesc *flagdesc)
{
	u64 flags = client->getCSMRestrictionFlags();

	std::map<const char *, bool> result;
	for (int i = 0; flagdesc[i].name; i++) {
		result.insert(std::pair<const char *, bool>(
				flagdesc[i].name, !!(flags & flagdesc[i].flag)));
	}
	return result;
}