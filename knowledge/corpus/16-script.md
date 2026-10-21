# 脚本与状态机

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### execute（pump_in）｜状态执行

- **关键词**：execute, bool, if, faz_desired, int, string, pr_heading, first_pass, double, else, pr_speed, pr_altitude, extern, 状态执行
- **出处**：`air_to_air/rules/pump_in.txt:68-154`
- **片段**：

```text
   execute 
       writeln_d("T = ",TIME_NOW," ",iacid.Name()," pump_in");   
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
#      FileIO iout = FileIO();
#      if (iout_print)
#      {
#         iout.Open(iout_path, "append");
#      }
      faz_desired = "pump_in";
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2];
      int nbg = saPROC.PerceivedBandits().Size();
      string flight_lead = iflite.CommanderName();
      pr_heading = iacid.Heading(); // initialize to current heading
      first_pass = false;

      if (!flt_lead && !solo) { pr_heading = WsfSimulation.FindPlatform(flight_lead).Heading(); }
      if (sam_spiked) 
      {  
         faz_desired = "pump";
         reason = "DEFEND AGAINST SAM";
      }

      double avg_hdg; double min_hdg = 180;
      if (ppmjid.Track().IsValid() && ppmjid.Track().BearingValid())
      {
         pr_heading = iacid.TrueBearingTo(ppmjid.Track());
      }
      else if (nbg > 0 && (flt_lead || solo) )
      {  
         foreach ( WsfSA_EntityPerception saent in saPROC.PerceivedBandits() ) 
         { 
            if (!saent.Track().IsValid() || !saent.Track().LocationValid()) 
            {   
               continue;
            }
            avg_hdg = avg_hdg + iacid.TrueBearingTo(saent.Track()); // get the average heading
            if (MATH.Fabs(iacid.RelativeBearingTo(saent.Track())) < min_hdg ) 
            {  
               min_hdg = MATH.Fabs(iacid.RelativeBearingTo(saent.Track()));
            }
         } 
         avg_hdg = avg_hdg / nbg;
         pr_heading = avg_hdg;
      }
      else if (TIME_NOW - t_faz_switch < 2.0) // if i'm not aware of any bad guys, just turn 180 degress from my current escape heading
      {
         pr_heading = iacid.Heading() + 180;
      }

      pr_speed = iacid->COMMIT_SPD * atmos.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid->COMMIT_ALT; 
      extern double pr_gees;
      if (BrawlMover)
      {
         pr_gees = BRAWLER.MaxSustainedGs();
      }
      else
      {
         pr_gees = 3;
      }
      pr_vector(iacid,pr_heading,pr_speed,pr_altitude,pr_gees);

      if (time_ok && MATH.Fabs(iacid.Heading() - pr_heading) <= 20 ) 
      {  
         if (plan_1 <= 3) { faz_desired = "direct"; reason = "plan_1 = direct"; }
         else if (plan_1 == 4) { faz_desired = "vectoring"; reason = "plan_1 = vectoring"; }
         else { writeln("WARNING...ftr_faz invalid playbook value for ",iacid.Name());}
      }
      if (iout_print) {iout.Write(write_str(" pump_in... hdg = ",pr_heading,"\n"));}
#      if (iout_print){iout.Close();}
      return Success(reason);      
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, faz_desired, int, string, pr_heading, first_pass, double, else, pr_speed

### execute（pump）｜状态执行

- **关键词**：execute, int, string, if, faz_desired, bool, pr_altitude, pr_speed, pr_heading, else, return, 状态执行
- **出处**：`air_to_air/rules/pump.txt:62-112`　（同签名共 2 处，另见 `air_to_air/rules/crank.txt:66`）
- **片段**：

```text
   execute 
       writeln_d("T = ",TIME_NOW," ",iacid.Name()," pump");   
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2];
      WsfPlatform my_wing;
      string element = "";
      if (iacid.CommandChain("ELEMENT").IsValid())
      {
         WsfCommandChain el_chain = iacid.CommandChain("ELEMENT");
         if (el_chain.CommanderName() == iacid.Name() && el_chain.SubordinateCount() > 0)
         {
            element = el_chain.SubordinateEntry(0).Name(); // should only be one element
         }
         else if (el_chain.CommanderName() != iacid.Name() && el_chain.Commander().IsValid())
         {
            element = el_chain.CommanderName(); // should only be one element
         }
      }
      if (element != "" && WsfSimulation.FindPlatform(element).IsValid()) 
      {  
         my_wing = WsfSimulation.FindPlatform(element); 
      }
      faz_desired = "pump"; 

      bool turn_hot = false;  // set to true if I desire to turn hot
#      reason = "pump_in";
      pr_altitude = iacid->PUMP_ALT;
      pr_speed = iacid->PUMP_SPD*atmos.SonicVelocity(pr_altitude);
      pr_heading = escape_hdg(iacid); // get your escape heading
      // slice maneuver
      pr_slice(iacid,pr_heading,pr_speed,pr_altitude); 
   # 
      if ( TIME_NOW >= t_phase )
      {  
         turn_hot = true;
         reason = "TIME LIMIT REACHED...TURN HOT";
      }
      else if ( rng_cls_hst >= (iacid->PUMP_RNG) && rng_cls_sam >= (iacid->PUMP_RNG))
      { 
          turn_hot = true;
         reason = "SEPARATION RNG ACHIEVED TO PUMP_IN";
      }
   // if turn_hot = true, go to pump_in
      if(turn_hot)
      {  
         faz_desired = "pump_in";
         t_phase=TIME_NOW + 25;
      }
      return Success(reason);            
   end_execute
```

- **演示要点**：演示 execute 的参数：int, string, if, faz_desired, bool, pr_altitude, pr_speed, pr_heading, else, return

### execute（ingress）｜状态执行

- **关键词**：execute, bool, if, int, faz_desired, reason, pr_heading, pr_speed, pr_altitude, else, return, 状态执行
- **出处**：`air_to_air/rules/ingress.txt:62-140`
- **片段**：

```text
   execute 
      writeln_d("T = ",TIME_NOW," ",iacid.Name()," ingress");   
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2]; 
      faz_desired = "ingress"; // will change desired faz if criteria met
      reason = "INGRESSING";
      pr_heading = iacid.Heading();
      if (!ppmjid.IsNull() && ppmjid.Track().IsValid() && ppmjid.Track().BearingValid())
      {
         pr_heading = iacid.TrueBearingTo(ppmjid.Track());
      }
      pr_speed = iacid->COMMIT_SPD * atmos.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid->COMMIT_ALT;

      // formation fly if PRDATA says to, else fly vector towards highest prioritized target
      if (iacid->MISSION_TYPE == "ESCORT")
      {
         pr_escort_formation(iacid);
      }
      else if (VECTOR_FORMATION[0] == 0)
      {
         extern double pr_gees;
         if (BrawlMover)
         {
            pr_gees = BRAWLER.MaxSustainedGs();
         }
         else
         {
            pr_gees = 3;
         }
         pr_vector(iacid,pr_heading,pr_speed,pr_altitude,pr_gees); 
      }
      else
      {
         pr_formation(iacid,pr_heading,pr_speed,pr_altitude,FORM_FLY_CHAIN);
      }
      
      // start faz transition logic
      if (rng_cls_hst <= iacid->COMMIT_RNG && !stiff_arm_all)
      {
         iacid.SetAuxData("IADS_engage",false);
         if ( plan_1 <= 3 )
         {  
            faz_desired = "direct"; 
         }
         else if ( plan_1 == 4 )
         {  
            faz_desired = "vectoring"; 
         }
         else 
         { 
            writeln("WARNING...PLAYBOOK 1 invalid");  
         }
         reason = " ".Join({"WITHIN COMMIT RANGE...PLAYBOOK[0]=",(string)plan_1});
         t_phase=TIME_NOW + 10;
      }
      else if (ppmjid.IsValid() && !ppmjid.IsNull() && ppmjid.Track().IsValid() && !ppmjid.Track().IsNull() && ppmjid.Track().LandDomain())
      {
         faz_desired = "sam_vctr";
         reason = "ENGAGING SAM";
         t_phase=TIME_NOW + 10;
      }
      return Success(reason);      
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, int, faz_desired, reason, pr_heading, pr_speed, pr_altitude, else, return

### execute（route_rules）｜状态执行

- **关键词**：execute, bool, if, rte_ind, desdir, dir0, pr_altitude, pr_heading, faz, else, return, 状态执行
- **出处**：`air_to_air/rules/route_rules.txt:148-307`
- **片段**：

```text
   execute
      writeln_d("T = ",TIME_NOW," ",iacid.Name()," RouteRules");   
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
#      BRAWLER.SetConsciousnessEventTime(4.0);
// print out each A/C's phase
 #      drawCircle(PLATFORM,PROCESSOR.UpdateInterval(), "phase", iacid->rule_type, "solid", 2, "line", Vec3.Construct(0.9, 0.6, 0.0), 1000);
#      pr_pos_bias.Clear();

#    FileIO iout = FileIO();
#    FileIO log = FileIO();
#    if (log_print)
#    {
#       log.Open(log_path, "append");
#    }
    if (iout_print)
    {
#       iout.Open(iout_path, "append");
       iout.Write(write_str("\nROUTE_RULES...SIMULATION TIME HAS REACHED ",TIME_NOW, " s\n",
                   "A/C ",iacid.Name(),"\n"));
    }

//    if i'm flight lead, go to my route point
//    if i'm not flight lead and i'm not formation flying with my flight lead, go to route point
      // check and see if i hit my current route point, if so, go to next route point
   if (rte_ind < (ROUTE.Size()-1) && iacid.GroundRangeTo(ROUTE[rte_ind].Location()) < 1.0*MATH.M_PER_NM()) // 1 NM is close enough
   {
      rte_ind = rte_ind + 1;
   }
   iout.Write(write_str("\n Route Point ",rte_ind," of ",ROUTE.Size(),"\n"));
   
   // set heading, speed, and altitude to fly on
   pr_heading = iacid.TrueBearingTo(ROUTE[rte_ind].Location());
   pr_speed = ROUTE.GetSpeed(rte_ind);
   pr_altitude = ROUTE[rte_ind].Altitude();

   if (bng_fuel)
   {
      WsfGeoPoint home_vector = WsfGeoPoint(home_base); // create new geopoint with an altitude
      home_vector.Set(home_vector.Latitude(),home_vector.Longitude(),iacid->EGRESS_ALT);
      desdir = RelativePositionNED(PLATFORM.Location(),home_vector); 
      dir0 = desdir.Normal();
      pr_altitude = iacid->EGRESS_ALT;
      pr_heading = iacid.TrueBearingTo(home_vector);
      faz = "egress";
      log.Write(write_str(iacid.Name()," Route Rules...Bingo Fuel: Egress to Base","\n"));
      if (BrawlMover)
      {
         PLATFORM.FlyVectorWithSpeed(dir0,BRAWLER.MaxSustainedGs(),iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude()));
      }
      else
      {
         PLATFORM.GoToLocation(home_vector);
         PLATFORM.GoToSpeed(iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude()));
      }
      return Running("Bingo Fuel: Egress to Base");
   }

   // if i am escorting, formation fly with my PE
   if (iacid->MISSION_TYPE == "ESCORT")
   {
      pr_escort_formation(iacid);
#      if (iout_print){iout.Close();}
#      if (log_print){log.Close();}
      return Success("ESCORTING IN FORMATION FLIGHT");
   }

   // if i hit my last route point, go home (home_base at egress speed)
   if (rte_ind == (ROUTE.Size()-1) && iacid.GroundRangeTo(ROUTE[rte_ind].Location()) < 1.0*MATH.M_PER_NM()) // 1 NM is close enough
   {         
      WsfGeoPoint home_vector = WsfGeoPoint(home_base); // create new geopoint with an altitude
      home_vector.Set(home_vector.Latitude(),home_vector.Longitude(),iacid->EGRESS_ALT);
      desdir = RelativePositionNED(PLATFORM.Location(),home_vector); 
      dir0 = desdir.Normal();
      pr_altitude = iacid->EGRESS_ALT;
      pr_heading = iacid.TrueBearingTo(home_vector);
      if (flt_lead)
      {
         faz = "egress";
         for (int i = 0; i < iflite.SubordinateCount(); i += 1)
         {
            if (iflite.SubordinateEntry(i).IsValid()) 
            { 
               iflite.SubordinateEntry(i)->faz = "egress";
            }
         }
      }
      else
      {
         faz = "egress";
         iflite.Commander()->faz = "egress";
         for (int i = 0; i < iflite.PeerCount(); i += 1)
         {
            if (iflite.PeerEntry(i).IsValid()) 
            { 
               iflite.PeerEntry(i)->faz = "egress";
            }
         }
         for (int i = 0; i < iflite.SubordinateCount(); i += 1)
         {
            if (iflite.SubordinateEntry(i).IsValid()) 
            { 
               iflite.SubordinateEntry(i)->faz = "egress";
            }
         }
      }
      log.Write(write_str(iacid.Name()," Finished Route: Egress to Base","\n"));
      if (BrawlMover)
      {
         PLATFORM.FlyVectorWithSpeed(dir0,BRAWLER.MaxSustainedGs(),iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude()));
      }
      else
      {
         PLATFORM.GoToLocation(home_vector);
         PLATFORM.GoToSpeed(iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude()));
      }   }
   else
   {
      if (VECTOR_FORMATION[0] != 0) // formation fly
      {
         pr_formation(iacid,pr_heading,pr_speed,pr_altitude,FORM_FLY_CHAIN);
      }
      else // else vector fly
      {
         if (BrawlMover)
         {
            pr_vector(iacid,pr_heading,pr_speed,pr_altitude,BRAWLER.MaxSustainedGs());
         }
         else
         {
            PLATFORM.TurnToHeading(pr_heading);
            PLATFORM.GoToSpeed(pr_speed);
            PLATFORM.GoToAltitude(pr_altitude);
         }      
      }
   }

      // fly to route point
#      pr_speed = iacid->route_speed*atm.SonicVelocity(iacid.Altitude());        
#      desdir = RelativePositionNED(PLATFORM.Location(),route[rte_ind]);
#      dir0 = desdir.Normal();
#      PLATFORM.FlyVectorWithSpeed(dir0,BRAWLER.MaxSustainedGs(),pr_speed);
 
// close log.txt and iout.txt
#   if (iout_print){iout.Close();}
#   if (log_print){log.Close();}
      return Success("EXECUTING ROUTE RULES");
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, rte_ind, desdir, dir0, pr_altitude, pr_heading, faz, else, return

### execute（reaction）｜状态执行

- **关键词**：execute, bool, if, int, pr_gees, pr_speed, turn_hot, reason, faz_desired, return, 状态执行
- **出处**：`air_to_air/rules/reaction.txt:63-129`
- **片段**：

```text
   execute 
       writeln_d("T = ",TIME_NOW," ",iacid.Name()," reaction");   
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2];

   faz_desired = "reaction"; 

   first_pass = false;
   bool turn_hot = false;  // set to true if I desire to turn hot
   reason = "pump_in";
   pr_speed = iacid->COMMIT_SPD*atmos.SonicVelocity(iacid.Altitude());
   pr_altitude = iacid->COMMIT_ALT;
   if(BrawlMover)
   {
      pr_gees = BRAWLER.MaxSustainedGs();
   }
   else
   {
      pr_gees = 3;
   }
   if (plan_2 < 3) // 60 or 90 degree offset
   {
      if (TIME_NOW - t_faz_switch < 2)
      {
         pr_heading = react_hdg(iacid,plan_2);
         if (plan_2 == 2){pr_speed = iacid->PUMP_SPD*atmos.SonicVelocity(iacid.Altitude());}
      }
      pr_vector(iacid,pr_heading,pr_speed,pr_altitude,pr_gees);
   }
   else if (plan_2 == 3) // slice
   {
      pr_speed = iacid->PUMP_SPD*atmos.SonicVelocity(iacid.Altitude());
      if (TIME_NOW - t_faz_switch < 2)
      {
         pr_heading = escape_hdg(iacid); // get your escape heading
      }
      pr_slice(iacid,pr_heading,pr_speed,pr_altitude);  // perform a slice maneuver
   }  
   if ( TIME_NOW >= t_phase )
   {  
      turn_hot = true;
      reason = "TIME LIMIT REACHED...TURN HOT";
   }

// if turn_hot = true, go to pump_in
   if(turn_hot)
   {  
      faz_desired = "pump_in";
      t_phase=TIME_NOW + 20;
   }
      return Success(reason);         
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, int, pr_gees, pr_speed, turn_hot, reason, faz_desired, return

### execute（egress）｜状态执行

- **关键词**：execute, bool, if, faz_desired, pr_speed, pr_altitude, else, pr_heading, return, 状态执行
- **出处**：`air_to_air/rules/egress.txt:60-89`
- **片段**：

```text
   execute 
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
      faz_desired = "egress";
      pr_speed    = iacid->EGRESS_SPD*atmos.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid->EGRESS_ALT;
      if (BrawlMover)
      {
         pr_gees = BRAWLER.MaxSustainedGs();
      }
      else
      {
         pr_gees = 3;
      }
      pr_heading = iacid.TrueBearingTo(home_base);
      pr_vector(iacid,pr_heading,pr_speed,pr_altitude,pr_gees);
      return Success(reason);      
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, faz_desired, pr_speed, pr_altitude, else, pr_heading, return

### execute（orbit_rules）｜状态执行

- **关键词**：execute, if, faz, pr_heading, pr_speed, pr_altitude, desdir, dir0, return, 状态执行
- **出处**：`air_to_air/rules/orbit_rules.txt:178-227`
- **片段**：

```text
   execute
#      BRAWLER.SetConsciousnessEventTime(1.0);
// print out each A/C's phase
#      drawCircle(PLATFORM,PROCESSOR.UpdateInterval(), "phase", rule_type, "solid", 2, "line", Vec3.Construct(0.9, 0.6, 0.0), 1000);
#      pr_pos_bias.Clear();

#    FileIO iout = FileIO();
#    FileIO log = FileIO();
#    if (log_print)
#    {
#       log.Open(log_path, "append");
#    }
    if (iout_print)
    {
#       iout.Open(iout_path, "append");
       iout.Write(write_str("\nORBIT_FAZ...SIMULATION TIME HAS REACHED ",TIME_NOW, " s\n",
                   "A/C ",iacid.Name(),"\n"));
    }

#   if (iout_print) {iout.Writeln(write_str(" nbg = ",nbg));}
   
   if (bng_fuel)
   {
      faz = "egress";
      pr_heading = iacid.TrueBearingTo(home_base);
      pr_speed = iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid->EGRESS_ALT;
   }
   else
   {
      CAP_POINTS = {CAP1,CAP2,CAP3,CAP4};
      desdir = RelativePositionNED(iacid.Location(),CAP_POINTS[cap_ind]);
      dir0 = desdir.Normal();
      pr_heading = iacid.TrueBearingTo(CAP_POINTS[cap_ind]);
      pr_speed = iacid->orbit_spd*atm.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid.Altitude();
      PLATFORM.FlyHeadingSpeedAltitude(pr_heading,pr_speed,pr_altitude,iacid->orbit_gees,200.0*MATH.M_PER_FT());
  
      // increment index if near cap point
      if (iacid.SlantRangeTo(CAP_POINTS[cap_ind]) <= 0.25*MATH.M_PER_NM())
      {
         cap_ind = cap_ind + 1;
         if (cap_ind == 4) { cap_ind = 0; } // re-set if I hit CAP4 (index 3)
      }
   }
//    close log.txt and iout.txt
#      if (iout_print){iout.Close();}
#      if (log_print){log.Close();}
      return Success("EXECUTING ORBIT RULES");
   end_execute
```

- **演示要点**：演示 execute 的参数：if, faz, pr_heading, pr_speed, pr_altitude, desdir, dir0, return

### execute（sam_vctr）｜状态执行

- **关键词**：execute, bool, if, faz_desired, int, else, pr_heading, pr_altitude, return, 状态执行
- **出处**：`air_to_air/rules/sam_vctr.txt:65-153`　（同签名共 2 处，另见 `air_to_air/rules/vectoring.txt:64`）
- **片段**：

```text
   execute
      bool BrawlMover;
      WsfBrawlerProcessor BRAWLER;
      if (iacid.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         for (int i=0; i<iacid.ProcessorCount();i+=1)
         {
            if (iacid.ProcessorEntry(i).Type() == "WSF_BRAWLER_PROCESSOR")
            {
               BrawlMover = true;
               BRAWLER = (WsfBrawlerProcessor)iacid.ProcessorEntry(i);
               break;
            }
         }
      }   
      faz_desired = "sam_vctr"; 
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2];
      
      // set the speed based on commit speed and if I want to sprint above the mach on the first pass
      if(first_pass)
      {
         pr_speed = (iacid->COMMIT_SPD + iacid->SPRINT_SPD)*atmos.SonicVelocity(iacid.Altitude());
      }
      else
      {
         pr_speed = iacid->COMMIT_SPD * atmos.SonicVelocity(iacid.Altitude());
      }
      pr_heading = pr_sam_vctr_hdg(iacid); // calculate desired heading to fly on
      pr_altitude = iacid->COMMIT_ALT; // set desired altitude

      // fly on the desired vector
      if (BrawlMover)
      {
         pr_gees=BRAWLER.MaxSustainedGs();
      }
      else
      {
         pr_gees=3;
      }
      pr_vector(iacid,pr_heading,pr_speed,pr_altitude,pr_gees);
      if ( alerted || rng_cls_hst <= iacid->DOR )
      {  
          if ( plan_3 == 1 && pump_per && time_ok)
          {  
            faz_desired = "pump";
             reason = "ALWAYS PUMP AT MAR";
             t_phase=TIME_NOW + iacid->TDRAG;        
          }
          else if ( plan_3 == 2 && pump_per && time_ok && threatnd)
          {  
            faz_desired = "pump";
             reason = "ALWAYS PUMP WHEN THREATENED";
             t_phase=TIME_NOW + iacid->TDRAG;
          }
         else if (needil && apole_tct) // crank tactics
         {  
            faz_desired = "crank";
            reason = "SUPPORTING MISSILES";
            t_phase = TIME_NOW + 10;
         }
      }   
      else if (needil && apole_tct) // crank tactics
      {  
         faz_desired = "crank";
         reason = "SUPPORTING MISSILES";
         t_phase=TIME_NOW + 10;
      }
      else if (rng_cls_hst > iacid->COMMIT_RNG*1.5 && rng_cls_sam > iacid->COMMIT_RNG*1.5)
      {  
         faz_desired = "ingress";
         reason = "WEAPONS AND FUEL LEFT";
      }
      else if (ppmjid.Track().IsValid() && ppmjid.Track().AirDomain())
      {
         faz_desired = "vectoring";
         reason = "ENGAGING AIRCRAFT";
         t_phase=TIME_NOW + 10;
      }
      else if ((rng_cls_sam - iacid->SAM_PMP_RNG) > (rng_cls_hst - iacid->DOR))
      {
//    Hostile aircraft is closer to threatend range than SAM is to SAM pump range => switch to vectoring
         faz_desired = "vectoring";
         reason = "ENGAGE AIRCRAFT";
         t_phase=TIME_NOW + 10;
      }   
      return Success(reason);            
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, faz_desired, int, else, pr_heading, pr_altitude, return

### execute（intercept_rules）｜状态执行

- **关键词**：execute, if, faz, pr_heading, pr_speed, pr_altitude, foreach, return, 状态执行
- **出处**：`air_to_air/rules/intercept_rules.txt:101-160`
- **片段**：

```text
   execute
#      BRAWLER.SetConsciousnessEventTime(3.0);
// print out each A/C's phase
#      drawCircle(PLATFORM,PROCESSOR.UpdateInterval(), "phase", rule_type, "solid", 2, "line", Vec3.Construct(0.9, 0.6, 0.0), 1000);
#      pr_pos_bias.Clear();

#    FileIO iout = FileIO();
#    FileIO log = FileIO();
#    if (log_print)
#    {
#       log.Open(log_path, "append");
#    }
    if (iout_print)
    {
#       iout.Open(iout_path, "append");
       iout.Write(write_str("\nINTERCEPT_RULES...SIMULATION TIME HAS REACHED ",TIME_NOW, " s\n",
                   "A/C ",iacid.Name(),"\n"));
    }

   if (bng_fuel)
   {
      faz = "egress";
      pr_heading = iacid.TrueBearingTo(home_base);
      pr_speed = iacid->EGRESS_SPD*atm.SonicVelocity(iacid.Altitude());
      pr_altitude = iacid->EGRESS_ALT;
   }
   else
   {
      foreach (WsfTask tsk in tsk_mgr.ReceivedTaskList())
      {
         WsfTrack ltrk = iacid.MasterTrackList().FindTrack(tsk.LocalTrackId());
         // target is dead, complete task and then cancel it
         if (!ltrk.Target().IsValid() && iacid == iacid.Commander("IFLITE"))
         {
            tsk_mgr.TaskComplete(tsk.TrackId(),tsk.TaskType());
            tsk_mgr.CancelTask(tsk.TrackId());
            foreach (WsfPlatform sub in iacid.Subordinates("IFLITE"))
            {
               if (sub.IsValid() && !sub.CategoryMemberOf("missile"))
               {
                  tsk_mgr.CancelTask(sub,tsk.TrackId());
               }
            }
         }
         if (ltrk.IsValid() && tsk.TaskType() == "INTERCEPT")
         {
#            pr_intercept(iacid,ltrk,iacid->COMMIT_SPD*atm.SonicVelocity(iacid.Altitude()),BRAWLER);
            pr_heading = iacid.TrueBearingTo(ltrk);
            // formation fly to intercept point
            pr_formation(iacid,pr_heading,iacid->COMMIT_SPD*atm.SonicVelocity(iacid.Altitude()),iacid->COMMIT_ALT,FORM_FLY_CHAIN);
            iout.Write(write_str(" Intercepting ",ltrk.TargetName(),"\n"));
            return Success(" ".Join({"Intercepting",ltrk.TargetName()}));
         }
      }
   }
//    close log.txt and iout.txt
#      if (iout_print){iout.Close();}
#      if (log_print){log.Close();}
      return Success("EXECUTING INTERCEPT RULES");
   end_execute
```

- **演示要点**：演示 execute 的参数：if, faz, pr_heading, pr_speed, pr_altitude, foreach, return

### execute（behavior_interpret_flank_jobs）｜状态执行

- **关键词**：execute, double, bool, string, if, int, else, foreach, 状态执行
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:162-260`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:162`、`base_types/processors/ripr_agents/aifl/behavior_interpret_flank_jobs.txt:72`）
- **片段**：

```text
   execute
      writeln_d("executing interpret_flank_jobs");

      WsfGeoPoint zonePoint    = (WsfGeoPoint)mMyJob.GetData("ZonePoint");
      double      zoneBearing  = (double)     mMyJob.GetData("ZoneBearing");
      bool        bearingValid = (bool)       mMyJob.GetData("ZoneBearingValid");
      WsfZone     flankZone    = (WsfZone)    mMyJob.GetData("FlankZone");
      double      flankDist    = (double)     mMyJob.GetData("FlankDistance");
      string      zoneName     = (string)     mMyJob.GetData("ZoneName");

      WsfGeoPoint flankPoint   = mFlankJobIdToFlankPointMap.Get( mMyJob.GetId() );

      if (mDrawFlankLines)
      {
         //draw the outline of the flank zone
         flankZone.DebugDrawZone(zonePoint, zoneBearing*MATH.RAD_PER_DEG());

         //draw flank point of interest (target we are flanking), white dot
         draw.BeginPoints();
            draw.SetColor(1.0, 1.0, 1.0);
            draw.Vertex(zonePoint);
         draw.End();

         if (bearingValid)
         {
            //cluster heading is with reference to east (instead of north), so subtract 90 degrees
           #doulbe clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing - 90.0 );
            double clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing );

            WsfGeoPoint bPoint = WsfGeoPoint(zonePoint);
            bPoint.Extrapolate( clusterBearingTrue, flankDist );

            //draw red-orange line to represent heading of target's flight
            draw.BeginLines();
               draw.SetColor(1.0, 0.3, 0.1);
               draw.Vertex(zonePoint);
               draw.Vertex(bPoint);
            draw.End();
         }

         //draw green line to the flank point (the side we are flying towards)
         draw.BeginLines();
            draw.SetColor(0.1, 1.0, 0.4);
            draw.Vertex(zonePoint);
            draw.Vertex(flankPoint);
         draw.End();
      }

      //see if any subordinates are in the flank zone, if they are... flanking is done
      foreach( WsfPlatform sub in PLATFORM.Subordinates() )
      {
         if (flankZone.PointIsInside(sub.Location(), zonePoint, zoneBearing*MATH.RAD_PER_DEG(), 0.0))
         {
            writeln_d( "@@@ aifl subordinate ", sub.Name(), " inside flank zone!");
            mMyJob.SetProgress( PROCESSOR, 1.0 );   #mark the job as complete
         }
      }

      int NumSubordinates = PLATFORM.Subordinates().Count();

      //if flank job doesn't exist yet, create it
      WsfRIPRJob job = PROCESSOR.GetJobByData("flankPointName", zoneName);
      if( ! job.IsValid() )
      {
         if (NumSubordinates > 0)
         {
            extern double cFlankPointPriority;
            //set max job winners to number of subordinates (so all can proceed into zone)
            WsfRIPRJob temp = WsfRIPRJob.Create(   PROCESSOR,
                                                   "pursue-point",
                                                   "pursue-point-" + zoneName,
                                                   cFlankPointPriority,
                                                   NumSubordinates);
            temp.SetData( "targetTrackName", zoneName ); //hack for now, so other code here works
            temp.SetData( "targetPoint", flankPoint );
            temp.SetData( "flankPointName", zoneName );
            PROCESSOR.AddJob(temp);
            writeln_d("--- ", PLATFORM.Name(), " job change, ADD: ", zoneName );
         }
      }
      else
      {
         job.SetData( "targetPoint" , flankPoint );
         writeln_d("   aiFL - updated flank pursue-point job ", zoneName, ", ( ", flankPoint.Latitude(), ", ", flankPoint.Longitude(), " )" );
      }

      //remove all jobs that aren't involved with flanking
      Array<WsfRIPRJob> jobs = PROCESSOR.GetJobs();
      foreach (WsfRIPRJob x in jobs)
      {
         string name = (string)x.GetData("targetTrackName");
         if ( name != zoneName )
         {
            writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", name);
            PROCESSOR.RemoveJob(x);
         }
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：double, bool, string, if, int, else, foreach

### execute（behavior_pursue-target_pathing）｜状态执行

- **关键词**：execute, extern, double, string, int, if, else, bool, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target_pathing.txt:113-288`
- **片段**：

```text
   execute
      writeln("executing pursue-target_pathing.");

      extern int      GetBucket             (double, double);
      extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);

      //get target from ripr processor, to be sure
      WsfTrack targetTrack = PROCESSOR.GetTarget();

      double ownSpeed       = GetBucket(PLATFORM.Speed(), cBUCKET_BASE);
      double engageRangeMin = GetBucket(ownshipEngagementRangeMin, cBUCKET_BASE);
      double engageRangeMax = GetBucket(ownshipEngagementRangeMax, cBUCKET_BASE);
      double slantRangeTo   = GetBucket(PLATFORM.SlantRangeTo(targetTrack), cBUCKET_BASE);
      double targetSpeed    = GetBucket(targetTrack.Speed(), cBUCKET_BASE);
      string positioning    = CalculatePositioning(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
      int    weaponsActive  = PROCESSOR.WeaponsActive(targetTrack);

      string mPursuitMode = "pure";

      if (weaponsActive > 0)
      {
         mPursuitMode = "f-pole";
      }
      else if (targetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail" &&
                targetSpeed  >= ownSpeed)
         {
            mPursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail")
         {
            mPursuitMode = "lag";
         }
         else if (slantRangeTo  > engageRangeMax ||
                (slantRangeTo <= engageRangeMax &&
                 (positioning  == "head-to-head" ||
                  positioning  == "head-to-tail")))
         {
            mPursuitMode = "pure";
         }
      }


      #TransitionToINTERCEPT( targetTrack, mPursuitMode );

      #PLATFORM.GoToSpeed(cINTERCEPT_SPEED);
      #if (mUseMoverDuringPursuit)
      #{
      #   #nothing
      #   PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200);
      #}
      #else
      #{
      #  #TransitionToWAIT(true);     #FAIL
      #  #PLATFORM.FollowRoute("DEFAULT_ROUTE", "CLOSEST_POINT"); #better
      #  PLATFORM.ReturnToRoute();
      #  PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200, true);
      #}
      #PROCESSOR.SetUpdateInterval(cFAST_UPDATE_RATE);
      #writeln_d("    Transition to INTERCEPT due to pursuing ", targetTrack.TargetName(), " mode ", mPursuitMode);
      #end_script
      #CheckAndFire(targetTrack);  #do this in the weapon management behavior???


      // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

      if (targetTrack.IsNull())
      {
         writeln_d("behavior pursue-target_pathing, targetTrack is null");
         return;
      }


      writeln_d("      ", mPursuitMode, " pursuit");

      // If we got the altitude from the TRACK, match it
      extern double cDEFAULT_ALTITUDE;
      double interceptAltitude = cDEFAULT_ALTITUDE;
      //double interceptAltitude = PLATFORM.Altitude();
      double interceptHeading  = PLATFORM.Heading();
      double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);
      bool useIntercept = false;

      double desiredSpeed = cINTERCEPT_SPEED;
      if (targetTrack.VelocityValid() && targetTrack.AirDomain())
      {
         extern double EffectiveRange(WsfPlatform, WsfTrack);

         extern double GetWeaponRangeMax (WsfPlatform, Array<Map<string, Object>>);
         extern double GetWeaponRangeMin (WsfPlatform, Array<Map<string, Object>>);

         double rangeMin = GetWeaponRangeMin(PLATFORM, mWeaponArray);
         double rangeMax = GetWeaponRangeMax(PLATFORM, mWeaponArray);

         double speedOfTarget = targetTrack.Speed();
         double effRange      = EffectiveRange(PLATFORM, targetTrack);
         double missileWindow = rangeMax - rangeMin;
         double speedWindow   = cINTERCEPT_SPEED - speedOfTarget;


         if(effRange < rangeMax &&  effRange > rangeMin)
         {
            double rangeScale = (effRange - rangeMin) / missileWindow;
            desiredSpeed = speedOfTarget + (speedWindow * rangeScale);
         }
         else if (effRange <= rangeMin)
         {
            desiredSpeed = speedOfTarget;
         }

         if (desiredSpeed < cWAIT_SPEED)
         {
            desiredSpeed = cWAIT_SPEED;
         }
      }
      PLATFORM.GoToSpeed(desiredSpeed);

      WsfGeoPoint startGeoPoint = PLATFORM.Location();
      WsfGeoPoint endGeoPoint = targetTrack.ReportedLocation();

      if (mPursuitMode == "lead")
      {
         double timeToIntercept = 0.0;
         WsfWaypoint interceptPoint = WsfWaypoint();

         timeToIntercept = PLATFORM.InterceptLocation3D(targetTrack, interceptPoint);
         // If timeToIntercept is positive then we know intercept is possible
         if (timeToIntercept > 0.0)
         {
            endGeoPoint = targetTrack.ReportedLocation();

            #writeln_d("    T=", TIME_NOW, " TTI=", timeToIntercept, " range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", interceptPoint.Heading());
            #writeln_d("      lead pursuit: ", interceptPoint.Latitude(), ", ", interceptPoint.Longitude(), ", ", interceptPoint.Altitude());
         }
         else
         {
            writeln_d("    lead pursuit attempt with timeToIntercept < 0");
         }
      }
      else if (mPursuitMode == "f-pole")
      {
         extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
         endGeoPoint   = PLATFORM.Location();
         //f-pole towards a point 30 miles away in the correct direction
         endGeoPoint.Extrapolate(interceptHeading, 55560);

         #writeln_d("    T=", TIME_NOW, ", range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", PLATFORM.TrueBearingTo(targetTrack));
      }
      else
      {
         //otherwise... just fly at the target
         endGeoPoint = targetTrack.ReportedLocation();

         #writeln_d("    T=", TIME_NOW, ", range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", PLATFORM.TrueBearingTo(targetTrack),
         #   " (", endGeoPoint.Latitude(), "/", targetTrack.Latitude(), ",", endGeoPoint.Longitude(), "/", targetTrack.Longitude(), ")");
      }

      //make sure we don't dive, staying above the target is fine
      if (endGeoPoint.Altitude() < interceptAltitude)
      {
         endGeoPoint.Set(endGeoPoint.Latitude(), endGeoPoint.Longitude(), interceptAltitude);
      }

      if (!PLATFORM.FindAndSetPath(startGeoPoint, endGeoPoint))
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE","CLOSEST_POINT");
        #PLATFORM.Comment("Route: DEFAULT");
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：extern, double, string, int, if, else, bool

### execute（select_wpn）｜状态执行

- **关键词**：execute, extern, int, bool, double, if, foreach, return, 状态执行
- **出处**：`air_to_air/rules/select_wpn.txt:103-334`
- **片段**：

```text
   execute
      writeln_d("T = ",TIME_NOW," ",iacid.Name()," select_wpn");
#WsfPlatform iacid = PLATFORM;
      extern WsfPlatform iacid;
      Array<int> bng_msl = iacid->WINCHESTER;
      int fox3_left = iacid.Weapon("fox3").QuantityRemaining();
      int fox2_left = iacid.Weapon("fox2").QuantityRemaining();
      int fox1_left = iacid.Weapon("fox1").QuantityRemaining();
      WsfWeapon weap;
      bool in_rtr;
      double rmax_fraction;
      bool debug;
// SA PROCESSOR default to fox3 for weapon selected
      WsfSA_Processor saPROC = (WsfSA_Processor)PROCESSOR;
      saPROC.SetMasterArm(true); 
      saPROC.SetSelectedWeapon("fox3");               
      if (iout_print)
      {
         iout.Write(write_str(" select_wpn ","\n"));
      }
      foreach (WsfSA_EntityPerception saent in saPROC.PerceivedBandits())
      {
         if (!saent.Track().IsValid()){continue;}
         //Always shoot "agm" against SAMs regard less of SHOT_DOC - will need to change if you have multiple Air-to-Ground weapons
         if(saent.Track().LandDomain())
         {
            mapPRMISL_AC[saent] = "agm";
            mapMXTGTD[saent] = 1; //single target SAMs - change if needed
            mapMXTGT_AC[saent] = 1;
            if(iout_print) {iout.Write(write_str("  ",saent.Track().TargetName().Pad(-12),mapPRMISL_AC[saent].Pad(-5),"\n"));}
            continue;
         }

         if (fox3_left == 0 && fox2_left == 0 && fox1_left == 0)
         { // out of missiles,  
            continue;
         }
         // initialize these variables 
         mapMXTGTD[saent] = 1; // in Brawler, this is initialized in the SCNRIO in the flight section
         mapMXTGT_AC[saent] = 1; // in Brawler, this is initialized in the SCNRIO in the flight section
         mapPRMISL_AC[saent] = "fox3"; // initialize to MRM
         Array<int> shot_count = count_shot(iacid,saent,saPROC.PerceivedBandits());
   /* 
                -3: SRM at anything within SRM range. Fox3 for primary
                    LAR calculation but requires RDR or IRST track to support. Fox3 double 
                    tap option inside of 90% WEZ
   */
         if (iacid->SHOT_DOC == -3)
         {
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}
            mapMXTGTD[saent] = 1;
            // Fox2 if within SRM range
            if (iacid.SlantRangeTo(saent.Track()) <= iacid->SRM_SLCT && fox2_left > 0 
                && iacid.Weapon("fox2").LaunchComputer().LookupResult(saent.Track())[0] <= RPEAK_LOC[1])
            {
               mapPRMISL_AC[saent] = "fox2";
               if (fox2_left > 2){mapMXTGT_AC[saent] = 3;}
            }
            if (fox3_left>=2 && iacid.SlantRangeTo(saent.Track())/iacid.Weapon("fox3").LaunchComputer().LookupResult(saent.Track())[0] <= 0.9)
            {
               mapMXTGTD[saent] = 2;
               // check if I have a radar or irst track on ltrk target
               if (iacid.MasterRawTrackList().IsValid())
               {
                  foreach (WsfTrack trk in iacid.MasterRawTrackList())
                  {
                     if (trk.TargetName() == saent.Track().TargetName() 
                         && (trk.SensorType() == "WSF_RADAR_SENSOR" || trk.SensorType() == "WSF_IRST_SENSOR"))
                     {  
                        mapPRMISL_AC[saent] = "fox3";
                     }
                  }
               }
            }
         }
   /* 
                -2: SRM at anything within SRM range. Fox3 for primary
                    LAR calculation and no track requirement. Fox3 double 
                    tap option inside of 90% WEZ
   */
         else if (iacid->SHOT_DOC == -2)
         {
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}
            mapMXTGTD[saent] = 1;
            // Fox2 if within SRM range
            if (iacid.SlantRangeTo(saent.Track()) <= iacid->SRM_SLCT && fox2_left > 0 
                && iacid.Weapon("fox2").LaunchComputer().LookupResult(saent.Track())[0] <= RPEAK_LOC[1])
            {
               mapPRMISL_AC[saent] = "fox2";
               if (fox2_left > 2){mapMXTGT_AC[saent] = 3;}
            }
         
            if (fox3_left>=2 && iacid.Weapon("fox3").LaunchComputer().LookupResult(saent.Track())[0] <= 0.9)
            {
               mapMXTGTD[saent] = 2;
               mapPRMISL_AC[saent] = "fox3";
            }
         }
   /* 
                -1: Default selection to Fox3 with no MXTGT_AC change (MXTGTD default)
   */
         else if (iacid->SHOT_DOC == -1)
         {
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}
            // fox2 if within SRM range
            if(fox2_left && iacid.SlantRangeTo(saent.Track()) <= iacid->SRM_SLCT && iacid.SlantRangeTo(saent.Track())
               < iacid.Weapon("fox2").LaunchComputer().LookupResult(saent.Track())[0])
            {
               mapPRMISL_AC[saent] = "fox2";
               mapMXTGTD[saent] = 2;
               if (fox2_left > 2) { mapMXTGT_AC[saent] = 2; }
            }
         }
   /* 
                0: Default selection
   */
         else if (iacid->SHOT_DOC == 0)
         {
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}      
         }
   /* 
                 1: Single Tap with SRMs, Two total shots at threat
                    Single tap anything 100% of Fox3 WEZ
                    Double tap option for the following scenarios:
                      -Tgt is threatening my protected entity/location
                      -Tgt is within 75% of threatened range and fox3 GE 4
                      -Tgt is within 50% of threatened range and fox3 GE 2
   */
         else if (iacid->SHOT_DOC == 1)
         {
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}
            mapMXTGTD[saent] = 1;
            // Fox2 if within SRM range
            if (iacid.SlantRangeTo(saent.Track()) <= iacid->SRM_SLCT && fox2_left > 0 
                && iacid.Weapon("fox2").LaunchComputer().LookupResult(saent.Track())[0] <= RPEAK_LOC[1])
            {
               mapPRMISL_AC[saent] = "fox2";
               mapMXTGTD[saent] = 2;
            }
         
            if (fox3_left>=2 && iacid.Weapon("fox3").LaunchComputer().LookupResult(saent.Track())[0] <= RPEAK_LOC[2])
            {
               mapMXTGTD[saent] = 1;
               mapPRMISL_AC[saent] = "fox3";
               // tgt is threatening the location I'm protecting
               if (iacid->MISSION_TYPE == "DCA" ) // PROTECTING should be string of lat,long locations 
               {  foreach (string pe_geo in PROTECTING) // loop through all the protected locations
                  {
                     if (saent.Track().CurrentLocation().SlantRangeTo(WsfGeoPoint.Construct(pe_geo)) < iacid->DISPLN_X)
                     {
                        mapMXTGTD[saent] = 2;
                        mapMXTGT_AC[saent] = 2;
                     }
                  }
               }
               // tgt is threatening my protected entity
               else if (iacid->MISSION_TYPE == "HVAADCA" || iacid->MISSION_TYPE == "ESCORT" )
               {
                  foreach (string pe in PROTECTING) // loop through all the platform names i'm protecting
                  {   
                     for (int i = 0; i <= saPROC.PerceivedAssets().Size() - 1; i = i + 1)
                     {  
                        WsfSA_EntityPerception asset = saPROC.PerceivedAssets()[i]; 
                        WsfGeoPoint aloc = WsfGeoPoint().Construct(asset.Lat(),asset.Lon(),asset.Altitude());
                        // see if I have a perception of that asset and check perceived range between hostiles and protected entity
                        if (asset.PerceivedName() == pe && 
                           saent.Track().CurrentLocation().SlantRangeTo(aloc) < iacid->DISPLN_X)
                        {  
                           mapMXTGTD[saent] = 2;
                           mapMXTGT_AC[saent] = 2;
                        } 
                     }
                  }
               }
               // tgt is getting too close
               if (iacid.SlantRangeTo(saent.Track()) < iacid->DOR*0.75 && fox3_left >=4)
               {  
                  mapMXTGTD[saent] = 2;
                  mapMXTGT_AC[saent] = 2;
               }    
               else if (iacid.SlantRangeTo(saent.Track()) < iacid->DOR*0.5 && fox3_left >=2)
               {  
                  mapMXTGTD[saent] = 2;
                  mapMXTGT_AC[saent] = 2;
               }          
            } 
         }
   /* 
                 2: Double tap with SRM at anyting within SRM range
                    Double tap with MRM at anything within 100% WEZ
   */
         else if (iacid->SHOT_DOC == 2)
         {   
            // Default to fox3
            if(fox3_left >= 1){mapPRMISL_AC[saent] = "fox3";}
            else if (fox2_left >= 1){mapPRMISL_AC[saent] = "fox2";}
            else if (fox1_left >= 1){mapPRMISL_AC[saent] = "fox1";}
            mapMXTGTD[saent] = 2;
            mapMXTGT_AC[saent] = 2;
            // Fox2 if within SRM range
            if (iacid.SlantRangeTo(saent.Track()) <= iacid->SRM_SLCT && fox2_left > 0 
                && iacid.Weapon("fox2").LaunchComputer().LookupResult(saent.Track())[0] <= RPEAK_LOC[1])
            {
               mapPRMISL_AC[saent] = "fox2";
            } 
         } 
   #      if(iout_print) {iout.Write(write_str("  ",ltrk.TargetName().Pad(-12),mapPRMISL_AC[ltrk].Pad(-5)));}
      }


   #   foreach (WsfLocalTrack track in mapPRMISL_AC)
   #   {   iout.Write(write_str(track.TargetName()," ",mapPRMISL_AC[track]));}
   

   #   if(iout_print) {iout.Close();}
      return Success();      
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, int, bool, double, if, foreach, return

### execute（ftr_rules）｜状态执行

- **关键词**：execute, if, faz, t_faz_switch, return, faz_desired, for, 状态执行
- **出处**：`air_to_air/rules/ftr_rules.txt:176-338`
- **片段**：

```text
   execute
       writeln_d("T = ",TIME_NOW," ",iacid.Name()," ftr_rules");   
#      BRAWLER.SetConsciousnessEventTime(0.5);
#    FileIO log = FileIO();
#    FileIO iout = FileIO();
#    if (log_print)
#    {
#       log.Open(log_path, "append");
#    }
#    if (iout_print)
#    {
#       iout.Open(iout_path, "append");    
#    }
/************************************************************************************
*************************************************************************************
*                           START TRANSITION LOGIC                                  *
*************************************************************************************
*************************************************************************************/
//-   GENERIC PHASE CHANGE LOGIC
// if i'm bingo missile or bingo fuel and not at the merge -> egress
if( bng_msl && !flt_guiding && faz != "egress")
{  
   faz_desired = "egress";
   reason = "bingo missile";
}
else if ( bng_fuel && faz != "egress")
{  
   faz_desired = "egress";
   reason = "bingo fuel";
}
else if (attack_success && !flt_guiding && faz != "egress")
{  
   faz_desired = "egress";
   reason = "MISSION OVER";
}
else if (first_pass && react && rng_cls_hst <= iacid->REACT_RNG && faz != "reaction")
{  
   faz_desired = "reaction";
   reason = "PRE-PLANNED MANEUVER";
   t_phase=TIME_NOW + iacid->TDRAG;
}
//react to SAM if threatened and allowed to pump
else if (sam_threatnd && pump_per && time_ok)
{
   faz_desired = "pump";
   reason = "THREATENED BY A SAM";
   t_phase=TIME_NOW + (Math.Max(iacid->TDRAG,rng_cls_sam*MATH.NM_PER_M()));
}

bool ftr_lead = false;
if (iacid.Name() == FTR_RULES_CHAIN.CommanderName())
{
   ftr_lead = true;
}

// set aux data so flight lead will know if flight mates desire a phase change
if (!ftr_lead && !solo && faz_desired != faz) 
{  
   dzr_change=true;
   dzr_phase=faz_desired;
}

// phase changing
// check if my flight mates are requesting a change in phase, if so, change whole flight's phase
if (ftr_lead)
{
   for (int i=0 ; i<FTR_RULES_CHAIN.SubordinateCount() ; i+=1)
   {
      if (!FTR_RULES_CHAIN.SubordinateEntry(i).CategoryMemberOf("missile") && (FTR_RULES_CHAIN.SubordinateEntry(i)->dzr_change || FTR_RULES_CHAIN.SubordinateEntry(i)->faz_desired!=FTR_RULES_CHAIN.SubordinateEntry(i)->faz) )
      {
         if (FTR_RULES_CHAIN.SubordinateEntry(i)->faz_desired != FTR_RULES_CHAIN.SubordinateEntry(i)->faz)
         {
            dzr_phase = FTR_RULES_CHAIN.SubordinateEntry(i)->faz_desired;
         }
         else
         {
            dzr_phase = FTR_RULES_CHAIN.SubordinateEntry(i)->dzr_phase;
         }
         reason = FTR_RULES_CHAIN.SubordinateEntry(i)->reason;
         t_phase = FTR_RULES_CHAIN.SubordinateEntry(i)->t_phase;
         dzr_change = true;
      }
   }
}
// I'm flight lead and someone in my flight desires a change in phase, change everyones phase in my flight
if (ftr_lead && dzr_change)
{
   for (int i=0 ; i < FTR_RULES_CHAIN.SubordinateCount() ; i=i+1)
   {  // skip this iteration if mate is no longer a valid platform in the sim
      if (!FTR_RULES_CHAIN.SubordinateEntry(i).IsValid() || FTR_RULES_CHAIN.SubordinateEntry(i).IsNull() || FTR_RULES_CHAIN.SubordinateEntry(i).CategoryMemberOf("missile")) 
      {continue;} 
      WsfPlatform mate = FTR_RULES_CHAIN.SubordinateEntry(i);
      if (!mate->solo && mate != iacid)
      {  
         if (log_print){log.Write(write_str(mate.Name()," CHANGING PHASE FROM ",mate->faz," TO ",dzr_phase," REASON: ",reason,"\n"));}
         if (iout_print){iout.Write(write_str(mate.Name()," CHANGING PHASE FROM ",mate->faz," TO ",dzr_phase," REASON: ",reason,"\n"));}
         mate->faz = dzr_phase;
         mate->faz_desired = dzr_phase;
         mate->t_faz_switch = TIME_NOW;
         mate->dzr_change = false;
         mate->t_phase = t_phase;
         mate->reason = reason;
         if(mate->faz == "pump"){mate->n_pump = mate->n_pump + 1;}
      } 
   }
   // now change flt lead's phase
   if (log_print){log.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",dzr_phase," REASON: ",reason,"\n"));}
   if (iout_print){iout.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",dzr_phase," REASON: ",reason,"\n"));}
   faz = dzr_phase;
   faz_desired = dzr_phase;
   t_faz_switch = TIME_NOW;
   if(faz == "pump"){n_pump = n_pump + 1;}
   dzr_change = false;
   return Success("CHANGING PHASE1"); // end here
}

// if i'm flight lead and phase change desired, change phase for whole flight, if i'm solo change my phase
if (faz != faz_desired && (ftr_lead || solo) )
{
   if (solo) // if i'm solo, only change my phase
   {  
     if (log_print){log.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",faz_desired," REASON: ",reason,"\n"));}
     if (iout_print){iout.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",faz_desired," REASON: ",reason,"\n"));}
     faz = faz_desired;
     t_faz_switch = TIME_NOW;
     if(faz == "pump"){n_pump = n_pump + 1;}
     return Success("CHANGING PHASE2");
   }
//   if i'm flight lead, change phase of whole flight to my phase
  else if (ftr_lead)
  {
      if (log_print){log.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",faz_desired," REASON: ",reason,"\n"));}
      if (iout_print){iout.Write(write_str(iacid.Name()," CHANGING PHASE FROM ",faz," TO ",faz_desired," REASON: ",reason,"\n"));}
      faz = faz_desired; 
      faz_desired = faz_desired;
      t_faz_switch = TIME_NOW;
      if(faz == "pump"){n_pump = n_pump + 1;}
      for  (int i =0; i < FTR_RULES_CHAIN.SubordinateCount(); i+=1)
      {   // skip this iteration if mate is no longer a valid platform in the sim
         if (!FTR_RULES_CHAIN.SubordinateEntry(i).IsValid() || FTR_RULES_CHAIN.SubordinateEntry(i).CategoryMemberOf("missile")) {continue;} 
         WsfPlatform mate = FTR_RULES_CHAIN.SubordinateEntry(i);
         if (mate.IsNull() || !mate.IsValid()) {continue;} // if mate doesn't exist, cycle through to next iteration 
         if (mate->solo) 
         { /*nothing*/ } // if my mate is solo, don't command him any longer
         else
         {  
            if (log_print){log.Write(write_str(mate.Name()," CHANGING PHASE FROM ",mate->faz," TO ",faz_desired," REASON: ","flight lead decision","\n"));}
            if (iout_print){iout.Write(write_str(mate.Name()," CHANGING PHASE FROM ",mate->faz," TO ",faz_desired," REASON: ","flight lead decision","\n"));}
            mate->faz = faz_desired;
            mate->faz_desired = faz_desired;
            mate->t_faz_switch = TIME_NOW;
            mate->t_phase = t_phase;
            mate->reason = ": ".Join({"flight lead decision",reason});
            if(mate->faz == "pump"){mate->n_pump = mate->n_pump + 1;}
         } 
      }
   }
} 
      return Success("EXECUTING FIGHTER RULES");
//  close log.txt and iout.txt
#   if (iout_print){iout.Close();}
#   if (log_print){log.Close();}
   end_execute
```

- **演示要点**：演示 execute 的参数：if, faz, t_faz_switch, return, faz_desired, for

### execute（behavior_pursue-target_pathing）｜状态执行

- **关键词**：execute, double, string, int, if, else, bool, 状态执行
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pursue-target_pathing.txt:113-288`
- **片段**：

```text
   execute
      writeln("executing pursue-target_pathing.");

     #extern int      GetBucket             (double, double);
     #extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);

      //get target from ripr processor, to be sure
      WsfTrack targetTrack = PROCESSOR.GetTarget();

      double ownSpeed       = GetBucket(PLATFORM.Speed(), cBUCKET_BASE);
      double engageRangeMin = GetBucket(ownshipEngagementRangeMin, cBUCKET_BASE);
      double engageRangeMax = GetBucket(ownshipEngagementRangeMax, cBUCKET_BASE);
      double slantRangeTo   = GetBucket(PLATFORM.SlantRangeTo(targetTrack), cBUCKET_BASE);
      double targetSpeed    = GetBucket(targetTrack.Speed(), cBUCKET_BASE);
      string positioning    = CalculatePositioning(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
      int    weaponsActive  = PROCESSOR.WeaponsActive(targetTrack);

      string mPursuitMode = "pure";

      if (weaponsActive > 0)
      {
         mPursuitMode = "f-pole";
      }
      else if (targetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail" &&
                targetSpeed  >= ownSpeed)
         {
            mPursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail")
         {
            mPursuitMode = "lag";
         }
         else if (slantRangeTo  > engageRangeMax ||
                (slantRangeTo <= engageRangeMax &&
                 (positioning  == "head-to-head" ||
                  positioning  == "head-to-tail")))
         {
            mPursuitMode = "pure";
         }
      }


      #TransitionToINTERCEPT( targetTrack, mPursuitMode );

      #PLATFORM.GoToSpeed(cINTERCEPT_SPEED);
      #if (mUseMoverDuringPursuit)
      #{
      #   #nothing
      #   PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200);
      #}
      #else
      #{
      #  #TransitionToWAIT(true);     #FAIL
      #  #PLATFORM.FollowRoute("DEFAULT_ROUTE", "CLOSEST_POINT"); #better
      #  PLATFORM.ReturnToRoute();
      #  PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200, true);
      #}
      #PROCESSOR.SetUpdateInterval(cFAST_UPDATE_RATE);
      #writeln_d("    Transition to INTERCEPT due to pursuing ", targetTrack.TargetName(), " mode ", mPursuitMode);
      #end_script
      #CheckAndFire(targetTrack);  #do this in the weapon management behavior???


      // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

      if (targetTrack.IsNull())
      {
         writeln_d("behavior pursue-target_pathing, targetTrack is null");
         return;
      }


      writeln_d("      ", mPursuitMode, " pursuit");

      // If we got the altitude from the TRACK, match it
     #extern double cDEFAULT_ALTITUDE;
      double interceptAltitude = cDEFAULT_ALTITUDE;
      //double interceptAltitude = PLATFORM.Altitude();
      double interceptHeading  = PLATFORM.Heading();
      double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);
      bool useIntercept = false;

      double desiredSpeed = cINTERCEPT_SPEED;
      if (targetTrack.VelocityValid() && targetTrack.AirDomain())
      {
        #extern double EffectiveRange(WsfPlatform, WsfTrack);

        #extern double GetWeaponRangeMax (WsfPlatform, Array<Map<string, Object>>);
        #extern double GetWeaponRangeMin (WsfPlatform, Array<Map<string, Object>>);

         double rangeMin = GetWeaponRangeMin(PLATFORM, mWeaponArray);
         double rangeMax = GetWeaponRangeMax(PLATFORM, mWeaponArray);

         double speedOfTarget = targetTrack.Speed();
         double effRange      = EffectiveRange(PLATFORM, targetTrack);
         double missileWindow = rangeMax - rangeMin;
         double speedWindow   = cINTERCEPT_SPEED - speedOfTarget;


         if(effRange < rangeMax &&  effRange > rangeMin)
         {
            double rangeScale = (effRange - rangeMin) / missileWindow;
            desiredSpeed = speedOfTarget + (speedWindow * rangeScale);
         }
         else if (effRange <= rangeMin)
         {
            desiredSpeed = speedOfTarget;
         }

         if (desiredSpeed < cWAIT_SPEED)
         {
            desiredSpeed = cWAIT_SPEED;
         }
      }
      PLATFORM.GoToSpeed(desiredSpeed);

      WsfGeoPoint startGeoPoint = PLATFORM.Location();
      WsfGeoPoint endGeoPoint = targetTrack.ReportedLocation();

      if (mPursuitMode == "lead")
      {
         double timeToIntercept = 0.0;
         WsfWaypoint interceptPoint = WsfWaypoint();

         timeToIntercept = PLATFORM.InterceptLocation3D(targetTrack, interceptPoint);
         // If timeToIntercept is positive then we know intercept is possible
         if (timeToIntercept > 0.0)
         {
            endGeoPoint = targetTrack.ReportedLocation();

            #writeln_d("    T=", TIME_NOW, " TTI=", timeToIntercept, " range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", interceptPoint.Heading());
            #writeln_d("      lead pursuit: ", interceptPoint.Latitude(), ", ", interceptPoint.Longitude(), ", ", interceptPoint.Altitude());
         }
         else
         {
            writeln_d("    lead pursuit attempt with timeToIntercept < 0");
         }
      }
      else if (mPursuitMode == "f-pole")
      {
        #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
         endGeoPoint   = PLATFORM.Location();
         //f-pole towards a point 30 miles away in the correct direction
         endGeoPoint.Extrapolate(interceptHeading, 55560);

         #writeln_d("    T=", TIME_NOW, ", range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", PLATFORM.TrueBearingTo(targetTrack));
      }
      else
      {
         //otherwise... just fly at the target
         endGeoPoint = targetTrack.ReportedLocation();

         #writeln_d("    T=", TIME_NOW, ", range: ", PLATFORM.SlantRangeTo(targetTrack), " true-bearing: ", PLATFORM.TrueBearingTo(targetTrack),
         #   " (", endGeoPoint.Latitude(), "/", targetTrack.Latitude(), ",", endGeoPoint.Longitude(), "/", targetTrack.Longitude(), ")");
      }

      //make sure we don't dive, staying above the target is fine
      if (endGeoPoint.Altitude() < interceptAltitude)
      {
         endGeoPoint.Set(endGeoPoint.Latitude(), endGeoPoint.Longitude(), interceptAltitude);
      }

      if (!PLATFORM.FindAndSetPath(startGeoPoint, endGeoPoint))
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE","CLOSEST_POINT");
        #PLATFORM.Comment("Route: DEFAULT");
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：double, string, int, if, else, bool

### execute（behavior_guide_weapons）｜状态执行

- **关键词**：execute, extern, double, if, string, for, else, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_guide_weapons.txt:128-327`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_guide_weapons.txt:116`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing guide_weapons, T=", TIME_NOW);
      //PLATFORM.Comment("guide_weapons");

      extern double cDEFAULT_ALTITUDE;
      double interceptAltitude = cDEFAULT_ALTITUDE;

      WsfTrack targetTrack = ((WsfRIPRProcessor)PROCESSOR).GetTarget();
      if (targetTrack.IsValid())
      {
        #extern Array<Map<string, Object>>     mWeaponArray;
        #extern WsfTrack GetTrackByName       (WsfPlatform, string);
        #extern double   GetWeaponRangeMax    (WsfPlatform, Array<Map<string, Object>>);
        #extern string   CalculatePositioning (WsfPlatform, WsfTrack, double);

         //perform a decent estimation of desired intercept angle
         //  (to use as a starting point for intelligent maneuvering for guiding missiles)
         double ownSpeed       = PLATFORM.Speed();
         double targetSpeed    = targetTrack.Speed();
        #double engageRangeMax = GetWeaponRangeMax(PLATFORM, mWeaponArray);
         double engageRangeMax = GetWeaponRangeMax(PLATFORM);

         double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
         string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
         //"pure" pursuit (by default)
         mInterceptHeading = PLATFORM.TrueBearingTo(targetTrack);
         if (((WsfRIPRProcessor)PROCESSOR).WeaponsActive(targetTrack) > 0)
         {
            //"f-pole" pursuit (fly offset)
           #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
            mInterceptHeading = MaximizeFPole(PLATFORM, targetTrack, mOffsetAngle);
         }
         else if (targetTrack.AirDomain()        &&
                  slantRangeTo >= engageRangeMax &&
                  positioning  != "head-to-head" &&
                  positioning  != "head-to-tail" &&
                  targetSpeed  >= ownSpeed)
         {
            //"lead" pursuit
            WsfWaypoint interceptPoint = WsfWaypoint();
            double timeToIntercept = PLATFORM.InterceptLocation3D(targetTrack, interceptPoint);
            // If timeToIntercept is positive then we know intercept is possible
            if (timeToIntercept > 0.0)
            {
               mInterceptHeading = interceptPoint.Heading();
            }
         }
         if ((targetTrack.ElevationValid() || targetTrack.LocationValid()) && targetTrack.Altitude() > interceptAltitude)
         {
            interceptAltitude = targetTrack.Altitude();
         }
         if ( (interceptAltitude - PLATFORM.Altitude()) < 100)
         {
            interceptAltitude = PLATFORM.Altitude();
         }
      }
#      else
#      {
#         writeln_d("no target track, not changing course for weapon guidance!");
#      }

      //double minYaw = PLATFORM.RelativeBearingTo(targetTrack);
      //double maxYaw = minYaw;
      double minYaw = MATH.NormalizeAngleMinus180_180(mInterceptHeading - PLATFORM.Heading());
      double maxYaw = minYaw;

      //first be sure to cover any uplinks against a current target
      string targetName = ((WsfRIPRProcessor)PROCESSOR).GetTargetName();
      double tMin = minYaw;
      double tMax = maxYaw;
      for (int up=0; up<((WsfRIPRProcessor)PROCESSOR).UplinkCount(); up = up+1)
      {
         WsfPlatform weaponPlatform = ((WsfRIPRProcessor)PROCESSOR).UplinkPlatformEntry(up);
         WsfTrack weaponTarget = weaponPlatform.CurrentTargetTrack();
         if (weaponTarget.TargetName() != targetName)
         {
            continue;
         }
         if (weaponTarget.IsValid()       &&
             weaponTarget.BelievedAlive() &&
             ((WsfRIPRProcessor)PROCESSOR).WeaponsActive(weaponTarget) )
         {
            tMin = MATH.Min(tMin, PLATFORM.RelativeBearingTo(weaponTarget));
            tMax = MATH.Max(tMax, PLATFORM.RelativeBearingTo(weaponTarget));
            double coverage = tMax - tMin;
            if ((mSensorAzimuthHalfAngle*2*0.9) > coverage) //take off 10% for padding
            {
              //can cover this target
              minYaw = tMin;
              maxYaw = tMax;
            }
            else
            {
              //can NOT cover this target, drop the uplink
               string msg = write_str(PLATFORM.Name(), " CAN NOT SUPPORT ACTIVE UPLINK AGAINST ", weaponTarget.TargetName());
               //PLATFORM.Comment(msg);
               writeln_d(msg);
            }
         }
      }
      //iterate over current uplinks, find relative angles, adjust bounds
      for (int up=0; up<((WsfRIPRProcessor)PROCESSOR).UplinkCount(); up = up+1)
      {
         WsfPlatform weaponPlatform = ((WsfRIPRProcessor)PROCESSOR).UplinkPlatformEntry(up);
         WsfTrack weaponTarget = weaponPlatform.CurrentTargetTrack();
         if (weaponTarget.IsValid()       &&
             weaponTarget.BelievedAlive() &&
             ((WsfRIPRProcessor)PROCESSOR).WeaponsActive(weaponTarget) )
         {
            tMin = MATH.Min(tMin, PLATFORM.RelativeBearingTo(weaponTarget));
            tMax = MATH.Max(tMax, PLATFORM.RelativeBearingTo(weaponTarget));
            double coverage = tMax - tMin;
            if ((mSensorAzimuthHalfAngle*2*0.9) > coverage) //take off 10% for padding
            {
              //can cover this target
              minYaw = tMin;
              maxYaw = tMax;
            }
            else
            {
              //can NOT cover this target, drop the uplink.
               string msg = write_str(PLATFORM.Name(), " CAN NOT SUPPORT ACTIVE UPLINK AGAINST ", weaponTarget.TargetName());
               //PLATFORM.Comment(msg);
               writeln_d(msg);
            }
         }
      }

      if (((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().IsValid())
      {
         for (int channel = 1; channel < ((WsfRIPRProcessor)PROCESSOR).GetNumJobChannels(); channel = channel + 1)
         {
            double tempMin = minYaw;
            double tempMax = maxYaw;

            WsfRIPRJob aJob = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().GetJobFor(((WsfRIPRProcessor)PROCESSOR), channel);
            if (!aJob.IsValid())
            {
               continue;
            }
            if (aJob.Name() == "weapon_uplink")
            {
               string targetName = (string)aJob.GetData("targetTrackName");
               WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);
               if (!targetTrack.IsValid() || !targetTrack.BelievedAlive())
               {
                  continue;
               }
               if (((WsfRIPRProcessor)PROCESSOR).WeaponsActive(targetTrack) <= 0)
               {
                  continue;
               }

               tempMin = MATH.Min(tempMin, PLATFORM.RelativeBearingTo(targetTrack));   //[-180,180]
               tempMax = MATH.Max(tempMax, PLATFORM.RelativeBearingTo(targetTrack));   //[-180,180]
               double neededCoverage = tempMax - tempMin;
               double sensorCoverage = mSensorAzimuthHalfAngle * 2 * 0.9;  //take 10% off for padding
               if (sensorCoverage > neededCoverage)
               {
                 //can cover this target
                 minYaw = tempMin;
                 maxYaw = tempMax;
               }
               else
               {
                 //can NOT cover this target, drop the uplink.
                  string msg = write_str(PLATFORM.Name(), " CAN NOT SUPPORT ACTIVE UPLINK AGAINST ", targetTrack.TargetName());
                  //PLATFORM.Comment(msg);
                  writeln_d(msg);
               }
            }
         }
      }

      // now minYaw and maxYaw define relative headings that must be included by our sensor coverage
      // use the desired interceptHeading as a starting point
      // adjust if necessary according to our mSensorAzimuthHalfAngle
      double relativeInterceptHeading = MATH.NormalizeAngleMinus180_180(mInterceptHeading - PLATFORM.Heading());
      writeln_d("minyaw: ", minYaw, ", maxyaw: ", maxYaw);
      if (minYaw < (relativeInterceptHeading - mSensorAzimuthHalfAngle))
      {
        //adjust a bit to the left
        relativeInterceptHeading = minYaw + mSensorAzimuthHalfAngle*0.9;
        writeln_d("intercept heading BEFORE adjusting for active weapons: ", mInterceptHeading);
        mInterceptHeading = MATH.NormalizeAngleMinus180_180(PLATFORM.Heading() + relativeInterceptHeading);
        writeln_d("intercept heading AFTER  adjusting for active weapons: ", mInterceptHeading);
      }
      else if (maxYaw > (relativeInterceptHeading + mSensorAzimuthHalfAngle))
      {
        //adjust a bit to the right
        relativeInterceptHeading = maxYaw - mSensorAzimuthHalfAngle*0.9;
        writeln_d("intercept heading BEFORE adjusting for active weapons: ", mInterceptHeading);
        mInterceptHeading = MATH.NormalizeAngleMinus180_180(PLATFORM.Heading() + relativeInterceptHeading);
        writeln_d("intercept heading AFTER  adjusting for active weapons: ", mInterceptHeading);
      }

     #extern bool FlyHold   (WsfPlatform, double, double, double);
      FlyHold( PLATFORM, mInterceptHeading, interceptAltitude, cINTERCEPT_SPEED);

   end_execute
```

- **演示要点**：演示 execute 的参数：extern, double, if, string, for, else

### execute（selector_evade）｜状态执行

- **关键词**：execute, double, int, for, if, else, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_evade.txt:252-458`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing evade, T=", TIME_NOW);
      //PLATFORM.Comment("evade");

      ### transition to evade incoming
      PLATFORM.GoToSpeed(cEVADE_SPEED);
      writeln_d("   GoToSpeed( ", cEVADE_SPEED," )");

      double safeAltitudeToDiveTo = MATH.Max(mAltitudeMin, (cDEFAULT_ALTITUDE - mAltitudeToDiveEvade));
     
      // Calculate a heading to evade all incoming missiles, weighted by distance, and then turn to it
      
      double evadeHeading = 0;
      double evadeAltitude = 0;
      double evadeDivisor = 0;
      double distMod = 0;
      double bearingMod = 0;
      int incomingCount = mIncoming.Size();

      writeln_d(PLATFORM.Name(), " evade. dive/climb between altitudes:  ", cDEFAULT_ALTITUDE, " <-> ", safeAltitudeToDiveTo);
      writeln_d("evading ", incomingCount, " threats");

      double y = 0;
      double x = 0;
      double dist = MATH.DOUBLE_MAX();
      WsfPlatform nearestThreat;
      // calculate an average heading to incoming platforms weighted by distance
      for (int i = 0; i < incomingCount; i = i + 1)
      {
         WsfPlatform temp = (WsfPlatform)(mIncoming[i]);
         if (!temp.IsValid() || (temp.Index() == PLATFORM.Index()))
         {
            continue;
         }
         double range = PLATFORM.SlantRangeTo(temp);
         if (range < dist)
         {
            dist = range;
            nearestThreat = (WsfPlatform)(mIncoming[i]);
         }
         if (range > 0)
         {
            distMod = 1 / range;
         }
         else
         {
            distMod = 1000000;
         }
         bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(temp));
         x = x + MATH.Sin(bearingMod) * distMod;
         y = y + MATH.Cos(bearingMod) * distMod;

         writeln_d("    Incoming ", temp.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", temp.Latitude(), ", ", temp.Longitude(), ", ", temp.Altitude(), ") @ ", temp.Speed(), "m/s");
         evadeDivisor = evadeDivisor + distMod;
         evadeHeading = evadeHeading + bearingMod * distMod;
      }

#      // get the GCI if there is one
      WsfPlatform aiflPlat = PLATFORM.Commander();
      WsfPlatform gciPlat;
      if (aiflPlat.IsValid())
      {
         gciPlat = aiflPlat.Commander();
      }

      // if there's a gci, avoid centroids of all his subs
      if (gciPlat.IsValid() && gciPlat.Index() != aiflPlat.Index())
      {
         writeln_d("found gci : ", gciPlat.Name());
         foreach (WsfPlatform aifl in gciPlat.Subordinates())
         {
            if (!aifl.IsValid() || aifl == PLATFORM || aifl == aiflPlat)
            {
               continue;
            }
            WsfGeoPoint centroid = aifl.GetSubsCentroid();
            if (centroid.X() == 0 && centroid.Y() == 0 && centroid.Z() == 0)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(centroid));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(centroid));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    AIFL ", aifl.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", centroid.Latitude(), ", ", centroid.Longitude(), ", ", centroid.Altitude(), ")");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      // otherwise, avoid members in your own squadron
      else if (aiflPlat.IsValid())
      {
         writeln_d("also evading flight lead subordinates (peers)");
         foreach (WsfPlatform sub in aiflPlat.Subordinates())
         {
            writeln_d("considering peer ", sub.Name());
            if (!sub.IsValid() ||
                sub == PLATFORM)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(sub));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(sub));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    Peer ", sub.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", sub.Latitude(), ", ", sub.Longitude(), ", ", sub.Altitude(), ") @ ", sub.Speed(), "m/s");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      else
      {
         writeln_d("evade : no commanders found!!!");
      }

      if (evadeDivisor == 0)
      {
         return Failure("Divisor is 0, stopping evading!");
      }

      // correct for quadrant
      double theta = MATH.NormalizeAngle0_360(MATH.ATan(x/y));
      if (y < 0)
      {
         theta = MATH.NormalizeAngle0_360(theta - 180);
      }

      writeln_d("    x: ", x, ", y: ", y, ", theta: ", theta);

      evadeHeading = MATH.NormalizeAngle0_360(theta - 180);

      if (mWobbleLeftRight == true)
      {
         //turn to angle to evade
         if (mBankLeftFlag == true)
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 - mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180( evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()) );
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) > 0.0)
            {
               mBankLeftFlag = false;
            }
         }
         else // bank right
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 + mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180(evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()));
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) < 0.0)
            {
               mBankLeftFlag = true;
            }
         }
      }

      evadeAltitude = MATH.Max(safeAltitudeToDiveTo, evadeAltitude);
      if (mWobbleUpDown == true)
      {
         //compute the dive or climb
         if (mDiveDownFlag == true)
         {
           writeln_d(PLATFORM.Name(), " diving to ", safeAltitudeToDiveTo);
           evadeAltitude = safeAltitudeToDiveTo;
           if (PLATFORM.Altitude() <= (cDEFAULT_ALTITUDE - 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = false;
           }
         }
         else
         {
           writeln_d(PLATFORM.Name(), " climbing to ", cDEFAULT_ALTITUDE);
           evadeAltitude = cDEFAULT_ALTITUDE;
           if (PLATFORM.Altitude() >= (safeAltitudeToDiveTo + 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = true;
           }
         }
      }

      writeln_d("    Evading incoming at heading ", evadeHeading);
      writeln_d("    Evading incoming, dive/climb to ", evadeAltitude);

      Fly(PLATFORM, evadeHeading, evadeAltitude, cEVADE_SPEED);

      if (mDrawNearestThreat)
      {
         mDraw.SetLayer("behavior_evade");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(1,0,0);
         mDraw.SetLineSize(5);
         mDraw.SetLineStyle("dashed");
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(nearestThreat.Location());
         mDraw.End();
      }
      return Running("Evading " + nearestThreat.Name());
   end_execute
```

- **演示要点**：演示 execute 的参数：double, int, for, if, else, return

### execute（behavior_evade）｜状态执行

- **关键词**：execute, extern, double, int, for, if, else, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_evade.txt:260-467`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiww/behavior_buddy_evade.txt:289`、`base_types/processors/ripr_agents/aiai/behavior_evade.txt:240`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing evade, T=", TIME_NOW);
      //PLATFORM.Comment("evade");

      ### transition to evade incoming
      PLATFORM.GoToSpeed(cEVADE_SPEED);
      writeln_d("   GoToSpeed( ", cEVADE_SPEED," )");


      extern double cDEFAULT_ALTITUDE;
      double safeAltitudeToDiveTo = MATH.Max(mAltitudeMin, (cDEFAULT_ALTITUDE - mAltitudeToDiveEvade));

      // Calculate a heading to evade all incoming missiles, weighted by distance, and then turn to it

      double evadeHeading = 0;
      double evadeAltitude = 0;
      double evadeDivisor = 0;
      double distMod = 0;
      double bearingMod = 0;
      int incomingCount = mIncoming.Size();

      writeln_d(PLATFORM.Name(), " evade. dive/climb between altitudes:  ", cDEFAULT_ALTITUDE, " <-> ", safeAltitudeToDiveTo);
      writeln_d("evading ", incomingCount, " threats");

      double y = 0;
      double x = 0;
      double dist = MATH.DOUBLE_MAX();
      WsfPlatform nearestThreat;
      // calculate an average heading to incoming platforms weighted by distance
      for (int i = 0; i < incomingCount; i = i + 1)
      {
         WsfPlatform temp = (WsfPlatform)(mIncoming[i]);
         if (!temp.IsValid() || (temp.Index() == PLATFORM.Index()))
         {
            continue;
         }
         double range = PLATFORM.SlantRangeTo(temp);
         if (range < dist)
         {
            dist = range;
            nearestThreat = (WsfPlatform)(mIncoming[i]);
         }
         if (range > 0)
         {
            distMod = 1 / range;
         }
         else
         {
            distMod = 1000000;
         }
         bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(temp));
         x = x + MATH.Sin(bearingMod) * distMod;
         y = y + MATH.Cos(bearingMod) * distMod;

         writeln_d("    Incoming ", temp.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", temp.Latitude(), ", ", temp.Longitude(), ", ", temp.Altitude(), ") @ ", temp.Speed(), "m/s");
         evadeDivisor = evadeDivisor + distMod;
         evadeHeading = evadeHeading + bearingMod * distMod;
      }

#      // get the GCI if there is one
      WsfPlatform aiflPlat = PLATFORM.Commander();
      WsfPlatform gciPlat;
      if (aiflPlat.IsValid())
      {
         gciPlat = aiflPlat.Commander();
      }

      // if there's a gci, avoid centroids of all his subs
      if (gciPlat.IsValid() && gciPlat.Index() != aiflPlat.Index())
      {
         writeln_d("found gci : ", gciPlat.Name());
         foreach (WsfPlatform aifl in gciPlat.Subordinates())
         {
            if (!aifl.IsValid() || aifl == PLATFORM || aifl == aiflPlat)
            {
               continue;
            }
            WsfGeoPoint centroid = aifl.GetSubsCentroid();
            if (centroid.X() == 0 && centroid.Y() == 0 && centroid.Z() == 0)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(centroid));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(centroid));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    AIFL ", aifl.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", centroid.Latitude(), ", ", centroid.Longitude(), ", ", centroid.Altitude(), ")");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      // otherwise, avoid members in your own squadron
      else if (aiflPlat.IsValid())
      {
         writeln_d("also evading flight lead subordinates (peers)");
         foreach (WsfPlatform sub in aiflPlat.Subordinates())
         {
            writeln_d("considering peer ", sub.Name());
            if (!sub.IsValid() ||
                sub == PLATFORM)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(sub));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(sub));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    Peer ", sub.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", sub.Latitude(), ", ", sub.Longitude(), ", ", sub.Altitude(), ") @ ", sub.Speed(), "m/s");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      else
      {
         writeln_d("evade : no commanders found!!!");
      }

      if (evadeDivisor == 0)
      {
         return;
      }

      // correct for quadrant
      double theta = MATH.NormalizeAngle0_360(MATH.ATan(x/y));
      if (y < 0)
      {
         theta = MATH.NormalizeAngle0_360(theta - 180);
      }

      writeln_d("    x: ", x, ", y: ", y, ", theta: ", theta);

      evadeHeading = MATH.NormalizeAngle0_360(theta - 180);

      if (mWobbleLeftRight == true)
      {
         //turn to angle to evade
         if (mBankLeftFlag == true)
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 - mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180( evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()) );
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) > 0.0)
            {
               mBankLeftFlag = false;
            }
         }
         else // bank right
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 + mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180(evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()));
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) < 0.0)
            {
               mBankLeftFlag = true;
            }
         }
      }

      evadeAltitude = MATH.Max(safeAltitudeToDiveTo, evadeAltitude);
      if (mWobbleUpDown == true)
      {
         //compute the dive or climb
         if (mDiveDownFlag == true)
         {
           writeln_d(PLATFORM.Name(), " diving to ", safeAltitudeToDiveTo);
           evadeAltitude = safeAltitudeToDiveTo;
           if (PLATFORM.Altitude() <= (cDEFAULT_ALTITUDE - 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = false;
           }
         }
         else
         {
           writeln_d(PLATFORM.Name(), " climbing to ", cDEFAULT_ALTITUDE);
           evadeAltitude = cDEFAULT_ALTITUDE;
           if (PLATFORM.Altitude() >= (safeAltitudeToDiveTo + 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = true;
           }
         }
      }

      writeln_d("    Evading incoming at heading ", evadeHeading);
      writeln_d("    Evading incoming, dive/climb to ", evadeAltitude);

      Fly(PLATFORM, evadeHeading, evadeAltitude, cEVADE_SPEED);

      if (mDrawNearestThreat)
      {
         mDraw.SetLayer("behavior_evade");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(1,0,0);
         mDraw.SetLineSize(5);
         mDraw.SetLineStyle("dashed");
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(nearestThreat.Location());
         mDraw.End();
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, double, int, for, if, else

### execute（behavior_pursue_weapon_task_target）｜状态执行

- **关键词**：execute, if, string, double, int, else, extern, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:210-427`
- **片段**：

```text
   execute
      WsfTrack targetTrack;
      if (mTargetId.IsValid())
      {
         targetTrack = PLATFORM.MasterTrackList().FindTrack(mTargetId);
      }

      if (targetTrack.IsNull() ||
          !targetTrack.IsValid())
      {
         writeln_d("    UpdateInterceptLocation, targetTrack is null or not valid");
         return;
      }

      string comment = write_str(PLATFORM.Name(), " executing quantum_target_task, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

     #extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);

      double ownSpeed       = PLATFORM.Speed();
      double targetSpeed    = targetTrack.Speed();
      double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
      double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
      string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
      int    weaponsActive  = PLATFORM.WeaponsActiveFor(targetTrack.TrackId());

      double engageRangeMax = 185200.0;   //100 miles
      double engageRangeMin =   1852.0;   //  1 mile

      string PursuitMode = "pure";

      if (weaponsActive > 0)
      {
         PursuitMode = "f-pole";
      }
      else if (targetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
             positioning  != "head-to-head" &&
             positioning  != "head-to-tail" &&
             targetSpeed  >= ownSpeed)
         {
            PursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                  positioning  != "head-to-head" &&
                  positioning  != "head-to-tail")
         {
            PursuitMode = "lag";
         }
         //else if (slantRangeTo  > engageRangeMax ||
         //        (slantRangeTo <= engageRangeMax &&
         //        (positioning  == "head-to-head" ||
         //         positioning  == "head-to-tail")))
         //{
         //   PursuitMode = "pure";
         //}
      }

      writeln_d("     PursuitMode = ", PursuitMode);
      // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

      // If we got the altitude from the TRACK, match it
      double interceptHeading  = PLATFORM.Heading();
      double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);

      extern double cDEFAULT_ALTITUDE;
      double interceptAltitude = cDEFAULT_ALTITUDE;

      //check for targets altitude, and whether or not we should match it
      if (targetTrack.ElevationValid() ||
          targetTrack.LocationValid())
      {
         if (targetTrack.Altitude() > interceptAltitude)    //always climb up to target
         {
            interceptAltitude = targetTrack.Altitude();
         }
         else if (MatchAltitudeForThreat(targetTrack) == true)
         {
            interceptAltitude = targetTrack.Altitude();
         }
      }

      //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
      if (interceptAltitude < mMinAltitude)
      {
         interceptAltitude = mMinAltitude;
      }
      writeln_d("desired intercept altitude: ", interceptAltitude);

      mTargetSpeed = mInterceptSpeed;
      if (targetTrack.VelocityValid())
      {
         if (targetTrack.AirDomain())
         {
           #extern double EffectiveRange(WsfPlatform, WsfTrack);

            double speedOfTarget = targetTrack.Speed();
            double effRange      = EffectiveRange(PLATFORM, targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(effRange < mMatchSpeedDistanceMax &&  effRange > mMatchSpeedDistanceMin)
            {
               double rangeScale = (effRange - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
               writeln_d(PLATFORM.Name(), " pursue-target, speed scaled down in matching window!");
            }
            else if (effRange <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
               writeln_d(PLATFORM.Name(), " pursue-target, speed set to match target!");
            }

            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
               writeln_d(PLATFORM.Name(), " pursue-target, speed was lower than wait speed, adjust!");
            }
         }
         else if (targetTrack.LandDomain())
         {
            writeln_d(PLATFORM.Name(), " pursue-target, target is land domain, adjust speed!");
            double speedOfTarget = targetTrack.Speed();
            double range      = PLATFORM.GroundRangeTo(targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(range < mMatchSpeedDistanceMax &&  range > mMatchSpeedDistanceMin)
            {
               double rangeScale = (range - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
            }
            else if (range <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
            }

            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
            }
         }
      }

      double leadOrLagTime = 15.0;  //seconds
      if (PursuitMode == "lead")
      {
         WsfWaypoint wpt = WsfWaypoint();
         double tti = PLATFORM.InterceptLocation3D(targetTrack, wpt);
         if (tti > 0.0)
         {
            mTargetPoint = wpt.Location();
         }
         else
         {
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW + leadOrLagTime);
         }
      }
      else if(PursuitMode == "lag")
      {
         double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;

         double maxLagDist = 0.35 * PLATFORM.SlantRangeTo(targetTrack);
         double maxLagTime = maxLagDist / targetTrack.Speed();
         if (usedLagDelay > maxLagTime)
         {
            usedLagDelay = maxLagTime;
         }
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW - usedLagDelay);
      }
      else if (PursuitMode == "f-pole")
      {
         #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         #interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
         if (PLATFORM.RelativeBearingTo(targetTrack) > 0)
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) - DefaultOffsetAngle);
         }
         else
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) + DefaultOffsetAngle);
         }
         mTargetPoint = PLATFORM.Location();
         mTargetPoint.Extrapolate(interceptHeading, DefaultOffsetDistance);
      }
      else
      {
         //PursuitMode == pure
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW);
      }

      if (!mTargetPoint.IsValid())
      {
         mTargetPoint = targetTrack.CurrentLocation();
      }

      mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), interceptAltitude);

      if (mDrawSteering == true)
      {
         mDraw.SetLayer("behavior_pursue_target");
         mDraw.SetDuration(processor.UpdateInterval());
         mDraw.SetColor(1.0, 0.5, 0.0);
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mTargetPoint);
         mDraw.End();
      }

      string msg = write_str("pursue-target: ", targetTrack.TargetName(), " at speed ", (string)mTargetSpeed);
    //PLATFORM.Comment(msg);
      writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
     #extern bool FlyTarget (WsfPlatform, WsfGeoPoint, double);
      FlyTarget( PLATFORM, mTargetPoint, mTargetSpeed);
   end_execute
```

- **演示要点**：演示 execute 的参数：if, string, double, int, else, extern

### execute（selector_pursue_weapon_task_target）｜状态执行

- **关键词**：execute, if, string, double, int, else, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_pursue_weapon_task_target.txt:209-426`
- **片段**：

```text
   execute
      WsfTrack targetTrack;
      if (mTargetId.IsValid())
      {
         targetTrack = PLATFORM.MasterTrackList().FindTrack(mTargetId);
      }
   
      if (targetTrack.IsNull() ||
          !targetTrack.IsValid())
      {
         writeln_d("    UpdateInterceptLocation, targetTrack is null or not valid");
         return Failure("targetTrack is null or not valid!");
      }
   
      string comment = write_str(PLATFORM.Name(), " executing quantum_target_task, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

     #extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);

      double ownSpeed       = PLATFORM.Speed();
      double targetSpeed    = targetTrack.Speed();
      double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
      double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
      string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
      int    weaponsActive  = PLATFORM.WeaponsActiveFor(targetTrack.TrackId());

      double engageRangeMax = 185200.0;   //100 miles
      double engageRangeMin =   1852.0;   //  1 mile

      string PursuitMode = "pure";

      if (weaponsActive > 0)
      {
         PursuitMode = "f-pole";
      }
      else if (targetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
             positioning  != "head-to-head" &&
             positioning  != "head-to-tail" &&
             targetSpeed  >= ownSpeed)
         {
            PursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                  positioning  != "head-to-head" &&
                  positioning  != "head-to-tail")
         {
            PursuitMode = "lag";
         }
         //else if (slantRangeTo  > engageRangeMax ||
         //        (slantRangeTo <= engageRangeMax &&
         //        (positioning  == "head-to-head" ||
         //         positioning  == "head-to-tail")))
         //{
         //   PursuitMode = "pure";
         //}
      }

      writeln_d("     PursuitMode = ", PursuitMode);
      // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

      // If we got the altitude from the TRACK, match it
      double interceptHeading  = PLATFORM.Heading();
      double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);

      double interceptAltitude = cDEFAULT_ALTITUDE;
      
      //check for targets altitude, and whether or not we should match it
      if (targetTrack.ElevationValid() ||
          targetTrack.LocationValid())
      {
         if (targetTrack.Altitude() > interceptAltitude)    //always climb up to target
         {
            interceptAltitude = targetTrack.Altitude();
         }
         else if (MatchAltitudeForThreat(targetTrack) == true)
         {
            interceptAltitude = targetTrack.Altitude();
         }
      }

      //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
      if (interceptAltitude < mMinAltitude)
      {
         interceptAltitude = mMinAltitude;
      }
      writeln_d("desired intercept altitude: ", interceptAltitude);

      mTargetSpeed = mInterceptSpeed;
      if (targetTrack.VelocityValid())
      {
         if (targetTrack.AirDomain())
         {
           #extern double EffectiveRange(WsfPlatform, WsfTrack);

            double speedOfTarget = targetTrack.Speed();
            double effRange      = EffectiveRange(PLATFORM, targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(effRange < mMatchSpeedDistanceMax &&  effRange > mMatchSpeedDistanceMin)
            {
               double rangeScale = (effRange - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
               writeln_d(PLATFORM.Name(), " pursue-target, speed scaled down in matching window!");
            }
            else if (effRange <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
               writeln_d(PLATFORM.Name(), " pursue-target, speed set to match target!");
            }
            
            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
               writeln_d(PLATFORM.Name(), " pursue-target, speed was lower than wait speed, adjust!");
            }
         }
         else if (targetTrack.LandDomain())
         {
            writeln_d(PLATFORM.Name(), " pursue-target, target is land domain, adjust speed!");
            double speedOfTarget = targetTrack.Speed();
            double range      = PLATFORM.GroundRangeTo(targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(range < mMatchSpeedDistanceMax &&  range > mMatchSpeedDistanceMin)
            {
               double rangeScale = (range - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
            }
            else if (range <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
            }
            
            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
            }
         }
      }

      double leadOrLagTime = 15.0;  //seconds
      if (PursuitMode == "lead")
      {
         WsfWaypoint wpt = WsfWaypoint();
         double tti = PLATFORM.InterceptLocation3D(targetTrack, wpt);
         if (tti > 0.0)
         {
            mTargetPoint = wpt.Location();
         }
         else
         {
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW + leadOrLagTime);
         }
      }
      else if(PursuitMode == "lag")
      {
         double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;
         
         double maxLagDist = 0.35 * PLATFORM.SlantRangeTo(targetTrack);
         double maxLagTime = maxLagDist / targetTrack.Speed();
         if (usedLagDelay > maxLagTime)
         {
            usedLagDelay = maxLagTime;
         }
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW - usedLagDelay);
      }
      else if (PursuitMode == "f-pole")
      {
         #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         #interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
         if (PLATFORM.RelativeBearingTo(targetTrack) > 0)
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) - DefaultOffsetAngle);
         }
         else
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) + DefaultOffsetAngle);
         }
         mTargetPoint = PLATFORM.Location();
         mTargetPoint.Extrapolate(interceptHeading, DefaultOffsetDistance);
      }
      else
      {
         //PursuitMode == pure
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW);
      }

      if (!mTargetPoint.IsValid())
      {
         mTargetPoint = targetTrack.CurrentLocation();
      }

      mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), interceptAltitude);

      if (mDrawSteering == true)
      {
         mDraw.SetLayer("behavior_pursue_target");
         mDraw.SetDuration(processor.UpdateInterval());
         mDraw.SetColor(1.0, 0.5, 0.0);
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mTargetPoint);
         mDraw.End();
      }

      string msg = write_str("pursue-target: ", targetTrack.TargetName(), " at speed ", (string)mTargetSpeed);
    //PLATFORM.Comment(msg);
      writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
     #extern bool FlyTarget (WsfPlatform, WsfGeoPoint, double);
      FlyTarget( PLATFORM, mTargetPoint, mTargetSpeed);
      return Running("Pursuing target " + targetTrack.TargetName());
   end_execute
```

- **演示要点**：演示 execute 的参数：if, string, double, int, else, return

### execute（shoot_it）｜状态执行

- **关键词**：execute, int, string, pitch_up, if, foreach, return, 状态执行
- **出处**：`air_to_air/rules/shoot_it.txt:98-334`
- **片段**：

```text
   execute
      writeln_d("T = ",TIME_NOW," ",iacid.Name()," shoot_it");
      fails.Clear();
      Array<int> bng_msl = iacid->WINCHESTER;
      int fox3_left = iacid.Weapon("fox3").QuantityRemaining();
      int fox2_left = iacid.Weapon("fox2").QuantityRemaining();
      int fox1_left = iacid.Weapon("fox1").QuantityRemaining();

      int fox_index;
      string fox; // fox number of current weapon
   #   int prfire; // 1 = shoot, 2 = don't shoot
   #   FileIO iout = FileIO();
   #   if (iout_print) {iout.Open(iout_path, "append");}
   #   FileIO log = FileIO();
   #   if (log_print) {log.Open(log_path, "append");}
      mapPICKLE.Clear();
      pitch_up = false; // initialize this to false
      if (fox3_left == 0 && fox2_left == 0 && fox1_left == 0){return Failure("NO MISSILES LEFT...");}
      if (iacid->react && iacid->first_pass)
      {
         if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT - REASON: HOLD SHOT FOR REACTION","\n"));}
         writeln_d("\t\t shoot_it2");
         return Running("HOLD SHOT FOR REACTION");
      }
      // don't shoot in certain phases
      if(iacid->faz == "pump" || iacid->faz == "pump_in" || iacid->faz == "egress" || iacid->faz == "reaction")
      {
         if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT PHASE= ",iacid->faz,"\n"));}
         writeln_d("\t\t shoot_it3");         
         return Failure("Don't shoot...phase == pump,pump_in,reaction or egress");
      }    

      if(iout_print) {iout.Write(write_str(" SHOOT_IT:      BEANS  NUM_IN_AIR  NUM_I_SHOT  TGTD_IHOST","\n"));}
      if(iout_print) {iout.Write(write_str("  MAX ALLOWED   ",Format.General(iacid->I_SUPPORT,2).Pad(3),Format.General(iacid->I_LAUNCHED,2).Pad(9),
       Format.General(iacid->I_LNCHATTGT,2).Pad(12),Format.General(iacid->I_MXTGTD,2).Pad(12),"\n"));}
      foreach (WsfSA_EntityPerception saent in shoot_list)
      {
         //If track is of a SAM, skip and let sam_shoot_it determine mapPICKLE
         if(saent.Track().IsValid() && saent.Track().LandDomain()){continue;}      

         // initialize to true
         mapPICKLE[saent] = true;

         Array<int> shot_count = count_shot(iacid,saent,saPROC.PerceivedBandits());
         WsfWeapon msl = iacid.Weapon(mapPRMISL_AC[saent]);

         // set fox_index so we have an integer of which fox number we're using
         if (msl.Name() == "fox1"){fox_index = 0;}
         if (msl.Name() == "fox2"){fox_index = 1;}
         if (msl.Name() == "fox3"){fox_index = 2;}

         // WQT
         if ( msl.AuxDataExists("use_wqt") && msl.AuxDataBool("use_wqt") )
         {
            if (!saent.Track().RangeValid() || saent.Track().RangeErrorSigma() > msl.AuxDataDouble("wqt_rng"))
            {
               mapPICKLE[saent] = false; 
               if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad range ",saent.Track().RangeErrorSigma(),"\n"));}
               fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"NO WQT, bad range"}));               
               continue;
            }
            else if (!saent.Track().BearingValid() || saent.Track().BearingErrorSigma() > msl.AuxDataDouble("wqt_az"))
            {
               mapPICKLE[saent] = false; 
               if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad azimuth","\n"));}
               fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"NO WQT bad azimuth"}));
               continue;
            }
            else if (!saent.Track().ElevationValid() || saent.Track().ElevationErrorSigma() > msl.AuxDataDouble("wqt_el"))
            {
               mapPICKLE[saent] = false; 
               if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad elevation","\n"));}
               fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"NO WQT, bad elevation"}));
               continue;
            }
         }

         // srm missile and outside of srm range
         if(msl.Name() == "fox2" && iacid.SlantRangeTo(saent.Track()) > iacid->SRM_SLCT)
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: OUTSIDE OF SRM RANGE","\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"OUTSIDE OF SRM RANGE"}));
            continue;
         }       

         // stiff arm logic
         if (iacid->stiff_arm_all || mapSTIFF_ARM[saent])
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: STIFF ARM LOGIC","\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"STIFF ARM LOGIC"}));
            continue;
         }      
      
   /*
         // greedy logic
            // count_shot
               [0] number of missiles launched at specified threat by anyone (tgtd_ihost)
               [1] number of missiles I have launched at specified threat (num_i_shot)
               [2] total number of missiles I have in the air right now (num_in_air)
   */
         if(iout_print) {iout.Write(write_str("  ",saent.Track().TargetName().Pad(-14),Format.General(iacid->beans,2).Pad(3),Format.General(shot_count[2],2).Pad(9),
          Format.General(shot_count[1],2).Pad(12),Format.General(shot_count[2],0).Pad(12),"\n"));}
         if ( (iacid->beans >= iacid->I_SUPPORT) || (shot_count[0] >= mapMXTGTD[saent] || 
               shot_count[0] >= iacid->I_MXTGTD) || (shot_count[1] >= mapMXTGT_AC[saent] || 
               shot_count[1] >= iacid->I_LNCHATTGT) || shot_count[2] >= iacid->I_LAUNCHED)
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: GREEDY","\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"GREEDY"}));
            continue;
         }
      
         // hobs logic, assumes you can't uplink to missile outside of 60 degrees
         if ( iacid.RelativeBearingTo(saent.Track()) >=60 )
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: HOBS LOGIC ",iacid.RelativeBearingTo(saent.Track()),"\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"HOBS LOGIC"}));
            continue;
         }  

         if ( msl.Name() == "fox2" && iacid.RelativeBearingTo(saent.Track()) >=15 )
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: SRM HOBS LOGIC ",iacid.RelativeBearingTo(saent.Track()),"\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"SRM HOBS LOGIC"}));
            continue;
         }

         // mxshot_rng from PRDATA
         if (iacid->MXSHOT_RNG > 0 && iacid.SlantRangeTo(saent.Track()) > iacid->MXSHOT_RNG)  
         {
            mapPICKLE[saent] = false;
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: OUTSIDE MX SHOT RANGE","\n"));}
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"OUTSIDE OF MX SHOT RANGE"}));
            continue;
         } 

         // fratricide risk
         for (int i = 0; i <= saPROC.PerceivedAssets().Size() - 1; i = i + 1)
         {  
            WsfSA_EntityPerception asset = saPROC.PerceivedAssets()[i]; 
            WsfGeoPoint aloc = WsfGeoPoint().Construct(asset.Lat(),asset.Lon(),asset.Altitude());
            if( iacid.SlantRangeTo(saent.Track()) > iacid->SRM_SLCT && saent.Track().SlantRangeTo(aloc) < iacid->SRM_SLCT)
            {
               mapPICKLE[saent] = false;
               if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: FRAT RISK ",asset.PerceivedName(),"\n"));}
               fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"FRAT RISK"}));
               continue;
            }
         }  

         // track is outside of RPEAK
         if(iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0] > RPEAK_LOC[fox_index])
         {
            mapPICKLE[saent] = false;
            if(iout_print) 
            {
               iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: TARGET OUTSIDE OF RPEAK ",
               iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0]," ",RPEAK_LOC[fox_index],"\n"));
               fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"TARGET OUTSIDE OF RPEAK",(string)(iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0]),(string)RPEAK_LOC[fox_index]}));
            }

            /* if i'm approaching max envelope range and I'm desiring a loft assist maneuver,
               go ahead and start the pitch up maneuver         
            */
            if ( (msl.Name() == "fox3") && iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0] < RPEAK_LOC[fox_index]*1.1)
            {
               if (iacid->LOFT_ASSIST > 0 && iacid.Pitch() < iacid->LOFT_ASSIST*1.1 )
               {
                  pitch_up = true; // command a pitch up maneuver
                  if(iout_print) {iout.Write(write_str(" SHOOT_IT... PITCH UP","\n"));}         
               }
               else
               {
                  pitch_up = false;
               }
            }
            continue;
         } 
         // if i'm ready to shoot and desire to loft assist my shot, hold shot and command a pitch up maneuver
         if ( (msl.Name() == "fox3") && iacid->LOFT_ASSIST > 0 && iacid.Pitch() < iacid->LOFT_ASSIST*0.95 )
         {
            mapPICKLE[saent] = false;
            pitch_up = true; // command a pitch up maneuver
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NEED TO PITCH UP","\n"));}     
            fails.PushBack(" : ".Join({(string)saent.Track().TargetIndex(),saent.Track().TargetName(),"NEED TO PITCH UP"}));
            continue; // break so we don't shoot unless we have reached our desired pitch
         }
         else
         {
            pitch_up = false;
         }

         // forward pass logic
         mapGUIDER[saent] = remote_test(iacid,saent.Track()); // choose the guider of this shot

      }

      //  loop through everyone on my pickle list and shoot them starting with ppmjid
      foreach (WsfSA_EntityPerception ent : bool prfire in mapPICKLE)
      {   
         if (prfire && ent.Track().AirDomain() && iacid.WeaponsPendingFor(ent.Track().TrackId()) == 0) 
         {
            bool fire_test = iacid.Weapon(mapPRMISL_AC[ent]).Fire(ent.Track());
            if (fire_test)
            {
               t_last_pickle = TIME_NOW;
               if(iout_print) {iout.Write(write_str("SHOOT_IT... ",iacid.Name()," FIRE ",mapPRMISL_AC[ent]," AT ",ent.Track().TargetName()," AT TIME: ",TIME_NOW,"\n"));}
               foreach (WsfPlatform msl in iacid.ActiveWeaponPlatformsFor(ent.Track().TrackId()))
               {
                  if (msl.TimeSinceCreation() == 0)
                  {
                     WsfPlatform guider = mapGUIDER[ent];
                     Array<WsfPlatform> temp_guid_list = guider->guid_list;
                     temp_guid_list.PushBack(msl);
                     guider->guid_list = temp_guid_list;
                     msl.SetCommander(guider);
                     msl.SetCommander("IFLITE",guider);
                     msl.SetCommander("ELEMENT",guider);
                     if (log_print) 
                     {
                        log.Write(write_str("         A/C PROVIDING DATALINK= ",guider.Index(),"\n"));
                     }
                     break;
                  }
               }
               writeln_d("\t\t shoot_it4");               
               return Success("".Join({"FIRING ",mapPRMISL_AC[ent]," AT ",ent.Track().TargetName()," INDEX ",(string)ent.Track().Target().Index()}));
            }
         }
      }
      writeln_d("\t\t shoot_it5");      
      return Success("\n".Join(fails)); // print out the fail reasons for each track       
   end_execute
```

- **演示要点**：演示 execute 的参数：int, string, pitch_up, if, foreach, return

### execute（merge）｜状态执行

- **关键词**：execute, faz_desired, string, solo, pr_speed, return, 状态执行
- **出处**：`air_to_air/rules/merge.txt:68-88`
- **片段**：

```text
   execute 
      faz_desired = "merge";
      string flight_lead = iflite.CommanderName();
      solo = true;
      pr_speed = MATH.Max(ppmjid.Speed(),0.5*atmos.SonicVelocity(iacid.Altitude())); // match speed of target, don't drop below M0.5
      pr_pursuit(iacid,ppmjid.Track(),pr_speed);
      if(rng_cls_hst > iacid->MERGE_RNG) 
      {  
         reason = "OUT OF MERGE RANGE";
         if (!flt_lead)
         {  
            faz_desired = WsfSimulation.FindPlatform(flight_lead)->faz; 
         }
         else
         {  
            faz_desired = "ingress";
         }
         solo = false;
      } 
      return Success(reason);            
   end_execute
```

- **演示要点**：演示 execute 的参数：faz_desired, string, solo, pr_speed, return

### execute（behavior_pursue_heading）｜状态执行

- **关键词**：execute, string, extern, double, if, else, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_heading.txt:62-139`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_heading.txt:62`）
- **片段**：

```text
   execute
      string comment = write_str(PLATFORM.Name(), " executing pursue_heading, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

      extern double mDesiredHeading;

      extern string   CalculatePositioning(WsfPlatform, WsfTrack, double);

      double slantRangeTo   = PLATFORM.SlantRangeTo(mTargetTrack);
      string positioning    = CalculatePositioning(PLATFORM, mTargetTrack, 10.0);

      double engageRangeMax = 185200.0;   //100 miles
      double engageRangeMin =   1852.0;   //  1 mile

      string PursuitMode = "pure";
      if (((WsfRIPRProcessor)PROCESSOR).WeaponsActive(mTargetTrack) > 0)
      {
         PursuitMode = "f-pole";
      }
      else if (mTargetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
             positioning  != "head-to-head" &&
             positioning  != "head-to-tail" &&
             mTargetTrack.Speed()  >= PLATFORM.Speed())
         {
            PursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                  positioning  != "head-to-head" &&
                  positioning  != "head-to-tail")
         {
            PursuitMode = "lag";
         }
      }
      writeln_d("     PursuitMode = ", PursuitMode);

      mDesiredHeading = PLATFORM.Heading();

      double leadOrLagTime = 15.0;  //seconds
      if (PursuitMode == "lead")
      {
         WsfWaypoint wpt = WsfWaypoint();
         double tti = PLATFORM.InterceptLocation3D(mTargetTrack, wpt);
         if (tti > 0.0)
         {
            mDesiredHeading = PLATFORM.TrueBearingTo(wpt.Location());
         }
         else
         {
            mDesiredHeading = PLATFORM.TrueBearingTo(mTargetTrack.LocationAtTime(TIME_NOW + leadOrLagTime));
         }
      }
      else if(PursuitMode == "lag")
      {
         double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;

         double maxLagDist = 0.35 * slantRangeTo;
         double maxLagTime = maxLagDist / mTargetTrack.Speed();
         if (usedLagDelay > maxLagTime)
         {
            usedLagDelay = maxLagTime;
         }
         mDesiredHeading = PLATFORM.TrueBearingTo(mTargetTrack.LocationAtTime(TIME_NOW - usedLagDelay));
      }
      else if (PursuitMode == "f-pole")
      {
         extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         mDesiredHeading = MaximizeFPole(PLATFORM, mTargetTrack, GetOffsetAngleOnThreat(mTargetTrack));
      }
      else
      {
         //PursuitMode == pure
         mDesiredHeading = PLATFORM.TrueBearingTo(mTargetTrack.CurrentLocation());
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：string, extern, double, if, else

### execute（behavior_create_clustering_jobs）｜状态执行

- **关键词**：execute, extern, foreach, int, for, jobs, 状态执行
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_create_clustering_jobs.txt:166-253`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing create_clustering_jobs, T=", TIME_NOW);

      ##########################################################################
      ##   update the cluster manager with the current master track list
      ##########################################################################
      extern bool TestTrackCategory( WsfTrack, string );
      WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
      trackArray.Clear();
      foreach (WsfTrack track in localTracks)
      {
         if (!mRequireKnownCategory || !TestTrackCategory(track, "unknown"))
         {
            track.SetBearing( track.Heading() );  #useful for the cluster processing
            trackArray.PushBack(track);
         }
      }
      cManager.UpdateClusters(TIME_NOW,trackArray);

      ##########################################################################
      ##  update or add jobs for all the clusters
      ##########################################################################
      Map<int, int> updatedJobs = Map<int, int>();
      int NumClusters = cManager.Count();
      for (int i = 0; i < NumClusters; i = i + 1 )
      {
         WsfCluster cluster = cManager.Entry(i);
         int clusterId = cluster.Id();

         if (mDrawClusters == true)
         {
            draw_cluster_hull(cluster);
         }

         if( cluster.Count() > 0 )
         {
            if (update_cluster_job(cluster))
            {
               //writeln_d("cluster already exists & was updated!");
            }
            else
            {
               add_cluster_job(cluster);
            }
            updatedJobs.Set(clusterId, 1);
         }
      }

      ##########################################################################
      ##  remove any old jobs for clusters that have gone away
      ##########################################################################
      Array<WsfRIPRJob> jobs = PROCESSOR.GetJobs();
      foreach( WsfRIPRJob aJob in jobs )
      {
         if (aJob.Name() == "zone")
         {
            int clusterId = (int)aJob.GetData("clusterId");
            if (updatedJobs.Get(clusterId) != 1)
            {
               remove_cluster_job( aJob );
            }
         }
      }

      ##########################################################################
      ##  print out a message if there are any new winners of jobs
      ##########################################################################
      jobs = PROCESSOR.GetJobs();
      foreach( WsfRIPRJob aJob in jobs )
      {
         if( ! mJobToWinnerMap.Exists( aJob.GetId() ) )
         {
            mJobToWinnerMap.Set( aJob.GetId(), 0 );
         }
         else
         {
            int currWinners = aJob.GetNumWinners();
            int lastWinners = mJobToWinnerMap.Get( aJob.GetId() );
            if( currWinners != lastWinners )
            {
               string NewComment = "AIGCI - Sub took a job: " + aJob.Name() + " - " + aJob.GetDescription();
               PLATFORM.Comment(NewComment);
               mJobToWinnerMap.Set( aJob.GetId(), currWinners );
            }
         }
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：extern, foreach, int, for, jobs

### execute（direct）｜状态执行

- **关键词**：execute, int, faz_desired, if, else, return, 状态执行
- **出处**：`air_to_air/rules/direct.txt:71-162`
- **片段**：

```text
   execute
      writeln_d("T = ",TIME_NOW," ",iacid.Name()," direct");
      int plan_1 = PLAYBOOK[0]; 
      int plan_2 = PLAYBOOK[1]; // create local version of these to manipulate in this routine
      int plan_3 = PLAYBOOK[2]; 
      faz_desired = "direct"; 
            
      // determine desired speed to intercept       
      if (first_pass)
      {
         pr_speed = (iacid->COMMIT_SPD + iacid->SPRINT_SPD)*atmos.SonicVelocity(iacid.Altitude());
      }
      else
      {
         pr_speed = iacid->COMMIT_SPD*atmos.SonicVelocity(iacid.Altitude());
      }

      // determine intercept tactic based on PRDATA PLAYBOOK & command maneuver
      if (plan_1 == 1)
      {
         pr_pursuit(iacid,ppmjid.Track(),pr_speed); // pure pursuit maneuver command
      }
      else if (plan_1 == 2)
      {
         pr_aim_missile(iacid,ppmjid.Track(),pr_speed); // point at intercept point of target and my missile
      }
      else if (plan_1 == 3)
      {
         pr_intercept(iacid,ppmjid.Track(),pr_speed); // point at intercept point of target and myself
      }
      // start faz transition logic
      // if i'm threatend by a sam, go into sam react phase
      if (stiff_arm_all)
      {  
         faz_desired = "ingress";
         reason = "STIFF ARM";
      }   
      else if (rng_cls_hst <= iacid->MERGE_RNG && time_ok)
      {
         if (iacid->NOTCH)
         {  
            faz_desired = "notch";
            reason = "NOTCH MRM DEFENSE";
            t_phase=TIME_NOW + 5;
         }
         else
         {  
            faz_desired = "merge";
            reason = "ACCEPT MERGE";
            t_phase=TIME_NOW + 5;
         }
      }
      else if ( (alerted || rng_cls_hst <= iacid->DOR) && plan_3 <= 2 )
      {  
          if ( plan_3 == 1 && pump_per && time_ok)
          {  
             faz_desired = "pump";
             reason = "ALWAYS PUMP AT MAR";
             t_phase=TIME_NOW + iacid->TDRAG;
          }
          else if ( plan_3 == 2 && pump_per && time_ok && threatnd)
          {  
             faz_desired = "pump";
             reason = "ALWAYS PUMP WHEN THREATENED";
             t_phase=TIME_NOW + iacid->TDRAG;
          }
         else if (needil && apole_tct)
         {  
            faz_desired = "crank";
            reason = "SUPPORTING MISSILES";
            t_phase=TIME_NOW + 10;
         }
      }
      else if (needil && apole_tct)
      {  
         faz_desired = "crank";
         reason = "SUPPORTING MISSILES";
         t_phase=TIME_NOW + 10;
      }
      else if (plan_1 > 3)
      {  
         t_phase=TIME_NOW + 5;
         if (plan_1 == 4) {faz_desired = "vectoring";}
      }
      else if (rng_cls_hst > iacid->COMMIT_RNG*1.5 && rng_cls_sam > iacid->COMMIT_RNG*1.5)
      {  
         faz_desired = "ingress";
         reason = "WEAPONS AND FUEL LEFT";
#         writeln(iacid.Name()," ",rng_cls_hst*MATH.NM_PER_M());
      }
      return Success(reason);            
   end_execute
```

- **演示要点**：演示 execute 的参数：int, faz_desired, if, else, return

### execute（rultype_change）｜状态执行

- **关键词**：execute, double, cls_host_ltrk, if, else, return, 状态执行
- **出处**：`air_to_air/rules/rultype_change.txt:133-240`
- **片段**：

```text
   execute
       writeln_d("T = ",TIME_NOW," ",iacid.Name()," rultype_change");
#       FileIO log = FileIO();
       double rng_cls_trk = MATH.Min(rng_cls_hst,rng_cls_sam);
#       if (log_print)
#       {
#          log.Open(log_path, "append");
#       }
       cls_host_ltrk = closest_host_track(iacid,saPROC.PerceivedBandits());

/* ************************************
//    switch out of route or orbit faz
***************************************/
      if (rule_type == "route" || rule_type == "orbit")
      {  
         // switch to fighter if within 1.2*commit range
         if (rng_cls_trk < PLATFORM->COMMIT_RNG*1.2)
         {
            change_rultype(iacid,iflite,rule_type,"ftr","Approaching commit range");
            RuleReason = " ".Join({"Approaching Commit Range",(string)(rng_cls_trk*MATH.NM_PER_M())});
         }         
         // switch to fighter if hostile gets too close to my protected entity
         else if ( (iacid->MISSION_TYPE == "HVAADCA" || iacid->MISSION_TYPE == "ESCORT") 
         && cls_host_ltrk.IsValid() && cls_host_ltrk.LocationValid() )
         {
            foreach (string pe in PROTECTING) // loop through all the platform names i'm protecting
            {   
               for (int i = 0; i <= saPROC.PerceivedAssets().Size() - 1; i = i + 1)
               {  
                  WsfSA_EntityPerception asset = saPROC.PerceivedAssets()[i]; 
                  WsfGeoPoint aloc = WsfGeoPoint().Construct(asset.Lat(),asset.Lon(),asset.Altitude()); 
                  // see if I have a perception of that asset and check perceived range between hostiles and protected entity
                  if (asset.PerceivedName() == pe && 
                  cls_host_ltrk.CurrentLocation().SlantRangeTo(aloc) < iacid->DISPLN_X * 1.5)
                  { 
                     change_rultype(iacid,ielement,rule_type,"ftr","hostile threatening PE");
                     RuleReason = "Hostile Threatening PE";
                  }
               }
            }
         }
         // switch to intercept i if get an intercept task
         if (tsk_mgr.TasksReceived() > 0)
         {
            foreach (WsfTask tsk in tsk_mgr.ReceivedTaskList())
            {
               if (tsk.TaskType() == "INTERCEPT")
               {
                  change_rultype(iacid,iflite,rule_type,"intercept","recieved intercept task");
                  RuleReason = "Recieved Intercept Task";
                  return Success("recieved intercept task");
               }
               else if (tsk.TaskType() == "SCRAMBLE")
               {
                  #change_rultype(iacid,iflite,rule_type,"orbit","recieved scramble task");                  
               }
            }
         } 
      }
/* ***************************
//    switch out of intercept faz
******************************/
      else if(PLATFORM->rule_type == "intercept")
      {
         // switch to fighter if within 1.2*commit range
         if (rng_cls_trk < PLATFORM->COMMIT_RNG*1.2)
         {
            change_rultype(iacid,iflite,rule_type,"ftr","Approaching commit range");
            RuleReason = " ".Join({"Approaching Commit Range",(string)(rng_cls_trk*MATH.NM_PER_M())});
         }  
         // if tasks recieved is 0
         if (tsk_mgr.TasksReceived() == 0)
         {
            change_rultype(iacid,iflite,rule_type,"orbit","no valid tasks");   
            RuleReason = "No Valid Tasks";         
         }         
      }
/* ***************************
//    switch out of fighter faz
******************************/
      else if (PLATFORM->rule_type == "ftr")
      {
         if (ROUTE.Size() > 0 && rng_cls_trk > PLATFORM->COMMIT_RNG*1.75 && faz != "egress")
         {
            change_rultype(iacid,iflite,rule_type,"route","no threat hostile tracks");
            RuleReason = " ".Join({"No Threat Hostile Tracks",(string)(rng_cls_trk*MATH.NM_PER_M())});
         }
      }
//**********************************************
// CAPTURE CODE
//**********************************************
      if (iacid->faz == "egress")
      {  
         // A/C successfully egressed to home base, have them "land" and removed from the sim
         if (iacid.GroundRangeTo(home_base) <= 5*MATH.M_PER_NM())
         {
            if (log_print) {log.Write(write_str(iacid.Name()," REMOVED FROM SIM...LANDING","\n") );}
            iacid.DeletePlatform();
#            if (log_print) {log.Close();}
            iacid.SetAuxData("captured",true);
            
            return Failure(" REMOVED FROM SIM...LANDING");
         }
      } 
      return Success(" ".Join({"SELECTED RULETYPE",iacid->rule_type,":",RuleReason}));
//  close log.txt and iout.txt
#   if (log_print){log.Close();}
   end_execute
```

- **演示要点**：演示 execute 的参数：double, cls_host_ltrk, if, else, return

### execute（behavior_evade）｜状态执行

- **关键词**：execute, double, int, for, if, else, 状态执行
- **出处**：`base_types/processors/timeline_agents/behavior_evade.txt:263-468`　（同签名共 5 处，另见 `brawler/processors/quantum_agents/behavior_evade.txt:257`、`heatmap/processors/quantum_agents/aiai/behavior_evade.txt:262`、`timeline/processors/quantum_agents/aiai/behavior_evade.txt:262`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing evade, T=", TIME_NOW);
      //PLATFORM.Comment("evade");

      ### transition to evade incoming
      PLATFORM.GoToSpeed(cEVADE_SPEED);
      writeln_d("   GoToSpeed( ", cEVADE_SPEED," )");

      double safeAltitudeToDiveTo = MATH.Max(mAltitudeMin, (cDEFAULT_ALTITUDE - mAltitudeToDiveEvade));

      // Calculate a heading to evade all incoming missiles, weighted by distance, and then turn to it

      double evadeHeading = 0;
      double evadeAltitude = 0;
      double evadeDivisor = 0;
      double distMod = 0;
      double bearingMod = 0;
      int incomingCount = mIncoming.Size();

      writeln_d(PLATFORM.Name(), " evade. dive/climb between altitudes:  ", cDEFAULT_ALTITUDE, " <-> ", safeAltitudeToDiveTo);
      writeln_d("evading ", incomingCount, " threats");

      double y = 0;
      double x = 0;
      double dist = MATH.DOUBLE_MAX();
      WsfPlatform nearestThreat;
      // calculate an average heading to incoming platforms weighted by distance
      for (int i = 0; i < incomingCount; i = i + 1)
      {
         WsfPlatform temp = (WsfPlatform)(mIncoming[i]);
         if (!temp.IsValid() || (temp.Index() == PLATFORM.Index()))
         {
            continue;
         }
         double range = PLATFORM.SlantRangeTo(temp);
         if (range < dist)
         {
            dist = range;
            nearestThreat = (WsfPlatform)(mIncoming[i]);
         }
         if (range > 0)
         {
            distMod = 1 / range;
         }
         else
         {
            distMod = 1000000;
         }
         bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(temp));
         x = x + MATH.Sin(bearingMod) * distMod;
         y = y + MATH.Cos(bearingMod) * distMod;

         writeln_d("    Incoming ", temp.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", temp.Latitude(), ", ", temp.Longitude(), ", ", temp.Altitude(), ") @ ", temp.Speed(), "m/s");
         evadeDivisor = evadeDivisor + distMod;
         evadeHeading = evadeHeading + bearingMod * distMod;
      }

#      // get the GCI if there is one
      WsfPlatform aiflPlat = PLATFORM.Commander();
      WsfPlatform gciPlat;
      if (aiflPlat.IsValid())
      {
         gciPlat = aiflPlat.Commander();
      }

      // if there's a gci, avoid centroids of all his subs
      if (gciPlat.IsValid() && gciPlat.Index() != aiflPlat.Index())
      {
         writeln_d("found gci : ", gciPlat.Name());
         foreach (WsfPlatform aifl in gciPlat.Subordinates())
         {
            if (!aifl.IsValid() || aifl == PLATFORM || aifl == aiflPlat)
            {
               continue;
            }
            WsfGeoPoint centroid = aifl.GetSubsCentroid();
            if (centroid.X() == 0 && centroid.Y() == 0 && centroid.Z() == 0)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(centroid));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(centroid));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    AIFL ", aifl.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", centroid.Latitude(), ", ", centroid.Longitude(), ", ", centroid.Altitude(), ")");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      // otherwise, avoid members in your own squadron
      else if (aiflPlat.IsValid())
      {
         writeln_d("also evading flight lead subordinates (peers)");
         foreach (WsfPlatform sub in aiflPlat.Subordinates())
         {
            writeln_d("considering peer ", sub.Name());
            if (!sub.IsValid() ||
                sub == PLATFORM)
            {
               continue;
            }
            distMod = 1 / (PLATFORM.SlantRangeTo(sub));
            bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(sub));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeersForEvade;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeersForEvade;

            writeln_d("    Peer ", sub.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", sub.Latitude(), ", ", sub.Longitude(), ", ", sub.Altitude(), ") @ ", sub.Speed(), "m/s");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      else
      {
         writeln_d("evade : no commanders found!!!");
      }

      if (evadeDivisor == 0)
      {
         return;
      }

      // correct for quadrant
      double theta = MATH.NormalizeAngle0_360(MATH.ATan(x/y));
      if (y < 0)
      {
         theta = MATH.NormalizeAngle0_360(theta - 180);
      }

      writeln_d("    x: ", x, ", y: ", y, ", theta: ", theta);

      evadeHeading = MATH.NormalizeAngle0_360(theta - 180);

      if (mWobbleLeftRight == true)
      {
         //turn to angle to evade
         if (mBankLeftFlag == true)
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 - mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180( evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()) );
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) > 0.0)
            {
               mBankLeftFlag = false;
            }
         }
         else // bank right
         {
            evadeHeading = MATH.NormalizeAngle0_360(theta - 180 + mBankAngleForEvading);
            double headDiff = MATH.NormalizeAngleMinus180_180(evadeHeading - MATH.NormalizeAngle0_360(PLATFORM.Heading()));
            if (MATH.Fabs(headDiff) < 2.0 &&
                nearestThreat.RelativeBearingTo(PLATFORM) < 0.0)
            {
               mBankLeftFlag = true;
            }
         }
      }

      evadeAltitude = MATH.Max(safeAltitudeToDiveTo, evadeAltitude);
      if (mWobbleUpDown == true)
      {
         //compute the dive or climb
         if (mDiveDownFlag == true)
         {
           writeln_d(PLATFORM.Name(), " diving to ", safeAltitudeToDiveTo);
           evadeAltitude = safeAltitudeToDiveTo;
           if (PLATFORM.Altitude() <= (cDEFAULT_ALTITUDE - 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = false;
           }
         }
         else
         {
           writeln_d(PLATFORM.Name(), " climbing to ", cDEFAULT_ALTITUDE);
           evadeAltitude = cDEFAULT_ALTITUDE;
           if (PLATFORM.Altitude() >= (safeAltitudeToDiveTo + 0.95*(cDEFAULT_ALTITUDE-safeAltitudeToDiveTo)))
           {
             mDiveDownFlag = true;
           }
         }
      }

      writeln_d("    Evading incoming at heading ", evadeHeading);
      writeln_d("    Evading incoming, dive/climb to ", evadeAltitude);

      Fly(PLATFORM, evadeHeading, evadeAltitude, cEVADE_SPEED);

      if (mDrawNearestThreat)
      {
         mDraw.SetLayer("behavior_evade");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(1,0,0);
         mDraw.SetLineSize(5);
         mDraw.SetLineStyle("dashed");
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(nearestThreat.Location());
         mDraw.End();
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：double, int, for, if, else

### execute（behavior_pursue_weapon_task_target）｜状态执行

- **关键词**：execute, if, string, double, int, else, 状态执行
- **出处**：`heatmap/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:209-425`　（同签名共 4 处，另见 `timeline/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:210`、`timeline_lead/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:210`、`brawler/processors/quantum_agents/behavior_pursue_weapon_task_target.txt:205`）
- **片段**：

```text
   execute
      WsfTrack targetTrack;
      if (mTargetId.IsValid())
      {
         targetTrack = PLATFORM.MasterTrackList().FindTrack(mTargetId);
      }

      if (targetTrack.IsNull() ||
          !targetTrack.IsValid())
      {
         writeln_d("    UpdateInterceptLocation, targetTrack is null or not valid");
         return;
      }

      string comment = write_str(PLATFORM.Name(), " executing quantum_target_task, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

     #extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);

      double ownSpeed       = PLATFORM.Speed();
      double targetSpeed    = targetTrack.Speed();
      double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
      double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
      string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
      int    weaponsActive  = PLATFORM.WeaponsActiveFor(targetTrack.TrackId());

      double engageRangeMax = 185200.0;   //100 miles
      double engageRangeMin =   1852.0;   //  1 mile

      string PursuitMode = "pure";

      if (weaponsActive > 0)
      {
         PursuitMode = "f-pole";
      }
      else if (targetTrack.AirDomain())
      {
         if (slantRangeTo >= engageRangeMax &&
             positioning  != "head-to-head" &&
             positioning  != "head-to-tail" &&
             targetSpeed  >= ownSpeed)
         {
            PursuitMode = "lead";
         }
         else if (slantRangeTo <= engageRangeMax &&
                  positioning  != "head-to-head" &&
                  positioning  != "head-to-tail")
         {
            PursuitMode = "lag";
         }
         //else if (slantRangeTo  > engageRangeMax ||
         //        (slantRangeTo <= engageRangeMax &&
         //        (positioning  == "head-to-head" ||
         //         positioning  == "head-to-tail")))
         //{
         //   PursuitMode = "pure";
         //}
      }

      writeln_d("     PursuitMode = ", PursuitMode);
      // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

      // If we got the altitude from the TRACK, match it
      double interceptHeading  = PLATFORM.Heading();
      double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);

      double interceptAltitude = cDEFAULT_ALTITUDE;

      //check for targets altitude, and whether or not we should match it
      if (targetTrack.ElevationValid() ||
          targetTrack.LocationValid())
      {
         if (targetTrack.Altitude() > interceptAltitude)    //always climb up to target
         {
            interceptAltitude = targetTrack.Altitude();
         }
         else if (MatchAltitudeForThreat(targetTrack) == true)
         {
            interceptAltitude = targetTrack.Altitude();
         }
      }

      //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
      if (interceptAltitude < mMinAltitude)
      {
         interceptAltitude = mMinAltitude;
      }
      writeln_d("desired intercept altitude: ", interceptAltitude);

      mTargetSpeed = mInterceptSpeed;
      if (targetTrack.VelocityValid())
      {
         if (targetTrack.AirDomain())
         {
           #extern double EffectiveRange(WsfPlatform, WsfTrack);

            double speedOfTarget = targetTrack.Speed();
            double effRange      = EffectiveRange(PLATFORM, targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(effRange < mMatchSpeedDistanceMax &&  effRange > mMatchSpeedDistanceMin)
            {
               double rangeScale = (effRange - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
               writeln_d(PLATFORM.Name(), " pursue-target, speed scaled down in matching window!");
            }
            else if (effRange <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
               writeln_d(PLATFORM.Name(), " pursue-target, speed set to match target!");
            }

            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
               writeln_d(PLATFORM.Name(), " pursue-target, speed was lower than wait speed, adjust!");
            }
         }
         else if (targetTrack.LandDomain())
         {
            writeln_d(PLATFORM.Name(), " pursue-target, target is land domain, adjust speed!");
            double speedOfTarget = targetTrack.Speed();
            double range      = PLATFORM.GroundRangeTo(targetTrack);
            double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
            double speedWindow   = mInterceptSpeed - speedOfTarget;

            if(range < mMatchSpeedDistanceMax &&  range > mMatchSpeedDistanceMin)
            {
               double rangeScale = (range - mMatchSpeedDistanceMin) / distanceWindow;
               mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
            }
            else if (range <= mMatchSpeedDistanceMin)
            {
               mTargetSpeed = speedOfTarget * 0.99;
            }

            if (mTargetSpeed < mWaitSpeed)
            {
               mTargetSpeed = mWaitSpeed;
            }
         }
      }

      double leadOrLagTime = 15.0;  //seconds
      if (PursuitMode == "lead")
      {
         WsfWaypoint wpt = WsfWaypoint();
         double tti = PLATFORM.InterceptLocation3D(targetTrack, wpt);
         if (tti > 0.0)
         {
            mTargetPoint = wpt.Location();
         }
         else
         {
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW + leadOrLagTime);
         }
      }
      else if(PursuitMode == "lag")
      {
         double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;

         double maxLagDist = 0.35 * PLATFORM.SlantRangeTo(targetTrack);
         double maxLagTime = maxLagDist / targetTrack.Speed();
         if (usedLagDelay > maxLagTime)
         {
            usedLagDelay = maxLagTime;
         }
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW - usedLagDelay);
      }
      else if (PursuitMode == "f-pole")
      {
         #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
         #interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
         if (PLATFORM.RelativeBearingTo(targetTrack) > 0)
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) - DefaultOffsetAngle);
         }
         else
         {
            interceptHeading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(targetTrack) + DefaultOffsetAngle);
         }
         mTargetPoint = PLATFORM.Location();
         mTargetPoint.Extrapolate(interceptHeading, DefaultOffsetDistance);
      }
      else
      {
         //PursuitMode == pure
         mTargetPoint = targetTrack.LocationAtTime(TIME_NOW);
      }

      if (!mTargetPoint.IsValid())
      {
         mTargetPoint = targetTrack.CurrentLocation();
      }

      mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), interceptAltitude);

      if (mDrawSteering == true)
      {
         mDraw.SetLayer("behavior_pursue_target");
         mDraw.SetDuration(processor.UpdateInterval());
         mDraw.SetColor(1.0, 0.5, 0.0);
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mTargetPoint);
         mDraw.End();
      }

      string msg = write_str("pursue-target: ", targetTrack.TargetName(), " at speed ", (string)mTargetSpeed);
    //PLATFORM.Comment(msg);
      writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
     #extern bool FlyTarget (WsfPlatform, WsfGeoPoint, double);
      FlyTarget( PLATFORM, mTargetPoint, mTargetSpeed);
   end_execute
```

- **演示要点**：演示 execute 的参数：if, string, double, int, else

### execute（behavior_pincer）｜状态执行

- **关键词**：execute, if, double, else, extern, int, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pincer.txt:101-323`
- **片段**：

```text
   execute

      writeln_d(PLATFORM.Name(), " executing pincer!, T=", TIME_NOW);
      //provide for another channel for pursue-target jobs
      if (((WsfRIPRProcessor)PROCESSOR).NumJobChannels() <= 1)
      {
         ((WsfRIPRProcessor)PROCESSOR).SetNumJobChannels(2);
      }
      //writelnd("executing pincer.");
      ((WsfRIPRProcessor)PROCESSOR).ClearTarget();
      //calculate heading if we are still flying offset
      double angle = 0;
      if (mDirection == "left")
      {
         angle = -mPincerOffsetAngle;
      }
      else if (mDirection == "right")
      {
         angle = mPincerOffsetAngle;
      }

      double heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) + angle);

      //find out if we are being chased & should drag threats away
      WsfTrack worstTrack;
      double worstDist = MATH.DOUBLE_MAX();
      double worstFOV = MATH.DOUBLE_MAX();
      Array<string> targetNames = (Array<string>)mCurrentJob.GetData("ZoneThreatNameArray");
      extern WsfTrack GetTrackByName (WsfPlatform, string);
      int allOnCap = (int)mCurrentJob.GetData("all_on_cap");
      if (allOnCap <= 0)
      {
         //save off the closest opponent track
         foreach(string tgtName in targetNames)
         {
            WsfTrack tgt = GetTrackByName(PLATFORM, tgtName);
            if (tgt.IsValid() && tgt.LocationValid())
            {
               double attackRange = tgt.GroundRangeTo(PLATFORM);
               if (attackRange < worstDist)
               {
                  //run away, drag threats out
                  worstDist = attackRange;
                  worstTrack = tgt;
               }
               double fov = MATH.Fabs(tgt.RelativeBearingTo(PLATFORM));
               if (fov < worstFOV)
               {
                  worstFOV = fov;
               }
            }
         }

         //manage dragging state
         if (  (mDragging == false) &&
               (worstDist < mRunDistance) &&
               (worstTrack.IsValid()) &&
               (worstTrack.HeadingValid()) &&
               (MATH.Fabs(worstTrack.TrueBearingTo(PLATFORM)-worstTrack.Heading()) < mRunAngleLimit))
         {
            mDragging = true;
            if (mDirection == "right")
            {
               int count = (int)mCurrentJob.GetData("right_drag");
               mCurrentJob.SetData("right_drag",count+1);
               writeln_d(PLATFORM.Name(), " increased right_drag to: ", count+1);
            }
            else if (mDirection == "left")
            {
               int count = (int)mCurrentJob.GetData("left_drag");
               mCurrentJob.SetData("left_drag",count+1);
               writeln_d(PLATFORM.Name(), " increased left_drag to: ", count+1);
            }
         }
         else if (   (mDragging == true) &&
                     (  (!worstTrack.IsValid()) ||
                        (worstDist > (mRunDistance*1.1)) ||
                        (!worstTrack.HeadingValid()) ||
                        (MATH.Fabs(worstTrack.TrueBearingTo(PLATFORM)-worstTrack.Heading()) > (mRunAngleLimit*1.1))))
         {
            mDragging = false;
            if (mDirection == "right")
            {
               int count = (int)mCurrentJob.GetData("right_drag");
               mCurrentJob.SetData("right_drag",count-1);
               writeln_d(PLATFORM.Name(), " decreased right_drag to: ", count-1);
            }
            else if (mDirection == "left")
            {
               int count = (int)mCurrentJob.GetData("left_drag");
               mCurrentJob.SetData("left_drag",count -1);
               writeln_d(PLATFORM.Name(), " decreased left_drag to: ", count-1);
            }
         }

         mChasing = false;

         if (mDragging == true)
         {
            writeln_d("dragging!");
            //try to maintain distance
            PLATFORM.GoToSpeed(mDragSpeed);
            double dragOffset = GetPincerDragOffset(worstTrack);
            if (mDirection == "right")
            {
               if (mDragAddedAngle > 0)
               {
                  heading = MATH.NormalizeAngle0_360(heading + mDragAddedAngle);
               }
               else
               {
                  heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) + dragOffset);
               }
            }
            else if (mDirection == "left")
            {
               if (mDragAddedAngle > 0)
               {
                  heading = MATH.NormalizeAngle0_360(heading - mDragAddedAngle);
               }
               else
               {
                  heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) - dragOffset);
               }
            }
         }
         else
         {
            //look for reasons to chase
            PLATFORM.GoToSpeed(mPincerSpeed);
            //check if other pair is dragging, so we should chase
            int count = 0;
            if (mDirection == "right")
            {
               count = (int)mCurrentJob.GetData("left_drag");
            }
            else if (mDirection == "left")
            {
               count = (int)mCurrentJob.GetData("right_drag");
            }

            double diff = 0;
            if (worstTrack.IsValid() && worstTrack.HeadingValid())
            {
               double b1 = worstTrack.Heading();
               double b2 = worstTrack.TrueBearingTo(PLATFORM.Location());
               diff = MATH.NormalizeAngleMinus180_180(b2 - b1);
            }

            if (count > 0 && MATH.Fabs(diff) > mEnemyFOVHalfAngle)
            {
               //the other pincer group is being engaged, turn in now
               writeln_d(PLATFORM.Name(), " chasing because other pair is dragging");
               mChasing = true;
            }
            //check if we have flanked & can now chase
            else
            {
               if (mDirection == "right" && diff < -mChaseAngle)
               {
                  writeln_d(PLATFORM.Name(), " right chasing because past chase angle");
                  mChasing = true;
               }
               else if (mDirection == "left" && diff > mChaseAngle)
               {
                  mChasing = true;
                  writeln_d(PLATFORM.Name(), " left chasing because past chase angle");
               }
            }
         }
      }
      else
      {
         writeln_d("All targets still on cap, no dragging or chasing yet!");
      }

      if (mChasing == true)
      {
         writeln_d("chasing!");
         //double FOV = MATH.Fabs(worstTrack.RelativeBearingTo(PLATFORM));
         if (worstFOV <= mEnemyFOVHalfAngle)
         {
            PLATFORM.GoToSpeed(mChaseSpeedlnsideFOV);
         }
         else
         {
            PLATFORM.GoToSpeed(mChaseSpeedOutsideFOV);
         }

         if (worstTrack.IsValid())
         {
            heading = PLATFORM.TrueBearingTo(worstTrack);
            ((WsfRIPRProcessor)PROCESSOR).SetTarget(worstTrack);
         }
         else
         {
            heading = PLATFORM.TrueBearingTo((WsfGeoPoint)mCurrentJob.GetData("ZonePoint"));
         }
      }

      PLATFORM.TurnToHeading(heading);

      if (mDrawSteering == true)
      {
         WsfGeoPoint pt = PLATFORM.Location();
         pt.Extrapolate(heading, 185200);
         mDraw.SetLayer("behavior_pincer");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(0.0, 1.0, 0.75); //green-blue
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(pt);
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mPincerPoint);
         mDraw.End();
      }
      # # writeln_d(" T=", TIME_NOW, ", range: ", interceptRange, " true-bearing; interceptHeading); #
      ##if ( (interceptAltitude - PLATFORM.Altitude()) > 5) #if ( (interceptAltitude - PLATFORM.Altitude()) > 10000*MATH.M_PER_FT())
      #{
      # writeln_d("GoToAltitude: ",interceptAltitude); # #PLATF0RM.GoToAltitude(interceptAltitude);
      #>
   end_execute
```

- **演示要点**：演示 execute 的参数：if, double, else, extern, int

### execute（behavior_timeline_engage）｜状态执行

- **关键词**：execute, extern, if, else, foreach, 状态执行
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_engage.txt:225-272`
- **片段**：

```text
   execute
      #mEngageTarget;
      extern double mDefaultAltitude;

      #check if we need to fly offset to get on proper side of engagement separation line
      extern double mEngageSpeed;
      extern double mGeesToTurnWith;
      extern bool   mSeparateEngagement;
      if (mSeparateEngagement == true)
      {
         extern string mSeparateSide;  # "LEFT" or "RIGHT"
         extern double mEngagementTrueBearing;
         extern double mOffsetAngle;
         double delta = PLATFORM.TrueBearingTo(mEngageTarget) - mEngagementTrueBearing;
         if (delta < 0 && mSeparateSide == "LEFT")
         {
            #we're out of position, crank left
            Offset(PLATFORM, mEngageTarget.CurrentLocation(), -mOffsetAngle, mDefaultAltitude, mEngageSpeed, mGeesToTurnWith);
         }
         else if (delta > 0 && mSeparateSide == "RIGHT")
         {
            #we're out of position, crank right
            Offset(PLATFORM, mEngageTarget.CurrentLocation(),  mOffsetAngle, mDefaultAltitude, mEngageSpeed, mGeesToTurnWith);
         }
         else
         {
            #engage straight way - intercept the target
            Engage(PLATFORM, mEngageTarget, "lead", mEngageSpeed, mDefaultAltitude, mGeesToTurnWith);
         }
      }
      else
      {
         #engage straight way - intercept the target
         Engage(PLATFORM, mEngageTarget, "lead", mEngageSpeed, mDefaultAltitude, mGeesToTurnWith);
      }

      #TODO - check for shot range, prep for shot if appropriate?

#      #if possible, fire a weapon at the target
#      TryToFireOn(mEngageTarget);

      #try for shots on all shootable targets
      foreach (WsfLocalTrack target in mTimeLineLocalTargetsToShoot)
      {
         TryToFireOn(target);
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：extern, if, else, foreach

### execute（behavior_pursue_heading_smooth）｜状态执行

- **关键词**：execute, string, extern, double, if, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_heading_smooth.txt:38-86`
- **片段**：

```text
   execute
      string comment = write_str(PLATFORM.Name(), " executing pursue_heading_smooth, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

      extern double mDesiredHeading;      //for read/write
      extern double mDesiredRadialAccel;  //for read/write
      extern double mDesiredSpeed;        //for read only here

      // The intercept point may fluctuate because of manuevers or track errors.
      // Minor changes in the intercept point are ignored.

      WsfGeoPoint newInterceptLoc = mTargetTrack.CurrentLocation();
      double interceptDelta    = newInterceptLoc.SlantRangeTo(mInterceptLoc);
      double revectorThreshold = mInterceptRevectorThreshold * 0.01 * PLATFORM.SlantRangeTo(newInterceptLoc);
      if (interceptDelta > revectorThreshold)
      {
         mInterceptLoc.Set(newInterceptLoc);
      }

      // The standard air mover will turn at the current maximum allowable rate to make the
      // heading change. This causes a lot of wing-wobble that wouldn't appear in real life.

      // Compute the minimum acceleration needed to complete the turn well before predicted intercept
      double headingChange    = PLATFORM.RelativeBearingTo(mInterceptLoc);
      double absHeadingChange = MATH.Fabs(headingChange);
      double interceptRange   = PLATFORM.SlantRangeTo(mInterceptLoc);
      double timeToIntercept  = interceptRange / mDesiredSpeed;
      double minRadialAccel   = (absHeadingChange / (0.5 * timeToIntercept)) * mDesiredSpeed;
      if (minRadialAccel < 0.01) minRadialAccel = 0.01;

      // Major heading changes (greater than mInterceptLargeHeadingChange degrees) are performed
      // at 1g. Minor heading changes are performed at successively smaller rates. Both are
      // subject to the minimum computed above.
      double radialAccel = 9.8;
      if (absHeadingChange < mInterceptLargeHeadingChange)
      {
         radialAccel = 9.8 * (absHeadingChange * absHeadingChange) /
                             (mInterceptLargeHeadingChange * mInterceptLargeHeadingChange);
      }
      if (radialAccel < minRadialAccel)
      {
         radialAccel = minRadialAccel;
      }

      //set the values of the required parameters when calculated
      mDesiredHeading = PLATFORM.TrueBearingTo(mInterceptLoc);
      mDesiredRadialAccel = radialAccel;
   end_execute
```

- **演示要点**：演示 execute 的参数：string, extern, double, if

### execute（behavior_search）｜状态执行

- **关键词**：execute, double, if, else, string, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_search.txt:53-104`　（同签名共 2 处，另见 `heatmap/processors/quantum_agents/aiai/behavior_search.txt:49`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing search, T=", TIME_NOW);

      WsfGeoPoint targetPoint = WsfGeoPoint();
      double ownSpeed = PLATFORM.Speed();

      WsfTaskList tasks = processor.TasksReceivedOfType("SEARCH");
      WsfTask task = tasks.Entry(0);

      if (task.IsValid() && task.AuxDataExists("HeatPoint"))
      {
         writeln_d(PLATFORM.Name(), " has HeatPoint aux data, T=", TIME_NOW);
         targetPoint = (WsfGeoPoint)task.AuxDataObject("HeatPoint");
      }
      else
      {
         return;
      }

      //make sure radar is on
      WsfSensor searchRadar = PLATFORM.Sensor(mSearchRadarName);
      if (searchRadar.IsValid())
      {
         if (!searchRadar.IsTurnedOn())
         {
            searchRadar.TurnOn();
            writeln_d(PLATFORM.Name(), " turned on active radar ", searchRadar);
         }
         else
         {
            writeln_d("  radar already turned on");
         }
      }


      if (mDrawSteering == true)
      {
         mDraw.SetLayer("behavior_search");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(1.0, 0.5, 0.0);
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(targetPoint);
         mDraw.End();
      }

      string msg = write_str("pursue-target: ", targetPoint, " at speed ", (string)ownSpeed);
      writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);

      FlyTarget(PLATFORM, targetPoint, ownSpeed);
   end_execute
```

- **演示要点**：演示 execute 的参数：double, if, else, string

### execute（behavior_create_clustering_jobs）｜状态执行

- **关键词**：execute, foreach, int, for, jobs, 状态执行
- **出处**：`base_types/processors/ripr_agents/aigci/behavior_create_clustering_jobs.txt:170-257`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing create_clustering_jobs, T=", TIME_NOW);

      ##########################################################################
      ##   update the cluster manager with the current master track list
      ##########################################################################
     #extern bool TestTrackCategory( WsfTrack, string );
      WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
      trackArray.Clear();
      foreach (WsfTrack track in localTracks)
      {
         if (!mRequireKnownCategory || !TestTrackCategory(track, "unknown"))
         {
            track.SetBearing( track.Heading() );  #useful for the cluster processing
            trackArray.PushBack(track);
         }
      }
      cManager.UpdateClusters(TIME_NOW,trackArray);

      ##########################################################################
      ##  update or add jobs for all the clusters
      ##########################################################################
      Map<int, int> updatedJobs = Map<int, int>();
      int NumClusters = cManager.Count();
      for (int i = 0; i < NumClusters; i = i + 1 )
      {
         WsfCluster cluster = cManager.Entry(i);
         int clusterId = cluster.Id();

         if (mDrawClusters == true)
         {
            draw_cluster_hull(cluster);
         }

         if( cluster.Count() > 0 )
         {
            if (update_cluster_job(cluster))
            {
               //writeln_d("cluster already exists & was updated!");
            }
            else
            {
               add_cluster_job(cluster);
            }
            updatedJobs.Set(clusterId, 1);
         }
      }

      ##########################################################################
      ##  remove any old jobs for clusters that have gone away
      ##########################################################################
      Array<WsfRIPRJob> jobs = ((WsfRIPRProcessor)PROCESSOR).GetJobs();
      foreach( WsfRIPRJob aJob in jobs )
      {
         if (aJob.Name() == "zone")
         {
            int clusterId = (int)aJob.GetData("clusterId");
            if (updatedJobs.Get(clusterId) != 1)
            {
               remove_cluster_job( aJob );
            }
         }
      }

      ##########################################################################
      ##  print out a message if there are any new winners of jobs
      ##########################################################################
      jobs = ((WsfRIPRProcessor)PROCESSOR).GetJobs();
      foreach( WsfRIPRJob aJob in jobs )
      {
         if( ! mJobToWinnerMap.Exists( aJob.GetId() ) )
         {
            mJobToWinnerMap.Set( aJob.GetId(), 0 );
         }
         else
         {
            int currWinners = aJob.GetNumWinners();
            int lastWinners = mJobToWinnerMap.Get( aJob.GetId() );
            if( currWinners != lastWinners )
            {
               string NewComment = "AIGCI - Sub took a job: " + aJob.Name() + " - " + aJob.GetDescription();
               PLATFORM.Comment(NewComment);
               mJobToWinnerMap.Set( aJob.GetId(), currWinners );
            }
         }
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：foreach, int, for, jobs

### execute（selector_escort）｜状态执行

- **关键词**：execute, if, else, double, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_escort.txt:219-314`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing escort, T=", TIME_NOW);
      //PLATFORM.Comment("escort");

      //make sure escorted platform exists, find it, save it
      WsfPlatform escortPlatform = GetEscortPackage();
      if (!escortPlatform.IsValid() )
      {
         writeln_d("--- fighter ", PLATFORM.Name(), " no valid platform to escort!");
         return Failure("No valid platform to escort!");
      }

      //check if I am approximately in my formation position
      WsfGeoPoint formationPoint = escortPlatform.Location();
      
      if (mFormationAltitude > 0)
      {
        formationPoint.Set(formationPoint.Latitude(), formationPoint.Longitude(), mFormationAltitude);
      }

      if (mFormationPositionX > 0)
      {
         formationPoint.Extrapolate(escortPlatform.Heading(), mFormationPositionX);
      }
      else
      {
         formationPoint.Extrapolate(escortPlatform.Heading()+180, -mFormationPositionX);
      }

      if (mFormationPositionY > 0)
      {
         formationPoint.Extrapolate(escortPlatform.Heading()+90.0, mFormationPositionY);
      }
      else
      {
         formationPoint.Extrapolate(escortPlatform.Heading()-90.0, -mFormationPositionY);
      }

      if (!formationPoint.IsValid())
      {
         writeln_d("--- fighter ", PLATFORM.Name(), " invalid formation point from ", escortPlatform.Name());
         return Failure("Invalid formation point from " + escortPlatform.Name());
      }

      if (mDrawEscortData == true)
      {
         mDraw.SetLayer("behavior_escort");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());

         // draw protection bubbles (outter ring includes chase distance)
        #mDraw.SetColor(0.5, 0.5, 0.5, 0.33);   //gray with 0.33 alpha
        #mDraw.SetEllipseMode("fill");
         mDraw.SetColor(0.5, 0.5, 0.5, 1.0);   //gray
         mDraw.SetEllipseMode("line");
         double R = mEscortProtectDistance + mWeaponRangeToInclude;
         mDraw.BeginEllipse(0, R, R);
            mDraw.Vertex(escortPlatform.Location());
         mDraw.End();
         R += mEscortChaseDistance;
         mDraw.BeginEllipse(0, R, R);
            mDraw.Vertex(escortPlatform.Location());
         mDraw.End();
         
         // draw line to desired formation position
         mDraw.SetColor(0, 1, 0);   //green
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(escortPlatform.Location());
            mDraw.Vertex(formationPoint);
         mDraw.End();
      }

      double radius = mGoodFormationRatio * escortPlatform.SlantRangeTo(formationPoint);
      
      double formAlt   = escortPlatform.Altitude();
      double formSpeed = escortPlatform.Speed();
      double formYaw   = escortPlatform.Heading();
      if (formAlt < PLATFORM.Altitude())
      {
         formAlt = PLATFORM.Altitude();
      }
      WsfGeoPoint tgt = WsfGeoPoint.Construct(formationPoint.Latitude(), formationPoint.Longitude(), formAlt);
      double lookAheadDistance  = mFormationLookAhead * escortPlatform.Speed();
      tgt.Extrapolate(formYaw, lookAheadDistance);

      if (! AmInFormationPosition(formationPoint, radius))
      {
         //fly towards formation position, extrapolated ahead X seconds, in order to catch up to the point in X seconds
         formSpeed = PLATFORM.GroundRangeTo(tgt) / mFormationLookAhead;
      }

     #extern bool FlyTarget (WsfPlatform, WsfGeoPoint,    double);
      FlyTarget (PLATFORM, tgt, formSpeed);

      return Running("Escorting " + escortPlatform.Name());
   end_execute
```

- **演示要点**：演示 execute 的参数：if, else, double, return

### execute（behavior_pilot_posture）｜状态执行

- **关键词**：execute, double, extern, if, hlval, 状态执行
- **出处**：`base_types/platforms/brawler/alternatives/behavior_pilot_posture.txt:56-262`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_pilot_posture.txt:54`）
- **片段**：

```text
   execute

     writeln_d("executing pilot_posture");

      Vec3 xp = brawlerPlatform.LocationNED();
      Vec3 vp = PLATFORM.VelocityNED();
      double spdnow = PLATFORM.Speed()*MATH.FT_PER_M();
      Vec3 xp_iac = brawlerPlatform.LocationNED(targetTrack);
      Vec3 vp_iac =  targetTrack.VelocityNED();


      #aslct2()
         #spcial()
            #spbvri()


      //   "iac" is target index, get target track from WEAPON task, for now

      Vec3 hlvec = Vec3();
      double hlspd = 0.0;
      double hlval = 0.0;

      extern int kturn;
      //C     --GET KTURN VALUE
      //call ckrngi(myturn,-2,2,'~KTURN(IACID)~')
      double sgn = 1.0;
      if (kturn<0)
      {
         sgn = -1.0;
      }
     #double vsme = 0.0;   #TODO - speed of sound
     #double bvrmch = 0.0; #TODO - mach to use BVR (MIND2)
     #double bvrmch = PLATFORM.Speed()*MATH.FT_PER_M() / vsme;
     #double sa = vsme*bvrmch;
      double sa = brawlerPlatform.Speed()*MATH.FT_PER_M();

      //call asstgt(iacord,jacidord,virtl,nassign)
      //if(nassign.eq.0) goto 900
      //iac = iacord(1);
      if (kturn != 0)
      {
        writeln_d("kturn != 0");
         //C        --THIS CODE NOT NEEDED FOR POINT TACTIC:
         //C        --COMPUTE INTERCEPT PT AIMP, BASED ON MAX OF MACH 1 OR PRESENT MACH
         //C        --USE THE FIRST MEMBER OF THE ASSIGNED TARGET GROUP.
         #st = xmag(vp(1,iac));
         double st = vp_iac.Magnitude();

         //LBM - TODO - verify units used in WsfBrawlerPlatform AimPoint and Intercept() methods!!!
         #call aimpt(xp(1,me),amax1(sa,vsme),xp(1,iac),vp_iac,st,aimp,lsoln);
         #Vec3 aimp = brawlerPlatform.AimPoint(xp, MATH.Max(sa, vsme), xp_iac, vp_iac, st);
         Vec3 aimp = brawlerPlatform.AimPoint(xp, sa, xp_iac, vp_iac, st);

         #Vec3 dxpme = Vec3.Subtract(xp_iac, xp);
         #Vec3 dxt = dxpme;
         Vec3 dxt = Vec3.Subtract(xp_iac, xp);
         dxt.SetZ(0.0);
         dxt.Normalize();
         if(aimp.Magnitude() > 0)
         {
            #call vsub(aimp,xp(1,me),dxi);
            Vec3 dxi = Vec3.Subtract(aimp, xp);
            dxi.SetZ(0.0);
            dxi.Normalize();
         }
      }

#      if (kturn == 0)   //C     --POINT AT TGT
#      {
#         hdes = -xp(3,me);
#         if (lbit(pp_skrs,saskr) || pp_comg)
#         {
#            if (!ppmtrk)
#            {
#               hdes = amin1(hdes,-xp(3,iac));
#            }
#         }
##         //LBM - dont worry about rules right now
##         //C     --CHANGED RULFLG VALUE 18 NOV 87 DICKERSON
##         if (rulflg == 1510)
##         {
##            call pcode(-rulflg);
##            hdes = prdalt;
##         }
#
#           Vec3 aimpt = ((WsfBrawlerPlatform)PLATFORM).AimPoint(Vec3, double, Vec3, Vec3, double);
#
#          #call intcpt(xp(1,me),spdnow(me),xp(1,iac),vp(1,iac),root3/2.0,0.0,hdes,hlvec,hlspd);
#           hlvec = ((WsfBrawlerPlatform)PLATFORM).Intercept(Vec3, PLATFORM.Speed()*MATH.FT_PER_M(), Vec3, Vec3, double, double, double);
#           hlspd = hlvec.Magnitude();
#           hlvec.Normalize();
#
#         //goto 965;
#      }
#      //else
      if (kturn == 1 || kturn == -1)   //C     --END-RUN TGT
      {
         writeln_d("end run");
         double closmn = root3/2.0;
         double angint = splita*sgn;
         double hdes = PLATFORM.Altitude();
         //hdes = -xp(3,me);

         //LBM - dont worry about lower targets or flying lower, for now
#         if (lbit(pp_skrs,saskr) || pp_comg)
#         {
#            if (!ppmtrk)
#            {
#               hdes = amin1(hdes,-xp(3,iac));
#            }
#         }
          //LBM - dont worry about rules right now
#         //C     --CHANGED RULFLG VALUE 18 NOV 87 DICKERSON
#         if (rulflg == 1510)
#         {
#            call pcode(-rulflg);
#            hdes = prdalt;
#         }


         //LBM - TODO - verify units used in WsfBrawlerPlatform AimPoint and Intercept() methods!!!
         //call intcpt(xp(1,me),spdnow(me),xp(1,iac),vp(1,iac),root3/2.0,splita*sgn,hdes,hlvec,hlspd);
         Vec3 desVec = brawlerPlatform.Intercept(xp, spdnow, xp_iac, vp_iac, closmn, angint, hdes);
         hlvec = desVec.Normal();
         hlspd = desVec.Magnitude();

         //brawlerPlatform.InterceptLocation3D(

         //goto 965;
      }
#      else if (kturn == 2 || kturn == -2)   //C     --LOOP
#      {
#         if (lsoln) then
#            call xmit3(dxi,temp)
#         else
#            call xmit3(dxt,temp)
#         endif
#         call makex(vp(1,me),r)
#         call vxfrmc(r,temp,temp,1)
#         loopha = loopha .or. temp(1).lt.0.
#         loopnf = loopnf .or. (loopha .and. temp(1).gt.0. .and. (sign(1.,temp(2)).eq.sgn) )
#         if (loopnf) then
#            //C        --HERE NO LONGER LOOP - POINT
#            goto 100
#         endif
#         temp(1) = 0.
#         temp(2) = sgn
#         temp(3) = 0.
#         call vxfrmc(r,hlvec,temp,2)
#         hlval = valme*1.5
#         hlspd = bvrmch*spdnow(me)/fmachp
#         //C     --TURN OFF FORMATION VALUES DURING LOOP:
#         mdskpp = iand(mdskpp,6)
#         stkppp = stkppp*0.25
#         goto 970
#      }

#      //C
#//900   continue
#      //C     --HERE NO TGT - PRESUMABLY DEAD
#      hlval = 0.
#      goto 970
#      //C

//965   continue
      //C     --FINISH SETTING UP HIGH LEVEL STEERING VALUES
      #hlval = valeff(iac);
      hlval = brawlerPlatform.LastEngagementValue(targetTrack.Target());
      #writeln_d("hlvec = ", hlvec.ToString(), ", hlval = ", hlval, ", hlspd = ", hlspd);

//970   continue

      //call steer
         #steer()
#         if (dirspc.ne.0) then
#            //C        --SUPPRESS VECTORED FLIGHT VALUES - DIRECT HAS PRECEDENCE
#            valfpp= 0.0
#         elseif (vfspc.eq.0) then
            //C        --USE NORMAL HIGH_LEVEL VALUES FOR VECTORED_FLIGHT
            //call xmit(3,hlvec,vecfpp)

            extern Vec3   vecfpp;
            extern double valfpp;
            extern double sflypp;
            vecfpp = hlvec;
            valfpp = hlval;
            sflypp = hlspd;

            writeln_d("vecfpp = ", vecfpp.ToString(), ", valfpp = ", valfpp, ", sflypp = ", sflypp);


            brawlerPlatform.SuggestVectoredFlight(vecfpp, valfpp, sflypp);
#         else
#            //C        --USE FORCE_V VECTOR INSTEAD OF HL... VALUES
#            //C        --THESE MAY BE SET BY EITHER PRODUCTION RULES OR IP
#            call xmit(3,hlvfor,vecfpp)
#            valfpp = hlvalf
#            sflypp = hlspdf
#         endif


      //call sepset(10.0)   //LBM - not doing separation yet
//9999
      return;


   end_execute
```

- **演示要点**：演示 execute 的参数：double, extern, if, hlval

### execute（behavior_pincer）｜状态执行

- **关键词**：execute, if, double, else, int, 状态执行
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pincer.txt:101-323`
- **片段**：

```text
   execute

      writeln_d(PLATFORM.Name(), " executing pincer!, T=", TIME_NOW);
      //provide for another channel for pursue-target jobs
      if (((WsfRIPRProcessor)PROCESSOR).NumJobChannels() <= 1)
      {
         ((WsfRIPRProcessor)PROCESSOR).SetNumJobChannels(2);
      }
      //writelnd("executing pincer.");
      ((WsfRIPRProcessor)PROCESSOR).ClearTarget();
      //calculate heading if we are still flying offset
      double angle = 0;
      if (mDirection == "left")
      {
         angle = -mPincerOffsetAngle;
      }
      else if (mDirection == "right")
      {
         angle = mPincerOffsetAngle;
      }

      double heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) + angle);

      //find out if we are being chased & should drag threats away
      WsfTrack worstTrack;
      double worstDist = MATH.DOUBLE_MAX();
      double worstFOV = MATH.DOUBLE_MAX();
      Array<string> targetNames = (Array<string>)mCurrentJob.GetData("ZoneThreatNameArray");
     #extern WsfTrack GetTrackByName (WsfPlatform, string);
      int allOnCap = (int)mCurrentJob.GetData("all_on_cap");
      if (allOnCap <= 0)
      {
         //save off the closest opponent track
         foreach(string tgtName in targetNames)
         {
            WsfTrack tgt = GetTrackByName(PLATFORM, tgtName);
            if (tgt.IsValid() && tgt.LocationValid())
            {
               double attackRange = tgt.GroundRangeTo(PLATFORM);
               if (attackRange < worstDist)
               {
                  //run away, drag threats out
                  worstDist = attackRange;
                  worstTrack = tgt;
               }
               double fov = MATH.Fabs(tgt.RelativeBearingTo(PLATFORM));
               if (fov < worstFOV)
               {
                  worstFOV = fov;
               }
            }
         }

         //manage dragging state
         if (  (mDragging == false) &&
               (worstDist < mRunDistance) &&
               (worstTrack.IsValid()) &&
               (worstTrack.HeadingValid()) &&
               (MATH.Fabs(worstTrack.TrueBearingTo(PLATFORM)-worstTrack.Heading()) < mRunAngleLimit))
         {
            mDragging = true;
            if (mDirection == "right")
            {
               int count = (int)mCurrentJob.GetData("right_drag");
               mCurrentJob.SetData("right_drag",count+1);
               writeln_d(PLATFORM.Name(), " increased right_drag to: ", count+1);
            }
            else if (mDirection == "left")
            {
               int count = (int)mCurrentJob.GetData("left_drag");
               mCurrentJob.SetData("left_drag",count+1);
               writeln_d(PLATFORM.Name(), " increased left_drag to: ", count+1);
            }
         }
         else if (   (mDragging == true) &&
                     (  (!worstTrack.IsValid()) ||
                        (worstDist > (mRunDistance*1.1)) ||
                        (!worstTrack.HeadingValid()) ||
                        (MATH.Fabs(worstTrack.TrueBearingTo(PLATFORM)-worstTrack.Heading()) > (mRunAngleLimit*1.1))))
         {
            mDragging = false;
            if (mDirection == "right")
            {
               int count = (int)mCurrentJob.GetData("right_drag");
               mCurrentJob.SetData("right_drag",count-1);
               writeln_d(PLATFORM.Name(), " decreased right_drag to: ", count-1);
            }
            else if (mDirection == "left")
            {
               int count = (int)mCurrentJob.GetData("left_drag");
               mCurrentJob.SetData("left_drag",count -1);
               writeln_d(PLATFORM.Name(), " decreased left_drag to: ", count-1);
            }
         }

         mChasing = false;

         if (mDragging == true)
         {
            writeln_d("dragging!");
            //try to maintain distance
            PLATFORM.GoToSpeed(mDragSpeed);
            double dragOffset = GetPincerDragOffset(worstTrack);
            if (mDirection == "right")
            {
               if (mDragAddedAngle > 0)
               {
                  heading = MATH.NormalizeAngle0_360(heading + mDragAddedAngle);
               }
               else
               {
                  heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) + dragOffset);
               }
            }
            else if (mDirection == "left")
            {
               if (mDragAddedAngle > 0)
               {
                  heading = MATH.NormalizeAngle0_360(heading - mDragAddedAngle);
               }
               else
               {
                  heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) - dragOffset);
               }
            }
         }
         else
         {
            //look for reasons to chase
            PLATFORM.GoToSpeed(mPincerSpeed);
            //check if other pair is dragging, so we should chase
            int count = 0;
            if (mDirection == "right")
            {
               count = (int)mCurrentJob.GetData("left_drag");
            }
            else if (mDirection == "left")
            {
               count = (int)mCurrentJob.GetData("right_drag");
            }

            double diff = 0;
            if (worstTrack.IsValid() && worstTrack.HeadingValid())
            {
               double b1 = worstTrack.Heading();
               double b2 = worstTrack.TrueBearingTo(PLATFORM.Location());
               diff = MATH.NormalizeAngleMinus180_180(b2 - b1);
            }

            if (count > 0 && MATH.Fabs(diff) > mEnemyFOVHalfAngle)
            {
               //the other pincer group is being engaged, turn in now
               writeln_d(PLATFORM.Name(), " chasing because other pair is dragging");
               mChasing = true;
            }
            //check if we have flanked & can now chase
            else
            {
               if (mDirection == "right" && diff < -mChaseAngle)
               {
                  writeln_d(PLATFORM.Name(), " right chasing because past chase angle");
                  mChasing = true;
               }
               else if (mDirection == "left" && diff > mChaseAngle)
               {
                  mChasing = true;
                  writeln_d(PLATFORM.Name(), " left chasing because past chase angle");
               }
            }
         }
      }
      else
      {
         writeln_d("All targets still on cap, no dragging or chasing yet!");
      }

      if (mChasing == true)
      {
         writeln_d("chasing!");
         //double FOV = MATH.Fabs(worstTrack.RelativeBearingTo(PLATFORM));
         if (worstFOV <= mEnemyFOVHalfAngle)
         {
            PLATFORM.GoToSpeed(mChaseSpeedlnsideFOV);
         }
         else
         {
            PLATFORM.GoToSpeed(mChaseSpeedOutsideFOV);
         }

         if (worstTrack.IsValid())
         {
            heading = PLATFORM.TrueBearingTo(worstTrack);
            ((WsfRIPRProcessor)PROCESSOR).SetTarget(worstTrack);
         }
         else
         {
            heading = PLATFORM.TrueBearingTo((WsfGeoPoint)mCurrentJob.GetData("ZonePoint"));
         }
      }

      PLATFORM.TurnToHeading(heading);

      if (mDrawSteering == true)
      {
         WsfGeoPoint pt = PLATFORM.Location();
         pt.Extrapolate(heading, 185200);
         mDraw.SetLayer("behavior_pincer");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(0.0, 1.0, 0.75); //green-blue
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(pt);
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mPincerPoint);
         mDraw.End();
      }
      # # writeln_d(" T=", TIME_NOW, ", range: ", interceptRange, " true-bearing; interceptHeading); #
      ##if ( (interceptAltitude - PLATFORM.Altitude()) > 5) #if ( (interceptAltitude - PLATFORM.Altitude()) > 10000*MATH.M_PER_FT())
      #{
      # writeln_d("GoToAltitude: ",interceptAltitude); # #PLATF0RM.GoToAltitude(interceptAltitude);
      #>
   end_execute
```

- **演示要点**：演示 execute 的参数：if, double, else, int

### execute（behavior_pursue-target (2)）｜状态执行

- **关键词**：execute, string, extern, if, else, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target (2).txt:192-447`　（同签名共 2 处，另见 `base_types/processors/quantum_agents/aiai/behavior_pursue-target.txt:370`）
- **片段**：

```text
   execute
      string comment = write_str(PLATFORM.Name(), " executing pursue-target, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

      extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);
      extern double   GetWeaponRangeMax(WsfPlatform aPlatform, Array<Map<string, Object>> aWeaponArray);
      extern Array<Map<string, Object>> mWeaponArray;

      //get target from ripr processor, to be sure
      WsfTrack targetTrack = ((WsfRIPRProcessor)PROCESSOR).GetTarget();

      if (targetTrack.IsNull() ||
          !targetTrack.IsValid())
      {
         writeln_d("    UpdateInterceptLocation, targetTrack is null or not valid");
         return;
      }

      if (mUseMoverDuringPursuit)
      {
         double ownSpeed       = PLATFORM.Speed();
         double targetSpeed    = targetTrack.Speed();
         double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
         double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
         string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
         int    weaponsActive  = ((WsfRIPRProcessor)PROCESSOR).WeaponsActive(targetTrack);

         double engageRangeMax = 185200.0;   //100 miles
         double engageRangeMin =   1852.0;   //  1 mile

#         // determine the fuel needed to engage
#         double fuelRequired = 0;
#         double bingoQuantity = -1;
#         if (mConsiderFuel)
#         {
#            WsfFuel fuelObj = PLATFORM.Fuel();
#            if (fuelObj)
#            {
#               double maxWeaponRange = GetWeaponRangeMax(PLATFORM, mWeaponArray);
#               double distToWeaponRange = slantRangeTo - maxWeaponRange;
#               double timeToTarget = distToWeaponRange / closingSpeed;
#               double distToTravel = timeToTarget * ownSpeed;
#
#               fuelRequired = fuelObj.QuantityRequired(distToTravel);
#               bingoQuantity = fuelObj.BingoQuantity();
#            }
#         }

         string PursuitMode = "pure";

         if (weaponsActive > 0)
         {
            PursuitMode = "f-pole";
         }
         else if (targetTrack.AirDomain())
         {
            if (slantRangeTo >= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail" &&
                targetSpeed  >= ownSpeed)
            {
               PursuitMode = "lead";
            }
            else if (slantRangeTo <= engageRangeMax &&
                     positioning  != "head-to-head" &&
                     positioning  != "head-to-tail")
            {
               PursuitMode = "lag";
            }
            //else if (slantRangeTo  > engageRangeMax ||
            //        (slantRangeTo <= engageRangeMax &&
            //        (positioning  == "head-to-head" ||
            //         positioning  == "head-to-tail")))
            //{
            //   PursuitMode = "pure";
            //}
         }

         writeln_d("     PursuitMode = ", PursuitMode);
         // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

         // If we got the altitude from the TRACK, match it
         double interceptHeading  = PLATFORM.Heading();
         double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);

         extern double cDEFAULT_ALTITUDE;
         double interceptAltitude = cDEFAULT_ALTITUDE;

         //check for targets altitude, and whether or not we should match it
         if (targetTrack.ElevationValid() ||
             targetTrack.LocationValid())
         {
            if (targetTrack.Altitude() > interceptAltitude)    //always climb up to target
            {
               interceptAltitude = targetTrack.Altitude();
            }
            else if (MatchAltitudeForThreat(targetTrack) == true)
            {
               interceptAltitude = targetTrack.Altitude();
            }
         }

         //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
         if (interceptAltitude < mMinAltitude)
         {
            interceptAltitude = mMinAltitude;
         }
         writeln_d("desired intercept altitude: ", interceptAltitude);

         mTargetSpeed = mInterceptSpeed;
         if (targetTrack.VelocityValid())
         {
            if (targetTrack.AirDomain())
            {
               extern double EffectiveRange(WsfPlatform, WsfTrack);

               double speedOfTarget = targetTrack.Speed();
               double effRange      = EffectiveRange(PLATFORM, targetTrack);
               double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
               double speedWindow   = mInterceptSpeed - speedOfTarget;

               if(effRange < mMatchSpeedDistanceMax &&  effRange > mMatchSpeedDistanceMin)
               {
                  double rangeScale = (effRange - mMatchSpeedDistanceMin) / distanceWindow;
                  mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
                  writeln_d(PLATFORM.Name(), " pursue-target, speed scaled down in matching window!");
               }
               else if (effRange <= mMatchSpeedDistanceMin)
               {
                  mTargetSpeed = speedOfTarget * 0.99;
                  writeln_d(PLATFORM.Name(), " pursue-target, speed set to match target!");
               }

               if (mTargetSpeed < mWaitSpeed)
               {
                  mTargetSpeed = mWaitSpeed;
                  writeln_d(PLATFORM.Name(), " pursue-target, speed was lower than wait speed, adjust!");
               }
            }
            else if (targetTrack.LandDomain())
            {
               writeln_d(PLATFORM.Name(), " pursue-target, target is land domain, adjust speed!");
               double speedOfTarget = targetTrack.Speed();
               double range      = PLATFORM.GroundRangeTo(targetTrack);
               double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
               double speedWindow   = mInterceptSpeed - speedOfTarget;

               if(range < mMatchSpeedDistanceMax &&  range > mMatchSpeedDistanceMin)
               {
                  double rangeScale = (range - mMatchSpeedDistanceMin) / distanceWindow;
                  mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
               }
               else if (range <= mMatchSpeedDistanceMin)
               {
                  mTargetSpeed = speedOfTarget * 0.99;
               }

               if (mTargetSpeed < mWaitSpeed)
               {
                  mTargetSpeed = mWaitSpeed;
               }
            }
         }

         double leadOrLagTime = 15.0;  //seconds
         if (PursuitMode == "lead")
         {
            WsfWaypoint wpt = WsfWaypoint();
            double tti = PLATFORM.InterceptLocation3D(targetTrack, wpt);
            if (tti > 0.0)
            {
               mTargetPoint = wpt.Location();
            }
            else
            {
               mTargetPoint = targetTrack.LocationAtTime(TIME_NOW + leadOrLagTime);
            }
         }
         else if(PursuitMode == "lag")
         {
            double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;

            double maxLagDist = 0.35 * PLATFORM.SlantRangeTo(targetTrack);
            double maxLagTime = maxLagDist / targetTrack.Speed();
            if (usedLagDelay > maxLagTime)
            {
               usedLagDelay = maxLagTime;
            }
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW - usedLagDelay);
         }
         else if (PursuitMode == "f-pole")
         {
            extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
            interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
            mTargetPoint = PLATFORM.Location();
            mTargetPoint.Extrapolate(interceptHeading, DefaultOffsetDistance);
         }
         else
         {
            //PursuitMode == pure
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW);
         }

         if (!mTargetPoint.IsValid())
         {
            mTargetPoint = targetTrack.CurrentLocation();
         }

         mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), interceptAltitude);

         if (mDrawSteering == true)
         {
            mDraw.SetLayer("behavior_pursue_target");
            mDraw.SetDuration(((WsfRIPRProcessor)PROCESSOR).UpdateInterval());
            mDraw.SetColor(1.0, 0.5, 0.0);
            mDraw.SetLineSize(1);
            mDraw.BeginLines();
               mDraw.Vertex(PLATFORM.Location());
               mDraw.Vertex(mTargetPoint);
            mDraw.End();
         }

         string msg = write_str("pursue-target: ", targetTrack.TargetName(), " at speed ", (string)mTargetSpeed);
       //PLATFORM.Comment(msg);
         writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
         extern bool FlyTarget (WsfPlatform, WsfGeoPoint, double);
         FlyTarget( PLATFORM, mTargetPoint, mTargetSpeed);
      }
      else
      {
         //go at default speed; this gets overwritten if route waypoint has defined a speed
         PLATFORM.GoToSpeed(mInterceptSpeed, mDefaultAccel, true);
         //return to route, at the last target route point as re-entry
         extern bool ReEnterRoute(WsfPlatform);
         ReEnterRoute(PLATFORM);

         if (mDrawSteering == true)
         {
            WsfRoute currRoute = PLATFORM.Route();
            if (currRoute.IsValid())
            {
              mDraw.SetLayer("behavior_pursue-target");
              mDraw.Erase(PLATFORM.Name());
              mDraw.SetId(PLATFORM.Name());
              mDraw.SetColor(0,1,1);
              mDraw.SetLineSize(1);
              mDraw.SetLineStyle("dash_dot2");
              mDraw.BeginPolyline();
                  for (int i=0; i<currRoute.Size(); i=i+1)
                    mDraw.Vertex(currRoute.Waypoint(i).Location());
              mDraw.End();
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：string, extern, if, else

### execute（parallel_wait）｜状态执行

- **关键词**：execute, if, tick, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/parallel_wait.txt:20-27`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aiai/parallel_turn_left.txt:20`、`behavior_tree/processors/quantum_agents/aiai/parallel_turn_right.txt:20`）
- **片段**：

```text
   execute
      if (tick >= 20)
      {
         return Success("Done waiting!");
      }
      tick = tick + 1;
      return Running("Waiting");
   end_execute
```

- **演示要点**：演示 execute 的参数：if, tick, return

### execute（scanning_eoir）｜状态执行

- **关键词**：execute, static, double, if, 状态执行
- **出处**：`sensor_demos/scanning_eoir.txt:54-64`
- **片段**：

```text
   execute at_interval_of 1 s
      static int sign = -1;
      double yaw = PLATFORM.Sensor("cam").Yaw();
      writeln(TIME_NOW, " Yaw ", yaw);
      if (!IsBetween(yaw, -90, 90))
      {
         sign = -sign;
         writeln("Sign ", sign);
      }
      PLATFORM.Sensor("cam").SetYaw(yaw + sign * MATH.PI()/32);
   end_execute
```

- **演示要点**：演示 execute 的参数：static, double, if

### execute（behavior_weapon_support）｜状态执行

- **关键词**：execute, extern, if, else, 状态执行
- **出处**：`base_types/processors/timeline_agents/behavior_weapon_support.txt:72-89`
- **片段**：

```text
   execute
      SortLocalTracksByValue(mEngaged, mBearings);
      extern string mSeparateSide;   # "LEFT" or "RIGHT" or other?
      extern double mOffsetAngle;
      extern double mDefaultAltitude;
      extern double mDelaySpeed;
      extern double mGeesToTurnWith;
      if (mSeparateSide == "RIGHT")
      {
         #crank right of left-most engaged target (front of array)
         Offset(PLATFORM, mEngaged.Front().CurrentLocation(), mOffsetAngle, mDefaultAltitude, mDelaySpeed, mGeesToTurnWith);
      }
      else #if (mSeparateSide == "LEFT")
      {
         #crank left of right-most engaged target (back of array)
         Offset(PLATFORM, mEngaged.Back().CurrentLocation(), -mOffsetAngle, mDefaultAltitude, mDelaySpeed, mGeesToTurnWith);
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, if, else

### execute（demo_delta_iv_m）｜状态执行

- **关键词**：execute, int, if, else, 状态执行
- **出处**：`space_operations/demo_delta_iv_m.txt:85-110`　（同签名共 4 处，另见 `base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:258`、`base_types/processors/ripr_agents/aifl/behavior_manage-pincer.txt:262`、`behavior_tree/processors/quantum_agents/aifl/behavior_manage-pincer.txt:258`）
- **片段**：

```text
   execute at_time 1.0 sec absolute
      int case = 1;           # Select the desired case from below
      if (case == 1)
      {
         # This point is right on the point with the 90 degree launch heading and 88.0 degree loft angle.
         AttemptOrbitalLaunch(PLATFORM, "launcher", 396960.0, 28.43);
      }
      else if (case == 2)
      {
         # This point is along one launch heading but between two loft angles.
         # The launch heading will be 80 and the loft angle between 88.0 and 88.2
         AttemptOrbitalLaunch(PLATFORM, "launcher", 410000.0, 28.685);
      }
      else if (case == 3)
      {
         # This point is pretty much mid-way between launch headings and loft angles in the launch computer table.
         # The resulting launch heading should be between 80 and 90 and the loft angle between 88 and 88.2
         # It appears that interpolating across launch headings doesn't work as well.
         AttemptOrbitalLaunch(PLATFORM, "launcher", 402000.0, 29.06);
      }
      else if (case == 4)
      {
         # Higher inclination angle.
         AttemptOrbitalLaunch(PLATFORM, "launcher", 400000.0, 40.0);
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：int, if, else

### execute（behavior_pursue-point_pathing）｜状态执行

- **关键词**：execute, extern, double, if, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-point_pathing.txt:51-78`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_pursue-point.txt:71`、`base_types/processors/ripr_agents/aiai/behavior_pursue-point.txt:71`）
- **片段**：

```text
   execute
      writeln("executing pursue-point_pathing.");
      PROCESSOR.SetUpdateInterval(cSLOW_UPDATE_RATE);
      PLATFORM.GoToSpeed(cINTERCEPT_SPEED);
      extern double cDEFAULT_ALTITUDE;
      PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200);

      double interceptAltitude = mCurrentPointIntercept.Altitude();
      double interceptHeading  = PLATFORM.TrueBearingTo(mCurrentPointIntercept);
      double interceptRange    = PLATFORM.SlantRangeTo(mCurrentPointIntercept);

      writeln_d("    T=", TIME_NOW, ", range: ", interceptRange, " true-bearing: ", interceptHeading);

      WsfGeoPoint startGeoPoint = PLATFORM.Location();

      if (!PLATFORM.FindAndSetPath(startGeoPoint, mCurrentPointIntercept))
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE","CLOSEST_POINT");
      }

     #if ( (interceptAltitude - PLATFORM.Altitude()) > 5)
      if ( (interceptAltitude - PLATFORM.Altitude()) > 10000*MATH.M_PER_FT())
      {
         writeln_d("GoToAltitude: ",interceptAltitude);
         #PLATFORM.GoToAltitude(interceptAltitude);
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：extern, double, if

### execute（behavior_weapon_decision_gun）｜状态执行

- **关键词**：execute, bool, if, else, 状态执行
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:295-326`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_weapon_decision_gun.txt:283`）
- **片段**：

```text
   execute
      // Replicates akshn7.f
      // We don't need to do all the bookeeping that BRAWLER
      // does. Just launch the weapon.
      // TODO Fill in gun fire



      #LBM - temporary
      WsfTrack targetTrack = PLATFORM.MasterTrackList().FindTrack(processor.TasksReceivedOfType("WEAPON").Entry(0).LocalTrackId());
      WsfWeapon weapon = PLATFORM.Weapon("gun");
      bool launched = weapon.FireSalvo(targetTrack, 1); // Always firing one for now
      if (!launched)
      {
         writeln_d("   ", PLATFORM.Name(), " could NOT fire at track: ", targetTrack.TargetName(), " at time: ", TIME_NOW);
      }
      else if (mDrawGuns)
      {
         double delta = ((WsfBrawlerPlatform)PLATFORM).ProjectedTimeDelta();

         mDraw.SetLayer("behavior_weapon_decision_gun");
         mDraw.SetDuration(delta);
         mDraw.SetColor(1.0, 1.0, 1.0);   #white
         mDraw.SetLineSize(2);
         mDraw.SetLineStyle("dotted2");
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(targetTrack.CurrentLocation());
         mDraw.End();
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if, else

### execute（behavior_pursue_altitude）｜状态执行

- **关键词**：execute, string, extern, if, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_altitude.txt:72-103`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_altitude.txt:72`、`base_types/processors/quantum_agents/aiai/behavior_pursue_speed.txt:48`、`base_types/processors/ripr_agents/aiai/behavior_pursue_speed.txt:48`）
- **片段**：

```text
   execute
      string comment = write_str(PLATFORM.Name(), " executing pursue_altitude, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

      extern double mDesiredAltitude;

      // If we got the altitude from the TRACK, match it
      extern double cDEFAULT_ALTITUDE;
      mDesiredAltitude = cDEFAULT_ALTITUDE;

      //check for targets altitude, and whether or not we should match it
      if (mTargetTrack.ElevationValid() ||
          mTargetTrack.LocationValid())
      {
         if (mTargetTrack.Altitude() > mDesiredAltitude)         //always climb up to target
         {
            mDesiredAltitude = mTargetTrack.Altitude();
         }
         else if (MatchAltitudeForThreat(mTargetTrack) == true)   //just useful for diving down to threat lower level
         {
            mDesiredAltitude = mTargetTrack.Altitude();
         }
      }
      //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
      if (mDesiredAltitude < mMinAltitude)
      {
         mDesiredAltitude = mMinAltitude;
      }
      writeln_d("desired intercept altitude: ", mDesiredAltitude);

   end_execute
```

- **演示要点**：演示 execute 的参数：string, extern, if

### execute（behavior_disengage）｜状态执行

- **关键词**：execute, double, foreach, if, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_disengage.txt:133-174`　（同签名共 4 处，另见 `base_types/processors/quantum_agents/aiai/behavior_unload.txt:78`、`base_types/processors/ripr_agents/aiai/behavior_disengage.txt:133`、`base_types/processors/ripr_agents/aiai/behavior_unload.txt:78`）
- **片段**：

```text
   execute
      writeln("executing disengage.");
      PLATFORM.Comment("disengage");

      #double bestheading = 0.0;  //compute this as away from all threats
      #PLATFORM.TurnToHeading(bestheading);

      //calculate an average heading to incoming platforms weighted by distance
      double y = 0;
      double x = 0;
      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         if (t.IsValid() && (!t.SideValid() || t.Side() != PLATFORM.Side()))
         {
            double distMod = 1 / PLATFORM.SlantRangeTo(t);
            double bearingMod = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(t));
            x = x + MATH.Sin(bearingMod) * distMod;
            y = y + MATH.Cos(bearingMod) * distMod;
            writeln_d("    Incoming ", t.TargetName(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod);
         }
      }

      if (x!=0 || y!=0) //if there is something to run from
      {
         double evadeHeading = MATH.NormalizeAngle0_360(MATH.ATan2(x, y) - 180);
         writeln_d("    x: ", x, ", y: ", y, ", evade at: ", evadeHeading);

         extern bool FlyHold   (WsfPlatform, double, double, double);
         FlyHold( PLATFORM, evadeHeading, cDIVE_ALTITUDE, cMAX_SPEED);

         if (drawEscape == true)
         {
            WsfGeoPoint pt = PLATFORM.Location();
            pt.Extrapolate(evadeHeading, 1852 * 10);  //draw line in direction of egress, for 10 nautical miles
            draw.BeginLines();
               draw.Vertex(PLATFORM.Location());
               draw.Vertex(pt);
            draw.End();
         }
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：double, foreach, if

### execute（behavior_search_pursuit）｜状态执行

- **关键词**：execute, if, double, string, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_search_pursuit.txt:69-111`　（同签名共 3 处，另见 `heatmap/processors/quantum_agents/aiai/behavior_search_pursuit.txt:69`、`base_types/processors/ripr_agents/aiai/behavior_pursue_heading_smooth.txt:38`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing search_pursuit, T=", TIME_NOW);

      if (!mPursuitLocation.IsValid())
      {
         writeln_d(PLATFORM.Name(), " has invalid HeatPoint, T=", TIME_NOW);
         return;
      }

      //make sure radar is on
      WsfSensor searchRadar = PLATFORM.Sensor(mSearchRadarName);
      if (searchRadar.IsValid())
      {
         if (!searchRadar.IsTurnedOn())
         {
            searchRadar.TurnOn();
            writeln_d(PLATFORM.Name(), " turned on active radar ", searchRadar);
         }
         else
         {
            writeln_d("  radar already turned on");
         }
      }


      if (mDrawSteering == true)
      {
         mDraw.SetLayer("behavior_search_pursuit");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetColor(1.0, 0.5, 0.0);
         mDraw.SetLineSize(1);
         mDraw.BeginLines();
            mDraw.Vertex(PLATFORM.Location());
            mDraw.Vertex(mPursuitLocation);
         mDraw.End();
      }

      double ownSpeed = PLATFORM.Speed();
      string msg = write_str("pursuing target: ", mPursuitLocation, " at speed ", (string)ownSpeed);
      writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);

      FlyTarget(PLATFORM, mPursuitLocation, ownSpeed);
   end_execute
```

- **演示要点**：演示 execute 的参数：if, double, string

### execute（behavior_bid_on_jobs）｜状态执行

- **关键词**：execute, if, else, foreach, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_bid_on_jobs.txt:66-119`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_bid_on_jobs.txt:66`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing bid_on_jobs, T=", TIME_NOW);
      Array<WsfRIPRJob> jobs;
      WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();

      if (mBidOnOwnJobs == false)
      {
         if (commander.IsBidWindowOpen())
         {
            jobs = commander.GetJobs();
         }
         else
         {
            writeln_d("commanders bidding window not open");
            return;
         }
      }
      else
      {
         if (((WsfRIPRProcessor)PROCESSOR).IsBidWindowOpen())
         {
            jobs = ((WsfRIPRProcessor)PROCESSOR).GetJobs();
         }
         else
         {
            writeln_d("my bidding window not open");
            return;
         }
      }

      foreach (WsfRIPRJob job in jobs)
      {
         double bid = ((WsfRIPRProcessor)PROCESSOR).QueryBid(job);
         if ((bid < 0) && (job.GetProgress(((WsfRIPRProcessor)PROCESSOR)) < 1))
         {
            writeln_d("bid_on_jobs: job.UnbidJob() for job: ", job.GetDescription());
            job.UnbidJob( ((WsfRIPRProcessor)PROCESSOR) );
         }
         else
         {
            job.BidJob(((WsfRIPRProcessor)PROCESSOR), bid);
            writeln_d(PLATFORM.Name(), " bid for ", job.GetDescription(), " = ", bid, ", priority = ", job.GetPriority());
            for (int channel = 1; channel < ((WsfRIPRProcessor)PROCESSOR).GetNumJobChannels(); channel = channel + 1)
            {
              double scaledBid = bid * 0.25;
              if (bid < 0.0)
              {
                  scaledBid = bid * 2.5;
              }
              job.BidJob( ((WsfRIPRProcessor)PROCESSOR), channel, scaledBid, 0.0 );
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：if, else, foreach

### execute（iridium_satellite）｜状态执行

- **关键词**：execute, string, bool, if, 状态执行
- **出处**：`space_operations/platforms/iridium_satellite.txt:145-217`　（同签名共 8 处，另见 `base_types/processors/ripr_agents/aiai/behavior_go_home.txt:189`、`base_types/processors/timeline_agents/behavior_go_home.txt:193`、`brawler/processors/quantum_agents/behavior_go_home.txt:190`）
- **片段**：

```text
      execute at_time 0.00001 s absolute
         // set up the links that don't change (links with adjacent satellites in same plane).
         WsfComm comm = PLATFORM.Comm("iridium_comm");
         string netName = comm.NetworkName();
         mSatelliteNumber = SatelliteNumber(netName);
         mOrbitNumber = OrbitNumber(netName);
         bool isEvenOrbit = (Math.Mod(mOrbitNumber, 2) == 0);

         if (mOrbitNumber != sFIRST_ORBIT)
         {
            if (isEvenOrbit)
            {
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sFIRST_SATELLITE);
               }
               mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
            }
            else // odd orbit
            {
               mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sLAST_SATELLITE);
               }
            }
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            if (isEvenOrbit)
            {
               mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sFIRST_SATELLITE);
               }
            }
            else // odd orbit
            {
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sLAST_SATELLITE);
               }
               mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
            }
         }

#         writeln(PLATFORM.Name(), " Connections:");
#         writeln("   orbit, satellite: ", mOrbitNumber, ", ", mSatelliteNumber);
#         writeln("   nul ", mNorthwardUpperLeftLink);
#         writeln("   nlr ", mNorthwardLowerRightLink);
#         writeln("   sul ", mSouthwardUpperLeftLink);
#         writeln("   slr ", mSouthwardLowerRightLink);
         Vec3 velWCS = PLATFORM.VelocityWCS();
         mIsTravelingNorth = (velWCS.Z() > 0.0);
         mWasTravelingNorth = mIsTravelingNorth;
      end_execute
```

- **演示要点**：演示 execute 的参数：string, bool, if

### execute（behavior_formation）｜状态执行

- **关键词**：execute, if, else, double, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiww/behavior_formation.txt:91-170`　（同签名共 7 处，另见 `base_types/processors/ripr_agents/aiai/behavior_escort.txt:231`、`brawler/processors/quantum_agents/behavior_escort.txt:221`、`heatmap/processors/quantum_agents/aiai/behavior_escort.txt:222`）
- **片段**：

```text
   execute
      writeln_d("executing formation.");

      //make sure escorted platform exists, find it, save it
      WsfPlatform leadPlatform = GetFormationLead();
      if (!leadPlatform.IsValid() )
      {
         writeln_d("--- fighter ", PLATFORM.Name(), " no valid platform to escort!");
         return;
      }

      //check if I am approximately in my formation position
      WsfGeoPoint formationPoint = leadPlatform.Location();

      if (mFormationAltitude > 0)
      {
        formationPoint.Set(formationPoint.Latitude(), formationPoint.Longitude(), mFormationAltitude);
      }

      if (mFormationPositionX > 0)
      {
         formationPoint.Extrapolate(leadPlatform.Heading(), mFormationPositionX);
      }
      else
      {
         formationPoint.Extrapolate(leadPlatform.Heading()+180, -mFormationPositionX);
      }

      if (mFormationPositionY > 0)
      {
         formationPoint.Extrapolate(leadPlatform.Heading()+90.0, mFormationPositionY);
      }
      else
      {
         formationPoint.Extrapolate(leadPlatform.Heading()-90.0, -mFormationPositionY);
      }

      if (!formationPoint.IsValid())
      {
         writeln_d("--- fighter ", PLATFORM.Name(), " invalid formation point from ", leadPlatform.Name());
         return;
      }

      if (mDrawFormationData == true)
      {
         mDraw.SetLayer("behavior_formation");
         mDraw.SetDuration(PROCESSOR.UpdateInterval());

         // draw line to desired formation position
         mDraw.SetColor(0, 1, 0);   //green
         mDraw.SetLineSize(4);
         mDraw.BeginLines();
            mDraw.Vertex(leadPlatform.Location());
            mDraw.Vertex(formationPoint);
         mDraw.End();
      }

      double radius = mGoodFormationRatio * leadPlatform.SlantRangeTo(formationPoint);

      double formAlt   = leadPlatform.Altitude();
      double formSpeed = leadPlatform.Speed();
      double formYaw   = leadPlatform.Heading();
      if (formAlt < PLATFORM.Altitude())
      {
         formAlt = PLATFORM.Altitude();
      }
      WsfGeoPoint tgt = WsfGeoPoint.Construct(formationPoint.Latitude(), formationPoint.Longitude(), formAlt);
      double lookAheadDistance  = mFormationLookAhead * leadPlatform.Speed();
      tgt.Extrapolate(formYaw, lookAheadDistance);

      if (! AmInFormationPosition(formationPoint, radius))
      {
         //fly towards formation position, extrapolated ahead X seconds, in order to catch up to the point in X seconds
         formSpeed = PLATFORM.GroundRangeTo(tgt) / mFormationLookAhead;
      }

     #extern bool FlyTarget (WsfPlatform, WsfGeoPoint,    double);
      FlyTarget (PLATFORM, tgt, formSpeed);

   end_execute
```

- **演示要点**：演示 execute 的参数：if, else, double

### execute（behavior_debug_job_board）｜状态执行

- **关键词**：execute, string, foreach, while, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:44-158`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_debug_job_board.txt:44`）
- **片段**：

```text
   execute
      writeln_d("executing debug_job_board");

      writeln("Job Board for ", PLATFORM.Name(), " at Time = ", TIME_NOW);
      #write top row (bidder names)
      string topRow = "                        job name,        priority, ";
      foreach (WsfRIPRProcessor sub in mSubs)
      {
         string subName = sub.Platform().Name();
         while (subName.Length() < 16)
         {
            subName = " " + subName;
         }
         if (subName.Length() > 16)
         {
            subName = subName.Substring(-16);
         }
         topRow = topRow + subName + ", "; #each column is 18 spaces wide
      }
      ###topRow = topRow.Substring(0,-2);   #clip off the last comma & space
      topRow = topRow + "          winner";

      string lines = "-";
      while (lines.Length() < topRow.Length())
      {
         lines = lines + "-";
      }
      writeln(lines);
      writeln(topRow);

      foreach (WsfRIPRJob job in mJobs)
      {
         string jobDesc = job.GetDescription();
         while (jobDesc.Length() < 32)
         {
            jobDesc = " " + jobDesc;
         }
         if (jobDesc.Length() > 32)
         {
            jobDesc = jobDesc.Substring(-32);
         }
         string row = jobDesc + " ";   #this should be 33 spaces, at this point


         string pString = (string)job.Priority();
         while( pString.Contains(".") && pString.Substring(-1)=="0")   #take off all trailing zeros
         {
            pString = pString.Substring(0,-1);
         }
         if (pString.Length() > 16)
         {
            pString = pString.Substring(0,15);
         }
         pString = pString + ", ";
         while (pString.Length() < 18)
         {
            pString = " " + pString;
         }
         row = row + pString;

         foreach (WsfRIPRProcessor sub in mSubs)
         {
            double bidValue = job.GetBid(sub);
            string bidValStr = (string)bidValue;
            if (mHideMinBids == true && bidValue <= mMinBid)
            {
               bidValStr = "-";
            }

            while( bidValStr.Contains(".") && bidValStr.Substring(-1)=="0")   #take off all trailing zeros
            {
               bidValStr = bidValStr.Substring(0,-1);
            }
            if (bidValStr.Length() > 16)
            {
               bidValStr = bidValStr.Substring(0,15);
            }
            bidValStr = bidValStr + ", ";
            while (bidValStr.Length() < 18)
            {
               bidValStr = " " + bidValStr;
            }
            row = row + bidValStr;
         }

         ###row = row.Substring(0,-2);   #clip off the last comma & space

         Array<WsfPlatform> winners = job.Winners();
         string winner;
         if (winners.Empty())
         {
            winner = "-";
         }
         else if (winners.Size() > 1)
         {
            winner = (string)winners.Size() + " winners";
         }
         else
         {
            winner = winners[0].Name();
         }
         while (winner.Length() < 16)
         {
            winner = " " + winner;
         }
         if (winner.Length() > 16)
         {
            winner = winner.Substring(-16);
         }
         row = row + winner;
         writeln(row);
      }
      writeln(lines);
      writeln("");
   end_execute
```

- **演示要点**：演示 execute 的参数：string, foreach, while

### execute（sam_shoot_it）｜状态执行

- **关键词**：execute, int, return, if, 状态执行
- **出处**：`air_to_air/rules/sam_shoot_it.txt:95-224`
- **片段**：

```text
   execute
#   WsfPlatform iacid = PLATFORM;
   extern WsfPlatform iacid;
   Array<int> bng_msl = iacid->WINCHESTER;
   int agm_left = iacid.Weapon("agm").QuantityRemaining();

      int agm_index;
   #   int prfire; // 1 = shoot, 2 = don't shoot
#   FileIO iout = FileIO();
#   if (iout_print) {iout.Open(iout_path, "append");}
   mapPICKLE.Clear();
   pitch_up = false; // initialize this to false
   if (agm_left == 0){return Failure("No AGMs left");}
   if (iacid->react && iacid->first_pass)
   {
      if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT - REASON: HOLD SHOT FOR REACTION","\n"));}
      return Running("hold shot for reaction");
   }
   // don't shoot in certain phases
   if(iacid->faz == "pump" || iacid->faz == "pump_in" || iacid->faz == "egress" || iacid->faz == "reaction")
   {
      if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT PHASE= ",iacid->faz,"\n"));}
      return Failure("Don't shoot...phase == pump,pump_in,reaction or egress");
   }    

   if(iout_print) {iout.Write(write_str(" SAM_SHOOT_IT:  BEANS  NUM_IN_AIR  NUM_I_SHOT  TGTD_IHOST","\n"));}
   if(iout_print) {iout.Write(write_str("  MAX ALLOWED   ",Format.General(iacid->I_SUPPORT,2).Pad(3),Format.General(iacid->I_LAUNCHED,2).Pad(9),
    Format.General(iacid->I_LNCHATTGT,2).Pad(12),Format.General(iacid->I_MXTGTD,2).Pad(12),"\n"));}
   foreach (WsfSA_EntityPerception saent in shoot_list)
   {

      //If track is of an aircraft, skip and let shoot_it determine mapPICKLE
      if(saent.Track().IsValid() && saent.Track().AirDomain()){continue;}

      // initialize to true
      mapPICKLE[saent] = true;

      Array<int> shot_count = count_shot(iacid,saent,saPROC.PerceivedBandits());
      WsfWeapon msl = iacid.Weapon(mapPRMISL_AC[saent]);

      // set agm_index so we have an integer that points to the agm missile index
      if (msl.Name() == "agm") {agm_index = 3;}

      // WQT
      if ( msl.AuxDataExists("use_wqt") && msl.AuxDataBool("use_wqt") )
      {
         if (!saent.Track().RangeValid() || saent.Track().RangeErrorSigma() > msl.AuxDataDouble("wqt_rng"))
         {
            mapPICKLE[saent] = false; 
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad range ",saent.Track().RangeErrorSigma(),"\n"));}
            continue;
         }
         else if (!saent.Track().BearingValid() || saent.Track().BearingErrorSigma() > msl.AuxDataDouble("wqt_az"))
         {
            mapPICKLE[saent] = false; 
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad azimuth","\n"));}
            continue;
         }
         else if (!saent.Track().ElevationValid() || saent.Track().ElevationErrorSigma() > msl.AuxDataDouble("wqt_el"))
         {
            mapPICKLE[saent] = false; 
            if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: NO WQT, bad elevation","\n"));}
            continue;
         }
      }

      // stiff arm logic
      if (iacid->stiff_arm_all || mapSTIFF_ARM[saent])
      {
         mapPICKLE[saent] = false;
         if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: STIFF ARM LOGIC","\n"));}
         continue;
      }      
      
/*
      // greedy logic
         // count_shot
            [0] number of missiles launched at specified threat by anyone (tgtd_ihost)
            [1] number of missiles I have launched at specified threat (num_i_shot)
            [2] total number of missiles I have in the air right now (num_in_air)
*/
      #GCA leaving these checks in for now...if SAM specific values are need will need to make new variables
      if(iout_print) {iout.Write(write_str("  ",saent.Track().TargetName().Pad(-14),Format.General(iacid->beans,2).Pad(3),Format.General(shot_count[2],2).Pad(9),
       Format.General(shot_count[1],2).Pad(12),Format.General(shot_count[2],0).Pad(12),"\n"));}
      if ( (iacid->beans >= iacid->I_SUPPORT) || (shot_count[0] >= mapMXTGTD[saent] || 
            shot_count[0] >= iacid->I_MXTGTD) || (shot_count[1] >= mapMXTGT_AC[saent] || 
            shot_count[1] >= iacid->I_LNCHATTGT) || shot_count[2] >= iacid->I_LAUNCHED)
      {
         mapPICKLE[saent] = false;
         if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: GREEDY","\n"));}
         continue;
      }
      
      // mxshot_rng from PRDATA
      if (iacid->SEAD_SHT_RNG > 0 && iacid.SlantRangeTo(saent.Track()) > iacid->SEAD_SHT_RNG)  
      {
         mapPICKLE[saent] = false;
         if(iout_print) {iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: OUTSIDE SEAD SHOT RANGE","\n"));}
         continue;
      } 

      // track is outside of RPEAK
      if(iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0] > RPEAK_LOC[agm_index])
      {
         mapPICKLE[saent] = false;
         if(iout_print) 
         {
            iout.Write(write_str(" DON'T SHOOT_IT AT ",saent.Track().TargetName()," REASON: TARGET OUTSIDE OF RPEAK ",
            iacid.SlantRangeTo(saent.Track())/msl.LaunchComputer().LookupResult(saent.Track())[0]," ",RPEAK_LOC[agm_index],"\n"));
         }
         continue;
      } 

   }

   //  loop through everyone on my pickle list and shoot them starting with ppmjid
   foreach (WsfSA_EntityPerception ent : bool prfire in mapPICKLE)
   {   
      if (prfire && ent.Track().LandDomain() && iacid.WeaponsPendingFor(ent.Track().TrackId()) == 0) 
      {
         iacid.Weapon(mapPRMISL_AC[ent]).Fire(ent.Track());
         t_last_pickle = TIME_NOW;
         if(iout_print) {iout.Write(write_str("SAM_SHOOT_IT... ",iacid.Name()," FIRE ",mapPRMISL_AC[ent]," AT ",ent.Track().TargetName()," AT TIME: ",TIME_NOW,"\n"));}
#         if(iout_print) {iout.Write(write_str(trk.VelocityValid()));}
         return Success("".Join({"FIRING ",mapPRMISL_AC[ent]," AT ",ent.Track().TargetName()," INDEX ",(string)ent.Track().Target().Index()}));
      }
   }
   return Success();
#   if(iout_print) {iout.Close();}
   end_execute
```

- **演示要点**：演示 execute 的参数：int, return, if

### execute（behavior_debug_quantum_tasker）｜状态执行

- **关键词**：execute, string, while, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/behavior_debug_quantum_tasker.txt:48-205`
- **片段**：

```text
   execute
      writeln(PLATFORM.Name(), ", T=", TIME_NOW, ", executing debug_quantum_tasker");
      
      Array<WsfQuantumTask> tasks = ((WsfQuantumTaskerProcessor)PROCESSOR).TasksConsidered();
      Array<WsfAssetPerception> assets = ((WsfQuantumTaskerProcessor)PROCESSOR).AssetsConsidered();
      Array<Array<double>> values = ((WsfQuantumTaskerProcessor)PROCESSOR).ValuesConsidered();
      
      #write top row (asset names) and 2nd row (asset system)
      string topRow    = "                        job name,        priority, ";
      string secondRow = "                                                   ";
      foreach(WsfAssetPerception a in assets)
      {
         string assetName = a.Name();
         while (assetName.Length() < 16)
         {
            assetName = " " + assetName;
         }
         if (assetName.Length() > 16)
         {
            assetName = assetName.Substring(-16);
         }
         topRow = topRow + assetName + ", "; #each column is 18 spaces wide
         
         string assetSystem;
         if(a.SystemCount() == 1)
         {
            assetSystem = a.SystemName(0);
         }
         else
         {
            assetSystem = write_str("#_sys=", a.SystemCount());
         }
         while (assetSystem.Length() < 16)
         {
            assetSystem = " " + assetSystem;
         }
         if (assetSystem.Length() > 16)
         {
            assetSystem = assetSystem.Substring(-16);
         }
         secondRow = secondRow + assetSystem + ", "; #each column is 18 spaces wide
      }      
      topRow = topRow + "          winner";
      string lines = "-";
      while (lines.Length() < topRow.Length())
      {
         lines = lines + "-";
      }
      writeln(lines);
      writeln(topRow);
      writeln(secondRow);
      

      #write all columns of each row now
      for(int i=0; i<tasks.Size(); i+=1)
      {
         WsfQuantumTask t = tasks.Get(i);
         string taskDesc;
         WsfTrack temp = PLATFORM.MasterTrackList().Find(t.TrackId());
         if (temp.IsValid())
         {
            taskDesc = write_str(t.TaskType(), ":", temp.TargetName());
         }
         else
         {
            taskDesc = write_str(t.TaskType(), ":", t.TrackId().ToString());
         }
         while (taskDesc.Length() < 32)
         {
            taskDesc = " " + taskDesc;
         }
         if (taskDesc.Length() > 32)
         {
            taskDesc = taskDesc.Substring(-32);
         }
         string row = taskDesc + " ";   #this should be 33 spaces, at this point
         
         ##TODO - get task priority from WsfTask
         string pString = (string)t.Priority();
         while( pString.Contains(".") && pString.Substring(-1)=="0")   #take off all trailing zeros
         {
            pString = pString.Substring(0,-1);
         }
         if (pString.Length() > 16)
         {
            pString = pString.Substring(0,15);
         }
         pString = pString + ", ";
         while (pString.Length() < 18)
         {
            pString = " " + pString;
         }
         row = row + pString;
         
         for(int j=0; j<assets.Size(); j+=1)
         {
            WsfAssetPerception p = assets.Get(j);
            double value = values.Get(i).Get(j);
            
            string valStr = (string)value;

            while( valStr.Contains(".") && valStr.Substring(-1)=="0")   #take off all trailing zeros
            {
               valStr = valStr.Substring(0,-1);
            }
            if (valStr.Length() > 16)
            {
               valStr = valStr.Substring(0,15);
            }
            valStr = valStr + ", ";
            while (valStr.Length() < 18)
            {
               valStr = " " + valStr;
            }
            row = row + valStr;
         }


        
        ###TODO get task "winners"
         //Array<WsfPlatform> winners = job.Winners();
         Array<WsfAssetPerception> assignees = ((WsfQuantumTaskerProcessor)PROCESSOR).AssetAssigneesFor(t);
         string winner;
         if (assignees.Empty())
         {
            winner = "-";
         }
         else if (assignees.Size() > 1)
         {
            winner = (string)assignees.Size() + " winners";
         }
         else
         {
            WsfAssetPerception asset = assignees[0];
            if(asset.SystemCount() == 1)
            {
               winner = write_str(asset.Name(),":", asset.SystemName(0));
            }
            else
            {
               winner = write_str(asset.Name(),":#_sys=", asset.SystemCount());
            }
         }
         while (winner.Length() < 16)
         {
            winner = " " + winner;
         }
#         if (winner.Length() > 16)
#         {
#            winner = winner.Substring(-16);
#         }
         row = row + winner;
         writeln(row);
      }
      writeln(lines);
      writeln("");
      return Success();
   end_execute
```

- **演示要点**：演示 execute 的参数：string, while, return

### execute（behavior_pursue-target）｜状态执行

- **关键词**：execute, string, if, else, 状态执行
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pursue-target.txt:192-447`
- **片段**：

```text
   execute
      string comment = write_str(PLATFORM.Name(), " executing pursue-target, T=", TIME_NOW);
      writeln_d(comment);
      #PLATFORM.Comment(comment);

     #extern string   CalculatePositioning  (WsfPlatform, WsfTrack, double);
     #extern double   GetWeaponRangeMax(WsfPlatform aPlatform, Array<Map<string, Object>> aWeaponArray);
     #extern Array<Map<string, Object>> mWeaponArray;

      //get target from ripr processor, to be sure
      WsfTrack targetTrack = ((WsfRIPRProcessor)PROCESSOR).GetTarget();

      if (targetTrack.IsNull() ||
          !targetTrack.IsValid())
      {
         writeln_d("    UpdateInterceptLocation, targetTrack is null or not valid");
         return;
      }

      if (mUseMoverDuringPursuit)
      {
         double ownSpeed       = PLATFORM.Speed();
         double targetSpeed    = targetTrack.Speed();
         double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
         double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
         string positioning    = CalculatePositioning(PLATFORM, targetTrack, 10.0);
         int    weaponsActive  = ((WsfRIPRProcessor)PROCESSOR).WeaponsActive(targetTrack);

         double engageRangeMax = 185200.0;   //100 miles
         double engageRangeMin =   1852.0;   //  1 mile

#         // determine the fuel needed to engage
#         double fuelRequired = 0;
#         double bingoQuantity = -1;
#         if (mConsiderFuel)
#         {
#            WsfFuel fuelObj = PLATFORM.Fuel();
#            if (fuelObj)
#            {
#               double maxWeaponRange = GetWeaponRangeMax(PLATFORM, mWeaponArray);
#               double distToWeaponRange = slantRangeTo - maxWeaponRange;
#               double timeToTarget = distToWeaponRange / closingSpeed;
#               double distToTravel = timeToTarget * ownSpeed;
#
#               fuelRequired = fuelObj.QuantityRequired(distToTravel);
#               bingoQuantity = fuelObj.BingoQuantity();
#            }
#         }

         string PursuitMode = "pure";

         if (weaponsActive > 0)
         {
            PursuitMode = "f-pole";
         }
         else if (targetTrack.AirDomain())
         {
            if (slantRangeTo >= engageRangeMax &&
                positioning  != "head-to-head" &&
                positioning  != "head-to-tail" &&
                targetSpeed  >= ownSpeed)
            {
               PursuitMode = "lead";
            }
            else if (slantRangeTo <= engageRangeMax &&
                     positioning  != "head-to-head" &&
                     positioning  != "head-to-tail")
            {
               PursuitMode = "lag";
            }
            //else if (slantRangeTo  > engageRangeMax ||
            //        (slantRangeTo <= engageRangeMax &&
            //        (positioning  == "head-to-head" ||
            //         positioning  == "head-to-tail")))
            //{
            //   PursuitMode = "pure";
            //}
         }

         writeln_d("     PursuitMode = ", PursuitMode);
         // Our track quality (or target range) may not be good enough yet, so keep moving towards the target.

         // If we got the altitude from the TRACK, match it
         double interceptHeading  = PLATFORM.Heading();
         double distanceToTarget  = PLATFORM.SlantRangeTo(targetTrack);

         extern double cDEFAULT_ALTITUDE;
         double interceptAltitude = cDEFAULT_ALTITUDE;

         //check for targets altitude, and whether or not we should match it
         if (targetTrack.ElevationValid() ||
             targetTrack.LocationValid())
         {
            if (targetTrack.Altitude() > interceptAltitude)    //always climb up to target
            {
               interceptAltitude = targetTrack.Altitude();
            }
            else if (MatchAltitudeForThreat(targetTrack) == true)
            {
               interceptAltitude = targetTrack.Altitude();
            }
         }

         //always bound the altitude by the min & max restrictions (in case mover is not setup to do it)
         if (interceptAltitude < mMinAltitude)
         {
            interceptAltitude = mMinAltitude;
         }
         writeln_d("desired intercept altitude: ", interceptAltitude);

         mTargetSpeed = mInterceptSpeed;
         if (targetTrack.VelocityValid())
         {
            if (targetTrack.AirDomain())
            {
              #extern double EffectiveRange(WsfPlatform, WsfTrack);

               double speedOfTarget = targetTrack.Speed();
               double effRange      = EffectiveRange(PLATFORM, targetTrack);
               double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
               double speedWindow   = mInterceptSpeed - speedOfTarget;

               if(effRange < mMatchSpeedDistanceMax &&  effRange > mMatchSpeedDistanceMin)
               {
                  double rangeScale = (effRange - mMatchSpeedDistanceMin) / distanceWindow;
                  mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
                  writeln_d(PLATFORM.Name(), " pursue-target, speed scaled down in matching window!");
               }
               else if (effRange <= mMatchSpeedDistanceMin)
               {
                  mTargetSpeed = speedOfTarget * 0.99;
                  writeln_d(PLATFORM.Name(), " pursue-target, speed set to match target!");
               }

               if (mTargetSpeed < mWaitSpeed)
               {
                  mTargetSpeed = mWaitSpeed;
                  writeln_d(PLATFORM.Name(), " pursue-target, speed was lower than wait speed, adjust!");
               }
            }
            else if (targetTrack.LandDomain())
            {
               writeln_d(PLATFORM.Name(), " pursue-target, target is land domain, adjust speed!");
               double speedOfTarget = targetTrack.Speed();
               double range      = PLATFORM.GroundRangeTo(targetTrack);
               double distanceWindow = mMatchSpeedDistanceMax - mMatchSpeedDistanceMin;
               double speedWindow   = mInterceptSpeed - speedOfTarget;

               if(range < mMatchSpeedDistanceMax &&  range > mMatchSpeedDistanceMin)
               {
                  double rangeScale = (range - mMatchSpeedDistanceMin) / distanceWindow;
                  mTargetSpeed = speedOfTarget + (speedWindow * rangeScale);
               }
               else if (range <= mMatchSpeedDistanceMin)
               {
                  mTargetSpeed = speedOfTarget * 0.99;
               }

               if (mTargetSpeed < mWaitSpeed)
               {
                  mTargetSpeed = mWaitSpeed;
               }
            }
         }

         double leadOrLagTime = 15.0;  //seconds
         if (PursuitMode == "lead")
         {
            WsfWaypoint wpt = WsfWaypoint();
            double tti = PLATFORM.InterceptLocation3D(targetTrack, wpt);
            if (tti > 0.0)
            {
               mTargetPoint = wpt.Location();
            }
            else
            {
               mTargetPoint = targetTrack.LocationAtTime(TIME_NOW + leadOrLagTime);
            }
         }
         else if(PursuitMode == "lag")
         {
            double usedLagDelay = (slantRangeTo/engageRangeMax) * leadOrLagTime;

            double maxLagDist = 0.35 * PLATFORM.SlantRangeTo(targetTrack);
            double maxLagTime = maxLagDist / targetTrack.Speed();
            if (usedLagDelay > maxLagTime)
            {
               usedLagDelay = maxLagTime;
            }
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW - usedLagDelay);
         }
         else if (PursuitMode == "f-pole")
         {
           #extern double MaximizeFPole(WsfPlatform, WsfTrack, double);
            interceptHeading = MaximizeFPole(PLATFORM, targetTrack, GetOffsetAngleOnThreat(targetTrack));
            mTargetPoint = PLATFORM.Location();
            mTargetPoint.Extrapolate(interceptHeading, DefaultOffsetDistance);
         }
         else
         {
            //PursuitMode == pure
            mTargetPoint = targetTrack.LocationAtTime(TIME_NOW);
         }

         if (!mTargetPoint.IsValid())
         {
            mTargetPoint = targetTrack.CurrentLocation();
         }

         mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), interceptAltitude);

         if (mDrawSteering == true)
         {
            mDraw.SetLayer("behavior_pursue_target");
            mDraw.SetDuration(((WsfRIPRProcessor)PROCESSOR).UpdateInterval());
            mDraw.SetColor(1.0, 0.5, 0.0);
            mDraw.SetLineSize(1);
            mDraw.BeginLines();
               mDraw.Vertex(PLATFORM.Location());
               mDraw.Vertex(mTargetPoint);
            mDraw.End();
         }

         string msg = write_str("pursue-target: ", targetTrack.TargetName(), " at speed ", (string)mTargetSpeed);
       //PLATFORM.Comment(msg);
         writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
        #extern bool FlyTarget (WsfPlatform, WsfGeoPoint, double);
         FlyTarget( PLATFORM, mTargetPoint, mTargetSpeed);
      }
      else
      {
         //go at default speed; this gets overwritten if route waypoint has defined a speed
         PLATFORM.GoToSpeed(mInterceptSpeed, mDefaultAccel, true);
         //return to route, at the last target route point as re-entry
        #extern bool ReEnterRoute(WsfPlatform);
         ReEnterRoute(PLATFORM);

         if (mDrawSteering == true)
         {
            WsfRoute currRoute = PLATFORM.Route();
            if (currRoute.IsValid())
            {
              mDraw.SetLayer("behavior_pursue-target");
              mDraw.Erase(PLATFORM.Name());
              mDraw.SetId(PLATFORM.Name());
              mDraw.SetColor(0,1,1);
              mDraw.SetLineSize(1);
              mDraw.SetLineStyle("dash_dot2");
              mDraw.BeginPolyline();
                  for (int i=0; i<currRoute.Size(); i=i+1)
                    mDraw.Vertex(currRoute.Waypoint(i).Location());
              mDraw.End();
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：string, if, else

### execute（behavior_alt1514_point）｜状态执行

- **关键词**：execute, extern, kturn, 状态执行
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt1514_point.txt:18-21`　（同签名共 6 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt1517_bvr_end_run_right.txt:17`、`brawler/platforms/alternatives/behavior_alt1514_point.txt:17`、`brawler/platforms/alternatives/behavior_alt1517_bvr_end_run_right.txt:16`）
- **片段**：

```text
   execute
      extern int kturn;
      kturn = 0;   //go straight at target
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, kturn

### execute（blackboard_checkpoint_1_task）｜状态执行

- **关键词**：execute, weight, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_1_task.txt:26-30`　（同签名共 4 处，另见 `behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_2_task.txt:26`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_3_task.txt:26`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_4_task.txt:26`）
- **片段**：

```text
   execute
      SetSharedBlackboardVar("checkpoint_tasks", "checkpoint_1", true);
      weight = 0.0;
      return Success("checkpoint_1 task posted to blackboard");
   end_execute
```

- **演示要点**：演示 execute 的参数：weight, return

### execute（aam_launch_test）｜状态执行

- **关键词**：execute, double, string, 状态执行
- **出处**：`p6dof/aam_launch_test.txt:197-204`　（同签名共 2 处，另见 `six_dof/six_dof_aam_launch_test.txt:177`）
- **片段**：

```text
execute at_time .01 sec absolute
   WsfPlatform platform1 = WsfSimulation.CreatePlatform("AAM_TEST_PLATFORM");
   double launchSpeed_fps = LAUNCH_SPEED_MPS * MATH.FT_PER_M();
   double launchAltitude_ft = LAUNCH_ALTITUDE_M * MATH.FT_PER_M();
   string initString = write_str("p6dof_set_velocity_ned_fps ", launchSpeed_fps, " 0 0  p6dof_alt ", launchAltitude_ft, " ft");
   platform1.ProcessInput(initString);
   WsfPlatform platform2 = WsfSimulation.AddPlatform(platform1, "");
end_execute
```

- **演示要点**：演示 execute 的参数：double, string

### execute（behavior_alt3441_tail_attack）｜状态执行

- **关键词**：execute, if, else, 状态执行
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:317-328`　（同签名共 13 处，另见 `brawler/platforms/alternatives/behavior_alt3441_tail_attack.txt:309`、`space_operations/space_weather.txt:114`、`exchange_proc/tanker_definition.txt:50`）
- **片段**：

```text
   execute
      writeln_d("3441_tail_attack");
      ## what was evaluated should be actually performed now
      if (spdmod == 2)
      {
         PLATFORM.FlyVectorWithThrottle(dir0, gmx, spd0);
      }
      else
      {
         PLATFORM.FlyVectorWithSpeed(dir0, gmx, spd0 * MATH.M_PER_FT());
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：if, else

### execute（sequence_with_memory_checkpoint_1）｜状态执行

- **关键词**：execute, if, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/sequence_with_memory_checkpoint_1.txt:20-32`　（同签名共 47 处，另见 `behavior_tree/processors/quantum_agents/aiai/sequence_with_memory_checkpoint_2.txt:20`、`behavior_tree/processors/quantum_agents/aiai/sequence_with_memory_checkpoint_3.txt:20`、`behavior_tree/processors/quantum_agents/aiai/sequence_with_memory_checkpoint_4.txt:20`）
- **片段**：

```text
   execute
      if (PLATFORM.GroundRangeTo(WsfSimulation.FindPlatform("Blue_checkpoint_1")) < 10000)
      {
         return Success("Checkpoint 1 reached!");
      }
      
      if (!commandIssued)
      {
         commandIssued = true;
         FlyTarget(PLATFORM, WsfSimulation.FindPlatform("Blue_checkpoint_1").Location(), 450);
      }
      return Running("Flying to Checkpoint 1");
   end_execute
```

- **演示要点**：演示 execute 的参数：if, return

### execute（behavior_pursue_fly_simple）｜状态执行

- **关键词**：execute, extern, double, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_fly_simple.txt:28-42`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_fly_simple.txt:28`）
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing pursue_fly_simple, T=", TIME_NOW);
      extern double mDesiredHeading;
      extern double mDesiredAltitude;
      extern double mDesiredSpeed;
      extern double mDesiredLinearAccel;
      extern double mDesiredRadialAccel;
      extern double mDesiredClimbDiveAngle;

      writeln_d("flying heading: ", mDesiredHeading, ", alt: ", mDesiredAltitude, ", speed: ", mDesiredSpeed);
      PLATFORM.GoToSpeed(mDesiredSpeed, mDesiredLinearAccel);
      double altRateOfChange = PLATFORM.Speed() * MATH.Sin(mDesiredClimbDiveAngle);
      PLATFORM.GoToAltitude(mDesiredAltitude, altRateOfChange);
      PLATFORM.TurnToHeading(mDesiredHeading, mDesiredRadialAccel);
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, double

### execute（escort）｜状态执行

- **关键词**：execute, if, foreach, 状态执行
- **出处**：`air_to_air/scenarios/escort.txt:257-272`　（同签名共 5 处，另见 `air_to_air/scenarios/escort.txt:208`、`base_types/processors/quantum_agents/aifl/behavior_manage-uplinks.txt:31`、`base_types/processors/ripr_agents/aifl/behavior_manage-uplinks.txt:35`）
- **片段**：

```text
   execute at_interval_of 5 s 
      // stiff arm guys not in my lane
      WsfSA_Processor saPROC = (WsfSA_Processor)iacid.Processor("assessment");
      WsfPlatform PE = WsfSimulation.FindPlatform(PROTECTING[0]);
      if (!PE.IsValid() || PE.IsNull()) { return; }
      foreach (WsfSA_EntityPerception ent in saPROC.PerceivedBandits())
      {
         if (ent.Track().IsValid() && ent.Track().LocationValid())
         {
            if (PE.RelativeBearingTo(ent.Track()) < 0 && PE.SlantRangeTo(ent.Track()) > DISPLN_X )
            {
               mapSTIFF_ARM.Set(ent,true);
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：if, foreach

### execute（behavior_weapon_decision_missile）｜状态执行

- **关键词**：execute, bool, if, 状态执行
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:491-507`　（同签名共 10 处，另见 `brawler/platforms/alternatives/behavior_weapon_decision_missile.txt:483`、`base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:164`、`base_types/processors/ripr_agents/aiai/behavior_radar-control.txt:63`）
- **片段**：

```text
   execute
      // Replicates akshn7.f
      // We don't need to do all the bookeeping that BRAWLER
      // does. Just launch the weapon.

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      // Assuming 1v1 and first and only task is the one we want
      WsfLocalTrack targetTrack = PLATFORM.MasterTrackList().FindTrack(tasks.Entry(0).LocalTrackId());

      //Assuming weapon name, checked in precondition
      WsfWeapon weapon = PLATFORM.Weapon("srm");
      bool launched = weapon.FireSalvo(targetTrack, 1); // Always firing one for now
      if (!launched)
      {
         writeln_d("   ", PLATFORM.Name(), " could NOT fire at track: ", targetTrack.TargetName(), " at time: ", TIME_NOW);
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：bool, if

### execute（space_weather）｜状态执行

- **关键词**：execute, global, extern, 状态执行
- **出处**：`space_operations/space_weather.txt:95-112`
- **片段**：

```text
execute at_time 2001 sec absolute
   WsfPlatform Platform = WsfSimulation.FindPlatform("INTELSAT_18");
   global int head = Platform.Heading();
   global int pitch = Platform.Pitch();
   global int roll = Platform.Roll();
   Platform.SetGPS_Status(0); // Completely disabled
   Platform.Comment(1,"Watch me! A Coronal Mass Ejection is about to interfere with my orientation");
   Platform.Comment(2001,"Orientation temporarily affected");
   Platform.Comment(2002, "Expected wait time: 4600 seconds");
   Platform.Comment(6602, "Orientation has been corrected");
   WsfDraw draw = {};
   draw.BeginEllipsoid(0, 0, 0, 500000, 1000000, -1);
   draw.SetDuration(4600);
   draw.VertexLLA(56.75, -126.6333, 8000);
   draw.End();
   extern void DrawMagneticField(bool aDraw);
   DrawMagneticField(true);
end_execute
```

- **演示要点**：演示 execute 的参数：global, extern

### execute（blue_multirole_fighter_2）｜状态执行

- **关键词**：execute, double, for, 状态执行
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2.txt:68-86`
- **片段**：

```text
   execute at_time 5 seconds relative
      WsfDraw sensorArc = WsfDraw();
      sensorArc.SetId(PLATFORM.Name());
      sensorArc.SetColor(0,1,0);
      sensorArc.SetEllipseMode("line");
      sensorArc.BeginPolyline();
      sensorArc.Vertex(PLATFORM);
      double range = 125. * MATH.M_PER_NM();
      double heading = PLATFORM.Heading();
      WsfGeoPoint loc = PLATFORM.Location();
      for (double angle = -60.; angle <= 60.; angle = angle + 5.)
      {
         double aFront = MATH.Cos(angle)*range;
         double aRight = MATH.Sin(angle)*range;
         sensorArc.VertexECS(PLATFORM, aFront, aRight, 0.0);
      }
      sensorArc.Vertex(PLATFORM);
      sensorArc.End();
   end_execute
```

- **演示要点**：演示 execute 的参数：double, for

### execute（pm6_missile_comparison）｜状态执行

- **关键词**：execute, double, foreach, 状态执行
- **出处**：`six_dof/pm6_missile_comparison.txt:431-454`　（同签名共 4 处，另见 `six_dof/rb6_missile_comparison.txt:431`、`base_types/processors/quantum_agents/aigci/behavior_create_flank_jobs.txt:95`、`base_types/processors/ripr_agents/aigci/behavior_create_flank_jobs.txt:99`）
- **片段**：

```text
   execute at_interval_of 2 sec
   
      tgtLocked = false;
   
      WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
   
      double closestTrackDistance_m = 10000000;
      foreach (WsfLocalTrack trk in trackList)
      {
         if( trk.IsValid() &&
             trk.Target().IsValid() &&
             trk.Target().Side() != Side())
         {
            if( trk.Range() < closestTrackDistance_m)
            {
               closestTrackDistance_m = GroundRangeTo(trk);
               PLATFORM.SetCurrentTarget(trk);
               tgtLocked = true;
               # writeln("T=", TIME_NOW, " Sam locked onto unknown target at ", trk.Range()/1000.0, " km...");
            }
         }
      }
       
   end_execute
```

- **演示要点**：演示 execute 的参数：double, foreach

### execute（behavior_pursue-point_pathing）｜状态执行

- **关键词**：execute, double, if, 状态执行
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pursue-point_pathing.txt:51-78`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_avoid_overshoot.txt:83`、`base_types/processors/ripr_agents/aiai/behavior_avoid_overshoot.txt:83`）
- **片段**：

```text
   execute
      writeln("executing pursue-point_pathing.");
      PROCESSOR.SetUpdateInterval(cSLOW_UPDATE_RATE);
      PLATFORM.GoToSpeed(cINTERCEPT_SPEED);
     #extern double cDEFAULT_ALTITUDE;
      PLATFORM.GoToAltitude(cDEFAULT_ALTITUDE, 200);

      double interceptAltitude = mCurrentPointIntercept.Altitude();
      double interceptHeading  = PLATFORM.TrueBearingTo(mCurrentPointIntercept);
      double interceptRange    = PLATFORM.SlantRangeTo(mCurrentPointIntercept);

      writeln_d("    T=", TIME_NOW, ", range: ", interceptRange, " true-bearing: ", interceptHeading);

      WsfGeoPoint startGeoPoint = PLATFORM.Location();

      if (!PLATFORM.FindAndSetPath(startGeoPoint, mCurrentPointIntercept))
      {
         PLATFORM.FollowRoute("DEFAULT_ROUTE","CLOSEST_POINT");
      }

     #if ( (interceptAltitude - PLATFORM.Altitude()) > 5)
      if ( (interceptAltitude - PLATFORM.Altitude()) > 10000*MATH.M_PER_FT())
      {
         writeln_d("GoToAltitude: ",interceptAltitude);
         #PLATFORM.GoToAltitude(interceptAltitude);
      }

   end_execute
```

- **演示要点**：演示 execute 的参数：double, if

### execute（behavior_engage-target）｜状态执行

- **关键词**：execute, extern, for, 状态执行
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage-target.txt:600-627`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing engage-target, T=", TIME_NOW);
      extern WsfTrack GetTrackByName(WsfPlatform, string);
      #check all possible targets on all channels
      ########################################################################
      ###   fire on any pursue-target jobs we are assigned to
      ########################################################################
      WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();
      for (int channel = 0; channel < ((WsfRIPRProcessor)PROCESSOR).GetNumJobChannels(); channel = channel + 1)
      {
         WsfRIPRJob aJob = commander.GetJobFor(((WsfRIPRProcessor)PROCESSOR), channel);
         if (aJob.IsValid() &&
             aJob.Name() == "pursue-target")
         {
            string   targetName  = (string)aJob.GetData("targetTrackName");
            WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);
            if (!targetTrack.IsNull() &&
                targetTrack.IsValid())
            {
               writeln_d("   ", PLATFORM.Name(), " trying to shoot at job track: ", targetName, " at time: ", TIME_NOW);
               if(FireWeapon(targetTrack) == false)
               {
                  writeln_d("   ", PLATFORM.Name(), " could NOT fire at track: ", targetTrack.TargetName(), " at time: ", TIME_NOW);
               }
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：extern, for

### execute（sat_exclusion_angle_proc）｜状态执行

- **关键词**：execute, if, string, 状态执行
- **出处**：`coverage_demos/processors/sat_exclusion_angle_proc.txt:131-159`
- **片段**：

```text
   execute at_time 0.001 sec absolute 
      WsfSensor sen = PLATFORM.Sensor(EXCL_SENSOR_NAME);
      if (!sen.IsValid()) # turn of processor if sensor not found
      {
         PROCESSOR.TurnOff();
         return;
      }
      string platName = PLATFORM.Name();
      string senName = EXCL_SENSOR_NAME;
      string platSenStr = platName + "-" + senName;
      
      if(DRAW_SEN_ON_OFF)
      {
         bool senOn = sen.IsTurnedOn();
         Color initColor = Color.Green();
         if (!senOn)
         {
            initColor = Color.Red();
         }
         
         WsfDraw draw = {};
         draw.Erase(platSenStr);
         draw.SetId(platSenStr);
         draw.SetColor(initColor);
         draw.BeginEllipse(0.0, drawRadius, drawRadius);
         draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
         draw.End();
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：if, string

### execute（observer）｜状态执行

- **关键词**：execute, extern, if, 状态执行
- **出处**：`air_to_air/observer.txt:40-72`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_targets_of_opportunity.txt:31`、`base_types/processors/quantum_agents/aiai/behavior_pursue_fly_route_finder.txt:94`）
- **片段**：

```text
execute at_interval_of 5 s
   extern WsfGeoPoint origin; 
   if (log_print)
   {
      int p = WsfSimulation.PlatformCount();

      log.Writeln(write_str("\nSIMULATION TIME HAS REACHED ",Format.Fixed(TIME_NOW,1), " s"));
      log.Writeln(write_str("Min Perceived Range to Hostile ( ",Format.Fixed(closest_hostile*MATH.NM_PER_M(),1)," nmi )"));
      closest_hostile = 200.0*MATH.M_PER_NM(); // re-set this so it's recalculated
      for (int i = 0; i <= total_entities; i = i + 1)
      {
         if (WsfSimulation.FindPlatform(i).IsValid() && !WsfSimulation.FindPlatform(i).CategoryMemberOf("missile"))
         {
            WsfPlatform ac = WsfSimulation.FindPlatform(i);
           for (int i =0; i<ac.ProcessorCount(); i=i+1)
           { 
              if (ac.ProcessorEntry(i).IsValid() && ac.ProcessorEntry(i).Type()
                 == "WSF_SA_PROCESSOR" && TIME_NOW > 10) 
              {  
                 if(ac->rng_cls_hst <= closest_hostile) { closest_hostile = ac->rng_cls_hst; }
              }
           }
           double hdg=ac.Heading();
           if(hdg < 0.){hdg=hdg+360.;}
           log.Writeln(write_str("A/C ",Format.Fixed(i,0).Pad(3)," ",ac.Side().Pad(-4)," ",ac.Name().Pad(-12),
            "(",Format.Fixed((ac.Longitude()-origin.Longitude())*60.0405,1).Pad(6),",",
            Format.Fixed((ac.Latitude()-origin.Latitude())*60.0405,1).Pad(6),")Nm ",
            Format.Fixed(ac.Altitude()*MATH.FT_PER_M()/1000.,1).Pad(4),"kft Hdg=",Format.Fixed(hdg,0).Pad(3),
            "� M=",Format.Fixed(ac.MachNumber(),2).Pad(3)," Pitch=",Format.Fixed(ac.Pitch(),1).Pad(4),"�"));
         }
      }
   }
end_execute
```

- **演示要点**：演示 execute 的参数：extern, if

### execute（starlink_generator）｜状态执行

- **关键词**：execute, string, for, 状态执行
- **出处**：`space_operations/scenarios/starlink_generator.txt:163-196`
- **片段**：

```text
execute at_time 1 sec absolute
   string fileName = cmOutputPath + "/" + cmBaseName + "_autogen.txt";
   FileIO file = {};
   file.Open(fileName, "out");
   
   file.Writeln("# New file created by .//starlink_generator.txt.");
   file.Writeln("# Modifications to this file may be overwritten.");
   file.Writeln("");
   
   for (int plane = 0; plane < cmNumPlanes; plane += 1)
   {
      double raan = cmInitialRAAN + plane * cmRAAN_Range / cmNumPlanes;
      raan = MATH.NormalizeAngle0_360(raan);
      for (int sat = 0; sat < cmNumSatsPerPlane; sat += 1)
      {
         double anomaly = cmInitialAnomaly + sat * 360.0 / cmNumSatsPerPlane + cmAnomalyAlias * plane;
         anomaly = MATH.NormalizeAngle0_360(anomaly);
         string name = GenerateName(plane, sat);
         
         file.Writeln("platform " + name + " " + cmPlatformType);
         file.Writeln("   mover");
         file.Writeln("      inclination " + (string)cmInclination + " deg");
         file.Writeln("      revs_per_day " + (string)cmRevsPerDay);
         file.Writeln("      raan " + (string)raan + " deg");
         file.Writeln("      true_anomaly " + (string)anomaly + " deg");
         file.Writeln("   end_mover");
         SpecializeMember(file, plane, sat);
         file.Writeln("end_platform");
         file.Writeln("");
      }
   }
   
   file.Close();
end_execute
```

- **演示要点**：演示 execute 的参数：string, for

### execute（six_dof_fuel_burn_envelope）｜状态执行

- **关键词**：execute, int, foreach, 状态执行
- **出处**：`six_dof/six_dof_fuel_burn_envelope.txt:98-161`　（同签名共 2 处，另见 `six_dof/six_dof_fuel_burn_envelope.txt:165`）
- **片段**：

```text
   execute at_time 0.1 s absolute
      int iFuel = 0;   
      foreach (double fuelLoad in fuelPercentage)
      {
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover) Mover();
         double minWeight = mover.GetEmptyWeight();
         double fuelWeight = mover.GetTotalFuelCapacity();

         double testingWeight_kg = minWeight + (fuelLoad / 100.0) * fuelWeight;

         int iAlt = 0;
         for(double alt = initialAltitude_ft; alt <= maximumAltitude_ft; alt = alt + altitudeStep_ft)
         {
            if (iFuel == 0) { mAltitudes.PushBack(alt); }               

            double altitude_m = alt * Math.M_PER_FT();

            int iVel = 0;
            for(double vel = initialVelocity; vel <= maximumVelocity; vel = vel + velocityStep)
            {
               if (iAlt == 0 && iFuel == 0) { mVelocities.PushBack(vel); }               

               double mach = 0.0;
               if (speedMode.Lower() == "mach")
               {
                  mach = vel;
               }
               if (speedMode.Lower() == "fps")
               {
                  mach = mover.CalcMachFromFps(altitude_m, vel);
               }
               else if (speedMode.Lower() == "ktas")
               {
                  mach = mover.CalcMachFromKtas(altitude_m, vel);
               }
               else if (speedMode.Lower() == "kcas")
               {
                  mach = mover.CalcMachFromKcas(altitude_m, vel);
               }

               double fuelFlow_kgps = mover.__getTestObject().GetLevelFlightFuelBurnRate(altitude_m,
                                                                                         mach,
                                                                                         testingWeight_kg);               

               FuelData data = FuelData();

               data.iAlt = iAlt;
               data.iVel = iVel;
               data.iFuel = iFuel;               

               data.altitude_ft = alt;
               data.velocity_fps = vel;
               data.fuel_percent = fuelLoad;
               data.fuelBurnRate_kgps = fuelFlow_kgps;

               mFuelFlowData.PushBack(data);

               iVel = iVel + 1;
            }
            iAlt = iAlt + 1;
         }
         iFuel = iFuel + 1;
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：int, foreach

### execute（selector_engage_weapon_task_target）｜状态执行

- **关键词**：execute, foreach, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_engage_weapon_task_target.txt:166-273`
- **片段**：

```text
   execute
      writeln_d(PLATFORM.Name(), " executing engage-target, T=", TIME_NOW);
     #extern WsfTrack GetTrackByName(WsfPlatform, string);
      #check all possible targets on all channels
      ########################################################################
      ###   fire on any pursue-target jobs we are assigned to
      ########################################################################
      WsfQuantumTaskerProcessor proc = (WsfQuantumTaskerProcessor)PROCESSOR;
     
      WsfTaskList tasks = proc.TasksReceivedOfType("WEAPON");
      foreach (WsfTask task in tasks)
      {
         WsfTrack targetTrack = PLATFORM.MasterTrackList().FindTrack(task.LocalTrackId());
         if (targetTrack.IsNull() || !targetTrack.IsValid())
         {
            writeln_d("target track not valid");
            continue;
         }
         
         bool launched = false;
         writeln_d("   Time= ", TIME_NOW, "   Attempting a shot against: ", targetTrack.TargetName(), " Index: ", targetTrack.TargetIndex(), " Type: ", targetTrack.TargetType());
      
         if (mCoopEngageOne == false)
         {
            WsfLocalTrack targetLocalTrack = (WsfLocalTrack)targetTrack;
            if (targetLocalTrack.IsValid())
            {
               if(!targetLocalTrack.ContributorOf(PLATFORM) &&
                  !targetLocalTrack.IsPredefined())
               {
                  return Failure("targetLocalTrack is invalid!");
               }
            }
         }

         writeln_d ("    targetTrack.TrackQuality == ", targetTrack.TrackQuality());
         if (targetTrack.TrackQuality() < GetRequiredTrackQualityForThreat(targetTrack))
         {
            writeln_d("         FAIL: track quality not good enough to fire on target");
            return Failure("Track quality not good enough to fire on target");
         }
         
         if ((PLATFORM.WeaponsPendingFor(task.LocalTrackId()) + PLATFORM.WeaponsActiveFor(task.LocalTrackId())) > 0)
         {
            writeln_d("already have weapons assigned for target track");
            return Failure("Already have weapons assigned for target track");
         }
         
         WsfWeapon weapon;
#         if (task.ResourceName() != "")
#         {
#            weapon = PLATFORM.Weapon(task.ResourceName());
#            writeln_d("checking if weapon ", weapon.Name(), " can be fired against track.");
#            if (!WeaponCapableAvailableAgainstThreat(weapon, targetTrack) ||
#                !InRangeToFire(PLATFORM, weapon, targetTrack, GetLaunchPercentRangeMaxOnThreat(weapon.Name(), targetTrack), DefaultPercentRangeMin))
#            {
#               writeln_d("task defined weapon not available or in range!");
#               return 3;
#            }
#         }
#         else
         {
            bool weaponUsable = false;
            #first weapon found will be used
            for (int i=0; i < PLATFORM.WeaponCount(); i+=1)
            {
               weapon = PLATFORM.WeaponEntry(i);
               writeln_d("checking if weapon ", weapon.Name(), " is usable.");
               if (WeaponCapableAvailableAgainstThreat(weapon, targetTrack) &&
                   InRangeToFire(PLATFORM, weapon, targetTrack, GetLaunchPercentRangeMaxOnThreat(weapon.Name(), targetTrack), DefaultPercentRangeMin))
               {
                  weaponUsable = true;
                  break;
               }
            }
            if (weaponUsable == false)
            {
               writeln_d("no usable weapon found!");
               return Failure("No usable weapon found!");
            }
         }

         int salvoCount = GetSalvoForThreat(targetTrack);
         writeln_d("         salvo count for ", targetTrack, " is: ", salvoCount);

         if (weapon.IsTurnedOn())
         {
            writeln_d("    Attempting launch at ", targetTrack.TargetName());
            if (salvoCount > 1)
            {
               writeln_d("FIRING SALVO AT ", targetTrack.TargetName());
               launched = weapon.FireSalvo(targetTrack, salvoCount);
            }
            else
            {
               writeln_d("FIRING AT ", targetTrack.TargetName());
               launched = weapon.Fire(targetTrack);
            }
         }
         writeln_d("    launched == ", launched, ", weapon: ", weapon.Name());
      
         if(launched == false)
         {
            writeln_d("   ", PLATFORM.Name(), " could NOT fire at track: ", targetTrack.TargetName(), " at time: ", TIME_NOW);
         }
      }
      return Success("Launched weapon successfully");
   end_execute
```

- **演示要点**：演示 execute 的参数：foreach, return

### execute（behavior_debug_quantum_tasker）｜状态执行

- **关键词**：execute, string, while, 状态执行
- **出处**：`brawler/processors/quantum_agents/behavior_debug_quantum_tasker.txt:48-204`　（同签名共 3 处，另见 `heatmap/processors/quantum_agents/aiai/behavior_debug_quantum_tasker.txt:48`、`timeline/processors/quantum_agents/aiai/behavior_debug_quantum_tasker.txt:48`）
- **片段**：

```text
   execute
      writeln(PLATFORM.Name(), ", T=", TIME_NOW, ", executing debug_quantum_tasker");

      Array<WsfQuantumTask> tasks = ((WsfQuantumTaskerProcessor)PROCESSOR).TasksConsidered();
      Array<WsfAssetPerception> assets = ((WsfQuantumTaskerProcessor)PROCESSOR).AssetsConsidered();
      Array<Array<double>> values = ((WsfQuantumTaskerProcessor)PROCESSOR).ValuesConsidered();

      #write top row (asset names) and 2nd row (asset system)
      string topRow    = "                        job name,        priority, ";
      string secondRow = "                                                   ";
      foreach(WsfAssetPerception a in assets)
      {
         string assetName = a.Name();
         while (assetName.Length() < 16)
         {
            assetName = " " + assetName;
         }
         if (assetName.Length() > 16)
         {
            assetName = assetName.Substring(-16);
         }
         topRow = topRow + assetName + ", "; #each column is 18 spaces wide

         string assetSystem;
         if(a.SystemCount() == 1)
         {
            assetSystem = a.SystemName(0);
         }
         else
         {
            assetSystem = write_str("#_sys=", a.SystemCount());
         }
         while (assetSystem.Length() < 16)
         {
            assetSystem = " " + assetSystem;
         }
         if (assetSystem.Length() > 16)
         {
            assetSystem = assetSystem.Substring(-16);
         }
         secondRow = secondRow + assetSystem + ", "; #each column is 18 spaces wide
      }
      topRow = topRow + "          winner";
      string lines = "-";
      while (lines.Length() < topRow.Length())
      {
         lines = lines + "-";
      }
      writeln(lines);
      writeln(topRow);
      writeln(secondRow);


      #write all columns of each row now
      for(int i=0; i<tasks.Size(); i+=1)
      {
         WsfQuantumTask t = tasks.Get(i);
         string taskDesc;
         WsfTrack temp = PLATFORM.MasterTrackList().Find(t.TrackId());
         if (temp.IsValid())
         {
            taskDesc = write_str(t.TaskType(), ":", temp.TargetName());
         }
         else
         {
            taskDesc = write_str(t.TaskType(), ":", t.TrackId().ToString());
         }
         while (taskDesc.Length() < 32)
         {
            taskDesc = " " + taskDesc;
         }
         if (taskDesc.Length() > 32)
         {
            taskDesc = taskDesc.Substring(-32);
         }
         string row = taskDesc + " ";   #this should be 33 spaces, at this point

         ##TODO - get task priority from WsfTask
         string pString = (string)t.Priority();
         while( pString.Contains(".") && pString.Substring(-1)=="0")   #take off all trailing zeros
         {
            pString = pString.Substring(0,-1);
         }
         if (pString.Length() > 16)
         {
            pString = pString.Substring(0,15);
         }
         pString = pString + ", ";
         while (pString.Length() < 18)
         {
            pString = " " + pString;
         }
         row = row + pString;

         for(int j=0; j<assets.Size(); j+=1)
         {
            WsfAssetPerception p = assets.Get(j);
            double value = values.Get(i).Get(j);

            string valStr = (string)value;

            while( valStr.Contains(".") && valStr.Substring(-1)=="0")   #take off all trailing zeros
            {
               valStr = valStr.Substring(0,-1);
            }
            if (valStr.Length() > 16)
            {
               valStr = valStr.Substring(0,15);
            }
            valStr = valStr + ", ";
            while (valStr.Length() < 18)
            {
               valStr = " " + valStr;
            }
            row = row + valStr;
         }



        ###TODO get task "winners"
         //Array<WsfPlatform> winners = job.Winners();
         Array<WsfAssetPerception> assignees = ((WsfQuantumTaskerProcessor)PROCESSOR).AssetAssigneesFor(t);
         string winner;
         if (assignees.Empty())
         {
            winner = "-";
         }
         else if (assignees.Size() > 1)
         {
            winner = (string)assignees.Size() + " winners";
         }
         else
         {
            WsfAssetPerception asset = assignees[0];
            if(asset.SystemCount() == 1)
            {
               winner = write_str(asset.Name(),":", asset.SystemName(0));
            }
            else
            {
               winner = write_str(asset.Name(),":#_sys=", asset.SystemCount());
            }
         }
         while (winner.Length() < 16)
         {
            winner = " " + winner;
         }
#         if (winner.Length() > 16)
#         {
#            winner = winner.Substring(-16);
#         }
         row = row + winner;
         writeln(row);
      }
      writeln(lines);
      writeln("");
   end_execute
```

- **演示要点**：演示 execute 的参数：string, while

### execute（external_fuel_tank_test1）｜状态执行

- **关键词**：execute, double, 状态执行
- **出处**：`p6dof/external_fuel_tank_test1.txt:64-67`　（同签名共 16 处，另见 `p6dof/external_fuel_tank_test1.txt:116`、`six_dof/pm6_external_fuel_tank_test1.txt:64`、`six_dof/pm6_external_fuel_tank_test1.txt:116`）
- **片段**：

```text
   execute at_time 3599 sec absolute
      double totalFuel = GetTotalFuelRemaining_lbs(PLATFORM);
      writeln("Aircraft 1 has ", totalFuel, " lbs of fuel remaining...");
   end_execute
```

- **演示要点**：演示 execute 的参数：double

### execute（decorator_turn_left）｜状态执行

- **关键词**：execute, return, 状态执行
- **出处**：`behavior_tree/processors/quantum_agents/aiai/decorator_turn_left.txt:15-18`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aiai/decorator_turn_right.txt:15`、`behavior_tree/processors/quantum_agents/aiai/selector_pincer_fsm.txt:138`）
- **片段**：

```text
   execute
      PLATFORM.TurnToRelativeHeading(-18);
      return Success("turn_left maneuver complete!");
   end_execute
```

- **演示要点**：演示 execute 的参数：return

### execute（chaff_example）｜状态执行

- **关键词**：execute, bool, 状态执行
- **出处**：`chaff/chaff_example.txt:97-100`　（同签名共 6 处，另见 `chaff/chaff_example.txt:102`、`chaff/chaff_example.txt:107`、`chaff/chaff_example_ttr.txt:106`）
- **片段**：

```text
   execute at_time 5.0 sec absolute
      WsfChaffWeapon weapon = (WsfChaffWeapon)PLATFORM.Weapon("chaff");
      bool fired = weapon.DropChaffCloud(10, 1.0, {"eject-1", "eject-2", "eject-3"});
   end_execute
```

- **演示要点**：演示 execute 的参数：bool

### execute（fuel_table_demo）｜状态执行

- **关键词**：execute, if, 状态执行
- **出处**：`example_scripts/fuel_table_demo.txt:86-90`　（同签名共 72 处，另见 `air_to_air/scenarios/1v1_initial_prediction.txt:322`、`air_to_air/scenarios/1v1_initial_prediction.txt:335`、`air_to_air/scenarios/1v1_initial_prediction.txt:390`）
- **片段**：

```text
   execute at_interval_of 10 sec
      WsfFuel fuel = PLATFORM.Fuel();
      if (fuel.IsValid())
         writeln("T=",TIME_NOW,", ",PLATFORM.Name(), " fuel rate = ", fuel.ConsumptionRate());
   end_execute
```

- **演示要点**：演示 execute 的参数：if

### execute（behavior_timeline_reposition）｜状态执行

- **关键词**：execute, extern, 状态执行
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_reposition.txt:130-134`　（同签名共 7 处，另见 `base_types/processors/quantum_agents/aiai/behavior_snap_shot.txt:111`、`base_types/processors/quantum_agents/aiai/behavior_force_overshoot.txt:49`、`base_types/processors/quantum_agents/aifl/behavior_adjust_priority_for_escort.txt:17`）
- **片段**：

```text
   execute
      extern double mDragSpeed;
      extern double mDragAltitude;
      Drag(PLATFORM, mNearestTimeLineTarget, mDragSpeed, mDragAltitude, mGeesToTurnWith);   #max speed
   end_execute
```

- **演示要点**：演示 execute 的参数：extern

### execute（traveling_astronaut）｜状态执行

- **关键词**：execute, targets, 状态执行
- **出处**：`space_operations/traveling_astronaut.txt:44-49`
- **片段**：

```text
   execute at_time 1 min absolute
      # To change the number of targets, either change the final argument to CreateJunk,
      # or modify the parameters in script/cascade.txt.
      targets = CreateJunk(PLATFORM.LocationECI(), PLATFORM.VelocityECI(), "junk_", 3.0);
      writeln(targets.Size(), " Pieces of junk created.");
   end_execute
```

- **演示要点**：演示 execute 的参数：targets

### execute（cloud_attenuation）｜状态执行

- **关键词**：execute, for, 状态执行
- **出处**：`space_operations/cloud_attenuation.txt:28-37`　（同签名共 4 处，另见 `space_operations/space_weather.txt:33`、`base_types/processors/ripr_agents/aiai/behavior_engage-target.txt:600`、`space_operations/space_weather.txt:60`）
- **片段**：

```text
execute at_time 0.001 sec absolute
   for (int i = 1; i <= WsfSimulation.PlatformCount(); i = i + 1)
   {
      WsfPlatform platform1 = WsfSimulation.FindPlatform(i);
      if (platform1.IsValid() && platform1.Type() == "GPS")
      {
         platform1.TurnSensorOn("optical");
      }
   }
end_execute
```

- **演示要点**：演示 execute 的参数：for

### execute（pm6_tactical_maneuvers）｜状态执行

- **关键词**：execute, else, 状态执行
- **出处**：`six_dof/pm6_tactical_maneuvers.txt:654-665`　（同签名共 51 处，另见 `six_dof/rb6_tactical_maneuvers.txt:654`、`p6dof/tactical_maneuvers.txt:672`、`six_dof/pm6_tactical_maneuvers.txt:495`）
- **片段**：

```text
   execute at_time 330.0 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)PLATFORM.Mover();
      if(!mover.IsNull())
      {
         SetDeltaPitch(PLATFORM, 88.0);
         SetKIAS(PLATFORM, 600.0);
      }
      else
      {
         writeln("--ERROR-- Not a SixDOF Mover.");
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：else

### execute（escort）｜状态执行

- **关键词**：execute, foreach, 状态执行
- **出处**：`air_to_air/scenarios/escort.txt:159-175`　（同签名共 43 处，另见 `electronic_warfare/jam_strobe_direction_finder.txt:238`、`electronic_warfare/closely_space_targets.txt:119`、`electronic_warfare/false-target_command_center.txt:264`）
- **片段**：

```text
   execute at_interval_of 5 s 
      foreach (WsfLocalTrack ltrk in PLATFORM.MasterTrackList())
      {
         if (ltrk.IsValid() && ltrk.Target().IsValid() && ltrk.TargetName() == "ground_target")
         {
            if ( PLATFORM.SlantRangeTo(ltrk) < 20.0 *MATH.M_PER_NM() 
            && PLATFORM.Weapon("agm").QuantityRemaining() > 0 )
            {
               PLATFORM.Weapon("agm").FireSalvo(ltrk,2);
            }
            if (PLATFORM.Weapon("agm").QuantityRemaining() == 0)
            {
               PLATFORM.TurnToHeading(270);
            }
         }
      }
   end_execute
```

- **演示要点**：演示 execute 的参数：foreach

### execute（performance_test）｜状态执行

- **关键词**：execute, string, 状态执行
- **出处**：`p6dof/performance_test.txt:75-95`　（同签名共 3 处，另见 `six_dof/pm6_performance_test.txt:78`、`six_dof/rb6_performance_test.txt:78`）
- **片段**：

```text
execute at_time .01 sec absolute

   string route1 = "route ";
   string route2 = "position 21.4n  158.0w  altitude 2000.0 m speed 450.0 kts ";
   string route3 = "label LoopToHere ";
   string route4 = "position 21.48n 158.0w  altitude 2500.0 m speed 450.0 kts ";
   string route5 = "position 21.48n 157.92w altitude 2500.0 m speed 450.0 kts ";
   string route6 = "position 21.4n  157.92w altitude 2000.0 m speed 450.0 kts ";
   string route7 = "position 21.4n  158.0w  altitude 2000.0 m speed 450.0 kts ";
   string route8 = "goto LoopToHere end_route";

   for(int i = 0; i < NUMBER_OF_PLATFORMS; i = i + 1)
   {
      WsfPlatform platform1 = WsfSimulation.CreatePlatform("MY_PLATFORM_TYPE");
      string startPosition = write_str("position ", 21.4 - ((double)(i+10) / 1000.0), "n 158.0w altitude 2000.0 m speed 450.0 kts ");
      string fullRoute = write_str(route1, startPosition, route2, route3, route4, route5, route6, route7, route8);
      platform1.ProcessInput(fullRoute);
      WsfPlatform platform2 = WsfSimulation.AddPlatform(platform1, "");
   }

end_execute
```

- **演示要点**：演示 execute 的参数：string

### execute（1v1）｜状态执行

- **关键词**：execute, 状态执行
- **出处**：`air_to_air/1v1.txt:45-47`　（同签名共 554 处，另见 `air_to_air/1v1_initial_prediction.txt:46`、`air_to_air/2v2.txt:45`、`air_to_air/2v2_am.txt:45`）
- **片段**：

```text
execute at_interval_of 10 s 
   writeln("T = ",TIME_NOW);
end_execute
```

- **演示要点**：演示 execute（最小结构，无子参数）

### next_state（establish_link_processor）｜状态迁移

- **关键词**：next_state, static, double, if, else, return, 状态迁移
- **出处**：`space_operations/processors/establish_link_processor.txt:140-178`
- **片段**：

```text
      next_state acquire
      
         WsfComm comm = LocalComm(TRACK);
         comm.CueToTrack(TRACK);
         WsfGeoPoint targetLoc = TRACK.Target().Location();
         static double sTOL = 0.5;
         double targetAz = comm.RelativeAzimuthOf(targetLoc); 
         double targetEl = comm.RelativeElevationOf(targetLoc);
         
         if (TRACK.AuxDataBool("begin_slewing"))
         {
            #writeln(TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), ": begin slew");
            TRACK.SetAuxData("begin_slewing", false);
         }
         else
         {
##   Following is valid for AFSIM 2.3+ or custom build only.
##            if ((comm.CurrentCuedAzimuth() == comm.ActualCuedAzimuth()) &&
##                (comm.CurrentCuedElevation() == comm.ActualCuedElevation()))
#            if ((MATH.Fabs(targetAz) < sTOL) &&
#                (MATH.Fabs(targetEl) < sTOL))
#            {                
#               #writeln(TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), ": slew complete");
#               return true;
#            }
#            else
#            {
##               writeln("slew limit exceeded");
##               CancelTask(TRACK.TrackId(), "slew_limit_exceeded");
#               #writeln( TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), " slewing; az, el: ", targetAz, ", ", targetEl); 
#            }
##         }
##         else
##         {
##            writeln( TIME_NOW, ": ", PLATFORM.Name(), ":", comm.Name(), " slewing; az, el: ", targetAz, ", ", targetEl);
            return true; // todo evaluate 
         }
         return false;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：static, double, if, else, return

### next_state（rcs_display_mgr）｜状态迁移

- **关键词**：next_state, bool, if, else, return, 状态迁移
- **出处**：`base_types/processors/rcs_display_mgr.txt:125-137`　（同签名共 3 处，另见 `outer_air_battle/processors/cvn_task_processor.txt:269`、`suppressor/platforms/bomber.txt:101`）
- **片段**：

```text
      next_state START_DISPLAYING
         bool stopped = false;
         if (TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime)
         {
            UpdateDisplay();
         }
         else
         {
            StopDisplaying();
            stopped = true;
         }
         return stopped;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：bool, if, else, return

### next_state（behavior_pincer_fsm）｜状态迁移

- **关键词**：next_state, double, if, else, return, 状态迁移
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:268-282`　（同签名共 12 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pincer_fsm.txt:239`、`behavior_tree/processors/quantum_agents/aiai/selector_pincer_fsm.txt:266`、`timeline/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:246`）
- **片段**：

```text
      next_state SEPARATE
         double separate_angle = 0;
         if (mDirection == "left")
         {
            separate_angle = -mPincerOffsetAngle;
         }
         else if (mDirection == "right")
         {
            separate_angle = mPincerOffsetAngle;
         }
         double heading = MATH.NormalizeAngle0_360(PLATFORM.TrueBearingTo(mPincerPoint) + separate_angle);
         PLATFORM.GoToSpeed(mPincerSpeed);
         PLATFORM.TurnToHeading(heading);
         return true;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：double, if, else, return

### next_state（sam_battery）｜状态迁移

- **关键词**：next_state, double, bool, if, return, 状态迁移
- **出处**：`suppressor/platforms/sam_battery.txt:144-160`
- **片段**：

```text
      next_state LAUNCHED
        WsfWeapon weapon = PLATFORM.Weapon("missile");
        double relTgtAlt = PLATFORM.RelativeAltitudeOf(TRACK);

        bool firedWeapon = false;
        if ((weapon.QuantityRemaining() > 0)               &&
            (relTgtAlt > 50)                               &&
            (relTgtAlt < 15000)                            &&
            (PLATFORM.GroundRangeTo(TRACK) < 45000)        &&
            (PLATFORM.RelativeHeadingOf(TRACK) > 95))
        {
          weapon.CueToTrack(TRACK);
          firedWeapon = weapon.FireSalvo(TRACK, 2);
        }

        return firedWeapon;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：double, bool, if, return

### next_state（sam_regiment）｜状态迁移

- **关键词**：next_state, if, foreach, bool, return, 状态迁移
- **出处**：`suppressor/platforms/sam_regiment.txt:80-120`
- **片段**：

```text
      next_state ASSIGNED
        if (TRACK.IFF_Friend() ||
            (TRACK.Type() != "BOMBER")) return false;

        Array<WsfPlatform> filter2 = Array<WsfPlatform>();
        Array<WsfPlatform> filter3 = Array<WsfPlatform>();

        foreach (WsfPlatform sub in PLATFORM.Subordinates("red-net"))
        {
          if (SubOperational(sub) &&
              (TasksAssignedTo(sub) < maxSubOngoingAssignments) &&
              TRACK.WithinZoneOf(sub, "sam_zone") &&
              (sub.RelativeHeadingOf(TRACK) < 68.754935) &&
              (sub.GroundRangeTo(TRACK) < 45000))
          {
            if ((sub.GroundRangeTo(TRACK) < 30000) &&
                (TasksAssignedFor(TRACK.TrackId(), "Engage") < maxSubsAssigned))
            {
              filter3.PushBack(sub);
            }
            else
            {
              filter2.PushBack(sub);
            }
          }
        }

        bool assigned = false;
        foreach (WsfPlatform sub in filter3)
        {
          if (TasksAssignedFor(TRACK.TrackId()," Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }
        foreach (WsfPlatform sub in filter2)
        {
          if (TasksAssignedFor(TRACK.TrackId(), "Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }

        return assigned;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：if, foreach, bool, return

### next_state（flight_path）｜状态迁移

- **关键词**：next_state, bool, if, return, 状态迁移
- **出处**：`engage/flight_path.txt:78-85`　（同签名共 77 处，另见 `engage/flight_path.txt:90`、`engage/flight_route.txt:77`、`engage/flight_route.txt:89`）
- **片段**：

```text
         next_state TRY_TO_TRACK
            bool status = false;
            if (TRACK.TrackQuality() > 0.65)
            {
               status = StartTracking(TRACK, "DUMMY", PLATFORM.Sensor("ttr"), "ACQUIRE");
            }
            return status;
         end_next_state
```

- **演示要点**：演示 next_state 的参数：bool, if, return

### next_state（soj）｜状态迁移

- **关键词**：next_state, if, else, return, 状态迁移
- **出处**：`aea_iads/platforms/soj.txt:381-391`　（同签名共 5 处，另见 `alv_routing/processors/alv_task_mgr.txt:340`、`air_to_air/processors/sensor_cue_processor.txt:101`、`timeline/processors/quantum_agents/aiai/behavior_grinder.txt:340`）
- **片段**：

```text
      next_state CAN_JAM
         if (TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime)
         {
            UpdateJammingTrack();
         }
         else
         {
            StopJammingTrack("STALE_TRACK");
         }
         return StoppedJammingTrack();
      end_next_state
```

- **演示要点**：演示 next_state 的参数：if, else, return

### next_state（blue_multirole_fighter_2_task_processor）｜状态迁移

- **关键词**：next_state, double, if, return, 状态迁移
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:120-130`　（同签名共 7 处，另见 `timeline/processors/quantum_agents/aiai/behavior_grinder.txt:384`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:96`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:167`）
- **片段**：

```text
      next_state ENGAGE
         WsfWaypoint intercept = WsfWaypoint();
         double interceptTime = PLATFORM.InterceptLocation3D(TRACK, intercept);
         if (interceptTime > 0.0)
         {
#            writeln(PLATFORM.Name(), " is headed to ", intercept.Location().ToString());
            PLATFORM.GoToSpeed(540.0*MATH.MPS_PER_NMPH());
            PLATFORM.GoToPoint(intercept.Location());
         }
         return (PLATFORM.SlantRangeTo(TRACK) < 50.0 * MATH.M_PER_NM());
      end_next_state
```

- **演示要点**：演示 next_state 的参数：double, if, return

### next_state（behavior_pincer_fsm）｜状态迁移

- **关键词**：next_state, int, if, return, 状态迁移
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pincer_fsm.txt:222-233`
- **片段**：

```text
      next_state DRAG
         int allOnCap = (int)mCurrentJob.GetData("all_on_cap");
         if (  (allOnCap <= 0) &&
               (mWorstDist < mRunDistance) &&
               (mWorstTrack.IsValid()) &&
               (mWorstTrack.HeadingValid()) &&
               (MATH.Fabs(mWorstTrack.TrueBearingTo(PLATFORM)-mWorstTrack.Heading()) < mRunAngleLimit))
         {
            return true;
         }
         return false;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：int, if, return

### next_state（blue_multirole_fighter_2_task_processor）｜状态迁移

- **关键词**：next_state, if, return, 状态迁移
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:161-165`　（同签名共 61 处，另见 `aea_iads/platforms/iads_cmdr.txt:105`、`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:104`、`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:105`）
- **片段**：

```text
      next_state RETURN_TO_ROUTE
         WsfPlatform target = TRACK.Target();
         if (target.IsValid()) return false;
         return true;
      end_next_state
```

- **演示要点**：演示 next_state 的参数：if, return

### next_state（time_on_target）｜状态迁移

- **关键词**：next_state, double, return, 状态迁移
- **出处**：`fires/time_on_target.txt:94-98`
- **片段**：

```text
      next_state firing
         double timeToLaunch = (TIME_NOW - TRACK.AuxDataDouble("LAUNCH_TIME"));
         writeln("Time to launch ", timeToLaunch);
         return (timeToLaunch < 5.0);
      end_next_state
```

- **演示要点**：演示 next_state 的参数：double, return

### next_state（establish_link_processor）｜状态迁移

- **关键词**：next_state, bool, return, 状态迁移
- **出处**：`space_operations/processors/establish_link_processor.txt:192-196`　（同签名共 3 处，另见 `laser_designator/platforms/uav.txt:178`、`script_demos/script_demo_5.txt:272`）
- **片段**：

```text
      next_state establish
         // automatically transition after delay     
         bool complete = TIME_NOW >= mAcquireTime[TRACK.TrackId()];
         return (complete);
      end_next_state
```

- **演示要点**：演示 next_state 的参数：bool, return

### next_state（establish_link_processor）｜状态迁移

- **关键词**：next_state, if, else, 状态迁移
- **出处**：`space_operations/processors/establish_link_processor.txt:205-217`　（同签名共 9 处，另见 `ship_ad/platforms/naval_sam_tactics.txt:217`、`new_guidance/platforms/naval_ssm_tactics.txt:178`、`ship_ad/platforms/naval_asm_tactics.txt:178`）
- **片段**：

```text
         next_state complete
            WsfComm localComm = LocalComm(TRACK);
            CommLink link = CommLink_Link(localComm);
            WsfComm remoteComm = link.RemoteComm();
            if (remoteComm.IsValid())
            {      
               return (!CommLink_MutuallyLinking(localComm, remoteComm));
            }
            else
            {
               return true;
            }
         end_next_state
```

- **演示要点**：演示 next_state 的参数：if, else

### next_state（flight_lead_filtered_timeline）｜状态迁移

- **关键词**：next_state, foreach, return, 状态迁移
- **出处**：`base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:98-117`
- **片段**：

```text
      next_state BATTLE
         Map<string, bool> shots = Map<string, bool>();
         writeln_d("T=",TIME_NOW,", ", PLATFORM.Name(), " analyzing battle conditions!");
         WsfTaskList list = PROCESSOR.TasksAssignedOfType("TIMELINE");
         foreach(WsfTask task in list)
         {
            #bool roundsFired = task.Assignee().RoundsFiredAt(task.TrackId()) > 0;
            bool roundsFired = task.Assignee().RoundsCompleteFor(WsfTrackId()) > 0;
            writeln_d("   checking assigned task ", task.TrackId().ToString(), " assigned to ", task.AssigneeName(), "fired? ", roundsFired);
            shots[task.AssigneeName()] = roundsFired;
         }
         foreach (string assignee : bool shot in shots)
         {
            if (shot == false)
            {
               return false;
            }
         }
         return (shots.Size() > 0);
      end_next_state
```

- **演示要点**：演示 next_state 的参数：foreach, return

### next_state（soj）｜状态迁移

- **关键词**：next_state, return, 状态迁移
- **出处**：`aea_iads/platforms/soj.txt:363-365`　（同签名共 216 处，另见 `aea_iads/platforms/soj.txt:370`、`aea_iads/platforms/soj.txt:374`、`alv_routing/processors/alv_task_mgr.txt:322`）
- **片段**：

```text
      next_state CAN_JAM
         return ((TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime) && AllowTrack());
      end_next_state
```

- **演示要点**：演示 next_state 的参数：return

### next_state（processor_include）｜状态迁移

- **关键词**：next_state, if, 状态迁移
- **出处**：`multiresolution_demos/processors/processor_include.txt:63-71`　（同签名共 2 处，另见 `multiresolution_demos/processors/processor_include.txt:80`）
- **片段**：

```text
      next_state MOVING
         if (TRACK) {
            targetPoint = TRACK.CurrentLocation();
            writeln("Found tortoise at ", targetPoint);
            return true;
         } else {
            return false;
         }
      end_next_state
```

- **演示要点**：演示 next_state 的参数：if

### next_state（cyber_outpost）｜状态迁移

- **关键词**：next_state, 状态迁移
- **出处**：`cyber/platforms/cyber_outpost.txt:40-42`　（同签名共 2 处，另见 `cyber/platforms/cyber_outpost.txt:57`）
- **片段**：

```text
      next_state END_STATE
         return(TRACK.TimeSinceUpdated()>30);
      end_next_state
```

- **演示要点**：演示 next_state（最小结构，无子参数）

### on_bingo（red_multirole_fighter_2_base）｜

- **关键词**：on_bingo, writeln_d
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:75-77`
- **片段**：

```text
      on_bingo
          writeln_d ("!!! ", PLATFORM.Name(), " on_bingo fuel");
      end_on_bingo
```

- **演示要点**：演示 on_bingo 的参数：writeln_d

### on_empty（red_multirole_fighter_2_base）｜

- **关键词**：on_empty, writeln_d
- **出处**：`base_types/platforms/red_multirole_fighter_2_base.txt:78-80`
- **片段**：

```text
      on_empty
          writeln_d ("!!! ", PLATFORM.Name(), " on_empty fuel");
      end_on_empty
```

- **演示要点**：演示 on_empty 的参数：writeln_d

### on_entry（blue_multirole_fighter_2_task_processor）｜进入状态回调

- **关键词**：on_entry, announce, if, 进入状态回调
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:170-174`
- **片段**：

```text
      on_entry
         announce ("RETURN_TO_ROUTE");
         if (currentTarget != "") deassigned[currentTarget] = true;
         returnToRoute();
      end_on_entry
```

- **演示要点**：演示 on_entry 的参数：announce, if

### on_entry（script_demo_7）｜进入状态回调

- **关键词**：on_entry, if, else, 进入状态回调
- **出处**：`script_demos/script_demo_7.txt:122-134`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pincer_fsm.txt:301`、`timeline/processors/quantum_agents/aiai/behavior_grinder.txt:405`、`timeline/processors/quantum_agents/aiai/behavior_grinder.txt:367`）
- **片段**：

```text
         on_entry
           BeginningAlt = PLATFORM.Altitude();
           WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
           BeginningRange =  PLATFORM.GroundRangeTo(targetTrack);
           if ((BeginningAlt + tolerance) >= HighAlt && (BeginningRange > LowRange))
           {
             SelectPhase("HIGHALT");
           }
           else
           {
              SelectPhase("LOWALT");
           }
         end_on_entry
```

- **演示要点**：演示 on_entry 的参数：if, else

### on_entry（leader_agm）｜进入状态回调

- **关键词**：on_entry, double, if, 进入状态回调
- **出处**：`cyber/weapons/agm/leader_agm.txt:102-127`　（同签名共 4 处，另见 `swarm/weapons/agm/leader_agm.txt:111`、`cyber/weapons/agm/client_agm.txt:115`、`swarm/weapons/agm/client_agm.txt:143`）
- **片段**：

```text
           on_entry
              SetAllowRouteFollowing(true);
              WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
              double CurrentSpeed = PLATFORM.Speed();
              double CurrentAlt   = PLATFORM.Altitude(); # meters above sea level
              double targetRelativeBearing = PLATFORM.RelativeBearingTo(targetTrack);
              double targetTrueBearing = PLATFORM.TrueBearingTo(targetTrack);
              if ((targetRelativeBearing < 15) && (targetRelativeBearing > -15))
              {
                 // Randomly turn away from the target in alt, heading and speed
                 double newspeed = RANDOM.Uniform(LeaderMinVel, LeaderMaxVel);
                 double newalt = RANDOM.Uniform((LeaderCommandedAlt - LeaderMaxAltDeviation),  (LeaderCommandedAlt + LeaderMaxAltDeviation));
                 double newheading = RANDOM.Uniform(0, 360);
                 WsfGeoPoint NewPoint = PLATFORM.Location();
                 NewPoint.Extrapolate(newheading, 5000);
                 WsfRoute NR = WsfRoute.Create("NewRoute");
                 if(newalt > CurrentAlt) // This is to prevent stalling out
                 {
                    newspeed = LeaderMinClimbVel;
                 }
                 SetCommandedAltitude(newalt);
                 NR.Append(NewPoint, newspeed);
                 PLATFORM.SetRoute(NR);

              }
           end_on_entry
```

- **演示要点**：演示 on_entry 的参数：double, if

### on_entry（asm_tactics）｜进入状态回调

- **关键词**：on_entry, double, 进入状态回调
- **出处**：`ship_ad/weapons/agm/asm_tactics.txt:38-42`　（同签名共 7 处，另见 `behavior_tree/processors/quantum_agents/aiai/selector_pincer_fsm.txt:380`、`cyber/weapons/sam/sr_sam.txt:81`、`orwaca_iads/weapons/sam/sr_sam.txt:79`）
- **片段**：

```text
      on_entry
         double heading = PLATFORM.TrueBearingTo(TRACK);
         PLATFORM.TurnToHeading(heading);
         PLATFORM.GoToAltitude(CRUISE_ALT);
      end_on_entry
```

- **演示要点**：演示 on_entry 的参数：double

### on_entry（spotter）｜进入状态回调

- **关键词**：on_entry, if, 进入状态回调
- **出处**：`cyber/platforms/spotter.txt:35-41`　（同签名共 6 处，另见 `outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:112`、`space_operations/processors/establish_link_processor.txt:183`、`base_types/weapons/sam/blue_lr_sam_complex.txt:80`）
- **片段**：

```text
         on_entry
            WsfMessage msg = WsfMessage();
            if (!TRACK.IFF_Friend() && TRACK.TargetType() == "UAV")
            {
              PLATFORM.Comm("datalink").SendMessage(msg, "ground_radar_1", "datalink2");
            }
         end_on_entry
```

- **演示要点**：演示 on_entry 的参数：if

### on_entry（behavior_grinder）｜进入状态回调

- **关键词**：on_entry, for, 进入状态回调
- **出处**：`timeline/processors/quantum_agents/aiai/behavior_grinder.txt:439-452`
- **片段**：

```text
      on_entry
         PLATFORM.Comment("FIRE");
         SendGrinderChangeToPeers("FIRE");
         writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), " firing!");
         for (int i=0; i<mTargets.Size(); i=i+1)
         {
            WsfLocalTrack target = GetMasterTrackByName(PLATFORM, mTargets[i].TargetName());
            if (target.IsValid() && PLATFORM.WeaponsActiveFor(target.TrackId()) < mSalvoSize)
            {
               # TODO make sure target is in range?
               PLATFORM.Weapon(mWeaponName).FireSalvo(target, mSalvoSize);
            }
         }
      end_on_entry
```

- **演示要点**：演示 on_entry 的参数：for

### on_entry（alv）｜进入状态回调

- **关键词**：on_entry, else, 进入状态回调
- **出处**：`alv_routing/platforms/alv.txt:77-95`　（同签名共 2 处，另见 `satellite_demos/scenarios/gps_denied.txt:136`）
- **片段**：

```text
         on_entry
            SetAllowRouteFollowing(true);

            if(PLATFORM.Name().Contains("_1"))
            {
               PLATFORM.SetRoute("bogus_route_1");
               SetCommandedMach(0.90);
#               SetCommandedAltitudeAGL(9000);
               SetMaximumCommandedGees(15);
            }
            else
            {
               PLATFORM.SetRoute("bogus_route_2");
               SetCommandedMach(0.91);
#               SetCommandedAltitudeAGL(9000);
               SetMaximumCommandedGees(15);
            }
            TimeLeft = 5800 - (PLATFORM.TimeSinceCreation()); # give time to get back to target
         end_on_entry
```

- **演示要点**：演示 on_entry 的参数：else

### on_entry（alv）｜进入状态回调

- **关键词**：on_entry, 进入状态回调
- **出处**：`alv_routing/platforms/alv.txt:114-116`　（同签名共 70 处，另见 `ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:314`、`base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:94`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:35`）
- **片段**：

```text
         on_entry
            SetCommandedAltitude(11000);
         end_on_entry
```

- **演示要点**：演示 on_entry（最小结构，无子参数）

### on_exit（behavior_pincer_fsm）｜离开状态回调

- **关键词**：on_exit, if, else, 离开状态回调
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pincer_fsm.txt:316-329`
- **片段**：

```text
      on_exit
         if (mDirection == "right")
         {
            int count = (int)mCurrentJob.GetData("right_drag");
            mCurrentJob.SetData("right_drag",count-1);
            writeln_d(PLATFORM.Name(), " decreased right_drag to: ", count-1);
         }
         else if (mDirection == "left")
         {
            int count = (int)mCurrentJob.GetData("left_drag");
            mCurrentJob.SetData("left_drag",count -1);
            writeln_d(PLATFORM.Name(), " decreased left_drag to: ", count-1);
         }
      end_on_exit
```

- **演示要点**：演示 on_exit 的参数：if, else

### on_exit（strike_controller）｜离开状态回调

- **关键词**：on_exit, bool, if, 离开状态回调
- **出处**：`logistics/processors/strike_controller.txt:76-91`
- **片段**：

```text
      on_exit
         bool failedLeftEngine  = (RANDOM.Uniform() - engineDispatchReliability) > 0.0;
         bool failedRightEngine = (RANDOM.Uniform() - engineDispatchReliability) > 0.0;
         if (failedLeftEngine)
         {
            goodEnginesContainer.Decrement(1.0);
            Say("Inspection failed Left Engine!");
            PLATFORM.Comment("Left Engine Failed Inspection.");
         }
         if (failedRightEngine)
         {
            goodEnginesContainer.Decrement(1.0);
            Say("Inspection failed Right Engine!");
            PLATFORM.Comment("Right Engine Failed Inspection.");
         }
      end_on_exit
```

- **演示要点**：演示 on_exit 的参数：bool, if

### on_exit（leader_agm）｜离开状态回调

- **关键词**：on_exit, if, 离开状态回调
- **出处**：`cyber/weapons/agm/leader_agm.txt:131-142`　（同签名共 2 处，另见 `swarm/weapons/agm/leader_agm.txt:152`）
- **片段**：

```text
           on_exit
               WsfPlatformList SubordinateList = PLATFORM.Subordinates();
               WsfTrack targetTrack = PLATFORM.CurrentTargetTrack();
               if (! SubordinateList.Empty())
               {
                  SelectPhase("ALT_FLY");
               }
               if (PLATFORM.GroundRangeTo(targetTrack) < LeaderNoDeviationRange)
               {
                  SelectPhase("TERMINAL");
               }
           end_on_exit
```

- **演示要点**：演示 on_exit 的参数：if

### on_exit（client_agm）｜离开状态回调

- **关键词**：on_exit, 离开状态回调
- **出处**：`cyber/weapons/agm/client_agm.txt:182-183`　（同签名共 5 处，另见 `space_operations/processors/establish_link_processor.txt:197`、`base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:335`、`behavior_tree/processors/quantum_agents/aiai/selector_pincer_fsm.txt:338`）
- **片段**：

```text
           on_exit
           end_on_exit
```

- **演示要点**：演示 on_exit（最小结构，无子参数）

### on_init（orbit_rules）｜初始化回调(旧式)

- **关键词**：on_init, faz, perception, cap_ind, 初始化回调(旧式)
- **出处**：`air_to_air/rules/orbit_rules.txt:80-117`
- **片段**：

```text
   on_init
      faz = "ingress";
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
      cap_ind = 1;
/*  create 4 CAP points

      CAP1----------->CAP2
       ^              |
       |              |
      CAP4<-----------CAP3

*/
   if (PLATFORM.Zone("cap_zone").IsValid())
   {
      WsfZone capzone = PLATFORM.Zone("cap_zone");
      CAP1 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
      CAP2 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
      CAP3 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
      CAP4 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
   }
   else
   {
      CAP1 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude()); // my current location
      CAP2 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
      CAP3 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
      CAP4 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
   }

   CAP2.Extrapolate(iacid.Heading(),iacid->orbit_leg_length);

#   writeln("latitude space = ",cspd2," ",iacid->orbit_gees," ",grav," ",(2 * cspd2 / (cgees*grav)));
   CAP4.Extrapolate(iacid.Heading()+90.0,(2 * cspd2 / (cgees*grav)));

   CAP3.Extrapolate(iacid.Heading(),iacid->orbit_leg_length);
   CAP3.Extrapolate(iacid.Heading()+90.0,(2 * cspd2 / (cgees*grav)));


   end_on_init
```

- **演示要点**：演示 on_init 的参数：faz, perception, cap_ind

### on_init（intercept_rules）｜初始化回调(旧式)

- **关键词**：on_init, faz, perception, 初始化回调(旧式)
- **出处**：`air_to_air/rules/intercept_rules.txt:73-76`
- **片段**：

```text
   on_init
      faz = "ingress";
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init
```

- **演示要点**：演示 on_init 的参数：faz, perception

### on_init（behavior_alt3111_straight_level_max_speed）｜初始化回调(旧式)

- **关键词**：on_init, if, perception, 初始化回调(旧式)
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3111_straight_level_max_speed.txt:53-60`　（同签名共 22 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt3121_straight_level.txt:53`、`base_types/platforms/brawler/alternatives/behavior_alt3211_route_maneuver.txt:49`、`base_types/platforms/brawler/alternatives/behavior_alt3411_straight_flight.txt:62`）
- **片段**：

```text
   on_init
      if (PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         processor = (WsfQuantumTaskerProcessor)PROCESSOR;
      }
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
      brawlerPlatform = (WsfBrawlerPlatform)PLATFORM;
   end_on_init
```

- **演示要点**：演示 on_init 的参数：if, perception

### on_init（behavior_create_clustering_jobs）｜初始化回调(旧式)

- **关键词**：on_init, if, else, 初始化回调(旧式)
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_create_clustering_jobs.txt:40-52`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aigci/behavior_create_clustering_jobs.txt:40`、`base_types/processors/quantum_agents/aiai/behavior_pursue_fly_route_finder.txt:38`、`base_types/processors/ripr_agents/aiai/behavior_pursue_fly_route_finder.txt:38`）
- **片段**：

```text
   on_init
      cManager = WsfClusterManager.Create(); // creates a cluster manager owned by this script
      cManager.SetClusterMethod(mClusterMethod);
      cManager.SetDistanceLimit(mClusterDistanceLimit);
      if (mNumClusters > 0)
      {
         cManager.SetNumClustersToCreate(mNumClusters);
      }
      else
      {
         cManager.SetDistanceFunction(mDistanceFunction);
      }
   end_on_init
```

- **演示要点**：演示 on_init 的参数：if, else

### on_init（selector_pursue-target_route_finder）｜初始化回调(旧式)

- **关键词**：on_init, extern, for, 初始化回调(旧式)
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_pursue-target_route_finder.txt:36-52`　（同签名共 5 处，另见 `brawler/processors/quantum_agents/behavior_pursue-target_route_finder.txt:35`、`heatmap/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:36`、`route_finder_demos/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:36`）
- **片段**：

```text
   on_init
      mDraw.SetLayer("pursue-target_route_finder");
      mDraw.SetDuration(PROCESSOR.UpdateInterval());
      mDraw.SetLineSize(1);
      //shift starting or ending points outside of any avoidances (dont shrink or ignore the avoidance regions)
      mRouteFinder.SetImpossibleRouteResponse("SHIFT");
      mRouteFinder.SetMaxArcLength(1852*5);   //max of 5 mile long arcs
      extern Array<WsfGeoPoint> gAvoidPoints;
      extern Array<double>      gAvoidRadii;
      for (int i=0; i < gAvoidPoints.Size() && i < gAvoidRadii.Size(); i=i+1)
      {
         WsfGeoPoint pt = gAvoidPoints[i];
         double radius  = gAvoidRadii[i];
         writeln_d(PLATFORM.Name(), " avoiding: ", pt.ToString(), ", at radius: ", radius);
         mRouteFinder.Avoid(pt, radius);
      }
   end_on_init
```

- **演示要点**：演示 on_init 的参数：extern, for

### on_init（route_rules）｜初始化回调(旧式)

- **关键词**：on_init, perception, rte_ind, 初始化回调(旧式)
- **出处**：`air_to_air/rules/route_rules.txt:94-111`
- **片段**：

```text
   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
      PLATFORM->faz = "ingress";
      rte_ind = 0;

// loop through my route points, see which I'm closest to
#      double min_rng = 500.0 * MATH.M_PER_NM();
#      for (int i = 0; i<ROUTE.Size(); i=i+1)
#      {
#         if (iacid.SlantRangeTo(ROUTE[i]) < min_rng)
#         {
#            min_rng = iacid.SlantRangeTo(ROUTE[i]);
#            rte_ind = i; // set the new route index
#         }
#      }
      rte_ind = 0;

   end_on_init
```

- **演示要点**：演示 on_init 的参数：perception, rte_ind

### on_init（rultype_change）｜初始化回调(旧式)

- **关键词**：on_init, perception, 初始化回调(旧式)
- **出处**：`air_to_air/rules/rultype_change.txt:110-112`　（同签名共 27 处，另见 `air_to_air/rules/sam_shoot_it.txt:70`、`air_to_air/rules/select_wpn.txt:84`、`air_to_air/rules/shoot_it.txt:77`）
- **片段**：

```text
   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init
```

- **演示要点**：演示 on_init 的参数：perception

### on_init（behavior_pilot_posture）｜初始化回调(旧式)

- **关键词**：on_init, processor, 初始化回调(旧式)
- **出处**：`brawler/platforms/alternatives/behavior_pilot_posture.txt:24-28`
- **片段**：

```text
   on_init

      #brawlerPlatform = (WsfBrawlerPlatform)PLATFORM;
      processor = (WsfBrawlerProcessor)PROCESSOR;
   end_on_init
```

- **演示要点**：演示 on_init 的参数：processor

### on_init（behavior_weapon_decision_missile）｜初始化回调(旧式)

- **关键词**：on_init, if, 初始化回调(旧式)
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:63-68`　（同签名共 27 处，另见 `base_types/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:123`、`base_types/processors/quantum_agents/aiai/behavior_search.txt:26`、`base_types/processors/quantum_agents/aiai/behavior_search_pursuit.txt:34`）
- **片段**：

```text
   on_init
      if (PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         processor = (WsfQuantumTaskerProcessor)PROCESSOR;
      }
   end_on_init
```

- **演示要点**：演示 on_init 的参数：if

### on_init（behavior_pursue-target_pathing）｜初始化回调(旧式)

- **关键词**：on_init, extern, 初始化回调(旧式)
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target_pathing.txt:87-93`
- **片段**：

```text
   on_init
      extern double GetWeaponRangeMax (WsfPlatform, Array<Map<string, Object>>);
      extern double GetWeaponRangeMin (WsfPlatform, Array<Map<string, Object>>);
      extern Array<Map<string, Object>> mWeaponArray;
      ownshipEngagementRangeMin = GetWeaponRangeMin(PLATFORM, mWeaponArray);
      ownshipEngagementRangeMax = GetWeaponRangeMax(PLATFORM, mWeaponArray);
   end_on_init
```

- **演示要点**：演示 on_init 的参数：extern

### on_init（behavior_create_flank_jobs）｜初始化回调(旧式)

- **关键词**：on_init, double, 初始化回调(旧式)
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_create_flank_jobs.txt:40-52`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aigci/behavior_create_flank_jobs.txt:40`）
- **片段**：

```text
   on_init
      double FlankDistanceMeters = cFLANK_DISTANCE * MATH.M_PER_NM();
      //create simple bowtie shape, based on specified size parameters
      double w1 = 2.0  * FlankDistanceMeters; //Bow Tie Width (meters)
      double h2 = 0.75 * FlankDistanceMeters; //Bow Tie Outter Thickness (meters)
      double h1 = 0.5  * h2;                  //Bow Tie Inner Thickness (meters)
      mBowTieZonePoints.PushBack(Vec3.Construct(  h1,   0, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct(  h2,  w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h2,  w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h1,   0, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h2, -w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct(  h2, -w1, 0));
   end_on_init
```

- **演示要点**：演示 on_init 的参数：double

### on_init（behavior_debug_job_board）｜初始化回调(旧式)

- **关键词**：on_init, 初始化回调(旧式)
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_debug_job_board.txt:22-23`　（同签名共 44 处，另见 `base_types/processors/quantum_agents/aiai/behavior_draw_master_track_list.txt:19`、`base_types/processors/ripr_agents/aiai/behavior_debug_job_board.txt:22`、`base_types/processors/ripr_agents/aiai/behavior_draw_master_track_list.txt:19`）
- **片段**：

```text
   on_init
   end_on_init
```

- **演示要点**：演示 on_init（最小结构，无子参数）

### on_initialize（assessment_scripts）｜初始化回调

- **关键词**：on_initialize, n_pump, first_pass, faz, attack_success, faz_desired, change_desired, react, evd_msl, p_snip, p_pump, pump_per, pr_speed, 初始化回调
- **出处**：`air_to_air/processors/assessment_scripts.txt:491-530`
- **片段**：

```text
      on_initialize 
         //Brawler RULES variables
         //set at initialization
         // number of times I have pumped
         n_pump = 0;
         // true if this is my first pass (haven't pumped)       
         first_pass = true; 
         // init to ingress
         faz = "ingress";  
         // true if my mission is complete
         attack_success = false; 
         // init to ingress
         faz_desired = "ingress"; 
         // set to true if I desire to change phase
         change_desired = false; 

         // initialize maneuver variables w/ some variation
         PLATFORM->REACT_RNG = MATH.RandomGaussian(PLATFORM->REACT_RNG,PLATFORM->EXEC_VAR/2);
         PLATFORM->DOR = MATH.RandomGaussian(PLATFORM->DOR,PLATFORM->EXEC_VAR/2);
         // determine if I will perform pre-planned maneuver
         react = MATH.RandomUniform() < iacid->PRE_PLAN; 
         // determine if I will evade a weapon  
         evd_msl = MATH.RandomUniform() < iacid->PMSL_EVD;
         // determine if I am willing to snip a weapon 
         p_snip = MATH.RandomUniform() < iacid->RISK_WPN;
         // determine if I am willing to pump/turn cold
         p_pump = MATH.RandomUniform() < iacid->RISK_AVRS;
         pump_per = iacid->p_pump;
         write(iacid.Name()," Agressiveness: ",100*(1-iacid->RISK_AVRS),"% p_pump: ",p_pump," p_snip: ",p_snip,"\n");
         // init to commit speed & altitude (PRDATA)
         pr_speed = iacid->COMMIT_SPD*atmos.SonicVelocity(iacid.Altitude());
         pr_altitude = iacid.Altitude();
         // initialize vector heading to current heading
         pr_heading = iacid.Heading();
         // init to PRDATA start type
         rule_type = iacid->START_TYPE;
         RuleReason = "START TYPE";
         flt_lead = false; // true if I am the flight lead
         reason = "";      
      end_on_initialize  
```

- **演示要点**：演示 on_initialize 的参数：n_pump, first_pass, faz, attack_success, faz_desired, change_desired, react, evd_msl, p_snip, p_pump

### on_initialize（detector）｜初始化回调

- **关键词**：on_initialize, double, latitude, longitude, altitude, heading, 初始化回调
- **出处**：`comm/platforms/detector.txt:41-55`
- **片段**：

```text
   on_initialize
      double latitude = 40;
      double longitude = -100;
      double altitude = 2000;
      double heading = 0;
      
      latitude = latitude + RANDOM.Uniform(-1, 1);
      longitude = longitude + RANDOM.Uniform(-1, 1);
      altitude = altitude + RANDOM.Uniform(-2000, 2000);
      heading = RANDOM.Uniform(0, 359);
      
      PLATFORM.SetLocation(latitude, longitude, altitude);
      PLATFORM.SetHeading(heading);
      PLATFORM.SetRoute("detector_route");
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：double, latitude, longitude, altitude, heading

### on_initialize（esm_detect_multi_beam_radar）｜初始化回调

- **关键词**：on_initialize, string, outstr, if, header, 初始化回调
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:279-294`　（同签名共 4 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:385`、`aea_iads/track_writes.txt:40`、`aea_iads/report_writes.txt:36`）
- **片段**：

```text
on_initialize
   string header;
   string outstr;

   outstr = write_str(mTrackFileName, "_", WsfSimulation.RunNumber(), ".dat");
   if (! mTrackFile.Open(outstr, "out"))
   {
      writeln("Could not open file: ", outstr);
   }
   header = write_str("Time(sec),ObserverCallbackType,PlatformName,TrackStartTime(sec),SensorName,TargetName,TargetType");
   mTrackFile.Writeln(header);

   #Fill in platform names of interest
   mPlatformNames.Clear();
   mPlatformNames.Insert("esm_platform");
end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：string, outstr, if, header

### on_initialize（ldt_designator_only）｜初始化回调

- **关键词**：on_initialize, ok, if, else, 初始化回调
- **出处**：`hellfire/laser_designation_via_dis/ldt_designator_only.txt:80-92`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/ldt_three_platforms_combined.txt:81`、`hellfire/semiactive_laser_hellfire/ldt_combined_test.txt:122`）
- **片段**：

```text
   on_initialize
      mySensor = Sensor("laser_designator");
      ok = mySensor.IsValid();
      if (ok)
      {
         mySensor.TurnOn();
      }
      else if (! errorPrinted)
      {
         writeln("ERROR:  Sensor of specified name not found.");
         errorPrinted = true;
      }
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：ok, if, else

### on_initialize（gci_quantum_tasker）｜初始化回调

- **关键词**：on_initialize, if, else, 初始化回调
- **出处**：`base_types/processors/quantum_agents/aigci/gci_quantum_tasker.txt:37-49`　（同签名共 3 处，另见 `timeline/processors/quantum_agents/aigci/gci_quantum_tasker.txt:39`、`base_types/processors/ep_operations.txt:38`）
- **片段**：

```text
      on_initialize
         cManager = WsfClusterManager.Create(); // creates a cluster manager owned by this script
         cManager.SetClusterMethod(mClusterMethod);
         cManager.SetDistanceLimit(mClusterDistanceLimit);
         if (mNumClusters > 0)
         {
            cManager.SetNumClustersToCreate(mNumClusters);
         }
         else
         {
            cManager.SetDistanceFunction(mDistanceFunction);
         }
      end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：if, else

### on_initialize（detection_writes）｜初始化回调

- **关键词**：on_initialize, if, string, 初始化回调
- **出处**：`aea_iads/detection_writes.txt:18-31`
- **片段**：

```text
on_initialize
   if (! mSensorDetectFile.Open(mSensorFileName, "out"))
   {
      writeln("Could not open file: ", mSensorFileName);
   }
   string header = write_str("Time(sec),ObserverCallbackType,PlatformName,TrackStartTime(sec),SensorName,TargetName");
   mSensorDetectFile.Writeln(header);

   #Fill in platform names of interest
   mPlatformTypes.Clear();
   mPlatformTypes.Insert("EW_RADAR");
   mPlatformTypes.Insert("ACQ_RADAR");
   mPlatformTypes.Insert("TTR_RADAR");
end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：if, string

### on_initialize（hel_test）｜初始化回调

- **关键词**：on_initialize, weapon_system, 初始化回调
- **出处**：`hel/hel_test.txt:61-63`　（同签名共 3 处，另见 `hel/intersect_mesh_test.txt:72`、`hel/intersect_mesh_test_beam_director.txt:82`）
- **片段**：

```text
   on_initialize
      weapon_system = (WsfLaserWeapon)PLATFORM.Weapon(weapon_name);
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：weapon_system

### on_initialize（launch_weapon_processor）｜初始化回调

- **关键词**：on_initialize, if, 初始化回调
- **出处**：`ballistic/processors/launch_weapon_processor.txt:27-31`　（同签名共 10 处，另见 `ballistic_missile_shootdown/processors/launch_ssm_processor.txt:27`、`orwaca_iads/processors/launch_tbm_processor.txt:20`、`terrain_following/terrain_demo.txt:86`）
- **片段**：

```text
   on_initialize
      // This will overide any static set launch time...
      if (LAUNCH_RANDOM == 1)
          TIME_TO_LAUNCH = RANDOM.Uniform(MIN_TIME, MAX_TIME);
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：if

### on_initialize（ssm_base）｜初始化回调

- **关键词**：on_initialize, extern, 初始化回调
- **出处**：`signature_demos/movers/ssm_base.txt:134-138`
- **片段**：

```text
   on_initialize
      extern int gShotCount;
      gShotCount = gShotCount + 1;
      mShotNumber = gShotCount;
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：extern

### on_initialize（aiss_processor）｜初始化回调

- **关键词**：on_initialize, for, 初始化回调
- **出处**：`base_types/processors/ripr_agents/aiss/aiss_processor.txt:80-92`
- **片段**：

```text
   on_initialize

      SetNumJobChannels( mMaxJobChannels );
      writeln_d("AISS on_init - Starting multi channel guy ", PLATFORM.Name(), " with ", GetNumJobChannels(), " total job channels" );

      for (int i = 0; i < GetNumJobChannels(); i = i + 1)
      {
         mChannelJobs.PushBack( -1 );

         WsfTrackId tempTrackId = WsfTrackId();
         mChannelTracks.PushBack( tempTrackId );
      }
   end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：for

### on_initialize（struct_test）｜初始化回调

- **关键词**：on_initialize, struct, 初始化回调
- **出处**：`outer_air_battle/struct_test.txt:27-50`
- **片段**：

```text
      on_initialize
         // Create a new instance of the struct
         struct car = struct.New("Car");

         // Print the contents of the struct
         writeln(car);

         // Assign to a variable on the instance
         car->color = "blue";

         // Call a script
         car->Honk();

         // Add a new variable to the instance
         car->make = "Ford";

         // The '->' operator isn't checked until it's executed
         // So variables can be added at runtime.
         writeln("Car Make: ", car->make);

         // However, the script compiler won't know if you use the wrong name
         writeln("This will produce an error", car->Not_A_Variable);

      end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：struct

### on_initialize（aifl_processor.old）｜初始化回调

- **关键词**：on_initialize, foreach, 初始化回调
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:808-833`
- **片段**：

```text
  on_initialize

     SetJobAllocationMode(0);    #spread (Default -- every subordinate is given the highest priority job that he has the highest bid for. If there are more subordinates than jobs, some subordinates will be left idle. )
    #SetJobAllocationMode(1);    #greedy (Every subordinate is given the job he bids highest on with the highest priority, without regard for the maximum number of winners that the job allows. Every subordinate will get a job. (Disregards Job Stickiness value) )
    #SetJobAllocationMode(2);    #coverthengreedy (Like spread, but remaining unassigned subordinates will be given the job they bid highest on with the highest priority, even if that results in the job having more winners that the maximum specified. )
    #SetJobAllocationMode(3);    #coverthenspread (Like spread, but remaining unassigned subordinates will be spread out over the pool of jobs with no job getting two extra winners before all jobs have one extra winner. )
    #SetJobAllocationMode(4);    #strictpriority (Like spread, awards the highest priority job to the highest bidder regardless of the bidder's highest overall bid. )

    #SetJobStickiness(mJobStickiness);

    Array<WsfZone> zoneList = PLATFORM.Zones();
    foreach (WsfZone z in zoneList)
    {
       mZoneNames.PushBack(z.Name());
    }
    foreach( string x in mZoneNames )
    {
      writeln_d("~~~ Flight Lead ", PLATFORM.Name(), " now monitoring retrieved zone: ", x );
    }

    if( mZoneNames.Size() == 0 )
    {
      writeln_d( "~~~ Flight Lead ", PLATFORM.Name(), " has no zone defined." );
    }

  end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：foreach

### on_initialize（aigci_processor.old）｜初始化回调

- **关键词**：on_initialize, double, 初始化回调
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:760-804`
- **片段**：

```text
   on_initialize

      cManager = WsfClusterManager.Create();               // creates a cluster manager owned by this script
      cManager.SetClusterMethod("H_TREE_MAX");             // default is: "K_MEANS"
      cManager.SetDistanceFunction("POSITION_VELOCITY");   // default is: "POSITION_ONLY"
    //cManager.SetDistanceLimit(46300);                    // ~25 nautical miles
      cManager.SetDistanceLimit(92600);                    // ~50 nautical miles
    //cManager.SetDistanceLimit(185200);                   // ~100 nautical miles

      mJobToWinnerMap    = Map<int, int>();
      mFlankToClusterMap = Map<int, int>();
      mClusterToFlankMap = Map<int, int>();
      mCompletedFlanks   = Array<string>();
      mZoneJobMap        = Map<string, WsfRIPRJob>();
      mFlankNameToTimeCompleteMap = Map<string, double>();

    Array<WsfZone> zoneList = PLATFORM.Zones();
    foreach( WsfZone z in zoneList)
    {
       mZoneNames.PushBack(z.Name());
    }

    foreach( string x in mZoneNames )
    {
      writeln_d("~~~ GCI now monitoring retrived zone: ", x );
    }

      if( mZoneNames.Size() == 0 )
      {
      writeln_d( "~~~ No GCI zones defined, using Dynamic Clustering!" );
      }

      double FlankDistanceMeters = cFLANK_DISTANCE * MATH.M_PER_NM();
      //create simple bowtie shape, based on specified size parameters
      double w1 = 2.0  * FlankDistanceMeters; //Bow Tie Width (meters)
      double h2 = 0.75 * FlankDistanceMeters; //Bow Tie Outter Thickness (meters)
      double h1 = 0.5  * h2;                  //Bow Tie Inner Thickness (meters)
      mBowTieZonePoints.PushBack(Vec3.Construct(  h1,   0, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct(  h2,  w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h2,  w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h1,   0, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct( -h2, -w1, 0));
      mBowTieZonePoints.PushBack(Vec3.Construct(  h2, -w1, 0));

  end_on_initialize
```

- **演示要点**：演示 on_initialize 的参数：double

### on_initialize（brawler_flight_lead）｜初始化回调

- **关键词**：on_initialize, 初始化回调
- **出处**：`base_types/platforms/brawler/brawler_flight_lead.txt:57-58`　（同签名共 96 处，另见 `base_types/processors/rcs_display_mgr.txt:28`、`base_types/processors/ripr_agents/aisc/aisc_passthru_processor.txt:21`、`brawler/platforms/brawler_flight_lead.txt:64`）
- **片段**：

```text
      on_initialize
      end_on_initialize
```

- **演示要点**：演示 on_initialize（最小结构，无子参数）

### on_initialize2（strike_platform）｜二次初始化回调

- **关键词**：on_initialize2, bool, if, else, 二次初始化回调
- **出处**：`logistics/platforms/strike_platform.txt:117-129`　（同签名共 6 处，另见 `logistics/platforms/stationary_storage_depot.txt:26`、`logistics/platforms/ocean_going_tanker.txt:101`、`logistics/platforms/semi_tanker_truck.txt:92`）
- **片段**：

```text
   on_initialize2

      bool success = SP_Init();
      if (success)
      {
         Say("STRIKE_PLATFORM Initialize() succeeded.");
      }
      else
      {
         Say("STRIKE_PLATFORM Initialize() FAILED.");
      }

   end_on_initialize2
```

- **演示要点**：演示 on_initialize2 的参数：bool, if, else

### on_initialize2（3d_route_finder）｜二次初始化回调

- **关键词**：on_initialize2, double, for, if, 二次初始化回调
- **出处**：`route_finder_demos/3d_route_finder.txt:111-184`
- **片段**：

```text
   on_initialize2
      mDraw.SetLineSize(1);
      mDraw.SetLineStyle("solid");
      mDraw.SetDuration(WsfSimulation.EndTime());
      mDraw.SetId("3D_ROUTER");
      mDraw.SetEllipseMode("line");

      mFinder.SetImpossibleRouteResponse("SHIFT");
      mFinder.SetMaxArcLength(4000); //a little over 2 nm (in meters)
      WsfGeoPoint src = PLATFORM.Location();
      WsfGeoPoint tgt = WsfSimulation.FindPlatform(mTargetPlatform).Location();

      #setup avoidances
      for(int i=0; i < WsfSimulation.PlatformCount(); i+=1)
      {
         WsfPlatform avoid = WsfSimulation.PlatformEntry(i);
         if (avoid.Type() == mAvoidPlatformType)
         {
            Draw3dSamAvoidance(avoid.Location());
            mAvoids.PushBack(avoid.Location());
         }
      }


      WsfRoute shortestRoute;
      double shortestRouteLength = MATH.DOUBLE_MAX();

      double altIncrement = 1000 * MATH.M_PER_FT();

      WsfGeoPoint beg = WsfGeoPoint(src);
      WsfGeoPoint end = WsfGeoPoint(tgt);

      for (double alt = mAltCeiling; alt >= mAltFloor; alt -= altIncrement)
      {
         mFinder.ClearAvoidances();
         double SamRadiusAtAlt = alt * mRadiusPerAltitude;
         foreach(WsfGeoPoint avoid in mAvoids)
         {
            mFinder.Avoid(avoid, SamRadiusAtAlt);
         }

         #adjust start and end altitudes for current route
         beg.SetAltitudeAGL(alt);
         end.SetAltitudeAGL(alt);
         WsfRoute path = mFinder.Route(TIME_NOW, beg, end, 250); #(250 met/sec ~500 knots)

         #ignore routes that go so low, there is nothing to avoid (for now)
         if (path.Size() > 2)
         {
            #set altitudes of beginning and end points back to original
            beg = path.Front().Location();
            beg.SetAltitudeAGL(src.Altitude());
            path.Front().SetLocation(beg);
            end = path.Back().Location();
            end.SetAltitudeAGL(tgt.Altitude());
            path.Back().SetLocation(end);

            DrawRoute(path);

            double currentRouteLength = RouteLength3d(path);
            if (currentRouteLength < shortestRouteLength)
            {
               shortestRouteLength = currentRouteLength;
               shortestRoute = path;
            }
         }
      }

      if (shortestRoute.IsValid())
      {
         PLATFORM.SetRoute(shortestRoute);
      }

   end_on_initialize2
```

- **演示要点**：演示 on_initialize2 的参数：double, for, if

### on_initialize2（chaff_example_ttr）｜二次初始化回调

- **关键词**：on_initialize2, string, if, 二次初始化回调
- **出处**：`chaff/chaff_example_ttr.txt:13-19`　（同签名共 2 处，另见 `chaff/chaff_example.txt:14`）
- **片段**：

```text
   on_initialize2
      string domain = WsfSimulation.FindPlatform("blue_airlifter_jet").SpatialDomain();
      if (SpatialDomain() != domain)
      {
         writeln("-FAIL- Platform: ", Name(), "; unexpected spatial domain: ", SpatialDomain(), ", expected: ", domain);
      }
   end_on_initialize2
```

- **演示要点**：演示 on_initialize2 的参数：string, if

### on_initialize2（grid_react_man）｜二次初始化回调

- **关键词**：on_initialize2, target, 二次初始化回调
- **出处**：`engage/grid_react_man.txt:175-177`
- **片段**：

```text
   on_initialize2
      target = PLATFORM.Index();
   end_on_initialize2
```

- **演示要点**：演示 on_initialize2 的参数：target

### on_initialize2（ucav_weapon_release）｜二次初始化回调

- **关键词**：on_initialize2, for, 二次初始化回调
- **出处**：`alternate_locations/processors/ucav_weapon_release.txt:19-24`　（同签名共 3 处，另见 `cyber/processors/uav_weapon_release.txt:20`、`space_operations/processors/linkable_targets_processor.txt:26`）
- **片段**：

```text
   on_initialize2 
      for (int i = 0; i < PLATFORM.MasterTrackList().Count(); i = i + 1)
      {
         tgt_engaged[i] = false;
      }
   end_on_initialize2
```

- **演示要点**：演示 on_initialize2 的参数：for

### on_initialize2（missile_seeker）｜二次初始化回调

- **关键词**：on_initialize2, 二次初始化回调
- **出处**：`p6dof/processors/missile_seeker.txt:20-21`　（同签名共 20 处，另见 `six_dof/processors/missile_seeker.txt:20`、`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:755`、`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:802`）
- **片段**：

```text
   on_initialize2
   end_on_initialize2
```

- **演示要点**：演示 on_initialize2（最小结构，无子参数）

### on_message（processor_include）｜消息回调

- **关键词**：on_message, default, script, 消息回调
- **出处**：`multiresolution_demos/processors/processor_include.txt:19-24`　（同签名共 5 处，另见 `multiresolution_demos/processors/processor_include.txt:33`、`space_operations/platforms/commander.txt:13`、`space_operations/platforms/commander.txt:74`）
- **片段**：

```text
         on_message
            default
            script
               writeln(PLATFORM.Name(), " received low fidelity message from ", MESSAGE.Originator(), " with tag ", MESSAGE.DataTag());
            end_script
         end_on_message
```

- **演示要点**：演示 on_message 的参数：default, script

### on_message（group_comm_example）｜消息回调

- **关键词**：on_message, type, script, 消息回调
- **出处**：`comm/group_comm_example.txt:32-41`　（同签名共 4 处，另见 `draw/draw_demo.txt:118`、`space_operations/processors/image_proc.txt:18`、`engage/targets/reactive_maneuvers_processor_basic.txt:27`）
- **片段**：

```text
   on_message
      type WSF_TRACK_MESSAGE
      script
         WsfTrackMessage tmsg = (WsfTrackMessage)MESSAGE;
         if(tmsg.Originator() != PLATFORM.Name())
         {
            print("T=",TIME_NOW," P=",PLATFORM.Name(),"  Track ",tmsg.Track().TargetName()," received from ",tmsg.Originator());
         }
      end_script
   end_on_message
```

- **演示要点**：演示 on_message 的参数：type, script

### on_message（blue_multirole_fighter_2_task_processor）｜消息回调

- **关键词**：on_message, type, default, 消息回调
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:26-63`　（同签名共 3 处，另见 `p6dof/processors/missile_seeker.txt:40`、`six_dof/processors/missile_seeker.txt:40`）
- **片段**：

```text
   on_message
      type WSF_STATUS_MESSAGE
         script
         end_script
      type WSF_TRACK_MESSAGE
         script
         end_script
      type WSF_TASK_ASSIGN_MESSAGE
         script
#            writeln("");
#            writeln(PLATFORM.Name(), " received a task assign message at time ", TIME_NOW);
#            WsfTaskAssignMessage TAmsg = (WsfTaskAssignMessage)MESSAGE;
#
#            writeln(" the assigner is      ", TAmsg.AssignerName());
#            writeln(" the task type is     ", TAmsg.TaskType());
#            writeln(" the resource name is ", TAmsg.ResourceName());
#
#            WsfTrack tempTrack = TAmsg.Track();
#            writeln(" the target is        ", tempTrack.TargetName());
#            writeln(" the track ID is      ", tempTrack.TrackId().ToString());

         end_script
      type WSF_TASK_CANCEL_MESSAGE
         script
            # Note: the track ID is from the commander, so I can't use it to find the track!
            # to add insult to injury, the task is now cancelled, so I don't have any received tasks!
            # my approach is to use a map to record what is deassigned, and to look for
            # that value in the state machine.
            # this assumes that I only have one current target at a time.
            deassigned[currentTarget] = true;
            currentTarget = "";
         end_script
      default
         script
#            writeln(PLATFORM.Name(), " received a ", MESSAGE.Type(), " from ", MESSAGE.Originator());
#            writeln("");
         end_script
   end_on_message
```

- **演示要点**：演示 on_message 的参数：type, default

### on_message（launch_facility_telemetry）｜消息回调

- **关键词**：on_message, script, 消息回调
- **出处**：`space_operations/platforms/launch_facility_telemetry.txt:20-24`　（同签名共 4 处，另见 `space_operations/platforms/intercept_radar.txt:32`、`space_operations/platforms/interceptor.txt:28`、`example_scripts/output_file_demo.txt:71`）
- **片段**：

```text
      on_message
         script
            PLATFORM.Comment("Receiving telemetry data");
         end_script
      end_on_message
```

- **演示要点**：演示 on_message 的参数：script

### on_message（black_van）｜消息回调

- **关键词**：on_message, type, 消息回调
- **出处**：`comm/platforms/black_van.txt:16-21`　（同签名共 24 处，另见 `sensor_demos/scanning_eoir.txt:43`、`electronic_warfare/comm_jamming.txt:172`、`space_operations/scenarios/sat_sensor_constellation.txt:13`）
- **片段**：

```text
      on_message
         type WSF_TRACK_MESSAGE
            script
               writeln(PLATFORM.Name(), " RECEIVES TRACK AT TIME: ", TIME_NOW);
            end_script
      end_on_message
```

- **演示要点**：演示 on_message 的参数：type

### on_message（xio_setup）｜消息回调

- **关键词**：on_message, default, 消息回调
- **出处**：`distributed_operations/xio_setup.txt:40-47`
- **片段**：

```text
      on_message
        default
           script  # Writes all received message to output
              writeln("T=", TIME_NOW, " ", PLATFORM.Name(),
                      " Received ", MESSAGE.Type(), " from ",
                      MESSAGE.Originator());
           end_script
      end_on_message
```

- **演示要点**：演示 on_message 的参数：default

### on_message · WSF_CONTROL_MESSAGE｜消息回调

- **关键词**：on_message, WSF_CONTROL_MESSAGE, script, 消息回调
- **出处**：`space_operations/processors/establish_link_processor.txt:75-112`
- **片段**：

```text
   on_message type WSF_CONTROL_MESSAGE
      script
         WsfControlMessage msg = (WsfControlMessage)(MESSAGE);
         Array<string> platformComm = msg.Function().Split();
         WsfPlatform target = WsfSimulation.FindPlatform(platformComm[0]);
         
         if (target.IsValid())
         {
            WsfComm comm = SelectComm(target);
            
            if (comm.IsValid())  // A comm was found.
            {
               CommLink link = CommLink_Link(comm);
               
               writeln_d(" found comm " , PLATFORM.Name(), ":", comm.Name()); 
               
               // Attempt to acquire the link.  The link.Linked() flag will return true until link.Free() is called.  
               if (link.Acquire(target.Name(), platformComm[1]))
               {
                  string comment = "CONNECTION_ATTEMPT " + PLATFORM.Name() + ":" + comm.Name() + " to " + target.Name() + ":" + platformComm[1];
                  PLATFORM.Comment(comment);
                  WsfTrack targetTrack = CommLink_LinkableTargets(comm)[target.Name()];
                  targetTrack.SetAuxData("local_comm", comm.Name());
               
                  // The following will kick off a task assignment to acquire the remote comm;
                  // there is no need to explicitly call AssignTask.
                  WsfTrackProcessor trackProc = (WsfTrackProcessor)(PLATFORM.Processor(mTrackProcessorName));
                  WsfLocalTrack lt = trackProc.TrackManager().AddTrackReport(targetTrack);  // track must be in the track list
               }
               else
               {
                  string comment = "CONNECTION_ATTEMPT_FAILED " + PLATFORM.Name() + ":" + comm.Name() + " to " + target.Name() + ":" + platformComm[1];
                  PLATFORM.Comment(comment);
               }
            }
         }
      end_script
   end_on_message
```

- **演示要点**：演示 WSF_CONTROL_MESSAGE 的参数：script

### on_new_execute（orbit_rules）｜

- **关键词**：on_new_execute, cap_ind, if, else
- **出处**：`air_to_air/rules/orbit_rules.txt:119-153`
- **片段**：

```text
   on_new_execute 
      cap_ind = 1;
/*  create 4 CAP points

      CAP1----------->CAP2
       ^              |
       |              |
      CAP4<-----------CAP3

*/
      if (PLATFORM.Zone("cap_zone").IsValid())
      {
         WsfZone capzone = PLATFORM.Zone("cap_zone");
         CAP1 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
         CAP2 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
         CAP3 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
         CAP4 = WsfGeoPoint.Construct(capzone.Location().Latitude(),capzone.Location().Longitude(),30000*MATH.M_PER_FT());
      }
      else
      {
         CAP1 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude()); // my current location
         CAP2 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
         CAP3 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
         CAP4 = WsfGeoPoint.Construct(iacid.Latitude(),iacid.Longitude(),iacid.Altitude());
      }
   
      CAP2.Extrapolate(iacid.Heading(),iacid->orbit_leg_length);
   
#      writeln("latitude space = ",cspd2," ",iacid->orbit_gees," ",grav," ",(2 * cspd2 / (cgees*grav)));
      CAP4.Extrapolate(iacid.Heading()+90.0,(2 * cspd2 / (cgees*grav)));
   
      CAP3.Extrapolate(iacid.Heading(),iacid->orbit_leg_length);
      CAP3.Extrapolate(iacid.Heading()+90.0,(2 * cspd2 / (cgees*grav)));
   
   end_on_new_execute
```

- **演示要点**：演示 on_new_execute 的参数：cap_ind, if, else

### on_new_execute（route_rules）｜

- **关键词**：on_new_execute, double, for
- **出处**：`air_to_air/rules/route_rules.txt:113-124`
- **片段**：

```text
   on_new_execute 
      // loop through my route points, see which I'm closest to
      double min_rng = 500.0 * MATH.M_PER_NM();
      for (int i = 0; i<ROUTE.Size(); i=i+1)
      {
         if (iacid.SlantRangeTo(ROUTE[i]) < min_rng)
         {
            min_rng = iacid.SlantRangeTo(ROUTE[i]);
            rte_ind = i; // set the new route index
         }
      }
   end_on_new_execute
```

- **演示要点**：演示 on_new_execute 的参数：double, for

### on_new_execute（merge）｜

- **关键词**：on_new_execute
- **出处**：`air_to_air/rules/merge.txt:62-64`　（同签名共 13 处，另见 `base_types/processors/timeline_agents/behavior_evade.txt:259`、`base_types/processors/timeline_agents/behavior_go_home.txt:189`、`base_types/processors/timeline_agents/behavior_planned_route.txt:55`）
- **片段**：

```text
   on_new_execute 
      PLATFORM->solo_orig = solo; // record the original solo value
   end_on_new_execute
```

- **演示要点**：演示 on_new_execute（最小结构，无子参数）

### on_new_fail（merge）｜

- **关键词**：on_new_fail, solo
- **出处**：`air_to_air/rules/merge.txt:65-67`
- **片段**：

```text
   on_new_fail 
      solo = PLATFORM->solo_orig; // if not in merge anymore, reset solo to the original value
   end_on_new_fail
```

- **演示要点**：演示 on_new_fail 的参数：solo

### on_new_fail（behavior_timeline_reposition）｜

- **关键词**：on_new_fail
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_reposition.txt:35-37`
- **片段**：

```text
   on_new_fail
      mRepositioning = false;
   end_on_new_fail
```

- **演示要点**：演示 on_new_fail（最小结构，无子参数）

### on_track_drop（sensor_cue_processor）｜航迹丢失回调

- **关键词**：on_track_drop, if, 航迹丢失回调
- **出处**：`air_to_air/processors/sensor_cue_processor.txt:54-58`　（同签名共 2 处，另见 `outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:84`）
- **片段**：

```text
   on_track_drop
      mCuedSensor.StopTracking(TRACK.TrackId());
      writeln_d("T=", TIME_NOW, " - ", PLATFORM.Name(), " dropped track for: ", TRACK.TargetName());
      if (mCuedSensor.ActiveRequestCount(mTrackModeName) <= 0) { mCuedSensor.CueToRelativeAzEl(0.0, -3.0); }   // platform flies at 3 deg AoA at all times
   end_on_track_drop
```

- **演示要点**：演示 on_track_drop 的参数：if

### on_track_drop（anti_ballistic_missile_processor）｜航迹丢失回调

- **关键词**：on_track_drop, 航迹丢失回调
- **出处**：`space_operations/processors/anti_ballistic_missile_processor.txt:35-37`　（同签名共 2 处，另见 `ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:53`）
- **片段**：

```text
   on_track_drop
     LaunchFutureTimeMap.Erase(TRACK.TrackId()); # Get rid of the time to launch since we dont have a track anymore.
   end_on_track_drop
```

- **演示要点**：演示 on_track_drop（最小结构，无子参数）

### on_update（aijam_processor）｜更新回调

- **关键词**：on_update, double, string, if, comment, time1, time2, time3, time4, foreach, for, 更新回调
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:743-855`
- **片段**：

```text
  on_update

    double duration = 0.0;
    double lStartTime = GetWallClockTime();

    string comment = "num tracks: " + (string)PLATFORM.MasterTrackList().Count();
    //PLATFORM.Comment(comment);

    WsfRIPRProcessor cmdr = GetRIPRCommanderProcessor();
    if (!cmdr.IsValid())
    {
      return;
    }

    Array<WsfRIPRJob> jobs = cmdr.GetJobs();

    comment = "num jobs: " + (string)jobs.Size();
    //PLATFORM.Comment(comment);

    writeln_d("--- on_update Platform: ", PLATFORM.Name(), ",  num jobs: ", jobs.Size(),
              ",  num channels: ", GetNumJobChannels());

    time1 = 0.0;
    time2 = 0.0;
    time3 = 0.0;
    time4 = 0.0;

    //do pruning at the highest level possible, check for jammers and the roll angle first

    if (mChannelJammers.Size() <= 0)
    {
      writeln_d("no recognized jammer weapons on platform!");
      UnBidAllJobsAllChannels(cmdr);  //unbid job on all channels
      jobs.Clear();                   //remove jobs from array, so no bids are attempted
    }

    if (MATH.Fabs(PLATFORM.Roll()) >= RESOURCE_ROLL_ANGLE)
    {
      writeln_d("platform is rolled beyond the resource limit!");
      UnBidAllJobsAllChannels(cmdr);  //unbid job on all channels
      jobs.Clear();                   //remove jobs from array, so no bids are attempted
    }

    //bid on each job from our commander
    foreach (WsfRIPRJob aJob in jobs)
    {
      if(aJob.IsValid() && aJob.Name() == "jam-target")
      {
        double BID = -MATH.DOUBLE_MAX();
        WsfTrack track = GetJobsTrack(aJob);
        if (track.IsValid())
        {
          if (PLATFORM.SlantRangeTo(track) >= DISTANCE_3D)
          {
            writeln_d("jamming target is too far away: ", track.TargetName());
            UnBidOneJobAllChannels(aJob); //unbid job on all channels
          }
          else
          {
            string lastJammer = "";
            for (CHANNEL = 0; CHANNEL < GetNumJobChannels(); CHANNEL = CHANNEL + 1)
            {
              string curJammer = mChannelJammers[CHANNEL];
              //if its the same jammer weapon, bid the same, two beams aren't different
              if (curJammer == lastJammer)
              {
                BID = BID;  //same bid for this beam as last beam (same jammer)
              }
              else
              {
                //BID = QueryBid(aJob);
                BID = CalculateJamTargetBidValue( track, curJammer);
                lastJammer = curJammer; //update last jammer to calculate bid
              }
              aJob.BidJob(PROCESSOR, CHANNEL, BID);
            }
          }
        }
        else
        {
          writeln_d("track not valid for job: ", aJob.Name(), " - ", aJob.GetDescription(), ", no bid.");
          UnBidOneJobAllChannels(aJob); //unbid job on all channels
        }

        comment = "one bid was: " + (string)BID;
        writeln_d(comment);
        //PLATFORM.Comment(comment);
      }
    }

    double midTime = GetWallClockTime();

    //iterate over the channels (beams) for each pod
    //take the most important jobs for that pod (greedy) and then clear the
    //bids for other channels (beams) when the power is gone (spent on other beams)

    for (int i = 0; i < GetNumJobChannels(); i = i + 1)
    {
      WsfRIPRJob job = cmdr.GetJobFor(TIME_NOW, PROCESSOR, i);
      DoJob(job, i);
    }

    //extra debug stuff
    //WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
    //writeln("multi channel guy ",PLATFORM.Name()," track count: ",localTracks.Count());
    //writeln("multi channel guy ",PLATFORM.Name()," job count: ",jobs.Size());

    double endTime = GetWallClockTime();
    //writeln("--- on_update Platform: ", PLATFORM.Name(), ", Bidding Time: ", (midTime - lStartTime));
    //writeln("--- on_update Platform: ", PLATFORM.Name(), ", Do Job Time:  ", (endTime - midTime));
    //writeln("--- on_update Platform: ", PLATFORM.Name(), ", Whole Time:   ", (endTime - lStartTime));

  end_on_update
```

- **演示要点**：演示 on_update 的参数：double, string, if, comment, time1, time2, time3, time4, foreach, for

### on_update（aiai_processor.old）｜更新回调

- **关键词**：on_update, int, for, double, string, bool, if, else, duration, 更新回调
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:1712-2002`
- **片段**：

```text
   on_update



      int WeaponCount = WeaponsActive();
      for (int i=0; i< WeaponCount; i=i+1)
      {
         WsfPlatform w = ActiveWeaponPlatform(i);
         if (IsUplinkingTo(w))
         {
            foreach( WsfRIPRProcessor proc in GetRIPRCommanderProcessor().GetRIPRSubordinateProcessors() )
            {
               if ( ! proc.IsUplinkingTo(w))
               {
                  proc.StartUplinking(w);
                  PROCESSOR.StopUplinking(w);
                  break;
               }
            }
         }
      }




     #extern Array<string> ttrs;
      foreach(string ttr in ttrs)
      {
        if (PLATFORM.AuxDataBool(ttr))    #shoot at this guy if we can
        {
          writeln_d(PLATFORM.Name(), " trying to shoot at ttr: ", ttr);
          WsfPlatform ttrPlatform = WsfSimulation.FindPlatform(ttr);
          if (ttrPlatform.IsValid())      #take a shot
          {
            WsfTrack ttrTrack = ttrPlatform.MakeTrack();
            ttrTrack.SetAuxData("notlocal", "true");
            if (CheckAndFire(ttrTrack))
            {
              writeln_d(PLATFORM.Name(), " shot at the ttr: ", ttr);
              PLATFORM.SetAuxData(ttr, false);
            }
          }
        }
      }


     #extern bool TestTrackCategory(WsfTrack, string);

      double duration = 0.0;
      double lStartTime = GetWallClockTime();

      writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", State: ", mState, ", Time: ", TIME_NOW);

      string oldState       = mState;
      string oldPursuitMode = mPursuitMode;

      mState = Think();

      WsfTrack curTarget = GetTarget();
      string targetType;

      bool turnOnFiringRadar = false;
      //turn on firing radar if in range
      if (mTurnOnFiringRadarInRange && !curTarget.IsNull() && curTarget.IsValid())
      {
         //check range against radar range
         if (PLATFORM.SlantRangeTo(curTarget) < mFiringRadarRange)
         {
            #writeln_d(PLATFORM.Name()," within range of curTarget!");

            turnOnFiringRadar = true;
         }
         else
         {
            #writeln_d(PLATFORM.Name()," NOT within range of curTarget!");
         }
      }
      //turn on firing radar if being tracked
      if (mTurnOnFiringRadarIfRWR && !turnOnFiringRadar)
      {
         WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
         foreach (WsfLocalTrack t in localTracks)
         {
            if (t.SensorTypeContributor(mRWR_RadarType))
            {
               turnOnFiringRadar = true;
               #writeln_d(PLATFORM.Name(), " is being tracked!  RWR signal from ", mRWR_RadarType);
               break;
            }
         }
         if (!turnOnFiringRadar)
         {
            #writeln_d(PLATFORM.Name(), " not being tracked. No RWR signal from ", mRWR_RadarType);
         }
      }
      if (turnOnFiringRadar)
      {
         //make sure radar is on
         WsfSensor firingRadar = PLATFORM.Sensor(mFiringRadarName);
         if (firingRadar.IsValid())
         {
            if (!firingRadar.IsTurnedOn())
            {
               firingRadar.TurnOn();
               #writeln_d(PLATFORM.Name(), " turned on fire control radar ", mFiringRadarName);
            }
            else
            {
               #writeln_d(PLATFORM.Name(), " has fire control radar ", mFiringRadarName, " already on!");
            }
         }
         else
         {
            #writeln_d("fire control radar ", mFiringRadarName," not found on ", PLATFORM.Name());
         }
      }





      if (oldState != mState)
      {
         PLATFORM.Comment("State: " + mState);
      }

      if (mState == "POINT")
      {
         if (oldState != "POINT")
         {
            TransitionToPOINT();
         }

         if (mUsePathFinder)
         {
            //extern bool UpdatePointInterceptLocationWithPathing(WsfPlatform, WsfGeoPoint);
            UpdatePointInterceptLocationWithPathing (PLATFORM, mCurrentPointIntercept);
         }
         else
         {
            //extern bool UpdatePointInterceptLocation(WsfPlatform, WsfGeoPoint);
            UpdatePointInterceptLocation (PLATFORM, mCurrentPointIntercept);
         }

         duration = GetWallClockTime() - lStartTime;
         writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", Process Time: ", duration);
         return;
      }

      // Process our state
      if (mState == "EVADE_INCOMING")
      {
         if (oldState != "EVADE_INCOMING")
         {
            TransitionToEVADE_INCOMING();
            #mAltitudeBeforeEvade = PLATFORM.Altitude();
            mAltitudeBeforeEvade = cDEFAULT_ALTITUDE;
            mSafeAltitudeToDiveTo = MATH.Max(mAltitudeMin, (mAltitudeBeforeEvade - mAltitudeToDiveEvade));
         }
         CheckAndFire(curTarget);
         writeln_d("    Evading incoming");
        #extern bool EvadeIncoming(WsfPlatform, WsfAIAIProcessor, Array<WsfPlatform>, double, double, double);
      ###EvadeIncoming(PLATFORM, PROCESSOR, mIncoming, mAltitudeBeforeEvade, mSafeAltitudeToDiveTo, weightPeersForEvade);
         EvadeIncoming(PLATFORM, PROCESSOR, mIncoming, mAltitudeBeforeEvade, mAltitudeBeforeEvade, weightPeersForEvade);
         duration = GetWallClockTime() - lStartTime;
         writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", Process Time: ", duration);
         return;
      }

      if (TestTrackCategory(curTarget, "unknown"))
      {
         writeln_d("Platform: ", PLATFORM.Name(), " current target: ", curTarget, " unknown or not valid, default mode to WAIT.");
         mState = "WAIT";
      }

      if (mState == "INTERCEPT")
      {
         if (oldState != "INTERCEPT")
         {
            TransitionToINTERCEPT( curTarget, mPursuitMode );
         }
#######
         PLATFORM.SetCurrentTarget(curTarget);
         CheckAndFire(curTarget);

         if (mUseMoverDuringPursuit)
         {
            // Our track quality may not be good enough yet, so keep moving towards the target.
            if (mUsePathFinder)
            {
                UpdateInterceptLocationWithPathing (curTarget, mPursuitMode);
            }
            else
            {
                UpdateInterceptLocation (curTarget, mPursuitMode);
            }
         }

         if (mPursuitMode != oldPursuitMode)
         {
            //PLATFORM.Comment("Pursuit Mode: " + mPursuitMode);
         }

         //writeln_d("    Heading: ", PLATFORM.Heading (), " Altitude: ", PLATFORM.Altitude (), " Speed: ", PLATFORM.Speed());
         //writeln_d("        (", PLATFORM.Latitude(), ", ", PLATFORM.Longitude(), ", ", PLATFORM.Altitude(), ")");
         //duration = GetWallClockTime() - lStartTime;
         //writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", Process Time: ", duration);
         //return;
      }
      else if (mState == "BINGO_FUEL")
      {
         writeln_d("   bingo_fuel, return to base or something");
         PLATFORM.Comment("Bingo fuel");
         PLATFORM.GoToSpeed(0);
      }
      else //if (mState == "WAIT")
      {
        mState = "WAIT";

        bool flyingEscort = false;
        if (mUseMoverDuringPursuit)
        {
            flyingEscort = FlyEscortFormation();
        }

        if (flyingEscort)
        {
          writeln_d("flying escort formation!");
        }
        else
        {
          writeln_d("Platform: ", PLATFORM.Name(), " not flying escort, flying regular WAIT state.");
          if (oldState != "WAIT")
          {
            TransitionToWAIT(true);     //TransitionToWAIT(false);  //LBM try this
          }
        }
      }

      //give attention to secondary jobs

      string tooComment = "Targets of opportunity: ";

      for (int channel = 1; channel < GetNumJobChannels(); channel = channel + 1)
      {
         //writeln_d("Getting job for channel: ", channel);

         WsfRIPRJob aJob = GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, PROCESSOR, channel);
         if (!aJob.IsValid())
         {
            //writeln_d("Job NOT VALID for channel: ", channel);
            continue;
         }
         if (aJob.Name() == "pursue-target")
         {
            string targetName = (string)aJob.GetData("targetTrackName");
            #extern WsfTrack GetTrackByName(WsfPlatform, string);
            WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);

            if (!targetTrack.IsValid() || !targetTrack.BelievedAlive())   // || !targetTrack.IFF_Foe())
            {
               writeln_d("Job TRACK is NOT valid for channel: ", channel, " job: ", aJob.GetDescription());
               continue;
            }

            tooComment = (tooComment + targetName + "  ");

            //don't fire last weapon at target thats not primary target
           #extern double GetWeaponQuantityRemainingMax(WsfPlatform, Array<Map<string, Object>>);
            if (GetWeaponQuantityRemainingMax(PLATFORM, mWeaponArray) > 1)
            {
               writeln_d("Platform: ", PLATFORM.Name(), " Looking to fire at target of opportunity: ", targetName, " for channel: ", channel);
               CheckAndFire(targetTrack);
            }
         }
         else
         {
            //writeln_d("Job is NOT pursue-target for channel: ", channel);
         }
      }

      if (mOldTOOComment != tooComment)
      {
         //PLATFORM.Comment(tooComment);
         mOldTOOComment = tooComment;
      }

      duration = GetWallClockTime() - lStartTime;
      writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", Process Time: ", duration);

   end_on_update
```

- **演示要点**：演示 on_update 的参数：int, for, double, string, bool, if, else, duration

### on_update（aisoc_processor_fez）｜更新回调

- **关键词**：on_update, int, for, string, if, double, bool, else, 更新回调
- **出处**：`base_types/processors/ripr_agents/aisoc/aisoc_processor_fez.txt:66-249`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aisoc/aisoc_processor.txt:69`）
- **片段**：

```text
      on_update

        //writeln_d("   ~~~ SOC tracklist count:       ", localTracks.Count());
        WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
        cManager.UpdateClusters(TIME_NOW,localTracks);
        int NumClusters = cManager.Count();

        for (int i = 0; i < NumClusters; i = i + 1 )
        {
          WsfCluster cluster = cManager.Entry(i);
          string ClusterName = PLATFORM.Name() + "_" + (string)i;

          //create a zone that bounds this cluster, with some padding
          //anybody can call up this zone by name to check if a threat is inside it

          //no need to have a zone on the platform: deprecated!
          //cluster.UpdatePlatformZone(PLATFORM,ClusterName,(5.0/60.0));   //5 minutes (1/12th of a degree)

          if (mDrawClusters == true)
          {
            draw_cluster_hull(cluster);
          }

          WsfGeoPoint clusterPoint = cluster.MeanLocation();
          double clusterBearing = cluster.Bearing();
          bool clusterBearingValid = cluster.BearingValid();

          //writeln_d("~~~ SOC - cluster ", ClusterName, ", BEARING ", clusterBearing, " bearing valid: ", clusterBearingValid );

          int numThreats = cluster.Count();
          double ClusterPriority = (double)numThreats;

          if( numThreats > 0 )
          {
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              //writeln_d("~~~ SOC, updating job for cluster: ", ClusterName);

              //job exists for zone with threats, update job priority
              int jobId = mClusterNameJobIdMap.Get( ClusterName );
              WsfRIPRJob temp = GetJobById( jobId );

              //job priority could have changed, set it
              temp.Priority( ClusterPriority );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              //number of threats inside zone could have changed, set it
              temp.SetData( "ZoneNumThreats", numThreats );

              bool anyInsideMEZ = false;
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if (threat.WithinZoneOf(PLATFORM,"MEZ"))
                {
                  anyInsideMEZ = true;
                  writeln_d("~~~ SOC, threat inside MEZ");   // dlc
                }
              }


              // dlc
              bool anyInsideFEZ = false;
              // Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                WsfTrack threat = cluster.Entry(i);
                arr.PushBack(threat.TargetName());
                if (threat.WithinZoneOf(PLATFORM,"FEZ"))
                {
                  anyInsideFEZ = true;
                  writeln_d("~~~ SOC, threat inside FEZ");
                }
              }

/*
              temp.SetData( "ZoneThreatNameArray", arr );
              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
*/

              temp.SetData( "ZoneThreatNameArray", arr );
              if (anyInsideMEZ)
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else if (anyInsideFEZ)
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
              else
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 0 );
              }

              // cld


            }
            else
            {
              //zone just became hot, job not created yet, create one
              WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                                   "zone",
                                                   "zone-" + ClusterName,
                                                   ClusterPriority,
                                                   mMaxJobWinners );
              temp.SetData( "ZoneName", ClusterName );
              temp.SetData( "ZonePoint", clusterPoint );
              temp.SetData( "ZoneBearing", clusterBearing );
              temp.SetData( "ZoneBearingValid", clusterBearingValid );
              temp.SetData( "ZoneNumThreats", numThreats );
              Array<string> arr = Array<string>();
              for (int i = 0; i < numThreats; i = i + 1 )
              {
                arr.PushBack(cluster.Entry(i).TargetName());
              }
              temp.SetData( "ZoneThreatNameArray", arr );

              AddJob(temp);
              mClusterNameJobIdMap.Set( ClusterName, temp.GetId() );

              //writeln_d("~~~ SOC, creating job for cluster: ", ClusterName);
              writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, ADD: " + (temp.Name());
              PLATFORM.Comment(NewComment);
            }
          }
          else
          {
            //no threats in cluster, make sure job for cluster doesn't exist or is deleted
            if( mClusterNameJobIdMap.Exists( ClusterName ) )
            {
              //writeln_d("~~~ SOC, removing job for empty cluster: ", ClusterName);
              int jobId = mClusterNameJobIdMap.Get(ClusterName);
              writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

              string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
              PLATFORM.Comment(NewComment);

              RemoveJob( GetJobById(jobId) );
              //mClusterNameJobIdMap.Erase( ClusterName );
              mClusterNameJobIdMap.Remove( ClusterName );
            }
          }
        }

        //remove any additional clusters
        for( int j = NumClusters; j < mLastNumClusters; j = j+1 )
        {
          string ClusterName = PLATFORM.Name() + "_" + (string)j;
          if( mClusterNameJobIdMap.Exists( ClusterName ) )
          {
            //writeln_d("~~~ SOC, removing job for empty cluster: ", ClusterName);
            int jobId = mClusterNameJobIdMap.Get(ClusterName);
            writeln_d("~~~ ", PLATFORM.Name(), " job change, REMOVE: ", GetJobById(jobId).Name() );

            string NewComment = "SOC - " + PLATFORM.Name() + " job change, REMOVE: " + (GetJobById(jobId).Name());
            PLATFORM.Comment(NewComment);

            RemoveJob( GetJobById(jobId) );
            //mClusterNameJobIdMap.Erase( ClusterName );
            mClusterNameJobIdMap.Remove( ClusterName );
          }
        }

        mLastNumClusters = NumClusters;

      end_on_update
```

- **演示要点**：演示 on_update 的参数：int, for, string, if, double, bool, else

### on_update（aifl_processor.old）｜更新回调

- **关键词**：on_update, if, else, foreach, double, duration, 更新回调
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:837-891`
- **片段**：

```text
  on_update

/*
    if (windowToggle)
    {
      SetJobWindowOpen(true);
      SetBidWindowOpen(false);
      windowToggle = false;
    }
    else
    {
      SetJobWindowOpen(false);
      SetBidWindowOpen(true);
      windowToggle = true;
    }
*/


#######
    mEscortName = "";
    if ( !mEscortNames.Empty() )
    {
      foreach ( string sEscortName in mEscortNames )
      {
        if ( WsfSimulation.FindPlatform(sEscortName).IsValid() )
        {
          mEscortName = sEscortName;
          #writeln("$$$2", " ", PLATFORM.Name(), " ", mEscortName);
          break;
        }
        #else
        #{
        #  mEscortNames.Erase(mEscortName);
        #}
      }
    }

    if (  mEscortName != "" ) writeln_d("~~~ Flight Lead ", PLATFORM.Name(), " is assigned to escort ", mEscortName);

    double duration = 0.0;
    double lStartTime = GetWallClockTime();
    writeln_d("--- aifl_update Platform: ", PLATFORM.Name(), ", Time: ", TIME_NOW);
    if (GetRIPRCommanderProcessor().IsValid())
    {
      writeln_d("...CreateJobsFromCommander()");
      CreateJobsFromCommander();
    }
    else
    {
      writeln_d("...CreateJobsIndependently()");
      CreateJobsIndependently();
    }
    duration = GetWallClockTime() - lStartTime;
    writeln_d("--- on_update Platform: ", PLATFORM.Name(), ", Process Time: ", duration);
  end_on_update
```

- **演示要点**：演示 on_update 的参数：if, else, foreach, double, duration

### on_update（sat_exclusion_angle_proc）｜更新回调

- **关键词**：on_update, if, string, bool, double, else, 更新回调
- **出处**：`coverage_demos/processors/sat_exclusion_angle_proc.txt:28-128`
- **片段**：

```text
   on_update
      # get the sensor subsystem to apply exclusion angle constraints to
      WsfSensor sen = PLATFORM.Sensor(EXCL_SENSOR_NAME);
      if (!sen.IsValid()) # turn of processor if sensor not found
      {
         PROCESSOR.TurnOff();
         return;
      }
      string platName = PLATFORM.Name();
      string senName = EXCL_SENSOR_NAME;
      string platSenStr = platName + "-" + senName;
      
      # time now in the sim
      Calendar simNow = WsfDateTime.CurrentTime();
      
      # update pointing
      bool senOn = sen.IsTurnedOn();
      if (senOn)
      {
         PointSensorToGEO_Belt(sen);
      }
      
      # sensor-platform related vectors
      Vec3 senBoresightUnit = Vec3.Construct(1.0, 0.0, 0.0); # unit vector along the sensor's boresight
      Vec3 senPosPlat = sen.ConvertPCSVectorToECS(senBoresightUnit); # platform/body or entity coord system (ECS)
      
      # solar related vectors
      Vec3 solarPosECI = Sun.LocationECI(simNow);  # ECI coord syst = GCRF (Geocentric Celestial Reference Frame)
      Vec3 solarPosWCS = PLATFORM.ConvertECIToWCS(solarPosECI); # WCS (world coord syst), a.k.a Earth Centered, Earth Fixed (ECEF)
      Vec3 solarPosPlat = PLATFORM.ConvertWCSToECS(solarPosWCS);
      
      # lunar related vectors
      Vec3 lunarPosECI = Moon.LocationECI(simNow); # ECI coord syst = GCRF (Geocentric Celestial Reference Frame)
      Vec3 lunarPosWCS = PLATFORM.ConvertECIToWCS(lunarPosECI); # WCS (world coord syst), a.k.a Earth Centered, Earth Fixed (ECEF)
      Vec3 lunarPosPlat = PLATFORM.ConvertWCSToECS(lunarPosWCS);
      
      # calculate the solar and lunar angles off the sensor boresight
      double solarNumer = Vec3.Dot(senPosPlat, solarPosPlat);
      double solarDenom = senPosPlat.Magnitude() * solarPosPlat.Magnitude();
      double solarAng = Math.ACos(solarNumer / solarDenom); # deg
   
      double lunarNumer = Vec3.Dot(senPosPlat, lunarPosPlat);
      double lunarDenom = senPosPlat.Magnitude() * lunarPosPlat.Magnitude();
      double lunarAng = Math.ACos(lunarNumer / lunarDenom); # deg
      
      # determine if exclusion conditions are met
      # if any are less than and the sensor is on, turn off the sensor
      # if both are greater than and the sensor is off, turn on the sensor
      bool solarExcl = solarAng < SOLAR_EXCL_ANGLE;
      bool lunarExcl = lunarAng < LUNAR_EXCL_ANGLE;
      
      if (senOn && (solarExcl || lunarExcl))
      {
         sen.TurnOff();
         senOffCt = senOffCt + 1;
         
         if (DRAW_SEN_ON_OFF)
         {
            WsfDraw draw = {};
            draw.Erase(platSenStr);
            draw.SetId(platSenStr);
            draw.SetColor(Color.Red());
            draw.BeginEllipse(0.0, drawRadius, drawRadius);
            draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
            draw.End();
         }
         
         if (BOOKMARK_SEN_OFF)
         {
            string bmrkType = platSenStr;
            string bmrkText = "sensor_off_ct_" + (string) senOffCt;
            WsfEventPipe.AddBookmark(TIME_NOW, bmrkType, bmrkText);
         }
      }
      
      else if (!senOn && !solarExcl && !lunarExcl)
      {
         PointSensorToGEO_Belt(sen);
         sen.TurnOn();
         
         if (DRAW_SEN_ON_OFF)
         {
            WsfDraw draw = {};
            draw.Erase(platSenStr);
            draw.SetId(platSenStr);
            draw.SetColor(Color.Green());
            draw.BeginEllipse(0.0, drawRadius, drawRadius);
            draw.VertexNED(PLATFORM, 0.0, 0.0, 0.0);
            draw.End();
         }
      }
      
      # if enabled, sends angular data to Mystic
      if(ANGLES_TO_MYSTIC)
      {
         WsfEventPipe.Record(PLATFORM, "Sun-Sen", solarAng);
         WsfEventPipe.Record(PLATFORM, "Moon-Sen", lunarAng);
         WsfEventPipe.Record(PLATFORM, "Sen-On", sen.IsTurnedOn());
      }
      
   end_on_update
```

- **演示要点**：演示 on_update 的参数：if, string, bool, double, else

### on_update（aisc_processor）｜更新回调

- **关键词**：on_update, foreach, for, else, string, if, 更新回调
- **出处**：`base_types/processors/ripr_agents/aisc/aisc_processor.txt:43-250`
- **片段**：

```text
      on_update
         writeln_d( "AISC on_update" );

        #extern WsfTrack GetTrackByName(WsfPlatform, string);

        //this agent acts slightly different if it has a commander
        //it bids on its commander's jobs based on other bids from its subordinates

        Map<string, int> updatedJobs = Map<string, int>();

        if( GetRIPRCommanderProcessor().IsValid() )
        {
          writeln_d("   ", PLATFORM.Name(), "  update with commander.");

          Array<WsfRIPRJob> jobs = GetRIPRCommanderProcessor().GetJobs();

          //this agent is special, he'll use a different channel to bid on each of his commander's jobs
          //this is done so that he can potentially win each and every job

          writeln_d("AISC update - number of jobs to bid on: ", jobs.Size());

          //bid on all the commander's jobs
          foreach (WsfRIPRJob aJob in jobs)
          {
            for( int channel = 0; channel < GetNumJobChannels(); channel = channel + 1 )
            {
               double bidValue = QueryBid(aJob);
               if( bidValue > -MATH.DOUBLE_MAX() )
               {
                  //bidValue = bidValue * MATH.Pow(0.97,(double)channel);
                  aJob.BidJob( PROCESSOR, channel, bidValue );
                  writeln_d( "AISC update - channel ", channel, " bid ", bidValue, " on job ", aJob.GetDescription() );
               }
            }
          }

          //find out which jobs this agent has won, and create/update local jobs based on them
          Map<string, int> updatedTargetJobs = Map<string, int>();
          for (int i = 0; i < GetNumJobChannels(); i = i+1 )
          {
            WsfRIPRJob aJob = GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, PROCESSOR, i);
            if (aJob.IsValid())
            {
               // we won this job, remove all other bids from our other channels
               for( int otherChannel = 0; otherChannel < GetNumJobChannels(); otherChannel = otherChannel + 1 )
               {
                  if( otherChannel != i )
                  {
                     aJob.UnbidJob( PROCESSOR, otherChannel );
                  }
               }

              string NewComment = "AISC update - channel " + (string)i + " won job: " + aJob.GetDescription();
              PLATFORM.Comment(NewComment);
              writeln_d( NewComment );

              //break up each job of many targets into single-target jobs
             #extern WsfTrack GetTrackByName(WsfPlatform, string);

              Array<string> arr = (Array<string>)aJob.GetData("ZoneThreatNameArray");
              foreach (string targetName in arr)
              {
                // if the track doesnt exist or is dead, dont create or update a job for it
                WsfTrack target = GetTrackByName(PLATFORM, targetName);
                if( !target.IsValid() || target.BelievedDead() )
                {
                  continue;
                }

                if (mTargetNameJobIdMap.Exists(targetName))
                {
                  //job exists, just update it
                  //not much updating done here, could probably leave this out, just a stub for now
                  int jobId = mTargetNameJobIdMap.Get(targetName);
                  WsfRIPRJob eJob = GetJobById(jobId);
                  double currentPriority = 1.0;
                  eJob.Priority(currentPriority);
                }
                else
                {
                  //job doesn't exist yet, create it
                  //make sure there is a job on this agent's board for this target
                  double Priority = 1.0 / PLATFORM.SlantRangeTo( GetTrackByName(PLATFORM, targetName) ); // base priority on distance?
                  WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                                       "pursue-target",
                                                       "pursue-target-" + targetName,
                                                       Priority,
                                                       mMaxJobWinners );

                  temp.SetData("targetTrackName", targetName);
                  mTargetNameJobIdMap.Set(targetName, temp.GetId());
                  AddJob(temp);
                }

                //either way the job was updated or created, record that fact
                updatedJobs.Set(targetName,1 );
              }
            }
          }
        }
        else
        {
          //no ripr commander was found for this agent
          //continue to function as if he doesn't exist or is dead
          //simply create jobs for each threat we know about
          //this agent considers itself the highest level commander for any of it's subordinates

          writeln_d("   ", PLATFORM.Name(), "  update WITHOUT commander, stand-alone.");
          WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
          //writeln_d("AISC update - ",PLATFORM.Name()," track count: ",localTracks.Count());

          foreach (WsfTrack track in localTracks)
          {
            if ( mTargetNameJobIdMap.Exists( track.TargetName() ) )
            {
              //update existing job
              double currentPriority = 1.0;
              int jobId = mTargetNameJobIdMap.Get(track.TargetName());
              WsfRIPRJob job = GetJobById(jobId);

              job.Priority( currentPriority );
              job.SetData("TrackId", track.TrackId() );           //redundant, this shouldn't change anything
              job.SetData("targetTrackName", track.TargetName()); //redundant, this shouldn't change anything

              if (track.WithinZoneOf(PLATFORM,"MEZ"))
              {
                job.SetData( "for_air",    0 );
                job.SetData( "for_ground", 1 );
              }
              else if (track.WithinZoneOf(PLATFORM,"FEZ"))
              {
                job.SetData( "for_air",    1 );
                job.SetData( "for_ground", 0 );
              }
              else
              {
                job.SetData( "for_air",    1 );
                job.SetData( "for_ground", 1 );
              }
            }
            else
            {
              //create new job
              double initialPriority = 1.0;
              WsfRIPRJob temp;
              temp = temp.Create( PROCESSOR,
                                  "pursue-target",
                                  "pursue-target-" + track.TargetName(),
                                  initialPriority,
                                  mMaxJobWinners );
              //temp.SetData("TrackId", track.TrackId() );
              temp.SetData("targetTrackName", track.TargetName());

              if ( track.WithinZoneOf(PLATFORM,"MEZ") )
              {
                temp.SetData( "for_air",    0 );
                temp.SetData( "for_ground", 1 );
              }
              else if ( track.WithinZoneOf(PLATFORM,"FEZ") )
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 0 );
              }
              else
              {
                temp.SetData( "for_air",    1 );
                temp.SetData( "for_ground", 1 );
              }

              AddJob(temp);
              mTargetNameJobIdMap.Set(track.TargetName(), temp.GetId());
              mJobIdTargetNameMap.Set(temp.GetId(), track.TargetName());
              writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );
              //double bidValue = QueryBid(temp);
              //writeln_d("QueryBid(job) returned: ", bidValue);
            }

            //either way the job was updated or created, record that fact
            updatedJobs.Set( track.TargetName(), 1 );
          }
        }

        //now make sure the right jobs are removed

        DeleteCompletedJobs();

        //this agent might have created jobs depending on other jobs from its commander
        //or the targets for previous jobs might not exist anymore

        //remove any jobs that are for non-existent tracks
        Array<WsfRIPRJob> jobs = GetJobs();
        foreach (WsfRIPRJob x in jobs)
        {
          string name = (string)x.GetData("targetTrackName");
          if (updatedJobs[name] != 1)
          {
            int jid = x.GetId();
            writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", x.GetDescription());
            string tName = mJobIdTargetNameMap[jid];  //this should match the job's data: "targetTrackName"
            mTargetNameJobIdMap.Erase(name);
            mJobIdTargetNameMap.Erase(jid);
            RemoveJob(x);
          }
        }

        writeln_d( "AISC update - ", PLATFORM.Name(), " job count: ", jobs.Size() );

      end_on_update
```

- **演示要点**：演示 on_update 的参数：foreach, for, else, string, if

### on_update（aijc_processor）｜更新回调

- **关键词**：on_update, string, foreach, if, else, 更新回调
- **出处**：`base_types/processors/ripr_agents/aijc/aijc_processor.txt:37-104`
- **片段**：

```text
      on_update
        Map<string, int> updatedJobs = Map<string, int>();
        //simply create jam jobs for each threat we know about
        //this agent considers itself the highest level commander for any of it's subordinates
        WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();

        string comment = "Num Tracks: " + (string)localTracks.Count();
        //PLATFORM.Comment(comment);

        foreach (WsfTrack track in localTracks)
        {
          if (mTargetNameJobIdMap.Exists(track.TargetName()))
          {
            //update existing job
            double currentPriority = 1.0;
            int jobId = mTargetNameJobIdMap.Get(track.TargetName());
            WsfRIPRJob job = GetJobById(jobId);
            job.Priority( currentPriority );
            //job.SetData("TrackId", track.TrackId() );           //redundant, this shouldn't change anything
            job.SetData("targetTrackName", track.TargetName()); //redundant, this shouldn't change anything
          }
          else
          {
            //create new job
            double initialPriority = 1.0;
            WsfRIPRJob temp;
            temp = temp.Create( PROCESSOR,
                                "jam-target",
                                "jam-target-" + track.TargetName(),
                                initialPriority,
                                mMaxJobWinners );
            //temp.SetData("TrackId", track.TrackId() );
            temp.SetData("targetTrackName", track.TargetName());

            AddJob(temp);
            mTargetNameJobIdMap.Set(track.TargetName(), temp.GetId());
            mJobIdTargetNameMap.Set(temp.GetId(), track.TargetName());
            writeln_d("~~~ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );

            comment = "create job: " + temp.GetDescription();
            PLATFORM.Comment(comment);
          }
          //either way the job was updated or created, record that fact
          updatedJobs.Set( track.TargetName(), 1 );
        }

        //now make sure the right jobs are removed
        //the targets for previous jobs might not exist anymore
        //remove any jobs that are for non-existent tracks
        Array<WsfRIPRJob> jobs = GetJobs();
        foreach (WsfRIPRJob x in jobs)
        {
          string name = (string)x.GetData("targetTrackName");
          if (updatedJobs[name] != 1)
          {
            int jid = x.GetId();
            writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", x.GetDescription());

            comment = "delete job: " + x.GetDescription();
            PLATFORM.Comment(comment);

            string tName = mJobIdTargetNameMap[jid];  //this should match the job's data: "targetTrackName"
            mTargetNameJobIdMap.Erase(name);
            mJobIdTargetNameMap.Erase(jid);
            RemoveJob(x);
          }
        }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：string, foreach, if, else

### on_update（aigci_processor.old）｜更新回调

- **关键词**：on_update, double, else, if, duration, 更新回调
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:684-752`
- **片段**：

```text
  on_update
    writeln_d("--- aigci_update Platform: ", PLATFORM.Name(), ", Time: ", TIME_NOW);

    //aigci_draw_track_to_truth();


    double duration = 0.0;
    double lStartTime = GetWallClockTime();

    if( GetRIPRCommanderProcessor().IsValid() )
    {
      //if the gci has a commander, then let its subordinates win jobs from the commander
      //the commander should create the same kinds of jobs that the gci would have created
      //these kinds include zone (cluster) jobs, or maybe even flank jobs
      SetJobPassThrough(true);
      writeln_d( "~~~ aigci is a job pass through now. time: ", TIME_NOW);
    }
    else
    {
      SetJobPassThrough(false);
      if( mZoneNames.Size() > 0 )
      {
        if ( mUseClustersInZones )
        {
          writeln_d( "~~~ aigci update w clusters in zones: ", PLATFORM.Name(), "- time: ", TIME_NOW);
          aigci_update_with_clusters_in_zones();
        }
        else
        {
          writeln_d( "~~~ aigci update w zones: ", PLATFORM.Name(), "- time: ", TIME_NOW);
          aigci_update_with_zones();
        }
      }
      else
      {
        writeln_d( "~~~ aigci update w clusters: ", PLATFORM.Name(), "- time: ", TIME_NOW);
        WsfLocalTrackList localTracks;
        localTracks = PLATFORM.MasterTrackList();
        aigci_update_with_clusters(localTracks);
      }

      if (mCreateFlankJobs == true)
      {
        aigci_update_flanks();
      }

      Array<WsfRIPRJob> jobs = GetJobs();
      foreach( WsfRIPRJob aJob in jobs )
      {
        if( ! mJobToWinnerMap.Exists( aJob.GetId() ) )
        {
          mJobToWinnerMap.Set( aJob.GetId(), 0 );
        }
        else
        {
          int currWinners = aJob.GetNumWinners();
          int lastWinners = mJobToWinnerMap.Get( aJob.GetId() );
          if( currWinners != lastWinners )
          {
            string NewComment = "AIGCI - Sub took a job: " + aJob.Name() + " - " + aJob.GetDescription();
            PLATFORM.Comment(NewComment);
            mJobToWinnerMap.Set( aJob.GetId(), currWinners );
          }
        }
      }
    }
    duration = GetWallClockTime() - lStartTime;
    writeln_d("~~~ on_update GCI Platform: ", PLATFORM.Name(), "- Process Time: ", duration);
  end_on_update
```

- **演示要点**：演示 on_update 的参数：double, else, if, duration

### on_update（script_demo_1）｜更新回调

- **关键词**：on_update, extern, foreach, while, for, 更新回调
- **出处**：`script_demos/script_demo_1.txt:84-178`
- **片段**：

```text
      on_update
         writeln("on_update");

         // Calls to external script must be externed.
         extern void PrintPlatformName(WsfPlatform);
         PrintPlatformName(PLATFORM);

         writeln("");
         writeln("Print my member variables");
         writeln("--- mMyPlatform name = ", mMyPlatform.Name());
         writeln("--- mMyInt = ", mMyInt);
         writeln("--- mMyDouble = ", mMyDouble);
         writeln("--- mMyArray = ");

         // For each loop.  The key loop variable is optional.
         writeln("array elements using a foreach with key and data");
         foreach (int key : double data in mMyArray)
         {
            writeln("---            key, data ", key, ", ", data);
         }
         writeln("");

         // For each loop without the key.
         writeln("array elements using a foreach with data");
         foreach (double data in mMyArray)
         {
            writeln("---            data ", data);
         }
         writeln("");

         // You can use an iterator.
         writeln("array elements using an iterator");
         ArrayIterator arrayIter = mMyArray.GetIterator();
         while (arrayIter.HasNext())
         {
            double data = (double)arrayIter.Next();
            writeln("---            key, data ", arrayIter.Key(), ", ", data);
         }
         writeln("");

         writeln("Information for ", PLATFORM.Name(), ".", PLATFORM.Type());

         writeln("  Command Chains");
         for (int i = 0; i < PLATFORM.CommandChainCount(); i = i + 1)
         {
            WsfCommandChain chain = PLATFORM.CommandChainEntry(i);
            writeln("    ", chain.Name());
            if (chain.Commander().IsValid())
            {
               writeln("      Commander: ", chain.Commander().Name());
            }
            writeln("      Peers");
            foreach (WsfPlatform peer in chain.Peers())
            {
               writeln("          ", peer.Name());
            }
            writeln("      Subordinates");
            foreach (WsfPlatform subordinate in chain.Subordinates())
            {
               writeln("          ", subordinate.Name());
            }
         }
         writeln("  Comm Systems");
         for (int i = 0; i < PLATFORM.CommCount(); i = i + 1)
         {
            WsfComm comm = PLATFORM.CommEntry(i);
            writeln("    ", comm.Name(), "; Type=", comm.Type(),
                  " On=", comm.IsTurnedOn());
         }
         writeln("  Sensor Systems");
         for (int i = 0; i < PLATFORM.SensorCount(); i = i + 1)
         {
            WsfSensor sensor = PLATFORM.SensorEntry(i);
            writeln("    ", sensor.Name(), "; Type=", sensor.Type(),
                  " On=", sensor.IsTurnedOn());
         }
         writeln("  Weapon Systems");
         for (int i = 0; i < PLATFORM.WeaponCount(); i = i + 1)
         {
            WsfWeapon weapon = PLATFORM.WeaponEntry(i);
            writeln("    ", weapon.Name(), "; Type=", weapon.Type(),
                  "; quantity=", weapon.QuantityRemaining());
         }
         writeln("  Processors");
         for (int i = 0; i < PLATFORM.ProcessorCount(); i = i + 1)
         {
            WsfProcessor processor = PLATFORM.ProcessorEntry(i);
            writeln("    ", processor.Name(), "; Type=", processor.Type(),
                  " On=", processor.IsTurnedOn(),
                  " UpdateInterval=", processor.UpdateInterval());
         }

         // Disable future calls.
         PROCESSOR.TurnOff();
      end_on_update
```

- **演示要点**：演示 on_update 的参数：extern, foreach, while, for

### on_update（tbm3）｜更新回调

- **关键词**：on_update, double, if, else, 更新回调
- **出处**：`tbm_demos/weapons/ssm/tbm3.txt:66-77`　（同签名共 2 处，另见 `six_dof/platforms/orbiter-main.txt:44`）
- **片段**：

```text
      on_update 
         double alt = PLATFORM.Altitude();
         if (alt >= maxAlt)
         {
            maxAlt = alt;
         }
         else
         {
            writeln("T=", TIME_NOW, " ", PLATFORM.Name(), " Max alt=", maxAlt / MATH.M_PER_MI(), "  mi");
            PROCESSOR.TurnOff();
         }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：double, if, else

### on_update（attitude_control）｜更新回调

- **关键词**：on_update, static, if, else, 更新回调
- **出处**：`space_operations/attitude_control.txt:118-138`
- **片段**：

```text
      on_update
         WsfPlatform target = WsfSimulation.FindPlatform("target1");
         WsfPlatform groundStation = WsfSimulation.FindPlatform("ground_station");
         WsfSpaceMover sp = (WsfSpaceMover)PLATFORM.Mover();
         static double cMAX_RANGE = 1500000.0;
         if (PLATFORM.SlantRangeTo(target) < cMAX_RANGE)
         {
            writeln(TIME_NOW, " Orient sensor to target");
            OrientToTarget(PLATFORM.Sensor("sensor"), target.LocationECI());
         }
         else if (PLATFORM.SlantRangeTo(groundStation) < cMAX_RANGE)
         {
            writeln(TIME_NOW, "Orient comm to g station");
            OrientToTarget(PLATFORM.Comm("comm"), groundStation.LocationECI());
         }
         else
         {
            writeln(TIME_NOW, "Orient solar panels to sun");
            OrientToTarget(PLATFORM.VisualPart("solar_panels"), Sun.LocationECI(WsfDateTime.CurrentTime()));
         }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：static, if, else

### on_update（pm6_missile_comparison）｜更新回调

- **关键词**：on_update, int, double, foreach, 更新回调
- **出处**：`six_dof/pm6_missile_comparison.txt:307-363`　（同签名共 5 处，另见 `six_dof/rb6_missile_comparison.txt:307`、`p6dof/missile_comparison.txt:124`、`six_dof/pm6_missile_comparison.txt:143`）
- **片段**：

```text
     on_update
         WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
         WsfLocalTrack     currentTgtTrack;
         int numTracks = trackList.TrackCount();
         
         # Find the nearest threat
         double nearestThreatDistance_m = 10000000;
         foreach (WsfLocalTrack trk in trackList)
         {
            if (trk.Range() < nearestThreatDistance_m)
            {         
               # Don't worry about targets we're already engaging
               if (PLATFORM.WeaponsActiveFor(trk.TrackId()) == 0)
               {
                  WsfPlatform target = trk.Target();
            
                  if (target.IsValid() &&
                      target.Side().Lower() == "red" &&
                      target.SpatialDomain().Lower() == "air")
                  {
                     PLATFORM.SetCurrentTarget(trk);
                     nearestThreatDistance_m = trk.Range();
                  }
               }
            }
         }
            
         # If the target is close enough, fire SR AAM
         WsfTrack trk = PLATFORM.CurrentTargetTrack();
         if(trk.IsValid())
         {
            # Only fire if we have no other missiles tracking
            if (PLATFORM.WeaponsActiveFor(trk.TrackId()) == 0)
            {
               WsfPlatform target = trk.Target();
               if (target.IsValid())
               {
                  double range_m = trk.Range();

                  if (range_m < 15000.0)
                  {
                     # Launch the SDM missile
                     WsfWeapon weapon_sr = PLATFORM.Weapon("sr-sdm");
                     
                     if (weapon_sr.IsValid() && weapon_sr.QuantityRemaining() > 0)
                     {
                        weapon_sr.Fire(trk);
                        writeln("T+", (string) TIME_NOW, ": FOX TWO (", weapon_sr.Name(), " vs ", target.Name(), ")");
                        
                        PLATFORM.TurnToHeading(0.0);
                        PLATFORM.GoToAltitude(10000.0 * MATH.M_PER_FT());
                     }
                  }
               }
            }       
         }
     end_on_update
```

- **演示要点**：演示 on_update 的参数：int, double, foreach

### on_update（script_demo_2）｜更新回调

- **关键词**：on_update, extern, if, foreach, 更新回调
- **出处**：`script_demos/script_demo_2.txt:259-325`
- **片段**：

```text
      on_update
         writeln("on_update");

         // Calls to external script must be externed.
         extern void PrintPlatformName(WsfPlatform);
         PrintPlatformName(PLATFORM);

         writeln("Platform ", PLATFORM.Name(), " is at location LLA ",
                           PLATFORM.Latitude(), ", ",
                           PLATFORM.Longitude(), ", ",
                           PLATFORM.Altitude(),
                           " XYZ ", PLATFORM.X(), ", ", PLATFORM.Y(), ", ", PLATFORM.Z());

         writeln("Print my member variables");
         writeln("--- mMyPlatform name = ", mMyPlatform.Name());
         writeln("--- mMyInt = ", mMyInt);
         writeln("--- mMyDouble = ", mMyDouble);

         WsfLocalTrackList trackList = PLATFORM.MasterTrackList();
         if (trackList.TrackCount() > 0)
         {
            writeln("T=", TIME_NOW, "; Track List for ", PLATFORM.Name());
         }

         foreach (WsfTrack track in trackList)
         {
            WsfTrackId trackId = track.TrackId();
            writeln("Track ", trackId.OwningPlatform(), " <", trackId.TrackNumber(), ">",
                  "; Update Count=", track.UpdateCount(), " Update Time=", track.UpdateTime());
            writeln("  Sensor: ", track.SensorName(), ".", track.SensorType(),
                  " (", track.SensorName(), ".", track.SensorType(), ")");
            if (track.RangeValid())
            {
               writeln("  Range=", track.Range(), " m");
            }
            if (track.BearingValid())
            {
               writeln("  Bearing=", track.Bearing(), " deg");
            }
            if (track.ElevationValid())
            {
               writeln("  Elevation=", track.Elevation(), " deg");
            }
            if (track.TypeValid())
            {
               writeln("  Type=", track.Type());
            }
            if (track.SideValid())
            {
               writeln("  Side=", track.Side());
            }
            if (track.SignalToNoiseValid())
            {
               writeln("  S/N=", track.SignalToNoise(), " absolute");
            }
            if (track.LocationValid())
            {
               writeln("  Location: Lat=", track.Latitude(),
                     " Lon=", track.Longitude(), " Alt=", track.Altitude());
            }
            if (track.FrequencyValid())
            {
               writeln("  Frequency=", track.Frequency(), " hz");
            }
            writeln("  Track Quality=", track.TrackQuality());
         }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：extern, if, foreach

### on_update（apc）｜更新回调

- **关键词**：on_update, if, foreach, 更新回调
- **出处**：`laser_designator/platforms/apc.txt:37-51`　（同签名共 2 处，另见 `draw/draw_demo.txt:74`）
- **片段**：

```text
       on_update
           WsfLocalTrackList localtracklist = PLATFORM.MasterTrackList();
           WsfTrackList        rawtracklist =  PLATFORM.MasterRawTrackList();
           if (localtracklist.Count() > 0)
       {          
          foreach (WsfTrack rawtrack in rawtracklist)
          {
            if (rawtrack.IsValid())
            {
               #writeln(TIME_NOW, " ", PLATFORM.Name()," WE ARE BEING LASED!!!");
               PLATFORM.Comment("I'm being lased!!!");
            }
          }
       }
       end_on_update
```

- **演示要点**：演示 on_update 的参数：if, foreach

### on_update（6th_Hohmann_leo_orbit_transfer_demo）｜更新回调

- **关键词**：on_update, if, else, 更新回调
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:189-204`　（同签名共 8 处，另见 `cyber/GoneFishing_ConstraintDemo.txt:108`、`hel/hel_test.txt:97`、`script_demos/script_demo_4.txt:51`）
- **片段**：

```text
      on_update
         writeln(TIME_NOW, " second-burn update");
         if (mOnce) // first time; do nothing
         {
            mOnce = false;
         }
         else
         {
            writeln(TIME_NOW, "Executing 2nd burn...");
            WsfSpaceMover pm = (WsfSpaceMover)PLATFORM.Mover();
            extern double mDVa;
            WsfTangentManeuver mvr = WsfTangentManeuver.Construct(WsfOrbitalEventCondition.NONE(), mDVa);
            pm.ExecuteManeuver(mvr);
            PROCESSOR.TurnOff();
         }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：if, else

### on_update（aa_mrm）｜更新回调

- **关键词**：on_update, extern, if, 更新回调
- **出处**：`shooter/weapons/aam/aa_mrm.txt:171-186`　（同签名共 4 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:250`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:249`、`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:145`）
- **片段**：

```text
      on_update
         extern bool mTrackFromE2CSet;
         extern bool mTrackFromE2C;
         if (! mTrackFromE2CSet)
	 {
            if (PLATFORM.Sensor("seeker").IsTurnedOn())
	    {
               WsfTrack extTrack = PLATFORM.CurrentTargetTrack();
	       if (extTrack.IsValid() && (extTrack.OriginatorType() == "e2c"))
	       {
	          mTrackFromE2C = true;
	       }
	       mTrackFromE2CSet = true;
	    }
	 }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：extern, if

### on_update（kinematic_mover_demo）｜更新回调

- **关键词**：on_update, double, if, 更新回调
- **出处**：`kinematic_mover/kinematic_mover_demo.txt:51-70`　（同签名共 4 处，另见 `terrain_following/terrain_demo.txt:17`、`example_scripts/proc_mover_demo.txt:41`、`bearing_only/platforms/fuser_platform1.txt:55`）
- **片段**：

```text
   on_update
      WsfGeoPoint FutureLocation  = PLATFORM.Location();
      double CurrentAltAGL  = PLATFORM.HeightAboveTerrain();
      double CurrentSpeed   = PLATFORM.Speed();
      double CurrentAltMSL  = PLATFORM.Altitude();
      double MaxRate        = 100;
      double Rate           =  50;
      double NewAlt         = CurrentAltMSL + 20000;
      double staticAlt      = 4000;
      if (TIME_NOW >  25 && TIME_NOW < 35)
      {
      PLATFORM.GoToAltitude(NewAlt); # Alt, Rate, stay on route
      }
      if (TIME_NOW >  100 && TIME_NOW < 120)
            {
            PLATFORM.GoToAltitude(staticAlt); # Alt
      }
      if (TIME_NOW >  200 && TIME_NOW < 220)
      PLATFORM.ReturnToRoute();
   end_on_update
```

- **演示要点**：演示 on_update 的参数：double, if

### on_update（script_demo_2）｜更新回调

- **关键词**：on_update, int, for, 更新回调
- **出处**：`script_demos/script_demo_2.txt:425-488`
- **片段**：

```text
      on_update
         mMyPlatform = PLATFORM;

         writeln("Print my member variables");
         writeln("--- mMyPlatform name = ", mMyPlatform.Name());
         writeln("--- mMyInt = ", mMyInt);
         writeln("--- mMyDouble = ", mMyDouble);

         writeln("Information for ", PLATFORM.Name(), ".", PLATFORM.Type());
         int i;
         int j;
         writeln("  Command Chains");
         for (i = 0; i < PLATFORM.CommandChainCount(); i = i + 1)
         {
            WsfCommandChain chain = PLATFORM.CommandChainEntry(i);
            writeln("    ", chain.Name());
            if (chain.Commander().IsValid())
            {
               writeln("      Commander: ", chain.Commander().Name());
            }
            writeln("      Peers");
            foreach (WsfPlatform peer in chain.Peers())
            {
               writeln("          ", peer.Name());
            }
            writeln("      Subordinates");
            foreach (WsfPlatform subordinate in chain.Subordinates())
            {
               writeln("          ", subordinate.Name());
            }
         }
         writeln("  Comm Systems");
         for (i = 0; i < PLATFORM.CommCount(); i = i + 1)
         {
            WsfComm comm = PLATFORM.CommEntry(i);
            writeln("    ", comm.Name(), "; Type=", comm.Type(),
                  " On=", comm.IsTurnedOn());
         }
         writeln("  Sensor Systems");
         for (i = 0; i < PLATFORM.SensorCount(); i = i + 1)
         {
            WsfSensor sensor = PLATFORM.SensorEntry(i);
            writeln("    ", sensor.Name(), "; Type=", sensor.Type(),
                  " On=", sensor.IsTurnedOn());
         }
         writeln("  Weapon Systems");
         for (i = 0; i < PLATFORM.WeaponCount(); i = i + 1)
         {
            WsfWeapon weapon = PLATFORM.WeaponEntry(i);
            writeln("    ", weapon.Name(), "; Type=", weapon.Type(),
                  "; quantity=", weapon.QuantityRemaining());
         }
         writeln("  Processors");
         for (i = 0; i < PLATFORM.ProcessorCount(); i = i + 1)
         {
            WsfProcessor processor = PLATFORM.ProcessorEntry(i);
            writeln("    ", processor.Name(), "; Type=", processor.Type(),
                  " On=", processor.IsTurnedOn(),
                  " UpdateInterval=", processor.UpdateInterval());
         }

         // Disable future calls.
         PROCESSOR.TurnOff();
      end_on_update
```

- **演示要点**：演示 on_update 的参数：int, for

### on_update（uhf_ew_radar_sensor_platform）｜更新回调

- **关键词**：on_update, string, foreach, 更新回调
- **出处**：`swarm/platforms/uhf_ew_radar_sensor_platform.txt:85-167`
- **片段**：

```text
      on_update
      WsfLocalTrackList tracklist = PLATFORM.MasterTrackList();

      if (PLATFORM.MasterRawTrackList().Count() > 0)
      {
         writeln(TIME_NOW, " Number of Local Tracks is ", tracklist.Count(), " out of a total raw track count of ", PLATFORM.MasterRawTrackList().Count());
         string writeline = write_str("Total tracks reported by the platform track manager is ",
                                      tracklist.Count(), " out of a total raw track count of ",
                                      PLATFORM.MasterRawTrackList().Count());
         PLATFORM.Comment(writeline);
      }

      if (tracklist.Count() > 0)
      {
         foreach (WsfLocalTrack track in tracklist)
         {
            if (track.IsValid())
            {
               writeln(TIME_NOW, "  Track platform name is ", track.TargetName());
               writeln(TIME_NOW, "  Number of Contributors are ", track.RawTrackCount());

               WsfGeoPoint trackLocation = track.CurrentLocation();
               mDraw.BeginLines();
               mDraw.Vertex(PLATFORM);
               mDraw.Vertex(trackLocation);
               mDraw.End();
               for (int i=0; i < track.RawTrackCount(); i = i + 1)
               {
                  WsfTrack ContributorTrack = track.RawTrack(i);
                  WsfGeoPoint ContributorTrackLocation = ContributorTrack.CurrentLocation();
                  WsfPlatform ContributorTrackPlatform = ContributorTrack.Target();
                  if (ContributorTrackPlatform.IsValid())
                  {
                     double ContributorSlantrangeToTrack = ContributorTrackPlatform.SlantRangeTo(ContributorTrackLocation);
                     writeln(TIME_NOW, "   Contributor ", ContributorTrackPlatform.Name(), " is ", ContributorSlantrangeToTrack, " meters from reported track. Reported track is ",
                             PLATFORM.SlantRangeTo(trackLocation), " from sensor, contributor platorm is " , PLATFORM.SlantRangeTo(ContributorTrackPlatform), " meters from sensor");
                     #Draw a line to the platforms to the reported track location
                     #The reported track location will be a green ball.
                     ConDraw.BeginLines();
                     ConDraw.Vertex(ContributorTrackPlatform.Location());
                     ConDraw.Vertex(ContributorTrackLocation); #
                     ConDraw.End();
                     ConDraw.BeginEllipsoid(0, 50, 50, 50, 50, 50);
                     ConDraw.Vertex(ContributorTrackLocation);
                     ConDraw.End();
                     #Draw a line to where we THINK the contributors are...
                     Con2Draw.BeginLines();
                     Con2Draw.Vertex(ContributorTrackPlatform.Location());
                     Con2Draw.Vertex(trackLocation);
                     #Con2Draw.Vertex(ContributorTrackLocation);
                     Con2Draw.End();
                  }
               }

               WsfCovariance PWCS = track.StateCovariance();
               if(! PWCS.IsValid())
               PWCS = track.MeasurementCovariance();
               // Used to give the cov access to the track location, needed
               // for conversion to NED. ...Actually, this is not scriptable. The
               // call to track.StateCovariance() calls copy.
               ////PWCS.CopyTrackData(track);
                  if (PWCS.IsValid() && track.LocationValid())
                  {
                     // We can amplify the size to make it more findable
                     // in Mystic
                     double S = 1.0;
                     //WsfGeoPoint originatorLocation = track.OriginatorLocation();
                     Ellipsoid e2 = PWCS.EllipsoidNED();
                     Con3Draw.BeginEllipsoid(
                              e2.OrientationHeadingDeg(),
                              e2.OrientationPitchDeg(),
                              e2.OrientationRollDeg(),
                              e2.SemiAxisForward()*S,
                              e2.SemiAxisSide()*S,
                              e2.SemiAxisUp()*S
                     );
                     Con3Draw.Vertex(trackLocation);
                     Con3Draw.End();
                  }
               }
            }
         }
      end_on_update
```

- **演示要点**：演示 on_update 的参数：string, foreach

### on_update（timeline_proc）｜更新回调

- **关键词**：on_update, if, string, 更新回调
- **出处**：`base_types/processors/timeline_agents/timeline_proc.txt:64-314`
- **片段**：

```text
   on_update
      #update these if necessary
      mSeparateEngagement    = false;
      mEngagementTrueBearing = -1.0;

      #populate shared variables
      WsfTask timeline = GetTimeLineTask(PROCESSOR);
      mTimeLineLocalTargets = GetTimeLineTaskLocalTargets(PLATFORM, timeline);
      Array<double> times = Array<double>();
      foreach(WsfLocalTrack target in mTimeLineLocalTargets)
      {
         double time = TimeToReachPoint(target, PLATFORM.Location(), mGeesToTurnWith);
         times.PushBack(time);
      }
      SortLocalTracksByValue(mTimeLineLocalTargets, times);
      mNearestTimeLineTarget = GetNearestTimeLineTaskLocalTarget(PLATFORM, timeline);


      if (timeline.IsValid() &&
          timeline.AuxDataExists("point_a") &&
          timeline.AuxDataExists("point_b")   )
      {
         WsfGeoPoint SeparateA = (WsfGeoPoint)timeline.AuxDataObject("point_a");
         WsfGeoPoint SeparateB = (WsfGeoPoint)timeline.AuxDataObject("point_b");
         if (SeparateA.IsValid() && SeparateB.IsValid())
         {
            WsfGeoPoint near;
            WsfGeoPoint far;
            if (PLATFORM.GroundRangeTo(SeparateA) < PLATFORM.GroundRangeTo(SeparateB))
            {
               near = SeparateA;
               far  = SeparateB;
            }
            else
            {
               near = SeparateB;
               far  = SeparateA;
            }
            mDraw.SetLayer("timeline_proc");
            mDraw.SetId("timeline_proc");
            mDraw.SetDuration(PROCESSOR.UpdateInterval());
            mDraw.SetLineSize(1);
            mDraw.SetLineStyle("solid");

            Array<WsfTrack> targets = (Array<WsfTrack>)timeline.AuxDataObject("targets");
            #check if platform is on the correct side of separation line
            WsfGeoPoint clusterMeanLocation = (WsfGeoPoint)timeline.AuxDataObject("cluster_mean");
            double refAz = near.TrueBearingTo(far);

            #save this engagement axis true bearing!
            mSeparateEngagement    = true;
            mEngagementTrueBearing = MATH.NormalizeAngle0_360(refAz);

            double ownAz = near.TrueBearingTo(PLATFORM.Location()) - refAz;
            double tgtAz = near.TrueBearingTo(clusterMeanLocation) - refAz;
            ownAz = MATH.NormalizeAngleMinus180_180(ownAz);
            tgtAz = MATH.NormalizeAngleMinus180_180(tgtAz);

            #save off turn direction
            if (tgtAz < 0) {
               mSeparateSide = "LEFT";
            } else {
               mSeparateSide = "RIGHT";
            }

            bool CorrectSide = ((ownAz * tgtAz) > 0);

            #draw lines for separation divide
            mDraw.SetColor(0.0, 0.0, 0.0);   #black
            mDraw.BeginLines();
               mDraw.Vertex(near);
               mDraw.Vertex(far);
            mDraw.End();

            if (CorrectSide) {
               mDraw.SetColor(0.0, 1.0, 1.0);   #aqua
            } else {
               mDraw.SetColor(1.0, 0.0, 0.0);   #red
            }

            #draw line from me to target center of gravity
            mDraw.BeginLines();
               mDraw.Vertex(PLATFORM);
              #mDraw.Vertex(targetCluster.MeanLocation());
               mDraw.Vertex(mTimeLineLocalTargets.Front().CurrentLocation());
            mDraw.End();

#            mDraw.SetEllipseMode("line");
#            mDraw.BeginCircle(0.0, 4.0 * MATH.M_PER_NM());
#               mDraw.Vertex(PLATFORM);
#            mDraw.End();
         }
      }


      #update the "mTimeLineLocalTargetsToShoot" list
      mTimeLineLocalTargetsToShoot.Clear();
      if (timeline.IsValid())
      {

      string RISK = timeline.AuxDataString("RISK");

      foreach(WsfLocalTrack target in mTimeLineLocalTargets)
      {
         writeln_d("T=",TIME_NOW," ", PLATFORM.Name(), " checking if shootable: ", target.TargetName());

         if (FiredOn(PLATFORM, target, mConsiderPeersWeapons))
         {
            writeln_d("    NO - already fired on!");
            continue;
         }

         if (mRequiredToSupportWeapons == true && RISK != "HIGH")   #can support any shot when risk is high (won't be dragging)
         {
            double gate = timeline.AuxDataDouble("DOR");  #range (meters)
            if (RISK == "MEDIUM")
            {
               gate = timeline.AuxDataDouble("MAR");  #range (meters)
            }

            #calculate if we have time or range to support a shot to this target:



            ###################################################################
            ###################################################################
            ###################################################################


            #figure out weapon range & time of flight
            double weaponMaxRange = 0.0;
            WsfWeapon maxRangeWeapon;
            for (int i=0; i < PLATFORM.WeaponCount(); i+=1)
            {
               WsfWeapon weapon = PLATFORM.WeaponEntry(i);
               if (WeaponCapableAvailableAgainstThreat(weapon, target))
               {
                  double weaponRange = MaxRange(PLATFORM,weapon,target);
                  if (weaponRange > weaponMaxRange)
                  {
                     weaponMaxRange = weaponRange;
                     maxRangeWeapon = weapon;
                  }
               }
            }
            if (!maxRangeWeapon.IsValid())
            {
               writeln_d("    NO - do not have a weapon for the target");
               continue;   #no weapon for this target
            }
            #estimate time before we can shoot
            #hypothetical shot
            #estimate time cranking (based on weapon travel time)
            #does this leave us enough time to turn to drag?
            double weaponTOF = TimeToHit(PLATFORM, maxRangeWeapon, target);

            if (weaponTOF <= 0)
            {
               writeln_d("    NO - could not find TOF data for weapon");
               #good weapon data no found
               continue;
            }

            double firingRange = DefaultPercentRangeMax * weaponMaxRange;

            writeln_d("    INFO - weapon \"", maxRangeWeapon.Name(), "\" firing range = ", firingRange, " TOF = ", weaponTOF);

            double targetRange = PLATFORM.GroundRangeTo(target.CurrentLocation());
            double rangeToGo = targetRange - firingRange;
            double timeTilShot = 0.0;

            double range = PLATFORM.GroundRangeTo(mNearestTimeLineTarget.CurrentLocation());

            if (rangeToGo > 0)
            {
               #assume target continues on its current heading
               #assume nearest threat closes towards you
               #assume we close towards target
               double myRelativeBearingToThreat = MATH.Fabs(MATH.NormalizeAngleMinus180_180(PLATFORM.TrueBearingTo(mNearestTimeLineTarget) - PLATFORM.TrueBearingTo(target)));
               double targetRelativeBearingToMe = target.RelativeBearingTo(PLATFORM);
               double closingSpeedToTarget = PLATFORM.Speed() + MATH.Cos(targetRelativeBearingToMe) * target.Speed();
               double closingSpeedOfThreat = mNearestTimeLineTarget.Speed() + MATH.Cos(myRelativeBearingToThreat) * PLATFORM.Speed();

               if (closingSpeedToTarget <= 0)
               {
                  writeln_d("    NO - negative closing speed to target with range remaining to shoot");
                  continue;
               }

               writeln_d("    INFO - closing to target = ", closingSpeedToTarget, " closing of threat = ", closingSpeedOfThreat);

               #subtract off closing distance to nearest threat during the time before shot
               timeTilShot = rangeToGo / closingSpeedToTarget;

               double temp = range;
               range -= (timeTilShot * closingSpeedOfThreat);

               writeln_d("    INFO - starting threat range = ", temp, " range after closing to shot loc = ", range);
            }

            #subtract off closing distance to nearest target during the time of weapon's flight
            double closingSpeedOfThreat = (mDelaySpeed * MATH.Cos(mOffsetAngle)) + mNearestTimeLineTarget.Speed();
            double temp = range;
            range -= (weaponTOF * closingSpeedOfThreat);

            writeln_d("    INFO - range at shot = ", temp, " range after supporting shot = ", range);

#            #calculate time to turn to drag (after cranking)
#            Array<double> vals = Array<double>();
#            double turnAngle = 180 - mOffsetAngle;
#            TurnAngleTimeAndDistance(turnAngle, mEngageSpeed, mGeesToTurnWith, vals);
#            double turnTime = vals[0];
#            double distSep  = vals[1];
#            #subtract off closing distance to nearest target during the time of turning to drag
#            range += distSep;
#            range -= (turnTime*mNearestTimeLineTarget.Speed());

            if (range >= gate)
            {
               writeln_d("    YES - have time & range to support the shot.");

               mTimeLineLocalTargetsToShoot.PushBack(target);
            }
            else
            {
               writeln_d("    NO - do not have time & range to support the shot.");
               ##TODO - should we break here?
               ##       its highly unlikely futher away targets will be shootable
               #break;
            }


            ###################################################################
            ###################################################################
            ###################################################################


         }
         else if (mRequiredToSupportWeapons == false || RISK == "HIGH")
         {
            writeln_d("    YES - risk is high or not required to support.");

            #all targets are for shooting (if not already shot on)
            mTimeLineLocalTargetsToShoot.PushBack(target);
         }
      }

      }


   end_on_update
```

- **演示要点**：演示 on_update 的参数：if, string

### on_update（uhf_radar）｜更新回调

- **关键词**：on_update, double, 更新回调
- **出处**：`swarm/scenarios/uhf_radar.txt:16-20`　（同签名共 6 处，另见 `visual_part/red_satellite.txt:33`、`visual_part/red_satellite.txt:60`、`parachute/AvailableGs.txt:121`）
- **片段**：

```text
    on_update
      double CurrentHeading = PLATFORM.Heading(); # -180 to 180...
      double NewHeading = CurrentHeading + 90;
      PLATFORM.SetHeading(NewHeading);
    end_on_update
```

- **演示要点**：演示 on_update 的参数：double

### on_update（mitm_blue_laydown）｜更新回调

- **关键词**：on_update, if, 更新回调
- **出处**：`cyber/scenarios/mitm_blue_laydown.txt:29-35`　（同签名共 35 处，另见 `logistics/processors/strike_controller.txt:211`、`satellite_demos/platforms/iridium.txt:279`、`simple_scenario/platforms/blue_strikers.txt:27`）
- **片段**：

```text
   on_update 
      WsfPlatform spotter = WsfSimulation.FindPlatform("spotter_1");
      if ((PLATFORM.GroundRangeTo(spotter) < 15*MATH.M_PER_MI()) && PLATFORM.CyberAttackStatus(spotter,"DELAY_COMMS") <= 0)
      {
         PLATFORM.CyberAttack(spotter,"DELAY_COMMS");
      }
   end_on_update
```

- **演示要点**：演示 on_update 的参数：if

### on_update（starlink_linkable）｜更新回调

- **关键词**：on_update, for, 更新回调
- **出处**：`space_operations/platforms/starlink_linkable.txt:118-127`　（同签名共 2 处，另见 `cyber/processors/uav_weapon_release.txt:47`）
- **片段**：

```text
      on_update
         for (int commNum = 0; commNum < PLATFORM.CommCount(); commNum += 1)
         {
            WsfComm comm = PLATFORM.CommEntry(commNum);
            if (!comm.GroupMemberOf("DEDICATED_COMM"))
            {
               AttemptLinks(comm);
            }
         }         
      end_on_update
```

- **演示要点**：演示 on_update 的参数：for

### on_update（fuser_platform2）｜更新回调

- **关键词**：on_update, foreach, 更新回调
- **出处**：`bearing_only/platforms/fuser_platform2.txt:38-53`　（同签名共 10 处，另见 `space_operations/scenarios/ssn_laydown.txt:64`、`new_guidance/platforms/inflight_update_tactics.txt:71`、`ship_ad/platforms/inflight_update_tactics.txt:71`）
- **片段**：

```text
    on_update
        WsfLocalTrackList localtracklist = PLATFORM.MasterTrackList();
        WsfTrackList        rawtracklist =  PLATFORM.MasterRawTrackList();
        #foreach (WsfTrack track in rawtracklist)
        foreach (WsfTrack track in localtracklist)
        {
            if (track.IsValid())
            {
                WsfDraw aDraw = WsfDraw(); # Make a draw object
                aDraw.SetColor(1, 0, 0, 1);
                aDraw.BeginIcons(track.Heading(), "wedge");
                aDraw.Vertex(track.ReportedLocation());
                aDraw.End();
            }
        }
    end_on_update
```

- **演示要点**：演示 on_update 的参数：foreach

### on_update（agm-mrc）｜更新回调

- **关键词**：on_update, else, 更新回调
- **出处**：`p6dof/platforms/agm-mrc.txt:109-129`　（同签名共 4 处，另见 `six_dof/platforms/agm-mrc.txt:200`、`six_dof/platforms/agm-mrc.txt:234`、`p6dof/platforms/agm-mrc.txt:143`）
- **片段**：

```text
      on_update
      
         WsfTrack trk = PLATFORM.CurrentTargetTrack();
         if( trk.IsValid() )
         {
            if( !trk.IsNull() ) 
            {
               double rng = PLATFORM.SlantRangeTo(trk);
               if( rng < activationRange_m )
               {
                  PLATFORM.Processor("pitchup").TurnOn();
                  PLATFORM.Processor("range_to_tgt").TurnOff();
               }
            }
         }
         else
         {
            writeln("No current target exists!!!");
         }

      end_on_update
```

- **演示要点**：演示 on_update 的参数：else

### on_update（aisc_passthru_processor）｜更新回调

- **关键词**：on_update, 更新回调
- **出处**：`base_types/processors/ripr_agents/aisc/aisc_passthru_processor.txt:24-25`　（同签名共 32 处，另见 `logistics/platforms/ocean_going_tanker.txt:58`、`base_types/processors/ripr_agents/aigci/aigci_processor.txt:47`、`base_types/processors/timeline_agents/timeline_proc_fsm.txt:479`）
- **片段**：

```text
      on_update
      end_on_update
```

- **演示要点**：演示 on_update（最小结构，无子参数）

### precondition（behavior_alt3B11_illuminate）｜状态前置条件

- **关键词**：precondition, if, dir0, int, else, gmx, double, spd0, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3B11_illuminate.txt:72-179`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_alt3B11_illuminate.txt:66`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition behavior_alt3B11_illuminate, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      ### check if alternative should even be considered?

      if (!mAlternative3B11Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      if(tasks.Count() <= 0)
      {
         return Failure("no weapon (target) tasks!");
      }
      WsfTask targetTask = tasks.Entry(0);
      targetTrack = PLATFORM.MasterTrackList().Find(targetTask.LocalTrackId());
      if (!targetTrack.IsValid())
      {
         return Failure("no target track!");
      }


      ## alt3b.f : lines 84 - 127

#      if(!lillum)
#      {
#         return Failure("lillum == false");
#      }
      #
      dir0 = Vec3.Construct(0,0,0);
      #if(nbvr == 0) call nabort('ALT3B...NBVR=0')

#     #LBM - only fly against targetTrack, not all things
#      do 50 ibvr=1,nbvr
#         if (jtgbvr(ibvr).lt.0) call nabort('ALT3B...JTGBVR IS ZERO')
#         if (jtgbvr(ibvr).eq.0) goto 50
#         iac = mmindt(jtgbvr(ibvr))
#         if (iac.eq.0) goto 50

      #call vdir(xp(1,me),xp(1,iac),dx)
      Vec3 dx = RelativePositionNED(PLATFORM.Location(), targetTrack.CurrentLocation());
      dx.Normalize();
      Vec3 vp = PLATFORM.VelocityNED();
      Vec3 dir0i = vorth(vp,dx);

      #call veclin(0.5/xmag(dir0i),dir0i,root3*0.5,dx,dir0i)

      //missile phases:
      //pinfr=1, psema=2, pactr=3, pcomg=4, pguns=5, phor=6, p_act_ir_1=7, p_inertial=8, pnewg=9

      int kndbvr;   //TODO? = pcomg if command guided launch
      int psema = 2;    //semi active
      int pcomg = 4;    //command guided
      if (kndbvr == psema)
      {
         # SEMI-ACTIVE MISSILE, GIVE FULL WEIGHT

         #call vsum(dir0,dir0i,dir0);

      }
      else if (kndbvr == pcomg)
      {
         # ACTIVE RADAR MISSILE, PRESUMABLY PRE-ACQUISITION
         # GIVE 50% WEIGHT TO ITS ILLUM VECTOR

         #call vecinc(dir0,0.5,dir0i,dir0)

      }
      else
      {
         #call nabort('ALT3B...unknown/illegal kndbvr')
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " unknown/illegal kndbvr");
         writeln_d(msg);
         return Failure(msg);
      }

      # If BVR target is not to be considered in high detail do not
      # illuminate
      if (dir0.Magnitude() == 0.0)
      {
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " dir0 == zero");
         writeln_d(msg);
         return Failure(msg);
      }

      #call unitv(dir0,dir0)
      int iactn = 4;
      gmx = 2.0;
      double bvrmch = 1.0;   //TODO - find for real
      double fmachp = 1.0;   //TODO - find for real
      spd0 = PLATFORM.Speed() * MATH.Max(1.0,bvrmch/fmachp);   #spd0 in meter/seconds units here
      int spdmod = 1;   //(desspd = 1, thrttl = 2, desacc = 3)

      ### Evaluate [Projected] Maneuver Alternative
      double score = brawlerPlatform.EvaluateVectorWithSpeed(dir0, gmx, spd0, ilevel, kalt, icall, lcall);
      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, dir0, int, else, gmx, double, spd0, return

### precondition（behavior_alt3841_aim_missile_typ4）｜状态前置条件

- **关键词**：precondition, if, bool, else, int, double, spd0, dir0, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3841_aim_missile_typ4.txt:76-192`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_alt3841_aim_missile_typ4.txt:73`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition behavior_alt33841_aim_missile_typ4, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      ### check if alternative should even be considered?

      if (!mAlternative3841Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      if(tasks.Count() <= 0)
      {
         return Failure("no weapon (target) tasks!");
      }
      WsfTask targetTask = tasks.Entry(0);
      targetTrack = PLATFORM.MasterTrackList().Find(targetTask.LocalTrackId());
      if (!targetTrack.IsValid())
      {
         return Failure("no target track!");
      }

      bool alt_ctrl = false;   //see ali38()
      bool msl_loft = false;   //see line 147 (no productions rules right now)

      ## alt38.f : lines 136 - 150
      #if (noaim) go to 980
      #if (mslpp .ge. nummis+1) then
      if (!HaveWeapon(PLATFORM))
      {
         # SKIP ALT_CTRL DETERMINATION IF SELECTED WEAPON IS A GUN
         alt_ctrl = false;
         msl_loft = false;
         //go to 900
      }
      else
      {
         #call gmisld(ppmptr,1)   #TODO
         # Call special handler to see if desire missile loft
         #call pcode(23)          #TODO
         # Loft missile if ready and pr_loft is set
         #msl_loft = (ready && pr_loft);   #TODO
      }

      ## alt38.f : lines 227 - 253
      # generate aim_missile_typ4 unless alt_ctrl = T.
      if (alt_ctrl)
      {
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " alt_ctrl is true, do not do aim_missile_typ4 behavior");
         writeln_d(msg);
         return Failure(msg);
      }
      # generate aim_missile_typ1 if pointing in direction of aimpoint
      #LBM - not doing vectored flight right now
#      if (valfpp > 0.0)
#      {
#         double theta = sepa(dxeuan(1,ppmiac),vecfpp);
#         if (theta > 0.8*zeta_lim)
#         {
#            return Failure("not pointing in right direction, do not do aim_missile_typ4 behavior");
#         }
#      }

      #LBM - not a manned sim, dont even check, right now
      #if (simltr != mansim) goto 900
      # This is a replacement for icall=1 maneuver, for manned simulators
      # Use a type 4 maneuver to avoid stability problems with type
      # 9 maneuver at WSSC:
      int iactn = 4;
      Vec3 ppmapt;   //calculated from mlsenv() -> envgeo() -> aimpt()

      WsfWaypoint aimptWP = WsfWaypoint();
      double weaponSpeedFtSec = 3349.35;   //(mach 3) ft/sec
      double intTime = PLATFORM.InterceptLocation3D(targetTrack, aimptWP, weaponSpeedFtSec, 5.0);
      if (intTime < 0)
      {
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " missile intercept not possible!");
         writeln_d(msg);
         return Failure(msg);
      }
      #call vdir(xp(1,me),ppmapt,desdir);
      Vec3 desdir = RelativePositionNED(PLATFORM.Location(), aimptWP.Location());
      desdir.Normalize();
      double spddes = PLATFORM.Speed()*MATH.FT_PER_M();   //from ali38() -> slow_aim is never set, so use current speed
      #call des1v1(desdir,spddes,dir0,spd0,lngtrn,semin,sewid);
      spd0 = spddes;   //from des1v1 (direct copy, duh)
      dir0 = desdir;   //from des1v1 (direct copy, duh)
      int spdmod = 1;   //(desspd = 1, thrttl = 2, desacc = 3)
      if ((PLATFORM.Speed()*MATH.FT_PER_M()) <= spd0+100.0)
      {
         double gmxsut = brawlerPlatform.MaxSustainedGs();
         double gmxsu = brawlerPlatform.MaxTacticalGs();
         double wt = ramp(spd0-100.0, PLATFORM.Speed()*MATH.FT_PER_M(), spd0+100.0);
         gmx = wt*MATH.Max(2.0,MATH.Max(gmxsut,gmxsu)) + (1.0-wt)*MATH.Min(gmxsut,gmxsu);
         gmx = MATH.Max(gmx,2.0);
      }
      else
      {
         gmx = brawlerPlatform.MaxAvailableGs();    #gmxin
      }
      spd0 *= MATH.M_PER_FT();


      ### Evaluate [Projected] Maneuver Alternative
      double score = brawlerPlatform.EvaluateVectorWithSpeed(dir0, gmx, spd0, ilevel, kalt, icall, lcall);
      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, bool, else, int, double, spd0, dir0, return

### precondition（behavior_alt3471_slow_current_dir）｜状态前置条件

- **关键词**：precondition, if, int, dir0, double, gmx, spd0, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3471_slow_current_dir.txt:63-105`　（同签名共 12 处，另见 `brawler/platforms/alternatives/behavior_alt3471_slow_current_dir.txt:57`、`brawler/platforms/alternatives/behavior_alt3472_slow_pull_right.txt:57`、`brawler/platforms/alternatives/behavior_alt3473_slow_pull_left.txt:57`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition alt3471 slow_current_dir, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      if (!mAlternative3471Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      ##alt347.f line 108    //initialize value
      #call vnorm(vp(1,me),myvdir)
      ##alt347.f line 124 - 134
      #iactn=4
      #call xmit(3,myvdir,dir0)
      #gmx=amin1(3.,gmxsu)
      #spd0=spdnow(me)+almin*tproj3*1.1
      #spd0 = amax1(200.,spd0)
      #spdmod = desspd

      Vec3 myvdir = PLATFORM.VelocityNED().Normal();
      int iactn = 4;
      dir0 = myvdir;
      double gmxsu = brawlerPlatform.MaxTacticalGs();
      gmx = MATH.Min(3.0,gmxsu);
      double almin  = brawlerPlatform.MinForwardAccelWithGravity(); #ft/sec^2
      spd0 = PLATFORM.Speed() * MATH.FT_PER_M() + almin * brawlerPlatform.ProjectedTimeDelta() * 1.1;
      spd0 = MATH.Max(200.0, spd0);
      spd0 *= MATH.M_PER_FT();
      int spdmod = 1;   //desspd   // spdmod = thrttl (desspd = 1, thrttl = 2, desacc = 3)

      ### Project and Evaluate (Score) Maneuver Alternative
      double score = brawlerPlatform.EvaluateVectorWithSpeed(dir0, gmx, spd0, ilevel, kalt, icall, lcall);
      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, int, dir0, double, gmx, spd0, return

### precondition（behavior_alt3474_slow_pull_current_plane）｜状态前置条件

- **关键词**：precondition, if, int, a0, double, gmx, spd0, return, 状态前置条件
- **出处**：`brawler/platforms/alternatives/behavior_alt3474_slow_pull_current_plane.txt:57-107`　（同签名共 2 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt3474_slow_pull_current_plane.txt:62`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition alt3474 slow_pull_current_plane, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_BRAWLER_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_BRAWLER_PROCESSOR");
      }

      if (!mAlternative3474Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      ##alt347.f line 108    //initialize value
      #call vnorm(vp(1,me),myvdir)
      ##alt347.f line 165 - 183
      #if(xmag(ap(1,me)).lt.0.1)then
      #   //FAIL
      #endif
      #iactn=3
      #call cross(myvdir,ap(1,me),a0)
      #call vnorm(a0,a0)
      #gmx = gmxsu*grav
      #--spd0 is a throttle setting under the NEW  iactn=3  format
      #spd0 = -1.0

      Vec3 myvdir = PLATFORM.VelocityNED().Normal();
      Vec3 ap = PLATFORM.AccelerationNED();   //meters/sec^2
      if(ap.Magnitude() < (0.1 * Math.M_PER_FT()))
      {
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " acceleration not high enough to clearly define a maneuever plane!");
         writeln_d(msg);
         return Failure(msg);
      }
      int iactn = 3;
      a0 = Vec3.Cross(myvdir, ap).Normal();
      double gmxsu = BRAWLER.MaxTacticalGs();
      gmx = gmxsu*grav;
      #--spd0 is a throttle setting under the NEW  iactn=3  format
     #spd0 = -1.0;   //this means 100% thrust reversal setting
      spd0 =  1.0;   //NO thrust reversal in brawler -> -1 gets converted to 1 (mil power)

      ### Project and Evaluate (Score) Maneuver Alternative
      double score = BRAWLER.EvaluateTurnInPlaneWithThrottle(a0, gmx, spd0, ilevel, kalt, icall, lcall);
      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, int, a0, double, gmx, spd0, return

### precondition（behavior_alt3441_tail_attack）｜状态前置条件

- **关键词**：precondition, if, int, bool, else, double, gmx, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:169-315`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_alt3441_tail_attack.txt:160`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition alt3441 tail_attack, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      if (!mAlternative3441Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      if(tasks.Count() <= 0)
      {
         writeln_d("no weapon (target) tasks!");
         return Failure("no weapon (target) tasks!");
      }
      WsfTask targetTask = tasks.Entry(0);
      targetTrack = PLATFORM.MasterTrackList().Find(targetTask.LocalTrackId());
      if (!targetTrack.IsValid())
      {
         writeln_d("no target track!");
         return Failure("no target track!");
      }
      if (!targetTrack.VelocityValid())
      {
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " target track does not have valid velocity!");
         writeln_d(msg);
         return Failure(msg);
      }

      ##alt344.f line 172 - 224
      int iactn = 4;
      # GENERATE TURNS IN MANEUVER PLANE CONTAINING LOS TO OPPONENT
      Vec3 dxpme = RelativePositionNED(PLATFORM.Location(),targetTrack.CurrentLocation());
      Vec3 vp = PLATFORM.VelocityNED();
      Vec3 vp_iac =  targetTrack.VelocityNED();
      bool bhndme = (Vec3.Dot(dxpme,vp) < 0.0);
      bool bhndhm = (Vec3.Dot(dxpme,vp_iac) > 0.0);

      if (bhndme && bhndhm)
      {
         # BEHIND EACH OTHER: WANT COURSE REVERSAL
         # USE TAIL ATTACK FOR NOW
         talatk();
      }
      else if (bhndme && !bhndhm)
      {
         # HE'S ON MY TAIL!: NO TAIL ATTACK ALTERNATIVE GENERATED
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " HE IS ON MY TAIL! NO TAIL ATTACK!");
         writeln_d(msg);
         return Failure(msg);
      }
      else if (!bhndme && bhndhm)
      {
         # I'M ON HIS TAIL!: GENERATE TAIL ATTACK
         talatk();
      }
      else if (!bhndme && !bhndhm)
      {
         # NOSE TO NOSE: PLAN INTERCEPT
         #call aimpt(xp(1,me),spdnow(me),xp(1,iac),vp(1,iac),spdnow(iac),daimpt,lsoln);
         WsfWaypoint aimptWP = WsfWaypoint();
         double intTime = PLATFORM.InterceptLocation3D(targetTrack, aimptWP);
         #if (lsoln)
         if (intTime > 0)
         {
            WsfGeoPoint daimpt = aimptWP.Location();
            #call vsub(daimpt,xp(1,me),dxaim);
            Vec3 dxaim = RelativePositionNED(PLATFORM.Location(), daimpt);   #NED coordinates
            dir0 = dxaim.Normal();
            spd0 = 3.0;
            spdmod = 2;   //(desspd = 1, thrttl = 2, desacc = 3)
         }
         else
         {
            //return Failure("ERROR: intercept somehow not possible, even though head to head with target!");
            # ASSUME OVERSHOOT, SO TRY A TAIL ATTACK
            talatk();
         }
      }
      else
      {
         //call nabort('AL344...UNKNOWN GEOMETRY');
         string msg = write_str("T=",TIME_NOW,", alt ", ilevel, kalt, icall, lcall, " ...UNKNOWN GEOMETRY");
         writeln_d(msg);
         return Failure(msg);
      }

      //lmore = .true.
      double gmxsu = brawlerPlatform.MaxTacticalGs();
      gmx = gmxsu;

      ### Project and Evaluate (Score) Maneuver Alternative
      double score = 0;
      if (spdmod == 2)
      {
         score = brawlerPlatform.EvaluateVectorWithThrottle(dir0, gmx, spd0, ilevel, kalt, icall, lcall);
      }
      else
      {
         score = brawlerPlatform.EvaluateVectorWithSpeed(dir0, gmx, spd0 * MATH.M_PER_FT(), ilevel, kalt, icall, lcall);
      }
      writeln_d("T=", TIME_NOW, ", 3441_tail_attack       = ", score);

      writeln_d("raw = ", brawlerPlatform.RawManeuverValueComponent("offensive"),
                    ", ", brawlerPlatform.RawManeuverValueComponent("low speed recovery"),
                    ", ", brawlerPlatform.RawManeuverValueComponent("defensive"),
                    ", ", brawlerPlatform.RawManeuverValueComponent("illumination"),
                    ", ", brawlerPlatform.RawManeuverValueComponent("missile evasion"),
                    ", ", brawlerPlatform.RawManeuverValueComponent("missile aiming"));

      writeln_d("component = ", brawlerPlatform.ManeuverValueComponent("offensive"),
                          ", ", brawlerPlatform.ManeuverValueComponent("low speed recovery"),
                          ", ", brawlerPlatform.ManeuverValueComponent("defensive"),
                          ", ", brawlerPlatform.ManeuverValueComponent("illumination"),
                          ", ", brawlerPlatform.ManeuverValueComponent("missile evasion"),
                          ", ", brawlerPlatform.ManeuverValueComponent("missile aiming"));

      writeln_d("tunnel = ", brawlerPlatform.TunnelVisionMultiplier("offensive"),
                       ", ", brawlerPlatform.TunnelVisionMultiplier("low speed recovery"),
                       ", ", brawlerPlatform.TunnelVisionMultiplier("defensive"),
                       ", ", brawlerPlatform.TunnelVisionMultiplier("illumination"),
                       ", ", brawlerPlatform.TunnelVisionMultiplier("missile evasion"),
                       ", ", brawlerPlatform.TunnelVisionMultiplier("missile aiming"));

      writeln_d("bias = ", brawlerPlatform.InherentBiasFaults("aggressiveness"),
                     ", ", brawlerPlatform.InherentBiasFaults("mutual support"),
                     ", ", brawlerPlatform.InherentBiasFaults("airspeed maintenance"));

      writeln_d("mult = ", brawlerPlatform.OffensiveMultiplier(),
                   ", ", brawlerPlatform.DefensiveMultiplier());

      if (targetTrack.Target().IsValid())
      {
         writeln_d("engage = ", brawlerPlatform.LastEngagementValue(targetTrack.Target()));
      }

      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, int, bool, else, double, gmx, return

### precondition（behavior_alt3611_fly_vector）｜状态前置条件

- **关键词**：precondition, if, extern, dir0, spd0, double, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3611_fly_vector.txt:76-144`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_alt3611_fly_vector.txt:66`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition behavior_alt33841_aim_missile_typ4, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      ### check if alternative should even be considered?

      if (!mAlternative3611Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      if(tasks.Count() <= 0)
      {
         return Failure("no weapon (target) tasks!");
      }
      WsfTask targetTask = tasks.Entry(0);
      targetTrack = PLATFORM.MasterTrackList().Find(targetTask.LocalTrackId());
      if (!targetTrack.IsValid())
      {
         return Failure("no target track!");
      }



      extern Vec3   vecfpp;
      extern double valfpp;
      extern double sflypp;
   #alt36()
      #iactn = 4
   #set_gmx()
      Vec3 vv = vecfpp.Normal();
      dir0 = desvvi(brawlerPlatform, vv, sflypp);
      spd0 = dir0.Magnitude();
      dir0.Normalize();

      //spdmod = desspd;
      //call indupk(altd1,tac_ilevel,tac_kalt,tac_icall,tac_lcall);
      //if (tac_kalt.ne.8 .or. tac_icall.ne.2) then
         if ((PLATFORM.Speed()*MATH.FT_PER_M()) <= spd0+100.0)
         {
            double gmxsut = brawlerPlatform.MaxSustainedGs();
            double gmxsu = brawlerPlatform.MaxTacticalGs();
            double wt = ramp(spd0 - 100.0, PLATFORM.Speed()*MATH.FT_PER_M(),spd0+100.0);
            gmx = wt*MATH.Max(2.0,MATH.Max(gmxsut,gmxsu)) + (1.0-wt)*MATH.Min(gmxsut,gmxsu);
            gmx = MATH.Max(gmx,2.0);
         }
         else
         {
            gmx = brawlerPlatform.MaxAvailableGs();  #gmxin;
         }
      //else
         #LBM - not doing GCI drag tactic (1,8,2,1) right now
         //...
      //endif
      spd0 *= MATH.M_PER_FT();
      double score = brawlerPlatform.EvaluateVectorWithSpeed(dir0, gmx, spd0, ilevel, kalt, icall, lcall);
      writeln_d("alt3611_fly_vector score = ", score);
      return score;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, extern, dir0, spd0, double, return

### precondition（behavior_manage-pincer）｜状态前置条件

- **关键词**：precondition, if, extern, foreach, else, int, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_manage-pincer.txt:121-254`　（同签名共 2 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_manage-pincer.txt:121`）
- **片段**：

```text
   precondition

      #writeln_d("precondition manage-pincer");

      if (PROCESSOR.SubordinateProcessors().Size() < mNumSubsInvolved)
      {
         RemovePincerJob();
         writeln_d("not enough subordinates");
         return Failure("not enough subordinates");
      }

      if (mRequireActiveWeapons)
      {
         int weaponCount = 0;
         Array<WsfRIPRProcessor> subs = PROCESSOR.SubordinateProcessors();
         foreach(WsfRIPRProcessor proc in subs)
         {
            weaponCount = weaponCount + proc.WeaponsActive();
         }
         if (weaponCount <= 0)
         {
            RemovePincerJob();
            writeln_d("no active weapons, no pincer yet");
            return Failure("no active weapons, no pincer yet");
         }
      }

      mSubPoint = SubordinatesMeanLocation();

      extern bool TestTrackCategory(WsfTrack, string);
      mTrackArray.Clear();
      mTargetNames.Clear();
      foreach (WsfLocalTrack track in PLATFORM.MasterTrackList())
      {
         if (  (track.IFF_Friend()) ||
            (track.SideValid() && track.Side() == PLATFORM.Side()) ||
            (! track. LocationValid() ) ||
            (track.SlantRangeTo(mSubPoint) > mThresholdDistance) ||
            (TestTrackCategory(track, "unknown"))  )
         {
            continue;
         }
         track.SetBearing( track.Heading() ); #useful for the cluster processing
         mTrackArray.PushBack(track);
         mTargetNames.PushBack(track.TargetName());
      }

      if (mTrackArray.Size() > 0)
      {
         mClusterManager.UpdateClusters(TIME_NOW,mTrackArray);
         if (mDrawClusters == true)
         {
            for (int i = 0; i < mClusterManager.Count(); i = i + 1 )
            {
               draw_cluster_hull(mClusterManager.Entry(i));
            }
         }

         if (mClusterManager.Count() > 1)
         {
            //check distances
            double near  = MATH.DOUBLE_MAX();
            double near2 = MATH.DOUBLE_MAX();

            for (int i = 0; i < mClusterManager.Count(); i = i + 1 )
            {
               double dist = mClusterManager.Entry(i).MeanLocation().SlantRangeTo(mSubPoint);
               if (dist < near)
               {
                  if (near < near2)
                  {
                     near2 = near;
                  }
                  near = dist;
               }
               else if (dist < near2)
               {
                  near2 = dist;
               }
            }

            double ratio = near2/near;
            if (ratio < mMinDistanceRatio)
            {
               RemovePincerJob();
               writeln_d("threats too spread out!");
               return Failure("threats too spread out!");
            }
         }

         WsfCluster cluster = mClusterManager.Entry(0);
         mMeanPoint = cluster.MeanLocation();
         mMeanBearingValid = cluster.BearingValid();
         mMeanBearing = cluster.Bearing();
      }
      else //no threats to pincer against, exit out
      {
         RemovePincerJob();
         writeln_d("no threats to pincer against yet!");
         return Failure("no threats to pincer against yet!");
      }

      //check separation of all subordinates
      //only relavent if not currently in phase 2 (dragging & chasing)
      int dragging = 0;
      if(mPincerJob.IsValid())
      {
         dragging = (int)mPincerJob.GetData("left_drag") + (int)mPincerJob.GetData("right_drag");
      }
      if (dragging == 0)
      {
         Array<WsfPlatform> subs = PROCESSOR.SubordinatePlatforms();
         WsfGeoPoint subMean = MeanLocation(subs);
         double standard = mMeanPoint.TrueBearingTo(subMean);
         double min = 361;
         double max = -361;
         foreach(WsfPlatform p in subs)
         {
            double b = MATH.NormalizeAngleMinus180_180(mMeanPoint.TrueBearingTo(p.Location()) - standard);
            min = MATH.Min(min, b);
            max = MATH.Max(max, b);
         }
         double diff = max - min;
         if (diff >= mMaxSeparationAngle)
         {
            RemovePincerJob();
            writeln_d("pincer complete, targets flanked!");
            return Failure("pincer complete, targets flanked!");
         }
      }

      mDraw.SetDuration(PROCESSOR.UpdateInterval());
      return true;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, extern, foreach, else, int, return

### precondition（behavior_disengage）｜状态前置条件

- **关键词**：precondition, extern, double, foreach, if, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_disengage.txt:61-130`
- **片段**：

```text
   precondition
      writeln("precondition disengage");

      //check track list or threat processor for any threats
      extern double mVisualRange;
      double totalThreatsWVR = 0.0;
      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         if (!t.SideValid() || t.Side() != PLATFORM.Side())
         {
            if ((!IsWeapon(t)) && (PLATFORM.SlantRangeTo(t) < mVisualRange))
            {
               writeln_d("    is threat: ", t.TargetName());
               totalThreatsWVR = totalThreatsWVR + 1.0;
            }
         }
      }

      double assetCount = 0.0;
      WsfRIPRProcessor cmdr = PROCESSOR.GetRIPRCommanderProcessor();  # get the flight lead
      if (cmdr.IsValid())
      {
         WsfRIPRProcessor cmdr2 = cmdr.GetRIPRCommanderProcessor();  # check for gci
         if (cmdr2.IsValid())
         {
            foreach (WsfPlatform aifl in cmdr2.Platform().Subordinates())
            {
               foreach (WsfPlatform aiai in aifl.Subordinates())
               {
                  if (IsFlightAsset(aiai) && PLATFORM.SlantRangeTo(aiai) < mVisualRange)
                  {
                     writeln_d("    is asset: ", aiai.Name());
                     assetCount = assetCount + 1.0;
                  }
               }
            }
         }
         else
         {
            foreach (WsfPlatform aiai in cmdr.Platform().Subordinates())
            {
               if (IsFlightAsset(aiai) && PLATFORM.SlantRangeTo(aiai) < mVisualRange)
               {
                  writeln_d("    is asset: ", aiai.Name());
                  assetCount = assetCount + 1.0;
               }
            }
         }
      }

      extern double mEngagementAggressiveness;
      double requiredAggressiveness = totalThreatsWVR / (totalThreatsWVR + assetCount);

      writeln_d("    required aggress for disengage: ", requiredAggressiveness, " mine: ", mEngagementAggressiveness);

      if (mEngagementAggressiveness < requiredAggressiveness)
      {
         draw.SetDuration(PROCESSOR.UpdateInterval());
         return true;   //disengage
      }

      //check if there are any threats that I need to evade
      //if there are & I have an energy advantage (altitude &/or speed), then extend the escape & unload

      //???
      //???
      //???

      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, double, foreach, if, return

### precondition（behavior_pursue-target）｜状态前置条件

- **关键词**：precondition, if, double, string, extern, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target.txt:297-367`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_pursue_base.txt:123`、`base_types/processors/quantum_agents/aiai/behavior_pursue-target (2).txt:117`）
- **片段**：

```text
   precondition
      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }
      writeln_d(PLATFORM.Name(), " precondition pursue-target, T=", TIME_NOW);
      ((WsfRIPRProcessor)PROCESSOR).ClearTarget();

      double duration = TIME_NOW - mLastTime;
      mLastTime = TIME_NOW;
      if (duration > (1.5*((WsfRIPRProcessor)PROCESSOR).UpdateInterval()))
      {
         mOldTargetStr = "no target";
      }
      string anOldTargetStr = mOldTargetStr;
      mOldTargetStr = "no target";

      WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         if (commander.IsJobWindowOpen())
         {
            writeln_d("pursue-target: commander.GetJobFor()");
            mCurrentJob = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, ((WsfRIPRProcessor)PROCESSOR));
         }
         else
         {
            writeln_d("pursue-target: commander's job window closed, keeping current job!");
         }
      }
      if (mCheckOwnJobBoardToo &&
          (mCurrentJob.IsNull() || !mCurrentJob.IsValid()))
      {
         writeln_d("pursue-target: myself.GetJobFor()");
         mCurrentJob = ((WsfRIPRProcessor)PROCESSOR).GetJobFor(TIME_NOW, ((WsfRIPRProcessor)PROCESSOR));
      }

      if (mCurrentJob.IsNull() || !mCurrentJob.IsValid() )
      {
         writeln_d("pursue-target ClearTarget -> job not a valid pursue-target job");
         return Failure("job is not a valid pursue-target job");
      }
      if (mCurrentJob.Name() != "pursue-target")
      {
         string msg = write_str("job is a ", mCurrentJob.Name(), " instead of a pursue-target job");
         writeln_d(msg);
         return Failure("job is not a pursue-target job");
      }

      extern WsfTrack GetTrackByName        (WsfPlatform, string);
      string   targetName  = (string)mCurrentJob.GetData("targetTrackName");
      WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);

      if (!targetTrack.IsValid())
      {
         writeln_d("    No valid target track found for target named ", targetName);
         return Failure("target track not found");
      }

      ########################################################################
      ###   print output / comments for any target change
      #######################################################################
      mOldTargetStr = "Job: " + mCurrentJob.Name() + ", " + mCurrentJob.GetDescription();
      writeln_d("    - ", mOldTargetStr);
      if (mOldTargetStr != anOldTargetStr)
      {
         PLATFORM.Comment(mOldTargetStr);
      }
      ((WsfRIPRProcessor)PROCESSOR).SetTarget(targetTrack);
      return true;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, double, string, extern, return

### precondition（behavior_alt3411_straight_flight）｜状态前置条件

- **关键词**：precondition, if, double, int, dir0, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt3411_straight_flight.txt:71-144`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_alt3411_straight_flight.txt:65`）
- **片段**：

```text
   precondition
      #writeln_d(PLATFORM.Name(), " precondition behavior_alt3411_straight_flight, T=", TIME_NOW);

      ### Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("not a quantum tasker!");
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      if (!mAlternative3411Enabled)
      {
         writeln_d("behavior not enabled!");
         return Failure("behavior alternative not enabled");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("WEAPON");
      if(tasks.Count() <= 0)
      {
         return Failure("no weapon (target) tasks!");
      }
      WsfTask targetTask = tasks.Entry(0);
      targetTrack = PLATFORM.MasterTrackList().Find(targetTask.LocalTrackId());
      if (!targetTrack.IsValid())
      {
         return Failure("no target track!");
      }

      // Get nearest hostile and check that range is less than max
      // alt34.f line 114
      WsfTrack nearestHostile = perception.NearestThreat();
      double rangeToNearest = 999999999; # default large value, in meters
      if (nearestHostile.IsValid() &&
          nearestHostile.LocationValid())
      {
         rangeToNearest = nearestHostile.SlantRangeTo(PLATFORM);
      }

      if (!nearestHostile.IsValid())
      {
         writeln_d("nearest hostile not valid!");
         return Failure("no vaild hostiles closer than 5 nautical miles");
      }

      if (rangeToNearest > mLongRange)
      {
         writeln_d("nearest hostile too far away! (", rangeToNearest," m)");
         return Failure("no vaild hostiles closer than 5 nautical miles");
      }

      // ALL CONDITIONS PASS
      ### Generate Maneuver Alternative
      # alt34.f line 115 - 121
      # iactn = 4
      # call vnorm(vp(1,me),dir0) - get a unit vector (dir0) of my current velocity vector
      # gmx = amin1(3.,gmxsu) - take the smaller of 3.0 and Maximum load possible at maximum thrust
      # spd0 = 3.
      # spdmod = thrttl (desspd = 1, thrttl = 2, desacc = 3)
      int iactn = 4;
      dir0 = PLATFORM.VelocityNED().Normal();
      mGMX = Math.Min(3.0, brawlerPlatform.MaxSustainedGs());
      mSpd0 = 3.0;
      int spdmod = 2; // thrttl

      ### Project and Evaluate (Score) Maneuver Alternative
      // Alternative is only projected tproj sec and then evaluated
      double alternativeScore = brawlerPlatform.EvaluateVectorWithThrottle(dir0, mGMX, mSpd0, ilevel, kalt, icall, lcall);
      writeln_d(PLATFORM.Name(), " behavior_alt3411_straight_flight score = ", alternativeScore, ", T=", TIME_NOW);

      ### Return Maneuver Alternative Score
      return alternativeScore;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, double, int, dir0, return

### precondition（behavior_go_home）｜状态前置条件

- **关键词**：precondition, string, bool, if, else, return, 状态前置条件
- **出处**：`base_types/processors/timeline_agents/behavior_go_home.txt:93-187`　（同签名共 7 处，另见 `base_types/processors/quantum_agents/aiai/behavior_go_home.txt:89`、`brawler/processors/quantum_agents/behavior_go_home.txt:91`、`heatmap/processors/quantum_agents/aiai/behavior_go_home.txt:92`）
- **片段**：

```text
   precondition
      writeln_d("precondition go_home");

#      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
#      {
#         return Failure("behavior not attached to a RIPR processor!");
#      }

      string msg = "";
      bool result = false;
      // go home if bingo on fuel
      if (mCheckFuel == true &&
          PLATFORM.FuelRemaining() < PLATFORM.FuelBingoQuantity())
      {
          msg = "GO HOME: bingo fuel";
          result = true;
      }
      // go home if all my escorts are dead or gone
      else if (mCheckEscorts == true &&
               !HasEscorts())
      {
         msg = "GO HOME: all escorts are dead or gone";
         result = true;
      }
#      // go home if there are no uplinks remaining
#      else if (mCheckUplinks == true &&
#               ((WsfRIPRProcessor)PROCESSOR).UplinkCount() <= 0)
#      {
#         msg = "GO HOME: no active uplinks";
#         result = true;
#      }
      // go home if all weapons, including my own, in the peer group are out of ammo
#      else if (mCheckAllWeapons == true &&
#               ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderPlatform().IsValid())
#      {
#         msg = "GO HOME: all weapons in group are out of ammo";
#         result = true;
#         foreach( WsfPlatform sub in ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderPlatform().Subordinates() )
#         {
#            if (mMainWeapon != "")
#            {
#                WsfWeapon temp = sub.Weapon(mMainWeapon);
#                if (temp.IsValid() &&
#                    temp.QuantityRemaining() > 0)
#                {
#                   msg = "";
#                   result = false;
#                }
#            }
#            else if (NumWeaponsRemaining(sub) > 0.0)
#            {
#               msg = "";
#               result = false;
#            }
#         }
#      }
      // go home if my weapons are out of ammo
      else if (mCheckMyWeapons == true)
      {
         extern bool mRequiredToSupportWeapons;
         if (mMainWeapon != "")
         {
            WsfWeapon temp = PLATFORM.Weapon(mMainWeapon);
            if (temp.IsValid() &&
                temp.QuantityRemaining() <= 0 &&
                (mRequiredToSupportWeapons == false ||
                 PLATFORM.WeaponsActiveFor(WsfTrackId()) <= 0))
            {
               msg = "GO HOME: main weapon out of ammo";
               result = true;
            }
         }
         else if (NumWeaponsRemaining(PLATFORM) <= 0.0 &&
                  (mRequiredToSupportWeapons == false ||
                   PLATFORM.WeaponsActiveFor(WsfTrackId()) <= 0))
         {
               msg = "GO HOME: out of weapons";
               result = true;
         }
      }

      // debug - why is this platform going home?
      if (result)
      {
         writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
         if (msg != mLastComment)
         {
            PLATFORM.Comment(msg);
            mLastComment = msg;
         }
         return true;
      }

      return Failure("plenty of weapons & fuel.");
   end_precondition
```

- **演示要点**：演示 precondition 的参数：string, bool, if, else, return

### precondition（behavior_manage-pincer）｜状态前置条件

- **关键词**：precondition, if, foreach, else, int, return, 状态前置条件
- **出处**：`base_types/processors/ripr_agents/aifl/behavior_manage-pincer.txt:121-258`
- **片段**：

```text
   precondition

      #writeln_d("precondition manage-pincer");
      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }   //((WsfRIPRProcessor)PROCESSOR)

      if (((WsfRIPRProcessor)PROCESSOR).SubordinateProcessors().Size() < mNumSubsInvolved)
      {
         RemovePincerJob();
         writeln_d("not enough subordinates");
         return Failure("not enough subordinates");
      }

      if (mRequireActiveWeapons)
      {
         int weaponCount = 0;
         Array<WsfRIPRProcessor> subs = ((WsfRIPRProcessor)PROCESSOR).SubordinateProcessors();
         foreach(WsfRIPRProcessor proc in subs)
         {
            weaponCount = weaponCount + proc.WeaponsActive();
         }
         if (weaponCount <= 0)
         {
            RemovePincerJob();
            writeln_d("no active weapons, no pincer yet");
            return Failure("no active weapons, no pincer yet");
         }
      }

      mSubPoint = SubordinatesMeanLocation();

     #extern bool TestTrackCategory(WsfTrack, string);
      mTrackArray.Clear();
      mTargetNames.Clear();
      foreach (WsfLocalTrack track in PLATFORM.MasterTrackList())
      {
         if (  (track.IFF_Friend()) ||
            (track.SideValid() && track.Side() == PLATFORM.Side()) ||
            (! track. LocationValid() ) ||
            (track.SlantRangeTo(mSubPoint) > mThresholdDistance) ||
            (TestTrackCategory(track, "unknown"))  )
         {
            continue;
         }
         track.SetBearing( track.Heading() ); #useful for the cluster processing
         mTrackArray.PushBack(track);
         mTargetNames.PushBack(track.TargetName());
      }

      if (mTrackArray.Size() > 0)
      {
         mClusterManager.UpdateClusters(TIME_NOW,mTrackArray);
         if (mDrawClusters == true)
         {
            for (int i = 0; i < mClusterManager.Count(); i = i + 1 )
            {
               draw_cluster_hull(mClusterManager.Entry(i));
            }
         }

         if (mClusterManager.Count() > 1)
         {
            //check distances
            double near  = MATH.DOUBLE_MAX();
            double near2 = MATH.DOUBLE_MAX();

            for (int i = 0; i < mClusterManager.Count(); i = i + 1 )
            {
               double dist = mClusterManager.Entry(i).MeanLocation().SlantRangeTo(mSubPoint);
               if (dist < near)
               {
                  if (near < near2)
                  {
                     near2 = near;
                  }
                  near = dist;
               }
               else if (dist < near2)
               {
                  near2 = dist;
               }
            }

            double ratio = near2/near;
            if (ratio < mMinDistanceRatio)
            {
               RemovePincerJob();
               writeln_d("threats too spread out!");
               return Failure("threats too spread out!");
            }
         }

         WsfCluster cluster = mClusterManager.Entry(0);
         mMeanPoint = cluster.MeanLocation();
         mMeanBearingValid = cluster.BearingValid();
         mMeanBearing = cluster.Bearing();
      }
      else //no threats to pincer against, exit out
      {
         RemovePincerJob();
         writeln_d("no threats to pincer against yet!");
         return Failure("no threats to pincer against yet!");
      }

      //check separation of all subordinates
      //only relavent if not currently in phase 2 (dragging & chasing)
      int dragging = 0;
      if(mPincerJob.IsValid())
      {
         dragging = (int)mPincerJob.GetData("left_drag") + (int)mPincerJob.GetData("right_drag");
      }
      if (dragging == 0)
      {
         Array<WsfPlatform> subs = ((WsfRIPRProcessor)PROCESSOR).SubordinatePlatforms();
         WsfGeoPoint subMean = MeanLocation(subs);
         double standard = mMeanPoint.TrueBearingTo(subMean);
         double min = 361;
         double max = -361;
         foreach(WsfPlatform p in subs)
         {
            double b = MATH.NormalizeAngleMinus180_180(mMeanPoint.TrueBearingTo(p.Location()) - standard);
            min = MATH.Min(min, b);
            max = MATH.Max(max, b);
         }
         double diff = max - min;
         if (diff >= mMaxSeparationAngle)
         {
            RemovePincerJob();
            writeln_d("pincer complete, targets flanked!");
            return Failure("pincer complete, targets flanked!");
         }
      }

      mDraw.SetDuration(PROCESSOR.UpdateInterval());
      return true;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, foreach, else, int, return

### precondition（shoot_it）｜状态前置条件

- **关键词**：precondition, extern, if, else, return, 状态前置条件
- **出处**：`air_to_air/rules/shoot_it.txt:81-95`　（同签名共 2 处，另见 `air_to_air/rules/sam_shoot_it.txt:74`）
- **片段**：

```text
   precondition  
      extern WsfPlatform iacid;
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }
      else if (TIME_NOW < (t_last_pickle+0.5))
      //Switchology delays = time it takes for pilot to select a new target (Brawler uses .5 seconds)
      {
         if(iout_print) {iout.Write(write_str(" SHOOT_IT SWITCHOLOGY DELAY UNTIL T=",t_last_pickle+0.5,"\n"));}
         return Failure("Switchology Delay");
      }
      return Success();
   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, if, else, return

### precondition（behavior_pursue-target_pathing）｜状态前置条件

- **关键词**：precondition, extern, if, string, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target_pathing.txt:43-83`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_cap-route.txt:33`、`base_types/processors/timeline_agents/behavior_timeline_engage.txt:37`）
- **片段**：

```text
   precondition
      writeln("precondition pursue-target_pathing");

      extern WsfTrack GetTrackByName        (WsfPlatform, string);
      extern bool     TestTrackCategory     (WsfTrack, string);

      if (!PLATFORM.GetPathFinder().IsValid())
      {
         writeln("no path-finder available");
         return false;
      }

      // Clear the variables we'll use to store the agent's output
      PROCESSOR.ClearTarget();

      WsfRIPRJob currentJob = null;
      if (PROCESSOR.GetRIPRCommanderProcessor().IsValid())
      {
         currentJob = PROCESSOR.GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, PROCESSOR);
      }

      if (!currentJob.IsValid() || currentJob.Name() != "pursue-target")
      {
         writeln_d("    job not valid pursue-target job from board!");
         return false;
      }

      string   targetName  = (string)currentJob.GetData("targetTrackName");
      WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);

      if (!targetTrack.IsValid() || TestTrackCategory(targetTrack, "unknown"))
      {
         writeln_d("    No known category track found for target ", targetName);
         return false;
      }

      PROCESSOR.SetTarget(targetTrack);

      return true;

   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, if, string, return

### precondition（behavior_engage-target）｜状态前置条件

- **关键词**：precondition, if, extern, double, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage-target.txt:418-465`
- **片段**：

```text
   precondition
      writeln_d("precondition engage-target");

      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }

      extern WsfTrack GetTrackByName(WsfPlatform, string);

      double pitch = PLATFORM.Pitch();
      if (MATH.Fabs(PLATFORM.Roll()) > mMaxFiringRollAngle ||
          pitch > mMaxFiringPitchAngle                     ||
          pitch < mMinFiringPitchAngle)
      {
        string msgStr = write_str("    ", PLATFORM.Name(), " orientation too far off to fire!  (roll or pitch)");
        writeln_d(msgStr);
      //PLATFORM.Comment(msgStr);
        return Failure(msgStr);
      }

      WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         #check all job channels, not just the main target
         for (int channel = 0; channel < ((WsfRIPRProcessor)PROCESSOR).GetNumJobChannels(); channel = channel + 1)
         {
           WsfRIPRJob aJob = commander.GetJobFor(((WsfRIPRProcessor)PROCESSOR), channel);
           if (aJob.IsValid() &&
               aJob.Name() == "pursue-target")
           {
             string   targetName  = (string)aJob.GetData("targetTrackName");
             WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);
             if (!targetTrack.IsNull() &&
                 targetTrack.IsValid())
             {
               extern bool TestTrackCategory( WsfTrack, string );
               if (!TestTrackCategory(targetTrack, "unknown") &&
                   targetTrack.BelievedAlive())
               {
                 return true;
               }
             }
           }
         }
      }
      return Failure("no acceptable target to shoot at!");
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, extern, double, return

### precondition（behavior_in_danger）｜状态前置条件

- **关键词**：precondition, extern, foreach, if, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_in_danger.txt:59-111`
- **片段**：

```text
   precondition
      writeln("precondition in_danger");

      //check track list for any threats
      extern double mVisualRange;
      extern string CalculatePositioning( WsfPlatform, WsfTrack, double );

      //see if anybody is threatening me
      mBiggestThreat = null;

      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         if (!t.SideValid() || t.Side() != PLATFORM.Side())
         {
            double range = PLATFORM.SlantRangeTo(t);
            if ((range < mVisualRange) && NotWeapon(t) && IsFlyer(t.Target()))
            {
               string pos = CalculatePositioning(PLATFORM, t, cANGLE_TOLERANCE );
               if (pos=="tail-to-head" || pos=="target-facing-me")
               {
                  if (!mBiggestThreat.IsValid() || (range < PLATFORM.SlantRangeTo(mBiggestThreat)))
                  {
                     #mBiggestThreat = (WsfTrack)t;
                     mBiggestThreat = t;
                  }
               }
            }
         }
      }

      if (mBiggestThreat.IsValid())
      {
         //if we are closer to our target, stay in the fight
         WsfTrack targetTrack = PROCESSOR.GetTarget();
         if (!targetTrack.IsNull() && targetTrack.IsValid())
         {
            extern double mEngagementAggressiveness;
            double threatRange = PLATFORM.SlantRangeTo(mBiggestThreat);
            double requiredAggressiveness = threatRange / (threatRange + PLATFORM.SlantRangeTo(targetTrack));
            if (mEngagementAggressiveness >= requiredAggressiveness)
            {
               string myPos = CalculatePositioning(PLATFORM, targetTrack, cANGLE_TOLERANCE );
               if (myPos=="head-to-tail" || myPos="me-facing-target")
               {
                  writeln("   not in enough danger, I am chasing target: ", targetTrack.TargetName());
                  return false;  #do not defend, I am aggressive enough to stay after my target, and I am facing my target
               }
            }
         }
         return true;
      }
      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, foreach, if, return

### precondition（behavior_timeline_delay）｜状态前置条件

- **关键词**：precondition, if, extern, string, else, 状态前置条件
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_delay.txt:101-157`　（同签名共 2 处，另见 `base_types/processors/timeline_agents/behavior_timeline_reposition.txt:42`）
- **片段**：

```text
   precondition
      writeln_d(PLATFORM.Name(), " precondition  timeline_delay,  T=", TIME_NOW);
      if (!processor.IsValid())
      {
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      extern bool mRequiredToSupportWeapons;
      if (mRequiredToSupportWeapons == true && PLATFORM.WeaponsActiveFor(WsfTrackId()) > 0)
      {
         return Failure("required to support active weapons - do not delay");
      }

      WsfTask timeline = GetTimeLineTask(processor);
      if (!timeline.IsValid())
      {
         return Failure("not assigned a TIMELINE task");
      }

      extern WsfLocalTrack mNearestTimeLineTarget;
      if (!mNearestTimeLineTarget.IsValid())
      {
         return Failure("no TIMELINE target to fly against");
      }


      #compare risk level with range to nearest target
      #only delay if risk MED:  past DOR and (want to shoot but out of range or waiting on existing shot)
      #              risk HIGH: past MAR and (want to shoot but out of range or waiting on existing shot)
      string RISK = timeline.AuxDataString("RISK");
      if (RISK == "HIGH")
      {
         double MAR          = timeline.AuxDataDouble("MAR");   #range (meters)
         double slantRange   = PLATFORM.GroundRangeTo(mNearestTimeLineTarget.CurrentLocation());
         if (slantRange > MAR)
         {
            return Failure("HIGH RISK agent outside of MAR, dont bother delaying");
         }
         Array<WsfTrack> targets = (Array<WsfTrack>)timeline.AuxDataObject("targets");
         return WaitToTurnAndShoot(targets);
      }
      else if (RISK == "MEDIUM")
      {
         double DOR          = timeline.AuxDataDouble("DOR");   #range (meters)
         double slantRange   = PLATFORM.GroundRangeTo(mNearestTimeLineTarget.CurrentLocation());
         if (slantRange > DOR)
         {
            return Failure("MEDIUM RISK agent outside of DOR, dont bother delaying");
         }
         Array<WsfTrack> targets = (Array<WsfTrack>)timeline.AuxDataObject("targets");
         return WaitToTurnAndShoot(targets);
      }
      else #if (RISK == "LOW")
      {
         return Failure("LOW RISK agent does not go past DOR, no need to delay");
      }
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, extern, string, else

### precondition（behavior_disengage）｜状态前置条件

- **关键词**：precondition, double, foreach, if, return, 状态前置条件
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_disengage.txt:61-130`
- **片段**：

```text
   precondition
      writeln("precondition disengage");

      //check track list or threat processor for any threats
     #extern double mVisualRange;
      double totalThreatsWVR = 0.0;
      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         if (!t.SideValid() || t.Side() != PLATFORM.Side())
         {
            if ((!IsWeapon(t)) && (PLATFORM.SlantRangeTo(t) < mVisualRange))
            {
               writeln_d("    is threat: ", t.TargetName());
               totalThreatsWVR = totalThreatsWVR + 1.0;
            }
         }
      }

      double assetCount = 0.0;
      WsfRIPRProcessor cmdr = PROCESSOR.GetRIPRCommanderProcessor();  # get the flight lead
      if (cmdr.IsValid())
      {
         WsfRIPRProcessor cmdr2 = cmdr.GetRIPRCommanderProcessor();  # check for gci
         if (cmdr2.IsValid())
         {
            foreach (WsfPlatform aifl in cmdr2.Platform().Subordinates())
            {
               foreach (WsfPlatform aiai in aifl.Subordinates())
               {
                  if (IsFlightAsset(aiai) && PLATFORM.SlantRangeTo(aiai) < mVisualRange)
                  {
                     writeln_d("    is asset: ", aiai.Name());
                     assetCount = assetCount + 1.0;
                  }
               }
            }
         }
         else
         {
            foreach (WsfPlatform aiai in cmdr.Platform().Subordinates())
            {
               if (IsFlightAsset(aiai) && PLATFORM.SlantRangeTo(aiai) < mVisualRange)
               {
                  writeln_d("    is asset: ", aiai.Name());
                  assetCount = assetCount + 1.0;
               }
            }
         }
      }

     #extern double mEngagementAggressiveness;
      double requiredAggressiveness = totalThreatsWVR / (totalThreatsWVR + assetCount);

      writeln_d("    required aggress for disengage: ", requiredAggressiveness, " mine: ", mEngagementAggressiveness);

      if (mEngagementAggressiveness < requiredAggressiveness)
      {
         draw.SetDuration(PROCESSOR.UpdateInterval());
         return true;   //disengage
      }

      //check if there are any threats that I need to evade
      //if there are & I have an energy advantage (altitude &/or speed), then extend the escape & unload

      //???
      //???
      //???

      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：double, foreach, if, return

### precondition（behavior_pursue_base）｜状态前置条件

- **关键词**：precondition, if, double, string, return, 状态前置条件
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_pursue_base.txt:123-193`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue-target.txt:117`）
- **片段**：

```text
   precondition
      writeln_d(PLATFORM.Name(), " precondition pursue-target, T=", TIME_NOW);
      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }   //   ((WsfRIPRProcessor)PROCESSOR)

      double duration = TIME_NOW - mLastTime;
      mLastTime = TIME_NOW;
      if (duration > (1.5*PROCESSOR.UpdateInterval()))
      {
         mOldTargetStr = "no target";
      }
      string anOldTargetStr = mOldTargetStr;
      mOldTargetStr = "no target";

      WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         if (commander.IsJobWindowOpen())
         {
            writeln_d("pursue-target: commander.GetJobFor()");
            mCurrentJob = commander.GetJobFor(TIME_NOW, ((WsfRIPRProcessor)PROCESSOR));
         }
         else
         {
            writeln_d("pursue-target: commander's job window closed, keeping current job!");
         }
      }
      if (mCheckOwnJobBoardToo &&
          (mCurrentJob.IsNull() || !mCurrentJob.IsValid()))
      {
         writeln_d("pursue-target: myself.GetJobFor()");
         mCurrentJob = ((WsfRIPRProcessor)PROCESSOR).GetJobFor(TIME_NOW, ((WsfRIPRProcessor)PROCESSOR));
      }

      if (mCurrentJob.IsNull() || !mCurrentJob.IsValid() )
      {
         writeln_d("pursue-target ClearTarget -> job not a valid pursue-target job");
         ((WsfRIPRProcessor)PROCESSOR).ClearTarget();
         return Failure("job is not a valid pursue-target job");
         }
      if (mCurrentJob.Name() != "pursue-target")
      {
         string msg = write_str("job is a ", mCurrentJob.Name(), " instead of a pursue-target job");
         writeln_d(msg);
         return Failure("job is not a pursue-target job");
      }

     #extern WsfTrack GetTrackByName        (WsfPlatform, string);
      string   targetName  = (string)mCurrentJob.GetData("targetTrackName");
      WsfTrack targetTrack = GetTrackByName(PLATFORM, targetName);

      if (!targetTrack.IsValid())
      {
         writeln_d("    No valid target track found for target named ", targetName);
         return Failure("target track not found");
      }

      ########################################################################
      ###   print output / comments for any target change
      #######################################################################
      mOldTargetStr = "Job: " + mCurrentJob.Name() + ", " + mCurrentJob.GetDescription();
      writeln_d("    - ", mOldTargetStr);
      if (mOldTargetStr != anOldTargetStr)
      {
         PLATFORM.Comment(mOldTargetStr);
      }
      ((WsfRIPRProcessor)PROCESSOR).SetTarget(targetTrack);
      return true;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, double, string, return

### precondition（behavior_pursue_weapon_task_target）｜状态前置条件

- **关键词**：precondition, if, double, for, else, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:130-207`　（同签名共 6 处，另见 `behavior_tree/processors/quantum_agents/aiai/selector_pursue_weapon_task_target.txt:129`、`brawler/processors/quantum_agents/behavior_pursue_weapon_task_target.txt:125`、`heatmap/processors/quantum_agents/aiai/behavior_pursue_weapon_task_target.txt:129`）
- **片段**：

```text
   precondition
      writeln_d(PLATFORM.Name(), " precondition quantum_weapon_task, T=", TIME_NOW);
      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      WsfTaskList tasks = processor.TasksReceivedOfType("weapon");
      WsfTrackId targetId;

      if (tasks.Count() <= 0)
      {
         return Failure("no weapon tasks received yet");
      }

     #writeln(PLATFORM.Name(), " received tasks: ", tasks.Count());

      ### FOR DEBUGGING:
#      if (TIME_NOW > 30)
#      {
#         for (int i=0; i<tasks.Count(); i=i+1)
#         {
#            WsfTask task = tasks.Entry(i);
#            writeln("rejecting task, id: ", task.TaskId(), ", target: ", task.TrackId().ToString());
#            processor.RejectTask(task);
#         }
#         return false;
#      }

      double minDist = 999999999999999.9;
      WsfLocalTrack targetTrack;
      for (int i=0; i<tasks.Count(); i=i+1)
      {
         WsfTask task = tasks.Entry(i);
         WsfTrackId tid = task.LocalTrackId();
         WsfLocalTrack aTrack = PLATFORM.MasterTrackList().FindTrack(tid);
         if (aTrack.IsValid())
         {
            //check if the target platform is terminated
            if (!aTrack.Target().IsValid())
            {
               //TODO - report task complete
               processor.SetTaskComplete(task, "SUCCESSFUL");
               continue;
            }

            double range = PLATFORM.SlantRangeTo(aTrack);
            if (range < minDist)
            {
               minDist = range;
               targetId = tid;
               //targetTrack = aTrack;
            }
         }
         else
         {
            //lost track for task
            //TODO: report incomplete (complete unsuccessful)
            //TODO: always report incomplete?  what if we fired on the guy?
#            proc.SetTaskComplete(task, "UNSUCCESSFUL");
            processor.SetTaskComplete(task, "UNSUCCESSFUL");
            //proc.SetTaskProgress(task, "LOST");
         }
      }
#      if (!targetTrack.IsValid())
#      {
#         return Failure("no target track found in weapon tasks");
#      }
      if (targetId.IsValid())
      {
         mTargetId = targetId;
         return true;
      }
      else
      {
         return Failure("no weapon task with target");
      }
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, double, for, else

### precondition（behavior_launch_alert-5_aircraft）｜状态前置条件

- **关键词**：precondition, if, else, double, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_launch_alert-5_aircraft.txt:188-274`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aigci/behavior_launch_alert-5_aircraft.txt:188`）
- **片段**：

```text
precondition
   writelnd("T= ",TIME NOW,", ", PLATFORM.Name()," precondition launch_alert-5 aircraft");
   WsfWeapon test = GetNextAlert5();
   if (!test.IsValid())
   {
      writelnd("T= ", TIME NOW," no alert5 aircraft available to launch!");
      return Failure("no alert5 aircraft available to launch!");
   }
   if (AnyActiveRequests())
   {
      writeln_d("currently launching something");
      return Failure("currently launching something");
   }

   mNumberOfAirThreats = 0; //check num threats every time foreach (WsfTrack track in PLATFORM.MasterTrackList())
   if ((track.TimeSinceUpdated() < 60.0) &&
       (track.LocationValid() || (track.RangeValid() && track.BearingValid())) &&
      #(ValidType(track)) &&
       ((mProtectZoneName != "" || track.WithinZoneOf(PLATFORM, mProtectZoneName)) || PLATFORM.GroundRangeTo(track) < mProtectRange))
   {
      mNumberOfAirThreats = mNumberOfAirThreats + 1;
      writeln_d("threat: ", track.TargetName());
   }

   if (mCheckPeers == true)
   {
      mNumberOfSubsInAir = 0; //reset here, & then count
      WsfPlatform commander = PLATFORM.Commander();
      if (!commander.IsValid())
      {
         writeln_d("no commander!");
         return Failure("no commander!");
      }

      foreach (WsfPlatform sub in commander.Subordinates())
      {
         if (sub.Type() == "FLIGHT_LEAD_RED") # for each flight lead
         {
            foreach (WsfPlatform airInt in sub.Subordinates()) # for each airborne interceptor
            {
               if (airInt.AuxDataExists("ENGAGING") && airInt.AuxDataBool("ENGAGING"))
               {
                  mNumberOfSubsInAir = mNumberOfSubsInAir + 1;
                  writeln_d("subordinate: ", airInt.Name());
               }
               else
               {
                  writeln_d("not engaging: ", airInt.Name());
               }
            }
         }
      }
   }
   else
   {
      mNumberOfSubsInAir = 0; //reset here, & then count
      foreach (WsfPlatform airInt in PLATFORM.Subordinates()) # for each airborne interceptor
      {
         if (airInt.AuxDataExists("ENGAGING") && airInt.AuxDataBool("ENGAGING"))
         {
            mNumberOfSubsInAir = mNumberOfSubsInAir + 1;
            writeln_d("subordinate: ", airInt.Name());
         }
         else
         {
            writeln_d("not engaging: ", airInt.Name());
         }
      }
   }

   if (mNumberOfAirThreats <= mNumberOfSubsInAir)
   {
      writeln_d("T= ",TIME_N0W," ", PLATFORM.Name(),", enough subordinates in air already for threats!");
      return Failure("enough subordinates in air already for threats!");
   }
   double delay = mFlightLaunchDelay;
   if (mFirstLaunch == true)
   {
      delay = mFirstFlightLaunchDelay;
   }
   if ((TIME_NOW-mLastLaunchedTime) < delay)
   {
      writeln_d("T= ",TIME NOW," Still launching previous flight!");
      return Failure("Still launching previous flight!");
   }
   return true;
end_precondition
```

- **演示要点**：演示 precondition 的参数：if, else, double, return

### precondition（behavior_evade）｜状态前置条件

- **关键词**：precondition, if, int, else, return, 状态前置条件
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_evade.txt:142-236`　（同签名共 9 处，另见 `behavior_tree/processors/quantum_agents/aiai/selector_evade.txt:151`、`base_types/processors/timeline_agents/behavior_evade.txt:152`、`brawler/processors/quantum_agents/behavior_evade.txt:148`）
- **片段**：

```text
   precondition
      writeln_d(PLATFORM.Name(), " precondition evade, T=", TIME_NOW);

      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }

      //always evade incoming weapons
      int ownshipWeaponsIncoming = 0;
      WsfProcessor proc = PLATFORM.Processor("incoming_threats");
      if (proc.IsValid() && proc.ScriptExists("ThreatProcessorWeaponsIncoming"))
      {
        writeln_d("using incoming_threats threat processor!!!");
        mIncoming = (Array<WsfPlatform>)(proc.Execute("ThreatProcessorWeaponsIncoming"));
        ownshipWeaponsIncoming = mIncoming.Size();
      }
      else
      {
        writeln_d("using standard WSF_THREAT_PROCESSOR!!!");
        mIncoming.Clear();
        ownshipWeaponsIncoming = ((WsfRIPRProcessor)PROCESSOR).WeaponsIncoming(mIncoming);
      }

      if (ownshipWeaponsIncoming > 0)
      {
         //we now have weapons incoming, check to see if we are currently guiding any missiles with an uplink
         //basically: check if we have any active weapons
         int WeaponCount = ((WsfRIPRProcessor)PROCESSOR).WeaponsActive();
         if (WeaponCount > 0)
         {
            writeln_d(PLATFORM.Name(), " weapons incoming, checking weapons active, count: ", WeaponCount);
            double threat = 1000.0;
            double asset  = 1000.0;

            //find most threatening incoming weapon
            foreach(WsfPlatform p in mIncoming)
            {
               double range = PLATFORM.SlantRangeTo(p);  # meters
               double speed = p.Speed();                 # meters/sec
               double time  = range / speed;             # seconds
               if (time < threat)
               {
                  threat = time;
               }
            }

            //find most valuable launched weapon (most threatening to enemy)
            for (int i=0; i< WeaponCount; i=i+1)
            {
               WsfPlatform w = ((WsfRIPRProcessor)PROCESSOR).ActiveWeaponPlatform(i);
               WsfTrack    t = w.CurrentTargetTrack();
               // include weapons we are uplinking to.
               if (((WsfRIPRProcessor)PROCESSOR).IsUplinkingTo(w) &&
                   t.IsValid())
               {
                  double range = w.SlantRangeTo(t);  # meters
                  double speed = w.Speed();          # meters/sec
                  double time  = range / speed;      # seconds
                  if (time < asset)
                  {
                     asset = time;
                  }
               }
            }

            extern double mEngagementAggressiveness;
            //factor in our aggressiveness, and decide whether or not we should evade yet
            double requiredAggressiveness = asset / (threat + asset);
            writeln_d(PLATFORM.Name(), " threat: ", threat, ", asset: ", asset, ", required aggressiveness: ", requiredAggressiveness);
            if (mEngagementAggressiveness < requiredAggressiveness)
            {
              #PROCESSOR.SetUpdateInterval(cFAST_UPDATE_INTERVAL);
               return true;
            }
            else
            {
               Failure("my active weapons are closer, hold course");
            }
         }
         else
         {
           #PROCESSOR.SetUpdateInterval(cFAST_UPDATE_INTERVAL);
            return true;
         }
      }
      else
      {
         writeln_d("no weapons incoming");
         Failure("no weapons incoming");
      }

     #PROCESSOR.SetUpdateInterval(cSLOW_UPDATE_INTERVAL);
      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, int, else, return

### precondition（combined_platform）｜状态前置条件

- **关键词**：precondition, extern, if, return, 状态前置条件
- **出处**：`brawler/platforms/combined_platform.txt:115-122`　（同签名共 4 处，另见 `base_types/processors/quantum_agents/aiai/behavior_force_overshoot.txt:34`、`base_types/processors/quantum_agents/aiai/behavior_unload.txt:40`、`base_types/processors/timeline_agents/behavior_weapon_support.txt:31`）
- **片段**：

```text
               precondition
                  extern bool mTargetIsWVR;
                  if (mTargetIsWVR == true)
                  {
                     return Failure("Target is WVR, use brawler subtree");
                  }
                  return true;
               end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, if, return

### precondition（select_wpn）｜状态前置条件

- **关键词**：precondition, extern, if, else, 状态前置条件
- **出处**：`air_to_air/rules/select_wpn.txt:88-100`
- **片段**：

```text
   precondition  
      extern WsfPlatform iacid;
#      FileIO iout = FileIO();
#      if (iout_print) {iout.Open(iout_path, "append");}
#      if (PLATFORM->rule_type != "ftr"){ return false;}
 
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }
      else {return Success();}
   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, if, else

### precondition（behavior_create_point_job）｜状态前置条件

- **关键词**：precondition, if, int, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_create_point_job.txt:27-41`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_create_point_job.txt:27`、`base_types/processors/ripr_agents/aifl/behavior_create_point_job.txt:27`）
- **片段**：

```text
   precondition
      writeln_d("precondition create_point_job");

      WsfRIPRProcessor commander = PROCESSOR.GetRIPRCommanderProcessor();
      if (!commander.IsValid())
      {
         return Failure("Agent does not have a commander to get jobs from!");
      }
      int NumSubordinates = PROCESSOR.GetRIPRSubordinateProcessors().Size();
      if (NumSubordinates <= 0)
      {
         return Failure("Agent has no subordinates to send to a point!");
      }
      return true;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, int, return

### precondition（rultype_change）｜状态前置条件

- **关键词**：precondition, if, else, return, 状态前置条件
- **出处**：`air_to_air/rules/rultype_change.txt:115-131`　（同签名共 23 处，另见 `base_types/processors/quantum_agents/aiai/behavior_search.txt:33`、`base_types/processors/quantum_agents/aiai/behavior_pursue_fly_route_finder.txt:68`、`base_types/processors/ripr_agents/aiai/behavior_pursue_fly_route_finder.txt:68`）
- **片段**：

```text
   precondition
//writeln("PLATFORM ",PLATFORM.Name()," start_type = ",PLATFORM->start_type);
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not an SA processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }      
      else if (PLATFORM.Mover().IsTurnedOff()) // if mover off, I'm probably on the ground, don't proceed w/ behavior tree
      {
         return Failure(reason);
      }
      if (no_tree)
      {
         return Failure("no_tree set to true...don't use behavior tree");
      }      
      return Success();
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, else, return

### precondition（behavior_engage_weapon_task_target）｜状态前置条件

- **关键词**：precondition, if, double, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage_weapon_task_target.txt:129-158`　（同签名共 35 处，另见 `base_types/processors/quantum_agents/aiww/behavior_buddy_engage_weapon_task_target.txt:310`、`behavior_tree/processors/quantum_agents/aiai/selector_engage_weapon_task_target.txt:130`、`brawler/processors/quantum_agents/behavior_engage_weapon_task_target.txt:128`）
- **片段**：

```text
   precondition
      #writeln_d("precondition engage-target");

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         return Failure("behavior not attached to a quantum tasker processor!");
      }

      #extern WsfTrack GetTrackByName(WsfPlatform, string);

      # todo - try using a state machine to setup the shot ??
      double pitch = PLATFORM.Pitch();
      if (MATH.Fabs(PLATFORM.Roll()) > mMaxFiringRollAngle ||
          pitch > mMaxFiringPitchAngle                     ||
          pitch < mMinFiringPitchAngle)
      {
        string msgStr = write_str("    ", PLATFORM.Name(), " orientation too far off to fire!  (roll or pitch)");
        writeln_d(msgStr);
      //PLATFORM.Comment(msgStr);
        return Failure(msgStr);
      }

      WsfQuantumTaskerProcessor proc = (WsfQuantumTaskerProcessor)PROCESSOR;
      WsfTaskList tasks = proc.TasksReceivedOfType("weapon");
      if (tasks.Count() > 0)
      {
         return true;
      }
      return Failure("no weapon task target to shoot at!");
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, double, return

### precondition（selector_pursue-target_route_finder）｜状态前置条件

- **关键词**：precondition, if, for, return, 状态前置条件
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_pursue-target_route_finder.txt:56-92`　（同签名共 5 处，另见 `brawler/processors/quantum_agents/behavior_pursue-target_route_finder.txt:55`、`heatmap/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:56`、`route_finder_demos/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:56`）
- **片段**：

```text
   precondition
     writeln_d("precondition pursue-target_route_finder");
      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         return Failure("behavior not attached to a quantum tasker processor!");
      }   //   ((WsfQuantumTaskerProcessor)PROCESSOR)

      WsfTaskList tasks = ((WsfQuantumTaskerProcessor)PROCESSOR).TasksReceivedOfType("WEAPON");
     #WsfTaskList tasks = ((WsfQuantumTaskerProcessor)PROCESSOR).TasksReceivedForResource("weapon");
      WsfTrackId targetId;
      if (tasks.Count() <= 0)
      {
         return Failure("no weapon tasks received yet");
      }
      
      for (int i=0; i<tasks.Count(); i=i+1)
      {
         WsfTask task = tasks.Entry(i);
         WsfLocalTrack aTrack = PLATFORM.MasterTrackList().FindTrack(task.LocalTrackId());
         if (aTrack.IsValid())
         {
            //check if the target platform is terminated
            if (!aTrack.Target().IsValid())
            {
               ((WsfQuantumTaskerProcessor)PROCESSOR).SetTaskComplete(task, "SUCCESSFUL");
               continue;
            }
            mTargetPoint = aTrack.CurrentLocation();
            //set altitude
            double desiredAlt = MATH.Max(PLATFORM.Altitude(), MATH.Max(cDEFAULT_ALTITUDE, mTargetPoint.Altitude()));
            mTargetPoint.Set(mTargetPoint.Latitude(), mTargetPoint.Longitude(), desiredAlt);
            return true;
         }
      }
      return Failure("no valid target track was found!");
      
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, for, return

### precondition（behavior_pursue-point）｜状态前置条件

- **关键词**：precondition, if, string, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-point.txt:30-68`　（同签名共 6 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue-point.txt:30`、`base_types/processors/ripr_agents/aiai/behavior_pursue-target_pathing.txt:43`、`base_types/processors/ripr_agents/aiai/behavior_cap-route.txt:33`）
- **片段**：

```text
   precondition
      writeln_d("precondition pursue-point");

      if (!PROCESSOR.IsA_TypeOf("WSF_RIPR_PROCESSOR"))
      {
         return Failure("behavior not attached to a RIPR processor!");
      }

      string anOldPointStr = mOldPointStr;
      mOldPointStr = "no point";

      if (((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().IsValid())
      {
         WsfRIPRJob currentJob = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, ((WsfRIPRProcessor)PROCESSOR));
         if (currentJob.IsValid())
         {
            // If we're supposed to fly towards a point, go for it!
            if (currentJob.Name() == "pursue-point")
            {
               mCurrentPointIntercept = (WsfGeoPoint)currentJob.GetData("targetPoint");
               if (mCurrentPointIntercept.IsValid())
               {
                  ########################################################################
                  ###   print output / comments for any point change
                  ########################################################################
                  mOldPointStr = "Job: " + currentJob.Name() + ", " + currentJob.GetDescription();
                  writeln_d("    - ", mOldPointStr);
                  if (mOldPointStr != anOldPointStr)
                  {
                     PLATFORM.Comment(mOldPointStr);
                  }

                  return true;
               }
            }
         }
      }
      return Failure("current job not a valid pursue-point job");
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, string, return

### precondition（behavior_in_danger）｜状态前置条件

- **关键词**：precondition, foreach, if, return, 状态前置条件
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_in_danger.txt:59-111`
- **片段**：

```text
   precondition
      writeln("precondition in_danger");

      //check track list for any threats
     #extern double mVisualRange;
     #extern string CalculatePositioning( WsfPlatform, WsfTrack, double );

      //see if anybody is threatening me
      mBiggestThreat = null;

      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         if (!t.SideValid() || t.Side() != PLATFORM.Side())
         {
            double range = PLATFORM.SlantRangeTo(t);
            if ((range < mVisualRange) && NotWeapon(t) && IsFlyer(t.Target()))
            {
               string pos = CalculatePositioning(PLATFORM, t, cANGLE_TOLERANCE );
               if (pos=="tail-to-head" || pos=="target-facing-me")
               {
                  if (!mBiggestThreat.IsValid() || (range < PLATFORM.SlantRangeTo(mBiggestThreat)))
                  {
                     #mBiggestThreat = (WsfTrack)t;
                     mBiggestThreat = t;
                  }
               }
            }
         }
      }

      if (mBiggestThreat.IsValid())
      {
         //if we are closer to our target, stay in the fight
         WsfTrack targetTrack = PROCESSOR.GetTarget();
         if (!targetTrack.IsNull() && targetTrack.IsValid())
         {
           #extern double mEngagementAggressiveness;
            double threatRange = PLATFORM.SlantRangeTo(mBiggestThreat);
            double requiredAggressiveness = threatRange / (threatRange + PLATFORM.SlantRangeTo(targetTrack));
            if (mEngagementAggressiveness >= requiredAggressiveness)
            {
               string myPos = CalculatePositioning(PLATFORM, targetTrack, cANGLE_TOLERANCE );
               if (myPos=="head-to-tail" || myPos="me-facing-target")
               {
                  writeln("   not in enough danger, I am chasing target: ", targetTrack.TargetName());
                  return false;  #do not defend, I am aggressive enough to stay after my target, and I am facing my target
               }
            }
         }
         return true;
      }
      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：foreach, if, return

### precondition（run_tree_condition_run_checkpoints）｜状态前置条件

- **关键词**：precondition, if, return, 状态前置条件
- **出处**：`behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_checkpoints.txt:11-17`　（同签名共 47 处，另见 `behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_engage.txt:11`、`behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_rtb.txt:11`、`base_types/processors/ripr_agents/aifl/behavior_create_cap-routes.txt:52`）
- **片段**：

```text
   precondition
      if (SharedBlackboardVarExists("task", "tree_to_run"))
      {
         return ((string)GetSharedBlackboardVar("task", "tree_to_run") == "checkpoints");
      }
      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, return

### precondition（blackboard_checkpoint_1）｜状态前置条件

- **关键词**：precondition, if, else, 状态前置条件
- **出处**：`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_1.txt:18-27`　（同签名共 41 处，另见 `behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_2.txt:18`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_3.txt:18`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_4.txt:18`）
- **片段**：

```text
   precondition
      if (SharedBlackboardVarExists("checkpoint_tasks", "checkpoint_1"))
      {
         return Success();
      }
      else
      {
         return Failure("No checkpoint_1 task found!");
      }
   end_precondition
```

- **演示要点**：演示 precondition 的参数：if, else

### precondition（behavior_anti-radiation_shot）｜状态前置条件

- **关键词**：precondition, extern, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_anti-radiation_shot.txt:20-32`
- **片段**：

```text
   precondition
      writeln("precondition anti-radiation_shot");

      extern Array<string> ttrs;
      foreach(string ttr in ttrs)
      {
         if (PLATFORM.AuxDataBool(ttr))    #is this guy painting us with his radar?
         {
            return true;
         }
      }
      return false;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：extern, return

### precondition（behavior_within_visual_range）｜状态前置条件

- **关键词**：precondition, foreach, return, 状态前置条件
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_within_visual_range.txt:32-50`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_within_visual_range.txt:32`）
- **片段**：

```text
   precondition

      writeln_d("precondition within_visual_range");
      //check if any threats are within visual range ~20 nm

      foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
      {
         writeln_d("    checking WVR on ", t.TargetName(), ", slant range: ", PLATFORM.SlantRangeTo(t));

         if (PLATFORM.SlantRangeTo(t) < mVisualRange)
         {
            writeln_d("    within visual range -> apply WVR tactics");
            return true;
         }
      }
      writeln_d("    outside of visual range");

      return Failure("outside of visual range");
   end_precondition
```

- **演示要点**：演示 precondition 的参数：foreach, return

### precondition（behavior_alt1514_point）｜状态前置条件

- **关键词**：precondition, return, 状态前置条件
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt1514_point.txt:14-16`　（同签名共 85 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt1516_bvr_end_run_left.txt:16`、`base_types/platforms/brawler/alternatives/behavior_alt1517_bvr_end_run_right.txt:13`、`base_types/processors/quantum_agents/aifl/behavior_adjust_priority_for_escort.txt:13`）
- **片段**：

```text
   precondition
      return 1.0;
   end_precondition
```

- **演示要点**：演示 precondition 的参数：return

### precondition（selector_with_memory_range_under_10000）｜状态前置条件

- **关键词**：precondition, else, 状态前置条件
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_with_memory_range_under_10000.txt:11-20`　（同签名共 3 处，另见 `behavior_tree/processors/quantum_agents/aiai/selector_with_memory_range_under_100000.txt:11`、`behavior_tree/processors/quantum_agents/aiai/selector_with_memory_range_under_50000.txt:11`）
- **片段**：

```text
   precondition
      if(PLATFORM.GroundRangeTo(WsfSimulation.FindPlatform("Blue_target")) < 10000)
      {
         return Success("Range to Blue_target under 10000");
      }
      else
      {
         return Failure("Out of range!");
      }
   end_precondition
```

- **演示要点**：演示 precondition 的参数：else

### script（behavior_weapon_decision_missile）｜脚本

- **关键词**：script, pinrng, pbinrg, call, if, else, endif, tgleav, worse, lbeam, needid, lfrat, lfrnd, 脚本
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:154-408`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_weapon_decision_missile.txt:147`）
- **片段**：

```text
   script bool shldfrm(WsfLocalTrack target, string failMsg)
      /*
      C     --CHECK THAT PILOT BELIEVES RANGE IS OK FOR TARGETING
      pinrng = prmax2(ppmiac,ppmrmx,ppm_rpeak,0.2)
      pbinrg = pinrng.ge.pr2lim
      call pdset('PROB_IN_RANGE',pbinrg)
      call mslenv_typ_mm(ppmiac,renv_typ)
C
C     --CALCULATE tgleav
C     --POSSIBLE PROJECTIONS
C     --    ATTACKER                      TARGET
C     --(1) CONSTANT VELOCITY XEUAN       CONSTANT VELOCITY vecinc
C     --(2) CURRENT MANEUVER  XEUA        CURRENT MANEUVER  XEUT
C     --(3) CURRENT MANEUVER  XEUA        CONSTANT VELOCITY vecinc
C     --(4) CONSTANT VELOCITY XEUAN       CURRENT MANEUVER  XEUT
C     --LOGIC IS AS FOLLOWS:
C     --IF CASE (1) (neither maneuver) IS IN ENVELOPE THEN
C     --   IF CASE (2) (both maneuver) IS OUT OF ENVELOPE
C     --      IF CASE (3) (atkr maneuvers) IS IN ENVELOPE
C     --         IF CASE(4) (tgt maneuvers) IS OUT OF ENVELOPE
C     --            ASSERT: TARGET AT FAULT
C
C     CASE 1: CALCULATE INENVP_CC
      if (ient.eq.sament) then
         call xmit3(xp(1,me),xme)
         call xmit3(vp(1,me),vme)
         call xmit(9,rbep,rbeme)
         call xmit(9,rwep,rweme)
      else
         call xmit3(xeuan,xme)
         call xmit3(veuan,vme)
         call xmit(9,rbeuan,rbeme)
         call xmit(9,rweuan,rweme)
      endif
      call vecinc(xp(1,ppmiac),tproj3,vp(1,ppmiac),xtgt)
      call xmit3(vp(1,ppmiac),vtgt)
      call zero3(azero)
      xtgt(3) = amin1(xtgt(3),-50.)
      call mslenv(iacid,xme,vme,azero,alphap,xtgt,vtgt,azero,
     1  misl(mslpp),rbeme,rweme,.false.,.true.,renv_typ,rmin_mm,
     2  rmax_mm,aimp,se_mm,aof_mm,inenvp_cc,trkbl,ovrhoz,l_config)
C     --"target leaving" CANNOT BE TRUE IF NOT IN ENVELOPE WHEN NEITHER
C     --MANEUVERING
      if(.not.inenvp_cc)then
         tgleav = .false.
         goto 200
      endif
C
C     --CASE 2: CALCULATE INENVP_MM
      if (ient.eq.sament) then
C        --USE SAME AS CASE 1 SINCE I CAN'T MANEUVER
         continue
      else
         call xmit3(xeua,xme)
         call xmit3(veua,vme)
         call xmit(9,rbeua,rbeme)
         call xmit(9,rweua,rweme)
      endif
      call xmit3(xeut(1,ppmiac),xtgt)
      call xmit3(veut(1,ppmiac),vtgt)
      call mslenv(iacid,xme,vme,azero,alphap,xtgt,vtgt,azero,
     1  misl(mslpp),rbeme,rweme,.false.,.true.,renv_typ,rmin,rmax,
     2  aimp,se,aof,inenvp_mm,trkbl,ovrhoz,l_config)
C     --"target leaving" CANNOT BE TRUE IF STILL IN ENV. WHEN BOTH MANEUVER
      if(inenvp_mm)then
         tgleav = .false.
         goto 200
      endif
C
C     --CASE 3: CALCULATE INENVP_MC
      if (ient.eq.sament) then
C        --USE SAME AS CASE 1 SINCE I CAN'T MANEUVER
         continue
      else
         call xmit3(xeua,xme)
         call xmit3(veua,vme)
         call xmit(9,rbeua,rbeme)
         call xmit(9,rweua,rweme)
      endif
      call vecinc(xp(1,ppmiac),tproj3,vp(1,ppmiac),xtgt)
      call xmit3(vp(1,ppmiac),vtgt)
      xtgt(3) = amin1(xtgt(3),-50.)
      call mslenv(iacid,xme,vme,azero,alphap,xtgt,vtgt,azero,
     1  misl(mslpp),rbeme,rweme,.false.,.true.,renv_typ,rmin,rmax,
     2  aimp,se,aof,inenvp_mc,trkbl,ovrhoz,l_config)
      if(.not.inenvp_mc)then
         tgleav = .false.
         goto 200
      endif
C
C     --CASE 4: CALCULATE INENVP_CM
      if (ient.eq.sament) then
C        --USE SAME AS CASE 1 SINCE I CAN'T MANEUVER
         continue
      else
         call xmit3(xeuan,xme)
         call xmit3(veuan,vme)
         call xmit(9,rbeuan,rbeme)
         call xmit(9,rweuan,rweme)
      endif
      call xmit3(xeut(1,ppmiac),xtgt)
      call xmit3(veut(1,ppmiac),vtgt)
      call mslenv(iacid,xme,vme,azero,alphap,xtgt,vtgt,azero,
     1  misl(mslpp),rbeme,rweme,.false.,.true.,renv_typ,rmin,rmax,aimp,
     2  se,aof,inenvp_cm,trkbl,ovrhoz,l_config)
      tgleav = .not.inenvp_cm
C
200   continue
      call pdset('TGT_LEAVING_ENV',tgleav)
C
C     --Calculate current envelope level (WORSE)
      elevnow= envlvl(rngnow(me,ppmiac),rdotme(ppmiac),ppmse,
     1 ppmaof,ppmrmn,ppmrmx,ppm_rpeak,ppm_semax,aoffmx,
     2 ppmtrk,ppmohr,'SHOOT ')
C
      if (ient.ne.sament) then
         elevprj= envlvl(rng(ppmiac),rngr(ppmiac),se_mm,aof_mm,rmin_mm,
     1    rmax_mm,ppm_rpeak,ppm_semax,aoffmx,trkbl,ovrhoz,'SHOOT ')
         if(lprnt) write(ioutp,2000) rmin_mm,rmax_mm,
     1    rng(ppmiac),aimp,se_mm,aof_mm,elevprj
      else
C        --rng, rngr NOT SET FOR SAM, USE rngun, rngrun
         elevprj= envlvl(rngun(ppmiac),rngrun(ppmiac),se_mm,aof_mm,
     1    rmin_mm,rmax_mm,ppm_rpeak,ppm_semax,aoffmx,trkbl,ovrhoz,
     2    'SHOOT ')
         if(lprnt) write(ioutp,2000) rmin_mm,rmax_mm,
     1    rngun(ppmiac),aimp,se_mm,aof_mm,elevprj
      endif
C     --CHECK PROJECTION -- IS LEVEL DECREASING?
      worse = (elevnow.ge.elevprj)
      call pdset('SHOT_WORSENING',worse)
10    continue
C
C     --Check if target is too near beam for successful semi-active
C     -- missile shot
      lbeam =  beamsht()
      call pdset('SA_BEAM_SHOT',lbeam)
C
C     --If positive target ID required to fire, has ID been
C     --established?
      needid = (irel(ppmiac).eq.0) .and. (id_mode.ne.bvr_id_md)
      call pdset('SURE_BAD_GUY',.not.needid)
C
C     --check for fratricide risk
      call set_hldcod(mslpp,ppmiac,hldcode,pp_skrs,pp_undes,lfrshot)
      lfrat = lbit(hldcode,2)
      call pdset('FRAT_RISK',lfrat)
C
C     --CHECK IF FRIEND HAS A BETTER SHOT
      lfrnd = lbit(hldcode,1)
      call pdset('FRND_BETTER_SHOT',lfrnd)
C
C     --Is target already engaged with max number of missiles/target?
      other_tgtd = 0
      do 100 igg=1,ngg
         iacf = listf(igg)
         acidf = iacidt(iacf)
         if (iacid .eq. acidf)goto 100
C        --Don't count another's selection if you have a much better
C        --shot, since he will wait for you to shoot
         if (.not.lfrshot(iacf)) goto 100
C        --Don't count another's selection if you have selected the
C        --same target earlier!  RMK 9 Apr 92
C        --(Cant use others_tgt(iacid) here since not set until akshn7)
         if (others_tgt(acidf).eq.ppmiac)then
C           --However, we do need to use others_tgt(iacid) here, since
C           --we need to use others_msgtim(iacid), which is only correct
C           --if others_tgt(iacid) .eq. ppmiac
            if(others_tgt(iacid).eq.ppmiac) then
C              --I have selected this tgt previously
               if (others_msgtim(acidf).lt.others_msgtim(iacid)) then
C                 --He selected this target earlier than I, so count him
                  other_tgtd = other_tgtd + 1
               endif
            else
C              --I just changed to this target, so if anybody else has
C              --sent me a message selecting him, they must have gotten
C              --there first
               other_tgtd = other_tgtd + 1
            endif
         endif
100   continue
110   continue
      satur = ((nmhutl(ppmiac)+other_tgtd).ge.mxtgt_ac(ppmjid))
      call pdset('TARGET_SATURATED',satur)
      skr_lock = .false.
      do 300 iseek = 1, mx_skr
         if (skr_acquired(iseek)) then
            skr_lock = .true.
            goto 305
         endif
300   continue
305   continue
      call pdset('SEEKER_LOCK',skr_lock)
C
C     --CHECK WEAPON QUALITY TRACK
C     --no_trk indicates track not needed for this launch mode
      no_trk = (lnchma .eq. ppsli) .or.
     1         (lnchma .eq. ppslr) .or.
     2         (lnchma .eq. pcguv) .or.
     3         (lnchma .eq. pvtnhms)
      if (.not.usewqt(iflite)) then
C        --Flight does not require WQT
         needwqt = .false.
      elseif (no_trk) then
C        --Using a luanch mode that is not cued from a track
         needwqt = .false.
      else
         needwqt = .not.wpnqual
      endif
400   continue
C
C     --FIRING LOGIC:
      lfire =
     1 .not.(needid.or.satur.or.lfrat.or.lfrnd.or.lbeam.or.needwqt)
     2 .and.(pbinrg.or.(worse.and..not.tgleav))
      if(lfire)then
         rsfail = ' '
      else
         if(needid)then
            rsfail = 'NEED ID'
         elseif(satur)then
            rsfail = 'MXTGT_AC LIMIT'
         elseif(lfrat)then
            rsfail = 'FRATRICIDE RISK'
         elseif(lfrnd)then
            rsfail = 'FRND HAS BETTER SHOT'
         elseif(lbeam)then
            rsfail = 'TGT TOO NEAR BEAM'
         elseif(.not.(pbinrg.or.(worse.and..not.tgleav)))then
            rsfail = 'FAILED ENV LOGIC'
         elseif (needwqt) then
            rsfail = 'NO WEAPON QUAL TRK'
         else
            call nabort('SHLDFRM..unknown failure reason')
         endif
      endif
      */

      // ONLY Checking target stauration and track quality for now
      if (PLATFORM.WeaponsActiveFor(target.TrackId()) >= mTargetSaturation)
      {
         //lfire = true;
         writeln_d("   ", PLATFORM.Name(), " shouldn't fire ", target.TargetName(), " saturated");
         failMsg = "MXTGT_AC LIMIT";
         return false;
      }
      if (target.TrackQuality() < mRequiredTrackQuality)
      {
         failMsg = "NO WEAPON QUAL TRK";
         return false;
      }

      return true;
   end_script
```

- **演示要点**：演示 script 的参数：pinrng, pbinrg, call, if, else, endif, tgleav, worse, lbeam, needid

### script（behavior_weapon_decision_gun）｜脚本

- **关键词**：script, pinrng, pbinrg, call, elevnow, elevprj, worse, needid, if, else, endif, bool, return, 脚本
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:125-171`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_weapon_decision_gun.txt:118`）
- **片段**：

```text
   script bool shldfrg(string failMsg)
      /*
C     --If target is inside Rmax2, don't need the following
C     --tests(target is inside no-escape range).
C     --CHECK THAT PILOT BELIEVES RANGE IS OK FOR TARGETING
      pinrng = prmax2(ppmiac,ppmrmx,ppm_rpeak,0.2)
      pbinrg = pinrng.ge.pr2lim
      call pdset('PROB_IN_RANGE',pbinrg)
C
C     --CALCULATE CURRENT ENVELOPE LEVEL; ppmrmx WAS RECALCULATED IN canfirg
      elevnow = envlvg(rngnow(me,ppmiac),rdotme(ppmiac),ppmse,ppmrmx,
     1 'SHOOT')
C     --CALCULATE PROJECTED ENVELOPE, CONSTANT VELOCITY PROJECTION FOR
C     --ME AND CURRENT ACCELERATION PROJECTION FOR TARGET.
C     --call vecinc(xp(1,me),tproj3,vp(1,me),xme)
C     --Full projection for target, fixed velocity projection
C     --for attacker.
C     --call gunenv(xme,vp(1,me),xeut(1,ppmiac),veut(1,ppmiac),
      call gunenv(xeuan,veuan,xeut(1,ppmiac),veut(1,ppmiac),
     1   ppmptr,rmin,rmax,aimp,se,aof,inenvp,trkbl,ovrhoz,rbep)
      elevprj = envlvg(rngun(ppmiac),rngrun(ppmiac),se,rmax,'SHOOT')
      if(lprnt) write(ioutp,2000) rmin,rmax,rng(ppmiac),aimp,se,aof,
     1  elevprj
C
C     --CHECK PROJECTION -- IS LEVEL DECREASING?
      worse = (elevnow.ge.elevprj)
      call pdset('SHOT_WORSENING',worse)
C
      needid = (irel(ppmiac).eq.0) .and. (id_mode.ne.bvr_id_md)
      call pdset('SURE_BAD_GUY',.not.needid)
C
      if (needid)then
         lfire = .false.
         rsfail = 'NEED ID'
      elseif(.not.(pbinrg.or.worse))then
         rsfail = '!(IN RPEAK OR WORSE)'
         lfire = .false.
      else
         lfire = .true.
      endif
      */
#      bool lfire = false;
      bool lfire = true;   #LBM - temporary


      return lfire;
   end_script
```

- **演示要点**：演示 script 的参数：pinrng, pbinrg, call, elevnow, elevprj, worse, needid, if, else, endif

### script（brawler_script_util）｜脚本

- **关键词**：script, spddes, bool, double, vuse, h, csenow, senow, dsemax, lngtrn, if, else, return, 脚本
- **出处**：`air_to_air/rules/brawler_script_util.txt:221-339`　（同签名共 2 处，另见 `brawler/platforms/alternatives/BrawlerScriptUtil.txt:219`）
- **片段**：

```text
script Vec3 desvvi(WsfBrawlerProcessor plat, Vec3 vdes, double spddes)
   spddes = spddes * Math.FT_PER_M();

   bool lngtrn;
   Vec3 vuse = Vec3();
   double spduse;
   double cornrv = plat.CorneringVelocity() * Math.FT_PER_M();//fps
   double   grav = 32.17405;                   //fps
   double gmxsut = plat.MaxSustainedGs() * Math.FT_PER_M();//ft/s^2
   //C     --external declarations
//   integer rspace
//   realdot,ramp,xlimit
//   real arccos
   //C     --local declarations
   //real h(2),hdes(2);
   Vec3 h = Vec3();
   Vec3 hdes = Vec3();
   double d10 = 0.174533;   //radians (10 deg)
   double s30 = 0.5;
   double s45 = 0.707107;
   double s15 = 0.258819;
   double dsemax,hnorm,csenow,senow;
   //real arcsin
   //C*ENDDEC
   vuse = unitv2(vdes);
   h    = unitv2(plat.Platform().VelocityNED());

   //C  CURRENT HEADING COORDINATES:
   //C     X = [ H(1),H(2)]
   //C     Y = [-H(2),H(1)]
   //hdes(1) = vuse(1)*h(1)+vuse(2)*h(2)
   hdes.SetX(vuse.X()*h.X()+vuse.Y()*h.Y());

   //C        TO AVOID MESSING UP LATER ARCCOS(HDES(1)):
   if(MATH.Fabs(hdes.X()) > 1.0)
   {
      if(MATH.Fabs(hdes.X()) > 1.000001)
      {
         //call nabort('HDES(1) NORM');
         writeln("ABORT!!!! hdes(1) > 1.000001");
         return Vec3();
      }
      hdes.SetX(1.0);
      if (hdes.X() < 0)
      {
         hdes.SetX(-1.0);
      }
   }

   hdes.SetY(-vuse.X()*h.Y()+vuse.Y()*h.X());
   csenow = plat.Platform().Speed()*MATH.FT_PER_M()+0.01;
   csenow = Vec3.Dot(vdes,plat.Platform().VelocityNED())/csenow;
   senow = MATH.ACos(csenow);
   double tproj3 = plat.ProjectedTimeDelta();
   dsemax = tproj3*(gmxsut*grav/cornrv);
   //C  LNGTRN REQUIRES LARGE ERRORS IN BOTH MAGNITUDE AND HEADING
   lngtrn = MATH.ACos(hdes.X()) > dsemax && senow > 1.5*dsemax;
   if (!lngtrn)
   {
      //C
      //C  SHORTER TURN:
      //C
      vuse = vdes;
      spduse = spddes;
      //goto 9999
   }
   else
   {
      //C
      //C  LONGER TURN:
      //C
      if((plat.Platform().Speed()*MATH.FT_PER_M()) > 0.9*cornrv)
      {
         if((plat.Platform().Speed()*MATH.FT_PER_M()) < 1.1*cornrv)
         {
            //C     HERE SPEED NEAR CORNER - MAINTAIN MODEST DIVE TO HELP MAINTAIN SPD
            vuse.SetZ(s15);
         }
         else
         {
            //C     TOO FAST - PULL UP WHILE TURNING
            //format('DESVVI... TOO FAST, CORNER = ',f8.2,' MACH ',f5.1)
            vuse.SetZ(-s45*ramp(1.1*cornrv,plat.Platform().Speed()*MATH.FT_PER_M(),1.2*cornrv));
         }
      }
      else
      {
         //C     TOO SLOW - SET 30 DEG DIVE
         vuse.SetZ(s30);
      }

      hnorm = MATH.Sqrt(1.0-vuse.Z()*vuse.Z());
      if(hdes.X() > 0.0)
      {
         //C  RENORMALIZE HORIZONTAL FOR LESS THAN 90 DEG HEADING CHANGES
         vuse.SetX(vuse.X()*hnorm);
         vuse.SetY(vuse.Y()*hnorm);
      }
      else
      {
         //C     SET UP 90 DEG HEADING CHANGE AND DO ROTATION BACK TO EARTH COORDINATES
         //C     IMPLICIT IS HDES(1) = 0
         hdes.SetY(hnorm);
         if (hdes.Y() < 0)
         {
            hdes.SetY(-hnorm);
         }
         vuse.SetX(-h.Y()*hdes.Y());
         vuse.SetY(h.X()*hdes.Y());
      }
      spduse = cornrv;
      //goto 9999
   }
   //C
//9999
   vuse.Normalize();
   vuse.Scale(spduse * Math.M_PER_FT());
   return vuse;
end_script
```

- **演示要点**：演示 script 的参数：spddes, bool, double, vuse, h, csenow, senow, dsemax, lngtrn, if

### script（behavior_weapon_decision_gun）｜脚本

- **关键词**：script, cnfire, call, overheat, if, endif, pinrng, pbinrg, visacq, else, bool, return, 脚本
- **出处**：`base_types/platforms/brawler/alternatives/behavior_weapon_decision_gun.txt:61-120`　（同签名共 2 处，另见 `brawler/platforms/alternatives/behavior_weapon_decision_gun.txt:54`）
- **片段**：

```text
   script bool canfirg(string failMsg)
      /*
      cnfire = .false.
C     --NOTE THAT WE ARE RECALCULATING PILOT POSTURE VARIABLES HERE
C     --ppmrmx WILL BE NEEDED IN shldfrg, SO PERFORM THIS CALCULATION
C     --UNCONDITIONALLY.
      call gunenv(xp(1,me),vp(1,me),xp(1,ppmiac),vp(1,ppmiac),
     1 ppmptr,ppmrmn,ppmrmx,ppmapt,ppmse,ppmaof,ppmenv,ppmtrk,ppmohr,
     2 rbep )
C     --If temp midway in a 0.5 second burst exceeds maximum (1.0 by
C     --definition) then you can't shoot.  Rate of temperature rise
C     --is 1.0/t_to_heat, so that firing for t_to_heat seconds reaches
C     --the limit.
      overheat = (gun_temp+0.25/t_to_heat .gt. 1.0)
      if (overheat) then
         rsfail = 'GUN OVERHEAT'
         return
      endif
C
C     --CHECK IF TARGET IS IN ENVELOPE
      if (.not.ppmenv) then
         rsfail = 'NOT IN ENVELOPE '
         return
      endif
C
C     --CHECK ON PROBABILITY IN RANGE
      pinrng = prmax2(ppmiac,ppmrmx,1.0,0.2)
      pbinrg = pinrng.ge.pr2lim
      if (.not.pbinrg) then
         rsfail = 'LOW PROB IN RANGE'
         return
      endif
C
      visacq = inform(ppmiac).eq.1 .and. time.le.seet(ppmiac)+0.5
C     --If pilot has not had a recent visual (or does not have a
C     --radar lock if rdrgun is set), then gun can't be fired.
      if(.not.rdrgun) then
C        --DO I HAVE A RECENT VISUAL?
         if(.not.visacq) then
            rsfail = 'NO RECENT VISUAL'
            return
         endif
      else
C        --AN ESTABLISHED RADAR TRACK MAY SUBSTITUTE FOR A VISUAL
C        --IF RDRGUN=.TRUE.
         call lockid(iacid,ppmjid,locked)
         gunacq = visacq .or. locked.eq.2
         if(.not.gunacq) then
            rsfail = 'NO RECENT VISUAL OR LOCK'
            return
         endif
      endif
C
      cnfire = .true.
      */
     #bool canFire = false;
      bool canFire = true;   #LBM - temporary

      return canFire;
   end_script
```

- **演示要点**：演示 script 的参数：cnfire, call, overheat, if, endif, pinrng, pbinrg, visacq, else, bool

### script（BrawlerScriptUtil）｜脚本

- **关键词**：script, bool, double, vuse, h, csenow, senow, dsemax, lngtrn, if, else, return, 脚本
- **出处**：`base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:218-335`
- **片段**：

```text
script Vec3 desvvi(WsfBrawlerPlatform plat, Vec3 vdes, double spddes)
   bool lngtrn;
   Vec3 vuse = Vec3();
   double spduse;
   double cornrv = plat.CorneringVelocity();   //fps
   double   grav = 32.17405;                   //fps
   double gmxsut = plat.MaxSustainedGs();

   //C     --external declarations
#   integer rspace
#   realdot,ramp,xlimit
#   real arccos
   //C     --local declarations
   //real h(2),hdes(2);
   Vec3 h = Vec3();
   Vec3 hdes = Vec3();
   double d10 = 0.174533;   //radians (10 deg)
   double s30 = 0.5;
   double s45 = 0.707107;
   double s15 = 0.258819;
   double dsemax,hnorm,csenow,senow;
   //real arcsin
   //C*ENDDEC
   vuse = unitv2(vdes);
   h    = unitv2(plat.VelocityNED());

   //C  CURRENT HEADING COORDINATES:
   //C     X = [ H(1),H(2)]
   //C     Y = [-H(2),H(1)]
   //hdes(1) = vuse(1)*h(1)+vuse(2)*h(2)
   hdes.SetX(vuse.X()*h.X()+vuse.Y()*h.Y());

   //C        TO AVOID MESSING UP LATER ARCCOS(HDES(1)):
   if(MATH.Fabs(hdes.X()) > 1.0)
   {
      if(MATH.Fabs(hdes.X()) > 1.000001)
      {
         //call nabort('HDES(1) NORM');
         writeln("ABORT!!!! hdes(1) > 1.000001");
         return Vec3();
      }
      hdes.SetX(1.0);
      if (hdes.X() < 0)
      {
         hdes.SetX(-1.0);
      }
   }

   hdes.SetY(-vuse.X()*h.Y()+vuse.Y()*h.X());
   csenow = plat.Speed()*MATH.FT_PER_M()+0.01;
   csenow = Vec3.Dot(vdes,plat.VelocityNED())/csenow;
   senow = MATH.ACos(csenow);
   double tproj3 = plat.ProjectedTimeDelta();
   dsemax = tproj3*(gmxsut*grav/cornrv);
   //C  LNGTRN REQUIRES LARGE ERRORS IN BOTH MAGNITUDE AND HEADING
   lngtrn = MATH.ACos(hdes.X()) > dsemax && senow > 1.5*dsemax;
   if (!lngtrn)
   {
      //C
      //C  SHORTER TURN:
      //C
      vuse = vdes;
      spduse = spddes;
      //goto 9999
   }
   else
   {
      //C
      //C  LONGER TURN:
      //C
      if((plat.Speed()*MATH.FT_PER_M()) > 0.9*cornrv)
      {
         if((plat.Speed()*MATH.FT_PER_M()) < 1.1*cornrv)
         {
            //C     HERE SPEED NEAR CORNER - MAINTAIN MODEST DIVE TO HELP MAINTAIN SPD
            vuse.SetZ(s15);
         }
         else
         {
            //C     TOO FAST - PULL UP WHILE TURNING
            //format('DESVVI... TOO FAST, CORNER = ',f8.2,' MACH ',f5.1)
            vuse.SetZ(-s45*ramp(1.1*cornrv,plat.Speed()*MATH.FT_PER_M(),1.2*cornrv));
         }
      }
      else
      {
         //C     TOO SLOW - SET 30 DEG DIVE
         vuse.SetZ(s30);
      }

      hnorm = MATH.Sqrt(1.0-vuse.Z()*vuse.Z());
      if(hdes.X() > 0.0)
      {
         //C  RENORMALIZE HORIZONTAL FOR LESS THAN 90 DEG HEADING CHANGES
         vuse.SetX(vuse.X()*hnorm);
         vuse.SetY(vuse.Y()*hnorm);
      }
      else
      {
         //C     SET UP 90 DEG HEADING CHANGE AND DO ROTATION BACK TO EARTH COORDINATES
         //C     IMPLICIT IS HDES(1) = 0
         hdes.SetY(hnorm);
         if (hdes.Y() < 0)
         {
            hdes.SetY(-hnorm);
         }
         vuse.SetX(-h.Y()*hdes.Y());
         vuse.SetY(h.X()*hdes.Y());
      }
      spduse = cornrv;
      //goto 9999
   }
   //C
//9999
   vuse.Normalize();
   vuse.Scale(spduse);
   return vuse;
end_script
```

- **演示要点**：演示 script 的参数：bool, double, vuse, h, csenow, senow, dsemax, lngtrn, if, else

### script（behavior_weapon_decision_missile）｜脚本

- **关键词**：script, cnfire, if, endif, pswtch, call, pinrng, pbinrg, double, return, 脚本
- **出处**：`brawler/platforms/alternatives/behavior_weapon_decision_missile.txt:69-142`　（同签名共 2 处，另见 `base_types/platforms/brawler/alternatives/behavior_weapon_decision_missile.txt:73`）
- **片段**：

```text
   script bool canfirm(WsfTrack target, string failMsg)
      /*
      cnfire = .false.
      --MISSILE COMING OFF RAIL
      if (lnchng) then
         rsfail = 'MISL COMING OFF RAIL'
         return
      endif

      --SWITCHOLOGY DELAYS
      pswtch = (time .ge. timemf)
      if (.not. pswtch)then
         rsfail = 'SWITCHOLOGY'
         return
      endif

      --CHECK IF TARGET IS IN ENVELOPE
      --NOTE THAT SOME PPM... VARIABLES ARE RECALCULATED.
      call mslenv_typ_mm(ppmiac,renv_typ)
      call mslenv(iacid,xp(1,me),vp(1,me),ap(1,me),
     1 alphap,xp(1,ppmiac),vp(1,ppmiac),ap(1,ppmiac),
     2 ppmptr, rbep, rwep, ext_mle, .true., renv_typ, ppmrmn, ppmrmx,
     3 ppmapt, ppmse, ppmaof, ppmenv, ppmtrk, ppmohr,l_config)
      if (.not. ppmenv)then
         rsfail = 'TGT NOT IN ENV'
         return
      endif

      --Does pilot beleive that target is within max range (R<Rmax1)?
      pinrng = prmax2(ppmiac,ppmrmx,1.,0.2)
      pbinrg = (pinrng .gt. pr2lim)
      if (.not.pbinrg)then
         rsfail = 'LOW PROB. TGT IN RNG'
         return
      endif
      if(lnchma.eq.0)then
         rsfail = 'FAIL ALL FIRE MODES'
         return
      endif
      cnfire = .true.
      */

      // Not currently checking for another missile coming off the rail

      // Not currently checking for switchology delays

      // CHECK IF TARGET IS IN ENVELOPE
      // Using a very simplified replacement of mslenv()
      // that take a percentage of ange and a simple angle check
      double range = PLATFORM.SlantRangeTo(target);
      double absRelativeBearing = MATH.Fabs(PLATFORM.RelativeBearingTo(target));
      if (range  < (mMinRange + mMinRange * mPercentRange) ||
          range  > (mMaxRange - mMaxRange * mPercentRange) ||
          absRelativeBearing >= mMaxFiringAngle )
      {
         failMsg = "TGT NOT IN ENV";
         return false;
      }

      // Does pilot beleive that target is within max range (R<Rmax1)?
      // Using simplified version of prmax2
      // and assuming short range missile with rmax = 25000 ft
      double drng = (mMaxRange - PLATFORM.SlantRangeTo(target));
      if (drng < 0.0)
      {
         failMsg = "LOW PROB. TGT IN RNG";
         return false;
      }

      // Not currently checking launch modes
      // lnchma set if fctest() passes checks

      return true;
   end_script
```

- **演示要点**：演示 script 的参数：cnfire, if, endif, pswtch, call, pinrng, pbinrg, double, return

### script（brawler_behaviors）｜脚本

- **关键词**：script, bool, if, double, dlag, dir0, spd0, spdmod, else, 脚本
- **出处**：`six_dof/scripts/brawler_behaviors.txt:107-159`　（同签名共 2 处，另见 `six_dof_with_brawler/scripts/brawler_behaviors.txt:107`）
- **片段**：

```text
script void TailAttack(WsfPlatform aPlatform, int trackID)
	
	WsfLocalTrack targetTrack = aPlatform.MasterTrackList().Find(trackID);
	WsfWaypoint aimptWP = WsfWaypoint();
		
	Vec3 dxpme = RelativePositionNED(PLATFORM.Location(), targetTrack.CurrentLocation());
	Vec3 vp = aPlatform.VelocityNED();
	Vec3 vp_iac =  targetTrack.VelocityNED();
	bool chasing = (Vec3.Dot(dxpme,vp_iac) > 0.0);
	
	if (chasing)
	{
		double dlagn  = 5000.0;
		double dlagun = 1000.0;
		double dlag = dlagn;

		if (!HaveWeapon(aPlatform))
		{
			dlag = dlagun;
		}

		# GET POSITION OF AC 5 SECONDS IN FUTURE:
		double dt = 5.0;

		Vec3 vprj = targetTrack.VelocityNED();
		Vec3 vtemp = vprj.Normal();
		vtemp.Scale(-dlag);
		Vec3 dx = RelativePositionNED(PLATFORM.Location(), targetTrack.CurrentLocation());
		Vec3 dxtail = Vec3.Add(dx,vtemp);

		Vec3 vpt = targetTrack.VelocityNED();
		dxtail.Scale(0.5/BRAWLER.ProjectedTimeDelta());
		dir0 = Vec3.Add(vpt,dxtail);
		spd0 = dir0.Magnitude();   #m/sec
		spdmod = 1;   //(desspd = 1, thrttl = 2, desacc = 3)
		double almax = BRAWLER.MaxForwardAccelWithGravity();   #m/sec^2
		double spdwtd = PLATFORM.Speed() + almax * BRAWLER.ProjectedTimeDelta() * 1.1;
		if (spd0 > spdwtd)
		{
			 spd0 = 3.0;
		}
		dir0.Normalize();
	}
	else if (PLATFORM.InterceptLocation3D(targetTrack, aimptWP) > 0)
	{
		WsfGeoPoint daimpt = aimptWP.Location();
		Vec3 dxaim = RelativePositionNED(PLATFORM.Location(), daimpt);   #NED coordinates
		dir0 = dxaim.Normal();
		spd0 = 3.0;
	}
	
	PLATFORM.FlyVectorWithThrottle(dir0, 0.0, spd0);
end_script
```

- **演示要点**：演示 script 的参数：bool, if, double, dlag, dir0, spd0, spdmod, else

### script（rules_utils）｜脚本

- **关键词**：script, loop, bool, int, if, else, for, tot_missiles, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:1134-1209`
- **片段**：

```text
script bool flight_weapon_left(WsfPlatform plat, Array<int> winchester,WsfCommandChain chain)
/*
PURPOSE   Determine if my flight has met winchester conditions  
AUTHOR   Snyder

Parameter Description
   IN  plat - WsfPlatform, platform to be analysed
   IN  winchester - Array<int> (fox3,fox2,fox1,agm,tot_missile) min number of missiles to hit bingo 
   IN  chain - WsfCommandchain, command chain to check against (either IFLITE or ELEMENT)
   OUT flight_weapon_left - true if my flight is bingo missile
Technical Description:
   loop through my flight mates and check total number of missiles of each guy

*/
   bool bingo_misl = false;
   int fox1_left = 0;
   int fox2_left = 0;
   int fox3_left = 0;
   int tot_missiles = 0;
   WsfPlatform lead;
   if (chain.Commander() == plat)
   {
      lead = plat;
   }
   else
   {
      lead = chain.Commander();
   }
   WsfCommandChain lead_chain = lead.CommandChain(chain.Name());
   for( int j = 0; j < lead.WeaponCount(); j = j + 1)
   {  // loop through lead's weapons first
      if (j == 2)
      {
         fox1_left = fox1_left + lead.WeaponEntry(j).QuantityRemaining();
      }
      if (j == 1)
      {
         fox2_left = fox2_left + lead.WeaponEntry(j).QuantityRemaining();
      }
      if (j == 0)
      {
         fox3_left = fox3_left + lead.WeaponEntry(j).QuantityRemaining();
      }
   }
   for (int i = 0 ; i < lead_chain.SubordinateCount(); i +=1)
   {
      if (!lead_chain.SubordinateEntry(i).IsValid() || lead_chain.SubordinateEntry(i).IsNull() || lead_chain.SubordinateEntry(i).CategoryMemberOf("missile"))
      {
         continue;
      }
      WsfPlatform AC = lead_chain.SubordinateEntry(i);
//     loop through all weapon instances on this platform
      for( int j = 0; j < AC.WeaponCount(); j = j + 1)
      {  // compare against PRDATA - Array<int> WINCHESTER{fox3,fox2,fox1,total_missiles}; 
         if (j == 2)
         {
            fox1_left = fox1_left + AC.WeaponEntry(j).QuantityRemaining();
         }
         if (j == 1)
         {
            fox2_left = fox2_left + AC.WeaponEntry(j).QuantityRemaining();
         }
         if (j == 0)
         {
            fox3_left = fox3_left + AC.WeaponEntry(j).QuantityRemaining();
         }
      }
   }
   tot_missiles = fox1_left + fox2_left + fox3_left; 
   if (tot_missiles <= winchester[4] || fox1_left <= winchester[2] || fox2_left <= winchester[1] || fox3_left <= winchester[0])
   {
      bingo_misl = true;  
   }
#   if (bingo_misl){writeln(plat.Name()," ",fox1_left," ",fox2_left," ",fox3_left," ",tot_missiles);}
   return bingo_misl;
end_script
```

- **演示要点**：演示 script 的参数：loop, bool, int, if, else, for, tot_missiles, return

### script（aiai_processor.old）｜脚本

- **关键词**：script, bool, if, writeln_d, double, string, int, launched, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:1274-1411`
- **片段**：

```text
   script bool CheckAndFire (WsfTrack aTarget)

      bool launched = false;

      if (aTarget.IsNull() || !aTarget.BelievedAlive())
      {
         writeln_d("    No target to fire on");
         return launched;
      }

      if ( (WeaponsActive(aTarget) > 0) || (PeersWeaponsActive(aTarget) > 0) )
      #if (WeaponsActive(aTarget) > 0)
      {
         mLastActiveWeaponTime   = TIME_NOW;
         mTrackWeaponActiveMap[aTarget.TargetName()] = TIME_NOW;
         writeln_d("    Weapons already active against ", aTarget.TargetName());
         return launched;
      }

      if ((TIME_NOW - mTrackWeaponActiveMap[aTarget.TargetName()]) < mInactiveLaunchDelay)
      {
         writeln_d("    Waiting to see what last active weapon did, score a kill?");
         return launched;
      }

      writeln_d("    CheckAndFire() against: ", aTarget.TargetName(), " Index: ", aTarget.TargetIndex(), " Type: ", aTarget.TargetType());

      if (!mCoopEngageOne)
      {
        if (aTarget.AuxDataString("notlocal") != "true")
        {
          WsfLocalTrack targetLocalTrack = (WsfLocalTrack)aTarget;
          if (targetLocalTrack.IsValid())
          {
            if(!targetLocalTrack.ContributorOf(PLATFORM) && !targetLocalTrack.IsPredefined())
            {
              writeln_d("    Not able to coop engage! ", PLATFORM.Name(), " targeting ",aTarget.TargetName(), ".  NumContributors: ", targetLocalTrack.NumContributors()  );
              return launched;
            }
          }
        }
      }

      // We can launch once we have a target-quality track.
      //TODO probably need something to test for failure to lockon
      writeln_d ("    aTarget.TrackQuality == ", aTarget.TrackQuality());


      double dRelativeBearing = MATH.Fabs(PLATFORM.RelativeBearingTo( aTarget ));
      double dSlantRange = PLATFORM.SlantRangeTo(aTarget);

      writeln_d("abs relative bearing: ", dRelativeBearing, ", slant range: ", dSlantRange);

      if (aTarget.TrackQuality() < GetRequiredTrackQualityForThreat(aTarget))
      {
         writeln_d("track quality not good enough to fire on target");
         return launched;
      }


      // Launch the weapon.  Returns false if not launched.
     #extern bool LaunchWeapon(WsfPlatform, WsfTrack, WsfWeapon, int);
     #extern double GetMaxLaunchRange (WsfPlatform, WsfTrack, string, Array<Map<string, Object>>);
     #extern double EffectiveRange (WsfPlatform, WsfTrack);
     #extern string GetTargetDomain(WsfTrack);
      double dLaunchRangePercentage = GetLaunchPercentRangeMaxOnThreat(aTarget);
      string sTargetDomain = GetTargetDomain(aTarget);
     #int  salvoCount  =  1;
      int  salvoCount  =  GetSalvoForThreat(aTarget);

      writeln_d("salvo count: ", salvoCount);

      string selectedWeapon = GetWeaponForThreat(PLATFORM, aTarget, mWeaponArray, dLaunchRangePercentage);
      if (selectedWeapon == "")
      {
         writeln_d("    No domain capable weapon within range available!");
         return launched;
      }

      WsfWeapon weaponToLaunch = PLATFORM.Weapon(selectedWeapon);

      if (dRelativeBearing > GetMaxFiringAngleForWeapon( weaponToLaunch ))
      {
         writeln_d("relative bearing towards ", aTarget.TargetName(), " is too high for selected weapon ", weaponToLaunch.Name());
         return launched;
      }

     #extern int GetWeaponNumberActiveMax(string, Array<Map<string, Object>>);
      int maxActiveOfType = GetWeaponNumberActiveMax(selectedWeapon,mWeaponArray);
      int curActiveOfType = WeaponsActiveOfType(weaponToLaunch);

      if (MustShootAt(aTarget))
      {
         curActiveOfType = maxActiveOfType - 1;
      }

      if (curActiveOfType >= maxActiveOfType)
      {
         writeln_d("    Max number (", maxActiveOfType,")of ", selectedWeapon, " weapon type are already active! (", curActiveOfType,")");
         return launched;
      }

      double effectiveRange = EffectiveRange(PLATFORM, aTarget);
      double dMaxLaunchRange = GetMaxLaunchRange(PLATFORM, aTarget, selectedWeapon, mWeaponArray);

      double rangeScale = dLaunchRangePercentage;   //no change to scaling yet (use normal launch percent)
      if (dRelativeBearing > mDegradedFiringAngle)
      {
         rangeScale = MATH.Min(mDegradedPercentRange, dLaunchRangePercentage);
      }

      if ( effectiveRange > (dMaxLaunchRange*rangeScale) )
      {
        //writeln_d("    Slantrange, ", dSlantRange*(1/MATH.M_PER_NM()), " nmi, To Target Greater Than Weapon Max Launch Range, ", dMaxLaunchRange*(1/MATH.M_PER_NM()), " nmi!");

        writeln_d(PLATFORM.Name(), " failed weapon range check against ", aTarget.TargetName());
        return launched;
      }

      launched = LaunchWeapon(PLATFORM, aTarget, weaponToLaunch, salvoCount);
      writeln_d("    launched == ", launched, ", weapon: ", selectedWeapon);

      if (launched == true)
      {
         mLastWeaponFiredTime = TIME_NOW;

#######
         double dPreviousRoundsFiredAt = mRoundsFiredAtMap.Get(aTarget);
         mRoundsFiredAtMap.Set(aTarget,dPreviousRoundsFiredAt + salvoCount);
         writeln_d("    F-pole after shot fired");
         PLATFORM.Comment("Shot at: " + aTarget.TargetName());
         //PLATFORM.Comment("Fired " + selectedWeapon + " at " + aTarget.TargetName());
         mPursuitMode = "f-pole";
         writeln_d("    mPursuitMode == ", mPursuitMode);
      }

      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：bool, if, writeln_d, double, string, int, launched, return

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, double, if, string, else, bool, ok, return, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:353-404`
- **片段**：

```text
   script double Drag(WsfPlatform aPlatform, WsfTrack aTrack, double aSpeed, double aAlt, double aGs)

      # Variables used in the script to generate the maneuver.
      # Change these to modify the behavior.
      # TODO make method arguments?
      # Flight parameters when dragging for speed (Mach) and altitude offest (meters) from start
      double dragMach = 1.1;
      # Angle in degrees to turn to drag on track.
      double dragAngle = 179;
      # Min/max angle in degrees that aircraft needs to be
      # between relative to track to be considered dragging
      double dragTolerance = 5;

      if (!aPlatform.IsValid() || !aTrack.IsValid())
      {
         return false;
      }

      # Heading when we have finished maneuver
      double finalHeading = 0;
      # Determine new heading for drag maneuver
      string positioning = GetPositioning(aPlatform, aTrack, dragTolerance);
      if (aTrack.HeadingValid() &&
          (positioning == "tail-to-head" ||
           positioning == "head-to-head" ||
           positioning == "target-facing-me")
         )
      {
         # Check for condition when we know track's heading and
         # track is facing platform.
         # This gives a more accurate "drag" to threat course
         finalHeading = aTrack.Heading();
      }
      else
      {
         # Don't know track heading or not facing platform, turn
         # based on relative bearing to track location
         double relativeHeading = TurnHeading(aPlatform, aTrack, dragAngle, dragTolerance);
         finalHeading = Math.NormalizeAngle0_360(aPlatform.Heading() + relativeHeading);
      }

      # Fly new course
      double radialAccel = aGs * Earth.ACCEL_OF_GRAVITY();
      bool ok = aPlatform.TurnToHeading(finalHeading, radialAccel);
      ok = ok && aPlatform.GoToSpeed(aSpeed);
      ok = ok && aPlatform.GoToAltitude(aAlt);
      if (!ok)
      {
         finalHeading = -1.0;
      }
      return finalHeading;
   end_script
```

- **演示要点**：演示 script 的参数：double, if, string, else, bool, ok, return

### script（aiai_processor.old）｜脚本

- **关键词**：script, bool, string, if, else, double, foreach, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:339-395`
- **片段**：

```text
    script string GetWeaponForThreat(WsfPlatform platform, WsfTrack track, Array<Map<string, Object>> weapons, double percent)
        bool checkName = false;
        string name = "";
       #extern bool IsWeaponDomainCapable(WsfTrack, Map<string, Object>);

        WsfPlatform plat = WsfSimulation.FindPlatform( track.TargetName() );
        if (plat.IsValid())
        {
            foreach( string aCategory : string wpnStr in ThreatTypeWeapon )
            {

                #writeln_d("checking if ", plat.Name(), " is category: ", aCategory);
                if( wpnStr.Length()>0 && plat.CategoryMemberOf( aCategory ) )
                {
                    checkName = true;
                    name = wpnStr;
                    writeln_d(PLATFORM.Name(), " searching only for weapon: ", name, " (for use against ", plat.Name(), ")");
                    writeln_d("weapon for type ", aCategory, " = ", wpnStr);
                    break;
                }
            }
        }
        else
        {
            writeln_d("platform for target ", track.TargetName()," is not valid!");
        }

       #extern double EffectiveRange(WsfPlatform, WsfTrack);
        double desiredRange = EffectiveRange(platform, track);
        #writeln_d(" effective range from ", platform.Name(), " to ", aTarget.TargetName(), " = ", desiredRange);
        foreach (Map<string, Object> curWeapon in weapons)
        {
          if (checkName && ((string)(curWeapon["name"]))!=name)
          {
              continue;
          }
          if (((WsfWeapon)curWeapon["weapon"]).QuantityRemaining() <= 0)
          {
              continue;
          }
          if (!IsWeaponDomainCapable(track,curWeapon))
          {
              continue;
          }
          if ((double)curWeapon["rangeMin"] > desiredRange)
          {
              continue;
          }
          if ((double)curWeapon["rangeMax"] * percent < desiredRange)
          {
              continue;
          }
          #writeln_d(" returning best weapon: ", (string)curWeapon["name"]);
          return (string)curWeapon["name"];
        }
        return "";
    end_script
```

- **演示要点**：演示 script 的参数：bool, string, if, else, double, foreach, return

### script（cvn_task_processor）｜脚本

- **关键词**：script, bool, int, double, foreach, if, for, return, 脚本
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:130-195`
- **片段**：

```text
   script bool assignInterceptor(int numberToAssign)
      bool madeAssignment = false;
      WsfPlatformList subordinates = PLATFORM.Subordinates();
      int assignmentsMade = 0;

      # start with ERC fighters
      double rangeERC = MATH.DOUBLE_MAX();
      WsfPlatform tempERC;
      foreach (WsfPlatform temp in subordinates)
      {
         if (temp.IsValid() && temp.CategoryMemberOf("ERC"))
         {
            if (TasksAssignedTo(temp) < 1)
            {
               if (temp.GroundRangeTo(TRACK) < rangeERC)
               {
                  rangeERC = temp.GroundRangeTo(TRACK);
                  tempERC = temp;
               } # closer than previous selection
            } # no current tasks
         } # is valid and ERC
      } # for each loop

      # if an ERC was found, then assign it
      if (tempERC.IsValid())
      {
         AssignTask(TRACK, "ENGAGE", tempERC);
         madeAssignment = true;
         assignmentsMade = assignmentsMade + 1;
      }

      # then look at MRC fighters
      for (int i = 1; i <= numberToAssign - assignmentsMade; i = i + 1)
      {
#         writeln("");
#         writeln(" the current value of i is ", i, " and is limited to ", numberToAssign - assignmentsMade);
#         writeln(" there are ", subordinates.Count(), " subordinates");
         double rangeMRC = MATH.DOUBLE_MAX();
         WsfPlatform tempMRC;
         foreach (WsfPlatform temp in subordinates)
         {
#            if (temp.IsValid()) writeln(" looking at ", temp.Name());
            if (temp.IsValid() && temp.CategoryMemberOf("MRC"))
            {
               if (TasksAssignedTo(temp) < 1)
               {
                  if (temp.GroundRangeTo(TRACK) < rangeMRC)
                  {
                     rangeMRC = temp.GroundRangeTo(TRACK);
                     tempMRC = temp;
                  } # closer than previous selection
               } # no current tasks
            } # is valid and MRC
         } # for each loop

         # if an MRC was found, then assign it
         if (tempMRC.IsValid())
         {
            AssignTask(TRACK, "ENGAGE", tempMRC);
            madeAssignment = true;
            assignmentsMade = assignmentsMade + 1;
         }
      } # for loop

      return madeAssignment;
   end_script
```

- **演示要点**：演示 script 的参数：bool, int, double, foreach, if, for, return

### script（rules_utils）｜脚本

- **关键词**：script, the, type, every, for, if, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:659-732`
- **片段**：

```text
script double pr_vctr_hdg(WsfPlatform me, Array<int> plan, Array<double> formation)
/*
PURPOSE   determine desired heading if in vector phase
AUTHOR   Snyder

Parameter Description
   IN  me   WsfPlatform - Platform being analyzed
   OUT hdg  DOUBLE - Desired Vector Heading

Technical Description:
   Use the formation set by the user in PRDATA, The flight lead will be the focal point flying towards his target
   The flight mates will get into a the specified formation relative to the flight lead
   
   If no formation specified, the flight will fly on a default vector heading bracketing the threats.
   This heading is a 15 degree offset from their current target, either left or right, depending on 
   the amount of targets to the platforms left or right. This only works for a "few v few" classic Brawler
   type fight. At the mission level, we will need to consider a group of targets to vector against, not 
   every target I am tracking 

   This assumes perfect correlation/CID 

*/
double hdg = me.Heading(); // initialize to current heading
double oba = 0;            // 
WsfTrack eng_trk;     // this is my track of ENG_TGT if it exists
WsfTrack ppmjid_trk;   // track of my prioritized target
int left_count = 0;        // hostiles on my left
int right_count = 0;       // hostiles on my right
int offset = 5;           // offset my threats to bracket them
WsfSA_Processor saPROC;
   for (int i=0;i<me.ProcessorCount();i+=1)
   {
      if (me.ProcessorEntry(i).IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         saPROC = (WsfSA_Processor)me.ProcessorEntry(i);
         break;
      }
   }
   if (saPROC.IsNull() || !saPROC.IsValid()) 
   {
      return hdg;
   }
// loop through all my local tracks, determine how many bad guys are on my left and right
   foreach (WsfSA_EntityPerception saent in saPROC.PerceivedBandits())  
   {  
      if (!saent.Track().IsValid())
      {
         continue;
      }
      oba = me.RelativeBearingTo(saent.Track());     // off-boresite angle to my local track
      if (saent.Track().TargetName() == me->ENG_TGT) {  eng_trk = saent.Track(); } // save this track so we can vector to this track
      if (saent == me->ppmjid)  { ppmjid_trk = saent.Track();} // save this track 
      if (saent.Track().Side() != me.Side() && saent.Track().Target().IsValid() && !saent.Track().Target().CategoryMemberOf("missile")) // this is a hostile A/C
      {
         if (oba < 0) { left_count = left_count + 1; }
         else if (oba > 0) { right_count = right_count + 1; }
      }
   }
   if ( eng_trk.IsValid() ) // I have a track of my PRDATA specified target of interest...vector towards it
   {  
      double bearing = MATH.ATan2( eng_trk.Y()-me.Y() , eng_trk.X()-me.X() ); // determine absolute bearing between my position and track position
      if (left_count > right_count) { hdg = me.TrueBearingTo(eng_trk) + offset; }
      if (right_count > left_count) { hdg = me.TrueBearingTo(eng_trk) - offset; }
      return hdg;
   }
   if (ppmjid_trk.IsValid()) 
   {  
      double bearing = MATH.ATan2( ppmjid_trk.Y()-me.Y() , ppmjid_trk.X()-me.X() ); // determine absolute bearing between my position and track position
      if (left_count > right_count) { hdg = me.TrueBearingTo(ppmjid_trk) + offset; }
      if (right_count > left_count) { hdg = me.TrueBearingTo(ppmjid_trk) - offset; }
   }   

   return hdg;
end_script
```

- **演示要点**：演示 script 的参数：the, type, every, for, if, foreach, return

### script（rules_utils）｜脚本

- **关键词**：script, loop, threatening, if, else, for, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:937-1010`
- **片段**：

```text
script double react_hdg(WsfPlatform me, int plan_2)
/*
PURPOSE   determine desired reaction phase heading 
AUTHOR   Snyder

Parameter Description
   IN  me     WsfPlatform - Platform being analyzed
   IN  plan_2 INT    - playbook 2 value, determines react phase maneuver
                       1 - 60 degree offset
                       2 - 90 degree offset
                       3 - slice maneuver
   OUT hdg    DOUBLE - Desired Vector Heading

Technical Description:
   loop through my local tracks, determine if a platform is threatening to me.
   Choose a heading based on heading off all threatening tracks to me. Track is 
   threatening to me if: track is hostile, pointing at me, and within DOR * 2
   Heading is the average bearing off all threats to me + 180 degrees

   This assumes perfect correlation/CID 

*/
double hdg = me.Heading();    // initialize to current heading
int num_threats =0;           // number of threatening tracks
double bearing;
double rel_bearing;
double offset;

   if (plan_2 == 1)
   {
      offset = 60.0;
   }
   else if (plan_2 == 2)
   {
      offset = 90.0;
   }
   WsfSA_Processor saPROC;
   for (int i=0; i<me.ProcessorCount(); i+=1)
   {
      if (me.ProcessorEntry(i).IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         saPROC = (WsfSA_Processor)me.ProcessorEntry(i);
         break;
      }
   }
   Array<WsfSA_EntityPerception> bandit_list = saPROC.PerceivedBandits();

// loop through all my local tracks, determine if bad guy is threatening
   foreach (WsfSA_EntityPerception ent in bandit_list)
   { 
      if (!ent.IsValid() || ent.IsNull())
      {
         continue;
      }
      if (ent.Track().IsValid() && ent.Track().Target().IsValid() && ent.Track().Target().Side() != me.Side() 
          && MATH.Fabs(ent.Track().RelativeBearingTo(me)) <= 60 && ent.Track().AirDomain()) // this is a hostile
      {  //writeln(ltrk.TargetName()," obang ",calc_obang(me,ltrk,2));
         bearing = bearing + me.TrueBearingTo(ent.Track());
         rel_bearing = rel_bearing + me.RelativeBearingTo(ent.Track());
         num_threats = num_threats + 1;
      }
   }
   if (num_threats > 0)
   {  
      if ( rel_bearing/num_threats < 0) { hdg = (bearing/num_threats) + offset; }
      if ( rel_bearing/num_threats > 0) { hdg = (bearing/num_threats) - offset; }
   }
   else 
   {  
      hdg = hdg + offset;
   }
//writeln(num_threats," ",hdg);
   return hdg;
end_script
```

- **演示要点**：演示 script 的参数：loop, threatening, if, else, for, foreach, return

### script（rules_utils）｜脚本

- **关键词**：script, populated, to, foreach, double, if, else, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:781-864`
- **片段**：

```text
script double pole_hdg(WsfPlatform me)
/*
PURPOSE   determine desired heading if in crank phase
AUTHOR   Snyder

Parameter Description
   IN  me   WsfPlatform - Platform being analyzed
   OUT hdg  DOUBLE - Desired Vector Heading

   me->APOLE_HDG - PRDATA variable of the crank angle offset in degrees

Technical Description:
   Loop through everyone in ill_list, which is a list of all targets i'm guiding missiles against
   populated in the call to ill_reqd. A min and max off-boresite angle is populated and used with APOLE_HDG
   to determine the final heading 

   This assumes perfect correlation/CID 

*/
double hdg = me.Heading(); // initialize to current heading
int crank_side = 0;        // initialize this to 0, user can write script to do something else, -1 = CCW, 1 = CW
double min_oba = 0;        // min off-boresite of all targets I'm guiding against
double max_oba = 0;        // max off-boresite of all targets i'm guiding against
double oba;  
WsfLocalTrack ppmjid_trk;

Array<WsfLocalTrack> ill_list = me->ill_list;
//  loop through everyone on my ill_list
   foreach (WsfLocalTrack ltrk in ill_list)
//     
   {   
      if (ltrk == me->ppmjid) { ppmjid_trk = ltrk; }

      if (me.SlantRangeTo(ltrk) >= me->COMMIT_RNG || me.Side() == ltrk.Side()) 
      {/* ignore these platforms */}
      else
      {  
         oba = me.RelativeBearingTo(ltrk); //
         if (oba < min_oba ) { min_oba = oba; }
         else if (oba > max_oba ) { max_oba = oba; }
      }
      if (crank_side == 0)
      {  
         if (max_oba >= 0.0 && min_oba >=5.0) { crank_side = -1; } //counter-clockwise
         else if (max_oba < -5.0 && min_oba <= 0.0) { crank_side = 1; } //clock wise
         else if ((max_oba + min_oba)/2 >= 5.0) { crank_side = -1; } //counter-clockwise
         else if ((max_oba + min_oba)/2 <= -5.0) { crank_side = 1; } // clock wise
         else if ((max_oba + min_oba)/2 >= 0.0) { crank_side = -1; } //counter-clockwise
         else if ((max_oba + min_oba)/2 <= 0.0) { crank_side = 1; } // clock wise
      }
   }
   double crank_angle = MATH.Fabs(me->APOLE_RDR);
   if (ill_list.Size() == 0)
   {  
      return hdg; 
   }
   if (crank_side == -1)
   {  
      hdg = ( me.Heading() - (crank_angle-max_oba)); 
   }
   else
   { 
      hdg = ( me.Heading() + (crank_angle+min_oba)); 
   }

// *** postpone this until I figure out what we're doing w/ shoot stat ***
////  lean in if i'm ready to shoot again
//   if (me->shoot_stat == 1) // in brawler, this means we're ready to shoot
//   {  double lean_angl = MATH.Min(30.0,MATH.Fabs(me->APOLE_RDR));
//      if (ppmjid_trk.IsValid()) 
//      {   
//         if (crank_side == -1) 
//         { hdg = me.Heading() - (lean_angl - me.RelativeBearingTo(ppmjid_trk)); }
//         else if (crank_side == 1)
//         { hdg = me.Heading() + (lean_angl + me.RelativeBearingTo(ppmjid_trk)); } 
//      }
//      else 
//      { 
//         writeln("POLE_HDG...WARNING ppmjid_trk not valid for A/C ",me.Name()); 
//      }
//   }

   return hdg;
end_script
```

- **演示要点**：演示 script 的参数：populated, to, foreach, double, if, else, return

### script（rules_utils）｜脚本

- **关键词**：script, if, double, bool, spd0, dir0, int, else, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:1534-1638`
- **片段**：

```text
script void pr_aim_missile(WsfPlatform plat, WsfTrack eng_trk, double speed)
/*
PURPOSE  Function call to fly a brawler mover to the intercept location of it's missile and the target track
AUTHOR   Snyder

Parameter Description
   IN  plat - WsfPlatform, platform to be analysed
   IN  eng_trk - WsfTrack, track to intercept
   IN  speed - speed at which to intercept track
   IN  BRAWLER - Brawler Processor 
Technical Description:

*/
   if (eng_trk.IsNull() || !eng_trk.IsValid())
   {
      return;
   }
   Vec3 dir0;
   double gmx = 1.0;
   double spd0 = 3.0;
   WsfWaypoint aimptWP = WsfWaypoint();
#   WsfBrawlerMover mover = (WsfBrawlerMover) plat.Mover();
   Atmosphere atm = Atmosphere.Construct("default");
   bool alt_ctrl = plat->ALT_CTRL && plat->faz!="merge";   //see ali38()
   bool msl_loft = false;   //see line 147 (no productions rules right now)
   double weaponSpeedMetersPerSec = 2904 * Math.M_PER_FT();   //(mach 3) ft/sec (from 37-65 kft altitude)
   double intTime = plat.InterceptLocation3D(eng_trk, aimptWP, weaponSpeedMetersPerSec, 5.0);
   if (alt_ctrl)
   {
      aimptWP.SetAltitude(plat->COMMIT_ALT,false);
   }
   if (plat->pitch_up && plat->faz!="merge")
   {  // calculate an altitude for the aimpoint the will force a pitch up maneuver
      double new_altitude;
      new_altitude = plat.Altitude() + MATH.Tan(plat->LOFT_ASSIST) * plat.GroundRangeTo(eng_trk.CurrentLocation());
      aimptWP.SetAltitude(new_altitude,false);
   }
   Vec3 desdir = RelativePositionNED(plat.Location(), aimptWP.Location());
   desdir.Normalize();
   double spddes = speed;
   spd0 = spddes;   //from des1v1
   dir0 = desdir;   //from des1v1 
   int spdmod = 1;   //(desspd = 1, thrttl = 2, desacc = 3)
   if (plat.Speed() <= spd0+(100.0*Math.M_PER_FT()))
   {
      double gmxsut;
      double gmxsu;
      if (plat.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         WsfBrawlerProcessor BRAWLER = (WsfBrawlerProcessor)plat.Processor("thinker");
         gmxsut = BRAWLER.MaxSustainedGs();
         gmxsu = BRAWLER.MaxTacticalGs();
      }
      else if (plat.Mover().IsA_TypeOf("WSF_SIX_DOF_MOVER"))
      {
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)plat.Mover();
         gmxsut = mover.MaxPotentialManeuverGLoad();
         gmxsu = mover.MaxPotentialManeuverGLoad();
      }
      else
      {
         gmxsut=4;
         gmxsu=5;
      }
      double wt = ramp(spd0-(100.0*Math.M_PER_FT()), plat.Speed(), spd0+(100.0*Math.M_PER_FT()));
      gmx = wt*MATH.Max(2.0,MATH.Max(gmxsut,gmxsu)) + (1.0-wt)*MATH.Min(gmxsut,gmxsu);
      gmx = MATH.Max(gmx,2.0);
   }
   else
   {
      if (plat.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         WsfBrawlerProcessor BRAWLER = (WsfBrawlerProcessor)plat.Processor("thinker");
         gmx = BRAWLER.MaxAvailableGs();    //gmxin            
      }
      else if (plat.Mover().IsA_TypeOf("WSF_SIX_DOF_MOVER"))
      {
         WsfSixDOF_Mover mover = (WsfSixDOF_Mover)plat.Mover();
         gmx = mover.MaxPotentialManeuverGLoad();
      }
      else
      {
         gmx=6;
      }      
      if (plat.Mover().Type() == "WSF_BRAWLER_MOVER" && plat->faz != "merge" && plat->faz != "notch")
      {
         WsfBrawlerProcessor BRAWLER = (WsfBrawlerProcessor)plat.Processor("thinker");         
         gmx = BRAWLER.MaxSustainedGs(); //-NAS lets chill out if we're BVR
      }
   }
      if (plat.Mover().Type() == "WSF_BRAWLER_MOVER")
      {
         plat.FlyVectorWithSpeed(dir0, gmx, spd0);
      }
      else if (plat.Mover().IsA_TypeOf("WSF_SIX_DOF_MOVER"))
      {
         plat.FlyVectorWithSpeed(dir0, gmx, spd0);
      }
      else
      {
         plat.TurnToHeading(plat.TrueBearingTo(aimptWP.Location()));
         plat.GoToAltitude(aimptWP.Altitude());
         plat.GoToSpeed(speed);   
      }
end_script
```

- **演示要点**：演示 script 的参数：if, double, bool, spd0, dir0, int, else

### script（aigci_processor.old）｜脚本

- **关键词**：script, int, for, string, if, double, bool, else, 脚本
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:222-338`
- **片段**：

```text
  script void aigci_update_with_clusters_array(Array<WsfTrack> aTrackArray)

    //writeln_d("   ~~~ aigci tracklist count:       ", localTracks.Count());

    cManager.UpdateClusters(TIME_NOW,aTrackArray);

    int NumClusters = cManager.Count();

    for (int i = 0; i < NumClusters; i = i + 1 )
    {
      WsfCluster cluster = cManager.Entry(i);
      string ClusterName = PLATFORM.Name() + "_" + (string)i;

      //no need to have a zone on the platform: deprecated!
      //cluster.UpdatePlatformZone(PLATFORM,ClusterName,(5.0/60.0));   //5 minutes (1/12th of a degree)

      if (mDrawClusters == true)
      {
        draw_cluster_hull(cluster);
      }

      WsfGeoPoint clusterPoint = cluster.MeanLocation();
      double clusterBearing = cluster.Bearing();
      bool clusterBearingValid = cluster.BearingValid();

      #writeln("~~~ aiGCI - cluster ", ClusterName, " bearing valid: ", clusterBearingValid, ", CLUSTER BEARING ", clusterBearing);
      #for (int i = 0; i < cluster.Count(); i = i + 1 )
      #{
      #   WsfTrack t = cluster.Entry(i);
      #   writeln("~~~ aiGCI - cluster entry ", t.TargetName(), ", bearing = ", t.Bearing());
      #}

      int occupants = cluster.Count();
      double ClusterPriority = (double)occupants;

      if( occupants > 0 )
      {
        if( mZoneJobMap.Exists( ClusterName ) )
        {
          //writeln_d("~~~ aiGCI, updating job for cluster: ", ClusterName);

          //job exists for zone with threats, update job priority
          WsfRIPRJob temp = mZoneJobMap.Get( ClusterName );
          //job priority could have changed, set it
          temp.Priority( ClusterPriority );
          temp.SetData( "ZonePoint", WsfGeoPoint(clusterPoint) );
          temp.SetData( "ZoneBearing", clusterBearing );
          temp.SetData( "ZoneBearingValid", clusterBearingValid );
          //number of threats inside zone could have changed, set it
          temp.SetData( "ZoneNumThreats", occupants );

          Array<string> arr = Array<string>();
          for (int i = 0; i < occupants; i = i + 1 )
          {
             arr.PushBack(cluster.Entry(i).TargetName());
          }
          temp.SetData( "ZoneThreatNameArray", arr );
        }
        else
        {
          //zone just became hot, job not created yet, create one
          WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                               "zone",
                                               "zone-" + ClusterName,
                                               ClusterPriority,
                                               mMaxJobWinnersForGciZone );
          temp.SetData( "ZoneName", ClusterName );
          temp.SetData( "ZonePoint", WsfGeoPoint(clusterPoint) );
          temp.SetData( "ZoneBearing", clusterBearing );
          temp.SetData( "ZoneBearingValid", clusterBearingValid );
          temp.SetData( "ZoneNumThreats", occupants );
          temp.SetData( "for_air", 1 );

          Array<string> arr = Array<string>();
          for (int i = 0; i < occupants; i = i + 1 )
          {
             arr.PushBack(cluster.Entry(i).TargetName());

             writeln_d("job target: ", cluster.Entry(i).TargetName());

          }
          temp.SetData( "ZoneThreatNameArray", arr );

          AddJob(temp);
          mZoneJobMap.Set( ClusterName, temp );

          writeln_d("+++ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );
        }
      }
      else
      {
        //no threats in cluster, make sure job for cluster doesn't exist or is deleted
        if( mZoneJobMap.Exists( ClusterName ) )
        {
          writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", mZoneJobMap.Get(ClusterName).Name() );
          RemoveJob( mZoneJobMap.Get(ClusterName) );
          //mZoneJobMap.Erase( ClusterName );
          mZoneJobMap.Remove( ClusterName );
        }
      }
    }

    //remove any additional clusters
    for( int j = NumClusters; j < mLastNumClusters; j = j+1 )
    {
      string ClusterName = PLATFORM.Name() + "_" + (string)j;
      if( mZoneJobMap.Exists( ClusterName ) )
      {
        writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", mZoneJobMap.Get(ClusterName).Name() );
        RemoveJob( mZoneJobMap.Get(ClusterName) );
        //mZoneJobMap.Erase( ClusterName );
        mZoneJobMap.Remove( ClusterName );
      }
    }

    mLastNumClusters = NumClusters;
  end_script
```

- **演示要点**：演示 script 的参数：int, for, string, if, double, bool, else

### script（assessment_scripts）｜脚本

- **关键词**：script, loop, in, things, if, bool, double, return, 脚本
- **出处**：`air_to_air/processors/assessment_scripts.txt:341-487`
- **片段**：

```text
         script double CalculateTargetValue(WsfSA_EntityPerception aEntity, bool aIsBogie)
         /*
         PURPOSE:        score hostile tracks to determine ppmjid, leading to weapon firing decisions
         AUTHOR:         Snyder
         Classification: (marking removed)

         Parameter Description  

         Technical Description:
            loop through my local tracks of hostiles, score each hostile based on WEZ percentage, if weapons currently
            in air against hostile, range from hostile to my protected entity,
            PRDATA tactics, and various other factors

            This assumes perfect correlation/CID 
            
             things to consider:
               - * WEZ percentage 
               - * mxtgtd 
               - * PLATFORM->ENG_TGT 
               - * targeting hostile who is threatening my PE
            */
            if (no_tree){return 0;}
            writeln_d("T = ",TIME_NOW," ",iacid.Name()," tgtval");            
            WsfLocalTrack temp_track;
            #WsfPlatform iacid = PLATFORM;
            Array<int> bng_msl = iacid->WINCHESTER;
            bool fox3_left = iacid.Weapon("fox3").QuantityRemaining() > bng_msl[0];
            bool fox2_left = iacid.Weapon("fox2").QuantityRemaining() > bng_msl[1];
            bool fox1_left = iacid.Weapon("fox1").QuantityRemaining() > bng_msl[2];
            WsfWeapon weap;
            bool in_rtr;
            double rmax_fraction;
            #FileIO iout = FileIO();
            #iout.Open(iout_path, "append");
            //  this assumes you always want to prioritize fox3 over others 
               if (fox3_left) { weap = iacid.Weapon("fox3");}
               else if (fox2_left) { weap = iacid.Weapon("fox2");}
               else if (fox1_left) { weap = iacid.Weapon("fox1");}

               double env_score;
               double temp_score;
               double min_oba=180;
               double max_oba=-180; 
               WsfLocalTrack min_oba_trk;
               WsfLocalTrack max_oba_trk;
               bool debug = true;
//               mapSCORE.Clear();
               WsfTrack ltrk_ibg = aEntity.Track();
               if (!aEntity.Track().IsValid() || !aEntity.Track().LocationValid() || aEntity.Track().TargetName() == iacid.Name())
               {
#                  writeln(TIME_NOW," ",iacid.Name()," track or location not valid ... ",ltrk_ibg.IsValid()," ");
                  return 0.0;
               }
               if (!fox3_left && !fox2_left && !fox1_left)
               { // no missiles left, don't need to score anyone
                  return 0.0;
               }
               if(debug && iout_print){iout.Write(write_str("\n",iacid.Name()," TIME = ",TIME_NOW," s","\n TGT_BIAS:  RANGE   RMAX    RMAX_FRAC   SCORE","\n"));} 
               temp_score = 0;
               in_rtr = iacid.SlantRangeTo(aEntity.Track()) <= weap.LaunchComputer().LookupResult(aEntity.Track())[2];
               rmax_fraction = iacid.SlantRangeTo(aEntity.Track())/weap.LaunchComputer().LookupResult(aEntity.Track())[0];   
               temp_score = 20.0/rmax_fraction;
               if (rmax_fraction < 0)
               {
                  temp_score = 0; // if rmax_fraction is < 0 , probably range or velocity is not valid on the track
               }
               if(debug && iout_print){iout.Write(write_str(aEntity.Track().TargetName().Pad(-12),iacid.SlantRangeTo(aEntity.Track())*MATH.NM_PER_M(),"   ",
               weap.LaunchComputer().LookupResult(aEntity.Track())[0]*MATH.NM_PER_M(),Format.Fixed(rmax_fraction,2).Pad(8),Format.Fixed(temp_score,2).Pad(10),"\n"));}

            //     check for PRDATA variable ENG_TGT, increase score of this guy
               if (aEntity.Track().TargetName() == iacid->ENG_TGT) 
               {   temp_score = 40.0/rmax_fraction;
                  if(debug && iout_print){iout.Write(write_str("ENG_TGT ",temp_score,"\n"));}
               } // 40 might be too much, need to test
            //     if hostile is within RTR, score them higher
               if (in_rtr) 
               {  temp_score = temp_score + 5;
                  if(debug && iout_print){iout.Write(write_str("IN RTR ",temp_score,"\n"));}
               }

#            //     call to count shot
               Array<int> shot_count = count_shot(iacid,aEntity,PerceivedBandits());
               int tgtd_ihost = shot_count[0];
               int num_i_shot = shot_count[1];
               int num_in_air = shot_count[2]; 

            //     check for target saturation
               if (tgtd_ihost >= iacid->I_MXTGTD || num_i_shot >= iacid->I_LNCHATTGT)
               {  // target is saturated, drastically reduce the score
                  temp_score = temp_score/5;
                  if(debug && iout_print){iout.Write(write_str("I_MXTGTD ",temp_score,"\n"));}
               }
               if (tgtd_ihost >= mapMXTGTD[aEntity])
               {  // target is saturated, drastically reduce the score
                  temp_score = temp_score/5;
                  if(debug && iout_print){iout.Write(write_str("mapMXTGTD ",temp_score,"\n"));}
               }
               else if (num_i_shot >= mapMXTGT_AC[aEntity])
               {  // target is saturated, drastically reduce the score
                  temp_score = temp_score/5;
                  if(debug && iout_print){iout.Write(write_str("mapMXTGT_AC ",temp_score,"\n"));}
               }

            //     bias guys who are threatening to my protected entity/base
            //     check PROTECTED (defined as string array in PRDATA)
               if (iacid->MISSION_TYPE == "DCA" ) // PROTECTING should be string of lat,long locations 
               {  
                  Array<string> ProtectedLocation = iacid->PROTECTING;
                  foreach (string pe_geo in ProtectedLocation) // loop through all the protected locations
                  {  // increase score more the closer they get
                     WsfGeoPoint protect_point = WsfGeoPoint.Construct(pe_geo);
                     if (protect_point.SlantRangeTo(aEntity.Track().CurrentLocation()) < iacid->DISPLN_X)
                     {  temp_score = temp_score + 5 + MATH.NM_PER_M()*(iacid->DISPLN_X-aEntity.Track().CurrentLocation().SlantRangeTo(WsfGeoPoint.Construct(pe_geo)));
                        if(debug && iout_print){iout.Write(write_str("THREATN PE ",temp_score,"\n"));}
                     } 
                  }
               }
               else if (iacid->MISSION_TYPE == "HVAADCA" || iacid->MISSION_TYPE == "ESCORT") // PROTECTING should be list of platforms i'm protecting
               {  // check perceived range from hostile to all protected entities
                  Array<string> ProtectedEntities = iacid->PROTECTING;
                  foreach (string pe in ProtectedEntities) // loop through all the platform names i'm protecting
                  {   
                     for (int i = 0; i <= PerceivedAssets().Size() - 1; i = i + 1)
                     {  
                        WsfSA_EntityPerception asset = PerceivedAssets()[i]; 
                        WsfGeoPoint aloc = WsfGeoPoint().Construct(asset.Lat(),asset.Lon(),asset.Altitude());
                           // see if I have a perception of that asset and check perceived range between hostiles and protected entity
                        if (asset.PerceivedName() == pe && 
                           aEntity.Track().CurrentLocation().SlantRangeTo(aloc) < iacid->DISPLN_X)
                        {  // increase score more the closer they get
                           temp_score = temp_score + 5 + MATH.NM_PER_M()*(iacid->DISPLN_X-aEntity.Track().CurrentLocation().SlantRangeTo(aloc));
                           if(debug && iout_print){iout.Write(write_str("THREATN PE ",temp_score,"\n"));}
                        } 
                     }
                  }
               }
               else if (iacid->MISSION_TYPE == "SWEEP" )
               { // if mission is SWEEP, prioritize aircraft
                  if (aEntity.Track().AirDomain())
                  {
                     temp_score = temp_score + 5;
                     if(debug && iout_print){iout.Write(write_str("SWEEP MISION AND TGT IS A/C ",temp_score,"\n"));}
                  }
               }
#               writeln(write_str(TIME_NOW," ",iacid.Name()," scoring threat ",ltrk_ibg.TargetName(),", score = ",temp_score));
            return temp_score;
         end_script 
```

- **演示要点**：演示 script 的参数：loop, in, things, if, bool, double, return

### script（flight_lead_filtered_timeline）｜脚本

- **关键词**：script, if, int, bool, for, double, else, return, 脚本
- **出处**：`base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:209-464`
- **片段**：

```text
   script Array<WsfQuantumTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
      writeln_d("T=", TIME_NOW, ", ", PLATFORM.Name(), " generating tasks!");
      Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
      if (ASSETS.Size() <= 0)
      {
         writeln_d("NO ASSETS!");
         return tasks;
      }
      if (TRACKS.Size() <= 0)
      {
         writeln_d("NO TRACKS!");
      }

      #FILTER TRACKS DOWN TO ONLY TARGETS WE CARE ABOUT RIGHT NOW
      #TODO - find fastest/furthest along asset (as likliest to be first engaged by threats)
      Array<WsfTrack> filtered = FilterTracks(TRACKS, ASSETS);

      if (mStaticRiskLevel == false)
      {
         UpdateRiskLevel(filtered);
      }

#      mDraw.SetColor(0.6, 0.6, 0.6);   #gray
#      mDraw.BeginLines();
#      foreach(WsfTrack target in filtered)
#      {
#         writeln_d("T=", TIME_NOW, " drawing filtered: ", target.TargetName());
#         mDraw.Vertex(PLATFORM);
#         mDraw.Vertex(target.CurrentLocation());
#      }
#      mDraw.End();

      if (filtered.Size() <= 0)
      {
         return tasks;
      }
      #DEBUG - draw the filtered tracks with a purple hull
      mClusterManager.Draw(filtered, PROCESSOR.UpdateInterval(), Vec3.Construct(0.2,0.2,1.0), "hull");

#      #DEBUG - draw line from asset centroid to filtered threats centroid
#      mDraw.SetColor(1.0,1.0,0.0);  #yellow?
#      mDraw.SetLineStyle("solid");
#      mDraw.SetLineSize(1);
#      mDraw.BeginLines();
#         mDraw.Vertex(AssetCentroid);
#         mDraw.Vertex(FilteredCluster.MeanLocation());
#      mDraw.End();


      #CALCULATE IF THE FLIGHT EXECUTES ONE OR TWO TIMELINES
      #first find if we have two+ shooters or not
      int totalWeapons = 0;
      mWeapons1 = 0;
      mWeapons2 = 0;
      bool haveTwoShooters = false;
      foreach(WsfAssetPerception ASSET in ASSETS)
      {
         for (int i=0; i<ASSET.SystemCount(); i+=1)
         {
            #TODO - limit the consideration to only certain [better] weapons
            #       instead of just first weapon in system list
            if (ASSET.SystemKind(i) == "weapon")
            {
               int weapons = ASSET.SystemQuantityRemaining(i);
               totalWeapons += weapons;
               if (mPassiveAllowed == true && mPassivePlayers[ASSET.Name()] == true)
               {
                  break;   #passive players will not fly "point" on a timeline nor shoot
               }
               if (weapons > mWeapons1)
               {
                  if (mWeapons1 > mWeapons2)
                  {
                     mShooter2 = mShooter1;
                     mWeapons2 = mWeapons1;
                  }
                  mShooter1 = ASSET;
                  mWeapons1 = weapons;
               }
               else if (weapons > mWeapons2)
               {
                  mShooter2 = ASSET;
                  mWeapons2 = weapons;
               }
               break;
            }
         }
      }

      if (filtered.Size() > totalWeapons)
      {
         writeln_d(PLATFORM.Name(), ", WARNING! More threats than this flight has weapons!");
      }

      if (filtered.Size() > (mWeapons1+mWeapons2))
      {
         writeln_d(PLATFORM.Name(), ", WARNING! More threats than two shooters have weapons! Enable all as shooters?");
      }

      haveTwoShooters = (mWeapons1 > 0 && mWeapons2 > 0);

      #TODO - more intelligent calculation of azimuth presentation:
      #       find likely first shot location (from shooter 1 to biggest threat)
      #       sort all extrapolatead threats based on relative azimuth at this shot location
      #       figure out if the threats are presenting on azimuth and will require two timelines

      #for now - sort filtered tracks on azimuth
      #          compare "width" of threats (left most to right most) to "length" of weapon
      Array<double> bearings = Array<double>();
      foreach(WsfTrack t in filtered)
      {
         double bearing = ASSETS[0].RelativeBearingTo(t.CurrentLocation());
         bearings.PushBack(bearing);
      }
      SortTracksByValue(filtered, bearings);

      #debug: print sorted (by bearing) order to screen
      mDraw.SetDuration(PROCESSOR.UpdateInterval());
      mDraw.SetColor(1.0,0.5,0.0);  #orange?
      mDraw.SetLineStyle("solid");
      mDraw.SetTextSize(16);
      for (int i=0; i<filtered.Size(); i+=1)
      {
         mDraw.BeginText(write_str(i));
            mDraw.Vertex(filtered[i].CurrentLocation());
         mDraw.End();
      }

      #calculate if the threats are presenting across a wide azimuth
      bool AzimuthPresentation = true;
      WsfTrack left  = filtered.Front();
      WsfTrack right = filtered.Back();
      double width  = left.CurrentLocation().GroundRangeTo(right.CurrentLocation());
      double length = mMyWeaponRange;
      #assume shooter 1 flies towards middle of angle separation
      double halfAngle = MATH.ATan2(width/2.0,length);
      if ((2.0*halfAngle) < mMaxTargetAzSeparation)
      {
         AzimuthPresentation = false;
      }

      if (mEnableTwoTimelines &&
          haveTwoShooters     &&   #only create two timelines if we have 2 shooters???
          filtered.Size() > 1 &&   #two timelines only possible if more than 1 threat exists
          (  mWeapons1 < filtered.Size() ||  #if MUST use 2 shooters because of weapon counts
             AzimuthPresentation)            #OR if must use 2 shooters because of threat presentation
         )
      {
         #create two timeline tasks
         #first make mShooter1 the left most shooter
         WsfGeoPoint p1 = filtered[0].CurrentLocation();   #left target
         double d1 = mShooter1.Location().GroundRangeTo(p1);
         double d2 = mShooter2.Location().GroundRangeTo(p1);
         if (d2 < d1)
         {
            #swap 1 and 2 so mShooter1 refers to left shooter
            int tWeapons; WsfAssetPerception tShooter;
            tShooter  = mShooter1; tWeapons  = mWeapons1;
            mShooter1 = mShooter2; mWeapons1 = mWeapons2;
            mShooter2 = tShooter;  mWeapons2 = tWeapons;
         }


         #TODO - consider group up threats on azimuth???
         #TODO - consider other azimuth-based algorithms to separate the threats
         #for now - make two clusters
         WsfGeoPoint SeparateA;
         WsfGeoPoint SeparateB;

         Array<Array<WsfTrack>> clusters = mClusterManager.GetClusters(filtered);
         #should be 2 clusters now
         if (clusters.Size() != 2)
         {
            writeln("ERROR: cluster manager did not create two clusters! ABORT task generation!");
            return tasks;
         }
         else
         {
            #draw separation lines
            WsfGeoPoint a = mClusterManager.MeanLocation(clusters[0]);
            WsfGeoPoint b = mClusterManager.MeanLocation(clusters[1]);
            double az   = a.TrueBearingTo(b);
            double dist = a.GroundRangeTo(b);
           #WsfGeoPoint c = WsfGeoPoint(a);
            SeparateA = WsfGeoPoint(a);
            SeparateA.OffsetRBE(dist/2.0,az,0.0);
           #WsfGeoPoint d = WsfGeoPoint(c);
            SeparateB = WsfGeoPoint(SeparateA);
            SeparateA.OffsetRBE(DOR,az+90.0,0.0);
            SeparateB.OffsetRBE(DOR,az-90.0,0.0);

#            mDraw.SetColor(1.0,1.0,1.0);  #white
#            mDraw.SetLineStyle("solid");
#            mDraw.SetLineSize(1);
#            mDraw.BeginLines();
#               mDraw.Vertex(a);
#               mDraw.Vertex(b);
#               mDraw.Vertex(SeparateA);
#               mDraw.Vertex(SeparateB);
#            mDraw.End();
         }

         for (int i = 0; i < clusters.Size(); i += 1 )
         {
            string shapeType = "hull";

            if(Math.Mod(i,2) == 0)
            {
               shapeType = "star";
            }

            #Draw a green shape around the cluster for one update cycle
            mClusterManager.Draw(clusters[i], PROCESSOR.UpdateInterval(), Vec3.Construct(0.0,1.0,0.0), shapeType);

            WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
            task.SetTaskType("TIMELINE");
            Array<WsfTrack> targets = Array<WsfTrack>();
            for (int j=0; j<clusters[i].Size(); j+=1)
            {
               targets.PushBack(WsfTrack(clusters[i][j]));
            }
            task.SetAuxData("targets",targets);
            task.SetAuxData("FSR",FSR);
            task.SetAuxData("DOR",DOR);
            task.SetAuxData("MAR",MAR);
            task.SetAuxData("RISK",RISK);
            task.SetAuxData("point_a",SeparateA);
            task.SetAuxData("point_b",SeparateB);
            task.SetAuxData("cluster_mean", mClusterManager.MeanLocation(clusters[i]));
            task.UniqueId(mClusterManager.UniqueId(targets));
            tasks.PushBack(task);
            writeln_d("timeline task generated for cluster: ", mClusterManager.UniqueId(clusters[i]));
         }
      }
      else
      {
         #create just one timeline task
         WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
         task.SetTaskType("TIMELINE");
         Array<WsfTrack> targets = Array<WsfTrack>();
         foreach(WsfTrack t in filtered)
         {
            targets.PushBack(WsfTrack(t));
         }
         task.SetAuxData("targets",targets);
         task.SetAuxData("FSR",FSR);
         task.SetAuxData("DOR",DOR);
         task.SetAuxData("MAR",MAR);
         task.SetAuxData("RISK",RISK);
         task.UniqueId(PLATFORM.Index());   #only timeline task this lead will generate
         tasks.PushBack(task);
         writeln_d("timeline task generated for all filtered tracks!");
      }

      return tasks;
   end_script
```

- **演示要点**：演示 script 的参数：if, int, bool, for, double, else, return

### script（sam_launch_computer）｜脚本

- **关键词**：script, extern, bool, string, if, else, return, 脚本
- **出处**：`ship_ad/weapons/sam/sam_launch_computer.txt:19-35`　（同签名共 2 处，另见 `ship_ad/weapons/sam/sam_launch_computer.txt:40`）
- **片段**：

```text
script bool SAM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, string aEnvelopeName, double aLaunchDelay)
   extern bool RED_SR_SAM_1_LaunchComputer(WsfTrack, WsfPlatform, string, double);
   extern bool RED_SR_SAM_2_LaunchComputer(WsfTrack, WsfPlatform, string, double);

   bool canIntercept = false;
   string subType = aAssignee.Type();
   if (subType == "RED_MISSILE_DESTROYER")
   {
      canIntercept = RED_SR_SAM_1_LaunchComputer(aTrack, aAssignee, aEnvelopeName, aLaunchDelay);
   }
   else if (subType == "RED_MISSILE_FRIGATE")
   {
      canIntercept = RED_SR_SAM_2_LaunchComputer(aTrack, aAssignee, aEnvelopeName, aLaunchDelay);
   }

   return canIntercept;
end_script
```

- **演示要点**：演示 script 的参数：extern, bool, string, if, else, return

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, double, if, else, bool, ok, return, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:408-433`　（同签名共 2 处，另见 `base_types/processors/timeline_agents/air_combat_maneuvers.txt:172`）
- **片段**：

```text
   script double TurnDirection(WsfPlatform aPlatform, string aDirection, double aSpeed, double aGs)
      # Angle in degrees to turn.
      double turnAngle = 179.5;
      # Heading when we have finished maneuver
      double finalHeading = 0;

      if (aDirection == "left")
      {
         finalHeading = Math.NormalizeAngle0_360(aPlatform.Heading() - turnAngle);
      }
      else
      {   # "right"
         finalHeading = Math.NormalizeAngle0_360(aPlatform.Heading() + turnAngle);
      }

      # Fly new course
      double radialAccel = aGs * Earth.ACCEL_OF_GRAVITY();
      bool ok = aPlatform.TurnToHeading(finalHeading, radialAccel);
      ok = ok && aPlatform.GoToSpeed(aSpeed);
      ok = ok && aPlatform.GoToAltitude(aPlatform.Altitude());
      if (!ok)
      {
         finalHeading = -1.0;
      }
      return finalHeading;
   end_script
```

- **演示要点**：演示 script 的参数：double, if, else, bool, ok, return

### script（FindEquinoxOrSolstice）｜脚本

- **关键词**：script, if, bool, while, int, else, return, 脚本
- **出处**：`space_operations/scripts/FindEquinoxOrSolstice.txt:35-96`
- **片段**：

```text
script int FindNextEquinoxOrSolstice(Calendar c,
                                     double   dt)
   if (dt <= 0.0) dt = 100000.0;                      # A timestep of zero indicates to use the initial timestep

   writeln_d("****** Refining solution starting at ", ToString_Calendar(c), ", dt=", dt);

   Vec3 loc = Sun.LocationECI(c);
   Vec3 lastLoc;
   bool found = false;
   while (!found)
   {
      lastLoc = loc;
      c.AdvanceTime(dt);
      loc = Sun.LocationECI(c);
      writeln_d(ToString_Calendar(c), " Loc=", Format.Scientific(loc, 8));
      if ((loc.Get(0) * lastLoc.Get(0) < 0.0) ||      # Found a solstice transition
          (loc.Get(1) * lastLoc.Get(1) < 0.0))        # Found an equinox transition
      {
         found = true;
         break;
      }
   }

   int returnValue = -1;                              # Default to not found
   if (found)
   {
      if (dt <= 0.000011)
      {
         if (loc.Get(0) * lastLoc.Get(0) < 0)         # Found a solstice transition
         {
            returnValue = 1;                          # Assume summer
            if (loc.Get(1) < 0.0) returnValue = 3;    # Nope, winter
            # Pick the best time (smallest absolute value of X)
            if (Math.Fabs(lastLoc.Get(0)) < Math.Fabs(loc.Get(0)))
            {
               c.AdvanceTime(-dt);
            }
         }
         else                                         # Must have been an equinox transition
         {
            returnValue = 0;                          # Assume vernal
            if (loc.Get(0) < 0.0) returnValue = 2;    # Nope, autumnal
            # Pick the best time (smallest absolute value of Y)
            if (Math.Fabs(lastLoc.Get(1)) < Math.Fabs(loc.Get(1)))
            {
               c.AdvanceTime(-dt);
            }
         }
      }
      else
      {
         # Refine the solution (divide the timestep by 10)
         c.AdvanceTime(-dt);
         returnValue = FindNextEquinoxOrSolstice(c, 0.1 * dt);
      }
   }
   else
   {
      writeln_d("***** No solution found at ", ToString_Calendar(c), " dt=", dt);
   }
   return returnValue;
end_script
```

- **演示要点**：演示 script 的参数：if, bool, while, int, else, return

### script（aiai_processor.old）｜脚本

- **关键词**：script, if, return, foreach, double, bool, else, 脚本
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:523-585`
- **片段**：

```text
  script bool FlyEscortFormation()
    if (!mEscortFollowing)
    {
      return false;
    }
    //make sure escorted platform exists, find it, save it
    WsfPlatform escortPlatform;
    #if ( !mEscortNames.Empty() )     #{
    foreach ( string sEscortName in mEscortNames )
    {
      escortPlatform = WsfSimulation.FindPlatform(sEscortName);
      if (escortPlatform.IsValid() )
      {
        mEscortName = sEscortName;
        writeln_d("--- fighter ", PLATFORM.Name(), " is escorting ", mEscortName);
        break;
      }
    }                                 #}

    if ( escortPlatform.IsValid() )
    {
      //check if I am approximately in my formation position
      WsfGeoPoint formationPoint = GetFormationPoint( escortPlatform, mFormationPositionX, mFormationPositionY );
      if (!formationPoint.IsValid())
      {
        writeln_d("--- fighter ", PLATFORM.Name(), " invalid formation point from ", escortPlatform.Name());
        return false;
      }
      double radius = mGoodFormationRatio * escortPlatform.SlantRangeTo(formationPoint);

      bool bAlt = true;
      if (escortPlatform.Altitude() > PLATFORM.Altitude())
      {
         bAlt = PLATFORM.GoToAltitude ( escortPlatform.Altitude(), 200 );
      }
      if (AmInFormationPosition(formationPoint, radius))
      {
        //match speed and heading of escorted platform
        # bool GoToAltitude (double aAlt,     double aAltRateOfChange);
        # bool GoToSpeed    (double aSpeed,   double aLinearAccel    );
        # bool TurnToHeading(double aHeading, double aRadialAccel    );
        bool bVel = PLATFORM.GoToSpeed    ( escortPlatform.Speed()    );
        bool bYaw = PLATFORM.TurnToHeading( escortPlatform.Heading()  );
        #PLATFORM.Comment(write_str("formation: alt=", bAlt, " vel=", bVel, " yaw=",bYaw));
      }
      else
      {
        //fly towards formation position, extrapolated ahead X seconds
        double lookAheadDistance  = mFormationLookAhead * escortPlatform.Speed();
        formationPoint.Offset(escortPlatform.Heading(), lookAheadDistance, 0, 0);
        double myDistanceToExtrap = PLATFORM.GroundRangeTo(formationPoint);
        double mySpeedToExtrap    = myDistanceToExtrap / mFormationLookAhead;

       #bool bVel = PLATFORM.GoToSpeed(cINTERCEPT_SPEED);
        bool bVel = PLATFORM.GoToSpeed(mySpeedToExtrap);
        bool bYaw = PLATFORM.TurnToHeading( PLATFORM.TrueBearingTo(formationPoint) );
        #PLATFORM.Comment(write_str("re-enter: vel=", bVel, " yaw=",bYaw));
      }
      return true;
    }
    writeln_d("--- fighter ", PLATFORM.Name(), " no valid platform to escort!");
    return false;
   end_script
```

- **演示要点**：演示 script 的参数：if, return, foreach, double, bool, else

### script（aijam_processor）｜脚本

- **关键词**：script, if, track, else, string, int, bool, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:537-600`
- **片段**：

```text
  script void DoJob(WsfRIPRJob aJob, int aChannel)

#    double timeMark1 = GetWallClockTime();
#    double timeMark2 = timeMark1;


    WsfTrack track;
    if (aJob.IsValid())
    {
      track = GetJobsTrack(aJob);
    }
    else
    {
      //stop performing previous jamming job
      if (mChannelTargets.Size() > aChannel)
      {
        WsfTrackId oldTargetId = mChannelTargets.Get(aChannel);
        if (oldTargetId != emptyTrackId)
        {
          if (DoStopJamming(aChannel, oldTargetId))
          {
            mChannelTargets.Set(aChannel, emptyTrackId);
            writeln("successfully stopped jamming old target");
          }
          else
          {
            writeln("error: still jamming old target, will try to stop next update!");
          }
        }
      }
      return;
    }

    //string comment = "doing job: " + aJob.GetDescription();
    //PLATFORM.Comment(comment);

    WsfTrackId previousTargetId = mChannelTargets.Get(aChannel);
    string     jammerName       = mChannelJammers.Get(aChannel);
    int        beam             = mChannelBeams.Get(aChannel);
    bool       targetChanged    = (!track.IsValid() || (track.TrackId() != previousTargetId));

    // if this channel had a previous target, and the new target is different
    // (or invalid, and thus different), then stop jamming the previous target
    // and make room for the new one
    if ( targetChanged && (previousTargetId != emptyTrackId) )
    {
      if (DoStopJamming(aChannel, previousTargetId))
      {
        mChannelTargets.Set(aChannel, emptyTrackId);
        previousTargetId = mChannelTargets.Get(aChannel);
      }
    }

    //if the new target is valid & different, and the previous target has stopped being jammed, then
    //start jamming the new target
    if (track.IsValid() && targetChanged && (previousTargetId == emptyTrackId))
    {
      if (DoStartJamming(aChannel, track))
      {
        mChannelTargets.Set(aChannel, track.TrackId());
      }
    }

  end_script
```

- **演示要点**：演示 script 的参数：if, track, else, string, int, bool

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, bool, double, if, string, else, return, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:89-164`　（同签名共 9 处，另见 `base_types/processors/quantum_agents/common/common_platform_script.txt:693`、`base_types/processors/ripr_agents/common/common_platform_script.txt:693`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:688`）
- **片段**：

```text
   script string GetPositioning(WsfPlatform aPlatform, WsfTrack aTrack, double aAngleTolerance)
      # Are we heading the same direction?
      bool sameHeading = false;
      bool oppHeading = false;
      bool oppHeadingValid = aTrack.HeadingValid();
      double headingDiff = MATH.Fabs(MATH.NormalizeAngleMinus180_180(aPlatform.Heading() - aTrack.Heading()));

      if (oppHeadingValid && headingDiff < aAngleTolerance)
      {
         sameHeading = true;
      }
      if (oppHeadingValid && headingDiff > (180 - aAngleTolerance))
      {
         oppHeading = true;
      }

      # Is either one of us pointing at the other?
      # Apparently bearing is always valid (?)
      bool pointingMeYou = false;
      bool pointingYouMe = false;

      double pMeYou = MATH.Fabs(aPlatform.RelativeBearingTo(aTrack));
      double pYouMe = MATH.Fabs(aTrack.RelativeBearingTo(aPlatform));

      if (pMeYou < aAngleTolerance)
      {
         pointingMeYou = true;
      }
      if (pYouMe < aAngleTolerance)
      {
         pointingYouMe = true;
      }

      # Put them together and we've got relative positioning
      string positioning = "";
      if (sameHeading && pointingMeYou)
      {
         positioning = "head-to-tail";
      }
      else if (sameHeading && pointingYouMe)
      {
         positioning = "tail-to-head";
      }
      else if (oppHeading && (pointingMeYou || pointingYouMe))
      {
         positioning = "head-to-head";
      }
      else if (pointingMeYou && pointingYouMe)
      {
         positioning = "head-to-head";
      }
      else if (oppHeading)
      {
         positioning = "tail-to-tail";
      }
      else if (pointingMeYou)
      {
         positioning = "me-facing-target";
      }
      else if (pointingYouMe)
      {
         positioning = "target-facing-me";
      }
      else
      {
         positioning = "none";
      }
      # Debug, in case angle math is bad
#      writeln_d("    ", aPlatform.Name(), " to ", aTrack.TargetName(), ", headingDiff: ", headingDiff, ", pMeYou: ", pMeYou, ", pYouMe: ", pYouMe);
#      writeln_d("    meHeading: ", aPlatform.Heading(), ", youHeading: ", aTrack.Heading());
#      writeln_d("    sameHeading: ", sameHeading, ", oppHeading: ", oppHeading,
#                ", pointingMeYou: ", pointingMeYou, ", pointingYouMe: ", pointingYouMe,
#                ", positioning: ", positioning);

      return positioning;
   end_script
```

- **演示要点**：演示 script 的参数：bool, double, if, string, else, return

### script（assessment_scripts）｜脚本

- **关键词**：script, me, guid_list, needil, ill_list, beans, my, 脚本
- **出处**：`air_to_air/processors/assessment_scripts.txt:183-280`
- **片段**：

```text
         script bool CalcWeaponSupport()
         /*
         PURPOSE   evaluate when or if weapons need support, create list of targets
         AUTHOR   Snyder

         Parameter Description
             me         WsfPlatform - Platform being analyzed, loop through my flight
             guid_list  Array<WsfPlatform>   - List of weapons I am supporting
             needil     BOOL - True if a weapon requires my support
             ill_list   Array - Array of target tracks I'm supporting weapons against
             beans      int  - number of missiles that require my support 

         Technical Description:
            Loop over all percieved bandits, if there is an active weapon that I own against any one of 
            my them, and missile range to go is > pitbull range

         TO DO: 
            -make this work for forward pass shots/third party/net enabled
            -add logic for snipping missiles or assessing to fail 
         */
              if (no_tree){return 0;}
              writeln_d("T = ",TIME_NOW," ",iacid.Name()," wpn");              
              needil = false;
              ill_list.Clear();        // clear out the ill_list

               bool support = false;
#               Array<WsfLocalTrack> i_list = Array<WsfLocalTrack>();
               Array<WsfPlatform> g_list = iacid->guid_list;

               foreach (WsfPlatform msl in g_list)
               {
                  if (msl.IsNull() || !msl.IsValid()){continue;}
                  WsfTrack trk = msl.CurrentTargetTrack();
                  if (msl.SlantRangeTo(trk) > iacid->PITBULL)
                  { 
                     support = true ; 
                     foreach (WsfSA_EntityPerception saent in PerceivedBandits())
                     {
                        if (saent.Track().IsValid() && !saent.Track().IsNull() && saent.Track().Target().IsValid() 
                            && saent.Track().TargetName() == trk.TargetName())
                        {
                           WsfLocalTrack ltrk = iacid.MasterTrackList().Find(saent.Track().TrackId());
                           ill_list.PushBack(ltrk);
                        }
                     }
                  } 
               }
               beans = ill_list.Size(); // total number of missiles requiring my support
               needil = support; // set platform global variable needil
               
               // determine if anyone in my flight is guiding missiles 
               flt_guiding=false; // initialize to false
               if(needil) // I'm guiding
               {
                  flt_guiding = true;
               }
               else if (iacid == FTR_RULES_CHAIN.Commander()) // if flight lead
               {  // loop through my subordinates
                  for (int mate=0; mate < FTR_RULES_CHAIN.SubordinateCount(); mate+=1)
                  {
                     if (FTR_RULES_CHAIN.SubordinateEntry(mate).CategoryMemberOf("missile")) {continue;}
                     if (FTR_RULES_CHAIN.SubordinateEntry(mate)->needil)
                     {
                        flt_guiding = true; 
                        break;
                     }
                  }
               }
               else // i'm a subordinate
               {  // check my flight lead
                  if (FTR_RULES_CHAIN.Commander()->needil)
                  {
                     flt_guiding = true;
                  }
                  else
                  {  // check my peers
                     for (int mate=0; mate < FTR_RULES_CHAIN.PeerCount(); mate+=1)
                     {
                        if (FTR_RULES_CHAIN.PeerEntry(mate).CategoryMemberOf("missile")){continue;}
                        if (FTR_RULES_CHAIN.PeerEntry(mate)->needil || flt_guiding)
                        {
                           flt_guiding = true; 
                           break;
                        }
                     } // check my subordinates
                     for (int mate=0; mate < FTR_RULES_CHAIN.SubordinateCount(); mate+=1)
                     {
                        if (FTR_RULES_CHAIN.SubordinateEntry(mate).CategoryMemberOf("missile")){continue;}
                        if (FTR_RULES_CHAIN.SubordinateEntry(mate)->needil || flt_guiding)
                        {
                           flt_guiding = true; 
                           break;
                        }
                     }
                  }
               }
               return needil;
         end_script
```

- **演示要点**：演示 script 的参数：me, guid_list, needil, ill_list, beans, my

### script（aijam_processor）｜脚本

- **关键词**：script, int, for, jammer, if, else, string, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:604-705`
- **片段**：

```text
  script void final_initialize()

    WsfWeapon jammer;
    int numWeapons = PLATFORM.WeaponCount();

    for (int j = 0; j < numWeapons; j = j + 1)
    {
      jammer = PLATFORM.WeaponEntry(j);
      if (jammer.IsValid())
      {
        string jammerPod = "none";
        if (      jammer.CategoryMemberOf("left_front_pod" ))
        {
          jammerPod = "left_front_pod";
        }
        else if (jammer.CategoryMemberOf("left_rear_pod"  ))
        {
          jammerPod = "left_rear_pod";
        }
        else if (jammer.CategoryMemberOf("right_front_pod"))
        {
          jammerPod = "right_front_pod";
        }
        else if (jammer.CategoryMemberOf("right_rear_pod" ))
        {
          jammerPod = "right_rear_pod";
        }
        else if (jammer.CategoryMemberOf("left_pod_lbt"   ))
        {
          jammerPod = "left_pod_lbt";
        }
        else if (jammer.CategoryMemberOf("right_pod_lbt"  ))
        {
          jammerPod = "right_pod_lbt";
        }

        string jType = jammer.Type();
        if (jType == "SOJ_VHF_JAMMER"   ||
            jType == "SOJ_SBAND_JAMMER" ||
            jType == "SOJ_XBAND_JAMMER"   )
        {
          //map these N beams with the next N channels
          int numBeams = jammer.MaximumBeams();
          for (int k = 1; k <= numBeams; k = k + 1)
          {
            mChannelBeams.PushBack(k);                //this next channel is to use beam k...
            mChannelJammers.PushBack(jammer.Name());  //...of this jammer
            mChannelPods.PushBack(jammerPod);         //...on this pod

            Array<int> channels = Array<int>();
            if (mPodToChannels.Exists(jammerPod))
            {
              channels = mPodToChannels.Get(jammerPod);
            }
            int currentChannel = mChannelBeams.Size() - 1;  //channels use zero-based indexing
            channels.PushBack(currentChannel);
            mPodToChannels[jammerPod] = channels;
          }
          if (numBeams <= 0)
          {
            writeln("*** WARNING: no beams on Jammer: ", jammer.Name());
          }
        }
        else
        {
          writeln("*** WARNING: Jammer type: ", jType,
                  " not recognized. Couldn\'t map jammer weapon beams to channels.");
        }
      }
      else
      {
        writeln("*** WARNING: Jammer weapon entry not valid: ", j);
      }
    }
    if (numWeapons <= 0)
    {
      writeln("*** WARNING: no weapons!!!");
    }

    SetNumJobChannels( mChannelJammers.Size() );
    string comment = "num job channels: " + (string)GetNumJobChannels();
    PLATFORM.Comment(comment);

    writeln_d("channels: ", GetNumJobChannels(), " pods arr: ", mChannelPods.Size(),
              " jammers arr: ", mChannelJammers.Size(), " beams arr: ", mChannelBeams.Size());

    int N = GetNumJobChannels();
    for (int i = 0; i < N; i = i + 1)
    {
      string channelDescription = "channel " + (string)i + ", pod: " + mChannelPods[i] +
                                  ", jammer: " + mChannelJammers[i] + ", beam: " + (string)mChannelBeams[i];
      writeln_d(channelDescription);
      PLATFORM.Comment(channelDescription);
    }

    writeln("Starting multi channel jammer agent for ", PLATFORM.Name());
    for (int i = 0; i < GetNumJobChannels(); i = i + 1)
    {
      mChannelTargets.Set(i, emptyTrackId);
    }

  end_script
```

- **演示要点**：演示 script 的参数：int, for, jammer, if, else, string

### script（rules_utils）｜脚本

- **关键词**：script, the, extern, if, foreach, for, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:68-206`
- **片段**：

```text
script WsfPlatform remote_test(WsfPlatform shooter, WsfTrack trk)
/*
PURPOSE  determine who the desired guider of a missile is
AUTHOR   Snyder

Parameter Description
   IN  shooter    WsfPlatform - Shooter 
   IN  ltrk       WsfLocalTrack - Track of interest
   OUT WsfPlatform - Desired platform to guide the shot

Technical Description:
   Initialize the desired guiding platform to the shooting platform. Then loop through 
   the IFLITE command chain to see if anyone is capable of guiding my shot 
   
   Criteria to select someone:
      - Platform is in my IFLITE command chain structure
      - Platform has a raw track of the same target (ensures he has own ship sensor track)
      - Platform's range to target is greater than my range to target
      - I am within the FOR of the platform's radar, ensuring he can send weapon uplinks to my missile

*/
#   FileIO iout = FileIO();
   extern FileIO iout;
   extern bool iout_print;
   extern string iout_path;
   if (iout_print)
   {
#      iout.Close();
#      iout.Open(iout_path, "append");
      iout.Write(write_str(" remote_test...","\n"));
   }
   if (!shooter->FWD_PASS)
   {
      if (iout_print)
      {
         iout.Write(write_str("    Forward Pass Disabled...guider = ",shooter.Name(),"\n"));
#         iout.Close();
      }
      return shooter;
   }
   WsfPlatform guider = shooter; // initialize this to the shooter

   Array<WsfPlatform> mate_list = Array<WsfPlatform>();
   // add commander to flight mate list
   if (shooter.Commander().IsValid())
   {
      mate_list.PushBack(shooter.Commander());
   }
   // loop through peers
   foreach (WsfPlatform mate in shooter.Peers("IFLITE"))
   {
      if (mate.IsValid() && !mate.CategoryMemberOf("missile") && mate!=shooter)
      {
         mate_list.PushBack(mate);
      }
   }
   // loop through subs
   foreach (WsfPlatform mate in shooter.Subordinates("IFLITE"))
   {
      if (mate.IsValid() && !mate.CategoryMemberOf("missile"))
      {
         mate_list.PushBack(mate);
      }
   }
   
   if (mate_list.Size() == 0)
   {
      if (iout_print)
      {
         iout.Write(write_str("    No Available Flight Mates...guider = ",shooter.Name(),"\n"));
#         iout.Close();
      }
   }
   
   // loop through my flight mates and see if anyone meets the forward pass criteria
   for (int i=0; i<mate_list.Size(); i+=1)
   {
      WsfPlatform mate = mate_list[i];
      // check if mate's range is 10 or more nmi more than my range
      // check if target within mate's FOV
      // check if shooter within mate's FOV
      // check beans
      WsfSensor sensor = mate.Sensor("rdr1");
      if (mate.SlantRangeTo(trk.CurrentLocation()) >= (10.0*MATH.M_PER_NM() + shooter.SlantRangeTo(trk.CurrentLocation())))
      {
         if (sensor.WithinFieldOfView(trk.CurrentLocation()) && sensor.WithinFieldOfView(shooter.Location()))
         {
            if (mate->beans < mate->I_SUPPORT)
            {
               foreach (WsfTrack trk in mate.MasterRawTrackList())
               {
                  // check if mate has a raw track of the target
                  if (trk.IsValid() && !trk.IsNull() && trk.Target().IsValid() && trk.Target() == trk.Target())
                  {
                     guider = mate;
                     if (iout_print)
                     {
                        iout.Write(write_str("    guider = ",guider.Name(),"\n"));
#                        iout.Close();
                     }
                     return guider;
                  }
               }
            }
            else
            {
               if (iout_print)
               {
                  iout.Write(write_str("    ",mate.Name()," CANNOT GUIDE...REASON: BEANS - Cannot guide anymore missiles","\n"));
#                  iout.Close();
               }
            }
         }
         else
         {
            if (iout_print)
            {
               iout.Write(write_str("    ",mate.Name()," CANNOT GUIDE...REASON: OUTSIDE FOV","\n"));
#               iout.Close();
            }
         }
      }
      else
      {
         if (iout_print)
         {
            iout.Write(write_str("    ",mate.Name()," CANNOT GUIDE...REASON: DOWN RANGE <10 NMI ",
            mate.SlantRangeTo(trk.CurrentLocation())*MATH.NM_PER_M()," ",
            shooter.SlantRangeTo(trk.CurrentLocation())*MATH.NM_PER_M(),"\n"));
         }
      }
   }

   if (iout_print)
   {
#      iout.Close();
   }
   return guider;
end_script
```

- **演示要点**：演示 script 的参数：the, extern, if, foreach, for, return

### script（aigci_processor.old）｜脚本

- **关键词**：script, else, double, foreach, string, bool, int, 脚本
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:509-675`
- **片段**：

```text
  script void aigci_update_flanks()

    //check if this gci is done creating & updating the flank jobs
    if( mFlankJobsCompleted >= mMaxTotalFlankJobsEverToCreate )
    {
      writeln_d( "~~~ aiGCI - Max Flank Jobs Completed, return now!" );
      return;
    }

    //check for clusters that went away & thus we can't flank them anymore
    //otherwise, update the flank job
    foreach( int flankJobId : int clusterJobId in mFlankToClusterMap )
    {
      WsfRIPRJob flankJob   = GetJobById( flankJobId );
      WsfRIPRJob clusterJob = GetJobById( clusterJobId );

      if( clusterJob.IsValid() )
      {
        if( flankJob.IsValid() )
        {
          if (flankJob.GetBestProgress() >= 1.0 )
          {
            writeln("GCI removing completed flank job!!!");
            mCompletedFlanks.PushBack( flankJob.Name() );
            mFlankNameToTimeCompleteMap.Set( flankJob.Name(), TIME_NOW );
            int flankId   = flankJob.GetId();
            int clusterId = mFlankToClusterMap.Get( flankId );
            mFlankToClusterMap.Erase( flankId );
            mClusterToFlankMap.Erase( clusterId );
            mFlankJobsCompleted = mFlankJobsCompleted + 1;
            mFlankToClusterMap.Remove( flankId );
            mClusterToFlankMap.Remove( clusterId );
            RemoveJob( flankJob );
          }
          else
          {
            writeln_d( "~~~ aiGCI - updating flank job ", flankJob.Name(), " with cluster ", clusterJob.Name(), "!!!" );
            writeln_d("best flank progress: ", flankJob.GetBestProgress());
            WsfGeoPoint point = (WsfGeoPoint)clusterJob.GetData().Get("ZonePoint");
            double bearing = (double)clusterJob.GetData().Get("ZoneBearing");
            bool bearingValid = (bool)clusterJob.GetData().Get("ZoneBearingValid");
            //writeln_d( "~~~ aiGCI - flank job BEARING: ", bearing );
            string flankZoneName = "flank" + clusterJob.Name();

            //writeln(PLATFORM.Name(), " UpdateFlankZone( ", TIME_NOW, ", ", flankZoneName, ", ", point.ToString(), ", ", bearing, ", ", cFLANK_DISTANCE);

            //now the wsfzone can be treated as a relative zone, and doesn't need updating
            //UpdateFlankZone( TIME_NOW, flankZoneName, point, bearing, cFLANK_DISTANCE );
            //update the flank job with relevant cluster information
            flankJob.Priority( (mFlankJobPriorityScale * clusterJob.GetPriority()) );
            flankJob.SetData( "FlankZoneName", flankZoneName );
            flankJob.SetData( "ZonePoint", WsfGeoPoint(point) );
            flankJob.SetData( "ZoneBearing", bearing );
            flankJob.SetData( "ZoneBearingValid", bearingValid );
            flankJob.SetData( "ZoneNumThreats", (int)clusterJob.GetData().Get("ZoneNumThreats") );
          }
        }
        else
        {
          writeln_d( "~~~ aiGCI - cluster valid, but flank not valid!" );
        }
      }
      else
      {
        //remove flank job, cluster went away
        WsfRIPRJob tJob = GetJobById( flankJobId );

        writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", tJob.Name() );

        mFlankToClusterMap.Remove( flankJobId );
        mClusterToFlankMap.Remove( clusterJobId );
        RemoveJob( tJob );

        if( mFlankJobsCreated > 0 )
        {
          mFlankJobsCreated = mFlankJobsCreated - 1;
        }
      }
    }

    //check if only the updates were needed, or if we can create more flank jobs
    if( mFlankJobsCreated >= mMaxTotalFlankJobsEverToCreate )
    {
      writeln_d( "~~~ aiGCI - max flank jobs created, no need for more!" );
      return;
    }

    //create a new flank job if a cluster exists that never had one

    double DistClosestCluster = MATH.DOUBLE_MAX();
    WsfRIPRJob JobWithClusterToFlank;
    Array<WsfRIPRJob> jobs = GetJobs();
    foreach (WsfRIPRJob aJob in jobs)
    {
      //if job is a cluster job (not a flank job) & is not being flanked already
      //then consider it as a candidate for flanking, else continue
      if( mFlankToClusterMap.Exists( aJob.GetId() ) || mClusterToFlankMap.Exists( aJob.GetId() ) )
      {
        //writeln_d( "~~~ aiGCI - job ", aJob.Name(), " is either a flank job or a zone thats already being flanked!" );
        continue;
      }

      //if enough time hasn't elapsed since the last flank performed on this cluster, then continue
      string newFlankName = "flank" + aJob.Name();
      if( mFlankNameToTimeCompleteMap.Exists( newFlankName ) )
      {
        double lastFlankTime = mFlankNameToTimeCompleteMap.Get( newFlankName );
        if( TIME_NOW < (lastFlankTime + mFlankRepeatDelay) )
        {
          continue;
        }
      }

      WsfGeoPoint cPoint = (WsfGeoPoint)aJob.GetData().Get("ZonePoint");
      double dist = PLATFORM.GroundRangeTo(cPoint);
      if( dist < DistClosestCluster )
      {
        JobWithClusterToFlank = aJob;
      }
    }

    //if no flank job exists yet, and there is a cluster to flank, create job
    if( JobWithClusterToFlank.IsValid() )
    {
      WsfGeoPoint clusterPoint = (WsfGeoPoint)JobWithClusterToFlank.GetData().Get("ZonePoint");
      double clusterBearing = (double)JobWithClusterToFlank.GetData().Get("ZoneBearing");
      bool clusterBearingValid = (bool)JobWithClusterToFlank.GetData().Get("ZoneBearingValid");
      int clusterOccupants = (int)JobWithClusterToFlank.GetData().Get("ZoneNumThreats");
      string clusterZoneName = (string)JobWithClusterToFlank.GetData().Get("ZoneName");

      string flankZoneName = "flank" + JobWithClusterToFlank.Name();


      WsfRIPRJob NewFlankJob = WsfRIPRJob.Create( PROCESSOR,
                                                  "flank",
                                                  flankZoneName,
                                                  (mFlankJobPriorityScale * JobWithClusterToFlank.GetPriority()),
                                                  mMaxJobWinnersForFlank );
      NewFlankJob.SetData( "ZoneName", clusterZoneName );
      NewFlankJob.SetData( "FlankZoneName", flankZoneName );
      NewFlankJob.SetData( "ZonePoint", WsfGeoPoint(clusterPoint) );
      NewFlankJob.SetData( "ZoneBearing", clusterBearing );
      NewFlankJob.SetData( "ZoneBearingValid", clusterBearingValid );
      NewFlankJob.SetData( "ZoneNumThreats", clusterOccupants );
      double FlankDistanceMeters = cFLANK_DISTANCE * MATH.M_PER_NM();
      NewFlankJob.SetData( "FlankDistance", (1.8 * FlankDistanceMeters) );  //pursue a point 10% inside the flank zone, the flank width is 2*FlankDist
      NewFlankJob.SetData( "OnJobComplete", "aigci_flank_complete" );
      NewFlankJob.SetData( "for_air", 1 );

      WsfZone flankZone = WsfZone.CreatePolygonal(PLATFORM, mBowTieZonePoints); //creates a relative zone
      NewFlankJob.SetData( "FlankZone", flankZone );

      AddJob(NewFlankJob);

      writeln_d("+++ ", PLATFORM.Name(), " job change, ADD: ", NewFlankJob.Name() );

      mFlankJobsCreated = mFlankJobsCreated + 1;
      //save link between the flank & the cluster thats being flanked
      mFlankToClusterMap.Set( NewFlankJob.GetId(), JobWithClusterToFlank.GetId() );
      mClusterToFlankMap.Set( JobWithClusterToFlank.GetId(), NewFlankJob.GetId() );

      //now we can use a WsfZone and not have to update a platform zone
      //writeln(PLATFORM.Name(), " UpdateFlankZone( ", TIME_NOW, ", ", flankZoneName, ", ", clusterPoint.ToString(), ", ", clusterBearing, ", ", cFLANK_DISTANCE);
      //UpdateFlankZone( TIME_NOW, flankZoneName, clusterPoint, clusterBearing, cFLANK_DISTANCE );
    }

  end_script
```

- **演示要点**：演示 script 的参数：else, double, foreach, string, bool, int

### script（behavior_engage-target）｜脚本

- **关键词**：script, bool, string, extern, if, else, foreach, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage-target.txt:202-411`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_engage-target.txt:202`）
- **片段**：

```text
   script string GetWeaponForThreat(WsfPlatform platform, WsfTrack track)
      bool checkName = false;
      string name = "";
      extern bool IsWeaponDomainCapable(WsfTrack, Map<string, Object>);

      WsfPlatform plat = WsfSimulation.FindPlatform( track.TargetName() );
      if (plat.IsValid())
      {
         foreach( string aCategory : string wpnStr in ThreatTypeWeapon )
         {
            writeln_d("checking if ", plat.Name(), " is category: ", aCategory);
            if( wpnStr.Length()>0 && plat.CategoryMemberOf( aCategory ) )
            {
               checkName = true;
               name = wpnStr;
               writeln_d("   Time= ", TIME_NOW, "     ", PLATFORM.Name(), " searching only for weapon category: ", name, " (for use against ", plat.Name(), ")");
               break;
            }
         }
      }
      else
      {
         writeln_d("platform for target ", track.TargetName()," is not valid!");
      }

      extern Array<Map<string, Object>> mWeaponArray;
      foreach (Map<string, Object> curWeapon in mWeaponArray)
      {
         string weaponName = (string)curWeapon["name"];
         WsfWeapon weapon = (WsfWeapon)curWeapon["weapon"];

         writeln_d("        checking weapon ", weaponName, " valid=", weapon.IsValid());

         if (checkName && weaponName != name)
         {
            continue;
         }
         if (weapon.QuantityRemaining() <= 0)
         {
            continue;
         }
         if (!IsWeaponDomainCapable(track,curWeapon))
         {
            continue;
         }

         WsfLaunchComputer lcPtr = weapon.LaunchComputer();

         if (lcPtr.IsValid() &&
             lcPtr.IsA_TypeOf("WSF_AIR_TO_AIR_LAUNCH_COMPUTER"))
         {
            writeln_d("            using air-to-air launch computer");

            // The returned array contains:  Rmax, RmaxTOF, Rne, RneTOF, Rmin, RminTOF
            // in that order.  -1.0 means "not valid".

            Array<double> returnedValues = lcPtr.LookupResult(track);

            // Now have to consider whether we have enough information to continue with a weapon shot:
            double theRmax    = returnedValues[0]; //"Rmax";
            double theRmaxTOF = returnedValues[1]; //"RmaxTOF";
            double theRne     = returnedValues[2]; //"Rne";
            double theRneTOF  = returnedValues[3]; //"RneTOF";
            double theRmin    = returnedValues[4]; //"Rmin";
            double theRminTOF = returnedValues[5]; //"RminTOF";

            double range = 0.0;
            if (track.RangeValid())
            {
               range = track.Range();  #is this the range from you to the track, or the range from the sensor to the track?
            }
            else
            {
               range = track.GroundRangeTo(PLATFORM);
            }

            // Check for track range less than Rmin * scaleFactor, if not, return.
            // But do not check for min range constraint at all unless we are likely to be needing it.
            if (range < 5000)
            {
               if (theRmin == -1.0)
               {
                  writeln_d("    Engagement did not shoot since Rmin was not valid.");
                  continue;
                  #return;
               }
               double RminConstraint = theRmin * DefaultPercentRangeMin;
               if (range < RminConstraint)
               {
                  writeln_d("    Engagement did not shoot since inside the k * Rmin constraint distance.");
                  writeln_d("    Range versus Rmin constraint = ", range, ", ", RminConstraint);
                  continue;
                  #return;
               }
            }

            // Check for track range less than Rne, if so, FORCE a weapon fire.
            bool forceWeaponFire = false;
            if (range < theRne)
            {
               writeln_d("    Engagement is forcing a weapon fire due to inside Rne.");
               writeln_d("    Range versus Rne constraint = ", range, ", ", theRne);
               forceWeaponFire = true;
            }

            if (forceWeaponFire == false)
            {
               ######################################TRY THIS######################################
               WsfPlatform plat = WsfSimulation.FindPlatform( track.TargetName() );
               if (plat.IsValid() && plat.CategoryMemberOf("fighter"))
               {
                  #theRmax = theRne;
                  theRmax = (theRmax + theRne)/2.0;  //for highly maneuverable fighter targets
               }
               ####################################END TRY THIS####################################
               // Check for track range less than k * Rmax, if not, return.
               if (theRmax == -1.0)
               {
                  writeln_d("    Engagement did not shoot since Rmax was not valid.");
                  continue;
                  #return;
               }
               //double RmaxConstraint = theRmax * DefaultPercentRangeMax;
               double percentRMax = GetLaunchPercentRangeMaxOnThreat(weaponName, track);
               double RmaxConstraint = theRmax * percentRMax;
               if (range > RmaxConstraint)
               {
                  writeln_d("    Engagement did not shoot since outside the k * Rmax constraint distance.");
                  writeln_d("    Range versus Rne constraint = ", range, ", ", theRne);
                  continue;
                  #return;
               }
            }

            writeln_d("    Engagement meets constraints for firing a weapon (continue).");
         }
         else if (lcPtr.IsValid() &&
                  lcPtr.IsA_TypeOf("WSF_ATG_LAUNCH_COMPUTER"))
         {
            writeln_d("            using air-to-ground launch computer");
            if (lcPtr.CanIntercept(track))
            {
               //intercept works, this weapon is a candidate
            }
            else
            {
               continue;
            }
         }
         else
         {
            writeln_d("            using script input mWeaponArray array range values");

            //check our own ranges & angles --> hacky!!!

            extern double               EffectiveRange(WsfPlatform, WsfTrack);
            double effectiveRange     = EffectiveRange(platform,    track);
            double absRelativeBearing = MATH.Fabs(PLATFORM.RelativeBearingTo( track ));
            double rangeScale         = GetLaunchPercentRangeMaxOnThreat(weaponName, track);
            if (absRelativeBearing > mDegradedFiringAngle)
            {
               rangeScale = MATH.Min(mDegradedPercentRange, rangeScale);
            }

            if ((double)curWeapon["rangeMin"] > effectiveRange)
            {
               writeln_d("            target too close");
               continue;
            }
            if (absRelativeBearing > GetMaxFiringAngleForWeapon(weaponName, track))
            {
               writeln_d("            target firing angle too large");
               continue;
            }
            if ((double)curWeapon["rangeMax"] * rangeScale < effectiveRange)
            {
               writeln_d("            target too far away");
               continue;
            }
            double TOF = 180;
            double missileAvgSpeed = 1000;
            if (curWeapon.Exists("avgSpeed"))
            {
              missileAvgSpeed = (double)curWeapon["avgSpeed"];
            }
            if (curWeapon.Exists("TOF"))
            {
              TOF = (double)curWeapon["TOF"];
            }
            double range = PLATFORM.SlantRangeTo(track);
            //double closingSpeed = PLATFORM.ClosingSpeedOf(track);
            double relBearing = track.RelativeBearingTo(PLATFORM);
            if (relBearing > 90.0)
            {
              if (track.Speed() > missileAvgSpeed)
              {
                continue;
              }
              double speedDiff = missileAvgSpeed - track.Speed();
              if ((range/speedDiff) > TOF)
              {
                continue;
              }
            }
         }

         return (string)curWeapon["name"];
      }
        return "";
    end_script
```

- **演示要点**：演示 script 的参数：bool, string, extern, if, else, foreach

### script（common_platform_script）｜脚本

- **关键词**：script, double, int, if, for, else, return, 脚本
- **出处**：`base_types/processors/ripr_agents/common/common_platform_script.txt:772-981`
- **片段**：

```text
   script bool EvadeIncoming(WsfPlatform aPlatform, WsfRIPRProcessor aProc, Array<WsfPlatform> aIncoming, double originalAltitude, double diveAltitude, double weightPeers)
      double evadeHeading = 0;
      double evadeDivisor = 0;
      double distMod = 0;
      double bearingMod = 0;
      int incomingCount = aIncoming.Size();

      writeln_d(aPlatform.Name(), " evade. dive/climb between altitudes:  ", originalAltitude, " <-> ", diveAltitude);
      writeln_d("evading ", incomingCount, " threats");

      double bankAngle = 40;  //degrees
      if (!diveDownMap.Exists(aPlatform.Name()))
      {
         diveDownMap[aPlatform.Name()] = true;
      }
      if (!bankLeftMap.Exists(aPlatform.Name()))
      {
         bankLeftMap[aPlatform.Name()] = true;
      }

      #extern Map<string, Array<WsfPlatform>> mEveryonesIncomingThreatsMap;
      #if ( !mEveryonesIncomingThreatsMap.Empty() )
      #{
      #   if ( mEveryonesIncomingThreatsMap.Exists(aPlatform.Name()) )
      #   {
      #      incoming = mEveryonesIncomingThreatsMap.Get(aPlatform.Name());
      #      if ( !incoming.Empty() )
      #      {
      #         incomingCount = incoming.Size();
      #      }
      #   }
      #}

      if (incomingCount == 0)
      {
         writeln_d("    no incoming weapons");
         return false;
      }

      double y = 0;
      double x = 0;
      // calculate an average heading to incoming platforms weighted by distance
      for (int i = 0; i < incomingCount; i = i + 1)
      {
         WsfPlatform temp = (WsfPlatform)(aIncoming[i]);
         if (!temp.IsValid() || (temp.Index() == aPlatform.Index()))
         {
            continue;
         }
writeln_d("calculating danger from: ", temp.Name());
         double range = aPlatform.SlantRangeTo(temp);
         if (range > 0)
         {
            distMod = 1 / range;
         }
         else
         {
            distMod = 1000000;
         }
         bearingMod = MATH.NormalizeAngle0_360(aPlatform.TrueBearingTo(temp));
         x = x + MATH.Sin(bearingMod) * distMod;
         y = y + MATH.Cos(bearingMod) * distMod;

         writeln_d("    Incoming ", temp.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", temp.Latitude(), ", ", temp.Longitude(), ", ", temp.Altitude(), ") @ ", temp.Speed(), "m/s");
         evadeDivisor = evadeDivisor + distMod;
         evadeHeading = evadeHeading + bearingMod * distMod;
      }

      // get the GCI if there is one
      WsfRIPRProcessor aiflProc = aProc.GetRIPRCommanderProcessor();
      WsfRIPRProcessor gciProc = null;
      WsfPlatform      aiflPlat;// = null;
      WsfPlatform      gciPlat;// = null;


      if (aiflProc.IsValid())
      {
         gciProc = aiflProc.GetRIPRCommanderProcessor();
         aiflPlat = aiflProc.Platform();
      }
      else
      {
//writeln_d("!!! aiflProc not valid");
      }

      if (gciProc.IsValid())
      {
         gciPlat = gciProc.Platform();
      }
      else
      {
//writeln_d("!!! gciProc not valid");
      }

      // if there's a gci, avoid centroids of all his subs
      if (gciPlat.IsValid())
      {
         foreach (WsfPlatform aifl in gciPlat.Subordinates())
         {
            if (!aifl.IsValid() || aifl == aPlatform || aifl == aiflPlat)
            {
               continue;
            }
            WsfGeoPoint centroid = aifl.GetSubsCentroid();

            if (centroid.X() == 0 && centroid.Y() == 0 && centroid.Z() == 0)
            {
               continue;
            }

//writeln_d("!!! centroid: (", centroid.X(), ", ", centroid.Y(), ", ", centroid.Z(), "), dist: ", (aPlatform.SlantRangeTo(centroid)));
            distMod = 1 / (aPlatform.SlantRangeTo(centroid));
            bearingMod = MATH.NormalizeAngle0_360(aPlatform.TrueBearingTo(centroid));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeers;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeers;

            writeln_d("    AIFL ", aifl.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", centroid.Latitude(), ", ", centroid.Longitude(), ", ", centroid.Altitude(), ")");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }
      // otherwise, avoid members in your own squadron
      else if (aiflPlat.IsValid())
      {
         foreach (WsfPlatform sub in aiflPlat.Subordinates())
         {
            if (!sub.IsValid() || sub == aPlatform)
            {
               continue;
            }
            distMod = 1 / (aPlatform.SlantRangeTo(sub));
            bearingMod = MATH.NormalizeAngle0_360(aPlatform.TrueBearingTo(sub));
            x = x + MATH.Sin(bearingMod) * distMod * weightPeers;
            y = y + MATH.Cos(bearingMod) * distMod * weightPeers;

            writeln_d("    Peer ", sub.Name(), " at distance: ", 1 / distMod, ", bearing: ", bearingMod, ", x: ", MATH.Sin(bearingMod), ", y: ", MATH.Cos(bearingMod), ", (", sub.Latitude(), ", ", sub.Longitude(), ", ", sub.Altitude(), ") @ ", sub.Speed(), "m/s");

            // but we'll avoid peers with less strength than we avoid incoming missiles
            // so let's divide the distMod by 2
            evadeDivisor = evadeDivisor + distMod;
            evadeHeading = evadeHeading + bearingMod * distMod;
         }
      }

      if (evadeDivisor == 0)
      {
         return false;
      }

//         writeln_d("    evadeHeading: ", evadeHeading, ", evadeDivisor: ", evadeDivisor, ", eH/eD: ", evadeHeading / evadeDivisor, ", x: ", x, ", y: ", y);
//         evadeHeading = evadeHeading / evadeDivisor;
//         evadeHeading = MATH.NormalizeAngle0_360(evadeHeading - 180);

      // correct for quadrant
      double theta = MATH.NormalizeAngle0_360(MATH.ATan(x/y));
      if (y < 0)
      {
         theta = MATH.NormalizeAngle0_360(theta - 180);
      }

      writeln_d("    x: ", x, ", y: ", y, ", theta: ", theta);

      //turn to angle to evade
      if (bankLeftMap[aPlatform.Name()] == true)
      {
         evadeHeading = MATH.NormalizeAngle0_360(theta - 180 - bankAngle);
         double headDiff = MATH.NormalizeAngleMinus180_180( evadeHeading - MATH.NormalizeAngle0_360(aPlatform.Heading()) );
         if (MATH.Fabs(headDiff) < 2.0)
         {
            bankLeftMap[aPlatform.Name()] = false;
         }
      }
      else
      {
         evadeHeading = MATH.NormalizeAngle0_360(theta - 180 + bankAngle);
         double headDiff = MATH.NormalizeAngleMinus180_180(evadeHeading - MATH.NormalizeAngle0_360(aPlatform.Heading()));
         if (MATH.Fabs(headDiff) < 2.0)
         {
            bankLeftMap[aPlatform.Name()] = true;
         }
      }

      writeln_d("    Evading incoming at heading ", evadeHeading);
      aPlatform.TurnToHeading(evadeHeading);

      //do the dive or climb now
      if (diveDownMap[aPlatform.Name()] == true)
      {
        writeln_d(aPlatform.Name(), " diving to ", diveAltitude);
        aPlatform.GoToAltitude(diveAltitude, 200, true);
        if (aPlatform.Altitude() <= (originalAltitude - 0.95*(originalAltitude-diveAltitude)))
        {
          diveDownMap[aPlatform.Name()] = false;
        }
      }
      else
      {
        writeln_d(aPlatform.Name(), " climbing to ", originalAltitude);
        aPlatform.GoToAltitude(originalAltitude, 200, true);
        if (aPlatform.Altitude() >= (diveAltitude + 0.95*(originalAltitude-diveAltitude)))
        {
          diveDownMap[aPlatform.Name()] = true;
        }
      }

      return true;
   end_script
```

- **演示要点**：演示 script 的参数：double, int, if, for, else, return

### script（tactics_processor4）｜脚本

- **关键词**：script, extern, bool, string, if, return, 脚本
- **出处**：`launcher/platforms/tactics_processor4.txt:49-59`　（同签名共 12 处，另见 `launcher/platforms/tactics_processor4.txt:62`、`new_guidance/weapons/ssm/ssm_launch_computer.txt:20`、`ship_ad/weapons/agm/asm_launch_computer.txt:18`）
- **片段**：

```text
script bool SAM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, double  aLaunchDelay)
   extern bool SAM_MISSILE_LaunchComputer(WsfTrack, WsfPlatform, double);
   bool canIntercept = false;
   string subType = aAssignee.Type();
   if (subType == "SAM_LAUNCHER") # PUT THE CARRYING LAUNCHER TYPE HERE
   {
      canIntercept = SAM_MISSILE_LaunchComputer(aTrack, aAssignee, aLaunchDelay);
   }

   return canIntercept;
end_script
```

- **演示要点**：演示 script 的参数：extern, bool, string, if, return

### script（sam_regiment）｜脚本

- **关键词**：script, bool, int, for, if, return, 脚本
- **出处**：`suppressor/platforms/sam_regiment.txt:63-75`　（同签名共 2 处，另见 `ship_ad/platforms/naval_sam_tactics.txt:67`）
- **片段**：

```text
    script bool SubOperational(WsfPlatform aSub)
      bool operational = false;
      int numWeapons = aSub.WeaponCount();
      for (int i=0; i < numWeapons; i=i+1)
      {
        if (aSub.WeaponEntry(i).IsOperational())
        {
          operational=true;
          break;
        }
      }
      return operational;
    end_script
```

- **演示要点**：演示 script 的参数：bool, int, for, if, return

### script（common_platform_script）｜脚本

- **关键词**：script, if, int, plat, string, return, 脚本
- **出处**：`base_types/processors/quantum_agents/common/common_platform_script.txt:226-245`　（同签名共 8 处，另见 `base_types/processors/ripr_agents/common/common_platform_script.txt:226`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:221`、`brawler/processors/quantum_agents/common_platform_script.txt:226`）
- **片段**：

```text
   script string DetermineTrackCategory(WsfTrack aTrack)
      if (!aTrack.IsValid())
      {
         writeln_d("DetermineTrackCategory() invalid track!");
         return "unknown";
      }

      int ind = aTrack.TargetIndex();
      WsfPlatform plat;
      plat = WsfSimulation.FindPlatform( ind );

      if (!plat.IsValid())
      {
         writeln_d("DetermineTrackCategory() invalid platform from track!");
         return "unknown";
      }

      string cat = DeterminePlatformCategory( plat );
      return cat;
   end_script
```

- **演示要点**：演示 script 的参数：if, int, plat, string, return

### script（post_process_test）｜脚本

- **关键词**：script, string, if, for, while, return, 脚本
- **出处**：`engage/post_process_test.txt:46-65`　（同签名共 2 处，另见 `engage/post_process_test.txt:22`）
- **片段**：

```text
script string ConvertAnalysisMapToAscii(string amapFile, double aMinValue, double aMaxValue)
   FileIO io = FileIO();
   string txt;
   if (! io.Open(amapFile, "in")) return "";
   for (int i = 0; i < 18; i+=1) io.Readln();
   while (1)
   {
      string line = io.Readln().Strip();
      if (line.Length() == 0) break;
      foreach (string tok in line.Split())
      {
         #     .:;|#
         double v = (double)tok;
         v = (v - aMinValue) / (aMaxValue - aMinValue);
         txt += ValueToAscii(v);
      }
      txt += "\n";
   }
   return txt;
end_script
```

- **演示要点**：演示 script 的参数：string, if, for, while, return

### script（common_platform_script）｜脚本

- **关键词**：script, if, return, double, int, else, 脚本
- **出处**：`base_types/processors/quantum_agents/common/common_platform_script.txt:640-660`　（同签名共 12 处，另见 `base_types/processors/ripr_agents/common/common_platform_script.txt:640`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:635`、`brawler/processors/quantum_agents/common_platform_script.txt:640`）
- **片段**：

```text
   script int GetBucket (double x, double aBucketBase)
    if (x == 0)
    {
       return 0;
    }

    double abs_x = MATH.Fabs(x);

    // convert the log base-10 to a log with the base
    int temp = MATH.Log10(abs_x) / MATH.Log10(aBucketBase);

    // return a negative bucket if our source number is negative
    if (x > 0)
    {
       return temp;
    }
    else
    {
       return -temp;
    }
   end_script
```

- **演示要点**：演示 script 的参数：if, return, double, int, else

### script（telar_task_mgr）｜脚本

- **关键词**：script, bool, platform, weapon, if, return, 脚本
- **出处**：`cyber/processors/telar_task_mgr.txt:83-104`　（同签名共 2 处，另见 `orwaca_iads/processors/telar_task_mgr.txt:83`）
- **片段**：

```text
   script bool LaunchWeapon()
      bool launched = false;
      WsfWeapon   weapon;
      WsfPlatform platform;
      platform = PLATFORM;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn() && (weapon.QuantityRemaining() >= SALVO_SIZE) &&
             (TasksAssignedTo(PLATFORM, "", weapon.Name()) < 1))
      {
         bool canInterceptNow = InInterceptEnvelopeOf(ENVELOPE);
         if (canInterceptNow && weapon.IsValid())
         {
            launched = Fire(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
            if (launched)
            {
               writeln_d("*** T=", TIME_NOW, " ", platform.Name(), " ",
                      TRACK.TargetName(), " R=", platform.SlantRangeTo(TRACK), " FIRE!!!!");
            }
          }
      }
      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：bool, platform, weapon, if, return

### script（common_platform_script）｜脚本

- **关键词**：script, if, int, plat, bool, return, 脚本
- **出处**：`base_types/processors/quantum_agents/common/common_platform_script.txt:282-304`　（同签名共 8 处，另见 `base_types/processors/ripr_agents/common/common_platform_script.txt:282`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:277`、`brawler/processors/quantum_agents/common_platform_script.txt:282`）
- **片段**：

```text
   script bool TestTrackCategory(WsfTrack aTrack, string aCategory)
      if (!aTrack.IsValid())
      {
         writeln_d("--- TestTrackCategory(), aTrack is not valid!");
         // "unknown" returns true when aTrack is invalid
         return (aCategory == "unknown");
      }

      int ind = aTrack.TargetIndex();
      //writeln_d("--- TestTrackCategory(), target index: ", ind);
      WsfPlatform plat;
      plat = WsfSimulation.FindPlatform(ind);

      if (!plat.IsValid())
      {
         writeln_d("--- TestTrackCategory(), plat is not valid!");
         // "unknown" returns true when aTrack is invalid
         return (aCategory == "unknown");
      }

      bool match = TestPlatformCategory(plat, aCategory);
      return match;
   end_script
```

- **演示要点**：演示 script 的参数：if, int, plat, bool, return

### script（aijam_processor）｜脚本

- **关键词**：script, int, if, else, for, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:191-214`
- **片段**：

```text
  script int BandPriority(string aJammerType, WsfTrack aTrack)
    int priority = 0;
    Array<string> jammerTypes = Array<string>();

    if (mTargetBandList.Exists(aTrack.TargetName()))
    {
      jammerTypes = mTargetBandList[aTrack.TargetName()];
    }
    else if (mTargetBandList.Exists(aTrack.TargetType()))
    {
      jammerTypes = mTargetBandList[aTrack.TargetType()];
    }

    int N = jammerTypes.Size();
    int i = 0;
    for (i=0; i<N; i = i + 1)
    {
      if (jammerTypes[i] == aJammerType)
      {
        break;
      }
    }
    return (N-i);
  end_script
```

- **演示要点**：演示 script 的参数：int, if, else, for, return

### script（iads_cmdr）｜脚本

- **关键词**：script, bool, int, if, else, return, 脚本
- **出处**：`orwaca_iads/platforms/iads_cmdr.txt:65-90`　（同签名共 8 处，另见 `aea_iads/platforms/iads_cmdr.txt:45`、`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:45`、`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:45`）
- **片段**：

```text
   script bool AvailableRoundsOnSub(WsfPlatform aAssignee)
      bool weaponsAvailable = false;
      int quantity = 0;
      WsfWeapon weapon = aAssignee.Weapon(WEAPON_NAME);
      if (weapon.IsTurnedOn())
      {
         quantity = quantity + weapon.QuantityRemaining();
      }
      if (quantity > 0)
      {
         weaponsAvailable = true;
      }
      else
      {
         foreach (WsfPlatform sub in aAssignee.Subordinates())
         {
            weapon = sub.Weapon(WEAPON_NAME);
            if (weapon.IsTurnedOn())
            {
               quantity = quantity + weapon.QuantityRemaining();
            }
         }
         if (quantity > 0) weaponsAvailable = true;
      }
      return weaponsAvailable;
   end_script
```

- **演示要点**：演示 script 的参数：bool, int, if, else, return

### script（soldier_jtac）｜脚本

- **关键词**：script, bool, foreach, int, for, return, 脚本
- **出处**：`laser_designator/platforms/soldier_jtac.txt:156-182`
- **片段**：

```text
   script bool MakeAssignments()
      bool MadeAssignment = false;
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if ((sub.Type() == AIRCRAFT_TYPE) && (TRACK.TargetType() == TARGET_TYPE))
         {
            if (WeaponsAvailable(sub) &&
                (TasksAssignedTo(sub) < MAX_ASSIGNMENTS_PER_SUB) &&
                (TasksAssignedTo(sub, TRACK.TrackId()) < 1)) 
            {
               writeln_d("*** Adding ", sub.Name(), " to filter");
               filter.PushBack(sub);
            }
         }
      }

      int i;
      int numAssignments = (int)MATH.Min(filter.Size(), MAX_SUBS_PER_TARGET);
      for (int i=0; i < numAssignments; i = i + 1)
      {
         AssignTask(TRACK, "ENGAGE", filter[i]);
         MADE_ASSIGNMENT      = true;
         MadeAssignment = true;
      }
      return MadeAssignment;
   end_script
```

- **演示要点**：演示 script 的参数：bool, foreach, int, for, return

### script（comm_link）｜脚本

- **关键词**：script, extern, bool, if, else, return, 脚本
- **出处**：`space_operations/scripts/comm_link.txt:61-87`
- **片段**：

```text
   script bool Establish()
      extern bool CommLink_MutuallyLinking(WsfComm aLocalComm, WsfComm aRemoteComm);
      bool established = true;
      if (WsfSimulation.FindPlatform(remote_platform_name).IsValid() && CommLink_MutuallyLinking(local_comm, remote_comm))
      {
          WsfAddress lca = local_comm.GetAddress();
          WsfAddress rca = WsfSimulation.FindPlatform(remote_platform_name).Comm(remote_comm_name).GetAddress();
          bool connectedLocal = local_comm.AddConnection(lca, rca);
          if (connectedLocal)
          {
             is_linked = true;
             
             extern bool CommLink_Linked(WsfComm aComm);
             if (!CommLink_Linked(remote_comm))
             {
                extern bool CommLink_Establish(WsfComm aComm);
                bool established = CommLink_Establish(remote_comm);              
             }
          }
      }
      else
      {
         established = false;
      }
      
      return established;
   end_script
```

- **演示要点**：演示 script 的参数：extern, bool, if, else, return

### script（rules_utils）｜脚本

- **关键词**：script, returns, adding, created, double, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:1105-1132`
- **片段**：

```text
script WsfGeoPoint future_location(WsfPlatform plat, double time)
/*
PURPOSE   Determine future location of a platform  
AUTHOR   Snyder

Parameter Description
   IN  plat - WsfPlatform, platform to be projected
   IN  time - delta time from now to project to
Technical Description:
   returns a WsfGeoPoint of the projected location of a platform 

   Projects from truth platform speed

   Project the future WCS location by taking current WCS location and 
   adding VelocityWCS * time 

   created this because WsfPlatform.FutureLocation() is not supported by the Brawler mover

*/

   double lat = plat.LocationWCS()[0] + plat.VelocityWCS()[0]*time;
   double lon = plat.LocationWCS()[1] + plat.VelocityWCS()[1]*time;
   double alt = plat.LocationWCS()[2] + plat.VelocityWCS()[2]*time;
   Vec3 fut_loc = Vec3.Construct(lat,lon,alt);
   WsfGeoPoint location = WsfGeoPoint.ConstructWCS(fut_loc);

   return location;
end_script
```

- **演示要点**：演示 script 的参数：returns, adding, created, double, return

### script（rules_utils）｜脚本

- **关键词**：script, if, and, bool, else, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:470-498`
- **片段**：

```text
script bool chk_dead_buddy(WsfPlatform me)
/*
PURPOSE   determine if anyone in my flight is dead
AUTHOR   Snyder

Parameter Description
   IN  me              WsfPlatform  - Platform being analyzed
   OUT chk_dead_buddy  BOOL   - true if any flight mates are dead

Technical Description:
   
   if I'm red, loop through everyone in my first group I'm apart of and check 
   if that entity is valid. The group is part of my own convention i'm creating
   and it requires each A/C's first group they are apart of to be their flight

*/
   bool chk_dead_buddy = false;
   WsfCommandChain cc = me.CommandChain("ELEMENT");
   bool lead = me == cc.Commander();
   if (lead)
   {
      chk_dead_buddy = cc.SubordinateCount()==0;
   }
   else
   {
      chk_dead_buddy = (cc.PeerCount() + cc.Commander().IsValid())==0;
   }
   return chk_dead_buddy;   
end_script
```

- **演示要点**：演示 script 的参数：if, and, bool, else, return

### script（rules_utils）｜脚本

- **关键词**：script, loop, bool, int, if, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:1211-1241`
- **片段**：

```text
script bool platform_weapon_left(WsfPlatform plat, Array<int> winchester)
/*
PURPOSE   Determine if my platform has met winchester conditions  
AUTHOR   Snyder

Parameter Description
   IN  plat - WsfPlatform, platform to be analysed
   OUT flight_weapon_left - true if I am bingo missile
Technical Description:
   loop through my weapons remaining

*/
   bool bingo_misl = false;
   int tot_missiles = 0;

//  loop through all weapon instances on this platform
   for( int i = 0; i < plat.WeaponCount(); i = i + 1)
   {  // compare against PRDATA - Array<int> WINCHESTER{fox3,fox2,fox1,agm,total_missiles};
      if(plat.WeaponEntry(i).QuantityRemaining() <= winchester[i]) 
      { 
         bingo_misl = true;
      }
      tot_missiles = tot_missiles + plat.WeaponEntry(i).QuantityRemaining();
   }
   if (tot_missiles <= winchester[4]) 
   { 
      bingo_misl = true; 
   }
   
   return bingo_misl;
end_script
```

- **演示要点**：演示 script 的参数：loop, bool, int, if, return

### script（brawler_script_util）｜脚本

- **关键词**：script, bx, by, if, bz, return, 脚本
- **出处**：`air_to_air/rules/brawler_script_util.txt:24-54`　（同签名共 3 处，另见 `base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:22`、`brawler/platforms/alternatives/BrawlerScriptUtil.txt:22`）
- **片段**：

```text
script Array<double> makecs(Vec3 bxin, Vec3 bzin)
   Array<double> b = Array<double>();
   Vec3 bx;
   Vec3 by;
   Vec3 bz;
   // Normalize bxin, store in bx
   bx = bxin.Normal();
   // Cross product of bzin and Normalized bxin, stored in by
   by = Vec3.Cross(bzin, bx);
   // Normalize by and evaluate the magnitude of original by
   if (by.Normalize() == 0.0)
   {
      // If the magnitude of by is zero, replace by with cross of bx and unit Z vector
      Vec3 unitZ = Vec3.Construct(0.0, 0.0, 1.0);
      by = Vec3.Cross(unitZ, bx);
      by.Normalize();
   }
   //cross product of bx and by stored in bz
   bz = Vec3.Cross(bx, by);

   b[0] = bx.Get(0);  // b(1,1) = bx(1)
   b[3] = bx.Get(1);  // b(1,2) = bx(2)
   b[6] = bx.Get(2);  // b(1,3) = bx(3)
   b[1] = by.Get(0);  // b(2,1) = by(1)
   b[4] = by.Get(1);  // b(2,2) = by(2)
   b[7] = by.Get(2);  // b(2,3) = by(3)
   b[2] = bz.Get(0);  // b(3,1) = bz(1)
   b[5] = bz.Get(1);  // b(3,2) = bz(2)
   b[8] = bz.Get(2);  // b(3,3) = bz(3)
   return b;
end_script
```

- **演示要点**：演示 script 的参数：bx, by, if, bz, return

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, double, if, bool, ok, return, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:315-345`　（同签名共 2 处，另见 `base_types/processors/timeline_agents/air_combat_maneuvers.txt:222`）
- **片段**：

```text
   script double Crank(WsfPlatform aPlatform, WsfTrack aTrack, double crankAngle, double aSpeed)

      # Variables used in the script to generate the maneuver.
      # Change these to modify the behavior.
      # TODO make method arguments?
      # Angle in degrees to offset track. Should be close to,
      # but not at, max radar azimuth
     #double crankAngle = 35;
      # Min/max angle in degrees that aircraft needs to be
      # between relative to track to be considered cranking
      double crankTolerance = 1.5;

      if (!aPlatform.IsValid() || !aTrack.IsValid())
      {
         return false;
      }

      double relativeHeading = TurnHeading(aPlatform, aTrack, crankAngle, crankTolerance);

      # Heading when we have finished maneuver
      double finalHeading = Math.NormalizeAngleMinus180_180(aPlatform.Heading() + relativeHeading);

      # Turn to new heading, maintaining speed and altitude
      bool ok = aPlatform.TurnToRelativeHeading(relativeHeading);
      ok = ok && aPlatform.GoToSpeed(aSpeed);
      if (!ok)
      {
         finalHeading = -1.0;
      }
      return finalHeading;
   end_script
```

- **演示要点**：演示 script 的参数：double, if, bool, ok, return

### script（behavior_create_clustering_jobs）｜脚本

- **关键词**：script, int, string, double, if, for, 脚本
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_create_clustering_jobs.txt:100-132`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aigci/behavior_create_clustering_jobs.txt:104`）
- **片段**：

```text
   script void add_cluster_job(WsfCluster cluster)
      #new cluster, job not created yet, so create one
      int occupants = cluster.Count();
      int clusterId = cluster.Id();
      string jobName = "cluster_" + (string)clusterId;
      double ClusterPriority = mClusterJobPriority;
      if (ClusterPriority <= 0)
      {
         ClusterPriority = (double)occupants;
      }
      WsfRIPRJob temp = WsfRIPRJob.Create(   PROCESSOR,
                                             "zone",
                                             jobName,
                                             ClusterPriority,
                                             mMaxJobWinners );
      temp.SetData( "clusterId", clusterId );
      temp.SetData( "ZoneName", jobName );
      temp.SetData( "ZonePoint", WsfGeoPoint(cluster.MeanLocation()) );
      temp.SetData( "ZoneBearing", cluster.Bearing() );
      temp.SetData( "ZoneBearingValid", cluster.BearingValid() );
      temp.SetData( "ZoneNumThreats", occupants );
      temp.SetData( "for_air", 1 );

      Array<string> arr = Array<string>();
      for (int i = 0; i < occupants; i = i + 1 )
      {
         arr.PushBack(cluster.Entry(i).TargetName());
         writeln_d("job cluster member: ", cluster.Entry(i).TargetName());
      }
      temp.SetData( "ZoneThreatNameArray", arr );
      PROCESSOR.AddJob(temp);
      writeln_d("+++ ", PLATFORM.Name(), " job change, ADD: ", temp.Name(), ", id: ", clusterId);
   end_script
```

- **演示要点**：演示 script 的参数：int, string, double, if, for

### script（rules_utils）｜脚本

- **关键词**：script, at, bool, double, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:356-390`
- **片段**：

```text
script bool pointing_me(WsfPlatform me, double crit_rng, double crit_ang, Array<WsfSA_EntityPerception> aBanditList)
/*
PURPOSE   evaluate if a threat is pointing at me within a threatening range
AUTHOR   Snyder

Parameter Description
   IN  me          WsfPlatform  - Platform being analyzed
   IN  crit_rng    DOUBLE - threatening range 
   IN  crit_ang    DOUBLE - threatening angle
   OUT pointing_me BOOL - True if a threat is pointing at me and within a threatening range

Technical Description:
   Loop over all of my local tracks, determine if the track is threatening and pointing
   at me
*/
   bool pointing = false;
   double obang; // set off bore-site angle of me WRT my track

//  loop through all my local tracks
   foreach ( WsfSA_EntityPerception saent in aBanditList )
   {
      if (saent.Track().IsValid() && saent.Track().Target().IsValid() && saent.Track().AirDomain() && !saent.Track().Target().CategoryMemberOf("missile"))
      {
//       calculate threat's off-boresite angle of myself based on my track of threat
         obang = saent.Track().RelativeBearingTo(me);
         // if within threat range, within threat OBA, and track entity is not of my side
         if (me.SlantRangeTo(saent.Track()) < crit_rng && MATH.Fabs(obang) < crit_ang
            && me.Side() != saent.Track().Side())
         {
            pointing = true;  
         }
      }
   } 
   return pointing;
end_script
```

- **演示要点**：演示 script 的参数：at, bool, double, foreach, return

### script（soj）｜脚本

- **关键词**：script, bool, string, int, for, return, 脚本
- **出处**：`iads/platforms/soj.txt:52-87`　（同签名共 3 处，另见 `electronic_warfare/test_false_targets/platforms/soj.txt:97`、`electronic_warfare/test_multi_beam/platforms/soj.txt:91`）
- **片段**：

```text
   script bool AddSpot()
      bool startedJamming = false;
      WsfWeapon   jammer;
      string requiredType = "";
      string jammerType = "";
      int signalCount = TRACK.SignalCount();
      for (int signalIndex = 0; signalIndex  < signalCount; signalIndex = signalIndex  + 1)
      {
         double freq = TRACK.SignalFrequency(signalIndex);
         requiredType = JammerType(freq);
         for (int i=0; i < PLATFORM.WeaponCount(); i = i + 1)
         {
            jammer = PLATFORM.WeaponEntry(i);
            jammerType = jammer.Type();
            if (jammerType == requiredType)
            {
               if(PLATFORM.WithinFieldOfView(TRACK, jammer.Name()))
               {
                  # check to see if any maximum spots have been allocated
                  if ((jammer.QuantityRemaining() > 0) || (jammer.MaximumRequestCount() == 1))
                  {
                     string jamStr = write_str("Jam", signalIndex);
                     if (StartJamming(TRACK, jamStr , jammer, freq, 5.e6))
                     {
                        writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":", jammer.Name(), " started jamming ",
                                  TRACK.TargetName(), ", task=", jamStr, " freq=", freq, " BW=5.e6");
                        startedJamming = true;
                        break;
                     }
                  }
               }
            }
         }
      }
      return startedJamming;
   end_script
```

- **演示要点**：演示 script 的参数：bool, string, int, for, return

### script（behavior_timeline_engage）｜脚本

- **关键词**：script, extern, bool, for, if, return, 脚本
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_engage.txt:183-219`
- **片段**：

```text
   script bool TryToFireOn(WsfLocalTrack target)
      extern double  DefaultPercentRangeMax;
      extern double DefaultPercentRangeMin;
      WsfWeapon weapon;
      bool weaponUsable = false;
      #first weapon found will be used
      for (int i=0; i < PLATFORM.WeaponCount(); i+=1)
      {
         weapon = PLATFORM.WeaponEntry(i);
         writeln_d("checking if weapon ", weapon.Name(), " is usable.");
         if (WeaponCapableAvailableAgainstThreat(weapon, target) &&
            #InRangeToFire(PLATFORM, weapon, target, GetLaunchPercentRangeMaxOnThreat(weapon.Name(), target), DefaultPercentRangeMin))
             InRangeToFire(PLATFORM, weapon, target, DefaultPercentRangeMax, DefaultPercentRangeMin))
         {
            weaponUsable = true;
            break;
         }
      }
      if (weaponUsable == false)
      {
         writeln_d("no usable weapon found!");
         return false;
      }

      bool launched = false;
      if (weapon.IsTurnedOn())
      {
         writeln_d("    Attempting launch at ", target.TargetName());
         launched = weapon.Fire(target);
      }
      writeln_d("    launched == ", launched, ", weapon: ", weapon.Name());
      if(launched == false)
      {
         writeln_d("   ", PLATFORM.Name(), " could NOT fire at track: ", target.TargetName(), " at time: ", TIME_NOW);
      }
      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：extern, bool, for, if, return

### script（soj）｜脚本

- **关键词**：script, bool, string, double, for, return, 脚本
- **出处**：`aea_iads/platforms/soj.txt:195-234`　（同签名共 2 处，另见 `alv_routing/processors/alv_task_mgr.txt:154`）
- **片段**：

```text
   script bool AddSpot(int aSignalIndex)
      bool addedSpot = false;
      WsfWeapon jammer;
      Map<string, bool> requiredTypes = Map<string, bool>();
      string jammerType = "";
      double freq = TRACK.SignalFrequency(aSignalIndex);
      requiredTypes = JammerTypes(freq);
      for (int i=0; i < PLATFORM.WeaponCount(); i = i + 1)
      {
         jammer = PLATFORM.WeaponEntry(i);
         jammerType = jammer.Type();
         if (requiredTypes.Exists(jammerType))
         {
            if(PLATFORM.WithinFieldOfView(TRACK, jammer.Name()))
            {
               # check to see if any maximum spots have been allocated
               if ((jammer.QuantityRemaining() > 0) || (jammer.MaximumRequestCount() == 1))
               {
                  string jamStr = write_str(mJamTaskStr, aSignalIndex);
                  double pulsewidth = TRACK.SignalPW(aSignalIndex);
                  if (StartJamming(TRACK,
                                   jamStr,
                                   jammer,
                                   freq,
                                   Bandwidth(aSignalIndex, pulsewidth),
                                   TechniqueType(aSignalIndex)))
                  {
                     writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":", jammer.Name(), " started jamming ",
                               TRACK.TargetName(), ":", TRACK.SignalEmitterType(aSignalIndex),
                               ", task=", jamStr, " freq=", freq, " BW=", Bandwidth(aSignalIndex,pulsewidth),
                               " Technique=", TechniqueType(aSignalIndex));
                     addedSpot = true;
                     break;  # only allow one weapon per assignment for now, script needs work to do more than one
                  }
               }
            }
         }
      }
      return addedSpot;
   end_script
```

- **演示要点**：演示 script 的参数：bool, string, double, for, return

### script（sr_sam_launch_computer）｜脚本

- **关键词**：script, bool, double, if, else, return, 脚本
- **出处**：`cyber/weapons/sam/sr_sam_launch_computer.txt:17-60`　（同签名共 7 处，另见 `orwaca_iads/weapons/sam/mr_sam_launch_computer.txt:17`、`orwaca_iads/weapons/sam/sr_sam_launch_computer.txt:16`、`base_types/processors/timeline_agents/air_combat_maneuvers.txt:439`）
- **片段**：

```text
script bool SR_SAM_LaunchComputer(WsfTrack aTrack,
                                     WsfPlatform aLauncher,
                                     string aEnvelopeName,
                                     double aLaunchDelay)

   bool canIntercept = false;

   # TODO assuming launcher at 0 alt.  need AGL of target
   double tgtAlt = aLauncher.RelativeAltitudeOf(aTrack);
   double RngToTgt = aLauncher.GroundRangeTo(aTrack);

   double maxTOF = 70.0; # This limits the range to about 12 nm
   double avgSpd = 0.0;
   double maxRng = 0.0;
   double shootDelay = 0.0;
   # Max range check to 60 nautical miles.
   if (RngToTgt > 27780) { return canIntercept; } # If way too far...


   # Determine maxRng by target altitude
   # No maxRng diff
   maxRng = 18520;


   # Determine avgSpd (m/s) by range to target

   if ( RngToTgt      < 4630  ) { avgSpd = 308;}
   else if ( RngToTgt < 9260 ) { avgSpd = 385;}
   else if ( RngToTgt < 13890  ) { avgSpd = 356;}
   else if ( RngToTgt < 18520  ) { avgSpd = 308;}
   else if ( RngToTgt >= 18520  ) { avgSpd = 308;}

   WsfWaypoint intercept = WsfWaypoint();
   double tti = aLauncher.InterceptLocation3D(aTrack, intercept, avgSpd, aLaunchDelay + shootDelay);
   if ((tti > 0.0) && (tti < maxTOF))
   {
      double lat = intercept.Latitude();
      double lon = intercept.Longitude();
      WsfGeoPoint point;
      point = point.Construct(lat, lon, tgtAlt);
      canIntercept = point.WithinZoneOf(aLauncher, aEnvelopeName);
   }
   return canIntercept;
end_script
```

- **演示要点**：演示 script 的参数：bool, double, if, else, return

### script（rules_utils）｜脚本

- **关键词**：script, is, then, bool, if, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:257-303`
- **片段**：

```text
script bool sam_spike_me(WsfPlatform me)
/*
PURPOSE   evaluate if I am spiked by a SAM
AUTHOR   Snyder

Parameter Description
   IN  me         WsfPlatform - Platform being analyzed
   OUT spiked     BOOL - True if an ground entity is spiking me 

Technical Description:
   Loop over all of my ESM tracks, if there is a radar tracking me and that entity's speed
   is 0, I can assume that is a ground entity, if that ground entity's frequency is > 2GHz,
   then I probably care that it has a track of me 
   
*/
   bool spiked = false;
//  loop through all my raw tracks
   if (me.MasterRawTrackList().IsValid())
   {   
      foreach (WsfTrack trk in me.MasterRawTrackList())
      { 
//       only care if tracks are of ground platforms
         if (trk.IsValid() && trk.LandDomain())
         {           
//          look at ESM tracks of radars
            if (trk.SensorType() == "WSF_ESM_SENSOR" && trk.TargetType() == "WSF_RADAR_SENSOR")
            {
//             I have a track of another radar...is that radar tracking me?...using truth
               WsfPlatform target_plat = WsfSimulation.FindPlatform(trk.TargetName());
               if (target_plat.IsValid() && target_plat.MasterRawTrackList().IsValid())
               {
                  foreach (WsfTrack ttrk in target_plat.MasterRawTrackList())
                  { 
                     if (ttrk.SensorType() == "WSF_RADAR_SENSOR" && target_plat.Side() != me.Side()
                        && trk.Frequency() > 2000 && ttrk.TargetName() == me.Name() ) // MHz?
                     // trk.Frequency() not returning a value, need to figure out how to access frequency of emitter 
                     {
                        spiked = true; 
                     } 
                  } 
               }
            }
         }
      }
   }
   return spiked;
end_script
```

- **演示要点**：演示 script 的参数：is, then, bool, if, return

### script（assessment_scripts）｜脚本

- **关键词**：script, iacid, me, if, double, return, 脚本
- **出处**：`air_to_air/processors/assessment_scripts.txt:285-339`
- **片段**：

```text
        script double CalculateThreatLevel(WsfSA_EntityPerception aEntity, bool aIsBogie)
        /*
        PURPOSE  This calculates the threat level by the specified entity, the higher the value the more threatened I feel
        AUTHOR   Snyder
        Parameter Description
           iacid       WsfPlatform  - Platform being analyzed
           MAR         DOUBLE - Threat value is 1 if inside this range
           DOR         DOUBLE - Threat value is 0.5 if inside this range
        Technical Description:
           The score/value should range between +/- 1.0     
           me        MAR   DOR   Lim       thrt      
          --->        |     |     |        <---
                     1.0   0.5   0.0
                     
                     Lim (limit range) = DOR + (DOR-MAR) = 2*DOR-MAR
                     
                     If the bandit is outside of Lim range, threat value is 0.0
                     If the bandit is inside of MAR range, threat value is 1.0                     
                     If the bandit is between MAR and Lim range and hot to me, calculate a normalized threat value
                     and if the bandit is at DOR range, the threat value calculated should be 0.5
        */
           if (no_tree){return 0;}     
           writeln_d("T = ",TIME_NOW," ",iacid.Name()," thrtlvl");              
           double ThreatVal = -1.0;
           double Lim = 2*(iacid->DOR) - iacid->MAR;
           if( !aEntity.IsValid() )
           {
              writeln("Invalid entity in CalculateThreatLevel");
              return 0.0;
           }
           if (aEntity.Track().IsValid() && aEntity.Track().Target().IsValid() && aEntity.Track().AirDomain() && 
           iacid.Side() != aEntity.Track().Side())
           {
              if (iacid.SlantRangeTo(aEntity.Track()) > Lim)
              {
                 return 0.0; // not threatening 
              }
              if (iacid.SlantRangeTo(aEntity.Track()) < iacid->MAR)
              {
                 return 1.0; // Very threatening
              }
              if (!aEntity.Track().Target().CategoryMemberOf("missile")) //  && 
              {
                 // threat is not a missile and is between MAR and Lim range
                 ThreatVal = (Lim - iacid.SlantRangeTo(aEntity.Track())) / (Lim - iacid->MAR);
                 // if threat is not hot to me, decrease the threat level
                 if (MATH.Fabs(aEntity.Track().RelativeBearingTo(iacid)) > iacid->THRT_ASPCT)
                 {
                    ThreatVal = ThreatVal/2;
                 }
                 return ThreatVal;
              }
           }
           return ThreatVal;  
        end_script       
```

- **演示要点**：演示 script 的参数：iacid, me, if, double, return

### script（aijam_processor）｜脚本

- **关键词**：script, string, int, if, foreach, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:479-533`
- **片段**：

```text
  script bool DoStopJamming( int aChannel, WsfTrackId aTargetId )

    string comment = "stop jamming: " + aTargetId.ToString();
    PLATFORM.Comment(comment);

    string    jammerName = mChannelJammers.Get(aChannel);
    int       beam       = mChannelBeams.Get(aChannel);
    WsfWeapon jammer     = PLATFORM.Weapon(jammerName);

    if (jammer.IsValid())
    {
      WsfTrack    track  = PLATFORM.MasterTrackList().Find(aTargetId);

      mTaskMgr = GetTaskManager();
      if (!mTaskMgr.IsValid())
      {
        writeln("ERROR: invalid task manager for jamming control!");
        return false;
      }

      //this should return a task list with one or none tasks in it
      WsfTaskList taskList = mTaskMgr.AssignedTaskList(aTargetId, JAM_TASK_STR);

      foreach (WsfTask task in taskList)
      {
        if (!task.IsValid())
        {
          writeln("do stop jamming: task invalid!");
          continue;
        }
        if (task.ResourceName() == jammerName)
        {
          double freq = task.ResourceFrequency();
          double bw   = task.ResourceBandwidth();

          //if (mTaskMgr.StopJamming(aTargetId, JAM_TASK_STR, jammerName, freq, bw))

          if (mTaskMgr.StopJamming(aTargetId, JAM_TASK_STR, jammerName, freq, bw, beam))
          {
            //do stuff?
            writeln("T=", TIME_NOW, "  STOP JAMMING: ", jammerName, " : ",PLATFORM.Name(),
                    " - ", track.TargetName(), " : ", track.TargetType(), "  ", freq, " Hz, ", bw, " Hz");
            return true;
          }
          else
          {
            writeln("T=", TIME_NOW, " CANT STOP JAMMING: ", jammerName, ":", PLATFORM.Name(), " - ",
                    track.TargetName(), ":", track.TargetType(), " ", freq, " Hz, ", bw, " Hz");
            return false;
          }
        }
      }
    }
    return true;
  end_script
```

- **演示要点**：演示 script 的参数：string, int, if, foreach, return

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, double, if, string, else, return, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:614-669`
- **片段**：

```text
   script double TimeToPerformDrag(WsfPlatform aPlatform, WsfTrack aTrack)

      # Variables used in the script to generate the maneuver.
      # Change these to modify the behavior.
      # TODO make method arguments?
      # Flight parameters when dragging for speed (Mach) and altitude offest (meters) from start
      double dragMach = 1.1;
      double dragAltitudeOffset = -1000;
      # Angle in degrees to turn to drag on track.
      double dragAngle = 179;
      # Min/max angle in degrees that aircraft needs to be
      # between relative to track to be considered dragging
      double dragTolerance = 5;

      if (!aPlatform.IsValid() || !aTrack.IsValid())
      {
         return -1.0;
      }

      # Heading when we have finished maneuver
      double finalHeading = 0;
      # Determine new heading for drag maneuver
      string positioning = GetPositioning(aPlatform, aTrack, dragTolerance);
      if (aTrack.HeadingValid() &&
          (positioning == "tail-to-head" ||
           positioning == "head-to-head" ||
           positioning == "target-facing-me")
         )
      {
         # Check for condition when we know track's heading and
         # track is facing platform.
         # This gives a more accurate "drag" to threat course
         finalHeading = aTrack.Heading();
      }
      else
      {
         # Don't know track heading or not facing platform, turn
         # based on relative bearing to track location
         double relativeHeading = TurnHeading(aPlatform, aTrack, dragAngle, dragTolerance);
         finalHeading = Math.NormalizeAngle0_360(aPlatform.Heading() + relativeHeading);
      }

      double RadialAccel = GetDefaultG(aPlatform) * Earth.ACCEL_OF_GRAVITY();
      if (RadialAccel < 2.0)
      {
         RadialAccel = 2.0 * Earth.ACCEL_OF_GRAVITY();
      }
      double TurnAzimuth = MATH.Fabs(finalHeading);
      double Speed = aPlatform.Speed();
      double Radius = Speed * Speed / RadialAccel;
      double TurningCircleCircumference = 2.0 * MATH.PI() * Radius;
      double TurningArc = (TurnAzimuth/360) * TurningCircleCircumference;
      double TimeToTurn = TurningArc / Speed;
      return TimeToTurn;

   end_script
```

- **演示要点**：演示 script 的参数：double, if, string, else, return

### script（aijam_processor）｜脚本

- **关键词**：script, string, int, if, else, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:418-474`
- **片段**：

```text
  script bool DoStartJamming(int aChannel, WsfTrack aTarget)

    string comment = "start jamming: " + aTarget.TrackId().ToString();
    PLATFORM.Comment(comment);

    string     jammerName = mChannelJammers.Get(aChannel);
    WsfWeapon  jammer     = PLATFORM.Weapon(jammerName);
    int        beam       = mChannelBeams.Get(aChannel);

    if (jammer.IsValid() && aTarget.FrequencyValid())
    {
      #should already have passed these checks, when bidding
      #if (jammer.CanJam(aTarget.Frequency(), TechniqueType(aTarget)) && (CanAssign(jammer, 1)))
      #{

      int beamNumber = beam;

      mTaskMgr = GetTaskManager();
      if (!mTaskMgr.IsValid())
      {
        writeln("ERROR: invalid task manager for jamming control!");
        return false;
      }


      //StartJamming(TRACK, "Jam", jammer, TRACK.Frequency(), 5.e6, TechniqueType());

      if (mTaskMgr.StartJamming(aTarget, JAM_TASK_STR, jammer, aTarget.Frequency(),
                                SpotSize(aTarget), beamNumber, TechniqueType(aTarget)))
      {
        writeln("T=", TIME_NOW, " START JAMMING: ", jammer.Name(), " : ",
                PLATFORM.Name(), " - ", aTarget.TargetName(), " : ", aTarget.TargetType(),
                "  ", aTarget.Frequency(), " : ", SpotSize(aTarget), " : ", TechniqueType(aTarget),
                " Beam: ", beamNumber, " Assignments: ", jammer.ActiveRequestCount());
        return true;
      }
      else
      {
        writeln("CANT START JAMMING: ", jammer.Name(), ":", PLATFORM.Name(), " - ",
                aTarget.TargetName(), ":", aTarget.TargetType(), " ", aTarget.Frequency(),
                ":", SpotSize(aTarget), ":", TechniqueType(aTarget), " RequestCount=",
                jammer.ActiveRequestCount(), ":", jammer.MaximumRequestCount());
      }

      #}
      #else if (jammer.ActiveRequestCount() < jammer.MaximumRequestCount())

      if (jammer.ActiveRequestCount() < jammer.MaximumRequestCount())
      {
        writeln("CANT JAM THE TARGET: ", jammer.Name(), ":", PLATFORM.Name(),
                " - ", aTarget.TargetName(), ":", aTarget.TargetType(), " ",
                aTarget.Frequency(), ":", SpotSize(aTarget), ":", TechniqueType(aTarget),
                " RequestCount=", jammer.ActiveRequestCount(), ":", jammer.MaximumRequestCount());
      }
    }
    return false;
  end_script
```

- **演示要点**：演示 script 的参数：string, int, if, else, return

### script（rules_utils）｜脚本

- **关键词**：script, loop, threatening, if, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:866-934`
- **片段**：

```text
script double escape_hdg(WsfPlatform me)
/*
PURPOSE   determine desired out maneuver heading 
AUTHOR   Snyder

Parameter Description
   IN  me   WsfPlatform - Platform being analyzed
   OUT hdg  DOUBLE - Desired Vector Heading

Technical Description:
   loop through my local tracks, determine if a platform is threatening to me.
   Choose a heading based on heading off all threatening tracks to me. Track is 
   threatening to me if: track is hostile, pointing at me, and within DOR * 2
   Heading is the average bearing off all threats to me + 180 degrees

   This assumes perfect correlation/CID 

*/
double hdg = me.Heading();    // initialize to current heading
int num_threats =0;           // number of threatening tracks
double bearing;
double rel_bearing;
WsfSA_Processor saPROC;
for (int i=0; i<me.ProcessorCount(); i+=1)
{
   if (me.ProcessorEntry(i).IsA_TypeOf("WSF_SA_PROCESSOR"))
   {
      saPROC = (WsfSA_Processor)me.ProcessorEntry(i);
      break;
   }
}
Array<WsfSA_EntityPerception> bandit_list = saPROC.PerceivedBandits();

// loop through all my local tracks, determine if bad guy is threatening
   foreach (WsfSA_EntityPerception ent in bandit_list)
   { 
      if (!ent.IsValid() || ent.IsNull())
      {
         continue;
      }
      if (ent.Track().IsValid() && ent.Track().Target().IsValid() && ent.Track().Target().Side() != me.Side())
      {
         if (ent.Track().AirDomain() && !ent.Track().Target().CategoryMemberOf("missile"))
         {
            if (me.SlantRangeTo(ent.Track()) <= me->DOR*2 && MATH.Fabs(ent.Track().RelativeBearingTo(me)) <= me->THRT_ASPCT)
            {
               bearing = bearing + me.TrueBearingTo(ent.Track());
               rel_bearing = rel_bearing + me.RelativeBearingTo(ent.Track());
               num_threats = num_threats + 1;
            }
         }
         else if (ent.Track().LandDomain())
         {
            if (me.SlantRangeTo(ent.Track()) <= me->SAM_AVD_RNG*2)
            {
               bearing = bearing + me.TrueBearingTo(ent.Track());
               rel_bearing = rel_bearing + me.RelativeBearingTo(ent.Track());
               num_threats = num_threats + 1;
            }
         }
      }
   }
   if (num_threats > 0)
   {  
      if ( rel_bearing/num_threats < 0) { hdg = (bearing/num_threats) + 180; }
      if ( rel_bearing/num_threats > 0) { hdg = (bearing/num_threats) - 180; }
   }
   return hdg;
end_script
```

- **演示要点**：演示 script 的参数：loop, threatening, if, foreach, return

### script（observer）｜脚本

- **关键词**：script, int, else, string, double, if, 脚本
- **出处**：`air_to_air/observer.txt:137-229`
- **片段**：

```text
script void mslendMissile(WsfWeaponEngagement aWeaponEngagement)
   #weapon_termianted
   WsfPlatform target, shooter;
   WsfPlatform missile = aWeaponEngagement.WeaponPlatform();
   int target_index, shooter_index;
   
   #MTC - added checks for target and shooter being alive
   #Dead platforms are grabbed based on weapon-target-shooter trios stored at launch
   if(aWeaponEngagement.TargetPlatform().IsValid())
   {
      target = aWeaponEngagement.TargetPlatform();
      target_index = target.Index();
   }
   else
   {
      target = getDeadPlat(aWeaponEngagement,"target");
      target_index = target.AuxDataInt("platID");
   }
   
   if(aWeaponEngagement.FiringPlatform().IsValid())
   {
      shooter = aWeaponEngagement.FiringPlatform();
      shooter_index = shooter.Index();
   }
   else
   {
      shooter = getDeadPlat(aWeaponEngagement,"shooter");
      shooter_index = shooter.AuxDataInt("platID");
   }   
   
   string weapon_name = aWeaponEngagement.WeaponPlatformName();
   string weapon_type = aWeaponEngagement.WeaponSystemType();
   double PkDrawn = aWeaponEngagement.PkDrawn();
   double Pk = aWeaponEngagement.Pk()*aWeaponEngagement.PkDegrade();
   
   #Missile Fuse and Kill 

   if (PkDrawn > 0)
   {
      if (log_print)
      {
         string killed;
         if (PkDrawn <= Pk)
         {
            killed = "T";
         }
         else
         {
            killed = "F";
         }
         log.Writeln(write_str(" MISSILE ",weapon_name," FUZES AGAINST ",target_index,
          "     RNG=     ",Format.Fixed(aWeaponEngagement.MissDistance()*MATH.FT_PER_M(),2)," T= ",Format.Fixed(TIME_NOW,2)));     
         log.Writeln(write_str("         TERMINAL POSITION: X= ",Format.Fixed(Get_X(origin,aWeaponEngagement.WeaponLocation()),2),
          " Y= ",Format.Fixed(Get_Y(origin,aWeaponEngagement.WeaponLocation()),2)," Z= ",Format.Fixed(missile.Altitude()*MATH.FT_PER_M(),2)));                                      
         #CJV - Need to actually do MODE
         log.Writeln(write_str("         LAUNCH POSITION: X= ",Format.Fixed(Get_X(origin,aWeaponEngagement.WeaponLocationAtLaunch()),2),
          " Y= ",Format.Fixed(Get_Y(origin,aWeaponEngagement.WeaponLocationAtLaunch()),2),
          " Z= ",Format.Fixed(aWeaponEngagement.WeaponLocationAtLaunch().Altitude()*MATH.FT_PER_M(),2)," MODE CMD_GUIDED_DES_RDR"));
         #CJV - Need to actually get AVERAGE VELOCITY
         log.Writeln(write_str("         AVERAGE VELOCITY= ",Format.Fixed(missile.Speed()*MATH.FT_PER_M(),2)));
         #CJV - Need to actually get TERMINAL VELOCITY
         log.Writeln(write_str("         TERMINAL VELOCITY= ",Format.Fixed(missile.Speed()*MATH.FT_PER_M(),2)));
#        log.Writeln(write_str("         GEES AVAILABLE= ",Format.Fixed(aWeaponEngagement.EndgameGees(),2)));
         log.Writeln(write_str("         LAUNCHER POSITION: X= ",Format.Fixed(Get_X(origin,shooter.Location()),2),
          " Y= ",Format.Fixed(Get_Y(origin,shooter.Location()),2)," Z= ",Format.Fixed(shooter.Altitude()*MATH.FT_PER_M(),2)));
         #CJV - Need to actually find FPOLE
         log.Writeln(write_str("         FPOLE= ",Format.Fixed(shooter.SlantRangeTo(target)*MATH.NM_PER_M(),2)));
         #CJV - Need to actually get TRACKBANK info
         log.Writeln("         GUIDANCE TRACKBANK   1 HAS TRACK ON FUZEE   SEEKERS CONTRIBUITING ACTIVE");
         #MTC - works currently with missiles with one sensor that is the seeker
         log.Writeln(write_str("         ENDGAME SEEKER: ",aWeaponEngagement.WeaponPlatform().SensorEntry(0).Type()));
         log.Writeln(write_str(" MSLEND..MISSILE ",weapon_name,"(",weapon_type,"   ) VS TGT  ",target_index,"   KILL= ",killed));
         log.Writeln(write_str("         PK= ",Format.Fixed(Pk,3),", DRAW= ",Format.Fixed(PkDrawn,3),
          " AT TIME  ",Format.Fixed(TIME_NOW,2)));
      }
   }
   else if(PkDrawn < 0)
   {
      if (log_print)
      {
         if (aWeaponEngagement.ExtendedResult().Split()[0] == "Missile_ProxFuzeActivated")
         {
            log.Writeln(write_str(" MISL ",weapon_name," FAILS: T= ",Format.Fixed(TIME_NOW,2),
             " DUE TO ", aWeaponEngagement.ExtendedResult().Split()[1]));
         }
         else
         {
            log.Writeln(write_str(" MISL ",weapon_name," FAILS: T= ",Format.Fixed(TIME_NOW,2),
             " DUE TO ", aWeaponEngagement.ExtendedResult()));
         }
      }
   }
end_script
```

- **演示要点**：演示 script 的参数：int, else, string, double, if

### script（behavior_alt3441_tail_attack）｜脚本

- **关键词**：script, double, if, dir0, spd0, spdmod, 脚本
- **出处**：`brawler/platforms/alternatives/behavior_alt3441_tail_attack.txt:65-157`　（同签名共 2 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt3441_tail_attack.txt:71`）
- **片段**：

```text
   script void talatk()
      writeln_d("alt3441 tail attack: talatk");
#      # local declarations
#      integer jacid
#      real t,pres,dens,vs,pr,dr,xcarot(3),vcarot(3)
#      real xprj(3),vprj(3),rhprj(3,3),dlag,dlagn,dlagun,vtemp(3)
#      real dxtail(3),aprj(3),ause(3),dt,spdwtd,x_tgt(3)
#      data dlagn/5000./,dlagun/1000./
#      # ENDDEC
#      # SET TARGET POSITION BEHIND TARGET A/C A DISTANCE DLAG
#      jacid = iacidt(iac)
#      dlag=dlagn
#      if(.not.noaim) dlag= (ppmrmn+ppmrmx)/2.
#      if(mslpp.eq.nummis+1) dlag= dlagun
#      # GET POSITION OF AC 5 SECONDS IN FUTURE:
#      dt = 5.
#      #if (xp(3,iac).ge.trkr_neg_alt) call nabort('talatk...tgt more than /par/trkr_neg_alt feet below ground')
#      call xmit3(xp(1,iac),x_tgt)
#      if (x_tgt(3).ge.0.) x_tgt(3) = -1.0
#      call atmos(-x_tgt(3),t,pres,dens,vs,pr,dr)
#      call a_lim(x_tgt,vp(1,iac),ap(1,iac),dt,casmin(iac)/sqrt(dr),ause)
#      call projw(x_tgt,vp(1,iac),ause,dt,xprj,vprj,aprj,rhprj)
#      call vmake(-dlag,vprj,vtemp)
#      call vsum(x_tgt,vtemp,dxtail)
#      call vsub(dxtail,xp(1,me),dxtail)
#      call vecinc(vp(1,iac),0.5/tproj3,dxtail,dir0)
#      spd0 = xmag(dir0)
#      spdmod = desspd
#      spdwtd = spdnow(me)+almax*tproj3*1.1
#      if (spd0 .gt. spdwtd)
#      {
#          spd0 = 3.
#          spdmod = thrttl
#      }
#      call vnorm(dir0,dir0)




      double dlagn  = 5000.0;
      double dlagun = 1000.0;
      double dlag = dlagn;

      ## check if we have a weapon task - it shouldn't reach this point if we didn't
      #if(.not.noaim) dlag= (ppmrmn+ppmrmx)/2.
      ## check if we have a weapon, otherwise close at gun range
      #if(mslpp.eq.nummis+1) dlag= dlagun
      if (!HaveWeapon(PLATFORM))
      {
         dlag = dlagun;
      }

      # GET POSITION OF AC 5 SECONDS IN FUTURE:
      double dt = 5.0;
      #if (xp(3,iac).ge.trkr_neg_alt) call nabort('talatk...tgt more than /par/trkr_neg_alt feet below ground')

#      call xmit3(xp(1,iac),x_tgt)

#      ##LBM - dont do projection for now
#      if (x_tgt(3).ge.0.) x_tgt(3) = -1.0
#      call atmos(-x_tgt(3),t,pres,dens,vs,pr,dr)
#      call a_lim(x_tgt,vp(1,iac),ap(1,iac),dt,casmin(iac)/sqrt(dr),ause)
#      call projw(x_tgt,vp(1,iac),ause,dt,xprj,vprj,aprj,rhprj)

      //LBM - not able to perceive target's acceleration
      //assume target's velocity after dt is same as now

      //LBM - convert everything to feet when calculating against BRAWLER constants
      //      convert back to meters to call WSF commands
      Vec3 vprj = targetTrack.VelocityNED();
      Vec3 vtemp = vprj.Normal();
      vtemp.Scale(-dlag);
#      Vec3 x_tgt;   //target position
#      Vec3 xp;   //my position
#      Vec3 dxtail = Vec3.Add(x_tgt,vtemp);   #adding vtemp is not accounted for in the line below
#      dxtail = Vec3.Subtract(dxtail,xp);
      Vec3 dx = RelativePositionNED(PLATFORM.Location(), targetTrack.CurrentLocation());
      Vec3 dxtail = Vec3.Add(dx,vtemp);

      Vec3 vpt = targetTrack.VelocityNED();
      dxtail.Scale(0.5/BRAWLER.ProjectedTimeDelta());
      dir0 = Vec3.Add(vpt,dxtail);
      spd0 = dir0.Magnitude();   #m/sec
      spdmod = 1;   //(desspd = 1, thrttl = 2, desacc = 3)
      double almax = BRAWLER.MaxForwardAccelWithGravity();   #m/sec^2
      double spdwtd = PLATFORM.Speed() + almax * BRAWLER.ProjectedTimeDelta() * 1.1;
      if (spd0 > spdwtd)
      {
          spd0 = 3.0;
          spdmod = 2;   //(desspd = 1, thrttl = 2, desacc = 3)
      }
      dir0.Normalize();
   end_script
```

- **演示要点**：演示 script 的参数：double, if, dir0, spd0, spdmod

### script（aigci_processor.old）｜脚本

- **关键词**：script, foreach, if, double, for, else, 脚本
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:385-482`
- **片段**：

```text
  script void aigci_update_with_zones()

   #extern string DetermineTrackCategory(WsfTrack);
   #extern bool TestTrackCategory(WsfTrack,string);

    WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
    writeln_d("~~~  localTracks.Count() = ", localTracks.Count());

    mZoneCluster.Clear();

    //build clusters from threats that occupy zones of interest
    //clusters can share members simply because zones can overlap
    foreach (WsfTrack track in localTracks)
    {
      // if the track is not a foe, we'll ignore it
      if (!(track.IsValid()) || !track.IFF_Foe() || TestTrackCategory(track,"unknown"))
      {
        continue;
      }
      #if( track.LocationValid() ) { writeln_d("~~~ Considering: ", track.TrackId().Name(), ".", track.TrackId().Number(), " -> ", track.TargetName()); }

      if (track.LocationValid())
      {
        //zones can overlap, so check all zones for each track
        foreach( string zName in mZoneNames )
        {
            if( track.WithinZoneOf( PLATFORM, zName ) )
            {
                track.SetBearing( track.Heading() );  #useful for the cluster processing
                if (!mZoneCluster.Exists(zName))
                {
                    mZoneCluster.Set(zName, WsfCluster.Create(track));
                }
                else
                {
                    mZoneCluster.Get(zName).Add(track);
                }
            }
        }
      }
    }

    //ensure a job exists for each occupied zone (cluster of threats)
    foreach ( string name : WsfCluster cluster in mZoneCluster)
    {
      double ZoneJobPriority = 0.0;
      Array<string> targetNames = Array<string>();
      for (int i = 0; i < cluster.Count(); i = i + 1)
      {
        WsfTrack aTrack = cluster.Entry(i);
        string trgtType = DetermineTrackCategory(aTrack);
        ZoneJobPriority = ZoneJobPriority + ThreatTypePriority.Get(trgtType);
        targetNames.PushBack(aTrack.TargetName());
      }

      if( mZoneJobMap.Exists( name ) )
      {
        //writeln("LBM - update zone job  count: ", cluster.Count());
        //job exists for zone with threats, update job priority
        WsfRIPRJob temp = mZoneJobMap.Get( name );
        //job priority could have changed, set it
        temp.Priority( ZoneJobPriority );
        temp.SetData( "ZonePoint", WsfGeoPoint(cluster.MeanLocation()) );
        temp.SetData( "ZoneBearing", cluster.Bearing() );
        temp.SetData( "ZoneBearingValid", cluster.BearingValid() );
        temp.SetData( "ZoneNumThreats", cluster.Count() );
        temp.SetData( "ZoneThreatNameArray", targetNames );
      }
      else
      {
        //writeln("LBM - create zone job.  count: ", cluster.Count());
        //zone just became hot, job not created yet, create one
        WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR, "zone", "zone-" + name, ZoneJobPriority, mMaxJobWinnersForGciZone );
        temp.SetData( "ZoneName", name );
        temp.SetData( "ZonePoint", WsfGeoPoint(cluster.MeanLocation()) );
        temp.SetData( "ZoneBearing", cluster.Bearing() );
        temp.SetData( "ZoneBearingValid", cluster.BearingValid() );
        temp.SetData( "ZoneNumThreats", cluster.Count() );
        temp.SetData( "ZoneThreatNameArray", targetNames );
        temp.SetData( "for_air", 1 );
        AddJob(temp);
        mZoneJobMap.Set(name, temp);
        writeln_d("+++ ", PLATFORM.Name(), " job change, ADD: ", temp.Name() );
      }
    }
    //remove existing jobs for which their is no occupied zone (no cluster of threats)
    Array<WsfRIPRJob> jobs = GetJobs();
    foreach (WsfRIPRJob x in jobs)
    {
       string zName = (string)x.GetData("ZoneName");
       if (!mZoneCluster.Exists(zName))
       {
          writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", x.GetDescription());
          RemoveJob(x);
          mZoneJobMap.Erase(zName);
       }
    }
  end_script
```

- **演示要点**：演示 script 的参数：foreach, if, double, for, else

### script（run_me_first）｜脚本

- **关键词**：script, extern, string, bullet_line, double, foreach, 脚本
- **出处**：`gun_engagement/run_me_first.txt:15-116`
- **片段**：

```text
script void CreateWeapon()

  extern string BULLET_NAME;
  extern double MUZZLE_VELOCITY_MS;
  extern double BULLET_DIAMETER_MM;
  extern double BULLET_MASS_KG;
  extern double BULLET_MAX_CL;
  extern double MAGAZINE_CAPACITY;
  extern double RATE_OF_FIRE_PER_SEC;
  extern double BURST_SIZE;
  extern double FIRING_DELAY;
  extern double FIRING_INTERVAL;
  //Setup the output file name

  string WeaponOutputFileName   = write_str("weapons/guns/" , BULLET_NAME, ".txt");

  // Open the bullet file for write
  FileIO BulletFile = FileIO();
  BulletFile.Open(WeaponOutputFileName, "out");
  string bullet_line;
  bullet_line = write_str("# This file was automatically generated by the gun_demo script\n\n");
  BulletFile.Writeln(bullet_line);
  // Make the aero table
  bullet_line = write_str("aero ", BULLET_NAME, "_AERO  WSF_AERO");
  BulletFile.Writeln(bullet_line);
  // Compute ref area PII * R^2
  double RefArea = ((BULLET_DIAMETER_MM / 2 / 10 ) * (BULLET_DIAMETER_MM / 2 / 10 ) * MATH.PI());
  bullet_line = write_str("   reference_area   ", RefArea, " cm2");
  BulletFile.Writeln(bullet_line);
  bullet_line = write_str("   cl_max           ", BULLET_MAX_CL);
  BulletFile.Writeln(bullet_line);
  // Get and write out the mach vs cd map
  foreach (double aKey : double aData in MACH_VS_CD)
  {
     bullet_line = write_str("   mach_and_cd       " ,  aKey, "    ", aData);
     BulletFile.Writeln(bullet_line);
  }
  bullet_line = write_str("end_aero\n\n\n");
  BulletFile.Writeln(bullet_line);
  // write out the bullet platform and mover
  bullet_line = write_str("platform_type  ", BULLET_NAME, " WSF_PLATFORM");
  BulletFile.Writeln(bullet_line);
  bullet_line = write_str("   icon gbu-15\n",
                          "   mover WSF_UNGUIDED_MOVER\n",
                          "      #show status\n",
                          "      update_interval   0.001 sec\n",
                          "      total_mass        ", BULLET_MASS_KG , " kg\n",
                          "      aero              ", BULLET_NAME, "_AERO\n",
                          "   end_mover\n" );
  BulletFile.Writeln(bullet_line);
    bullet_line = write_str(
          " #processor WriteRangeSpeedData WSF_SCRIPT_PROCESSOR\n",
          " #  update_interval 0.01 sec\n",
          " #    on_update");
  BulletFile.Writeln(bullet_line);
  bullet_line = write_str(
          "  #     writeln(\" Time \", PLATFORM.TimeSinceCreation(), \" Range \", PLATFORM.GroundRangeTo(0,0,0), \" Average Vel \", ((1021 + PLATFORM.Speed()) / 2\)\,) );\" ,
          "\n #   end_on_update\n",
          " #end_processor");
  BulletFile.Writeln(bullet_line);


  bullet_line = write_str("   processor fuse WSF_AIR_TARGET_FUSE\n",
                          "      gross_update_interval 0.01 sec\n",
                          "      fine_update_interval 0.001 sec\n",
                          "      gross_proximity_range  3 m\n",
                          "      hit_proximity_range 2 m\n",
                          "   end_processor");
  BulletFile.Writeln(bullet_line);
  bullet_line = write_str("end_platform_type\n\n");
  BulletFile.Writeln(bullet_line);
  bullet_line = write_str("weapon_effects "  ,BULLET_NAME,"_LETHALITY  WSF_GRADUATED_LETHALITY\n",
                         "   radius_and_pk      5 m   0.9\n",
                         "end_weapon_effects\n\n");
  BulletFile.Writeln(bullet_line);





  bullet_line = write_str("# Finally we get to write out the weapon...\n");
  BulletFile.Writeln(bullet_line);
 //Im hardcoding some of this for now.  Got to get it done...
  bullet_line = write_str(
         "weapon ", BULLET_NAME, " WSF_EXPLICIT_WEAPON\n",
         "    #launch_computer           ", BULLET_NAME, "_LAUNCH_COMPUTER   end_launch_computer\n",
         "    launched_platform_type    ", BULLET_NAME, "\n",
         "    weapon_effects            ", BULLET_NAME, "_LETHALITY\n",
         "    slew_mode                 azimuth_and_elevation\n",
         "       azimuth_slew_limits       -180 deg 180 deg\n",
         "       elevation_slew_limits      -10 deg  85 deg\n",
         "    quantity                  ", MAGAZINE_CAPACITY, "\n",
         "    firing_delay              0 secs\n",
         "    #firing_interval           10 secs  # cool down time after a salvo - total guess\n",
         "    salvo_interval            ", (1 / RATE_OF_FIRE_PER_SEC), " sec\n",
         "    launch_delta_v            ", MUZZLE_VELOCITY_MS, " 0 0 m/s\n",
         "    automatic_target_cueing    true\n",
         "    cue_to_predicted_intercept  true\n",
         "end_weapon\n\n");
  BulletFile.Writeln(bullet_line);
  BulletFile.Close();
end_script
```

- **演示要点**：演示 script 的参数：extern, string, bullet_line, double, foreach

### script（sensor_observer）｜脚本

- **关键词**：script, if, else, string, double, term1, 脚本
- **出处**：`air_to_air/sensor_observer.txt:258-392`　（同签名共 2 处，另见 `air_to_air/sensor_observer.txt:104`）
- **片段**：

```text
script void LocalTrackUpdate(WsfPlatform observer, WsfLocalTrack ltrk, WsfTrack track)
if (sensor_print)
{
   WsfPlatform target;
   WsfCovariance Covariance = WsfCovariance();
   // set the covariance matrix to be used, use the state matrix if it exists, else use the measurment covariance matrix
   if (ltrk.StateCovarianceValid())
   {
      Covariance = ltrk.StateCovariance();
   }
   else if (!ltrk.StateCovarianceValid() && ltrk.MeasurementCovarianceValid())
   {
      Covariance = ltrk.MeasurementCovariance();
   }
   else if (!ltrk.StateCovarianceValid() && !ltrk.MeasurementCovarianceValid())
   {
      return;
   }

   // make sure the target is valid in the sim
   if (ltrk.Target().IsValid() && !ltrk.Target().IsNull())
   {
      target = (WsfPlatform)ltrk.Target();
   }
   else
   {
      return;
   }

   string tgt_i = (string)target.Index();
   string obs_i = (string)observer.Index();

   // create Vec3's of the Truth and Track line of sight vectors
   Vec3 TruthLOS = RelativePositionNED(observer.Location(),target.Location());
   Vec3 TrackLOS = RelativePositionNED(observer.Location(),ltrk.CurrentLocation());

   // range (line of sight)
   double r_truth = TruthLOS.Magnitude()*MATH.FT_PER_M();
   double r_sigma = ltrk.RangeErrorSigma()*MATH.FT_PER_M();
   double r_error = MATH.FT_PER_M()*(TruthLOS.Magnitude() - Vec3.Dot(TruthLOS,TrackLOS)/TruthLOS.Magnitude());
   double r_cov   = MATH.Sqrt(Covariance.Element(1,1))*MATH.FT_PER_M();
   double rr_cov  = MATH.Sqrt(Covariance.Element(3,3))*MATH.FT_PER_M();  

   // azimuth & cross-range
   double az_truth = observer.RelativeBearingTo(target);
   double az_sigma = ltrk.BearingErrorSigma()*MATH.DEG_PER_RAD();
   double az_error = observer.TrueBearingTo(target) - observer.TrueBearingTo(ltrk.CurrentLocation());
   double cr_error = MATH.Sin(az_error)*TrackLOS.Magnitude()*MATH.FT_PER_M();
   double cr_cov1  = MATH.Sqrt(Covariance.Element(2,2))*MATH.FT_PER_M();
   double az_cov   = MATH.ASin(cr_cov1/(TrackLOS.Magnitude()*MATH.FT_PER_M()));
   double crr_cov1 = MATH.Sqrt(Covariance.Element(5,5)*MATH.FT_PER_M());
   double azr_cov  = MATH.ASin(crr_cov1/(TrackLOS.Magnitude()*MATH.FT_PER_M()));

   // elevation & vertical-range
   double el_truth = observer.RelativeElevationOf(target.Location());
   double el_sigma = ltrk.ElevationErrorSigma()*MATH.DEG_PER_RAD();
   double el_error = observer.RelativeElevationOf(target.Location()) - observer.RelativeElevationOf(ltrk.CurrentLocation());
   double vr_error = MATH.Sin(el_error)*TrackLOS.Magnitude()*MATH.FT_PER_M();   
   double vr_cov1  = MATH.Sqrt(Covariance.Element(0,0))*MATH.FT_PER_M(); 
   double el_cov   = MATH.ASin(vr_cov1/(TrackLOS.Magnitude()*MATH.FT_PER_M()));  
   double vrr_cov1 = MATH.Sqrt(Covariance.Element(4,4))*MATH.FT_PER_M();   
   double elr_cov  = MATH.ASin(vrr_cov1/(TrackLOS.Magnitude()*MATH.FT_PER_M()));  

   // get truth range-rate, az-rate, el-rate
   Vec3 Po   = (Vec3)observer.LocationWCS(); // m/s
   Vec3 Vo   = (Vec3)observer.VelocityWCS(); // m/s
   Vec3 Pt   = (Vec3)target.LocationWCS();   // m/s
   Vec3 Vt   = (Vec3)target.VelocityWCS();   // m/s
   Vec3 Vrel = Vec3.Subtract(Vt,Vo);         // m/s
   Vec3 Prel = Vec3.Subtract(Pt,Po);         // m/s
   Vec3 Prel2= Vec3.Construct(Prel.X()/Prel.MagnitudeSquared(),Prel.Y()/Prel.MagnitudeSquared(),Prel.Z()/Prel.MagnitudeSquared());   
   double TruthRR = Vec3.Dot(Vrel,Prel.Normal())*MATH.FT_PER_M();
   double term1 = Vec3.Dot(Vrel,Prel);
   Vec3 Vrad = Vec3.Construct(MATH.FT_PER_M()*term1*Prel2.X(),MATH.FT_PER_M()*term1*Prel2.Y(),MATH.FT_PER_M()*term1*Prel2.Z());
   Vec3 Vrad2 = Vec3.Construct(term1*Prel2.X(),term1*Prel2.Y(),term1*Prel2.Z());
   Vec3 Vtrans= Vec3.Subtract(Vrel,Vrad2);  // m/s
   double TruthCRR = Vtrans[2]*MATH.FT_PER_M(); // ft/s
   double TruthAZR = MATH.ATan(TruthCRR/(MATH.FT_PER_M()*TruthLOS.Magnitude()));
   double TruthVRR = Vtrans[0]*MATH.FT_PER_M(); // ft/s
   double TruthELR = MATH.ATan(TruthVRR/(MATH.FT_PER_M()*TruthLOS.Magnitude()));
   
   // get track range-rate, az-rate, el-rate
   Pt   = (Vec3)ltrk.CurrentLocation().LocationWCS();
   Vt   = (Vec3)ltrk.VelocityWCS();
   Vrel = Vec3.Subtract(Vt,Vo);
   Prel = Vec3.Subtract(Pt,Po);
   Prel2= Vec3.Construct(Prel.X()/Prel.MagnitudeSquared(),Prel.Y()/Prel.MagnitudeSquared(),Prel.Z()/Prel.MagnitudeSquared());   
   double TrackRR = Vec3.Dot(Vrel,Prel.Normal())*MATH.FT_PER_M();
   term1 = Vec3.Dot(Vrel,Prel);
   Vrad = Vec3.Construct(MATH.FT_PER_M()*term1*Prel2.X(),MATH.FT_PER_M()*term1*Prel2.Y(),MATH.FT_PER_M()*term1*Prel2.Z());
   Vrad2 = Vec3.Construct(term1*Prel2.X(),term1*Prel2.Y(),term1*Prel2.Z());
   Vtrans= Vec3.Subtract(Vrel,Vrad2);  
   double TrackCRR = Vtrans[2]*MATH.FT_PER_M();
   double TrackAZR = MATH.ATan(TrackCRR/(MATH.FT_PER_M()*TruthLOS.Magnitude()));
   double TrackVRR = Vtrans[0]*MATH.FT_PER_M();
   double TrackELR = MATH.ATan(TrackVRR/(MATH.FT_PER_M()*TruthLOS.Magnitude()));   
   
   // set range, az, and el rate errors
   double rr_error  = TruthRR  - TrackRR;
   double crr_error = TruthCRR - TrackCRR;
   double azr_error = TruthAZR - TrackAZR;
   double vrr_error = TruthVRR - TrackVRR;
   double elr_error = TruthELR - TrackELR;

   string mgr_string = "LOCAL_TRACK";
   if (observer.MasterTrackList().Find(ltrk.TrackId()).IsValid())
   {
      mgr_string = "MASTER_TRACK";
   }
   else if (observer.TrackList("raw_data_mgr").IsValid() && observer.TrackList("raw_data_mgr").Find(ltrk.TrackId()).IsValid())
   {
      mgr_string = "FUSION_TRACK";
   }

   sensorIO.Write(write_str(mgr_string.Pad(-15)," OBSERVER ",obs_i.Pad(4),
   " TRACK OF ",tgt_i.Pad(4)," AT ",Format.Fixed(TIME_NOW,1),"\n"));
   sensorIO.Write(write_str("   Range to target (nmi) ",
   Format.Fixed(TruthLOS.Magnitude()*MATH.NM_PER_M(),1),"\n"));
   sensorIO.Write(write_str("      RANGE, AZ, EL      - TRUTH     ",Format.Fixed(r_truth,0).Pad(11),Format.Fixed(az_truth,4).Pad(11),Format.Fixed(el_truth,4).Pad(11)," [FT,DEG,DEG]\n"));      
   sensorIO.Write(write_str("      RANGE, AZ, EL      - ERROR     ",Format.Fixed(r_error,0).Pad(11),Format.Fixed(az_error,4).Pad(11),Format.Fixed(el_error,4).Pad(11)," [FT,DEG,DEG]\n")); 
   sensorIO.Write(write_str("      RANGE, AZ, EL      - SIGMA     ",Format.Fixed(r_sigma,0).Pad(11),Format.Fixed(az_sigma,4).Pad(11),Format.Fixed(el_sigma,4).Pad(11)," [FT,DEG,DEG]\n")); 
   sensorIO.Write(write_str("      RANGE, AZ, EL      - COVARIANCE",Format.Fixed(r_cov,0).Pad(11),Format.Fixed(az_cov,4).Pad(11),Format.Fixed(el_cov,4).Pad(11)," [FT,DEG,DEG]\n"));
   sensorIO.Write(write_str("      RANGE, AZ, EL RATE - TRUTH     ",Format.Fixed(TruthRR,0).Pad(11),Format.Fixed(TruthAZR,4).Pad(11),Format.Fixed(TruthELR,4).Pad(11)," [FT/S,DEG/S,DEG/S]\n"));      
   sensorIO.Write(write_str("      RANGE, AZ, EL RATE - ERROR     ",Format.Fixed(rr_error,0).Pad(11),Format.Fixed(azr_error,4).Pad(11),Format.Fixed(elr_error,4).Pad(11)," [FT/S,DEG/S,DEG/S]\n")); 
   sensorIO.Write(write_str("      RANGE, AZ, EL RATE - COVARIANCE",Format.Fixed(rr_cov,0).Pad(11),Format.Fixed(azr_cov,4).Pad(11),Format.Fixed(elr_cov,4).Pad(11)," [FT/S,DEG/S,DEG/S]\n"));
#      sensorIO.Write(write_str("      RANGE, CR, VR      - COVARIANCE",Format.Fixed(r_cov,0).Pad(11),Format.Fixed(cr_cov1,0).Pad(11),Format.Fixed(vr_cov1,0).Pad(11)," [FT,FT,FT]\n"));
#      sensorIO.Write(write_str("      RANGE, CR, VR RATE - COVARIANCE",Format.Fixed(rr_cov,0).Pad(11),Format.Fixed(crr_cov1,0).Pad(11),Format.Fixed(vrr_cov1,0).Pad(11)," [FT/S,FT/S,FT/S]\n"));                        

// writing this in east-north-up coordinates
   sensorIO.Write(write_str("      TRUTH LOS ",Format.Fixed(TruthLOS.Y()*MATH.FT_PER_M(),0).Pad(11)," ",Format.Fixed(TruthLOS.X()*MATH.FT_PER_M(),0).Pad(11)
   ," ",Format.Fixed(-TruthLOS.Z()*MATH.FT_PER_M(),0).Pad(11),"\n"));
   sensorIO.Write(write_str("      TRACK LOS ",Format.Fixed(TrackLOS.Y()*MATH.FT_PER_M(),0).Pad(11)," ",Format.Fixed(TrackLOS.X()*MATH.FT_PER_M(),0).Pad(11)
   ," ",Format.Fixed(-TrackLOS.Z()*MATH.FT_PER_M(),0).Pad(11),"\n")); 
}                        
end_script
```

- **演示要点**：演示 script 的参数：if, else, string, double, term1

### script（common_platform_script）｜脚本

- **关键词**：script, static, if, string, return, 脚本
- **出处**：`base_types/processors/quantum_agents/common/common_platform_script.txt:134-143`　（同签名共 8 处，另见 `base_types/processors/ripr_agents/common/common_platform_script.txt:134`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:129`、`brawler/processors/quantum_agents/common_platform_script.txt:133`）
- **片段**：

```text
  script string GetNextBasicColor()
     static int mNextColor = 0;
     if (mNextColor >= mBasicColors.Size())
     {
        mNextColor = 0;
     }
     string color = mBasicColors.Get(mNextColor);
     mNextColor = mNextColor + 1;
     return color;
  end_script
```

- **演示要点**：演示 script 的参数：static, if, string, return

### script（post_process_test）｜脚本

- **关键词**：script, string, if, else, return, 脚本
- **出处**：`engage/post_process_test.txt:10-20`　（同签名共 4 处，另见 `base_types/processors/timeline_agents/timeline_proc_fsm.txt:236`、`base_types/processors/timeline_agents/timeline_proc_fsm.txt:300`、`base_types/processors/ripr_agents/aijam/aijam_processor.txt:243`）
- **片段**：

```text
script string ValueToAscii(double v)
   string c;
   if (v<=0) c = "_";
   else if (v<.2) c= ".";
   else if (v<.4) c = ":";
   else if (v<.6) c = ";";
   else if (v<.8) c = "!";
   else if (v<1.0) c = "|";
   else if (v>=1.0) c = "X";
   return c;
end_script
```

- **演示要点**：演示 script 的参数：string, if, else, return

### script（draw_demo）｜脚本

- **关键词**：script, bool, double, if, return, 脚本
- **出处**：`draw/draw_demo.txt:61-72`　（同签名共 29 处，另见 `alv_routing/weapons/alv_weapon.txt:51`、`electronic_warfare/track_error.txt:89`、`laser_designator/platforms/uav.txt:49`）
- **片段**：

```text
      script bool InInterceptEnvelopeOf(WsfWeapon aWeapon, WsfTrack aTrack)
        bool canIntercept = false;
        double maxRng = 800;
        double minRng = 300;
        WsfTrackId id = aTrack.TrackId();
        double targetrange = PLATFORM.SlantRangeTo(aTrack);
        if ((targetrange > minRng) && (targetrange < maxRng))
        {
           canIntercept = true;
        }
        return canIntercept;
      end_script
```

- **演示要点**：演示 script 的参数：bool, double, if, return

### script（aijam_processor）｜脚本

- **关键词**：script, int, if, else, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:177-188`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aifl/fl_quantum_tasker.txt:123`、`behavior_tree/processors/quantum_agents/aifl/fl_quantum_tasker.txt:135`）
- **片段**：

```text
  script int TargetPriority(WsfTrack aTrack)
    int priority = 0;
    if (mPriorityList.Exists(aTrack.TargetName()))
    {
        priority = mPriorityList[aTrack.TargetName()];
    }
    else if (mPriorityList.Exists(aTrack.TargetType()))
    {
        priority = mPriorityList[aTrack.TargetType()];
    }
    return priority;
  end_script
```

- **演示要点**：演示 script 的参数：int, if, else, return

### script（soj）｜脚本

- **关键词**：script, bool, int, for, return, 脚本
- **出处**：`aea_iads/platforms/soj.txt:237-249`　（同签名共 6 处，另见 `alv_routing/processors/alv_task_mgr.txt:196`、`aea_iads/platforms/soj.txt:84`、`alv_routing/processors/alv_task_mgr.txt:56`）
- **片段**：

```text
   script bool StartJammingTrack()
      bool startedJamming = false;
      int signalCount = TRACK.SignalCount();
      mSignalCountMap[TRACK.TrackId()] = signalCount;  // Update the signal count map
      for (int signalIndex = 0; signalIndex  < signalCount; signalIndex = signalIndex  + 1)
      {
         if (AddSpot(signalIndex))
         {
            startedJamming = true;
         }
      }
      return startedJamming;
   end_script
```

- **演示要点**：演示 script 的参数：bool, int, for, return

### script（aijam_processor）｜脚本

- **关键词**：script, double, if, else, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:161-173`　（同签名共 17 处，另见 `air_to_air/rules/brawler_script_util.txt:165`、`base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:163`、`brawler/platforms/alternatives/BrawlerScriptUtil.txt:163`）
- **片段**：

```text
  script double SpotSize(WsfTrack aTrack)
    double spotSize = SPOT_SIZE_DEFAULT;

    if (mSpotSize.Exists(aTrack.TargetName()))
    {
      spotSize = mSpotSize[aTrack.TargetName()];
    }
    else if (mSpotSize.Exists(aTrack.TargetType()))
    {
      spotSize = mSpotSize[aTrack.TargetType()];
    }
    return spotSize;
  end_script
```

- **演示要点**：演示 script 的参数：double, if, else, return

### script（scripts）｜脚本

- **关键词**：script, bool, string, if, return, 脚本
- **出处**：`logistics/statics_and_globals/scripts.txt:42-54`　（同签名共 2 处，另见 `orwaca_iads/weapons/sam/sam_launch_computer.txt:21`）
- **片段**：

```text
script bool gIncrementSortieCount()
   bool isDone = false;
   gSortiesCompleteCount = gSortiesCompleteCount + 1;
   string msg = "Sortie Count is now " + (string)gSortiesCompleteCount;
   gSay(msg);
   if (gSortiesCompleteCount >= gSortiesRequired)
   {
      isDone = true;
      gSay("All sorties completed.  Terminating simulation.");
      WsfSimulation.Terminate();
   }
   return isDone;
end_script
```

- **演示要点**：演示 script 的参数：bool, string, if, return

### script（aiai_processor.old）｜脚本

- **关键词**：script, if, radius, double, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:508-521`
- **片段**：

```text
  script bool AmInFormationPosition(WsfGeoPoint formationPoint, double radius)
    //make it fly to the inner 50% of the acceptable radius on re-entry
    if (!mLastInPosition)
    {
      radius = 0.5 * radius;
    }
    mLastInPosition = false;
    double range = PLATFORM.GroundRangeTo(formationPoint);
    if (range <= radius)
    {
      mLastInPosition = true;
    }
    return mLastInPosition;
  end_script
```

- **演示要点**：演示 script 的参数：if, radius, double, return

### script（common_timeline_scripts）｜脚本

- **关键词**：script, if, double, foreach, return, 脚本
- **出处**：`base_types/processors/timeline_agents/common_timeline_scripts.txt:192-206`　（同签名共 9 处，另见 `base_types/processors/quantum_agents/common/common_platform_script.txt:400`、`base_types/processors/ripr_agents/common/common_platform_script.txt:400`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:395`）
- **片段**：

```text
script WsfGeoPoint GetAssetCentroid(Array<WsfAssetPerception> ASSETS)
   if (ASSETS.Size() <= 0)
   {
      return WsfGeoPoint.Construct(0,0,0);
   }
   double coeff = 1.0/((double)ASSETS.Size());
   Vec3 wcs = Vec3.Construct(0,0,0);
   foreach (WsfAssetPerception p in ASSETS)
   {
      Vec3 vec = p.Location().LocationWCS();
      vec.Scale(coeff);
      wcs = Vec3.Add(wcs, vec);
   }
   return WsfGeoPoint.ConstructWCS(wcs);
end_script
```

- **演示要点**：演示 script 的参数：if, double, foreach, return

### script（brawler_script_util）｜脚本

- **关键词**：script, if, else, vout, return, 脚本
- **出处**：`air_to_air/rules/brawler_script_util.txt:122-137`　（同签名共 3 处，另见 `base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:120`、`brawler/platforms/alternatives/BrawlerScriptUtil.txt:120`）
- **片段**：

```text
script Vec3 rotv(double chi, Vec3 vaxis, Vec3 vin)
   Array<double> rot = Array<double>();
   if (vaxis[0]*vaxis[0] + vaxis[1]*vaxis[1] == 0.0)
   {
      Vec3 unitX = Vec3.Construct(1,0,0);
      rot = makecs(vaxis, unitX);
   }
   else
   {
      rot = makex(vaxis);
   }
   Vec3 vout = vxfrmc1(rot,vin);
   vout = rotx(-chi,vout);
   vout = vxfrmc2(rot,vout);
   return vout;
end_script
```

- **演示要点**：演示 script 的参数：if, else, vout, return

### script（common_timeline_scripts）｜脚本

- **关键词**：script, if, angle, double, return, 脚本
- **出处**：`base_types/processors/timeline_agents/common_timeline_scripts.txt:72-87`
- **片段**：

```text
script bool TurnAngleTimeAndDistance(double angle, double speed, double maxG, Array<double> TimeAndDistance)
   if (!TimeAndDistance.IsValid())
   {
      return false;
   }
   angle = MATH.Fabs(MATH.NormalizeAngleMinus180_180(angle));
   double Radius = TurnRadius(speed, maxG);
   double TurningCircleCircumference = 2.0 * MATH.PI() * Radius;
   double TurningArc = (angle/360)*TurningCircleCircumference;
   double TimeToTurn = TurningArc / speed;
   double DistanceClosed = DistanceClosedDuringTurn(angle, Radius);
   TimeAndDistance.Clear();
   TimeAndDistance.PushBack(TimeToTurn);
   TimeAndDistance.PushBack(DistanceClosed);
   return true;
end_script
```

- **演示要点**：演示 script 的参数：if, angle, double, return

### script（aiss_processor）｜脚本

- **关键词**：script, string, double, if, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiss/aiss_processor.txt:117-135`
- **片段**：

```text
   script bool TransitionEngagementState(int aJobId, string aDesiredState)
      string currentState = mJobCurrentState.Get(aJobId);

      double duration = TIME_NOW - mJobStateTimes.Get(aJobId);
      double required = mStateDurations.Get(currentState);
      if (duration < required)
      {
         return false;
      }

      mJobCurrentState.Set(aJobId, aDesiredState);
      mJobStateTimes.Set(aJobId, TIME_NOW);

      string comment = "Job " + (string)aJobId + ", " + PLATFORM.Name() + " transition -> " + aDesiredState;
      PLATFORM.Comment(comment);
      writeln_d(comment, ",  TIME = ", TIME_NOW);

      return true;
   end_script
```

- **演示要点**：演示 script 的参数：string, double, if, return

### script（behavior_pursue-target）｜脚本

- **关键词**：script, extern, foreach, if, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target.txt:118-137`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aiai/behavior_pursue_base.txt:99`、`base_types/processors/ripr_agents/aiai/behavior_pursue_base.txt:99`）
- **片段**：

```text
  script bool HaveWeaponsForThreat(WsfTrack track)
    extern bool IsWeaponDomainCapable(WsfTrack, Map<string, Object>);
    extern Array<Map<string, Object>> mWeaponArray;
    foreach (Map<string, Object> curWeapon in mWeaponArray)
    {
      WsfWeapon weapon = (WsfWeapon)curWeapon["weapon"];
      if (weapon.QuantityRemaining() > 0 &&
          IsWeaponDomainCapable(track,curWeapon))
      {
        if (curWeapon.Exists("onlyUseInRange")       &&
            (int)curWeapon["onlyUseInRange"] == 1    &&
            PLATFORM.SlantRangeTo(track) > (double)curWeapon["rangeMax"] )
        {
          continue;
        }
        return true;
      }
    }
    return false;
  end_script
```

- **演示要点**：演示 script 的参数：extern, foreach, if, return

### script（alv_weapon）｜脚本

- **关键词**：script, weapon, bool, if, return, 脚本
- **出处**：`alv_routing/weapons/alv_weapon.txt:75-95`　（同签名共 19 处，另见 `satellite_demos/scenarios/gps_denied.txt:350`、`script_demos/script_demo_2.txt:175`、`script_demos/script_demo_5.txt:230`）
- **片段**：

```text
   script bool LaunchWeapon()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      bool canInterceptNow = false;
      if (HaveWeapons())
      {
         canInterceptNow = InInterceptEnvelopeOf(weapon);
      }
      bool launched = false;
      if (canInterceptNow)
      {
         launched = FireAt(TRACK, mShootTaskStr, weapon, SALVO_SIZE);
         if (launched)
         {
            writeln("*** T=", TIME_NOW, " ", PLATFORM.Name(), " ",
                    TRACK.TargetName(), " R=", PLATFORM.SlantRangeTo(TRACK),
                    " FIRE!!!!");
         }
      }
      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：weapon, bool, if, return

### script（tap）｜脚本

- **关键词**：script, bool, if, else, return, 脚本
- **出处**：`space_operations/scripts/tap.txt:23-45`　（同签名共 10 处，另见 `base_types/processors/ripr_agents/aiss/aiss_processor.txt:244`、`logistics/processors/strike_controller.txt:183`、`ship_ad/platforms/naval_sam_tactics.txt:153`）
- **片段**：

```text
script bool TravelingAstronaut(string aCenter, Array<string> aTargets, double aCompTime, string aOperation)
   bool ok = false;

   WsfPlatform centerPlatform = WsfSimulation.FindPlatform(aCenter);
   if (!centerPlatform.IsValid())
   {
      writeln("ERROR: no platform with name ", aCenter, " is currently valid.");
   }
   else
   {
      TAPSolver ctx = {};
      ctx->Initialize(centerPlatform, aTargets, aCompTime);
      ctx->InitializeOperation(0.0, aOperation);

      ok = ctx->FindMinimum();
      if (ok)
      {
         ctx->ReportOptimalPath();
         ctx->PerformSchedule(centerPlatform);
      }
   }
   return ok;
end_script
```

- **演示要点**：演示 script 的参数：bool, if, else, return

### script（common_timeline_scripts）｜脚本

- **关键词**：script, bool, int, double, while, 脚本
- **出处**：`base_types/processors/timeline_agents/common_timeline_scripts.txt:144-166`　（同签名共 2 处，另见 `base_types/processors/timeline_agents/common_timeline_scripts.txt:168`）
- **片段**：

```text
script void SortTracksByValue(Array<WsfTrack> tracks, Array<double> values)
   if(tracks.Size() != values.Size())
      return;
   bool swapped = true;
   int j = 0;
   WsfTrack tempTrack;
   double tempValue;
   while (swapped)
   {
      swapped = false;
      j += 1;
      for (int i=0; i<(values.Size())-j; i+=1)
      {
         if (values[i] > values[i+1])
         {
            tempValue   = values[i];    tempTrack   = tracks[i];
            values[i]   = values[i+1];  tracks[i]   = tracks[i+1];
            values[i+1] = tempValue;    tracks[i+1] = tempTrack;
            swapped = true;
         }
      }
   }
end_script
```

- **演示要点**：演示 script 的参数：bool, int, double, while

### script（uav）｜脚本

- **关键词**：script, int, double, for, return, 脚本
- **出处**：`coverage_demos/scenarios/uav.txt:20-42`
- **片段**：

```text
   script WsfRoute MakeOrbit(WsfPlatform plat, WsfGeoPoint center, double r)
      WsfRoute orbit = WsfRoute();
      WsfWaypoint startPoint;
      
      int points_in_orbit = 8;
      
      double bearing_to_start = center.TrueBearingTo(plat.Location()) + 90;
      
      for (int i = 0; i < points_in_orbit; i = i + 1)
      {         
         WsfGeoPoint offsetPos = WsfGeoPoint.Construct(center.Latitude(), center.Longitude(), plat.Altitude());
         offsetPos.Extrapolate(bearing_to_start + (i * (360 / points_in_orbit)), r);
         WsfWaypoint point = WsfWaypoint.Create(offsetPos, plat.Speed());
         orbit.Append(point);
         
         if (i == 0)
         {
            startPoint = point;
         }
      }
      orbit.Append(startPoint);    
      return orbit;
   end_script
```

- **演示要点**：演示 script 的参数：int, double, for, return

### script（tactical_maneuvers）｜脚本

- **关键词**：script, double, bool, else, return, 脚本
- **出处**：`p6dof/tactical_maneuvers.txt:149-171`　（同签名共 15 处，另见 `p6dof/p6dof_types/scripts/acm_scripts.txt:101`、`six_dof/pm6_tactical_maneuvers.txt:149`、`six_dof/rb6_tactical_maneuvers.txt:149`）
- **片段**：

```text
   script bool SlicebackRollAchieved(WsfPlatform aPlatform)

      double currentRoll_deg = aPlatform.Roll();
      bool angleMet = false;

      if( targetBankAngle_deg < 0.0 )
      {
         if( currentRoll_deg <= (targetBankAngle_deg + 1) )
         {
            angleMet = true;
         }
      }
      else
      {
         if( currentRoll_deg >= (targetBankAngle_deg - 1) )
         {
            angleMet = true;
         }
      }

      return angleMet;

   end_script
```

- **演示要点**：演示 script 的参数：double, bool, else, return

### script（hel_test）｜脚本

- **关键词**：script, double, for, if, return, 脚本
- **出处**：`hel/hel_test.txt:72-95`　（同签名共 4 处，另见 `hel/intersect_mesh_test.txt:105`、`hel/intersect_mesh_test_beam_director.txt:114`、`space_operations/scripts/cascade.txt:46`）
- **片段**：

```text
   script WsfTrack FindBestTarget()
      double bestDistance = 1.0E20;
      WsfTrack missileTrack = null;
      WsfLocalTrackList tracks = PLATFORM.MasterTrackList();
      for (int i = 0; i < tracks.Count(); i=i+1)
      {
         WsfLocalTrack track = tracks.Entry(i);
         //writeln("Examining track, name ", track.TargetName());
         if (IsOK(track))
         {
            double dist = track.SlantRangeTo(PLATFORM);
            if (dist < bestDistance)
            {
               bestDistance = dist;
               missileTrack = track;
            }
         }
      }
      if (missileTrack.IsValid())
      {
         writeln("found ", missileTrack.TargetName());
      }
      return missileTrack;
   end_script
```

- **演示要点**：演示 script 的参数：double, for, if, return

### script（behavior_engage-target）｜脚本

- **关键词**：script, if, extern, string, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage-target.txt:116-140`
- **片段**：

```text
    script int GetSalvoForThreat(WsfTrack track)

        #writeln_d("checking salvo size for category: ", category);

        #WsfPlatform plat = WsfSimulation.FindPlatform( track.TargetIndex() );
        WsfPlatform plat = WsfSimulation.FindPlatform( track.TargetName() );
        if (plat.IsValid())
        {
            foreach( string aCategory : int salvo in ThreatTypeSalvo )
            {
                if( plat.CategoryMemberOf( aCategory ) )
                {
                    writeln_d("salvo for type ", aCategory, " = ", salvo);
                    return salvo;
                }
            }
        }
        extern string GetTargetDomain(WsfTrack);
        string sTargetDomain = GetTargetDomain(track);
        if ( (sTargetDomain == "LAND") || (sTargetDomain == "SURFACE") )
        {
          return DefaultGndSalvo;
        }
        return DefaultAirSalvo;
    end_script
```

- **演示要点**：演示 script 的参数：if, extern, string, return

### script（flight_lead_filtered_timeline）｜脚本

- **关键词**：script, string, double, if, else, 脚本
- **出处**：`base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:129-153`
- **片段**：

```text
   script void UpdateRiskLevel(Array<WsfTrack> knownThreats)
      string oldrisk = RISK;
      double closest = MATH.DOUBLE_MAX();
      foreach(WsfTrack threat in knownThreats)
      {
         double dist = mProtectedLocation.GroundRangeTo(threat.CurrentLocation());
         closest = MATH.Min(closest, dist);
      }
      if (closest < mHighRiskRange)
      {
         RISK = "HIGH";
      }
      else if (closest < mMediumRiskRange)
      {
         RISK = "MEDIUM";
      }
      else
      {
         RISK = "LOW";
      }
      if (oldrisk != RISK)
      {
         PLATFORM.Comment(write_str(RISK," RISK"));
      }
   end_script
```

- **演示要点**：演示 script 的参数：string, double, if, else

### script（telar_task_mgr）｜脚本

- **关键词**：script, void, string, if, else, 脚本
- **出处**：`cyber/processors/telar_task_mgr.txt:178-204`　（同签名共 2 处，另见 `orwaca_iads/processors/telar_task_mgr.txt:178`）
- **片段**：

```text
   script
      void EvaluateOperatingLevel()
      WsfSensor sensor = PLATFORM.Sensor("sr_sam_acq_radar_sensor");
      string SensorType = sensor.Type();
      if ((TasksReceived() > 0) || (OperatingLevelFor("ENGAGE") > 0))
         {
            if (SensorType == "SR_SAM_ACQ_RADAR_SENSOR")
            {
               if (OperatingLevelFor("ENGAGE") < 1)
               {
                  ChangeOperatingLevel("ENGAGE", 1);
               }
            }

         }
      else
          {
            if (SensorType == "SR_SAM_ACQ_RADAR_SENSOR")
            {
               if (OperatingLevelFor("ENGAGE") > 0)
               {
                  ChangeOperatingLevel("ENGAGE", 0);
                  #break;
               }
            }
         }
   end_script
```

- **演示要点**：演示 script 的参数：void, string, if, else

### script（observer）｜脚本

- **关键词**：script, int, double, string, if, 脚本
- **出处**：`air_to_air/observer.txt:340-367`
- **片段**：

```text
script void ImpactedGround(WsfPlatform aPlatform)
   int ac = aPlatform.Index();
   double fuel_remaining = aPlatform.FuelRemaining();
   string side = aPlatform.Side();

   if(side == "red")
   {
      if (aPlatform.CategoryMemberOf("aircraft"))
      {
         red_aircraft = red_aircraft - 1;
         total_aircraft = total_aircraft - 1;
      }
   }
   
   if(side == "blue")
   {
      if (aPlatform.CategoryMemberOf("aircraft"))
      {
         blue_aircraft = blue_aircraft - 1;
         total_aircraft = total_aircraft - 1;
      }
   }

   if (log_print)
   {
      log.Writeln(write_str(" AC  ",ac," IMPACTED GROUND.  FUEL LEVEL =     ",Format.Fixed(fuel_remaining,1)));
   }
end_script
```

- **演示要点**：演示 script 的参数：int, double, string, if

### script（red_sam_battery_tactics）｜脚本

- **关键词**：script, foreach, bool, if, return, 脚本
- **出处**：`aea_iads/processors/red_sam_battery_tactics.txt:87-117`　（同签名共 11 处，另见 `cyber/exfiltrate_demo/platforms/red_sam_battery_tactics.txt:87`、`electronic_warfare/test_false_targets/platforms/red_sam_battery_tactics.txt:87`、`iads/platforms/red_sam_battery_tactics.txt:87`）
- **片段**：

```text
   script bool LaunchWeapon()
      WsfWeapon   weapon;
      WsfPlatform platform;
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         weapon = sub.Weapon(WEAPON_NAME);
         if (weapon.IsTurnedOn() &&
             (weapon.QuantityRemaining() >= SALVO_SIZE) &&
             (TasksAssignedTo(sub, "", weapon.Name()) < 1))
         {
            bool canInterceptNow = InInterceptEnvelopeOf(ENVELOPE);
            if (canInterceptNow)
            {
               platform = sub;
               break;
            }
         }
      }
      bool launched = false;
      if ((weapon.IsValid()) && (!platform.IsNull()))
      {
         launched = Fire(TRACK, mShootTaskStr, weapon.Name(), SALVO_SIZE, platform);
         if (launched)
         {
            writeln_d("*** T=", TIME_NOW, " ", platform.Name(), " ",
                      TRACK.TargetName(), " R=", platform.SlantRangeTo(TRACK),
                      " FIRE!!!!");
         }
      }
      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：foreach, bool, if, return

### script（observer）｜脚本

- **关键词**：script, int, else, string, bool, 脚本
- **出处**：`air_to_air/observer.txt:231-268`
- **片段**：

```text
script void mslendMSL(WsfWeaponEngagement aWeaponEngagement)
   #weapon_terminated
   int shooter_index;
   int target_index;
   int weapon_index = aWeaponEngagement.WeaponPlatform().Index();
   
   if(aWeaponEngagement.TargetPlatform().IsValid())
   {
      target_index = aWeaponEngagement.TargetPlatform().Index();
   }
   else
   {
      WsfPlatform target = getDeadPlat(aWeaponEngagement,"target");
      target_index = target.AuxDataInt("platID");
   }
   
   if(aWeaponEngagement.FiringPlatform().IsValid())
   {
      shooter_index = aWeaponEngagement.FiringPlatform().Index();
   }
   else
   {
      WsfPlatform shooter = getDeadPlat(aWeaponEngagement,"shooter");
      shooter_index = shooter.AuxDataInt("platID");
   }

   string weapon_type = aWeaponEngagement.WeaponSystemType();
   bool condition = aWeaponEngagement.TargetPlatform().IsValid();
         
   if(condition == false)
   {
      if (log_print)
      {
         log.Writeln(write_str(" MSLEND...MSL ",weapon_index,"( ",weapon_type," ) VS TGT  ",target_index,
          "       TGT DEAD, TIME= ",Format.Fixed(TIME_NOW,2)));
      }
   }
end_script
```

- **演示要点**：演示 script 的参数：int, else, string, bool

### script（weapon_defs）｜脚本

- **关键词**：script, if, struct, else, return, 脚本
- **出处**：`base_types/processors/quantum_agents/common/weapon_defs.txt:70-114`　（同签名共 8 处，另见 `base_types/processors/timeline_agents/weapon_defs.txt:69`、`behavior_tree/processors/quantum_agents/common/weapon_defs.txt:69`、`brawler/processors/quantum_agents/weapon_defs.txt:91`）
- **片段**：

```text
script bool WeaponCapableAvailableAgainstThreat(WsfWeapon weapon, WsfTrack track)
   writeln_d("        checking weapon ", weapon.Name(), " valid=", weapon.IsValid());
   if (weapon.IsNull() || !weapon.IsValid() || track.IsNull() || !track.IsValid())
   {
      writeln_d("weapon or track is not valid!");
      return false;
   }
   if ((weapon.QuantityRemaining()-weapon.WeaponsPendingFor(WsfTrackId())) <= 0)
   {
      writeln_d("no unassigned weapons left to fire!");
      return false;
   }

   //check manually input user data first
   struct weaponData = GetWeaponData(weapon.Type());
   if (weaponData->type == weapon.Type())
   {
      if ((track.AirDomain()  && !weaponData->domainAir) ||
          (track.LandDomain() && !weaponData->domainLand)  )
      {
         writeln_d("weapon not capable against target domain!");
         return false;
      }
   }
   else
   {
      writeln_d("could not find weapon type ", weapon.Type() ," in weapon database; query returned type ", weaponData->type);
      //check if it has a launch computer of the necessary type
      WsfLaunchComputer lcPtr = weapon.LaunchComputer();
      if (lcPtr.IsValid())
      {
         if (track.AirDomain() && lcPtr.IsA_TypeOf("WSF_AIR_TO_AIR_LAUNCH_COMPUTER"))
         {
            return true;
         }
         else if (track.LandDomain() && lcPtr.IsA_TypeOf("WSF_ATG_LAUNCH_COMPUTER"))
         {
            return true;
         }
      }
      writeln_d("nor could an applicable launch computer be found!");
      return false;   //dont have weapon data
   }
   return true;
end_script
```

- **演示要点**：演示 script 的参数：if, struct, else, return

### script（rules_utils）｜脚本

- **关键词**：script, my, bool, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:20-66`
- **片段**：

```text
script Array<WsfLocalTrack> ill_reqd(WsfPlatform me, Array<WsfSA_EntityPerception> aBanditList, Array<WsfPlatform> g_list)
/*
PURPOSE   evaluate when or if weapons need support, create list of targets
AUTHOR   Snyder

Parameter Description
   IN  me         WsfPlatform - Platform being analyzed, loop through my flight
   IN  bg_list    Array<WsfLocalTrack> - My bad guy track list, built in fighter assess
   IN  guid_list  Array<WsfPlatform>   - List of weapons I am supporting
   OUT me->needil BOOL - True if a weapon requires my support
   OUT ill_list   Array - Array of target tracks I'm supporting weapons against
   OUT me->beans  int  - number of missiles that require my support 

Technical Description:
   Loop over all of my tracks, if there is an active weapon that I own against any one of 
   my tracks, and missile range to go is > pitbull range

TO DO: 
   -make this work for forward pass shots/third party/net enabled
   -add logic for snipping missiles or assessing to fail 
*/
   bool support = false;
   Array<WsfLocalTrack> i_list = Array<WsfLocalTrack>();


   foreach (WsfPlatform msl in g_list)
   {
      if (msl.IsNull() || !msl.IsValid()){continue;}
      WsfTrack trk = msl.CurrentTargetTrack();
      if (msl.SlantRangeTo(trk) > me->PITBULL)
      { 
         support = true ; 
         foreach (WsfSA_EntityPerception saent in aBanditList)
         {
            if (saent.Track().IsValid() && !saent.Track().IsNull() && saent.Track().Target().IsValid() 
                && saent.Track().TargetName() == trk.TargetName())
            {
               WsfLocalTrack ltrk = me.MasterTrackList().Find(saent.Track().TrackId());
               i_list.PushBack(ltrk);
            }
         }
      } 
   }
   me->beans = i_list.Size(); // total number of missiles requiring my support
   me->needil = support; // set platform global variable needil
   return i_list;
end_script
```

- **演示要点**：演示 script 的参数：my, bool, foreach, return

### script（rules_utils）｜脚本

- **关键词**：script, assumes, bool, if, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:208-255`
- **片段**：

```text
script bool spike_me(WsfPlatform me)
/*
PURPOSE   evaluate if I am spiked
AUTHOR   Snyder

Parameter Description
   IN  me         WsfPlatform - Platform being analyzed
   OUT spiked     BOOL - True if an entity is spiking me 

Technical Description:
   Loop over all of my ESM tracks, if there is a radar tracking me then I am spiked

   This routine "cheats" by assuming my esm system can type a tracking waveform
   I'f i'm tracking a radar and that radar is tracking me, then i am spiked

   assumes your esm or rwr system's name is "esm" or "rwr"

*/
   bool spiked = false;
//  loop through all my raw tracks
   if (me.MasterRawTrackList().IsValid())
   {   
      foreach (WsfTrack trk in me.MasterRawTrackList())
      {  
         if (trk.IsValid() && trk.AirDomain())
         {      
//          look at ESM tracks of radars
            if ((trk.SensorName() == "esm" || trk.SensorName() == "rwr") && trk.EmitterCount() > 0)
            {   
//              I have a track of another radar...is that radar tracking me?
               WsfPlatform target_plat = WsfSimulation.FindPlatform(trk.TargetName());
               if (!target_plat.IsValid()){continue;}
               foreach (WsfTrack ttrk in target_plat.MasterRawTrackList())
               {  
                  if ((ttrk.SensorName() == "rdr1" || ttrk.SensorMode() == "TWS" || ttrk.SensorMode() == "STT") && 
                        target_plat.Side() != me.Side() && ttrk.TargetName() == me.Name())
                  { 
                     spiked = true;
                     return spiked;
//                     writeln(target_plat.Name()," detecting ",me.Name()," via ",ttrk.SensorType()); 
                  }
               }
            }
         }
      }
   }
   return spiked;
end_script
```

- **演示要点**：演示 script 的参数：assumes, bool, if, return

### script（anti_ballistic_missile_processor）｜脚本

- **关键词**：script, bool, int, if, return, 脚本
- **出处**：`ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:177-225`　（同签名共 2 处，另见 `orwaca_iads/platforms/iads_cmdr.txt:116`）
- **片段**：

```text
   script bool ScheduleTheLaunch()
      bool LaunchScheduled = false;
      // Am I at my max engagement level?
      int myAssignments = GetMyAssignments();
      if (myAssignments >= MAX_ENGAGEMENTS)
      {
        return false;
      }
      // Check to see if another battery is engaging the target
      if (AssignedTrackNames.Exists(TRACK.TargetName()) && AssignedTrackNames.Get(TRACK.TargetName()) != PLATFORM.Name())
      {
         return false;
      }

         if ((TRACK.IsValid()) && (LaunchFutureTimeMap[TRACK.TrackId()] - TIME_NOW < (LAUNCH_DELAY + 5)))
         {
             if(SUBS_HAVE_WEAPONS)
             {
             WsfPlatform       sub = SubordinateLauncherMap[TRACK.TrackId()]; # Get the subordinate that we found
             WsfLaunchComputer computer = sub.Weapon(WEAPON_NAME).LaunchComputer();
             #computer.ComputeEndPoint();  # This is only needed to see where I will land if i miss...
                if (computer.CanIntercept(TRACK, LAUNCH_DELAY))
                {
                   LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                   ExecuteAtTime(computer.LaunchTime(),  "Launch", {TRACK.TrackId(), SALVO_SIZE});
                   LaunchScheduled = true;
                   #return LaunchScheduled;
                }
             }
             else
             {
                WsfLaunchComputer computer = PLATFORM.Weapon(WEAPON_NAME).LaunchComputer();
                #computer.ComputeEndPoint();
                if (computer.CanIntercept(TRACK, LAUNCH_DELAY) )
                {
                   LaunchFutureTimeMap[TRACK.TrackId()] = computer.LaunchTime();
                   ExecuteAtTime(computer.LaunchTime(),  "Launch", {TRACK.TrackId(), SALVO_SIZE});
                   LaunchScheduled = true;
                   #return LaunchScheduled;
                }
             }
         }
         //Update the map and put my assignment in it.
         if (LaunchScheduled && !AssignedTrackNames.Exists(TRACK.TargetName()))
         {
            AssignedTrackNames[TRACK.TargetName()] = PLATFORM.Name();
         }
      return  LaunchScheduled;
   end_script
```

- **演示要点**：演示 script 的参数：bool, int, if, return

### script（rules_utils）｜脚本

- **关键词**：script, for, if, foreach, return, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:1037-1103`
- **片段**：

```text
script Array<int> count_shot(WsfPlatform me, WsfSA_EntityPerception saent, Array<WsfSA_EntityPerception> bg_list)
/*
PURPOSE   replicates brawler count_shot routine (local to EZJA)  
AUTHOR   Snyder

Parameter Description
   IN  me       - Platform being analyzed
   IN  ltrk     - desired track object to test against
   IN  bg_list  - Array of local track objects of hostiles
Technical Description:
   returns: [0] number of missiles launched at specified threat by anyone (tgtd_ihost)
            [1] number of missiles I have launched at specified threat (num_i_shot)
            [2] total number of missiles I have in the air right now (num_in_air)

   This assumes perfect correlation/CID 

*/
   Array<int> output = {0,0,0};
   WsfSA_Processor saPROC;
   for (int i=0; i<me.ProcessorCount(); i+=1)
   {
      if (me.ProcessorEntry(i).IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         saPROC = (WsfSA_Processor)me.ProcessorEntry(i);
         break;
      }
   }
   if (saent.Track().IsValid())
   {
      output[0] = me.WeaponsActiveFor(saent.Track().TrackId()); // start w/ how many I've shot at hostile
      // loop through all my percieved assets and see if they have launched missiles at specified
      // hostile, this is assuming you would be aware of asset missile launches (voice comms, datalink, etc)
      for (int i = 0; i < saPROC.PerceivedAssets().Size(); i+=1)
      {  
         WsfSA_EntityPerception asset = saPROC.PerceivedAssets()[i];
         WsfPlatform buddy = WsfSimulation.FindPlatform(asset.PerceivedName());
         if (!buddy.IsValid()) {continue;} 
         for (int i=0; i<buddy.ProcessorCount(); i+=1)
         {
            if (buddy.ProcessorEntry(i).IsA_TypeOf("WSF_SA_PROCESSOR"))
            {
               WsfSA_Processor bsaPROC = (WsfSA_Processor)buddy.ProcessorEntry(i);
               foreach (WsfSA_EntityPerception b_saent in bsaPROC.PerceivedBandits())
               {  
                  if (saent.PerceivedName() == b_saent.PerceivedName() && b_saent.Track().IsValid())
                  {
                     output[0] = output[0] + buddy.WeaponsActiveFor(b_saent.Track().TrackId());  
                  }
               }      
            }      
         }
      }

      // number of weapons active against specified threat
      output[1] = me.WeaponsActiveFor(saent.Track().TrackId()); // final value of this variable 
   }
   // loop through all my hostile tracks and add up total number of missiles I've launched
   output[2] = 0;
   foreach (WsfSA_EntityPerception ent in bg_list)
   { 
      if (ent.Track().IsValid())
      {
         output[2] = output[2] + me.WeaponsActiveFor(ent.Track().TrackId()); 
      }
   }
   return output;   
end_script
```

- **演示要点**：演示 script 的参数：for, if, foreach, return

### script（observer）｜脚本

- **关键词**：script, int, else, string, if, 脚本
- **出处**：`air_to_air/observer.txt:270-338`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiss/aiss_processor.txt:642`）
- **片段**：

```text
script void FiredAt(WsfWeaponEngagement aWeaponEngagement, WsfTrack aTargetTrack)
   #weapon_fired
   WsfPlatform target, shooter;
   int target_index, shooter_index;
   WsfPlatform weapon = aWeaponEngagement.WeaponPlatform();
   int weapon_index = weapon.Index();

   if(aWeaponEngagement.TargetPlatform().IsValid())
   {
      target = aWeaponEngagement.TargetPlatform();
      target_index = target.Index();
   }
   else
   {
      target = getDeadPlat(aWeaponEngagement,"target");
      target_index = target.AuxDataInt("platID");
   }
   
   if(aWeaponEngagement.FiringPlatform().IsValid())
   {
      shooter = aWeaponEngagement.FiringPlatform();
      shooter_index = shooter.Index();
   }
   else
   {
      shooter = getDeadPlat(aWeaponEngagement,"shooter");
      shooter_index = shooter.AuxDataInt("platID");
   }

   msl_sht_tgt.PushBack(weapon_index);
   msl_sht_tgt.PushBack(shooter_index);
   msl_sht_tgt.PushBack(target_index);
   
   string weapon_name = aWeaponEngagement.WeaponPlatformName();
   string weapon_type = aWeaponEngagement.WeaponSystemType();
   
   if (log_print)
   {
      log.Writeln(write_str(" MISSILE ",weapon_name," ( ",weapon_type," ) FIRED AT ",target_index,"      BY  ",
      shooter_index," AT TIME ",Format.Fixed(TIME_NOW,2)));
      log.Writeln(write_str("         RANGE  =  ",Format.Fixed(shooter.SlantRangeTo(target)*MATH.NM_PER_M(),1)," nmi,   ASPECT =  ",
       Format.Fixed(target.RelativeBearingTo(shooter),1)," deg,   OBA =  ",Format.Fixed(shooter.RelativeBearingTo(target),1)," deg"));
      #CJV - Need to actually do LAUNCH MODE
      log.Writeln(write_str("         LAUNCH MODE=CMD_GUIDED_DES_RDR "));
      log.Writeln(write_str("         AZIMUTH = ",Format.Fixed(target.RelativeBearingTo(shooter) - 180,1),
       " deg, ELEVATION = ",Format.Fixed(MATH.ASin((target.Altitude() - shooter.Altitude()) / 
       shooter.SlantRangeTo(target)),1)," deg"));
      log.Writeln(write_str("         LAUNCHER POSITION: X= ",Format.Fixed(Get_X(origin,shooter.Location()),1),
       " Y= ",Format.Fixed(Get_Y(origin,shooter.Location()),1),
       " Z= ",Format.Fixed(shooter.Altitude()*MATH.FT_PER_M(),1)," MACH= ",Format.Fixed(shooter.MachNumber(),2)," "));
      log.Writeln(write_str("         LAUNCHER MACH: ",Format.Fixed(shooter.MachNumber(),2),
       "  ALTITUDE: ",Format.Fixed(shooter.Altitude()*MATH.FT_PER_M(),2)));
      log.Writeln(write_str("         TARGET MACH: ",Format.Fixed(target.MachNumber(),2),
       "    ALTITUDE: ",Format.Fixed(target.Altitude()*MATH.FT_PER_M(),1)));
      #CJV - Need to actually do LAUNCHING, ILLUMINATING, and DATALINK
#     log.Writeln(write_str("         LAUNCHING A/C= ",shooter_index," ILLUMINATING A/C= ",shooter_index," A/C PROVIDING DATALINK= ",shooter_index));
      #CJV - Need to actually do GUIDANCE CONFIGURATION
      log.Writeln(write_str("         GUIDANCE CONFIGURATION = NORMAL"));
      log.Writeln(write_str("         PERCEPTION ERROR: RNG ERR= ",Format.Fixed((MATH.Fabs(shooter.SlantRangeTo(aTargetTrack) - 
       shooter.SlantRangeTo(target))*MATH.FT_PER_M())*MATH.FT_PER_M(),1)," ft, ASPECT ERR = ",
       Format.Fixed(MATH.Fabs(MATH.Fabs(shooter.RelativeBearingTo(target))
       - MATH.Fabs(shooter.RelativeBearingTo(aTargetTrack))),1)," deg, OBA ERR = ",
       Format.Fixed(MATH.Fabs(MATH.Fabs(target.RelativeBearingTo(shooter))
       - MATH.Fabs(aTargetTrack.RelativeBearingTo(shooter))),1)," deg"));
      log.Writeln(write_str("         SHOT AZ & ELEV IN TGT BODY AXIS (DEG,DEG)   ",
       Format.Fixed(target.RelativeBearingTo(shooter) - 180,1),"   ",
       Format.Fixed(MATH.ASin((target.Altitude() - shooter.Altitude()) / shooter.SlantRangeTo(target)),1)));
   }
end_script
```

- **演示要点**：演示 script 的参数：int, else, string, if

### script（gci_quantum_tasker）｜脚本

- **关键词**：script, foreach, int, for, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aigci/gci_quantum_tasker.txt:77-146`　（同签名共 2 处，另见 `timeline/processors/quantum_agents/aigci/gci_quantum_tasker.txt:92`）
- **片段**：

```text
      script Array<WsfQuantumTask> GciCommanderTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )

         //create weapon tasks for enemy track groups (clusters)
         Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();
         writeln_d(PLATFORM.Name(), " executing GciCommanderTaskGeneration(), T=", TIME_NOW);

         ##########################################################################
         ##   update the cluster manager with the current master track list
         ##########################################################################
         WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
         Array<WsfTrack> trackArray = Array<WsfTrack>();
         foreach (WsfLocalTrack lt in localTracks)
         {
            if (mRequireTasking == true && TasksReceivedForTarget(lt.TrackId()).Count() <= 0)
            {
               continue;
            }
            if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
            {
               lt.SetBearing( lt.Heading() );  #useful for the cluster processing
               trackArray.PushBack(lt);
            }
         }
         cManager.UpdateClusters(TIME_NOW,trackArray);

         ##########################################################################
         ##  generate a task for each clusters
         ##########################################################################
         int NumClusters = cManager.Count();
         for (int i = 0; i < NumClusters; i = i + 1 )
         {
            WsfCluster cluster = cManager.Entry(i);
            int clusterId = cluster.Id();

            if (mDrawClusters == true)
            {
               draw_cluster_hull(cluster);
            }

            if( cluster.Count() > 0 )
            {
               double ClusterPriority = mClusterJobPriority;
               if (ClusterPriority <= 0)
               {
                  ClusterPriority = (double)cluster.Count();
               }
               WsfQuantumTask qt = WsfQuantumTask.Construct(ClusterPriority, "CLUSTER", cluster.Entry(0));   //include a track with the task
               qt.SetTaskType("CLUSTER");
               qt.UniqueId(cluster.Id());
               qt.SetAuxData( "clusterIndex", i );   //for evaluation below
               //TODO local tracks in the quantum task???
               qt.SetAuxData( "maxPerformers", mMaxTaskPerformers );
               qt.SetAuxData( "clusterId", cluster.Id() );
               qt.SetAuxData( "ClusterMeanPoint", WsfGeoPoint(cluster.MeanLocation()) );
               qt.SetAuxData( "ClusterBearing", cluster.Bearing() );
               qt.SetAuxData( "ClusterBearingValid", cluster.BearingValid() );
               qt.SetAuxData( "ClusterNumMembers", cluster.Count() );
               Array<string> arr = Array<string>();
               for (int i = 0; i < cluster.Count(); i = i + 1 )
               {
                  arr.PushBack(cluster.Entry(i).TargetName());
                  writeln_d("job cluster member: ", cluster.Entry(i).TargetName());
               }
               qt.SetAuxData( "ClusterMemberNames", arr );
               tasks.PushBack(qt);
               writeln_d("cluster task generated for: ", cluster.Id());
            }
         }
         return tasks;
      end_script
```

- **演示要点**：演示 script 的参数：foreach, int, for, return

### script（tapsolver）｜脚本

- **关键词**：script, bool, if, while, return, 脚本
- **出处**：`space_operations/scripts/tapsolver.txt:203-274`
- **片段**：

```text
   script bool FindMinimum()
      bool hasMin = false;
      bool first = true;

      if (skipBound)
      {
         writeln("{");
         writeln("  \"routes\": [");
      }

      while (!SearchDone())
      {
         Schedule P = PopSearchRoute();
         Array<Schedule> branches = BranchSchedule(P);

         for (int i = 0; i < branches.Size(); i += 1)
         {
            if (!skipBound)
            {
              writeln("I am computing the delta for: ", branches[i]->RouteText());
            }
            bool hasSolution = ComputeRouteStep(branches[i]);

            // If this branch is not above the bound, add it to consideration
            if (hasSolution && (skipBound || branches[i]->DeltaV() < deltaVMin))
            {
               PushSearchRoute(branches[i]);

               // Further, if is a complete path, it must be the new minimum
               if (branches[i]->Complete())
               {
                  if (skipBound)
                  {
                     branches[i]->DetailedOutput(first);
                     first = false;
                  }
                  else
                  {
                     writeln("Complete path: ", branches[i]->RouteText(),
                             " has values: (", branches[i]->DeltaV(), ", ", branches[i]->DeltaT(), ")");
                  }

                  if (branches[i]->DeltaV() < deltaVMin)
                  {
                     deltaVMin = branches[i]->DeltaV();
                     deltaTMin = branches[i]->DeltaT();
                     scheduleMin = branches[i];                        // save the new min
                     hasMin = true;
                     if (!skipBound)
                     {
                        writeln("Found a new minimum: ", deltaVMin);
                     }
                  }
               }
            }
            else
            {
               writeln("Dropping branch.");
            }
         }
      }

      DeleteProxies();

      if (skipBound)
      {
         writeln("  ]");
         writeln("}");
      }

      return hasMin;
   end_script
```

- **演示要点**：演示 script 的参数：bool, if, while, return

### script（acm_scripts）｜脚本

- **关键词**：script, string, else, double, int, 脚本
- **出处**：`p6dof/p6dof_types/scripts/acm_scripts.txt:637-724`　（同签名共 4 处，另见 `six_dof/scripts/acm_scripts.txt:637`、`p6dof/p6dof_types/scripts/acm_scripts.txt:726`、`six_dof/scripts/acm_scripts.txt:726`）
- **片段**：

```text
script void DetermineBestTargetToAttack()

   string goodSide = PLATFORM.Side();
   string badSide = "red";

   if(goodSide == "blue")
   {
      badSide = "red";
   }
   else if(goodSide == "red")
   {
      badSide = "blue";
   }
   else
   {
      // Neutral
      offensiveTargetPlatformName = "NONE";
      offensiveScore = 0.0;
      return;
   }

   string bestTargetName = "NONE";
   double bestTargetRange_m = 1000000000.0;

   // Loop through targets
   int numPlatforms = WsfSimulation.PlatformCount();
   for( int i = 0 ; i < numPlatforms ; i += 1 )
   {
       WsfPlatform platform = WsfSimulation.PlatformEntry(i);

       if( platform.Side() == badSide )
       {
          double closingSpeed_mps = PLATFORM.ClosingSpeedOf(platform);
          double range_m = PLATFORM.SlantRangeTo(platform);
          double relBearing_deg = PLATFORM.RelativeBearingTo(platform);
          double aspectToTarget_deg = platform.RelativeBearingTo(PLATFORM);
          double tgtSpeed_mps = platform.Speed();
          double ownshipSpeed_mps = PLATFORM.Speed();

          // Confirm not dead
          double damage = platform.DamageFactor();
          bool validTgt = platform.IsValid();

          if( !validTgt || (damage > 99.0))
          {
             writeln("!!! T=", TIME_NOW, " Missile dropped track (WSF_DROP_TRACK_MESSAGE)");
             continue;
          }

          if(range_m < bestTargetRange_m)
          {
             bestTargetName = platform.Name();
             bestTargetRange_m = range_m;
          }
       }
   }

   if(bestTargetName != "NONE")
   {
      offensiveTargetPlatformName = bestTargetName;
      if(bestTargetRange_m < 200000.0)
      {
         // Very long range
         offensiveScore = 10.0;
      }
      else if(bestTargetRange_m < 100000.0)
      {
         // Long range
         offensiveScore = 100.0;
      }
      else if(bestTargetRange_m < 30000.0)
      {
         // Medium range
         offensiveScore = 200.0;
      }
      else if(bestTargetRange_m < 10000.0)
      {
         // Short range
         offensiveScore = 500.0;
      }
      else if(bestTargetRange_m < 2000.0)
      {
         // Gun range
         offensiveScore = 1000.0;
      }
   }

end_script
```

- **演示要点**：演示 script 的参数：string, else, double, int

### script（observer_bullseye）｜脚本

- **关键词**：script, extern, double, int, foreach, 脚本
- **出处**：`ciws/observer_bullseye.txt:23-112`
- **片段**：

```text
script void WeaponTerminated(WsfWeaponEngagement aWeaponEngagement) 
   extern  Array<Vec3>  HitLocations;
   extern  Array<Vec3> ApparentLaunchLocations;
   extern  double    FirstRadius;
   extern  WsfDraw   BullDraw; #draw the bullseyes
   extern  WsfDraw HitDraw;
   extern int  ShotNum;
      
   WsfPlatform Weapon = aWeaponEngagement.WeaponPlatform();
   WsfPlatform FiringPlatform =  aWeaponEngagement.FiringPlatform();
   WsfPlatform TargetPlatform = aWeaponEngagement.TargetPlatform();
   double MissDistanceToTarget = aWeaponEngagement.MissDistance(TargetPlatform);
   WsfGeoPoint TargetLocationAtLaunch = aWeaponEngagement.TargetLocationAtLaunch();
   WsfGeoPoint WeaponLocationAtLaunch = aWeaponEngagement.WeaponLocationAtLaunch();
   double WeaponRange = TargetLocationAtLaunch.SlantRangeTo(WeaponLocationAtLaunch);

   WsfGeoPoint TargetLocation = aWeaponEngagement.TargetLocation(TargetPlatform);
   double ElevationAngle = TargetPlatform.RelativeElevationOf(FiringPlatform.Location());

   WsfGeoPoint WeaponLocation = aWeaponEngagement.WeaponLocation();
   Vec3 WeaponLocWCS = WeaponLocation.LocationWCS();  
   Vec3 MissECS = TargetPlatform.ConvertWCSToECS(WeaponLocWCS);
   HitLocations.PushBack(MissECS); # Save the hitlocation vector in the array.
   
   Vec3 Velocities3D  = Vec3.Subtract(Weapon.VelocityWCS(),TargetPlatform.VelocityWCS());
   double ImpactSpd = Velocities3D.Magnitude();
   double KEnergyJoules = .5 * 0.671 * (ImpactSpd * ImpactSpd); # In Joules
   double FtLbs = KEnergyJoules * 0.737562; 
   writeln(TIME_NOW , " Name ", Weapon.Name(),  
           " RangeAtLaunch ", WeaponRange ," MissDistanceToTarget ", 
           MissDistanceToTarget, " HIT/MISS ",aWeaponEngagement.Pk(), " MissECS ", MissECS, " " ,           
            " WeapSpeed " , Weapon.Speed(), " TargetSpeed " , TargetPlatform.Speed(),
           " ImpactSpeed " , ImpactSpd, " ", KEnergyJoules, " Joules ", FtLbs, " FootPounds ");
   
   //save off the apparent launcher location when it got hit
   WsfGeoPoint launcherlocation = FiringPlatform.Location();
   Vec3 WeaponLaunchLocationWCS = launcherlocation.LocationWCS();
   Vec3 LauncherVertexECS = TargetPlatform.ConvertWCSToECS(WeaponLaunchLocationWCS);
   #writeln("launcher eECS position ", LauncherVertexECS);
   ApparentLaunchLocations.PushBack(LauncherVertexECS);
   
   if(Weapon.Index() == ShotNum)
   {
   BullDraw.SetDuration(100); 
   BullDraw.SetEllipseMode("fill");
   
   // Draw the bullseyes from the outside in or else the little circles get overridden
   BullDraw.BeginEllipsoid(TargetPlatform.Heading(),ElevationAngle,0,.1,FirstRadius*4,FirstRadius*4);   
   BullDraw.SetColor(0,1,0,.3);  
   BullDraw.Vertex(TargetPlatform);
   BullDraw.End();   
     
   BullDraw.BeginEllipsoid(TargetPlatform.Heading(),ElevationAngle,0,.1,FirstRadius*3,FirstRadius*3);
   BullDraw.SetColor(0,0,1,.4);  
   BullDraw.Vertex(TargetPlatform);
   BullDraw.End();   
   
   BullDraw.BeginEllipsoid(TargetPlatform.Heading(),ElevationAngle,0,.1,FirstRadius*2,FirstRadius*2);   
   BullDraw.SetColor(0,1,0,.5);  
   BullDraw.Vertex(TargetPlatform);
   BullDraw.End();      
   
   BullDraw.BeginEllipsoid(TargetPlatform.Heading(),ElevationAngle,0,.1,FirstRadius,FirstRadius);   
   BullDraw.SetColor(1,0,0,.6); 
   BullDraw.Vertex(TargetPlatform);
   BullDraw.End();

   HitDraw.SetDuration(100);
   int counter = 0;
   foreach (Vec3 MissECS in HitLocations)    
   {
      HitDraw.BeginEllipsoid(TargetPlatform.Heading(),0,0,.07,.07,.07);
      HitDraw.SetColor(1,0,0,0.999); #RED
      // The +.25 offsets the point just in front of the bullseye
      HitDraw.VertexECS(TargetPlatform, MissECS.X()+.25,MissECS.Y(),MissECS.Z());      
      HitDraw.End();
      
      if (DrawTrajectory == true)
      {
         Vec3 LocationOfLauncher = ApparentLaunchLocations[counter];
         HitDraw.BeginLines();
            // The +.25 offsets the point just in front of the bullseye
            HitDraw.VertexECS(TargetPlatform, MissECS.X()+.25,MissECS.Y(),MissECS.Z());
            HitDraw.VertexECS(TargetPlatform, LocationOfLauncher.X(),LocationOfLauncher.Y(),LocationOfLauncher.Z());
         HitDraw.End();
      }
      counter = counter+1;
   }
  }    
end_script
```

- **演示要点**：演示 script 的参数：extern, double, int, foreach

### script（aifl_processor.old）｜脚本

- **关键词**：script, foreach, if, string, else, 脚本
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:120-230`
- **片段**：

```text
  script void CreateJobsIndependently()

    WsfLocalTrackList localTracks = PLATFORM.MasterTrackList();
    Map<string, int> updatedTracks = Map<string, int>();

    WsfPlatform escortPlatform = WsfSimulation.FindPlatform( mEscortName );

    writeln_d("    Flight Lead, Considering Num Tracks: ", localTracks.Count() );

    foreach (WsfTrack x in localTracks)
    {
      //writeln_d("    Considering: ", x.TargetName());
      WsfTrackId tid = x.TrackId();
      writeln_d("    Considering: ", tid.Name(), ".", tid.Number(), " -> ", x.TargetName());
      updatedTracks.Set(x.TargetName(), 0);

      // if the track is not a foe or is damaged, we'll ignore it
      if (!(x.IsValid())) // || !x.IFF_Foe())// || x.TargetDamaged() > 0)
      {
        writeln_d("!!! Need to remove track: ", !(x.IsValid()), ", ", !x.IFF_Foe(), ", ", x.TargetDamaged() > 0);
        continue;
      }

     #extern string DetermineTrackCategory(WsfTrack);
      string category = DetermineTrackCategory(x);

      if (category == "unknown")
      {
        writeln_d("    - Unknown type: ", x.TargetName(), " - ", x.TargetType() );
        continue;
      }
      if (ThreatTypeEngageZone.Exists(category) && ThreatTypeEngageZone[category].Length()>0)
      {
        writeln_d(PLATFORM.Name(), " checking target ", x.TargetName(), " in zone ", ThreatTypeEngageZone[category]);
        if ( ! x.CurrentLocation().WithinZone(ThreatTypeEngageZone[category]))
        {
          writeln_d("aifl ", PLATFORM.Name(),", target ", x.TargetName(), " outside of category ", category," zone ", ThreatTypeEngageZone[category], ".  not considering for a job.");
          continue;
        }
        else
        {
          writeln_d("aifl ", PLATFORM.Name(),", target ", x.TargetName(), " inside category ", category," zone ", ThreatTypeEngageZone[category], ".  updating job!!!");
        }
      }
      else
      {
        writeln_d(PLATFORM.Name(), " no zone to check for category ", category);
      }

      updatedTracks.Set(x.TargetName(), 1);
      if ( ! mTrackJobMap.Exists(x.TargetName()) )
      {
        double jobPriority = cPursueTargetPriority;
        if( escortPlatform.IsValid() )
        {
          jobPriority = cPursueTargetPriority / (1 + x.SlantRangeTo( escortPlatform ) );
        }

        WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                             "pursue-target",
                                             "pursue-target-" + x.TargetName(),
                                             jobPriority,
                                             maxJobWinnersForPursueTrack);

        writeln_d("    - Setting targetTrack, name: ", x.TargetName());
        temp.SetData("targetTrack", x);
        temp.SetData("targetTrackName", x.TargetName());
        writeln_d("    - Adding job");
        AddJob(temp);
        mTrackJobMap.Set(x.TargetName(), temp);

        //writeln_d("    - Creating job pursue-target-", x.TargetName());
        writeln_d("--- ", PLATFORM.Name(), " job change, ADD: ", x.TargetName() );

        string NewComment = "AIFL - new job: " + temp.Name() + " - " + temp.GetDescription();
        PLATFORM.Comment(NewComment);
      }
      else
      {
        if( escortPlatform.IsValid() )
        {
          double jobPriority = cPursueTargetPriority / (1 + x.SlantRangeTo( escortPlatform ) );
          WsfRIPRJob updateJob = mTrackJobMap.Get( x.TargetName() );
          updateJob.Priority( jobPriority );
        }
      }


    }
    Array<WsfRIPRJob> jobs = GetJobs();
    foreach (WsfRIPRJob x in jobs)
    {
      Map<string, Object>tempData = x.GetData();
      string name = (string)tempData["targetTrackName"];

      if (updatedTracks[name] == 0)
      {
        if (mTrackJobMap[name].IsValid())
        {
           //writeln_d("    - Removing non-updated track: ", name);
           string temp = write_str("--- ", PLATFORM.Name(), " job change, REMOVE: ", mTrackJobMap[name].Name());
           writeln_d(temp);
           PLATFORM.Comment(temp);
           RemoveJob(mTrackJobMap[name]);
           mTrackJobMap.Erase(name);
        }
      }
    }
    writeln_d("    - mTrackJobMap.Size() = ", mTrackJobMap.Size());

  end_script
```

- **演示要点**：演示 script 的参数：foreach, if, string, else

### script（behavior_engage-target）｜脚本

- **关键词**：script, bool, extern, if, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_engage-target.txt:468-597`
- **片段**：

```text
   script bool FireWeapon(WsfTrack targetTrack)
      bool launched = false;

      writeln_d("   Time= ", TIME_NOW, "   Attempting a shot against: ", targetTrack.TargetName(), " Index: ", targetTrack.TargetIndex(), " Type: ", targetTrack.TargetType());

      extern bool TestTrackCategory(WsfTrack, string);
      if (!TestTrackCategory(targetTrack, "unknown") &&
          targetTrack.BelievedAlive())
      {
         if ((((WsfRIPRProcessor)PROCESSOR).WeaponsActive(targetTrack) > 0) ||
             (((WsfRIPRProcessor)PROCESSOR).PeersWeaponsActive(targetTrack) > 0))
         {
            mTrackWeaponActiveMap[targetTrack.TargetName()] = TIME_NOW;
            writeln_d("         FAIL: Weapons already active against ", targetTrack.TargetName());
            return launched;
         }
         else
         {
            writeln_d("no weapons active against target ", targetTrack.TargetName());
         }

         if ((TIME_NOW - mTrackWeaponActiveMap[targetTrack.TargetName()]) < mInactiveLaunchDelay)
         {
            writeln_d("         FAIL: Waiting to see what last active weapon did, score a kill?");
            return launched;
         }

         // if this is a ttr, it should ignore the check for coop engage one
         if (targetTrack.CheckAuxData("notlocal") == false)
         {
            if (mCoopEngageOne == false)
            {
               WsfLocalTrack targetLocalTrack = (WsfLocalTrack)targetTrack;
               if (targetLocalTrack.IsValid())
               {
                  if(!targetLocalTrack.ContributorOf(PLATFORM) &&
                     !targetLocalTrack.IsPredefined())
                  {
                     writeln_d("         FAIL: Not able to coop engage! ", PLATFORM.Name(), " targeting ",targetTrack.TargetName(), ".  NumContributors: ", targetLocalTrack.NumContributors()  );
                     return launched;
                  }
               }
            }
            else if (mCoopEngageOneFlightOnly == true)
            {
               //check if this platform needs somebody in his flight to have track on the target
               WsfLocalTrack targetLocalTrack = (WsfLocalTrack)targetTrack;
               if (targetLocalTrack.IsValid())
               {
                  if (targetLocalTrack.IsPredefined())
                  {
                     //its fine, go ahead & shoot
                  }
                  else
                  {
                     bool OkToShoot = false;
                     Array<WsfPlatform> peers = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor().SubordinatePlatforms();
                     foreach (WsfPlatform peer in peers)
                     {
                        if(targetLocalTrack.ContributorOf(peer))
                        {
                           OkToShoot = true;
                           break;
                        }
                     }
                     if (!OkToShoot)
                     {
                        writeln_d("         FAIL: Cant engage tracks not supported by flight group! ", PLATFORM.Name(), " targeting ", targetTrack.TargetName(), ".");
                        return launched;
                     }
                  }
               }
            }
         }

         // We can launch once we have a target-quality track.
         //TODO probably need something to test for failure to lockon
         writeln_d ("    targetTrack.TrackQuality == ", targetTrack.TrackQuality());

         if (targetTrack.TrackQuality() < GetRequiredTrackQualityForThreat(targetTrack))
         {
            writeln_d("         FAIL: track quality not good enough to fire on target");
            return launched;
         }

         string selectedWeapon = GetWeaponForThreat(PLATFORM, targetTrack);    #checks domain & kinematic capability, & valid quantity remaining

         if (selectedWeapon == "")
         {
               writeln_d("         FAIL: No domain capable weapon within range available!");
               return launched;
         }

         WsfWeapon weaponToLaunch = PLATFORM.Weapon(selectedWeapon);

         //writeln_d("         using a conventional weapon!");
         extern Array<Map<string, Object>> mWeaponArray;
         extern int GetWeaponNumberActiveMax(string, Array<Map<string, Object>>);
         int maxActiveOfType = GetWeaponNumberActiveMax(selectedWeapon,mWeaponArray);
         int curActiveOfType = ((WsfRIPRProcessor)PROCESSOR).WeaponsActiveOfType(weaponToLaunch);
         if (MustShootAt(targetTrack))
         {
            curActiveOfType = maxActiveOfType - 1;
         }
         if (curActiveOfType >= maxActiveOfType)
         {
               writeln_d("         FAIL: Max number(", maxActiveOfType,") of ", selectedWeapon, " weapon type are already active! (", curActiveOfType,")");
               return launched;
         }

         int salvoCount = GetSalvoForThreat(targetTrack);
         writeln_d("         salvo count for ", targetTrack, " is: ", salvoCount);

         extern bool            LaunchWeapon(WsfPlatform, WsfTrack,    WsfWeapon,      int);
         launched = LaunchWeapon(PLATFORM,    targetTrack, weaponToLaunch, salvoCount);

         writeln_d("    launched == ", launched, ", weapon: ", selectedWeapon);
         if (launched == true)
         {
            double dPreviousRoundsFiredAt = mRoundsFiredAtMap.Get(targetTrack);
            mRoundsFiredAtMap.Set(targetTrack,dPreviousRoundsFiredAt + salvoCount);
            string msg = "Shot at: " + targetTrack.TargetName();
            PLATFORM.Comment(msg);
            writeln_d("         SUCCESS: ", PLATFORM.Name(), " ", msg);
         }
         return launched;
      }

      return launched;
   end_script
```

- **演示要点**：演示 script 的参数：bool, extern, if, return

### script（telar_task_mgr）｜脚本

- **关键词**：script, int, quantity, return, 脚本
- **出处**：`cyber/processors/telar_task_mgr.txt:132-136`　（同签名共 2 处，另见 `orwaca_iads/processors/telar_task_mgr.txt:132`）
- **片段**：

```text
   script int TotalWeaponsAvailable()
      int quantity = 0;
      quantity = quantity + WeaponsAvailable(PLATFORM);
      return quantity;
   end_script
```

- **演示要点**：演示 script 的参数：int, quantity, return

### script（report_writes）｜脚本

- **关键词**：script, int, if, return, 脚本
- **出处**：`aea_iads/report_writes.txt:123-130`　（同签名共 21 处，另见 `aea_iads/report_writes.txt:132`、`space_operations/scenarios/starlink_generator.txt:51`、`space_operations/scenarios/starlink_generator.txt:62`）
- **片段**：

```text
script int FindNameId(string aName)
   int id = 0;
   if (mSystemNameToId.Exists(aName))
   {
      id = mSystemNameToId[aName];
   }
   return id;
end_script
```

- **演示要点**：演示 script 的参数：int, if, return

### script（anti_ballistic_missile_processor）｜脚本

- **关键词**：script, bool, if, return, 脚本
- **出处**：`ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:75-82`　（同签名共 48 处，另见 `space_operations/processors/anti_ballistic_missile_processor.txt:51`、`alv_routing/weapons/alv_weapon.txt:65`、`laser_designator/platforms/uav.txt:83`）
- **片段**：

```text
   script bool WeaponQualityTrack()
      bool weaponQualityTrack = false;
      if (TRACK.TrackQuality() > REQUIRED_TRACK_QUALITY)
      {
         weaponQualityTrack = true;
      }
      return weaponQualityTrack;
   end_script
```

- **演示要点**：演示 script 的参数：bool, if, return

### script（red_sam_battery_tactics）｜脚本

- **关键词**：script, int, foreach, return, 脚本
- **出处**：`aea_iads/processors/red_sam_battery_tactics.txt:142-149`　（同签名共 7 处，另见 `cyber/exfiltrate_demo/platforms/red_sam_battery_tactics.txt:142`、`electronic_warfare/test_false_targets/platforms/red_sam_battery_tactics.txt:142`、`iads/platforms/red_sam_battery_tactics.txt:142`）
- **片段**：

```text
   script int TotalWeaponsAvailable()
      int quantity = 0;
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         quantity = quantity + WeaponsAvailable(sub);
      }
      return quantity;
   end_script
```

- **演示要点**：演示 script 的参数：int, foreach, return

### script（common_timeline_scripts）｜脚本

- **关键词**：script, if, double, return, 脚本
- **出处**：`base_types/processors/timeline_agents/common_timeline_scripts.txt:92-99`　（同签名共 62 处，另见 `base_types/processors/timeline_agents/common_timeline_scripts.txt:27`、`base_types/processors/timeline_agents/air_combat_maneuvers.txt:490`、`base_types/processors/timeline_agents/common_timeline_scripts.txt:41`）
- **片段**：

```text
script bool TurnTimeAndDistance(WsfTrack turner, WsfGeoPoint targetPoint, double maxG, Array<double> TimeAndDistance)
   if (!turner.IsValid() || !targetPoint.IsValid())
   {
      return false;
   }
   double angle = MATH.Fabs(turner.RelativeBearingTo(targetPoint));
   return TurnAngleTimeAndDistance(angle, turner.Speed(), maxG, TimeAndDistance);
end_script
```

- **演示要点**：演示 script 的参数：if, double, return

### script（behavior_go_home）｜脚本

- **关键词**：script, double, for, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_go_home.txt:54-61`　（同签名共 11 处，另见 `base_types/processors/ripr_agents/aiai/behavior_go_home.txt:54`、`base_types/processors/timeline_agents/behavior_go_home.txt:58`、`brawler/processors/quantum_agents/behavior_go_home.txt:56`）
- **片段**：

```text
   script double NumWeaponsRemaining(WsfPlatform aPlatform)
      double total = 0.0;
      for (int i=0; i<aPlatform.WeaponCount(); i=i+1)
      {
         total = total + aPlatform.WeaponEntry(i).QuantityRemaining();
      }
      return total;
   end_script
```

- **演示要点**：演示 script 的参数：double, for, return

### script（tapsolver）｜脚本

- **关键词**：script, int, for, return, 脚本
- **出处**：`space_operations/scripts/tapsolver.txt:129-136`
- **片段**：

```text
   script int WorstCaseComputations(int aSize)
      int retval = 1;
      for (int i = 2; i <= aSize; i += 1)
      {
         retval = i + i * retval;
      }
      return retval;
   end_script
```

- **演示要点**：演示 script 的参数：int, for, return

### script（scripts）｜脚本

- **关键词**：script, string, if, return, 脚本
- **出处**：`logistics/statics_and_globals/scripts.txt:106-114`　（同签名共 30 处，另见 `logistics/platforms/logistics_platform.txt:283`、`engage/post_process_test.txt:67`、`logistics/platforms/logistics_platform.txt:184`）
- **片段**：

```text
script WsfRoute gNextMissionRouteToFly()
   WsfRoute theRoute = WsfRoute.CopyGlobal(gMissionRouteNames[gNextMissionRouteIndex]);
   string msg = "Providing route number " + (string)gNextMissionRouteIndex +
        " to fly, named " + gMissionRouteNames[gNextMissionRouteIndex] + ".";
   gSay(msg);
   gNextMissionRouteIndex = gNextMissionRouteIndex + 1;
   if (gNextMissionRouteIndex == gMissionRouteNames.Size()) gNextMissionRouteIndex = 0;
   return theRoute;
end_script
```

- **演示要点**：演示 script 的参数：string, if, return

### script（air_combat_maneuvers）｜脚本

- **关键词**：script, angle, double, bool, 脚本
- **出处**：`base_types/processors/timeline_agents/air_combat_maneuvers.txt:672-680`
- **片段**：

```text
   script void Offset(WsfPlatform flyer, WsfGeoPoint target, double angle, double alt, double speed, double gees)
      angle = MATH.NormalizeAngleMinus180_180(angle);
      double offsetTrueBearing = flyer.TrueBearingTo(target) + angle;
      double radialAccel = gees * Earth.ACCEL_OF_GRAVITY();
      double climbRate = MATH.Sin(30) * speed;
      bool ok =       flyer.GoToSpeed(speed, 9999, true);
           ok = ok && flyer.GoToAltitude(alt, climbRate, true);
           ok = ok && flyer.TurnToHeading(offsetTrueBearing, radialAccel);
   end_script
```

- **演示要点**：演示 script 的参数：angle, double, bool

### script（sam_launch_computer）｜脚本

- **关键词**：script, bool, string, return, 脚本
- **出处**：`cyber/weapons/sam/sam_launch_computer.txt:18-28`
- **片段**：

```text
script bool SAM_LaunchComputer(WsfTrack aTrack, WsfPlatform aAssignee, string aEnvelopeName, double aLaunchDelay)

   bool canIntercept = false;
   string subType = aAssignee.Type();
      if ((subType == "SR_SAM_BATTERY") || (subType == "SR_SAM_TELAR"))
   {
      extern bool SR_SAM_LaunchComputer(WsfTrack, WsfPlatform, string, double);
      canIntercept = SR_SAM_LaunchComputer(aTrack, aAssignee, aEnvelopeName, aLaunchDelay);
   }
   return canIntercept;
end_script
```

- **演示要点**：演示 script 的参数：bool, string, return

### script（common_platform_script）｜脚本

- **关键词**：script, double, foreach, return, 脚本
- **出处**：`base_types/processors/quantum_agents/common/common_platform_script.txt:627-638`　（同签名共 30 处，另见 `base_types/processors/ripr_agents/common/common_platform_script.txt:627`、`behavior_tree/processors/quantum_agents/common/common_platform_script.txt:622`、`brawler/processors/quantum_agents/common_platform_script.txt:627`）
- **片段**：

```text
   script double GetWeaponQuantityRemainingMax(WsfPlatform aPlatform, Array<Map<string, Object>> aWeaponArray)
      double quant = 0.0;

      foreach (Map<string, Object> curWeapon in aWeaponArray)
      {
         if (((WsfWeapon)curWeapon["weapon"]).QuantityRemaining() > quant)
         {
            quant = ((WsfWeapon)curWeapon["weapon"]).QuantityRemaining();
         }
      }
      return quant;
   end_script
```

- **演示要点**：演示 script 的参数：double, foreach, return

### script（common_timeline_scripts）｜脚本

- **关键词**：script, if, else, return, 脚本
- **出处**：`base_types/processors/timeline_agents/common_timeline_scripts.txt:272-283`　（同签名共 41 处，另见 `logistics/platforms/logistics_platform.txt:155`、`logistics/platforms/logistics_platform.txt:255`、`base_types/processors/quantum_agents/aiai/behavior_disengage.txt:34`）
- **片段**：

```text
script Array<WsfTrack> GetTimeLineTaskTargets(WsfTask timeline)
   Array<WsfTrack> targets;
   if (timeline.IsValid() && timeline.AuxDataExists("targets"))
   {
      targets = (Array<WsfTrack>)timeline.AuxDataObject("targets");
   }
   else
   {
      targets = Array<WsfTrack>();
   }
   return targets;
end_script
```

- **演示要点**：演示 script 的参数：if, else, return

### script（p6dof_complex_scripts）｜脚本

- **关键词**：script, double, else, return, 脚本
- **出处**：`p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:57-68`　（同签名共 13 处，另见 `six_dof/scripts/six_dof_complex_scripts.txt:55`、`p6dof/airport_operations.txt:496`、`six_dof/rb6_airport_operations.txt:496`）
- **片段**：

```text
script double GetPushbackForceMultiplier(double aPlatformWeight_lbs)
   double multiplier = aPlatformWeight_lbs / PushbackScriptCalibratedPlatformWeight_lbs;
   if(multiplier > 1.0)
   {
      multiplier = ((multiplier - 1.0) * 0.85) + 1.0;
   }
   else if( multiplier < 1.0)
   {
      multiplier = 1.0 - ((1.0 - multiplier) * 0.85);
   }
   return multiplier;
end_script
```

- **演示要点**：演示 script 的参数：double, else, return

### script（intersect_mesh_test）｜脚本

- **关键词**：script, static, if, else, 脚本
- **出处**：`hel/intersect_mesh_test.txt:318-329`　（同签名共 2 处，另见 `hel/intersect_mesh_test_beam_director.txt:408`）
- **片段**：

```text
      script void turn()
         static double heading = 180.0;
         if (heading == 180.0)
         {
            heading = 0.0;
         }
         else
         {
            heading = 180.0;
         }
         PLATFORM.TurnToHeading(heading);
      end_script
```

- **演示要点**：演示 script 的参数：static, if, else

### script（iads_cmdr）｜脚本

- **关键词**：script, bool, else, return, 脚本
- **出处**：`orwaca_iads/platforms/iads_cmdr.txt:51-62`
- **片段**：

```text
   script bool HaveEngageAuthority()
      bool canEngage = false;
      if(OperatingLevelFor("ENGAGE") == 0)   // NOT SELF COMMANDED
      {
      canEngage=(TasksReceivedFor(TRACK.TrackId(), "ENGAGE") > 0);
      }
      else
      {
      canEngage=(TRACK.TimeSinceUpdated() < 60);
      }
      return canEngage;
   end_script
```

- **演示要点**：演示 script 的参数：bool, else, return

### script（schedule）｜脚本

- **关键词**：script, string, for, return, 脚本
- **出处**：`space_operations/scripts/schedule.txt:140-151`　（同签名共 3 处，另见 `space_operations/scripts/schedule.txt:153`、`space_operations/scripts/schedule.txt:166`）
- **片段**：

```text
   script string RouteText()
      string retval;
      for (int i = 0; i < mNSched; i += 1)
      {
         retval = retval + (string)mRoute[i];
         if (i < mNSched - 1)
         {
            retval += " -> ";
         }
      }
      return retval;
   end_script
```

- **演示要点**：演示 script 的参数：string, for, return

### script（tactics_processor4）｜脚本

- **关键词**：script, weapon, if, else, 脚本
- **出处**：`launcher/platforms/tactics_processor4.txt:111-123`
- **片段**：

```text
   script bool WeaponsAvailable()
      WsfWeapon   weapon;
      weapon = PLATFORM.Weapon(WEAPON_NAME);
      writeln_d("Weapons remaining " , weapon.QuantityRemaining());
      if (weapon.QuantityRemaining() > 0)
      {
         return true;
      }
      else
      {
         return false;
      }
      end_script
```

- **演示要点**：演示 script 的参数：weapon, if, else

### script（observer_utils）｜脚本

- **关键词**：script, double, if, else, 脚本
- **出处**：`air_to_air/observer_utils.txt:18-31`　（同签名共 8 处，另见 `air_to_air/observer_utils.txt:33`、`tbm_demos/platforms/tbm_launcher1.txt:25`、`space_operations/conjunction_avoidance.txt:88`）
- **片段**：

```text
script double Get_X(WsfGeoPoint origin, WsfGeoPoint point)
   WsfGeoPoint X = WsfGeoPoint();
   X.Set(origin.Latitude(),point.Longitude(),0);
   double Dist_X = origin.GroundRangeTo(X)*MATH.FT_PER_M();
   
   if (origin.Longitude() < point.Longitude())
   {
      return Dist_X;
   }
   else
   {
      return Dist_X * -1;
   }   
end_script
```

- **演示要点**：演示 script 的参数：double, if, else

### script（comm_link）｜脚本

- **关键词**：script, if, else, is_dedicated, 脚本
- **出处**：`space_operations/scripts/comm_link.txt:90-103`
- **片段**：

```text
   script void SetDedicated(bool aIsDedicated)
      if (aIsDedicated)
      {
         is_linking = true;
         is_linked = true;
         remote_platform_name = sDEDICATED;
      }
      else if (is_dedicated)
      {
         extern void CommLink_Free(WsfComm aComm);
         CommLink_Free(local_comm);
      }
      is_dedicated = aIsDedicated;
   end_script
```

- **演示要点**：演示 script 的参数：if, else, is_dedicated

### script（behavior_escort）｜脚本

- **关键词**：script, if, for, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_escort.txt:116-130`
- **片段**：

```text
  script bool HaveAPursueTargetJob()
    WsfRIPRProcessor commander = ((WsfRIPRProcessor)PROCESSOR).GetRIPRCommanderProcessor();
    if (commander.IsValid())
    {
      for (int channel = 0; channel < ((WsfRIPRProcessor)PROCESSOR).GetNumJobChannels(); channel = channel + 1)
      {
        WsfRIPRJob job = commander.GetJobFor(((WsfRIPRProcessor)PROCESSOR), channel);
        if (job.IsValid() && job.Name() == "pursue-target")
        {
          return true;
        }
      }
    }
    return false;
  end_script
```

- **演示要点**：演示 script 的参数：if, for, return

### script（within_field_of_regard）｜脚本

- **关键词**：script, double, bool, return, 脚本
- **出处**：`space_operations/scripts/within_field_of_regard.txt:11-25`　（同签名共 4 处，另见 `ciws/processors/gun_battery_tactics.txt:43`、`p6dof/p6dof_types/scripts/acm_scripts.txt:491`、`six_dof/scripts/acm_scripts.txt:491`）
- **片段**：

```text
script bool WithinFieldOfRegard(WsfArticulatedPart aPart,
                                WsfPlatform        aTarget)
   Vec3 targetLocWCS = aTarget.LocationWCS();
   Vec3 myLocWCS = aPart.Platform().LocationWCS();
   Vec3 targetVecWCS = Vec3.Subtract(targetLocWCS, myLocWCS);
   Vec3 targetVecPCS = aPart.ConvertWCSVectorToPCS(targetVecWCS);
   targetVecPCS.Normalize();
   double el = -Math.ASin(targetVecPCS[2]);
   double az =  Math.ATan2(targetVecPCS[1], targetVecPCS[0]);
      
   bool withinEl = (el >= aPart.CueMinimumElevation()) && (el <= aPart.CueMaximumElevation());
   bool withinAz = (az >= aPart.CueMinimumAzimuth())   && (az <= aPart.CueMaximumAzimuth());
      
   return (withinAz && withinEl);
end_script
```

- **演示要点**：演示 script 的参数：double, bool, return

### script（brawler_behaviors）｜脚本

- **关键词**：script, double, acc, acc0, 脚本
- **出处**：`six_dof/scripts/brawler_behaviors.txt:209-226`　（同签名共 4 处，另见 `six_dof/scripts/brawler_behaviors.txt:229`、`six_dof_with_brawler/scripts/brawler_behaviors.txt:209`、`six_dof_with_brawler/scripts/brawler_behaviors.txt:229`）
- **片段**：

```text
script void SlowPullRight(WsfPlatform aPlatform)

	double sroll = 0.2588190;   //sin of roll angle (15 deg)
	double croll = 0.9659258;   //cos of roll angle (15 deg)
   Vec3X acc = Vec3X();
   acc.Set(0.0, sroll, -croll);

   # Transform reference vector from ECS to NED   
   DCM wcsToEcs = aPlatform.WCS_To_ECS_DCM();
   DCM wcsToNed = aPlatform.WCS_To_NED_DCM();
   acc = wcsToEcs.InverseTransform(acc);
   acc = wcsToNed.Transform(acc); 
     
   Vec3 acc0 = Vec3.Construct(acc.X(), acc.Y(), acc.Z());   
   acc0 = OrthogonalVector(acc0, aPlatform.VelocityNED());
   
	aPlatform.FlyVectorWithSpeed(acc0, 0.0, 0.0);
end_script
```

- **演示要点**：演示 script 的参数：double, acc, acc0

### script（cvn_task_processor）｜脚本

- **关键词**：script, bool, foreach, return, 脚本
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:101-119`　（同签名共 3 处，另见 `air_to_air/prdata/rules_utils.txt:426`、`air_to_air/prdata/rules_utils.txt:392`）
- **片段**：

```text
   script bool availableSubordinates()
      bool available = false;
      WsfPlatformList subordinates = PLATFORM.Subordinates();
      foreach (WsfPlatform temp in subordinates)
      {
         if (temp.IsValid())
         {
            if ( temp.CategoryMemberOf("fighter") )
            {
               if (TasksAssignedTo(temp, TRACK.TrackId()) < 1)
               {
                  available = true;
                  break;
               } # no tasks assigned to this one
            } # interceptor
         } # is valid
      } # for each
      return available;
   end_script
```

- **演示要点**：演示 script 的参数：bool, foreach, return

### script（assessment_scripts）｜脚本

- **关键词**：script, if, foreach, return, 脚本
- **出处**：`air_to_air/processors/assessment_scripts.txt:19-38`　（同签名共 3 处，另见 `base_types/processors/ripr_agents/aiai/aiai_processor.txt:141`、`base_types/processors/ripr_agents/aiss/aiss_processor.txt:547`）
- **片段**：

```text
      script double BogieBanditConsiderationScoring(WsfLocalTrack threat)
         writeln_d("T = ",TIME_NOW," ",iacid.Name()," ConsiderationScoring");
         if (threat.IsValid() && threat.Target().IsValid()){writeln_d("\t track ",threat.TargetName());}
         if (no_tree){return -1;}
         if ( !threat.Target().IsValid() || threat.Target().Side() == iacid.Side() || 
         iacid.SlantRangeTo(threat) > iacid->COMMIT_RNG*2.0 || 
         threat.Target().CategoryMemberOf("missile") || 
         threat.Target().CategoryMemberOf("surface") )
         {
            return -1.0; // custom filter for the bogey & bandit list.. ignore missiles, targets way outside of commit range, 
         }
         foreach (WsfSA_EntityPerception ent in PerceivedBandits())
         {
            if (ent.Track().IsValid() &&  mapSTIFF_ARM[ent] == true)
            {
               return -1;
            }
         }
         return 1.0;
      end_script
```

- **演示要点**：演示 script 的参数：if, foreach, return

### script（brawler_behaviors）｜脚本

- **关键词**：script, double, dir, dir0, 脚本
- **出处**：`six_dof/scripts/brawler_behaviors.txt:60-80`　（同签名共 4 处，另见 `six_dof/scripts/brawler_behaviors.txt:83`、`six_dof_with_brawler/scripts/brawler_behaviors.txt:60`、`six_dof_with_brawler/scripts/brawler_behaviors.txt:83`）
- **片段**：

```text
script void RollPlus15Pull(WsfPlatform aPlatform)
	
   double sd15 = 0.2588190;
   double cd15 = 0.9659258;
   Vec3X dir = Vec3X();
   dir.Set(0.0, sd15, -cd15);

   # Transform reference vector from ECS to NED   
   DCM wcsToEcs = aPlatform.WCS_To_ECS_DCM();
   DCM wcsToNed = aPlatform.WCS_To_NED_DCM();
   dir = wcsToEcs.InverseTransform(dir);
   dir = wcsToNed.Transform(dir); 
     
   Vec3 dir0 = Vec3.Construct(dir.X(), dir.Y(), dir.Z());
   dir0 = OrthogonalVector(dir0, aPlatform.VelocityNED());
   
	dir0.Normalize();
	double spd0 = 3.0;

	aPlatform.FlyVectorWithThrottle(dir0, 0.0, spd0);
end_script
```

- **演示要点**：演示 script 的参数：double, dir, dir0

### script（comm_link）｜脚本

- **关键词**：script, extern, if, else, 脚本
- **出处**：`space_operations/scripts/comm_link.txt:111-132`　（同签名共 2 处，另见 `satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:87`）
- **片段**：

```text
   script void Free()
   
      extern void CommLink_FreeP(WsfComm aComm);
      extern bool CommLink_MutuallyLinked(WsfComm aLocalComm, WsfComm aRemoteComm);
      if (WsfSimulation.FindPlatform(remote_platform_name).IsValid() && CommLink_MutuallyLinked(local_comm, remote_comm))
      {
         string comment = "REMOVE_CONNECTION " + local_platform_name + ":" + local_comm_name + " from " + remote_platform_name + ":" + remote_comm_name;
         local_comm.Platform().Comment(comment);                         
         comment = "REMOVE_CONNECTION " + remote_platform_name + ":" + remote_comm_name + " from " + local_platform_name + ":" + local_comm_name;
         remote_comm.Platform().Comment(comment);                         
         CommLink_FreeP(remote_comm);
      }
      else
      {
         string comment = "LINK_ABORTED " + local_platform_name + ":" 
                          + local_comm_name + " from " + remote_platform_name + ":" + remote_comm_name;
         local_comm.Platform().Comment(comment);
      }
      
      CommLink_FreeP(local_comm);
            
   end_script
```

- **演示要点**：演示 script 的参数：extern, if, else

### script（awacs）｜脚本

- **关键词**：script, foreach, int, for, 脚本
- **出处**：`shooter/platforms/awacs.txt:120-142`　（同签名共 5 处，另见 `aea_iads/platforms/iads_cmdr.txt:75`、`cyber/exfiltrate_demo/platforms/iads_cmdr.txt:75`、`electronic_warfare/test_false_targets/platforms/iads_cmdr.txt:75`）
- **片段**：

```text
   script void MakeAssignments()
      Array<WsfPlatform> filter = Array<WsfPlatform>();
      foreach (WsfPlatform sub in PLATFORM.Subordinates())
      {
         if (sub.Type() == "JET_AIRCRAFT")
         {
            if (WeaponsAvailable(sub) &&
                (TasksAssignedTo(sub) < MAX_ASSIGNMENTS_PER_SUB) &&
                (TasksAssignedTo(sub, TRACK.TrackId()) < 1))
            {
               writeln_d("*** Adding ", sub.Name(), " to filter");
               filter.PushBack(sub);
            }
         }
      }

      int i;
      int numAssignments = (int)MATH.Min(filter.Size(), MAX_SUBS_PER_TARGET);
      for (int i=0; i < numAssignments; i = i + 1)
      {
         AssignTask(TRACK, "ENGAGE", filter[i]);
      }
   end_script
```

- **演示要点**：演示 script 的参数：foreach, int, for

### script（rocket）｜脚本

- **关键词**：script, double, if, string, 脚本
- **出处**：`signature_demos/platforms/rocket.txt:19-41`
- **片段**：

```text
script void SamplePoint(WsfPlatform aPlatform,
                        double aViewAz,
                        double aViewEl)
   double r =  10000.0;
   double z  = - Math.Sin(aViewEl) * r;
   double xy = Math.Cos(aViewEl) * r;
   double x =  Math.Cos(aViewAz) * xy;
   double y =  Math.Sin(aViewAz) * xy;
   Vec3 obsLocECS = Vec3.Construct(x, y, z);
   Vec3 obsLocWCS = aPlatform.ConvertECSToWCS(obsLocECS);
   WsfGeoPoint obsLoc = WsfGeoPoint.ConstructWCS(obsLocWCS);
   double az = aPlatform.RelativeAzimuthOf(obsLoc);
   double el = aPlatform.RelativeElevationOf(obsLoc);
   if (Math.Fabs(az) < 1.0E-4) az = 0.0;
   if (Math.Fabs(el) < 1.0E-4) el = 0.0;
   string strAzEl = Format.Fixed(az, 1) + "/" + Format.Fixed(el, 1);
   writeln(" Az/El: ", strAzEl.Pad(10),
         ", Area: ", Format.Fixed(aPlatform.ProjectedArea(obsLoc, 1.0), 2).Pad(7), " m2",
         ", Vis: ", Format.Scientific(aPlatform.RadiantIntensity(obsLoc, 1.0, "visual"), 4), " W/sr",
         ", SW: ", Format.Scientific(aPlatform.RadiantIntensity(obsLoc, 1.0, "short"), 4), " W/sr",
         ", MW: ", Format.Scientific(aPlatform.RadiantIntensity(obsLoc, 1.0, "medium"), 4), " W/sr",
         ", LW: ", Format.Scientific(aPlatform.RadiantIntensity(obsLoc, 1.0, "long"), 4), " W/sr");
end_script
```

- **演示要点**：演示 script 的参数：double, if, string

### script（behavior_buddy_engage_weapon_task_target）｜脚本

- **关键词**：script, if, struct, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiww/behavior_buddy_engage_weapon_task_target.txt:128-153`
- **片段**：

```text
   script bool WeaponCapableAvailableAgainstThreat(WsfWeapon weapon, WsfTrack track)
      writeln_d("        checking weapon ", weapon.Name(), " valid=", weapon.IsValid());
      if (weapon.IsNull() || !weapon.IsValid() || track.IsNull() || !track.IsValid())
      {
         writeln_d("weapon or track is not valid!");
         return false;
      }
      struct weaponData = GetWeaponData(weapon.Type());
      if (weaponData->type != weapon.Type())
      {
         writeln_d("could not find weapon type ", weapon.Type() ," in weapon database; query returned type ", weaponData->type);
         return false;   //dont have weapon data
      }
      if ((track.AirDomain()  && !weaponData->domainAir) ||
          (track.LandDomain() && !weaponData->domainLand)  )
      {
         writeln_d("weapon not capable against target domain!");
         return false;
      }
      if ((weapon.QuantityRemaining()-weapon.WeaponsPendingFor(WsfTrackId())) <= 0)
      {
         writeln_d("no unassigned weapons left to fire!");
         return false;
      }
      return true;
   end_script
```

- **演示要点**：演示 script 的参数：if, struct, return

### script（aifl_processor.old）｜脚本

- **关键词**：script, string, if, else, 脚本
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:88-116`　（同签名共 2 处，另见 `air_to_air/observer.txt:369`）
- **片段**：

```text
  script bool CreateGuidanceJobFor(WsfPlatform activeWeapon, WsfTrack target)
      string uniqueName = activeWeapon.Name() + "_uplink";
      if ( ! mTrackJobMap.Exists(uniqueName) )
      {
        double jobPriority = cPursueTargetPriority * 3.0;
        WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR,
                                             "weapon_uplink",
                                             uniqueName,
                                             jobPriority,
                                             maxJobWinnersForWeaponUplink);

        temp.SetData("weaponPlatformIndex", activeWeapon.Index());
        temp.SetData("targetPlatformIndex", target.TargetIndex());
        temp.SetData("targetTrackName", target.TargetName());

        AddJob(temp);
        mTrackJobMap.Set(uniqueName, temp);
        string NewComment = "AIFL - new job: " + temp.Name() + " - " + temp.GetDescription();
        PLATFORM.Comment(NewComment);
        //writeln_d("--- ", PLATFORM.Name(), " job change, ADD: ", uniqueName );
        writeln_d(NewComment);
        return true;
      }
      else
      {
        writeln_d("Guidance job already exists: ", uniqueName);
        return false;
      }
  end_script
```

- **演示要点**：演示 script 的参数：string, if, else

### script（agile_repeater_jamming-rt1）｜脚本

- **关键词**：script, bool, for, return, 脚本
- **出处**：`electronic_warfare/agile_repeater_jamming-rt1.txt:118-149`　（同签名共 7 处，另见 `electronic_warfare/agile_repeater_jamming-rt2.txt:118`、`electronic_warfare/agile_repeater_jamming.txt:125`、`electronic_warfare/air-to-air-rt1.txt:117`）
- **片段**：

```text
   script bool AddSpot()
      bool startedJamming = false;
      for (int i=0; i < PLATFORM.WeaponCount(); i = i+1)
      {
         int tasksAssigned = TasksAssignedFor(TRACK.TrackId(), "Jam");
         WsfWeapon jammer = PLATFORM.WeaponEntry(i);
         writeln_d("TrackId=", TRACK.TrackId());
         writeln_d("RawTrackId=", TRACK.RawTrackId(0));
         if (PLATFORM.WithinFieldOfView(TRACK, jammer.Name()))
         {
            writeln_d("SignalFreq=", TRACK.Frequency());
            if (StartJamming(TRACK, "Jam", jammer, "false_target_jamming"))
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " started jamming ", TRACK.TargetName());
               writeln_d("Previous Tasks Assigned=", tasksAssigned,
                         " Tasks assigned=", TasksAssignedFor(TRACK.TrackId(), "Jam"));
               if (TasksAssignedFor(TRACK.TrackId(), "Jam") > tasksAssigned)
               {
                  startedJamming = true;
                  break;
               }
            }
            else
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":",
                         jammer.Name(), " FAILED started jamming ", TRACK.TargetName());
            }
         }
      }
      return startedJamming;
   end_script
```

- **演示要点**：演示 script 的参数：bool, for, return

### script（rcs_display_mgr）｜脚本

- **关键词**：script, string, double, for, 脚本
- **出处**：`base_types/processors/rcs_display_mgr.txt:41-80`
- **片段**：

```text
   script void Draw()
      Array<double> AzEl = ComputeAspect();
      
      # use the track ID as a unique draw ID
      # a track icon and a line to the track icon
      # is drawn at each track update
      string trackId = TRACK.TrackId().ToString();
      double az = TRACK.Elevation();
      //draw.Erase(trackId);
      draw.SetId(trackId);
      draw.SetDuration(1.0); # this is faster than calling erase every time
      draw.SetColor(0,1,0);
      //draw.BeginIcons(TRACK.Heading(), "Wedge");
      //draw.BeginPolyline();
      //draw.Vertex(TRACK.CurrentLocation());
      //draw.End();

      # Draw a line to the track
      draw.SetLineStyle("dashed");
      draw.BeginLines();
      draw.Vertex(PLATFORM);
      draw.Vertex(TRACK.CurrentLocation());
      draw.End();
      
      draw.SetLineStyle("solid");
      draw.BeginPolyline();
      //writeln(TRACK.Target().Name());
      for (int i = -180; i < 180.0; i=i+1)
      {
         double r = 1000 * MATH.LinearToDB(1 + PLATFORM.RadarCrossSection(i,AzEl[1], "default", TRACK.Frequency()));
         //writeln("   r=", r, " Az=", i, " El=", AzEl[1]);
		 // Spherical (r, theta, phi) to Cartesian (x,y,z), ignoring elevation angle as we only do waterline display.
         double x = r * MATH.Cos(i + PLATFORM.Heading()); //sin(AzEl[1]);
         double y = r * MATH.Sin(i + PLATFORM.Heading()); // sin(AzEl[1]);
		 //double z = r * cos(AzEl[1]);
         //writeln("x=", x, " y=", y);
         draw.VertexNED(PLATFORM, x, y, 0.0);     
      }
      draw.End();
   end_script
```

- **演示要点**：演示 script 的参数：string, double, for

### script（flight_lead_timeline_tasks_from_data）｜脚本

- **关键词**：script, extern, for, return, 脚本
- **出处**：`base_types/processors/timeline_agents/flight_lead_timeline_tasks_from_data.txt:30-81`
- **片段**：

```text
   script Array<WsfQuantumTask> FlightLeadTaskGeneration (Array<WsfLocalTrack> TRACKS, Array<WsfAssetPerception> ASSETS )
      Array<WsfQuantumTask> tasks = Array<WsfQuantumTask>();

      extern Map<int, int> mGrinderPairings;
      mGrinderPairings.Clear();

      #if its us, then create weapon tasks for enemy tracks
      for (int i=0; i<TRACKS.Size(); i=i+1)
      {
         WsfLocalTrack lt = TRACKS.Get(i);
         if (lt.IsValid() && (!lt.SideValid() || lt.Side() != PLATFORM.Side()))
         {
            if (mKnownTargetTypes.Size() <= 0 || mKnownTargetTypes.Exists(lt.TargetType()))
            {

               #WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
               #task.SetUniqueId(lt.TargetIndex());   #use this for now, use cluster Id later
               #WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE", lt);
               Array<WsfTrack> targets = Array<WsfTrack>();
               targets.PushBack(WsfTrack(lt));

               WsfQuantumTask task = WsfQuantumTask.Construct(1.0, "TIMELINE");
               task.UniqueId(lt.TargetIndex());   #use this for now, use cluster Id later
               task.SetAuxData("targets",targets);
               task.SetAuxData("FSR",FSR);
               task.SetAuxData("DOR",DOR);
               task.SetAuxData("MAR",MAR);
               task.SetAuxData("RISK",RISK);

               tasks.PushBack(task);
               writeln_d("timeline task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());

               # Generate a second timeline task for support
               WsfQuantumTask taskSup = WsfQuantumTask.Construct(1.0, "TIMELINE");
               taskSup.UniqueId(lt.TargetIndex() + 123456);   //use this for now, use cluster Id later
               taskSup.SetAuxData("targets",targets);
               taskSup.SetAuxData("FSR",FSR);
               taskSup.SetAuxData("DOR",DOR);
               taskSup.SetAuxData("MAR",MAR);
               taskSup.SetAuxData("RISK",RISK);

               tasks.PushBack(taskSup);
               writeln_d("timeline support task generated for: ", lt.TargetName(), ", updated time: ", lt.UpdateTime());

               # Map task IDs to platforms doing grinder can look each other up
               mGrinderPairings.Set(lt.TargetIndex(), lt.TargetIndex() + 123456);
               mGrinderPairings.Set(lt.TargetIndex() + 123456, lt.TargetIndex());
            }
         }
      }
      return tasks;
   end_script
```

- **演示要点**：演示 script 的参数：extern, for, return

### script（post_process_test）｜脚本

- **关键词**：script, bool, if, else, 脚本
- **出处**：`engage/post_process_test.txt:79-133`　（同签名共 2 处，另见 `air_to_air/prdata/rules_utils.txt:1243`）
- **片段**：

```text
script void PostProcessAscii(string newAscii, string expectedAscii, double errorThreshold)
   bool fail = false;
   Map<string, double> asciiToValue = { "_" : 0.0, "." : .1, ":" : .3, ";" : .5, "!" : .7, "|" : .9, "X" : 1.0 };
   writeln("- Begin Plot ( .:;!|X) -");
   writeln(newAscii, "- End Plot -");
   if (newAscii != expectedAscii)
   {
      double newTotal = 0, oldTotal = 0;
      writeln("- Difference  (.=none, ^-higher, v-lower) -");
      Array<string> newLines = newAscii.Split("\n");
      Array<string> oldLines = expectedAscii.Split("\n");
      for (int i = 0; i < newLines.Size(); i+=1)
      {
         if (oldLines.Size() <= i) { writeln("---LINE NOT EXPECTED---"); fail = true; continue; }
         string new = newLines[i].Strip();
         string old = oldLines[i].Strip();
         string out;
         for (int j = 0; j < new.Length(); j+=1)
         {
            if (j > old.Length()) { writeln("*TOO MANY COLUMNS"); fail = true; break; }
            string newc = new.Substring(j, j);
            string oldc = old.Substring(j, j);
            newTotal += asciiToValue[newc];
            oldTotal += asciiToValue[oldc];
            if (newc == oldc)
            {
               out = out + ".";
            }
            else {
               if (asciiToValue[newc] > asciiToValue[oldc])
                  out = out + "^";
               else
                  out = out + "v";
            }
         }
         writeln(out);
      }
      writeln("- End Difference -");
      if (oldTotal != newTotal)
      {
         double errorPct = 100.0 - 100 * newTotal / (oldTotal + .01);
         if (errorPct > errorThreshold || errorPct < -errorThreshold)
         {
            writeln("Error: Difference is not small: ", errorPct, "%");
            fail = true;
         }
      }
   }
   else
   {
      writeln("Plot exactly as expected!");
   }
   if (fail) writeln("-FAIL-");
   else writeln("-PASS- Plot Compare OK");
end_script
```

- **演示要点**：演示 script 的参数：bool, if, else

### script（longbow_type）｜脚本

- **关键词**：script, extern, double, if, 脚本
- **出处**：`hellfire/active_radar_hellfire/longbow_type.txt:261-316`　（同签名共 3 处，另见 `hellfire/laser_designation_via_dis/longbow_type.txt:243`、`hellfire/semiactive_laser_hellfire/longbow_type.txt:244`）
- **片段**：

```text
   script void BeginPopup()

      # We now need to control our altitude directly in this script,
      # not by consideration of terrain heights, so turn off terrain following.
      followTerrain = false;

      # It is necessary to pre-declare the existence of an external function we wish to call:
      extern double GetPopupAltitude(WsfGeoPoint src, WsfGeoPoint target);

      # Set the speed to slow down to be more reasonable for this manuever.
      PLATFORM.Mover().SetMode("HOVER");
      writeln("*** In pop-up.  Set mode HOVER. ***");

      # This is an expected location for a target.
      # It does not have to be the actual location,
      # however must be close enough to enable a radar detection.
      WsfGeoPoint expectedTgtLocation = WsfGeoPoint.Construct("39:10:35.0n 106:50:44w");
      expectedTgtLocation.SetAltitudeAGL(1);

      # Turn our desired heading toward the expected target location.
      PLATFORM.TurnToRelativeHeading(TrueBearingTo(expectedTgtLocation)); #SetHeading(230); #PLATFORM.TrueBearingTo(240)); #expectedTgtLocation

      # Set a location to fly to.  This is the vantage point location we wish to do the pop-up from.
      WsfGeoPoint verticalClimbPole = WsfGeoPoint.Construct("39:11:04.21n 106:49:14.48w");

      # Create a route to fly, from our current location toward the expected target.
      WsfRoute route = WsfRoute();
      #route.Append(verticalClimbPole, 30);

      # Calculate an altitude believed to be sufficient to gain line-of-sight to the expected location for the target
      double popUpAlt = GetPopupAltitude(verticalClimbPole, expectedTgtLocation);
      double currentAlt = Altitude();
      writeln("Current Alt: ", currentAlt, ", Commanded Pop-Up Alt: ", popUpAlt);

      # Add another point into our route that will take us vertically up to our sensor scan altitude.
      verticalClimbPole.SetAltitudeAGL(popUpAlt - verticalClimbPole.TerrainHeight());
      route.Append(verticalClimbPole, 10);

      # Engage.  Begin flying toward the target.
      FollowRoute(route);
      PLATFORM.TurnToHeading(TrueBearingTo(expectedTgtLocation));

      WsfSensor sensor = PLATFORM.Sensor("longbow_radar");
      if (sensor.IsValid())
      {
          writeln("Radar sensor turned on at start of pop-up.");
          sensor.TurnOn();
          PLATFORM.Comment("RADAR Sensor On.");
      }

      # Run the CheckDone() script.  Since we have yet to get to sensor height and detect the target,
      # one might think there is no reason to check this now.  However, as part of its processing, the
      # script will reschedule itself periodically.  Eventually, it will discern the pop-up was successful.
      CheckDone();

   end_script
```

- **演示要点**：演示 script 的参数：extern, double, if

### script（run_me_second）｜脚本

- **关键词**：script, extern, string, bullet_comp_line, 脚本
- **出处**：`gun_engagement/run_me_second.txt:14-78`
- **片段**：

```text
script void CreateActualLaunchComputer()
    extern double BULLET_MAX_RANGE_LCG;
    extern Map<double, double> RangeVelMap;
    string LaunchComputerName   = write_str("weapons/guns/", BULLET_NAME, "_launch_computer.txt");
    FileIO BulletLaunchFile = FileIO();
    BulletLaunchFile.Open(LaunchComputerName, "out");
    string bullet_comp_line;
    bullet_comp_line = write_str("# This file was automatically generated by the gun_demo script.\n",
                                 "# It was created separately by another execution of mission.\n");
    BulletLaunchFile.Writeln(bullet_comp_line);
    bullet_comp_line = write_str(
      "launch_computer ", BULLET_NAME , "_LAUNCH_COMPUTER WSF_SCRIPT_LAUNCH_COMPUTER\n",
      "   script void compute_intercept(WsfTrack aTrack, double aLaunchDelay)\n",
      "      # get ground range to target to compute tti which computes bullet drop too...\n",
      "      double weaponSpeed = 0;\n",
      "      if(PLATFORM.SlantRangeTo(aTrack)       >  ", BULLET_MAX_RANGE_LCG,  " )   return;");  # stated max range

    BulletLaunchFile.Writeln(bullet_comp_line);

      foreach (double aKey : double aData in RangeVelMap)
      {
         bullet_comp_line = write_str(
         "      else if(PLATFORM.SlantRangeTo(aTrack)       < ", aKey , " ) ", "{ weaponSpeed = ", aData, " ;}");
         ###writeln("key, range ", aKey, " velocity =  ", aData);
          BulletLaunchFile.Writeln(bullet_comp_line);
          if(aKey > BULLET_MAX_RANGE_LCG )   break ;
      }

      bullet_comp_line = write_str(
      "\n      WsfWaypoint intercept = WsfWaypoint();\n",
      "      double tti = PLATFORM.InterceptLocation3D(aTrack, intercept, weaponSpeed, aLaunchDelay);\n",
      "      if (tti > 0.0)\n",
      "      {\n",
      "         double az = PLATFORM.RelativeAzimuthOf(intercept.Location());\n",
      "         double el = PLATFORM.RelativeElevationOf(intercept.Location());\n",
      "         if (az < WEAPON.SlewMaximumAzimuth() && az > WEAPON.SlewMinimumAzimuth() &&\n",
      "             el < WEAPON.SlewMaximumElevation() && el > WEAPON.SlewMinimumElevation())\n",
      "         {\n",
      "            # compute the bullet drop based on time of flight \n",
      "            double BulletDrop = 0.5 * Earth.ACCEL_OF_GRAVITY() * tti * tti;\n",
      "            #add it back in (so the given point is above actual intercept point)\n",
      "            intercept.SetAltitude(intercept.Altitude()+BulletDrop, false);\n",
      "            WsfGeoPoint interceptPoint = WsfGeoPoint.Construct(intercept.Latitude(), intercept.Longitude(), intercept.Altitude());\n",
      "            SetInterceptPoint(interceptPoint);\n",
      "            #SetInterceptPoint(intercept.Location()); # Another way of doing it...\n",
      "            # The next call is the minimum requirement for reporting an intercept.\n",
      "            SetInterceptTime(TIME_NOW + tti);\n",
      "            SetLaunchTime(TIME_NOW + aLaunchDelay);\n",
      "            SetTimeOfFlight(tti - aLaunchDelay);\n\n",
      "         ###UNCOMMENT THE FOLLOWING LINES TO SEE WHERE THE LAUNCH COMPUTER IS POINTING THE BULLET\n",
      "            #WsfGeoPoint InterceptGeoPoint = intercept.Location();\n",
      "            #writeln(TIME_NOW, \" InterceptGeoPoint is \", InterceptGeoPoint);\n",
      "            #WsfDraw draw = WsfDraw();\n",
      "            #draw.BeginLines();\n",
      "            #draw.SetColor(0.3, 0.3, 0.3);\n",
      "            #draw.Vertex(InterceptGeoPoint);\n",
      "            #draw.Vertex(PLATFORM);\n",
      "            #draw.End();\n",
      "         }\n",
      "      }\n",
   "   end_script\n",
   "end_launch_computer");
 BulletLaunchFile.Writeln(bullet_comp_line);

end_script
```

- **演示要点**：演示 script 的参数：extern, string, bullet_comp_line

### script（iridium）｜脚本

- **关键词**：script, string, bool, if, 脚本
- **出处**：`satellite_demos/platforms/iridium.txt:205-270`
- **片段**：

```text
      script void InitIridiumComms()
         // set up the links that don't change (links with adjacent satellites in same plane).
         WsfComm comm = PLATFORM.Comm("iridium_crosslink");
         string netName = comm.NetworkName();
         mSatelliteNumber = SatelliteNumber(netName);
         mOrbitNumber = OrbitNumber(netName);
         bool isEvenOrbit = (Math.Mod(mOrbitNumber, 2) == 0);

         if (mOrbitNumber != sFIRST_ORBIT)
         {
            if (isEvenOrbit)
            {
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sFIRST_SATELLITE);
               }
               mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
            }
            else // odd orbit
            {
               mNorthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mSouthwardUpperLeftLink = "iridium" + (string)(mOrbitNumber - 1) + (string)(sLAST_SATELLITE);
               }
            }
         }
         if (mOrbitNumber != sLAST_ORBIT)
         {
            if (isEvenOrbit)
            {
               mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
               if (mSatelliteNumber != sLAST_SATELLITE)
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber + 1);
               }
               else
               {
                  mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sFIRST_SATELLITE);
               }
            }
            else // odd orbit
            {
               if (mSatelliteNumber != sFIRST_SATELLITE)
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber - 1);
               }
               else
               {
                  mNorthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(sLAST_SATELLITE);
               }
               mSouthwardLowerRightLink = "iridium" + (string)(mOrbitNumber + 1) + (string)(mSatelliteNumber);
            }
         }
         Vec3 velWCS = PLATFORM.VelocityWCS();
         mIsTravelingNorth = (velWCS.Z() > 0.0);
         mWasTravelingNorth = mIsTravelingNorth;
      end_script
```

- **演示要点**：演示 script 的参数：string, bool, if

### script（soj）｜脚本

- **关键词**：script, string, int, for, 脚本
- **出处**：`aea_iads/platforms/soj.txt:252-318`　（同签名共 2 处，另见 `alv_routing/processors/alv_task_mgr.txt:211`）
- **片段**：

```text
   script void UpdateJammingTrack()
      string reason = "UNKNOWN";
      int curSignalCount = TRACK.SignalCount();
      int prevSignalCount = mSignalCountMap[TRACK.TrackId()];
      int loopSignalCount = MATH.Max(curSignalCount, prevSignalCount); # use the max to add/remove spots
      for (int signalIndex = 0; signalIndex  < loopSignalCount; signalIndex = signalIndex  + 1)
      {
         bool addSpot = false;

         string jamStr = write_str(mJamTaskStr, signalIndex);

         WsfTaskList taskList = AssignedTaskList(TRACK.TrackId(), jamStr);
         if (taskList.Count() == 0)
         {
            addSpot = true;
            reason = "frequency added";
         }
         else if (taskList.Count() == 1)
         {
            WsfTask task = taskList.Entry(0);
            bool needToStopJamming = true;
            if (signalIndex >= curSignalCount)
            {
               reason = write_str("signal_", signalIndex, "_invalid");
            }
            else if (PLATFORM.WithinFieldOfView(TRACK, task.ResourceName()))
            {
               if (task.ResourceFrequency() == TRACK.SignalFrequency(signalIndex))
               {
                  needToStopJamming = false;
               }

               if (needToStopJamming)
               {
                  reason = "frequency change";
               }
            }
            else
            {
              reason = "FOV limits";
            }

            if (needToStopJamming)
            {
               writeln_d("T=", TIME_NOW, " ", PLATFORM.Name(), ":", task.ResourceName(), " stopped jamming ",
                         TRACK.TargetName(), ":", TRACK.SignalEmitterType(signalIndex),
                         ", task=", task.TaskType()," freq=", task.ResourceFrequency(),
                         " due to ", reason);
               if (CancelTask(task.TrackId(), task.TaskType(), task.ResourceName()))
               {
                  addSpot = true;
               }
            }
         }
         else
         {
            # script setup for single jamming task for now, needs work for multiples?
            writeln("*****WARNING: More than one task found in.", PLATFORM.Name(), " jamming script.");
         }

         if (addSpot)
         {
             AddSpot(signalIndex);
         }
      }
      mSignalCountMap[TRACK.TrackId()] = curSignalCount;
   end_script
```

- **演示要点**：演示 script 的参数：string, int, for

### script（airport_operations）｜脚本

- **关键词**：script, double, speed_ktas, speed_mps, 脚本
- **出处**：`p6dof/airport_operations.txt:337-484`　（同签名共 2 处，另见 `six_dof/rb6_airport_operations.txt:337`）
- **片段**：

```text
   script void CalcApproachData(WsfGeoPoint runwayThreshold,
                                double      runwayHeading_deg,
                                double      runwayAltitude_m)

      double currentAlt_m = PLATFORM.Altitude();
      double deltaAlt_m = currentAlt_m - runwayAltitude_m;

      writeln(">>> CalcApproachData() <<<");
      writeln("  currentAlt_m     = ", currentAlt_m);
      writeln("  runwayAltitude_m = ", runwayAltitude_m);
      writeln("  deltaAlt_m       = ", deltaAlt_m);

      double glideSlopeAngle_deg = 3.0;
      double slantRange_m = deltaAlt_m / MATH.Sin(glideSlopeAngle_deg);
      double downRange_m = slantRange_m * MATH.Cos(glideSlopeAngle_deg);

      writeln("  slantRange_m     = ", slantRange_m);
      writeln("  downRange_m      = ", downRange_m);
      writeln("  slantRange(nm)   = ", slantRange_m/MATH.M_PER_NM());
      writeln("  downRange(nm)    = ", downRange_m/MATH.M_PER_NM());

      double heading_deg = runwayHeading_deg;
      double xOffset = -downRange_m;
      double yOffset = 0.0;
      double zOffset = -deltaAlt_m;

      WsfGeoPoint runwayStartPt = WsfGeoPoint.ConstructWCS(runwayThreshold.LocationWCS());
      WsfGeoPoint runwayEndPt = WsfGeoPoint.ConstructWCS(runwayThreshold.LocationWCS());
      WsfGeoPoint approachPt = WsfGeoPoint.ConstructWCS(runwayThreshold.LocationWCS());
      WsfGeoPoint initialPointPt = WsfGeoPoint.ConstructWCS(runwayThreshold.LocationWCS());

      double defaultRunwayLength_m = 3000.0;
      runwayEndPt.Offset( heading_deg, defaultRunwayLength_m,0.0,0.0);
      approachPt.Offset( heading_deg, xOffset,yOffset,zOffset);
      initialPointPt.Offset( heading_deg, xOffset - 3000.0,yOffset,zOffset);

      RunwayStartPt = WsfGeoPoint.ConstructWCS(runwayStartPt.LocationWCS());
      RunwayEndPt = WsfGeoPoint.ConstructWCS(runwayEndPt.LocationWCS());
      ApproachPt = WsfGeoPoint.ConstructWCS(approachPt.LocationWCS());
      InitialPointPt = WsfGeoPoint.ConstructWCS(initialPointPt.LocationWCS());

      WsfGeoPoint startPt = WsfGeoPoint.ConstructWCS(PLATFORM.LocationWCS());

      double lat = startPt.Latitude();
      double lon = InitialPointPt.Longitude();
      double alt_m = InitialPointPt.Altitude();

      WsfGeoPoint crossPointPt = WsfGeoPoint.Construct(lat,lon,alt_m);

      // Create the route
      WsfRoute landingRoute = WsfRoute.Create("LandingRoute");
      double speed_ktas = 250.0;
      double speed_mps = (speed_ktas * MATH.FT_PER_NM() / 3600.0) * MATH.M_PER_FT();

      speed_ktas = 350.0;
      speed_mps = (speed_ktas * MATH.FT_PER_NM() / 3600.0) * MATH.M_PER_FT();
      landingRoute.Append(startPt, speed_mps);
      landingRoute.Append(crossPointPt, speed_mps);
      landingRoute.Append(InitialPointPt, speed_mps);
      landingRoute.Append(ApproachPt, speed_mps);

      speed_ktas = 250.0;
      speed_mps = (speed_ktas * MATH.FT_PER_NM() / 3600.0) * MATH.M_PER_FT();
      landingRoute.Append(RunwayStartPt, speed_mps);

      speed_ktas = 200.0;
      speed_mps = (speed_ktas * MATH.FT_PER_NM() / 3600.0) * MATH.M_PER_FT();
      landingRoute.Append(RunwayEndPt, speed_mps);

      // Calc Approach Data

      WsfDraw draw = WsfDraw();

      draw.SetColor(0.8,0.2,0.2,1.0);
      draw.SetLineSize(4);
      draw.BeginPolyline();
      draw.Vertex(landingRoute.Waypoint(0).Location());
      draw.Vertex(landingRoute.Waypoint(1).Location());
      draw.End();

      draw.SetLineSize(2);
      draw.SetColor(0.8,0.0,0.8,1.0);
      draw.BeginLines();
      draw.Vertex(landingRoute.Waypoint(1).Location());
      draw.Vertex(landingRoute.Waypoint(2).Location());
      draw.End();
      draw.SetColor(0.8,0.3,0.0,0.8);
      draw.BeginLines();
      draw.Vertex(landingRoute.Waypoint(2).Location());
      draw.Vertex(landingRoute.Waypoint(3).Location());
      draw.End();
      draw.SetColor(0.8,0.6,0.0,0.8);
      draw.BeginLines();
      draw.Vertex(landingRoute.Waypoint(3).Location());
      draw.Vertex(landingRoute.Waypoint(4).Location());
      draw.End();
      draw.SetColor(0.8,0.9,0.0,0.8);
      draw.BeginLines();
      draw.Vertex(landingRoute.Waypoint(4).Location());
      draw.Vertex(landingRoute.Waypoint(5).Location());
      draw.End();

      draw.SetColor(0.0,0.5,0.9,1.0);
      draw.SetLineSize(1);
      draw.BeginPolyline();
      draw.Vertex(startPt);
      draw.Vertex(crossPointPt);
      draw.Vertex(InitialPointPt);
      draw.Vertex(ApproachPt);
      draw.Vertex(RunwayStartPt);
      draw.Vertex(RunwayEndPt);
      draw.End();

      draw.SetPointSize(6);

      draw.SetColor(1.0,0.0,0.0,1.0);
      draw.BeginPoints();
      draw.Vertex(startPt);
      draw.End();

      draw.SetColor(1.0,0.5,0.0,1.0);
      draw.BeginPoints();
      draw.Vertex(crossPointPt);
      draw.End();

      draw.SetColor(1.0,1.0,0.0,1.0);
      draw.BeginPoints();
      draw.Vertex(InitialPointPt);
      draw.End();

      draw.SetColor(0.0,1.0,0.0,1.0);
      draw.BeginPoints();
      draw.Vertex(ApproachPt);
      draw.End();

      draw.SetColor(0.0,1.0,1.0,1.0);
      draw.BeginPoints();
      draw.Vertex(RunwayStartPt);
      draw.End();

      draw.SetColor(0.0,1.0,0.5,1.0);
      draw.BeginPoints();
      draw.Vertex(RunwayEndPt);
      draw.End();

      PLATFORM.FollowRoute(landingRoute);

   end_script
```

- **演示要点**：演示 script 的参数：double, speed_ktas, speed_mps

### script（acm_scripts）｜脚本

- **关键词**：script, double, bool, else, 脚本
- **出处**：`p6dof/p6dof_types/scripts/acm_scripts.txt:820-1038`　（同签名共 2 处，另见 `six_dof/scripts/acm_scripts.txt:820`）
- **片段**：

```text
script void SimpleFighterThinker(string aTgtPlatformName, double aDeltaT_sec)

   if(!thinking)
   {
      return;
   }

   double currentTime_sec = TIME_NOW;

   bool groundClobberWarning = CheckForGroundClobber(2000.0); // Don't go below 2,000 meters

   if(groundClobberWarning)
   {
      //writeln(PLATFORM.Name(), " is pulling up at T=", TIME_NOW, " with Pitch=", PLATFORM.Pitch(),
      //" and Roll=", PLATFORM.Roll(), " at Alt=", PLATFORM.Altitude()*MATH.FT_PER_M());

      // Pull up to prevent crash
      RollToBankAngle(PLATFORM, 0.0);

      double gLoad = 0.0;
      if( MATH.Fabs(PLATFORM.Roll()) > 90.0 )
      {
         // writeln("*** INVERTED -- Roll = ", PLATFORM.Roll());
      }
      else
      {
         gLoad = 8.0;
      }
      SetPitchGLoad(PLATFORM, gLoad);

      currentTacticalMode = PULL_UP_MODE;
      currentTargetPlatformName = "NONE";

      PLATFORM.ExecuteAtTime(TIME_NOW + aDeltaT_sec, "SimpleFighterThinker", {aTgtPlatformName,aDeltaT_sec});
      return;
   }

   if( currentTime_sec > nextTargetEvalTime_Sec )
   {
      // Set new time
      nextTargetEvalTime_Sec = currentTime_sec + stdTargetEvalDeltaTime_Sec;

      // Reset values
      offensiveScore = 0.0;
      defensiveScore = 0.0;
      offensiveTargetPlatformName = "NONE";
      defensiveTargetPlatformName = "NONE";

      // Determine the best target to attack
      DetermineBestTargetToAttack();

      // Determine the most threatening target
      DetermineMostThreateningTarget();

      /*
      bool groundClobberWarning = CheckForGroundClobber(1000.0); // Don't go below 1,000 meters

      if(groundClobberWarning)
      {
         writeln(PLATFORM.Name(), " is pulling up at T=", TIME_NOW, " with Pitch=", PLATFORM.Pitch(),
         " and Roll=", PLATFORM.Roll(), " at Alt=", PLATFORM.Altitude()*MATH.FT_PER_M());

         // Pull up to prevent crash
         RollToBankAngle(PLATFORM, 0.0);

         double gLoad = 0.0;
         if( MATH.Fabs(PLATFORM.Roll()) > 90.0 )
         {
            writeln("*** INVERTED -- Roll = ", PLATFORM.Roll());
         }
         else
         {
            gLoad = 5.0;
         }
         SetPitchGLoad(PLATFORM, gLoad);

         currentTacticalMode = PULL_UP_MODE;
         currentTargetPlatformName = "NONE";

         PLATFORM.ExecuteAtTime(TIME_NOW + aDeltaT_sec, "SimpleFighterThinker", {aTgtPlatformName,aDeltaT_sec});
         return;
      }
      */

      // Should we attack or defend?
      if( offensiveScore >= defensiveScore )
      {
         if( offensiveScore > 0.0 )
         {
            currentTacticalMode = OFFENSIVE_MODE;
            currentTargetPlatformName = offensiveTargetPlatformName;
         }
         else
         {
            currentTacticalMode = UNDEFINED_MODE;
            currentTargetPlatformName = "NONE";
         }
      }
      else
      {
         if( defensiveScore > 0.0 )
         {
            currentTacticalMode = DEFENSIVE_MODE;
            currentTargetPlatformName = defensiveTargetPlatformName;
         }
         else
         {
            currentTacticalMode = UNDEFINED_MODE;
            currentTargetPlatformName = "NONE";
         }
      }

      bool launched = LaunchAgainstTarget();

      if( launched )
      {
         writeln("Fox Two! -- ", PLATFORM.Name(), " launched a missile against ", offensiveTargetPlatformName);

         WsfPlatform tgtPlat = WsfSimulation.FindPlatform(offensiveTargetPlatformName);
         if(tgtPlat.IsValid())
         {
            WsfDraw draw = WsfDraw();
            draw.SetDuration(10.0);
            draw.SetColor(250.0,50.0,50.0,1.0);
            draw.BeginLines();
            draw.Vertex(PLATFORM);
            draw.Vertex(tgtPlat);
            draw.End();
         }
      }
      else
      {
      }
   }


   WsfPlatform tgtPlatform;

   if(currentTacticalMode == OFFENSIVE_MODE)
   {
      tgtPlatform = WsfSimulation.FindPlatform(currentTargetPlatformName);
   }
   else
   if(currentTacticalMode == DEFENSIVE_MODE)
   {
      tgtPlatform = WsfSimulation.FindPlatform(currentTargetPlatformName);
   }
   else
   {
      double alt_m = PLATFORM.Altitude();
      double hdg_deg = PLATFORM.Heading();
      PLATFORM.GoToAltitude(alt_m);
      PLATFORM.TurnToHeading(hdg_deg);

      PLATFORM.ExecuteAtTime(TIME_NOW + aDeltaT_sec, "SimpleFighterThinker", {aTgtPlatformName,aDeltaT_sec});
      return;
   }


//   WsfPlatform tgtPlatform = WsfSimulation.FindPlatform(aTgtPlatformName);

   if( !tgtPlatform.IsValid() )
   {
      PLATFORM.ExecuteAtTime(TIME_NOW + aDeltaT_sec, "SimpleFighterThinker", {aTgtPlatformName,aDeltaT_sec});
      return;
   }

   DetermineRollAndPull(PLATFORM, tgtPlatform);

   double rollRate_dps = 0.01 * rollAndPull_TgtRoll_deg * Math.Fabs(rollAndPull_TgtRoll_deg);
   if( rollRate_dps > 360.0 )
   {
      rollRate_dps = 360.0;
   }
   if( rollRate_dps < -360.0 )
   {
      rollRate_dps = -360.0;
   }
   SetRollRate(PLATFORM,rollRate_dps);

   double gLoad = 1.0;
   if( rollAndPull_TotalAngle_deg > 90.0 )
   {
      rollAndPull_TotalAngle_deg = 90.0;
   }

   if( rollAndPull_TotalAngle_deg < 5.0 )
   {
      gLoad = 0.25;
   }
   else
   {
      if( rollAndPull_TotalAngle_deg > 45.0 )
      {
         gLoad = 6.5 * maneuverGLoadFactor;
      }
      else if( rollAndPull_TotalAngle_deg > 30.0 )
      {
         gLoad = 4.5 * maneuverGLoadFactor;
      }
      else if( rollAndPull_TotalAngle_deg > 20.0 )
      {
         gLoad = 3.0 * maneuverGLoadFactor;
      }
      else if( rollAndPull_TotalAngle_deg > 10.0 )
      {
         gLoad = 2.0 * maneuverGLoadFactor;
      }
      else // > 5 deg
      {
         gLoad = 1.0;
      }
   }

   SetPitchGLoad(PLATFORM, gLoad);

   PLATFORM.ExecuteAtTime(TIME_NOW + aDeltaT_sec, "SimpleFighterThinker", {aTgtPlatformName,aDeltaT_sec});

end_script
```

- **演示要点**：演示 script 的参数：double, bool, else

### script（platform_to_platform_transport_processor）｜脚本

- **关键词**：script, if, return, 脚本
- **出处**：`logistics/processors/platform_to_platform_transport_processor.txt:56-59`　（同签名共 187 处，另见 `base_types/processors/quantum_agents/aiai/behavior_disengage.txt:52`、`base_types/processors/quantum_agents/aiai/behavior_in_danger.txt:28`、`base_types/processors/ripr_agents/aiai/behavior_disengage.txt:52`）
- **片段**：

```text
   script bool IsCloseToClient()
      if (! ppCurrentClient.IsValid()) return false;
      return PLATFORM.GroundRangeTo(ppCurrentClient) < ppProximityLimit;
   end_script
```

- **演示要点**：演示 script 的参数：if, return

### script（red_sam_battery_tactics）｜脚本

- **关键词**：script, extern, return, 脚本
- **出处**：`aea_iads/processors/red_sam_battery_tactics.txt:60-63`　（同签名共 16 处，另见 `cyber/exfiltrate_demo/platforms/red_sam_battery_tactics.txt:60`、`cyber/processors/telar_task_mgr.txt:55`、`electronic_warfare/test_false_targets/platforms/red_sam_battery_tactics.txt:60`）
- **片段**：

```text
   script bool InInterceptEnvelopeOf(string aEnvelopeName)
      extern bool SAM_LaunchComputer(WsfTrack, WsfPlatform, string, double);
      return SAM_LaunchComputer(TRACK, PLATFORM, aEnvelopeName, 0.0);
   end_script
```

- **演示要点**：演示 script 的参数：extern, return

### script（brawler_script_util）｜脚本

- **关键词**：script, double, return, 脚本
- **出处**：`air_to_air/rules/brawler_script_util.txt:181-184`　（同签名共 110 处，另见 `base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:179`、`brawler/platforms/alternatives/BrawlerScriptUtil.txt:179`、`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:124`）
- **片段**：

```text
script double cauchy(double z, double z0)
   double t = (z / z0);
   return 1.0 / (1.0 + (t * t));
end_script
```

- **演示要点**：演示 script 的参数：double, return

### script（semi-auto_repeater_jamming_1）｜脚本

- **关键词**：script, int, return, 脚本
- **出处**：`electronic_warfare/semi-auto_repeater_jamming_1.txt:149-153`　（同签名共 3 处，另见 `orwaca_iads/platforms/iads_cmdr.txt:92`、`air_to_air/observer_utils.txt:49`）
- **片段**：

```text
   script bool StoppedJamming()
      int tasksAssigned = TasksAssignedFor(TRACK.TrackId(), "Jam");
      writeln("tasksAssigned=", tasksAssigned);
      return (tasksAssigned == 0);
   end_script
```

- **演示要点**：演示 script 的参数：int, return

### script（hel_test）｜脚本

- **关键词**：script, bool, return, 脚本
- **出处**：`hel/hel_test.txt:66-70`　（同签名共 21 处，另见 `hel/intersect_mesh_test.txt:77`、`hel/intersect_mesh_test_beam_director.txt:87`、`laser_designator/platforms/uav.txt:63`）
- **片段**：

```text
   script bool IsOK(WsfTrack aTrack)
      WsfPlatform targetPlatform = WsfSimulation.FindPlatform(aTrack.TargetIndex());
      bool isOk = targetPlatform.IsValid() && (targetPlatform.Side() != PLATFORM.Side());
      return isOk;
   end_script
```

- **演示要点**：演示 script 的参数：bool, return

### script（brawler_script_util）｜脚本

- **关键词**：script, c, return, 脚本
- **出处**：`air_to_air/rules/brawler_script_util.txt:58-63`　（同签名共 3 处，另见 `base_types/platforms/brawler/alternatives/BrawlerScriptUtil.txt:56`、`brawler/platforms/alternatives/BrawlerScriptUtil.txt:56`）
- **片段**：

```text
script Array<double> makex(Vec3 cxin)
   Array<double> c = Array<double>();
   Vec3 unitZ = Vec3.Construct(0.0, 0.0, 1.0);
   c = makecs(cxin, unitZ);
   return c;
end_script
```

- **演示要点**：演示 script 的参数：c, return

### script（launch_payload）｜脚本

- **关键词**：script, extern, if, 脚本
- **出处**：`space_operations/scripts/launch_payload.txt:17-22`　（同签名共 10 处，另见 `base_types/weapons/sam/blue_lr_sam_common.txt:327`、`base_types/weapons/ssm/red_mrbm_2.txt:213`、`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1.txt:360`）
- **片段**：

```text
script void on_stage_burnout(int aStage)
   extern int mPayloadStage;

   if (aStage != mPayloadStage) return;
   ExecuteAtTime(TIME_NOW+1.0, "LaunchPayload");
end_script
```

- **演示要点**：演示 script 的参数：extern, if

### script（general_scripts）｜脚本

- **关键词**：script, string, prompt, 脚本
- **出处**：`wargame/scripts/general_scripts.txt:134-139`
- **片段**：

```text
script void ready_up_prompt()
   string prompt = "When all players are connected press Ok to begin.<br><br> ";
   prompt += "<a doclink=\"warlock_demo.html\">Scenario Documentation</a>";
   
   WsfPrompt.DisplayAndPause("Ready Check", prompt);
end_script
```

- **演示要点**：演示 script 的参数：string, prompt

### script（behavior_force_overshoot）｜脚本

- **关键词**：script, if, else, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_force_overshoot.txt:25-31`　（同签名共 74 处，另见 `base_types/processors/quantum_agents/aiai/behavior_unload.txt:31`、`base_types/processors/ripr_agents/aiai/behavior_force_overshoot.txt:25`、`base_types/processors/ripr_agents/aiai/behavior_unload.txt:31`）
- **片段**：

```text
   script bool RanLastTick()
      if ((TIME_NOW-mLastProcTime) < 1.5*PROCESSOR.UpdateInterval())
      {
         return true;
      }
      else return false;
   end_script
```

- **演示要点**：演示 script 的参数：if, else

### script（aiss_processor）｜脚本

- **关键词**：script, string, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aiss/aiss_processor.txt:107-113`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aijam/aijam_processor.txt:294`）
- **片段**：

```text
   script WsfTrack GetJobsTrack(WsfRIPRJob aJob)

      string name = (string)aJob.GetData("targetTrackName");
     #extern WsfTrack GetTrackByName(WsfPlatform, string);
      WsfTrack track = GetTrackByName(PLATFORM, name);
      return track;
   end_script
```

- **演示要点**：演示 script 的参数：string, return

### script（observer）｜脚本

- **关键词**：script, int, double, 脚本
- **出处**：`air_to_air/observer.txt:74-81`
- **片段**：

```text
script void platformInitialized(WsfPlatform aPlatform)
   int ac_index = aPlatform.Index();
   double time = TIME_NOW;
   if(!aPlatform.CategoryMemberOf("missile"))
   {
      writeln("A/C ", ac_index, " at time ", Format.Fixed(time,2));
   }
end_script
```

- **演示要点**：演示 script 的参数：int, double

### script（aijam_processor）｜脚本

- **关键词**：script, static, return, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:127-134`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiss/aiss_processor.txt:96`）
- **片段**：

```text
   script WsfTaskManager GetTaskManager()
      static WsfTaskManager taskMgr;
      if( !taskMgr.IsValid() )
      {
         taskMgr = (WsfTaskManager)PLATFORM.Processor(mTaskManagerName);
      }
      return taskMgr;
   end_script
```

- **演示要点**：演示 script 的参数：static, return

### script（cvn_task_processor）｜脚本

- **关键词**：script, int, if, 脚本
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:198-205`　（同签名共 7 处，另见 `cyber/processors/red_radar_tactics.txt:24`、`cyber/exfiltrate_demo/platforms/red_radar_tactics.txt:23`、`electronic_warfare/test_false_targets/platforms/red_radar_tactics.txt:27`）
- **片段**：

```text
   script void deassignInterceptor()
      writeln("   !!! canceling tasks  !!!! ", PLATFORM.Name(), " cancelling for ", TRACK.TargetName());
      int numTasks = TasksAssignedFor(TRACK.TrackId());
      if (numTasks > 0)
      {
         CancelTask(TRACK.TrackId());
      }
   end_script
```

- **演示要点**：演示 script 的参数：int, if

### script（esm_detect_multi_beam_radar）｜脚本

- **关键词**：script, foreach, return, 脚本
- **出处**：`electronic_warfare/esm_detect_multi_beam_radar.txt:296-305`　（同签名共 46 处，另见 `electronic_warfare/esm_detect_multi_sensor_radar.txt:402`、`base_types/processors/quantum_agents/aiai/behavior_escort.txt:58`、`base_types/processors/quantum_agents/aiai/behavior_go_home.txt:41`）
- **片段**：

```text
script bool FindStr(Array< string > aArray, string aKey)
   foreach (string key in aArray)
   {
      if (key == aKey)
      {
         return true;
      }
   }
   return false;
end_script
```

- **演示要点**：演示 script 的参数：foreach, return

### script（logistics_platform）｜脚本

- **关键词**：script, if, string, 脚本
- **出处**：`logistics/platforms/logistics_platform.txt:108-117`　（同签名共 7 处，另见 `space_operations/mission_design_astrolabe.txt:141`、`logistics/platforms/logistics_platform.txt:123`、`logistics/platforms/logistics_platform.txt:198`）
- **片段**：

```text
   script void SetFuelOfferingPlatform(WsfPlatform aPlatform)
      if (aPlatform == fuelOfferingPlatform) return;
      string oldP = "<unknown>";
      if (fuelOfferingPlatform.IsValid()) oldP = fuelOfferingPlatform.Name();
      string newP = "<unknown>";
      if (aPlatform.IsValid()) newP = aPlatform.Name();
      string msg = "Switched fuelOfferingPlatform from " + oldP + " to " + newP;
      Say(msg);
      fuelOfferingPlatform = aPlatform;
   end_script
```

- **演示要点**：演示 script 的参数：if, string

### script（tanking_scripts）｜脚本

- **关键词**：script, while, return, 脚本
- **出处**：`p6dof/scripts/tanking_scripts.txt:90-99`　（同签名共 2 处，另见 `six_dof/scripts/tanking_scripts.txt:90`）
- **片段**：

```text
script WsfFormationOffset ReparentOffsetBeforeTanking(string aName)
   WsfFormation form = WsfFormationManager.GetFormation(aName);
   WsfFormationOffset retval = WsfFormationOffset.Construct(0.0, 0.0, 0.0, false);
   while (form.IsValid() && !form.IsRoot())
   {
      retval = WsfFormationOffset.Add(retval, form.GetOffset());
      form = form.GetParentFormation();
   }
   return retval;
end_script
```

- **演示要点**：演示 script 的参数：while, return

### script（brawler_behaviors）｜脚本

- **关键词**：script, dir0, double, 脚本
- **出处**：`six_dof/scripts/brawler_behaviors.txt:187-197`　（同签名共 2 处，另见 `six_dof_with_brawler/scripts/brawler_behaviors.txt:187`）
- **片段**：

```text
script void PullGMaxSust(WsfPlatform aPlatform)

	Vec3 vp = aPlatform.VelocityNED();
	Array<double> rot = makeh(vp);
	Vec3 dir0 = Vec3.Construct(0.001, 0.0, -1.0);
	dir0 = vxfrmc2(rot, dir0);
	dir0.Normalize();
	double spd0 = 3.0;
	
	aPlatform.FlyVectorWithThrottle(dir0, 0.0, spd0);
end_script
```

- **演示要点**：演示 script 的参数：dir0, double

### script（behavior_evade）｜脚本

- **关键词**：script, for, return, 脚本
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_evade.txt:57-68`　（同签名共 25 处，另见 `base_types/processors/quantum_agents/aiww/behavior_buddy_evade.txt:63`、`base_types/processors/timeline_agents/behavior_evade.txt:59`、`behavior_tree/processors/quantum_agents/aiai/selector_evade.txt:58`）
- **片段**：

```text
   script WsfThreatProcessor GetThreatProcessor()
      for (int i=0; i<PLATFORM.ProcessorCount(); i+=1)
      {
         WsfProcessor proc = PLATFORM.ProcessorEntry(i);
         if (proc.IsValid() && proc.IsA_TypeOf("WSF_THREAT_PROCESSOR"))
         {
            return (WsfThreatProcessor)proc;
         }
      }
      WsfThreatProcessor empty;
      return empty;
   end_script
```

- **演示要点**：演示 script 的参数：for, return

### script（rules_utils）｜脚本

- **关键词**：script, t_phase, user, 脚本
- **出处**：`air_to_air/prdata/rules_utils.txt:456-468`
- **片段**：

```text
script bool time_check(WsfPlatform me)
/*
PURPOSE   determine if i've been in my current phase long enough
AUTHOR   Snyder

Parameter Description
   t_phase time in which I can change phase
   user required to set t_phase when changing faz
*/
bool time_ok=false;
if (TIME_NOW > me->t_phase) { time_ok = true; }
return time_ok;
end_script
```

- **演示要点**：演示 script 的参数：t_phase, user

### script（tactical_maneuvers）｜脚本

- **关键词**：script, else, mode, 脚本
- **出处**：`p6dof/tactical_maneuvers.txt:236-248`　（同签名共 5 处，另见 `p6dof/p6dof_types/scripts/acm_scripts.txt:188`、`six_dof/pm6_tactical_maneuvers.txt:236`、`six_dof/rb6_tactical_maneuvers.txt:236`）
- **片段**：

```text
   script void PerformSlicebackRoll(WsfPlatform aPlatform, string aCallbackName)
      RollToBankAngle(aPlatform, targetBankAngle_deg);  // Roll to the target bank angle
      if( diving )
      {
         SetPitchGLoad(aPlatform, 0.0);
      }
      else
      {
         SetPitchGLoad(aPlatform, 1.0);
      }
      mode = "PERFORMING_SLICEBACK_ROLL";
      writeln("*** PerformSlicebackRoll ***");
   end_script
```

- **演示要点**：演示 script 的参数：else, mode

### script（gun）｜脚本

- **关键词**：script, double, if, 脚本
- **出处**：`base_types/weapons/other/gun.txt:51-64`　（同签名共 17 处，另见 `brawler/weapons/other/gun.txt:51`、`signature_demos/platforms/rocket.txt:77`、`shooter/test.txt:14`）
- **片段**：

```text
   script void on_weapon_target_engagement(WsfPlatform aTarget)
      WsfPlatform weapon = WeaponPlatform();
      WsfPlatform target = aTarget;
      double slantrange = weapon.SlantRangeTo(TargetLocationAtLaunch());
      if ((!target.IsValid()) || (!weapon.IsValid()))
      {
         return;
      }
     #if (slantrange > 1300)
      if (slantrange > 650)   #meters
      {
         SetPkDegrade(0.5);
      }
   end_script
```

- **演示要点**：演示 script 的参数：double, if

### script（p6dof_complex_scripts）｜脚本

- **关键词**：script, double, else, 脚本
- **出处**：`p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:83-96`　（同签名共 16 处，另见 `p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:98`、`six_dof/scripts/six_dof_complex_scripts.txt:81`、`six_dof/scripts/six_dof_complex_scripts.txt:96`）
- **片段**：

```text
script void PushbackLeft(WsfPlatform aPlatform, string aCallbackName)
   double multiplier = 1.0;
   WsfMover mover = aPlatform.Mover();
   if(mover.IsA_TypeOf("WSF_P6DOF_MOVER"))
   {
      WsfP6DOF_Mover p6dofMover = (WsfP6DOF_Mover)mover;
      multiplier = GetPushbackForceMultiplier(p6dofMover.GetTotalWeight() * Math.LB_PER_KG());
      Pushback(aPlatform, multiplier, -1.0, aCallbackName);
   }
   else
   {
      writeln("--ERROR-- Not a P6DOF Mover.");
   }
end_script
```

- **演示要点**：演示 script 的参数：double, else

### script（blue_team_hints）｜脚本

- **关键词**：script, string, hint, 脚本
- **出处**：`wargame/scripts/blue_team_hints.txt:19-34`　（同签名共 4 处，另见 `wargame/scripts/green_team_hints.txt:19`、`wargame/scripts/purple_team_hints.txt:20`、`wargame/scripts/red_team_hints.txt:19`）
- **片段**：

```text
script void blue_hint()
   string hint;
   hint += "<h1 style=\"color:green;text-align:center;\">Green Base Location:</h1>";  
   hint += "<p style=\"font-size:10pt;text-align:center;\">Located South East and";
   hint += " 255 km of your current position.</p>";  
   
   hint += "<h1 style=\"color:red;text-align:center;\">Red Base Location:</h1>";  
   hint += "<p style=\"font-size:10pt;text-align:center;\">Located directly East and ";
   hint += "350 km of your current position.</p>";
   
   hint += "<h1 style=\"color:purple;text-align:center;\">Purple Base Location:</h1>";  
   hint += "<p style=\"font-size:10pt;text-align:center;\">Located North East and ";
   hint += "275 km of your current position.</p>";
      
   WsfPrompt.Display("Intel Debriefing", hint);
end_script
```

- **演示要点**：演示 script 的参数：string, hint

### script（six_dof_flight_envelope）｜脚本

- **关键词**：script, string, else, 脚本
- **出处**：`six_dof/six_dof_flight_envelope.txt:289-305`　（同签名共 2 处，另见 `six_dof/six_dof_flight_envelope.txt:307`）
- **片段**：

```text
script void WriteOutMilEnvelope(string aPlatformName)
   FileIO output = FileIO();
   string path = "output/" + aPlatformName + "_" + milEnvelopeFilename;
   if(output.Open(path, "out"))
   {
      output.Writeln("Velocity_fps,Altitude_ft");
      for(int i = 0; i < mMilEnvelope.Size(); i = i + 1)
      {
         output.Writeln(write_str(mMilEnvelope[i]->velocity_fps, ",", mMilEnvelope[i]->altitude_ft));
      }
      output.Close();
   }
   else
   {
      writeln("File: ", milEnvelopeFilename, " failed to open for writing.");
   }
end_script
```

- **演示要点**：演示 script 的参数：string, else

### script（aisoc_processor_fez）｜脚本

- **关键词**：script, if, for, 脚本
- **出处**：`base_types/processors/ripr_agents/aisoc/aisoc_processor_fez.txt:46-63`　（同签名共 11 处，另见 `space_operations/scripts/schedule.txt:180`、`base_types/processors/quantum_agents/aigci/behavior_create_clustering_jobs.txt:76`、`base_types/processors/ripr_agents/aigci/behavior_create_clustering_jobs.txt:80`）
- **片段**：

```text
      script void draw_cluster_hull(WsfCluster cluster)
        Array<WsfGeoPoint> pts = cluster.ConvexHull();
        //writeln_d("   ~~~ SOC cluster convex hull pts: ", pts.Size());
        if (pts.Size() <= 0)
        {
           return;
        }
        WsfGeoPoint first = pts.Get(0);
        mDraw.BeginPolyline();
          for (int j = 0; j < pts.Size(); j = j + 1 )
          {
             WsfGeoPoint pt = pts.Get(j);
             mDraw.Vertex(pt);
             //writeln_d("   ~~~ SOC cluster convex hull pt ", j+1, ": ", pt.Latitude(), ", ", pt.Longitude());
          }
          mDraw.Vertex(first);
        mDraw.End();
      end_script
```

- **演示要点**：演示 script 的参数：if, for

### script（satellite_breakup）｜脚本

- **关键词**：script, int, for, 脚本
- **出处**：`space_operations/satellite_breakup.txt:82-99`　（同签名共 2 处，另见 `space_operations/lasercomm_scripted.txt:77`）
- **片段**：

```text
script void FragmentReport(WsfNASA_BreakupModel aModel)
   FileIO outfile = FileIO();
   outfile.Open("./output/fragment_details.csv", "out");
   int count = aModel.GetFragmentCount();
   outfile.Writeln("Index, Length [m], A/M [kg/m^2], M [kg], A [m^2], Delta V [m/s], Name");
   for (int i = 0; i < count; i += 1)
   {
      WsfSatelliteBreakupFragment fragment = aModel.GetFragment(i);
      outfile.Write((string)i + ", ");
      outfile.Write((string)fragment.GetLength() + ", ");
      outfile.Write((string)fragment.GetAoverM() + ", ");
      outfile.Write((string)fragment.GetMass() + ", ");
      outfile.Write((string)fragment.GetArea() + ", ");
      outfile.Write((string)fragment.GetDeltaV().Magnitude() + ", ");
      outfile.Write(fragment.GetName() + "\n");
   }
   outfile.Close();
end_script
```

- **演示要点**：演示 script 的参数：int, for

### script（simple_auto_jamming）｜脚本

- **关键词**：script, foreach, if, 脚本
- **出处**：`electronic_warfare/simple_auto_jamming.txt:214-232`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:354`）
- **片段**：

```text
   script void FindTrackId()
      WsfLocalTrackList tracklist = PLATFORM.MasterTrackList();
      writeln("Count: ", tracklist.Count());
      foreach (WsfLocalTrack track in PLATFORM.MasterTrackList())
      {
         if (track.TargetName() == PLATFORM.Name())
         {
            writeln("*** Found track.");
            mMyTrackId = track.TrackId();
         }
      }
      WsfLocalTrack track = PLATFORM.TrackList("blue_data_mgr").Find(mMyTrackId);
      if (track.IsValid())
      {
         track.Initialize();
         track.SetSide(PLATFORM.Side());
         track.SetAirDomain();
      }
   end_script
```

- **演示要点**：演示 script 的参数：foreach, if

### script（p6dof_flight_envelope）｜脚本

- **关键词**：script, double, bool, 脚本
- **出处**：`p6dof/p6dof_types/scripts/p6dof_flight_envelope.txt:176-194`　（同签名共 2 处，另见 `six_dof/scripts/six_dof_flight_envelope.txt:176`）
- **片段**：

```text
script void ComputeStep2(WsfP6DOF_Mover aPlatform)
   double currentVelocity = (minCanFlyVelocity + feVelocityStep_fps) / feVelocityStep_fps;
   currentVelocity = Math.Floor(currentVelocity) * feVelocityStep_fps;

   bool completed = false;
   while(currentVelocity <= feFinalVelocity_fps && !completed)
   {
      if(ComputeMinFlightAltitude(aPlatform, currentVelocity, feInitialAltitude_ft, feFinalAltitude_ft, feAltitudeStep_ft))
      {
         ComputeMaxFlightAltitude(aPlatform, currentVelocity, minCanFlyAltitude, feFinalAltitude_ft, feAltitudeStep_ft);
      }
      else //There is no altitude at which the platform can fly for the given speed
      {
         completed = true;
      }

      currentVelocity = currentVelocity + feVelocityStep_fps;
   }
end_script
```

- **演示要点**：演示 script 的参数：double, bool

### script（tactical_maneuvers）｜脚本

- **关键词**：script, bool, else, 脚本
- **出处**：`p6dof/tactical_maneuvers.txt:300-337`　（同签名共 12 处，另见 `p6dof/tactical_maneuvers.txt:344`、`p6dof/p6dof_types/scripts/acm_scripts.txt:253`、`p6dof/p6dof_types/scripts/acm_scripts.txt:335`）
- **片段**：

```text
   script void ProcessSliceback(WsfPlatform aPlatform, string aCallbackName)

      bool modeAchieved = false;

      if( mode == "PERFORMING_SLICEBACK_ROLL" )
      {
         modeAchieved = SlicebackRollAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRoll achieved...");
            PerformSlicebackPitch(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_PITCH" )
      {
         modeAchieved = SlicebackPitchAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackPitch achieved...");
            PerformSlicebackRollout(aPlatform,aCallbackName);
         }
      }
      else if( mode == "PERFORMING_SLICEBACK_ROLLOUT" )
      {
         modeAchieved = SlicebackRolloutAchieved(aPlatform);
         if(modeAchieved)
         {
            writeln("  SlicebackRollout achieved...");
            CompleteSliceback(aPlatform,aCallbackName);
         }
      }

      if( mode != "IDLE" )
      {
         aPlatform.ExecuteAtTime(TIME_NOW + 0.01, "ProcessSliceback", {aPlatform,aCallbackName});
      }

   end_script
```

- **演示要点**：演示 script 的参数：bool, else

### script（flight_envelope）｜脚本

- **关键词**：script, int, else, 脚本
- **出处**：`p6dof/flight_envelope.txt:242-280`
- **片段**：

```text
script void WriteOutDotPlot()
   FileIO output = FileIO();
   if(output.Open(milDotFilename, "out"))
   {
   output.Writeln("Can Fly,,,Can Fly No Control,,,Can Not Fly");
   output.Writeln("Velocity_fps,Altitude_ft,,Velocity_fps,Altitude_ft,,Velocity_fps,Altitude_ft");

   int i = 0;
   while( i < mCanFly.Size() ||
          i < mCanFlyNoControl.Size() ||
          i < mCanNotFly.Size())
   {
      string s1 = ",";
      if(i < mCanFly.Size())
      {
        s1 = write_str(mCanFly[i]->velocity_fps, ",", mCanFly[i]->altitude_ft);
      }

      string s2 = ",";
      if(i < mCanFlyNoControl.Size())
      {
        s2 =  write_str(mCanFlyNoControl[i]->velocity_fps, ",", mCanFlyNoControl[i]->altitude_ft);
      }

      string s3 = ",";
      if(i < mCanNotFly.Size())
      {
         s3 =  write_str(mCanNotFly[i]->velocity_fps, ",", mCanNotFly[i]->altitude_ft);
      }

      i = i + 1;
   }
   output.Close();
   }
   else
   {
      writeln("File:", milDotFilename, " failed to open for writing.");
   }
end_script
```

- **演示要点**：演示 script 的参数：int, else

### script（p6dof_flight_envelope）｜脚本

- **关键词**：script, else, return, 脚本
- **出处**：`p6dof/p6dof_types/scripts/p6dof_flight_envelope.txt:204-242`
- **片段**：

```text
script Array<struct> ComputeFlightEnvelope(WsfPlatform aPlatform, double aThrottle, double aFlaps)
   Array<struct> returnVal = Array<struct>();

   throttleSetting = aThrottle;
   flapSettings = aFlaps;

   bottomSide.Clear();
   topSide.Clear();

   WsfMover mover = aPlatform.Mover();
   if(mover.IsA_TypeOf("WSF_P6DOF_MOVER"))
   {
      WsfP6DOF_Mover           p6dofMover = (WsfP6DOF_Mover)mover;
      WsfP6DOF_MoverTestObject testObj    = p6dofMover.__getTestObject();
      testObj.SetMasterNoLagTesting(true);
      testObj.SetMasterFreezeAltitude(true);
      testObj.SetMasterFreezeFuelBurn(true);
      testObj.SetMasterFreezeLocation(true);

      ComputeStep1(p6dofMover);
      ComputeStep2(p6dofMover);
      ComputeStep3(p6dofMover);
   }
   else
   {
      writeln("--ERROR-- Not a P6DOF Mover.");
   }

   for(int i = 0; i < topSide.Size(); i = i + 1)
   {
      returnVal.PushBack(topSide[i]);
   }
   for(int i = bottomSide.Size() - 1; i >= 0; i = i - 1)
   {
      returnVal.PushBack(bottomSide[i]);
   }

   return returnVal;
end_script
```

- **演示要点**：演示 script 的参数：else, return

### script（sam_launch_test）｜脚本

- **关键词**：script, foreach, double, 脚本
- **出处**：`p6dof/sam_launch_test.txt:137-185`　（同签名共 2 处，另见 `six_dof/six_dof_sam_launch_test.txt:120`）
- **片段**：

```text
script void SimulationComplete()

   foreach (int key : struct value in mData)
   {
      //If object flew the entire time.
      if(value->totalFlightTime_sec == -1)
      {
         value->totalFlightTime_sec = TIME_NOW;
         writeln("Warning: Platform Id : ", key, " did not terminate, range data may be inaccurate.");
      }
   }
   /*
   foreach (int key : struct value in mData)
   {
      writeln("Platform Id : ", key, "  Launch Angle : ", value->launchAngle_deg, " deg");
      writeln(" max altitude = ", value->maxAltitude_m, " ft @ ", value->timeMaxAltitude_sec, " sec");
      writeln(" max speed = ", value->maxSpeed_mps, " mps @ ", value->timeMaxAltitude_sec, " sec");
      writeln(" range = ", value->maxRange_km, " km");
      writeln(" flightTime = ", value->totalFlightTime_sec, " sec");
   }*/

   double time = 0;
   double range = 0;
   double angle = 0;
   double speed = 0;
   double apogee = 0;

   foreach (int key : struct value in mData)
   {
      if(value->maxRange_km > range)
      {
         time = value->totalFlightTime_sec;
         range = value->maxRange_km;
         angle = value->launchAngle_deg;
         speed = value->maxSpeed_mps;
         apogee = value->maxAltitude_m;
      }
   }

   writeln("***************************************");
   writeln("   Max Range Shot Information");
   writeln("Launch Angle : ", angle,  " deg");
   writeln("Max Range    : ", range,  " km");
   writeln("Flight Time  : ", time,   " sec");
   writeln("Max Speed    : ", speed,  " mps");
   writeln("Apogee       : ", apogee, " m");
   writeln("***************************************");

end_script
```

- **演示要点**：演示 script 的参数：foreach, double

### script（six_dof_flight_envelope）｜脚本

- **关键词**：script, string, int, 脚本
- **出处**：`six_dof/six_dof_flight_envelope.txt:238-287`
- **片段**：

```text
script void WriteOutDotPlot(string aPlatformName)
   FileIO output = FileIO();
   string path = "output/" + aPlatformName + "_" + milDotFilename;
   output.Open(path, "out");

   output.Writeln("Can Fly,,Can Fly No Control,,Can Not Fly");
   output.Writeln("Velocity_fps,Altitude_ft,Velocity_fps,Altitude_ft,Velocity_fps,Altitude_ft");

   int i = 0;
   while( i < mCanFly.Size() ||
          i < mCanFlyNoControl.Size() ||
          i < mCanNotFly.Size())
   {
      string s1 = ",";
      if(i < mCanFly.Size())
      {
         s1 = write_str(mCanFly[i]->velocity_fps, ",", mCanFly[i]->altitude_ft);
      }
      else
      {
         s1 = write_str(",");
      }

      string s2 = ",";
      if(i < mCanFlyNoControl.Size())
      {
         s2 = write_str(mCanFlyNoControl[i]->velocity_fps, ",", mCanFlyNoControl[i]->altitude_ft);
      }
      else
      {
         s2 = write_str(",");
      }

      string s3 = ",";
      if(i < mCanNotFly.Size())
      {
         s3 = write_str(mCanNotFly[i]->velocity_fps, ",", mCanNotFly[i]->altitude_ft);
      }
      else
      {
         s3 = write_str(",");
      }
      
      string s0 = write_str(s1, ",", s2, ",", s3);
      output.Writeln(s0);

      i = i + 1;
   }
   output.Close();
end_script
```

- **演示要点**：演示 script 的参数：string, int

### script（general_scripts）｜脚本

- **关键词**：script, string, bool, 脚本
- **出处**：`wargame/scripts/general_scripts.txt:15-71`
- **片段**：

```text
script void playerCheck()
   string prompt = "";
   
   bool redPlayer = false;
   bool greenPlayer = false;
   bool purplePlayer = false;
   bool bluePlayer = false;   
   
   for(int i = 0; i < WsfSimulation.PlatformCount(); i = i + 1)
   {
      WsfPlatform pltfm = WsfSimulation.PlatformEntry(i);
      if(pltfm.Side() == "blue")
      {
         bluePlayer = true;
      }
      else if(pltfm.Side() == "green")
      {
         greenPlayer = true;
      }
      else if(pltfm.Side() == "red")
      {
         redPlayer = true;
      }
      else if(pltfm.Side() == "purple")
      {
         purplePlayer = true;
      }
   }
   
   if(!redPlayer || !purplePlayer || !greenPlayer || !bluePlayer)
   {
      prompt += "The following players are missing from the scenario:<br><br>";
      
      if(!bluePlayer)
      {
         prompt += "BLUE<br>";
      }
      
      if(!redPlayer)
      {
         prompt += "RED<br>";
      }
   
      if(!greenPlayer)
      {
         prompt += "GREEN<br>";
      }
      
      if(!purplePlayer)
      {
         prompt += "PURPLE<br>";
      }
      
      WsfPrompt.Display("Players Missing", prompt);
   }
   
end_script
```

- **演示要点**：演示 script 的参数：string, bool

### script（range_endurance_test）｜脚本

- **关键词**：script, foreach, else, 脚本
- **出处**：`p6dof/range_endurance_test.txt:227-289`　（同签名共 3 处，另见 `six_dof/six_dof_range_endurance_test.txt:227`、`base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:525`）
- **片段**：

```text
script void RunsCompleted()
   DataStruct maxRange = DataStruct();
   DataStruct maxEndurance = DataStruct();

   foreach (int key : DataStruct value in mData)
   {
      if(value.flightTime_sec > maxEndurance.flightTime_sec)
      {
         maxEndurance.startAltitude_m = value.startAltitude_m;
         maxEndurance.startVelocity_mps = value.startVelocity_mps;
         maxEndurance.flightTime_sec = value.flightTime_sec;
         maxEndurance.flightRange_km = value.flightRange_km;
      }
      if(value.flightRange_km > maxRange.flightRange_km)
      {
         maxRange.startAltitude_m = value.startAltitude_m;
         maxRange.startVelocity_mps = value.startVelocity_mps;
         maxRange.flightTime_sec = value.flightTime_sec;
         maxRange.flightRange_km = value.flightRange_km;
      }
      //For information on all Flights uncomment this block
      /*
      writeln("***************************************");
      writeln("   Flight Information for index ", key);
      writeln("Max Range      : ", value.flightRange_km, " km");
      writeln("Flight Time    : ", value.flightTime_sec, " sec");
      writeln("Start Altitude : ", value.startAltitude_m, " m");
      writeln("Start Speed    : ", value.startVelocity_mps, " m/s");
      writeln("***************************************");
      */
   }

   writeln("Total Run Count : ", maxNumberOfRuns);

   if(maxNumberOfRuns > 1)
   {
      //If multiple runs were done, output the maxRange and maxEndurance runs only
      writeln("***************************************");
      writeln("   Max Range Flight Information");
      writeln("Max Range      : ", maxRange.flightRange_km,  " km  (", 1000.0 * maxRange.flightRange_km * MATH.NM_PER_M(), " nm)");
      writeln("Flight Time    : ", maxRange.flightTime_sec / 60.0, " minutes (", maxRange.flightTime_sec / 3600.0, "hrs)");
      writeln("Start Altitude : ", maxRange.startAltitude_m, " meters  (", maxRange.startAltitude_m * MATH.FT_PER_M(), " ft)");
      writeln("Start Speed    : ", maxRange.startVelocity_mps, " m/s  (", maxRange.startVelocity_mps * MATH.NM_PER_M() * 3600.0," knots)");
      writeln("***************************************");
      writeln("   Max Endurance Flight Information");
      writeln("Max Range      : ", maxEndurance.flightRange_km,  " km  (", 1000.0 * maxEndurance.flightRange_km * MATH.NM_PER_M(), " nm)");
      writeln("Flight Time    : ", maxEndurance.flightTime_sec / 60.0,   " minutes (", maxEndurance.flightTime_sec / 3600.0, "hrs)");
      writeln("Start Altitude : ", maxEndurance.startAltitude_m, " meters  (", maxEndurance.startAltitude_m * MATH.FT_PER_M(), " ft)");
      writeln("Start Speed    : ", maxEndurance.startVelocity_mps, " m/s  (", maxEndurance.startVelocity_mps * MATH.NM_PER_M() * 3600.0," knots)");
      writeln("***************************************");
   }
   else
   {
      //If only 1 run was done, just output the information once
      writeln("***************************************");
      writeln("   Flight Information ");
      writeln("Max Range      : ", maxRange.flightRange_km, " km  (", 1000.0 * maxRange.flightRange_km * MATH.NM_PER_M(), " nm)");
      writeln("Flight Time    : ", maxRange.flightTime_sec / 60.0, " minutes (", maxRange.flightTime_sec / 3600.0, "hrs)");
      writeln("Start Altitude : ", maxRange.startAltitude_m, " meters  (", maxRange.startAltitude_m * MATH.FT_PER_M(), " ft)");
      writeln("Start Speed    : ", maxRange.startVelocity_mps, " m/s  (", maxRange.startVelocity_mps * MATH.NM_PER_M() * 3600.0," knots)");
      writeln("***************************************");
   }
end_script
```

- **演示要点**：演示 script 的参数：foreach, else

### script（iads_cmdr）｜脚本

- **关键词**：script, bool, foreach, 脚本
- **出处**：`orwaca_iads/platforms/iads_cmdr.txt:208-294`
- **片段**：

```text
   script void AssignmentStop()
       bool haveEngageAuthority = HaveEngageAuthority();
       bool cancel = true;
       foreach (WsfPlatform sub in AssigneesForTask(TRACK.TrackId(), "ENGAGE"))
       {
         string subType = sub.Type();
         cancel = (! haveEngageAuthority);
         if (haveEngageAuthority)
         {
            cancel = ((TRACK.TimeSinceUpdated()) > 60 ||
                      (TRACK.BelievedDead())          ||
                      ( ! TRACK.WithinZoneOf(sub, "battalion_sector"))  ||
                      (AvailableRoundsOnSub(sub) == 0));
            if (! cancel)
            {
               Array<WsfPlatform>SubCandidateList = Array<WsfPlatform>();
               Array<WsfPlatform>SubPriorityList = Array<WsfPlatform>();
               foreach (WsfPlatform submaybe in PLATFORM.Subordinates())
               {
                  string submaybeType = submaybe.Type();
                  if (!WeaponListMap.Exists(submaybeType)) continue; #sub not in our list
                  if ((TRACK.TimeSinceUpdated() < 60) &&
                      (TRACK.WithinZoneOf(sub, "battalion_sector")) &&
                      (AvailableRoundsOnSub(submaybe) > 0))
                  {
                     SubCandidateList.PushBack(submaybe);
                  }
               }
               if (! SubCandidateList.Empty())
               {
                  int currentpriority = 999999;
                  foreach(WsfPlatform submaybe1 in SubCandidateList)
                  {
                     string submaybe1Type = submaybe1.Type();
                     Array<int>subPriorityMaxAssignmentsArray = WeaponListMap.Get(submaybe1Type);
                     int subPriority = subPriorityMaxAssignmentsArray.Get(0);
                     if(subPriority <= currentpriority)
                     {
                        if (SubPriorityList.Size() < MAX_ASSIGNMENTS_PER_TARGET)
                        {
                           currentpriority = subPriority;
                           SubPriorityList.PushBack(submaybe1);
                        }
                        else if(SubPriorityList.Size() <= MAX_ASSIGNMENTS_PER_TARGET)
                        {
                            foreach(WsfPlatform subassign in SubPriorityList)
                            {
                               string subassigntype = subassign.Type();
                               Array<int>subPriorityMaxAssignmentsArray = WeaponListMap.Get(subassigntype);
                               int subassignpriority = subPriorityMaxAssignmentsArray.Get(0);
                               if (subPriority < subassignpriority)
                               {
                                  SubPriorityList.Erase(subassign);
                                  SubPriorityList.PushBack(submaybe1);
                                  currentpriority = subPriority;
                               }
                               else if((subPriority == subassignpriority) && (sub.GroundRangeTo(TRACK) < subassign.GroundRangeTo(TRACK)))
                               {
                                  SubPriorityList.Erase(subassign);
                                  SubPriorityList.PushBack(sub);
                               }
                            }
                         }
                      }
                   }
                   if ( ! SubPriorityList.Empty())
                   {
                      cancel = true;
                      foreach(WsfPlatform submaybe2 in SubPriorityList)
                      {
                         if(submaybe2.Name() == sub.Name())
                         {
                            cancel = false;
                         }
                      }
                   }
                }
             }
          }
          if (cancel)
          {
             #writeln(TIME_NOW, " Canceling assignment to ", sub.Name());
             CancelTask(sub, TRACK.TrackId(), "ENGAGE");
          }

       }
   end_script
```

- **演示要点**：演示 script 的参数：bool, foreach

### script（red_sam_battery_tactics）｜脚本

- **关键词**：script, return, 脚本
- **出处**：`aea_iads/processors/red_sam_battery_tactics.txt:49-51`　（同签名共 321 处，另见 `aea_iads/processors/red_sam_battery_tactics.txt:55`、`aea_iads/processors/red_sam_battery_tactics.txt:66`、`aea_iads/processors/red_sam_battery_tactics.txt:71`）
- **片段**：

```text
   script bool FiringNow()
      return (WeaponsActiveFor(TRACK.TrackId()) > 0);
   end_script
```

- **演示要点**：演示 script 的参数：return

### script（logistics_platform）｜脚本

- **关键词**：script, if, 脚本
- **出处**：`logistics/platforms/logistics_platform.txt:97-100`　（同签名共 143 处，另见 `logistics/processors/platform_to_platform_transport_processor.txt:43`、`logistics/processors/shuttle_transport_processor.txt:37`、`logistics/processors/strike_controller.txt:47`）
- **片段**：

```text
   script void Say(string aMsg)
      if ((runSilent || gDebugNone) && (! gDebugAll)) return;
      writeln("At t=", TIME_NOW,", ",PLATFORM.Name(), " - ", aMsg);
   end_script
```

- **演示要点**：演示 script 的参数：if

### script（30mm_bullet）｜脚本

- **关键词**：script, double, 脚本
- **出处**：`ciws/weapons/guns/30mm_bullet.txt:74-77`　（同签名共 34 处，另见 `coverage_demos/scripts/point_to_geo.txt:15`、`base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:74`、`space_operations/launch_vehicles/launcher_one/test.txt:47`）
- **片段**：

```text
    script void on_create(WsfPlatform aWeapon, WsfTrack aTarget)
       double LAUNCH_VEL = MATH.RandomUniform(AVG_VEL-VARIANCE, AVG_VEL+VARIANCE);
       aWeapon.SetVelocityECS(LAUNCH_VEL, 0, 0);  # Just like launch_delta_v...
    end_script
```

- **演示要点**：演示 script 的参数：double

### script（launch）｜脚本

- **关键词**：script, staging_failure, 脚本
- **出处**：`space_operations/scenarios/launch.txt:53-56`
- **片段**：

```text
script void MoverBroken(WsfPlatform aPlatform, WsfMover aMover)
   writeln("!!!Do something here ", TIME_NOW);
   staging_failure = true; #This tells interceptor to cue into launch vehicle path and attempt to intercept
end_script
```

- **演示要点**：演示 script 的参数：staging_failure

### script（starlink_generator）｜脚本

- **关键词**：script, string, 脚本
- **出处**：`space_operations/scenarios/starlink_generator.txt:156-160`　（同签名共 18 处，另见 `outer_air_battle/processors/cvn_task_processor.txt:231`、`satellite_demos/processors/dynamic_link_processor.txt:20`、`satellite_demos/processors/dynamic_link_processor.txt:28`）
- **片段**：

```text
script void SpecializeMember(FileIO aFile, int aPlane, int aSat)
   WriteCrosslinkChanges(aFile, aPlane, aSat);
   string name = GenerateName(aPlane, aSat);
   WriteDownlinkChanges(aFile, name);
end_script
```

- **演示要点**：演示 script 的参数：string

### script（aijam_processor）｜脚本

- **关键词**：script, for, 脚本
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:728-733`　（同签名共 26 处，另见 `base_types/processors/ripr_agents/aijam/aijam_processor.txt:735`、`base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:31`、`base_types/processors/ripr_agents/aiai/behavior_radar-control_new.txt:31`）
- **片段**：

```text
  script void UnBidAllJobsAllChannels(WsfRIPRProcessor commander)
    for (int i = 0; i < GetNumJobChannels(); i = i + 1)
    {
      commander.ClearBidsFor(PROCESSOR, i);
    }
  end_script
```

- **演示要点**：演示 script 的参数：for

### script（tactical_maneuvers）｜脚本

- **关键词**：script, mode, 脚本
- **出处**：`p6dof/tactical_maneuvers.txt:250-255`　（同签名共 15 处，另见 `p6dof/tactical_maneuvers.txt:257`、`p6dof/tactical_maneuvers.txt:264`、`p6dof/p6dof_types/scripts/acm_scripts.txt:202`）
- **片段**：

```text
   script void PerformSlicebackPitch(WsfPlatform aPlatform, string aCallbackName)
      SetRollRate(aPlatform, 0.0);
      SetPitchGLoad(PLATFORM, targetGLoad);
      mode = "PERFORMING_SLICEBACK_PITCH";
      writeln("*** PerformSlicebackPitch ***");
   end_script
```

- **演示要点**：演示 script 的参数：mode

### script（schedule）｜脚本

- **关键词**：script, int, 脚本
- **出处**：`space_operations/scripts/schedule.txt:45-51`　（同签名共 6 处，另见 `engage/scripts/utility_scripts.txt:639`、`satellite_demos/platforms/iridium.txt:317`、`space_operations/scripts/tapsolver.txt:276`）
- **片段**：

```text
   script void AddStop(int aWhich)
      int w = aWhich + mNSched;
      int temp = mRoute[mNSched];
      mRoute[mNSched] = mRoute[w];
      mRoute[w] = temp;
      mNSched += 1;
   end_script
```

- **演示要点**：演示 script 的参数：int

### script（detection_writes）｜脚本

- **关键词**：script, foreach, 脚本
- **出处**：`aea_iads/detection_writes.txt:33-41`　（同签名共 9 处，另见 `aea_iads/report_writes.txt:113`、`aea_iads/track_writes.txt:79`、`base_types/processors/ripr_agents/aigci/aigci_processor.old.txt:342`）
- **片段**：

```text
script bool FindStr(Array<string> aArray, string aKey)
   foreach (string key in aArray)
   {
      if (key == aKey)
      {
         return true;
      }
   }
end_script
```

- **演示要点**：演示 script 的参数：foreach

### script（p6dof_complex_scripts）｜脚本

- **关键词**：script, else, 脚本
- **出处**：`p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:164-174`　（同签名共 161 处，另见 `p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:176`、`six_dof/pm6_tactical_maneuvers.txt:385`、`six_dof/pm6_tactical_maneuvers.txt:397`）
- **片段**：

```text
script void BeginSteepTakeOff(WsfPlatform aPlatform, double aMinRotateSpeed_mps, double aClimbOutAngle_deg, string aCallback)
   if(aPlatform.Speed() >= aMinRotateSpeed_mps)
   {
     SetAutopilotPitchAngle(aPlatform, 30.0);
     CheckForWeightOnWheels(aPlatform, aClimbOutAngle_deg, aCallback);
   }
   else
   {
      aPlatform.ExecuteAtTime(TIME_NOW + .05, "BeginSteepTakeOff", {aPlatform, aMinRotateSpeed_mps, aClimbOutAngle_deg, aCallback});
   }
end_script
```

- **演示要点**：演示 script 的参数：else

### script（launch_payload）｜脚本

- **关键词**：script, extern, 脚本
- **出处**：`space_operations/scripts/launch_payload.txt:24-34`
- **片段**：

```text
script void LaunchPayload()
   extern string mPayloadType;

   writeln("Launching payload of type '", mPayloadType, "'");
   WsfPlatform sat = WsfSimulation.CreatePlatform(mPayloadType);
   WsfSpaceMover sm = (WsfSpaceMover)(sat.Mover());
   sm.SetOrbit(PLATFORM.LocationECI(), PLATFORM.VelocityECI());
   WsfSimulation.AddPlatform(sat, "<default>");
   writeln("Deleting launch vehicle");
   WsfSimulation.DeletePlatform(Name());
end_script
```

- **演示要点**：演示 script 的参数：extern

### script（linkable_targets_processor）｜脚本

- **关键词**：script, bool, 脚本
- **出处**：`space_operations/processors/linkable_targets_processor.txt:38-55`　（同签名共 3 处，另见 `cyber/processors/telar_task_mgr.txt:139`、`orwaca_iads/processors/telar_task_mgr.txt:139`）
- **片段**：

```text
   script
      bool CanLink(WsfComm aComm, WsfPlatform aTarget)
         bool canLink = false;
         
            if (aComm.CategoryMemberOf("linkable") && 
               !aComm.GroupMemberOf("DEDICATED_COMM") && 
                WithinFieldOfRegard(Comm_Orientation(aComm), aTarget))                  
            {
               if ((aComm.GroupMemberOf("DOWNLINK") && (aTarget.GroupMemberOf("UPLINK"))) ||
                   (aComm.GroupMemberOf("UPLINK") && (aTarget.GroupMemberOf("DOWNLINK"))) ||
                   (aComm.GroupMemberOf("CROSSLINK") && (aTarget.GroupMemberOf("CROSSLINK"))))
               {
                  canLink = true;
               }
            }
                  
         return canLink;
   end_script
```

- **演示要点**：演示 script 的参数：bool

### script（run_me_first）｜脚本

- **关键词**：script, bullet_gen_line, 脚本
- **出处**：`gun_engagement/run_me_first.txt:119-188`
- **片段**：

```text
script void CreateLaunchComputerGeneratorFile()
     extern double MUZZLE_VELOCITY_MS;
     extern double BULLET_MAX_RANGE_LCG;
     string WeaponToolFileName   = write_str("weapons/guns/" , BULLET_NAME, "_buildertool.txt");
     FileIO BulletGenFile = FileIO();
     BulletGenFile.Open(WeaponToolFileName, "out");
     string bullet_gen_line;
     bullet_gen_line = write_str("# This file was automatically generated by the gun_demo script.\n",
                                 "# It is the launch computer generator for the bullet and is run separately.\n");
     BulletGenFile.Writeln(bullet_gen_line);

     // This map will store the range and average velocity so we can create the launch computer
     bullet_gen_line = write_str(
       "script_variables\n",
       "  Map<double, double> RangeVelMap = Map<double, double>();\n",
       "end_script_variables");
     BulletGenFile.Writeln(bullet_gen_line);

     // include the weapon file we just created
     bullet_gen_line = write_str("include " , BULLET_NAME,".txt\n");
     BulletGenFile.Writeln(bullet_gen_line);

     bullet_gen_line = write_str(
          "platform_type MYWEAP ", BULLET_NAME, "\n" ,
          "   processor StoreRangeVelInfo WSF_SCRIPT_PROCESSOR\n",
          "      script_variables\n",
          "         extern Map<double, double> RangeVelMap;\n",
          "      end_script_variables\n",
          "      update_interval 0.01 seconds\n",
          "      on_update\n",
          "         RangeVelMap.Set(PLATFORM.GroundRangeTo(0,0,0), ((MUZZLE_VELOCITY_MS + PLATFORM.Speed()) / 2));\n",
          "      end_on_update\n",
          "   end_processor\n",
          "end_platform_type\n");
     BulletGenFile.Writeln(bullet_gen_line);

     bullet_gen_line = write_str(
     "weapon MYWEAP WSF_EXPLICIT_WEAPON\n",
     "   launched_platform_type    MYWEAP\n",
     "   weapon_effects            ", BULLET_NAME, "_LETHALITY\n",
     "   quantity                  1\n",
     "   firing_delay              0 secs\n",
     "   launch_delta_v            ", MUZZLE_VELOCITY_MS, " 0 0 m/s\n",
     "end_weapon\n");
   BulletGenFile.Writeln(bullet_gen_line);
   bullet_gen_line = write_str(
       "platform LAUNCH_PLATFORM WSF_PLATFORM\n",
       "   side red\n",
       "   add weapon myweap MYWEAP\n",
       "      firing_delay 0.0 sec\n",
       "      tilt 0.0 degrees\n",
       "   end_weapon\n" ,
       "   position 0n 0e altitude 500 m" );
   BulletGenFile.Writeln(bullet_gen_line);
   bullet_gen_line = write_str(
       "   add processor fire_once WSF_SCRIPT_PROCESSOR\n",
       "      execute at_time 0.000001 sec absolute\n",
       "         WsfWeapon weapon = PLATFORM.Weapon(\"myweap\");\n",
       "         weapon.Fire();\n",
       "         PROCESSOR.TurnOff();\n",
       "      end_execute\n",
       "   end_processor\n",
       "end_platform\n");
   BulletGenFile.Writeln(bullet_gen_line);

   bullet_gen_line = write_str("#event_pipe\n",
                               "   #file ",  BULLET_NAME, "_replay.aer\n",
                               "#end_event_pipe");
   BulletGenFile.Writeln(bullet_gen_line);
end_script
```

- **演示要点**：演示 script 的参数：bullet_gen_line

### script（sensor_observer）｜脚本

- **关键词**：script, 脚本
- **出处**：`air_to_air/sensor_observer.txt:394-395`　（同签名共 395 处，另见 `cyber/observer.txt:23`、`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:28`、`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:31`）
- **片段**：

```text
script void SensorDrop(WsfPlatform observer, WsfSensor sensor, WsfTrack track)
end_script
```

- **演示要点**：演示 script（最小结构，无子参数）

### script_interface（draw_demo）｜脚本接口

- **关键词**：script_interface, debug, 脚本接口
- **出处**：`draw/draw_demo.txt:226-228`　（同签名共 5 处，另见 `electronic_warfare/comm_jamming.txt:56`、`gun_engagement/processors/gun_battery_tactics.txt:11`、`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:35`）
- **片段**：

```text
script_interface
   debug
end_script_interface
```

- **演示要点**：演示 script_interface 的参数：debug

### script_interface（red_multirole_fighter_2_ripr）｜脚本接口

- **关键词**：script_interface, 脚本接口
- **出处**：`base_types/platforms/red_multirole_fighter_2_ripr.txt:18-20`　（同签名共 22 处，另见 `hel/ground_hel_vs_hypersonic.txt:83`、`hel/intersect_mesh_test.txt:237`、`iads/observer_test.txt:10`）
- **片段**：

```text
script_interface
   //debug
end_script_interface
```

- **演示要点**：演示 script_interface（最小结构，无子参数）

### script_struct（struct_test）｜脚本结构体

- **关键词**：script_struct, script_variables, script, 脚本结构体
- **出处**：`outer_air_battle/struct_test.txt:10-19`　（同签名共 3 处，另见 `space_operations/scripts/comm_link.txt:18`、`space_operations/scripts/schedule.txt:15`）
- **片段**：

```text
      script_struct Car
         script_variables
            WsfGeoPoint  position;
            Vec3         velocity;
            string       color = "red";
         end_script_variables
         script void Honk()
            writeln(color, " car honks");
         end_script
      end_script_struct
```

- **演示要点**：演示 script_struct 的参数：script_variables, script

### script_struct（p6dof_flight_envelope）｜脚本结构体

- **关键词**：script_struct, script_variables, 脚本结构体
- **出处**：`p6dof/p6dof_types/scripts/p6dof_flight_envelope.txt:9-14`　（同签名共 16 处，另见 `six_dof/scripts/six_dof_flight_envelope.txt:9`、`outer_air_battle/processors/cvn_task_processor.txt:11`、`p6dof/range_endurance_test.txt:66`）
- **片段**：

```text
script_struct DataPair
   script_variables
      double velocity_fps = 0;
      double altitude_ft = 0;
   end_script_variables
end_script_struct
```

- **演示要点**：演示 script_struct 的参数：script_variables

### script_variables（launch_weapon_processor）｜脚本变量

- **关键词**：script_variables, string, double, bool, int, 脚本变量
- **出处**：`ballistic/processors/launch_weapon_processor.txt:18-25`　（同签名共 55 处，另见 `ballistic_missile_shootdown/processors/launch_ssm_processor.txt:18`、`orwaca_iads/processors/launch_tbm_processor.txt:11`、`coverage_demos/processors/sat_exclusion_angle_proc.txt:17`）
- **片段**：

```text
   script_variables
      string WEAPON_NAME = " ";  # this is set in the platform_type definition
      double TIME_TO_LAUNCH = 0;  #if scenario doesn't give time, it will fire first pass
      bool LAUNCH_RANDOM    = 0;  # Default is not to fire at a random time
      double MIN_TIME       = 10.0; # Minumum time a missile can launch
      double MAX_TIME    = 1000.0; # Max time a missile can launch
      int trackIndex     = 0;   # Don't change this; used internally
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：string, double, bool, int

### script_variables（comm_link）｜脚本变量

- **关键词**：script_variables, string, int, bool, static, 脚本变量
- **出处**：`space_operations/scripts/comm_link.txt:20-33`　（同签名共 3 处，另见 `satellite_demos/platforms/iridium.txt:97`、`space_operations/platforms/iridium_satellite.txt:22`）
- **片段**：

```text
   script_variables
      WsfComm local_comm;
      WsfComm remote_comm;
      string local_platform_name = "";
      string remote_platform_name = "";
      int    remote_platform_index = 0; // for erasing drawn link lines
      string remote_comm_name = "";
      string local_comm_name = "";
      bool   is_linking  = false;
      bool   is_linked   = false;
      bool   is_dedicated = false;
      Map<string, WsfTrack> linkable_targets = {};
      static string sDEDICATED = "(DEDICATED)";
   end_script_variables   
```

- **演示要点**：演示 script_variables 的参数：string, int, bool, static

### script_variables（orbit_rules）｜脚本变量

- **关键词**：script_variables, bool, double, extern, int, 脚本变量
- **出处**：`air_to_air/rules/orbit_rules.txt:30-77`　（同签名共 2 处，另见 `air_to_air/rules/route_rules.txt:28`）
- **片段**：

```text
   script_variables

#      extern WsfBrawlerProcessor BRAWLER;
      WsfPerceptionProcessor    perception;

      //**********************************************************************//
      //** debugging parameters                                             **//
      //**********************************************************************//
      bool     mDrawSteering     = false;

      //**********************************************************************//
      //********* VARIABLES BELOW THIS LINE ARE NOT FOR USER EDITING *********//
      //**********************************************************************//
      WsfDraw  mDraw             = WsfDraw();
      double   mLastTime         = 0.0;
   
#      extern Array<string> pr_pos_bias;
      extern WsfPlatform iacid;
      extern double pr_speed;
      extern double pr_altitude;
      extern double pr_heading;
      extern int rte_ind;
      extern string faz;
      extern string rule_type;
      extern bool bng_fuel;
      Vec3 desdir;
      Vec3 dir0;
      extern WsfGeoPoint home_base;
      Atmosphere atm = Atmosphere.Construct("default");
      extern bool log_print;
         extern string log_path;
         extern string iout_path;
      extern bool iout_print;
      int cap_ind;
      WsfGeoPoint CAP1;
      WsfGeoPoint CAP2;
      WsfGeoPoint CAP3;
      WsfGeoPoint CAP4;
      Array<WsfGeoPoint> CAP_POINTS = Array<WsfGeoPoint>();
      double cspd2 = (iacid->orbit_spd*atm.SonicVelocity(iacid.Altitude()))^2;
      double cgees = iacid->orbit_gees;
      double grav = 32.17405*MATH.M_PER_FT(); // m/s**2
#      extern WsfBrawlerMover my_mover;
      extern string reason;
      extern FileIO iout;
      extern FileIO log;

   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, double, extern, int

### script_variables（behavior_radar-control）｜脚本变量

- **关键词**：script_variables, bool, string, double, 脚本变量
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_radar-control.txt:17-22`　（同签名共 46 处，另见 `base_types/processors/ripr_agents/aiai/behavior_radar-control.txt:17`、`heatmap/processors/quantum_agents/aiai/behavior_radar-control.txt:17`、`space_operations/processors/establish_link_processor.txt:23`）
- **片段**：

```text
   script_variables
      bool                   mTurnOnFiringRadarInRange = false;
      string                 mFiringRadarName          = "radar";    // replace with sensor name on platform
      double                 mFiringRadarRange         = 1852 * 50;  // 50 nautical miles (units: meters)
      bool                   mTurnOnFiringRadarIfRWR   = true;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, string, double

### script_variables（timed_ac）｜脚本变量

- **关键词**：script_variables, time_before_refueling, total_station_time, refuel_waypoint_label, 脚本变量
- **出处**：`outer_air_battle/platforms/timed_ac.txt:24-29`
- **片段**：

```text
      script_variables
         time_before_refueling = 1000.0;
         total_station_time    = 3000.0;
         refuel_waypoint_label = "cap_refuel";
         go_home_waypoint_label= "go_home";
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：time_before_refueling, total_station_time, refuel_waypoint_label

### script_variables（6th_Hohmann_leo_orbit_transfer_demo）｜脚本变量

- **关键词**：script_variables, bool, int, double, 脚本变量
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:79-85`　（同签名共 72 处，另见 `base_types/processors/timeline_agents/timeline_proc_fsm.txt:28`、`ciws/observer_bullseye.txt:11`、`satellite_demos/5th_iridium_flares_demo.txt:45`）
- **片段**：

```text
      script_variables
         bool mInitialBurnComplete = false;
         int k = 0.0;
         double mManeuverPhase;
         double mTOF;
         bool mInitialized = false;
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, int, double

### script_variables（behavior_launch_alert-5_aircraft）｜脚本变量

- **关键词**：script_variables, string, int, bool, 脚本变量
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_launch_alert-5_aircraft.txt:18-24`　（同签名共 3 处，另见 `base_types/processors/ripr_agents/aigci/behavior_launch_alert-5_aircraft.txt:18`、`laser_designator/platforms/soldier_jtac.txt:46`）
- **片段**：

```text
   script_variables
      //public
      string  mFlightLeadToSupport    =  "fighter_flight_lead";
      int     mSalvoCount             =  2;
      //private
      bool    mLaunched               =  false;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：string, int, bool

### script_variables（blue_multirole_fighter_2_task_processor）｜脚本变量

- **关键词**：script_variables, string, double, int, 脚本变量
- **出处**：`outer_air_battle/processors/blue_multirole_fighter_2_task_processor.txt:13-22`　（同签名共 22 处，另见 `laser_designator/platforms/uav.txt:37`、`electronic_warfare/track_error.txt:76`、`launcher/platforms/tactics_processor1.txt:21`）
- **片段**：

```text
   script_variables
      string aam          = "blue_lr_a2a_rf_missile";
      double flyout       = 60.0;

      string activeTarget = "Active target";     # used in aux data command
      string evalTime     = "Evaluation time";   # used in aux data command
      int currentRouteIndex = -1;
      Map<string, bool> deassigned = Map<string, bool>();
      string currentTarget;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：string, double, int

### script_variables（select_wpn）｜脚本变量

- **关键词**：script_variables, bool, double, extern, 脚本变量
- **出处**：`air_to_air/rules/select_wpn.txt:63-83`　（同签名共 6 处，另见 `air_to_air/rules/sam_shoot_it.txt:45`、`air_to_air/rules/shoot_it.txt:46`、`air_to_air/rules/intercept_rules.txt:28`）
- **片段**：

```text
   script_variables
#      extern WsfBrawlerProcessor BRAWLER;
      WsfPerceptionProcessor    perception;
      //**********************************************************************//
      //** debugging parameters                                             **//
      //**********************************************************************//
      bool     mDrawSteering     = false;
      //**********************************************************************//
      //********* VARIABLES BELOW THIS LINE ARE NOT FOR USER EDITING *********//
      //**********************************************************************//
      WsfDraw  mDraw             = WsfDraw();
      double   mLastTime         = 0.0;  
      extern Map<WsfSA_EntityPerception, string> mapPRMISL_AC;
      extern Map<WsfSA_EntityPerception, int> mapMXTGTD;
      extern Map<WsfSA_EntityPerception, int> mapMXTGT_AC;
      extern bool iout_print;
      extern string iout_path;
      extern string reason;
      extern Array<double> RPEAK_LOC;
      extern Array<string> PROTECTING;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, double, extern

### script_variables（cvn_task_processor）｜脚本变量

- **关键词**：script_variables, int, double, struct, 脚本变量
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:31-56`
- **片段**：

```text
   script_variables
      int numERC = 4;
      int numMRC = 6;
      int numAEW = 2;
      double separationERC = 30.0;
      double separationMRC = 45.0;
      double launchCycle   = 90.0; # minutes
      double nextERClaunch = -1.0;
      double nextMRClaunch = -1.0;
      double nextAEWlaunch = -1.0;

      struct ERC = struct.New("launchParameters");
         ERC->num    = numERC;
         ERC->type   = "BLUE_MULTIROLE_FIGHTER_2_ERC";
         ERC->prefix = "erc-";
      struct MRC = struct.New("launchParameters");
         MRC->num    = numMRC;
         MRC->type   = "BLUE_MULTIROLE_FIGHTER_2_MRC";
         MRC->prefix = "mrc-";
      struct AEW = struct.New("launchParameters");
         AEW->num    = numAEW;
         AEW->type   = "BLUE_PROP_AWACS_1";
         AEW->prefix = "aew-";

      int numberToAssign = 1;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：int, double, struct

### script_variables（observer）｜脚本变量

- **关键词**：script_variables, double, int, extern, 脚本变量
- **出处**：`air_to_air/observer.txt:10-36`
- **片段**：

```text
script_variables
   double total_aircraft  = 0;
   double total_sam       = 0;
   double red_aircraft    = 0;
   double red_sam         = 0;
   double blue_aircraft   = 0;
   double blue_sam        = 0;
   double blue_total_ac   = 0;
   double blue_total_sam  = 0;
   double red_total_ac    = 0;
   double red_total_sam   = 0;
   double total_total_ac  = 0; 
   double total_total_sam = 0;
   int total_entities     = 0;   
   
#  extern int math_seed;
   extern string log_path;
   extern bool iout_print;
   extern bool log_print;
   #WsfGeoPoint origin = WsfGeoPoint();
   origin.Set(0,0,0);
   
   #MTC added two data containers to account for dead aircraft returning NULL 
   #implemented initially on every missile fired, dealt with in msl endgame
   Array<WsfPlatform> dead_aircraft = Array<WsfPlatform>();
   Array<int> msl_sht_tgt = Array<int>();
end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double, int, extern

### script_variables（alv_task_mgr）｜脚本变量

- **关键词**：script_variables, double, string, struct, 脚本变量
- **出处**：`alv_routing/processors/alv_task_mgr.txt:18-48`　（同签名共 2 处，另见 `aea_iads/platforms/soj.txt:31`）
- **片段**：

```text
   script_variables
      # Track time since updated to consider track stale
      double mTrackUpdateStaleTime = 10.0;   # seconds

      # MUST BE DIFFERENT FOR EACH JAMMER TASK MANAGER CONTROLLING DIFFERENT SYSTEMS
      string mJamTaskStr = "ALV_JAM";   # Reset to all caps in the on_initialize script below.

      # Map of the previous signal count for the given track Id
      Map<WsfTrackId, int> mSignalCountMap = Map<WsfTrackId, int>();


      # Default technique to assign for threats not defined in mThreatTechniqueMap below
      string mDefaultTechnique = "noise_jamming";

      # Available types: noise_jamming, random_pulse_jamming, false_target_jamming,
      #                  simple_false_target_jamming, track_error, jtos_gain_jamming
      Map<string, struct> mThreatData = Map<string, struct>();

      // EW Ground Radar
      struct ew_data = struct();
      ew_data->mAssign = true;
      ew_data->mTechnique = "noise_jamming";

      // Create data map for use by scripts
      # Must be top level names or types, does not drill into sub-types
      mThreatData["EARLY_WARNING_SENSOR"] = ew_data;

      # Must be top level names or types, does not drill into sub-types
      Map<string, bool> mWeaponAssignMap = Map<string, bool>();
      mWeaponAssignMap["ALV_JAMMER"]   = true;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double, string, struct

### script_variables（behavior_create_point_job）｜脚本变量

- **关键词**：script_variables, int, string, 脚本变量
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_create_point_job.txt:16-19`　（同签名共 21 处，另见 `base_types/processors/ripr_agents/aifl/behavior_create_point_job.txt:16`、`behavior_tree/processors/quantum_agents/aifl/behavior_create_point_job.txt:16`、`space_operations/demo_delta_iv_m.txt:59`）
- **片段**：

```text
   script_variables
      int maxJobWinnersForPursueTrack  = 1;
      string pointJobName = "-1";
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：int, string

### script_variables（combined_platform）｜脚本变量

- **关键词**：script_variables, double, bool, 脚本变量
- **出处**：`brawler/platforms/combined_platform.txt:90-93`　（同签名共 58 处，另见 `p6dof/processors/missile_seeker.txt:12`、`six_dof/processors/missile_seeker.txt:12`、`behavior_tree/processors/quantum_agents/aiai/priority_selector_checkpoint_1.txt:14`）
- **片段**：

```text
      script_variables
         double mVisualRange = 6.0 * MATH.M_PER_NM();
         bool   mTargetIsWVR = false;
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double, bool

### script_variables（aigci_processor）｜脚本变量

- **关键词**：script_variables, double, int, 脚本变量
- **出处**：`base_types/processors/ripr_agents/aigci/aigci_processor.txt:22-25`　（同签名共 14 处，另见 `script_demos/script_demo_3.txt:35`、`example_scripts/proc_mover_demo.txt:36`、`script_demos/script_demo_2.txt:233`）
- **片段**：

```text
   script_variables
      double   mJobStickiness       =  1.0;
      int      mJobAllocationMode   =  3;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double, int

### script_variables（blue_multirole_fighter_2_mrc）｜脚本变量

- **关键词**：script_variables, total_station_time, time_before_refueling, 脚本变量
- **出处**：`outer_air_battle/platforms/blue_multirole_fighter_2_mrc.txt:24-27`　（同签名共 2 处，另见 `outer_air_battle/platforms/blue_prop_awacs_1.txt:77`）
- **片段**：

```text
      script_variables
         total_station_time     = 3600.0 * 3.0;  # three hours
         time_before_refueling  = 3600.0 * 1.5;        # one hour
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：total_station_time, time_before_refueling

### script_variables（bomb_sequencers）｜脚本变量

- **关键词**：script_variables, bool, string, 脚本变量
- **出处**：`p6dof/bomb_sequencers.txt:244-248`　（同签名共 14 处，另见 `p6dof/bomb_sequencers.txt:327`、`six_dof/pm6_bomb_sequencers.txt:269`、`six_dof/pm6_bomb_sequencers.txt:352`）
- **片段**：

```text
   script_variables
      bool bombTriggerPulled = false;
      bool bombsRemain       = true;
      string activeRack      = "iron_bomb_aft_rack";
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, string

### script_variables（6th_Hohmann_leo_orbit_transfer_demo）｜脚本变量

- **关键词**：script_variables, string, double, 脚本变量
- **出处**：`satellite_demos/6th_Hohmann_leo_orbit_transfer_demo.txt:55-59`　（同签名共 11 处，另见 `outer_air_battle/platforms/TIMED_STATION_AC.txt:33`、`outer_air_battle/processors/station_timer.txt:104`、`hel/hel_test.txt:53`）
- **片段**：

```text
   script_variables
      string mTargetName = "target";
      double mDVp = 0.0;
      double mDVa = 0.0;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：string, double

### script_variables（behavior_interpret_zone_jobs）｜脚本变量

- **关键词**：script_variables, bool, int, 脚本变量
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:22-27`　（同签名共 5 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:22`、`base_types/processors/ripr_agents/aisoc/aisoc_processor.txt:24`、`base_types/processors/ripr_agents/aisoc/aisoc_processor_fez.txt:23`）
- **片段**：

```text
   script_variables
      bool   fastAndDirtyBidding   = false;
      int maxJobWinnersForPursueTrack  = 1;
      Map<string, string> ThreatTypeEngageZone = Map<string, string>();
      WsfRIPRJob mCurrentJob;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool, int

### script_variables（cloud_attenuation）｜脚本变量

- **关键词**：script_variables, double, static, 脚本变量
- **出处**：`space_operations/cloud_attenuation.txt:365-371`
- **片段**：

```text
      script_variables
         double lat = 80.0;
         double lon = -180.0;
         double alt = 100000.0;
         static double sLAT_STEP = 0.5;
         static double sLON_STEP = 0.5;
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double, static

### script_variables（test）｜脚本变量

- **关键词**：script_variables, global, 脚本变量
- **出处**：`shooter/test.txt:33-35`　（同签名共 9 处，另见 `electronic_warfare/esm_detect_multi_beam_radar.txt:272`、`electronic_warfare/esm_detect_multi_sensor_radar.txt:378`、`engage/grid_w_observer.txt:201`）
- **片段**：

```text
script_variables
  global Map< int, double > mPlatformDamageFactor = Map< int, double >();
end_script_variables
```

- **演示要点**：演示 script_variables 的参数：global

### script_variables（alv）｜脚本变量

- **关键词**：script_variables, double, 脚本变量
- **出处**：`alv_routing/platforms/alv.txt:69-71`　（同签名共 96 处，另见 `behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_1_task.txt:11`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_2_task.txt:11`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_3_task.txt:11`）
- **片段**：

```text
      script_variables
         double TimeLeft = 1;
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：double

### script_variables（BULLET_buildertool）｜脚本变量

- **关键词**：script_variables, extern, 脚本变量
- **出处**：`gun_engagement/weapons/guns/BULLET_buildertool.txt:11-13`　（同签名共 12 处，另见 `air_to_air/processors/assessment_scripts.txt:10`、`air_to_air/rules/ingress.txt:23`、`air_to_air/rules/egress.txt:19`）
- **片段**：

```text
      script_variables
         extern Map<double, double> RangeVelMap;
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：extern

### script_variables（behavior_anti-radiation_shot）｜脚本变量

- **关键词**：script_variables, bool, 脚本变量
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_anti-radiation_shot.txt:15-17`　（同签名共 90 处，另见 `base_types/processors/quantum_agents/aiai/behavior_bid_on_jobs.txt:16`、`base_types/processors/quantum_agents/aiai/behavior_targets_of_opportunity.txt:15`、`base_types/processors/ripr_agents/aiai/behavior_anti-radiation_shot.txt:15`）
- **片段**：

```text
   script_variables
      bool tempVariable;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：bool

### script_variables（escort）｜脚本变量

- **关键词**：script_variables, home_base, 脚本变量
- **出处**：`air_to_air/scenarios/escort.txt:362-364`　（同签名共 12 处，另见 `air_to_air/scenarios/escort.txt:392`、`air_to_air/scenarios/escort.txt:419`、`air_to_air/scenarios/escort.txt:450`）
- **片段**：

```text
   script_variables 
      home_base = WsfGeoPoint.Construct("00:00:00n 03:00:00.0e");
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：home_base

### script_variables（hvaa_dca）｜脚本变量

- **关键词**：script_variables, rule_type, 脚本变量
- **出处**：`air_to_air/scenarios/hvaa_dca.txt:96-98`
- **片段**：

```text
      script_variables 
         rule_type = "orbit";
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：rule_type

### script_variables（state_machine_striker）｜脚本变量

- **关键词**：script_variables, string, 脚本变量
- **出处**：`behavior_tree/platforms/state_machine_striker.txt:49-51`　（同签名共 14 处，另见 `engage/trackers/generic_tracker.txt:35`、`multiresolution_demos/comms/comm_include.txt:12`、`space_operations/processors/linkable_targets_processor.txt:22`）
- **片段**：

```text
      script_variables
         string currentState = "checkpoints_blue";
      end_script_variables
```

- **演示要点**：演示 script_variables 的参数：string

### script_variables（parallel_turn_left）｜脚本变量

- **关键词**：script_variables, int, 脚本变量
- **出处**：`behavior_tree/processors/quantum_agents/aiai/parallel_turn_left.txt:12-14`　（同签名共 20 处，另见 `behavior_tree/processors/quantum_agents/aiai/parallel_turn_right.txt:12`、`behavior_tree/processors/quantum_agents/aiai/parallel_wait.txt:12`、`comm/scripts/observer_black_van.txt:9`）
- **片段**：

```text
   script_variables
      int tick = 0;
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：int

### script_variables（oo_grid）｜脚本变量

- **关键词**：script_variables, weapon_name, 脚本变量
- **出处**：`engage/oo_grid.txt:31-33`
- **片段**：

```text
   script_variables
      weapon_name = "lrsam";
   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：weapon_name

### script_variables（setup）｜脚本变量

- **关键词**：script_variables, setup_bm_logging, 脚本变量
- **出处**：`iads_c2_demos/setup/setup.txt:17-19`
- **片段**：

```text
script_variables
   setup_bm_logging (">> [%Severity%] %Message%", "trace");
end_script_variables
```

- **演示要点**：演示 script_variables 的参数：setup_bm_logging

### script_variables（p6dof_complex_scripts）｜脚本变量

- **关键词**：script_variables, static, 脚本变量
- **出处**：`p6dof/p6dof_types/scripts/p6dof_complex_scripts.txt:52-55`　（同签名共 8 处，另见 `six_dof/scripts/six_dof_complex_scripts.txt:50`、`p6dof/tactical_maneuvers.txt:142`、`six_dof/pm6_tactical_maneuvers.txt:142`）
- **片段**：

```text
script_variables
   //This is total weight including fuel.
   static double PushbackScriptCalibratedPlatformWeight_lbs = 16300.0;
end_script_variables
```

- **演示要点**：演示 script_variables 的参数：static

### script_variables（ezja_script_variables）｜脚本变量

- **关键词**：script_variables, and, 脚本变量
- **出处**：`air_to_air/rules/ezja_script_variables.txt:11-118`
- **片段**：

```text
  script_variables 
/*
   This list of variables is required for using the EZJA WsfAdvancedBehaviorTree
   The variables are various assessment parameters utilized within the tree 
   Most of the variables are initialized in the on_initialize block of WSF_SA_PROCESSOR
   and they are updated in the on_update block of the WSF_SA_PROCESSOR
*/

#        platform and flight group objects
         WsfPlatform iacid = PLATFORM;
         WsfCommandChain iflite = PLATFORM.CommandChain("IFLITE");
         WsfCommandChain ielement = PLATFORM.CommandChain("ELEMENT");
         WsfTaskProcessor tsk_mgr = (WsfTaskProcessor)PLATFORM.Processor("tsk_mgr");
#         WsfBrawlerProcessor BRAWLER = (WsfBrawlerProcessor)PLATFORM.Processor("thinker");
#         WsfSituationAwarenessProcessor saPROC = (WsfSituationAwarenessProcessor)PLATFORM.Processor("assessment");

#        used for maneuver
         double pr_heading;           
         double pr_speed; 
         double pr_throttle;
         double pr_gees;
         double pr_altitude;
         
#        route
         WsfRoute ROUTE = WsfRoute();
         
#        assessment variables
         string faz_desired = "";        // desired faz to be in
         bool change_desired = false;    // true if i desire to change faz
         double t_phase;                 // sim time at which it is acceptable to change phase
         string flight_lead = "";        // flight lead
         bool dzr_change = false ;       // someone in this flight is desiring a phase change
         string dzr_phase = "";          // desired phase to change to
         bool flt_guiding;               // true if someone in my flight is guiding 
         bool time_ok;                   // indicates if i've been in current faz long enough to switch faz
         bool alerted;                   // true if i'm aware of a threat missile and feel threatened by it
         bool apole_tct;                 // true if i desire to perform an apole tactic (crank) when guiding missiles
         string reason;                  // reason i desire to change faz
         string RuleReason;              // reason i desire to change rule type
         string faz;                     // current phase of platform
         string rule_type;               // rule type of this platform
         bool needil;                    // set to true if me or my flight mates are guiding a missile
         Map<WsfSA_EntityPerception, bool> mapSTIFF_ARM = Map<WsfSA_EntityPerception,bool>(); // map of tracks to stiff arm
         Array<WsfLocalTrack> ill_list = Array<WsfLocalTrack>();                              // array of tracks i'm guiding missiles against
         int beans;                      // number of weapons I am supporting
         WsfLocalTrack ltrk_cls_hst;     // track of closest hostile to me, calculated in ftr_faz @ call to rng_close_host
         int n_pump;                     // number of pumps this A/C has performed
         bool first_pass;                // true if this is the first pass 
         bool attack_success;            // true if mission is complete
         bool react;                     // true if i will perform a pre-planned reaction on the first pass
         bool evd_msl;                   // true if i will turn cold to defeat a threat missile
         bool p_snip;                    // true if i will snip my missile prior to husky or autonomous state to prioritize survivability 
         bool p_pump;                    // probability that i will pump 
         bool pump_per;                  // if true, i have permission to pump, true if p_pump is true and when guiding missiles, p_snip is true
         bool solo = false;              // true if i will break from my flight and become my own flight lead
         bool dead_buddy;                // do I have a dead wingman
         bool onrail;                    // true if a missile is on the rail (pickle button pressed, waiting for missile to launch)
         bool stiff_arm_all;             // true to stiff arm all threats
         bool ing4last;                  // whether or not to pursue an egressing target
         bool spiked;                    // is an A/C spiking me
         bool sam_spiked;                // is a sam spiking me
         bool msl_spike;                 // is a missile spiking me
         double rng_cls_hst;             // range to closest hostile A/C
         bool buddy_hot;                 // determine if someone in my flight is hot to threats
         bool hot_asp;                   // determine if someone is hot to me and within a threatening range
         bool threatnd;                  // am I threatened
         bool sam_threatnd;              // is a SAM threatening to me
         double rng_cls_sam;             // range to closest hostile SAM
         bool bng_msl;                   // true if i'm winchester
         bool bng_fuel;                  // true if i'm bingo fuel
         bool joker_fuel;                // true if i'm joker fuel
         bool flt_lead;                  // true if i am the flight lead
         bool el_lead;                   // true if i am the element lead
         double t_last_pickle;           //time that you last pickled (for switchology considerations)
         
         

//       Misc variables
         WsfGeoPoint home_base = WsfGeoPoint.Construct("00:00:00n 01:30:00.0w"); // base location
#         WsfGeoPoint home_base = (WsfGeoPoint) PLATFORM.Location();
         bool in_pos; # used for the formation flying ( true if in position)
         double t_faz_switch; // time at which I changed phase to my current phase
         int rte_ind; // route point index, increase as you hit your route points
         WsfTrack TaskTrack = WsfTrack(); // track of IADS assignment
         Atmosphere atmos = Atmosphere.Construct("standard_day");

//       WEAPON RULES
//       calculated in tgt_bias
         Map<WsfLocalTrack, double> mapSCORE = Map<WsfLocalTrack, double>(); // prioritization score of each track
         Array<WsfSA_EntityPerception> shoot_list = Array<WsfSA_EntityPerception>();  # my shoot list
         WsfSA_EntityPerception ppmjid = WsfSA_EntityPerception(); #highest prioritized target
         
//       calculated in select weapon
         Map<WsfSA_EntityPerception, int> mapMXTGT_AC = Map<WsfSA_EntityPerception, int>(); #Max number of missiles at a single target by a single player
         Map<WsfSA_EntityPerception, int>  mapMXTGTD = Map<WsfSA_EntityPerception, int>();  #Max number of missiles at a single target
         Map<WsfSA_EntityPerception, string> mapPRMISL_AC = Map<WsfSA_EntityPerception, string>(); # fox number selected

//       calculated in shoot_it
         Map<WsfSA_EntityPerception, bool> mapPICKLE = Map<WsfSA_EntityPerception, bool>(); // determine whether or not to pickle at track
         bool pitch_up; // if I'm ready to shoot and desire an assisted loft tactic, pitch up
         Array<WsfPlatform> guid_list = Array<WsfPlatform>();

         int counter = 5;
         bool no_tree;  // true if I will skip the behavior tree
//       create a mover object to my referenced in various places
#         WsfBrawlerMover my_mover = (WsfBrawlerMover) PLATFORM.Mover();

   end_script_variables
```

- **演示要点**：演示 script_variables 的参数：and

### script_variables（reactive_maneuvers_esams）｜脚本变量

- **关键词**：script_variables, struct, 脚本变量
- **出处**：`engage/targets/reactive_maneuvers_esams.txt:31-174`
- **片段**：

```text
script_variables
   #The angles used for target aspect angles (ASPVAL)
   #Note that number of angles (ASPNUM) does NOT need to be defined,
   #as we can just check the array size.
   aspectAngles = {45.0, 135.0, -45.0, -135.0};

   #Define each maneuver criteria here, based on the values contained
   #in each Maneuver struct, providing ESAMS-like variable entry
   #In ESAMS, typical limitations were ten maneuvers, but there is
   #no hard limit in WSF
   struct maneuver0 = struct.New("Maneuver");
   struct maneuver1 = struct.New("Maneuver");
   struct maneuver2 = struct.New("Maneuver");
   struct maneuver3 = struct.New("Maneuver");
   struct maneuver4 = struct.New("Maneuver");
   struct maneuver5 = struct.New("Maneuver");
   struct maneuver6 = struct.New("Maneuver");
   struct maneuver7 = struct.New("Maneuver");
   struct maneuver8 = struct.New("Maneuver");
   struct maneuver9 = struct.New("Maneuver");
   #Add more if needed

   #Fill each struct with the values found in a typical ESAMS input file
   #A summary of the input values are as follows:
   #
   #VARIABLE_NAME         VALUE   DESCRIPTION
   #
   #maneuver_type         1       Turn away from weapon
   #                      2       Put weapon on beam
   #                      3       Turn to cross missile velocity
   #                      4       Turn left
   #                      5       Turn right
   #                      6       Aspect control
   #                      7       Turn to put site on beam
   #                      8       Extend (fly staight and level)
   #                      9       Turn to put site on beam, imperfect site knowledge
   #                      10      Slice
   #
   #trigger               0       Simulation time
   #                      1       Time since acquisition of target
   #                      2       NOT DEFINED
   #                      3       Time since track of target
   #                      4       Time since weapon launch (closest weapon)
   #                      5       Time until impact (earliest impact)
   #                      6       Time since MAR detection
   #                      7       Range to weapon(closest weapon), MAR dependent
   #                      8       Range to weapon(closest weapon), MAR independent
   #                      9       Time since illumination
   #
   #timeToStart           double  Time to start manuever
   #
   #timeToStop            double  Time to stop maneuver
   #
   #timeTerminalStart     double  Time before impact to start terminal maneuver
   #
   #angleAzMin            double  Minimum and max azimuth ranges, relative to target ECS, in
   #angleAzMax            double  which the site must be to trigger maneuver. Here, it is
   #                              assumed the tracker and launcher (the site) are at the same
   #                              physical location. Setting both to 0 disregards this check
   #
   #rangeMin              double  Minimum and max range from the target to the site that
   #rangeMax              double  triggers maneuver use. It is assumed the tracker and lancher
   #                              (the site) are at the same physical location. Used for range to
   #                              to weapon instead for triggers 7 and 8. Setting both to 0 disregards
   #                              the check
   #
   #terminalManeuver      0       Vertical pull
   #                      1       Other maneuvers not currently implemented - require greater
   #                      X       fidelity than the current mover

   #Like ESAMS, each maneuver has independent variables. It is possible to overlap
   #these so that simulation conditions (such as setting two maneuvers for the same
   #values for simulation time triggers) preclude one or more maneuvers from being used
   #Again, like ESAMS, the first maneuver encountered that satisfies trigger conditions
   #will be used, so that the ordering of these maneuvers can change the target
   #reactive maneuver behavior.
   #
   #It is also not necessary to fill any values that are not being used, as all values
   #are initialized to default to values that are ignored. The additional values being defined
   #here, despite being inconsequential, are done for completeness of the example
   #
   #Finally, note that maneuvers are currently checked at an interval of .1 s, matching the
   #original ESAMS maneuver delta time with the update time of the basic_maneuver_processor.
   #Note that any time intervals set on these maneuvers with a start time/end time differing
   #by less than the .1 second evaluation interval may never be triggered by missing the
   #start time trigger.
   maneuver0->maneuver_type     = 4;      #(TYPMAN)
   maneuver0->trigger           = 0;      #(EVENTM)
   maneuver0->timeToStart       = 5.00;   #(XMB)
   maneuver0->timeToStop        = 15.0;   #(XMF)
   maneuver0->timeTerminalStart = 0.0;    #(XMT)
   maneuver0->angleAzMin        = -90.0;  #(AMB)
   maneuver0->angleAzMax        = 90.0;   #(AMF)
   maneuver0->rangeMin          = 0.0;    #(RMB)
   maneuver0->rangeMax          = 0.0;    #(RMF)
   maneuver0->terminalManeuver  = -1;     #(PULTYP)

   maneuver1->maneuver_type     = 5;      #(TYPMAN)
   maneuver1->trigger           = 0;      #(EVENTM)
   maneuver1->timeToStart       = 15.0;   #(XMB)
   maneuver1->timeToStop        = 25.0;   #(XMF)
   maneuver1->timeTerminalStart = 0.0;    #(XMT)
   maneuver1->angleAzMin        = 0.0;    #(AMB)
   maneuver1->angleAzMax        = 0.0;    #(AMF)
   maneuver1->rangeMin          = 0.0;    #(RMB)
   maneuver1->rangeMax          = 0.0;    #(RMF)
   maneuver1->terminalManeuver  = -1;     #(PULTYP)

   #If defining a terminal maneuver, it is not necessary
   #to define most of these values
   #maneuver2->maneuver_type     = -1;     #(TYPMAN)
   #maneuver2->trigger           = -1;     #(EVENTM)
   #maneuver2->timeToStart       = 0.0;    #(XMB)
   #maneuver2->timeToStop        = 0.0;    #(XMF)
   maneuver2->timeTerminalStart = 30.0;    #(XMT)
   #maneuver2->angleAzMin        = 0.0;    #(AMB)
   #maneuver2->angleAzMax        = 0.0;    #(AMF)
   #maneuver2->rangeMin          = 0.0;    #(RMB)
   #maneuver2->rangeMax          = 0.0;    #(RMF)
   maneuver2->terminalManeuver  = 0;       #(PULTYP)

   #Fill the maneuver list with the above defined maneuvers.
   #If not using reactive maneuvers, don't fill the list
   maneuverList[0] = maneuver0;
   maneuverList[1] = maneuver1;
   maneuverList[2] = maneuver2;
#   maneuverList[3] = maneuver3;
#   maneuverList[4] = maneuver4;
#   maneuverList[5] = maneuver5;
#   maneuverList[6] = maneuver6;
#   maneuverList[7] = maneuver7;
#   maneuverList[8] = maneuver8;
#   maneuverList[9] = maneuver9;


   #Provide the maximum angle value that imperfect knowledge of site locations
   #will be off by. This is used, in combination with a random number draw, to
   #define the error in measuring site location for maneuvers. This value was
   #typically defined in ESAMS with the RWR azimuth error values
   #Note that this value is tied to the simulation seed, so that the error value
   #generated for one run will be the same for all runs.
   siteAzError = 5.0;

end_script_variables
```

- **演示要点**：演示 script_variables 的参数：struct

### script_variables（behavior_alt1516_bvr_end_run_left）｜脚本变量

- **关键词**：script_variables, 脚本变量
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt1516_bvr_end_run_left.txt:13-14`　（同签名共 211 处，另见 `base_types/processors/quantum_agents/aiai/behavior_manage-fuel.txt:16`、`base_types/processors/quantum_agents/aiai/behavior_manage-signature.txt:16`、`base_types/processors/ripr_agents/aiai/behavior_manage-fuel.txt:16`）
- **片段**：

```text
   script_variables
   end_script_variables
```

- **演示要点**：演示 script_variables（最小结构，无子参数）

### state（sam_battery）｜状态机状态

- **关键词**：state, next_state, return, double, bool, if, 状态机状态
- **出处**：`suppressor/platforms/sam_battery.txt:138-161`
- **片段**：

```text
    state ENGAGED
      next_state CANCELED
        return ((TasksReceivedFor(TRACK.TrackId(), "Engage") == 0) ||
                ShouldICancel());
      end_next_state

      next_state LAUNCHED
        WsfWeapon weapon = PLATFORM.Weapon("missile");
        double relTgtAlt = PLATFORM.RelativeAltitudeOf(TRACK);

        bool firedWeapon = false;
        if ((weapon.QuantityRemaining() > 0)               &&
            (relTgtAlt > 50)                               &&
            (relTgtAlt < 15000)                            &&
            (PLATFORM.GroundRangeTo(TRACK) < 45000)        &&
            (PLATFORM.RelativeHeadingOf(TRACK) > 95))
        {
          weapon.CueToTrack(TRACK);
          firedWeapon = weapon.FireSalvo(TRACK, 2);
        }

        return firedWeapon;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, return, double, bool, if

### state（bomber）｜状态机状态

- **关键词**：state, next_state, bool, if, else, return, 状态机状态
- **出处**：`suppressor/platforms/bomber.txt:100-124`
- **片段**：

```text
    state ENGAGING
      next_state DETECTED
        bool exitState = false;
        WsfWeapon weapon = PLATFORM.Weapon("bomber_weapon");
        if (TRACK.IFF_Friend()                              ||
            (! TRACK.WithinZoneOf(PLATFORM, "target_area")) ||
            (weapon.QuantityRemaining() < 1))
        {
           exitState = true;
        }
        else if ((PLATFORM.RelativeBearingTo(TRACK) < 70)   && // REL-SUB-HDG < 70.0 (DEG)
                 InWeaponLAR())
        {
           // When the SALVO-FIRING indicates no rounds are to be fired at a receding target,
           // SUPPRESSOR proceeds internally with the firing request but then stops the engagement
           // when it determines there are no rounds available.
           exitState = true;
           if (PLATFORM.ClosingSpeedOf(TRACK) > 0)
           {
              exitState = FireAt(TRACK, "Shoot", weapon, 4);
           }
        }
        return exitState;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, bool, if, else, return

### state（sam_regiment）｜状态机状态

- **关键词**：state, next_state, if, foreach, bool, return, 状态机状态
- **出处**：`suppressor/platforms/sam_regiment.txt:79-121`
- **片段**：

```text
    state DETECTED
      next_state ASSIGNED
        if (TRACK.IFF_Friend() ||
            (TRACK.Type() != "BOMBER")) return false;

        Array<WsfPlatform> filter2 = Array<WsfPlatform>();
        Array<WsfPlatform> filter3 = Array<WsfPlatform>();

        foreach (WsfPlatform sub in PLATFORM.Subordinates("red-net"))
        {
          if (SubOperational(sub) &&
              (TasksAssignedTo(sub) < maxSubOngoingAssignments) &&
              TRACK.WithinZoneOf(sub, "sam_zone") &&
              (sub.RelativeHeadingOf(TRACK) < 68.754935) &&
              (sub.GroundRangeTo(TRACK) < 45000))
          {
            if ((sub.GroundRangeTo(TRACK) < 30000) &&
                (TasksAssignedFor(TRACK.TrackId(), "Engage") < maxSubsAssigned))
            {
              filter3.PushBack(sub);
            }
            else
            {
              filter2.PushBack(sub);
            }
          }
        }

        bool assigned = false;
        foreach (WsfPlatform sub in filter3)
        {
          if (TasksAssignedFor(TRACK.TrackId()," Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }
        foreach (WsfPlatform sub in filter2)
        {
          if (TasksAssignedFor(TRACK.TrackId(), "Engage") >= maxSubsAssigned) break;
          if (AssignTask(TRACK, "Engage", sub, "red-net")) assigned = true;
        }

        return assigned;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, if, foreach, bool, return

### state（bomber）｜状态机状态

- **关键词**：state, next_state, bool, if, return, 状态机状态
- **出处**：`suppressor/platforms/bomber.txt:74-92`
- **片段**：

```text
    state DETECTED
      next_state ENGAGING
        bool okayToEngage = false;
        WsfWeapon weapon = PLATFORM.Weapon("bomber_weapon");
        // The tests have be reordered for better efficiency
        if ((! TRACK.IFF_Friend())                         &&        // IFF-STATUS IS-NOT-FRIEND
            (TRACK.TargetType() == "TARGET")               &&
            (! HaveFiredAt(TRACK.TrackId()))               &&        // FIRED-BEFORE IS NO
            TRACK.WithinZoneOf(PLATFORM, "target_area")    &&        // 3D-TGT-LOC WITHIN target_area
            (weapon.QuantityRemaining() > 0))                        // WPN-STATUS IS-NOT WPN-NON/OP
        {
          if (CountInState("ENGAGING") < 3)
          {
            okayToEngage = InWeaponLAR();
          }
        }
        return okayToEngage;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, bool, if, return

### state（sam_battery）｜状态机状态

- **关键词**：state, next_state, return, double, if, 状态机状态
- **出处**：`suppressor/platforms/sam_battery.txt:112-130`
- **片段**：

```text
    state ENGAGEABLE
      next_state CANCELED
        return ((TasksReceivedFor(TRACK.TrackId(), "Engage") == 0) ||
                ShouldICancel());
      end_next_state

      next_state ENGAGED
        double relTgtAlt = PLATFORM.RelativeAltitudeOf(TRACK);
        if ((relTgtAlt > 50)                         &&
            (relTgtAlt < 15000)                      &&
            (PLATFORM.GroundRangeTo(TRACK) < 45000))
        {
          // give tracking radar task to begin tracking target
          AcquireTarget();
          return true;
        }
        return false;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, return, double, if

### state（timeline_proc_fsm）｜状态机状态

- **关键词**：state, on_entry, behavior_tree, behavior_node, next_state, 状态机状态
- **出处**：`base_types/processors/timeline_agents/timeline_proc_fsm.txt:544-567`
- **片段**：

```text
   state SHOOT
      #once entered, will setup & take a shot
      #balance this by limiting the shoot behavior:
      #   add in conditions (speed+orientation) to it's precondition
      on_entry
         PLATFORM.Comment("SHOOT");
      end_on_entry
      behavior_tree
         selector
            behavior_node  evade
	         behavior_node  fly_timeline
            behavior_node  planned_route
         end_selector
	      behavior_node  engage_on_timeline #TODO - move this script to inside this state?
      end_behavior_tree
      next_state SHOOT

         return false;
      end_next_state
      next_state SUPPORT_WEAPON return ShouldSupportWeapon(); end_next_state
      next_state RESET     return ShouldReset();     end_next_state
      next_state DELAY     return ShouldDelay();     end_next_state
      next_state APPROACH  return ShouldApproach();  end_next_state
   end_state
```

- **演示要点**：演示 state 的参数：on_entry, behavior_tree, behavior_node, next_state

### state（red_multirole_fighter_3）｜状态机状态

- **关键词**：state, altitude_range, mach_range, band, 状态机状态
- **出处**：`sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:25-29`　（同签名共 9 处，另见 `sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:31`、`sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:37`、`sosm/targets/red_multirole_fighter_3/red_multirole_fighter_3.txt:43`）
- **片段**：

```text
   state 10k_m12
      altitude_range         0 ft 12500 ft
      mach_range             0.0 10.0
      band lwir body_and_plume red_multirole_fighter_3_10k_12m_lwir end_band
   end_state
```

- **演示要点**：演示 state 的参数：altitude_range, mach_range, band

### state（timeline_flyer_proc）｜状态机状态

- **关键词**：state, on_entry, behavior_tree, next_state, 状态机状态
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:182-195`　（同签名共 7 处，另见 `base_types/processors/timeline_agents/timeline_flyer_proc.txt:159`、`base_types/processors/timeline_agents/timeline_proc_fsm.txt:517`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:34`）
- **片段**：

```text
   state GO_HOME
      on_entry
         PLATFORM.Comment("GO_HOME");
      end_on_entry
      behavior_tree
            behavior_node  planned_route
         end_behavior_tree
      next_state COMMIT
         WsfWaypoint waypt = PLATFORM.Mover().Route().Front();
         PLATFORM.GoToLocation(waypt);
#         PLATFORM.Comment("Flying Home");
         return false;
      end_next_state
   end_state
```

- **演示要点**：演示 state 的参数：on_entry, behavior_tree, next_state

### state（anti_ballistic_missile_processor）｜状态机状态

- **关键词**：state, next_state, if, return, 状态机状态
- **出处**：`ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:352-367`　（同签名共 3 处，另见 `suppressor/platforms/sam_regiment.txt:125`、`suppressor/platforms/sam_battery.txt:84`）
- **片段**：

```text
   state FIRED
      next_state FIRED
      if  (WeaponsActiveFor(TRACK.TrackId()) == 1)
      {
         return true;
      }
      if (AssignedTrackNames.Exists(TRACK.TargetName()) && AssignedTrackNames.Get(TRACK.TargetName()) == PLATFORM.Name())
      {
         AssignedTrackNames.Remove(TRACK.TargetName());
      }
      return false;
      end_next_state
      next_state DETECTED
         return (WeaponsActiveFor(TRACK.TrackId()) == 0);
      end_next_state
   end_state
```

- **演示要点**：演示 state 的参数：next_state, if, return

### state（establish_link_processor）｜状态机状态

- **关键词**：state, on_entry, next_state, on_exit, 状态机状态
- **出处**：`space_operations/processors/establish_link_processor.txt:182-201`　（同签名共 6 处，另见 `logistics/processors/strike_controller.txt:67`、`base_types/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:286`、`timeline/processors/quantum_agents/aiai/behavior_pincer_fsm.txt:264`）
- **片段**：

```text
   state acquire      
      on_entry
         if (!TRACK.Target().IsValid())
         {
            CancelTask(TRACK.TrackId(), "target_invalid");
         }
         // Check LOS??
         mAcquireTime.Set(TRACK.TrackId(), mTimeToAcquire + TIME_NOW);
         #writeln(TIME_NOW, ":", TRACK.TrackId(), " begin acq");
      end_on_entry
      next_state establish
         // automatically transition after delay     
         bool complete = TIME_NOW >= mAcquireTime[TRACK.TrackId()];
         return (complete);
      end_next_state
      on_exit
         mAcquireTime.Remove(TRACK.TrackId());         
      end_on_exit
      
   end_state
```

- **演示要点**：演示 state 的参数：on_entry, next_state, on_exit

### state（simple_target）｜状态机状态

- **关键词**：state, cold_part_area, cold_part_radiant_intensity, 状态机状态
- **出处**：`sosm/targets/simple_target.txt:18-21`
- **片段**：

```text
   state default
      cold_part_area                   constant 1 m^2
      cold_part_radiant_intensity      1 w/sr
   end_state
```

- **演示要点**：演示 state 的参数：cold_part_area, cold_part_radiant_intensity

### state（simple_target）｜状态机状态

- **关键词**：state, cold_part_area, recovery_factor, 状态机状态
- **出处**：`sosm/test_mission/simple_plot/simple_target.txt:14-17`
- **片段**：

```text
   state default
      cold_part_area       constant 1.0 m^2
      recovery_factor      0.9
   end_state
```

- **演示要点**：演示 state 的参数：cold_part_area, recovery_factor

### state（cvn_task_processor）｜状态机状态

- **关键词**：state, on_entry, next_state, 状态机状态
- **出处**：`outer_air_battle/processors/cvn_task_processor.txt:250-255`　（同签名共 38 处，另见 `outer_air_battle/processors/cvn_task_processor.txt:258`、`logistics/processors/strike_controller.txt:151`、`logistics/processors/shuttle_transport_processor.txt:129`）
- **片段**：

```text
   state DETECTED
      on_entry announce("DETECTED"); end_on_entry
      next_state VECTOR
         return availableSubordinates();
      end_next_state
   end_state
```

- **演示要点**：演示 state 的参数：on_entry, next_state

### state（sam_battery）｜状态机状态

- **关键词**：state, next_state, return, 状态机状态
- **出处**：`suppressor/platforms/sam_battery.txt:179-185`
- **片段**：

```text
    state CANCELED
      next_state ASSIGNED
        // cancel any tasks I have assigned this track
        CancelTask(TRACK.TrackId(), "");
        return true;
      end_next_state
    end_state
```

- **演示要点**：演示 state 的参数：next_state, return

### state（state_machine_striker）｜状态机状态

- **关键词**：state, next_state, advanced_behavior_tree, 状态机状态
- **出处**：`behavior_tree/platforms/state_machine_striker.txt:100-114`　（同签名共 3 处，另见 `behavior_tree/platforms/state_machine_striker.txt:53`、`behavior_tree/platforms/state_machine_striker.txt:76`）
- **片段**：

```text
      state checkpoints_red
         next_state checkpoints_red
            return true;
         end_next_state
         
         advanced_behavior_tree
            btt on
            sequence
               behavior_node red_checkpoint_1
               behavior_node red_checkpoint_2
               behavior_node red_checkpoint_3
               behavior_node red_checkpoint_4
            end_sequence
         end_advanced_behavior_tree
      end_state
```

- **演示要点**：演示 state 的参数：next_state, advanced_behavior_tree

### state（soj）｜状态机状态

- **关键词**：state, next_state, 状态机状态
- **出处**：`aea_iads/platforms/soj.txt:362-366`　（同签名共 218 处，另见 `alv_routing/processors/alv_task_mgr.txt:321`、`ballistic_missile_shootdown/processors/anti_ballistic_missile_processor.txt:298`、`base_types/processors/rcs_display_mgr.txt:106`）
- **片段**：

```text
   state DETECTED
      next_state CAN_JAM
         return ((TRACK.TimeSinceUpdated() < mTrackUpdateStaleTime) && AllowTrack());
      end_next_state
   end_state
```

- **演示要点**：演示 state 的参数：next_state

### state（time_on_target）｜状态机状态

- **关键词**：state, on_entry, 状态机状态
- **出处**：`fires/time_on_target.txt:124-128`　（同签名共 12 处，另见 `space_operations/processors/establish_link_processor.txt:298`、`base_types/processors/timeline_agents/flight_lead_filtered_timeline.txt:121`、`cyber/platforms/cyber_command_post.txt:41`）
- **片段**：

```text
   state done
      on_entry
         TaskComplete(TRACK.TrackId(), "TIME_ON_TARGET");
      end_on_entry
   end_state
```

- **演示要点**：演示 state 的参数：on_entry

### state（cyber_outpost）｜状态机状态

- **关键词**：state, 状态机状态
- **出处**：`cyber/platforms/cyber_outpost.txt:71-72`　（同签名共 3 处，另见 `space_operations/processors/establish_link_processor.txt:129`、`outer_air_battle/processors/cvn_task_processor.txt:291`）
- **片段**：

```text
   state END_STATE
   end_state
```

- **演示要点**：演示 state（最小结构，无子参数）
