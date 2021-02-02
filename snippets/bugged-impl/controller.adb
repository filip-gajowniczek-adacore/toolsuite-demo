pragma Ada_2012;

with Hardware_H; use Hardware_H;
with Interfaces.C; use Interfaces.C;

package body Controller is

   Power_Level : Int := 0;

   ---------------
   -- Get_State --
   ---------------

   function Get_State return State_Type is
   begin
      if Power_Level = 0 then
         return OFF;
      elsif Power_Level <= 5 then
         return BOOT;
      elsif Power_Level <= 10 then
         return TESTING;
      elsif Power_Level = 11 then
         return OPERATIONAL;
      else
         raise Constraint_Error;
      end if;
   end Get_State;

   -------------------
   -- State_Machine --
   -------------------

   task body State_Machine is
   begin
      accept Initialize;
      set_power_level (5);

      loop
         Power_Level := get_power_level;
         case Power_Level is
            when 5 =>
               set_power_level (10);
            when 10 =>
               set_power_level (11);
            when others => null;
         end case;
         delay 1.0;
      end loop;

   end State_Machine;

end Controller;
