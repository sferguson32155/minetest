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

