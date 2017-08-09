
*                _              _
 _ __ ___   __ _| | _____      (_)_ __ ___   __ _  __ _  ___
| '_ ` _ \ / _` | |/ / _ \_____| | '_ ` _ \ / _` |/ _` |/ _ \
| | | | | | (_| |   <  __/_____| | | | | | | (_| | (_| |  __/
|_| |_| |_|\__,_|_|\_\___|     |_|_| |_| |_|\__,_|\__, |\___|
                                                  |___/
;

options ls=72 ps=48;
%utlfkil(d:/txt/utl_dotplt.txt);
%utlfkil(d:/png/utl_dotplt.cgm);
filename dow 'd:/txt/utl_dotplt.txt';
proc printto print=dow new;
run;

proc plot data=sashelp.class(keep=name height weight);
plot height*weight='*';
run;quit;

proc printto;
run;
filename dow clear;

* EDIT THE LINE PRINTER PLOT;

filename dow 'd:/txt/utl_dotplt.txt';
goptions reset=all border gaccess=gsasfile
          ftext='MingLiU'  htext=1.35 device=png;

filename gsasfile "d:/png/utl_dotplt.png";

proc gprint fileref=dow;
run;
quit;

filename gsasfile clear;
filename dow clear;

*             _____ _         _       _
 ___  __ _ __|___  | |__   __| | __ _| |_
/ __|/ _` / __| / /| '_ \ / _` |/ _` | __|
\__ \ (_| \__ \/ / | |_) | (_| | (_| | |_
|___/\__,_|___/_/  |_.__/ \__,_|\__,_|\__|

;

%utl_submit_wps64('
options set=R_HOME "C:/Program Files/R/R-3.3.2";
libname wrk "%sysfunc(pathname(work))";
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
load("d:/rda/res.rda");
res;
endsubmit;
import r=res data=wrk.reswps;
run;quit;
');

/*
Up to 40 obs from reswps total obs=18

Obs       X         Y

  1     50.24    51.6708
  2     78.40    56.6213
  3     84.16    56.6213
  4     84.16    57.3639
  5     86.08    58.0446
  6    100.16    59.5916
  7     84.16    60.2104
  8     84.16    63.0569
  9    101.76    63.0569
 10    112.00    63.0569
 11     90.24    64.4183
 12    102.08    63.7376
 13     98.24    65.1609
 14    112.00    66.5223
 15    128.00    65.2228
 16    133.76    67.3267
 17    111.68    69.4926
 18    149.76    72.3391
*/

*                _       _
 _ __ ___   __ _| |_ ___| |__
| '_ ` _ \ / _` | __/ __| '_ \
| | | | | | (_| | || (__| | | |
|_| |_| |_|\__,_|\__\___|_| |_|

;

proc sql;
  select
    l.name
   ,mean(l.weight) as weight
   ,mean(r.x)      as plot_weight format=5.1
   ,mean(l.height) as height
   ,mean(r.y)      as plot_height format 5.1
  from
    sashelp.class as l left join reswps as r
  on
    (abs(weight-x) + abs(height-y)) < 1.8
  group
    by name
  order
    by name
;quit;

/*
NAME        weight  plot_weight    height  plot_height
------------------------------------------------------
Alfred       112.5        111.7        69         69.5
Alice           84         84.2      56.5         57.0
Barbara         98         98.2      65.3         65.2
Carol        102.5        101.9      62.8         63.4
Henry        102.5        101.9      63.5         63.4
James           83         84.2      57.3         57.4
Jane          84.5         84.2      59.8         60.2
Janet        112.5        112.0      62.5         63.1
Jeffrey         84         84.2      62.5         63.1
John          99.5        100.2        59         59.6
Joyce         50.5         50.2      51.3         51.7
Judy            90         90.2      64.3         64.4
Louise          77         78.4      56.3         56.6
Mary           112        112.0      66.5         66.5
Philip         150        149.8        72         72.3
Robert         128        128.0      64.8         65.2
Ronald         133        133.8        67         67.3
Thomas          85         84.8      57.5         57.3
William        112        112.0      66.5         66.5
*/




