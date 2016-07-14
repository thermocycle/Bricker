within BrickerISES.Components.GeneralCombiTableModel.Tables;
package WaterMassFlowDataTable_3Sept 
 extends BrickerISES.Components.GeneralCombiTableModel.PartialTable(
      final table=dataTable);

// time, dni, ghi, dhi, T, wind speed, wind direction, relative humidity, atmospheric pressure
constant Real[:,:] dataTable=
[
0,1;
3600,1;
7200,1;
10800,1;
14400,1;
18000,1;
21600,1;
25200,1;
28800,16;
32400,11.6;
36000,14.3;
39600,17.2;
43200,20.9;
46800,23;
50400,24.5;
54000,15.3;
57600,12.4;
61200,10.8;
64800,6.78;
68400,1;
72000,1;
75600,1;
79200,1;
82800,1;
86400,1];

end WaterMassFlowDataTable_3Sept;
