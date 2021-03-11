with Ada.Text_IO; use Ada.Text_IO;
with Controller; use Controller;

procedure Main is

begin

   -- The ada code will have the logic for issues commands to change the power level
   -- It will poll for status from the device, and then based on the status
   -- It will do state transitions.
   Put_Line("Initializing Device");
end Main;
