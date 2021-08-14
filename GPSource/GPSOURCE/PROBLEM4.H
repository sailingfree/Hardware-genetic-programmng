/////////////////////////////////////////////////////////////////////////////
// This is for experiment 4.
// A complex multi-path input file
/////////////////////////////////////////////////////////////////////////////
static struct St st[MAXSTATES] = {
	{0, Idp,   "123456", 0, None,    "*",      0, 1, 1.0},
	{1, None,  "*",      0, Dbreq,   "23456",  0, 2, 1.0},
	{2, Dbresp,"654321", 0, None,    "*",      0, 3, 0.5}, // The ok case
	{3, None,  "*",      0, Connect, "54321",  0, 4, 1.0},
	{4, None,  "*",      0, End,     "*",      0,-1, 1.0},
	{2, Dbresp,"000",    1, None,    "*",      0, 6, 0.5}, // The error case
	{6, None,  "*",      0, Connect,  "000",   0, 7, 1.0},
	{7, None,  "*",      0, End,     "*",      0,-1, 1.0},
	{-1, None, "*",      0, None,    "*",      0,-1, 0.0}};
	
#define NTRIALS 2

