# utl_digitize_data_from_image
    Digitizing data points from am image file. Create (x,y) pairs


    INPUT IMAGE

      github (image to digitize)
      https://tinyurl.com/y9uljjyg
      https://github.com/rogerjdeangelis/utl_digitize_data_from_image/blob/master/utl_dotplt.png
      also
      https://www.dropbox.com/s/7lh0lzyewyg6o2l/utl_dotplt1.png?dl=0

      github
      https://github.com/rogerjdeangelis/utl_digitize_data_from_image

    StackOverlow
      https://goo.gl/jrhekz
      http://lukemiller.org/index.php/2011/06/digitizing-data-from-old-plots-using-digitize/

      see
      https://tinyurl.com/y923dgeq
      https://stackoverflow.com/questions/50999818/python-how-to-extract-values-at-particular-points-on-graph


    INPUT
    =====

      d:/png/dotplt.png

      PNG Image (note one ob hidden)

      HEIGHT To digitize this plot and obtain (x,y) values
         |
         |
      75 Y2
         |
         |                                             *
         |
      70 +
         |                             *
         |                                      *
         |                            *
      65 +                      *            *
         |                   *    *
         |                *       *    *
         |
      60 +                *
         |                       *
         |                *
         |             *  *
      55 +
         |
         |
         | *
      50 Y1
         |
         -X1----------+----------+----------+----------X2
          50         75         100        125        150
                         WEIGHT

      EXAMPLE OUTPUT

                                   |         FROM IMAGE
       NAME        weight   height | plot_height   plot_weight
       ----------------------------|--------------------------
       Alfred       112.5       69 |        69.5       111.7
       Alice           84     56.5 |        57.0        84.2
       Barbara         98     65.3 |        65.2        98.2
       Carol        102.5     62.8 |        63.4       101.9
       Henry        102.5     63.5 |        63.4       101.9
      ...


    PROCESS
    =======

        R Paste this into R console (cannot run as macro inside the old text editor)

            library(digitize)
            tmp<-"d:/png/utl_dotplt.png"
            res<-digitize(tmp)

        This will ask you to click on locations on the image

        Steps to digitize points or key locations on a image

        Pause slightly between point and click

           1. Open a dos command window
           2. Type R to bring up R
           3. Copy and paste teh code below
               library(digitize)
               tmp<-"d:/png/utl_dotplt.png"
               res<-digitize(tmp)
           4. Crossairs will appear on the image
               click on X1 in the plot (lower left)
               wait a couple of seconds (1001 1002)
               click on X2
               wait a couple of seconds (1001 1002)
               click on Y1
               wait a couple of seconds (1001 1002)
               click on Y2
            5. Go to dos command window answer questions
                Type x1 '40' <enter>
                Type x2 '160' <enter>
                Type Y1 '50' <enter>
                Type Y2 '75' <enter>
            6. Crosshairs will appear on plot
                click on the points (no wait?)
            7. Right click
               click on stop  (stop appears in the upp right banner)
            8. type 'res'   (this will list the x,y points)
            9. save(res,file="d:/rda/res.rda")

            Return to SAS and run the solution below

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

    OUTPUT
    ======

       WORK.WANT

                           FROM IMAGE             FROM IMAGE
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

    *                _           _
     _ __ ___   __ _| | _____   (_)_ __ ___   __ _  __ _  ___
    | '_ ` _ \ / _` | |/ / _ \  | | '_ ` _ \ / _` |/ _` |/ _ \
    | | | | | | (_| |   <  __/  | | | | | | | (_| | (_| |  __/
    |_| |_| |_|\__,_|_|\_\___|  |_|_| |_| |_|\__,_|\__, |\___|
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

    * EDIT THE LINE PRINTER PLOT IF YOU WANT TO ELIMINATE HEADERS AND FOOTERS
      NOT NEEDED;

    filename dow 'd:/txt/utl_dotplt.txt';
    goptions reset=all border gaccess=gsasfile
              ftext='MingLiU'  htext=1.35 device=png;

    filename gsasfile "d:/png/utl_dotplt.png";

    proc gprint fileref=dow;
    run;
    quit;

    filename gsasfile clear;
    filename dow clear;


    *          _       _   _
     ___  ___ | |_   _| |_(_) ___  _ __
    / __|/ _ \| | | | | __| |/ _ \| '_ \
    \__ \ (_) | | |_| | |_| | (_) | | | |
    |___/\___/|_|\__,_|\__|_|\___/|_| |_|

    ;

    library(digitize)
    tmp<-"d:/png/utl_dotplt.png"
    res<-digitize(tmp)

    * interactive oint selection;

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

    * check;

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

    WANT (Plot_* is digitized data)
    ===============================

                        FROM IMAGE             FROM IMAGE
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



