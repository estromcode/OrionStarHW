%let mProjectName = OrionStarHW;
%let mProjectPath = &mHomePath./MySASProjects/&mProjectName.;

libname LIB_TMP "&mProjectPath./temp";

filename MSG_CFG "&mProjectPath./config/message_config.csv";
proc import datafile=MSG_CFG out=LIB_TMP.MESSAGE_CONFIG dbms=csv replace;
   getnames=yes;
run;

data WORK.GREETING;
   set LIB_TMP.MESSAGE_CONFIG(rename=(Message=Greeting));
   where MessageID = "HELLO_WORLD_FORMAL";
   keep Greeting;
run;

proc print data=WORK.GREETING noobs label;
run;