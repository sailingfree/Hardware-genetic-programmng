/*  lil-gp Genetic Programming System, version 1.0, 11 July 1995
 *  Copyright (C) 1995  Michigan State University
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of version 2 of the GNU General Public License as
 *  published by the Free Software Foundation.
 * 
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 * 
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *  
 *  Douglas Zongker       (zongker@isl.cps.msu.edu)
 *  Dr. Bill Punch        (punch@isl.cps.msu.edu)
 *
 *  Computer Science Department
 *  A-714 Wells Hall
 *  Michigan State University
 *  East Lansing, Michigan  48824
 *  USA
 *  
 */

#include <math.h>
#include <stdio.h>

#include <lilgp.h>

DATATYPE f_and ( int tree, farg *args )
{
     return args[0].d && args[1].d;
}

DATATYPE f_or ( int tree, farg *args )
{
     return args[0].d || args[1].d;
}

DATATYPE f_not ( int tree, farg *args )
{
     return !args[0].d;
}

DATATYPE f_if ( int tree, farg *args )
{
     if ( evaluate_tree ( args[0].t, tree ) )
          return evaluate_tree ( args[1].t, tree );
     else
          return evaluate_tree ( args[2].t, tree );
}

DATATYPE f_a0 ( int tree, farg *args )
{
     return g.a&(1<<0);
}

DATATYPE f_a1 ( int tree, farg *args )
{
     return g.a&(1<<1);
}

DATATYPE f_a2 ( int tree, farg *args )
{
     return g.a&(1<<2);
}

DATATYPE f_d0 ( int tree, farg *args )
{
     return g.d&(1<<0);
}

DATATYPE f_d1 ( int tree, farg *args )
{
     return g.d&(1<<1);
}

DATATYPE f_d2 ( int tree, farg *args )
{
     return g.d&(1<<2);
}

DATATYPE f_d3 ( int tree, farg *args )
{
     return g.d&(1<<3);
}

DATATYPE f_d4 ( int tree, farg *args )
{
     return g.d&(1<<4);
}

DATATYPE f_d5 ( int tree, farg *args )
{
     return g.d&(1<<5);
}

DATATYPE f_d6 ( int tree, farg *args )
{
     return g.d&(1<<6);
}

DATATYPE f_d7 ( int tree, farg *args )
{
     return g.d&(1<<7);
}

