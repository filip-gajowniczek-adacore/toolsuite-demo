package Controller is

   POLLING_DELAY : constant Duration := 1.0;
   
   type State_Type is (OFF, BOOT, TESTING, OPERATIONAL);
   -- Logical states defined for the harware

   function Get_State return State_Type;
   -- Retrieves the logical state the hardware is in

   task State_Machine is
      entry Initialize;
   end State_Machine;

end Controller;
