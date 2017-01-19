'''
Script to sample a week interval from the heating and cooling demand overall csv file and save it in another
csv file such that it can be read in Modelica
'''

from __future__ import division
import numpy as np
from modelicares import SimRes
import matplotlib.pyplot as plt
from scipy import optimize
import pandas as pd
from datetime import datetime
from matplotlib import rc
import time
rc('font',**{'family':'sans-serif','sans-serif':['Helvetica']})
## for Palatino and other serif fonts use:
#rc('font',**{'family':'serif','serif':['Palatino']})
rc('text', usetex=True)


# ----- Get the csv file as data frame
Directory = 'C:/Users/Admin/Google Drive/Phd/BRICKER/Heating-Cooling demand/'
File = 'HeatCoolingSimple.csv'
Path = Directory+File
df = pd.read_csv(Path,low_memory=False)
# The first day is a Tuesday

# Define TIME PERIOD FOR MODELICA SPLINE -->   year-month-day hours:minutes:seconds
StartingDate = '1901-07-01 00:00:00'
EndDate      = '1901-07-08 00:00:00'
#Define the name to save the csv final file as
Week = "SummerOneWeek"

DNI_max = np.max(df['DNI'].values)
print DNI_max

# ---------- CALCULATIONS -----------
# remove Nan values
df = df.dropna()
# convert string hours to datetime object
Time_hours = []
for kk in range(len(df['Date'].values)):
    xx = datetime.strptime(str(df['Date'].values[kk]),"%d/%m/%Y %H:%M")
    Time_hours.append(xx)
# get total heat (Chiller COP at 0.6)
df['AllHot'] = df['Heating'] + df['Cooling']/0.6
df['DateTime'] = Time_hours

# -------- SLICE DATA FRAME TO GET THE REQUIRED TIME PERIOD
# Get the index
StartIndex = df[df['DateTime']  ==  StartingDate].index.tolist()
EndIndex = df[df['DateTime']    ==  EndDate].index.tolist()

# This is how you can create a new dataframe
dfWeek =  pd.DataFrame()
dfWeek = dfWeek.append(df)
# This line get the index of the required starting time
dfWeek = dfWeek.loc[StartIndex[0]:EndIndex[0]]


dfWeek["TimeSec"] = dfWeek["TimeSec"] - dfWeek["TimeSec"].iloc[0]
dfWeek["AllHot"] = dfWeek["AllHot"]*1e3
dfWeek['Tamb'] = dfWeek['Tamb'] + 273.15
dfWeek['AllHot'] = dfWeek['AllHot']*-1

