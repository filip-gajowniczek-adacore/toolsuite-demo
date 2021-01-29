pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package hardware_h is

   procedure set_power_level (new_level : int)  -- hardware.h:1
   with Import => True, 
        Convention => C, 
        External_Name => "set_power_level";

   function get_power_level return int  -- hardware.h:2
   with Import => True, 
        Convention => C, 
        External_Name => "get_power_level";

end hardware_h;
