with Ada.Text_IO; use Ada.Text_IO;
with Controller; use Controller;

procedure Main is

begin
   State_Machine.Initialize;

   loop
      Put_Line ( State_Type'Image (Get_State) );
      delay POLLING_DELAY;
   end loop;

end Main;
