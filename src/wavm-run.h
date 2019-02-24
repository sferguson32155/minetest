#ifndef INDLL_H
#define INDLL_H

#ifdef EXPORTING_DLL
extern "C" __declspec(dllexport) int mainWAVM(int argc, char** argv);
#else
extern "C" __declspec(dllimport) int mainWAVM(int argc, char** argv);
#endif

#endif