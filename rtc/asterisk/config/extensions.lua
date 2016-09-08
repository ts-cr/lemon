extensions = {
   default = {
      ["_X."] = function(context, extension)
         app.playback("tt-monkeys")
         --app.dial("SIP/100", 60)
      end;
 
      --["101"] = function(c, e)
       --  app.dial("SIP/101", 60)
      --end;
}