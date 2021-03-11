#include "hardware.h"

static int power_level;
static int requested_power_level;

void  set_power_level( int new_level )
{
  requested_power_level = new_level;
}

int get_power_level()
{
  if( requested_power_level > power_level )
  {
      ++power_level;
  }
  return power_level;
}