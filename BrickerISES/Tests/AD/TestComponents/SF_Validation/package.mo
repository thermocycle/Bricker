within BrickerISES.Tests.AD.TestComponents;
package SF_Validation 


annotation (Documentation(info="<html>
<p>In this package the three simulations reported by soltigua in the Combinations_V4 document are
reproduced. Total efficiency and total deliverable power are compared with the results of Soltigua</p>

<p> For both compared variable there is a descrepancy of the order of max 3.5%. At the same time the 
DeltaT (i.e. the difference in temperature at the inlet and outlet of the solar field) 
in the simulation results smaller then the DeltaT in the Soltigua results.</p>
<p> This leads to two possible conclusions:</p>
<ul>
<li> The total net surface considered by Soltigua is bigger than the one reported in the data sheet
<li> The calculation of the efficiency as it is reported in the datasheet of the collector is not the same one used by Soltigua
</ul>

<p> Missing data:</p>
<ul>
<li> Ambient temperature --> imposed to be 35 °C in the simulations performed
</ul>

</html>"));
end SF_Validation;
