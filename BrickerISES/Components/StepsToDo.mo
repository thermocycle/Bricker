within BrickerISES.Components;
model StepsToDo

  // Discuss system model layouy
  // Play with the model
  // Implement Control strategy

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Ellipse(
          extent={{-76,70},{82,-84}},
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid), Text(
          extent={{60,-100},{-58,90}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="!")}),Documentation(info="<HTML>
           
          <p> Prossimi step per il sistema:
          <p> ORC running in cogeneration --> 400kW Most challenging condition for control point of view<\p>
          <p> From 0 to 250 kW solar field runs with constant mass flow rate. No control on T_sol_out<\p>
          <p> From 250 kW to 300 kW. Over production. Solar Field can keep working with no control ---> Thermal DUMP or STORAGE system if not full ( to be dimensioned).<\p>
          <p> From 300 kW to 400 kW. ORC driven by solar. I can still keep the mass flow in the solar field constant.<\p> 
          <p> If Biomass always ON, Solar field run with constant flow.<\p>
          
          <p> Biomass system: read a temperature at biomass exit and impose a certain power to the system.
          <ul>
          <li> PI for Solar Collector - DeltaT constant o T out constant - It regulates the valve 
          <li>  PI for biomass.
          <li> Logic on solar collector.
          <li> Develop ORCunit.
          <li> Weather data.
          <li> Add dumper
          <li> Simulation over a clear day.
          <li> Add Storage at Biomass or Thermocline at solar field???? To be discussed.
          <li> Add bypass ORC system???
          
          <\ul>
           
           
           
           
           </HTML>"));
end StepsToDo;
