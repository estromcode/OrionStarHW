%if %sysfunc(getoption(sysin)) ne %str() %then %do;
   %let mInitPath = %sysfunc(getoption(sysin)); /* batch */
%end;
%else %do;
   %let mInitPath = &_SASPROGRAMFILE; /* interactive */
%end;
%let mProjectPath = %substr(&mInitPath, 1, %length(&mInitPath) - %length(%scan(&mInitPath, -1, /)) - 1);
%put &=mProjectPath;