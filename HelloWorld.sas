%let mProjectName = OrionStarHW;
%let mProjectPath = &mHomePath./MySASProjects/&mProjectName.;

libname LIB_TMP "&mProjectPath./temp";

filename MSG_CFG "&mProjectPath./config/HWMessageConfig.csv";
proc import datafile=MSG_CFG out=LIB_TMP.MSG_CONFIG dbms=csv replace;
   getnames=yes;
run;

data LIB_TMP.MSG_CONFIG_FILTERED;
   set LIB_TMP.MSG_CONFIG;
   where MessageID = "HELLO_WORLD_FORMAL";
run;

data WORK.GREETING;
   set LIB_TMP.MSG_CONFIG_FILTERED(rename=(Message=Greeting));
   keep Greeting;
run;

proc print data=WORK.GREETING noobs label;
run;