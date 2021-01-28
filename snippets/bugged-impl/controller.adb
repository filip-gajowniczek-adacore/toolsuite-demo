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
      case Power_Level is
         when 0 => return  Off;
         when 1 .. 9 => return Boot;
         when 10 .. 19 => return Testing;
         when others => return Operational;
      end case;
   end Get_State;

   -------------------
   -- State_Machine --
   -------------------

   task body State_Machine is
   begin
      accept Initialize;
      Set_Power_Level (10);

      loop
         Power_Level := Get_Power_Level;
         case Power_Level is
            when 0 .. 9 => Set_Power_Level (10);
            when 10 .. 19 => Set_Power_Level (20);
            when others => Exit;
         end case;
         delay 1.0;
      end loop;

   end State_Machine;

end Controller;