# ---- SAVE SLICED DATAFRAME AS CSV
dfWeek['TIME_DNI_Tamb_Qbuild_hours'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['DNI'].astype(str) + ',' + dfWeek['Tamb'].astype(str) + ',' + dfWeek['AllHot'].astype(str) + ',' + dfWeek['Hours'].astype(str) + ';'
#dfWeek['TIME_DNI'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['DNI'].astype(str) + ';'
#dfWeek['TIME_Q'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['AllHot'].astype(str) + ';'
#dfWeek['TIME_Cooling'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['Cooling'].astype(str) + ';'
#dfWeek['TIME_Heating'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['Heating'].astype(str) + ';'
#dfWeek['TIME_Hours'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['Hours'].astype(str) + ';'
#dfWeek['TIME_Tamb'] = dfWeek["TimeSec"].astype(str) + ',' + dfWeek['Tamb'].astype(str) + ';'
dfWeek.to_csv(Directory+Week+'_DATA.csv')



# ----- PLOT COMPLETE DATA FRAME thermal energy required by building
fig = plt.figure()
fig.set_size_inches(8.27,7.79)
fig.subplots_adjust(hspace=.24,right=.99,left=.07,top = .96,bottom = 0.2)
ax1 = fig.add_subplot(3,1,1)
ax1.plot(Time_hours,df['Heating'].values)
ax1.set_ylabel(r'$\dot{Q}_\mathrm{heating}$ [KW]')
#
ax1 = fig.add_subplot(3,1,2)
ax1.plot(Time_hours,df['Cooling'].values)
ax1.set_ylabel(r'$\dot{Q}_\mathrm{cooling}$ [KW]')
#
ax1 = fig.add_subplot(3,1,3)
ax1.plot(Time_hours,df['Heating'].values,label='Heating')
ax1.plot(Time_hours,df['Cooling'].values,label='Cooling')
ax1.set_ylabel(r'$\dot{Q}$ [KW]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)

# -----------  Overall thermal energy demand --------------
fig = plt.figure()
fig.set_size_inches(8.27,3.89)
fig.subplots_adjust(hspace=.24,right=.99,left=.07,top = .96,bottom = 0.2)
ax1 = fig.add_subplot(1,1,1)
ax1.plot(Time_hours,df['AllHot'])
ax1.set_ylabel(r'$\dot{Q}_\mathrm{overAll}$ [KW]')

# ----------- DNI and ambient temperature  -----------
fig = plt.figure()
fig.set_size_inches(8.27,4.15)
fig.subplots_adjust(hspace=.24,right=.99,left=.07,top = .96,bottom = 0.2)
ax1 = fig.add_subplot(2,1,1)
ax1.plot(Time_hours,df['DNI'])
ax1.set_ylabel(r'DNI [W m$^{-2}$]')
#
ax1 = fig.add_subplot(2,1,2)
ax1.plot(Time_hours,df['Tamb'])
ax1.set_ylabel(r'Ambient Temperature [$^{\circ}$C]')


# ----------- Plot Slice dataframe vs Seconds  -----------
fig = plt.figure()
fig.set_size_inches(8.27,3.89)
fig.subplots_adjust(hspace=.24,right=.99,left=.07,top = .96,bottom = 0.2)
ax1 = fig.add_subplot(4,1,1)
ax1.plot(dfWeek['TimeSec'],dfWeek['AllHot'],label=r'$\dot{Q}_\mathrm{tot}$')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'$\dot{Q}$ [KW]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
#
ax1 = fig.add_subplot(4,1,2)
ax1.plot(dfWeek['TimeSec'],dfWeek['DNI'],label=r'DNI')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'DNI [W m$^{-2}$]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
#
ax1 = fig.add_subplot(4,1,3)
ax1.plot(dfWeek['TimeSec'],dfWeek['Tamb'],label=r'Tamb')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'Temperature [$^{\circ}$C]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
#
ax1 = fig.add_subplot(4,1,4)
ax1.plot(dfWeek['TimeSec'],dfWeek['Hours'],label=r'Hours')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'Hours [$^{\circ}$C]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)


# -----------Plot Slice vs Time stamp -----------
fig = plt.figure()
fig.set_size_inches(8.27,3.89)
fig.subplots_adjust(hspace=.24,right=.99,left=.07,top = .96,bottom = 0.2)
ax1 = fig.add_subplot(3,1,1)
ax1.plot(dfWeek['DateTime'],dfWeek['AllHot'],label=r'$\dot{Q}_\mathrm{tot}$')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'$\dot{Q}$ [KW]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
#
ax1 = fig.add_subplot(3,1,2)
ax1.plot(dfWeek['DateTime'],dfWeek['DNI'],label=r'DNI')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'DNI [W m$^{-2}$]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
#
ax1 = fig.add_subplot(3,1,3)
ax1.plot(dfWeek['DateTime'],dfWeek['Tamb'],label=r'Tamb')
ax1.set_xlabel('Time [sec]')
ax1.set_ylabel(r'Temperature [$^{\circ}$C]')
ax1.legend(loc = 'best',numpoints = 1,fancybox='True',shadow='True',labelspacing=0.1)
plt.show()
