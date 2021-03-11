pragma Ada_2012;

with hardware_h;   use hardware_h;
with Interfaces.C; use Interfaces.C;

package body Controller is

   OFF_LEVEL : constant Int := 0;
   BOOT_LEVEL : constant Int := 5;
   TESTING_LEVEL : constant Int := 10;
   OPERATIONAL_LEVEL : constant Int := 11;

   Power_Level : Int;

   ---------------
   -- Get_State --
   ---------------

   function Get_State return State_Type is
   begin
      if Power_Level = OFF_LEVEL then
         return OFF;
      elsif Power_Level <= BOOT_LEVEL then
         return BOOT;
      elsif Power_Level <= TESTING_LEVEL then
         return TESTING;
      elsif Power_Level = OPERATIONAL_LEVEL then
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
      set_power_level (BOOT_LEVEL);

      loop
         Power_Level := get_power_level;
         case Power_Level is
            when BOOT_LEVEL =>
               set_power_level (TESTING_LEVEL);
            when TESTING_LEVEL =>
               set_power_level (OPERATIONAL_LEVEL);
            when OPERATIONAL_LEVEL =>
               exit;
            when others => null;
         end case;
         delay POLLING_DELAY;
      end loop;
   end State_Machine;

end Controller;
