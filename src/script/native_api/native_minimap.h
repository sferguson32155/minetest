#pragma once

#include "client/client.h"
#include "client/minimap.h"
#include "common/c_converter.h"
#include "lua_api/l_minimap.h"
#include "settings.h"


class NativeMiniMap
{
public:
	static Minimap& native_show();
	static Minimap& native_hide();
	//check about returns, datatypes confusing
	static v3s16 native_get_pos();
	static v3s16 native_set_pos(f32 angle);
	static int native_get_angle();
	static bool native_set_angle(f32 angle);











};