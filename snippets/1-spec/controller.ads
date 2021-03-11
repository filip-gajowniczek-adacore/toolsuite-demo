package Controller is

   type State_Type is (Off, Boot, Testing, Operational);
   -- Logical states defined for the harware
   
   function Get_State return State_Type;
   -- Retrieves the logical state the hardware is in

   task State_Machine is
     entry Initialize;
   end State_Machine;

end Controller;
