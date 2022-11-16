#pragma once

#include "native_minimap.h"

void NativeMiniMap::native_show(Minimap* m)
{
	if (m->getModeIndex() == 0 && m->getMaxModeIndex() > 0)
		m->setModeIndex(1);

	client->showMinimap(true);
}

void NativeMiniMap::native_hide(Minimap* m)
{
	if (m->getModeIndex() != 0)
		m->setModeIndex(0);

	client->showMinimap(false);
}

v3s16 NativeMiniMap::native_get_pos(Minimap *m)
{
	return m->getPos();
}

vs316 NativeMiniMap::native_set_pos(Minimap *m, v3s16 pos)
{
	return m->setPos(pos);
	//COME BACK LATER
}

int NativeMiniMap::native_get_angle(Minimap* m)
{
	return m->getAngle();
	//Possible conversion issues between f32 and int?
}

int NativeMiniMap::native_set_angle(Minimap *m, f32 angle)
{
	return m->getAngle(angle);
	// COME BACK LATER
}

int NativeMiniMap::native_get_mode(Minimap *m)
{
	return m->getMaxModeIndex();
	//Size_t to int conversion issues?
}

int NativeMiniMap::native_set_mode(Minimap *m, int mode)
{
	if (mode >= m->getMaxModeIndex())
		return 0;

	m->setModeIndex(mode);
}

int NativeMiniMap::native_get_shape(Minimap *m)
{
	return (int)m->getMinimapShape();
}

//Note (0 = square, 1 = round)

int NativeMiniMap::native_set_shape(Minimap *m, int shapeNum)
{

	m->setMinimapShape((MinimapShape)((int)lua_tonumber(shapeNum)));
	return 0;
}