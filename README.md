# utl_digitize_data_from_image
Point at positions within an image and get x, y pairs

    ```  Digitizing data points from am image file. Create (x,y) pairs  ```
    ```    ```
    ```  WORKING CODE  ```
    ```  ===========  ```
    ```    ```
    ```      R Paste this into R console (cannot run as macro inside the old text editor)  ```
    ```    ```
    ```          library(digitize)  ```
    ```          tmp<-"d:/png/utl_dotplt.png"  ```
    ```          res<-digitize(tmp)  ```
    ```    ```
    ```      This will ask you to click on locations on the image  ```
    ```    ```
    ```    ```
    ```  see for input image  ```
    ```  https://www.dropbox.com/s/7lh0lzyewyg6o2l/utl_dotplt1.png?dl=0  ```
    ```    ```
    ```  R digitizer package  ```
    ```  https://cran.r-project.org/web/packages/digitize/digitize.pdf  ```
    ```    ```
    ```  Not quite right documentation(some functions have been deprecated)  ```
    ```    ```
    ```  https://goo.gl/jrhekz  ```
    ```  http://lukemiller.org/index.php/2011/06/digitizing-data-from-old-plots-using-digitize/  ```
    ```    ```
    ```    ```
    ```    ```
    ```  Steps to digitize points or key locations on a image  ```
    ```    ```
    ```  Pause slightly between point and click  ```
    ```    ```
    ```     1. Open a dos command window  ```
    ```     2. Type R to bring up R  ```
    ```     3. Copy and paste teh code below  ```
    ```         library(digitize)  ```
    ```         tmp<-"d:/png/utl_dotplt.png"  ```
    ```         res<-digitize(tmp)  ```
    ```     4. Crossairs will appear on the image  ```
    ```         click on X1 in the plot (lower left)  ```
    ```         wait a couple of seconds (1001 1002)  ```
    ```         click on X2  ```
    ```         wait a couple of seconds (1001 1002)  ```
    ```         click on Y1  ```
    ```         wait a couple of seconds (1001 1002)  ```
    ```         click on Y2  ```
    ```      5. Go to dos command window answer questions  ```
    ```          Type X1 <enter>  ```
    ```          Type X2 <enter>  ```
    ```          Type Y1 <enter>  ```
    ```          Type Y2 <enter>  ```
    ```      6. Crosshairs will appear on plot  ```
    ```          click on the points (no wait?)  ```
    ```      7. Right click  ```
    ```         click on stop  ```
    ```      8. type res  ```
    ```      9. save(res,file="d:/rda/res.rda")  ```
    ```    ```
    ```      Return to SAS and run the solution below  ```
    ```    ```
    ```  HAVE  Plot of  ```
    ```  ====  ```
    ```    ```
    ```  Up to 40 obs from sashelp.class total obs=19  ```
    ```    ```
    ```  Obs    NAME     AGE   WEIGHT  ```
    ```    ```
    ```    1    Alfred    14    112.5  ```
    ```    2    Alice     13     84.0  ```
    ```    3    Barbara   13     98.0  ```
    ```    4    Carol     14    102.5  ```
    ```    5    Henry     14    102.5  ```
    ```   ....  ```
    ```    ```
    ```  PNG Image (note one ob hidden)  ```
    ```    ```
    ```  HEIGHT To digitize this plot and obtain (x,y) values  ```
    ```     |   Use R package digitize and click  ```
    ```     |   on positions X1,X2,Y1,Y2 with provided crosshairs in  ```
    ```  75 Y2  in that order. See Xs and Ys on axes  ```
    ```     |  ```
    ```     |                                             *  ```
    ```     |  ```
    ```  70 +  ```
    ```     |                             *  ```
    ```     |                                      *  ```
    ```     |                            *  ```
    ```  65 +                      *            *  ```
    ```     |                   *    *  ```
    ```     |                *       *    *  ```
    ```     |  ```
    ```  60 +                *  ```
    ```     |                       *  ```
    ```     |                *  ```
    ```     |             *  *  ```
    ```  55 +  ```
    ```     |  ```
    ```     |  ```
    ```     | *  ```
    ```  50 Y1  ```
    ```     |  ```
    ```     -X1----------+----------+----------+----------X2  ```
    ```      50         75         100        125        150  ```
    ```                     WEIGHT  ```
    ```    ```
    ```    1 ob hudden  ```
    ```    ```
    ```    ```
    ```  WANT (Plot_* is digitized data)  ```
    ```  ===============================  ```
    ```    ```
    ```                      FROM IMAGE             FROM IMAGE  ```
    ```  NAME        weight  plot_weight    height  plot_height  ```
    ```  ------------------------------------------------------  ```
    ```  Alfred       112.5        111.7        69         69.5  ```
    ```  Alice           84         84.2      56.5         57.0  ```
    ```  Barbara         98         98.2      65.3         65.2  ```
    ```  Carol        102.5        101.9      62.8         63.4  ```
    ```  Henry        102.5        101.9      63.5         63.4  ```
    ```  James           83         84.2      57.3         57.4  ```
    ```  Jane          84.5         84.2      59.8         60.2  ```
    ```  Janet        112.5        112.0      62.5         63.1  ```
    ```  Jeffrey         84         84.2      62.5         63.1  ```
    ```  John          99.5        100.2        59         59.6  ```
    ```  Joyce         50.5         50.2      51.3         51.7  ```
    ```  Judy            90         90.2      64.3         64.4  ```
    ```  Louise          77         78.4      56.3         56.6  ```
    ```  Mary           112        112.0      66.5         66.5  ```
    ```  Philip         150        149.8        72         72.3  ```
    ```  Robert         128        128.0      64.8         65.2  ```
    ```  Ronald         133        133.8        67         67.3  ```
    ```  Thomas          85         84.8      57.5         57.3  ```
    ```  William        112        112.0      66.5         66.5  ```
    ```    ```
    ```    ```
