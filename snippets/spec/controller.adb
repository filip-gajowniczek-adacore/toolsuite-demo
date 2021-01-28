pragma Ada_2012;

with Hardware_H; use Hardware_H;
with Interfaces.C; use Interfaces.C;

package body Controller is

   ---------------
   -- Get_State --
   ---------------

   function Get_State return State_Type is
      Power_Level  : Int := get_power_level;
   begin
      return Off;
   end Get_State;

   -------------------
   -- State_Machine --
   -------------------

   task body State_Machine is
   begin
      pragma Compile_Time_Warning (Standard.True,
         "State_Machine unimplemented");
      raise Program_Error with "Unimplemented task State_Machine";
   end State_Machine;

end Controller;
