// ==========================================================================
// Problem definition file
// Pete Martin
// Revision History
// ==========================================================================
// Nov  12 1997         CHanged name to Simple Call State Model
// ==========================================================================
// This is for experiment 2.
// A more involved number translation using two database requests.
/////////////////////////////////////////////////////////////////////////////

static struct St st[MAXSTATES] = {
	{0, Idp,   "123456", 0, None,    "*",      0,  1, 10.0},
	{1, None,  "*",      0, Dbreq,   "23456",  0,  2, 5.0},
	{2, Dbresp,"654321", 0, None,    "*",      0,  3, 1.0},
	{3, None,  "*",      0, Dbreq,   "54321",  0,  4, 5.0},
	{4, Dbresp,"987654", 0, None,    "*",      0,  5, 1.0},
	{5, None,  "*",      0, Connect, "87654",  0,  6, 1.0},
	{6, None,  "*",      0, End,     "*",      0, -1, 1.0},
	{-1, None, "*",      0, None,    "*",      0, -1, 0.0}};

#define NTRIALS  1
