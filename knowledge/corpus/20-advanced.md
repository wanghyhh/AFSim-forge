# 高级模型（行为树 / 赛博 / 环境 / 交通）

> **来源**：AFSIM 2.9.0 官方 demo 集（`demos/`，4,751 个 `.txt`，132 万行）
> **性质**：原文摘抄，未改写。同一「参数签名」只保留 1 条代表，并注明出现次数与另见位置
> **警示**：片段中数值为 demo 原值，**仅供语法参考，不得直接复用**；依赖 `common/` 数据表的片段须另行提供
> **检索**：按命令 / 类型名 / 参数名搜本卷；总表见 `90-tokens.md`

### advanced_behavior（ftr_rules）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_init, precondition, execute, faz_desired, reason, ftr_lead, for, if, faz, t_faz_switch
- **出处**：`air_to_air/rules/ftr_rules.txt:60-339`
- **片段**：

```text
advanced_behavior ftr_rules

   script_debug_writes disable


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

      extern WsfPlatform iacid;
      extern WsfCommandChain iflite;
      extern WsfCommandChain ielement;
      extern WsfCommandChain FTR_RULES_CHAIN;
      
#        assessment variables
        extern string faz_desired; // desired faz to be in
        extern bool change_desired; // true if i desire to change faz
        extern bool time_ok; // indicates if i've been in current faz long enough to switch faz
        extern bool alerted; // true if i'm aware of a threat missile and feel threatened by it
        extern bool apole_tct; // true if i desire to perform an apole tactic (crank) when guiding missiles
        extern string reason; // reason i desire to change faz
        extern string faz; // current phase of platform
        extern bool needil; // set to true if me or my flight mates are guiding a missile
        extern Map<WsfSA_EntityPerception, bool> mapSTIFF_ARM; // map of tracks to stiff arm
        extern WsfLocalTrack ltrk_cls_hst;  // track of closest hostile to me, calculated in ftr_faz @ call to rng_close_host
        extern int n_pump; // number of pumps this A/C has performed
        extern bool first_pass; // true if this is the first pass 
        extern bool attack_success; // true if mission is complete
        extern bool react; // true if i will perform a pre-planned reaction on the first pass
        extern bool evd_msl; // true if i will turn cold to defeat a threat missile
        extern bool p_snip; // true if i will snip my missile prior to husky or autonomous state to prioritize survivability 
        extern bool p_pump; // probability that i will pump 
        extern bool pump_per; // if true, i have permission to pump, true if p_pump is true and when guiding missiles, p_snip is true
        extern bool solo; // true if i will break from my flight and become my own flight lead
        extern bool dead_buddy; // do I have a dead wingman
        extern bool onrail; // true if a missile is on the rail (pickle buttom pressed, waiting for missile to launch)
        extern bool stiff_arm_all; // true to stiff arm all threats
        extern bool ing4last; // whether or not to pursue an egressing target
        extern bool spiked; // is an A/C spiking me
        extern bool sam_spiked; // is a sam spiking me
        extern bool msl_spike; // is a missile spiking me
        extern double rng_cls_hst; // range to closest hostile A/C
        extern bool buddy_hot; // determine if someone in my flight is hot to threats
        extern bool hot_asp; // determine if someone is hot to me and within a threatening range
        extern bool threatnd; // am I threatened
        extern bool sam_threatnd; // is a SAM threatening to me
        extern double rng_cls_sam; // range to closest hostile SAM
        extern bool bng_msl; // true if i'm winchester
        extern bool bng_fuel; // true if i'm bingo fuel
        extern bool joker_fuel; // true if i'm joker fuel
        extern bool flt_lead; // true if i am the flight lead
        extern bool el_lead; // true if i am the element lead
        extern string rule_type; // current rule type
        extern WsfSA_EntityPerception ppmjid; // current highest prioritized target
        extern double t_faz_switch; // time at which I last switched faz 
        extern double t_phase; // sim time at which it is acceptable to change phase
        extern string flight_lead;
        extern bool dzr_change;
        extern string dzr_phase;
        extern bool flt_guiding;

         extern double pr_heading;
         extern double pr_speed; 
         extern double pr_throttle;
         extern double pr_gees;
         extern double pr_altitude;
         
         extern Atmosphere atmos;
         extern bool pitch_up;
         extern bool log_print;
         extern string log_path;
         extern string iout_path;
         extern bool iout_print;
         extern FileIO log;
         extern FileIO iout;
         WsfProcessor saPROC = (WsfSA_Processor)PROCESSOR;
      
      
   end_script_variables



   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");

   end_on_init


   precondition
      ////// Evaluate conditions that would prevent behavior alternative from running
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "ftr")
      { return Success(); }
      else
      { return Failure(reason); }
      
   end_precondition


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
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_init, precondition, execute, faz_desired, reason, ftr_lead, for, if

### advanced_behavior（reaction）｜

- **关键词**：advanced_behavior, script_variables, precondition, execute, faz_desired, first_pass, bool, reason, pr_speed, pr_altitude, else, if
- **出处**：`air_to_air/rules/reaction.txt:18-131`
- **片段**：

```text
advanced_behavior reaction

   script_variables 
      extern string faz_desired;
      extern bool change_desired;
      extern WsfPlatform iacid;
      extern string reason;
      extern WsfCommandChain iflite;
      extern bool pitch_up;
      extern double pr_altitude;
      extern double pr_speed;
      extern double pr_heading;
      extern double pr_gees;
      extern bool first_pass;
      extern double time_ok;
      extern bool alerted;
      extern bool apole_tct;
      extern bool sam_threatnd;
      extern double rng_cls_sam;
      extern double rng_cls_hst;
      extern bool pump_per;
      extern bool threatnd;
      extern bool needil;
      extern double t_faz_switch;
#      extern WsfBrawlerProcessor BRAWLER;
      extern Atmosphere atmos;
      extern double t_phase;
      extern Array<int> PLAYBOOK;      
   end_script_variables

   precondition 
      ////// Evaluate conditions that would prevent behavior alternative from running
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "ftr" && PLATFORM->faz == "reaction")
      { return Success(); }
      else
      { return Failure(reason); }
 
   end_precondition
   
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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_variables, precondition, execute, faz_desired, first_pass, bool, reason, pr_speed, pr_altitude, else

### advanced_behavior（route_rules）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_init, on_new_execute, precondition, execute, if, pr_heading, pr_speed, pr_altitude, else
- **出处**：`air_to_air/rules/route_rules.txt:23-309`
- **片段**：

```text
advanced_behavior route_rules

   script_debug_writes disable


   script_variables

#      extern WsfBrawlerProcessor BRAWLER;
      WsfPerceptionProcessor    perception;

      //**********************************************************************//
      //** debugging parameters                                             **//
      //**********************************************************************//
      bool     mDrawSteering     = false;

      //**********************************************************************//
      //** alternative parameters                                           **//
      //**********************************************************************//
      // Flag used to enable/disable this alternative
      bool mAlternative3111Enabled = true;

      // Alternative ID
      int ilevel = 3;
      int kalt   = 1;
      int icall  = 1;
      int lcall  = 1;

      Vec3 mDir0 = Vec3();
      double mGMX = 1.0;
      double mSpd0 = 3.0;

      //**********************************************************************//
      //********* VARIABLES BELOW THIS LINE ARE NOT FOR USER EDITING *********//
      //**********************************************************************//
      WsfDraw  mDraw             = WsfDraw();
      double   mLastTime         = 0.0;
   
#      extern Array<string> pr_pos_bias;
#      WsfPlatform iacid = PLATFORM;
      extern WsfPlatform iacid;
      extern double pr_speed;
      extern double pr_altitude;
      extern double pr_heading;
      extern int rte_ind;
      Vec3 desdir;
      Vec3 dir0;
      extern WsfGeoPoint home_base;
      Atmosphere atm = Atmosphere.Construct("default");
      extern bool log_print;
         extern string log_path;
         extern string iout_path;
      extern bool iout_print;
      extern WsfRoute ROUTE;
      extern WsfCommandChain iflite;
      extern WsfCommandChain ielement;
        extern double t_phase; // sim time at which it is acceptable to change phase
        extern string flight_lead;
        extern bool dzr_change;
        extern string dzr_phase;
        extern bool flt_guiding;
        extern bool flt_lead;
        extern string faz;
        extern WsfCommandChain FORM_FLY_CHAIN;
        extern bool bng_fuel;
        extern string reason;
        extern Array<double> VECTOR_FORMATION;
        extern FileIO iout;
        extern FileIO log;

   end_script_variables

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
   


   precondition
      //## Evaluate conditions that would prevent behavior alternative from running
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "route" && ROUTE.Size() >= 1)
      {
         return Success();
      }
      else
      {
         return Failure(reason);
      }

   end_precondition


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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_init, on_new_execute, precondition, execute, if, pr_heading, pr_speed, pr_altitude

### advanced_behavior（sam_shoot_it）｜

- **关键词**：advanced_behavior, script_variables, on_init, precondition, execute, extern, int, pitch_up, if, foreach, return
- **出处**：`air_to_air/rules/sam_shoot_it.txt:41-226`
- **片段**：

```text
advanced_behavior sam_shoot_it

   //script_debug_writes on
   
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
      extern Array<WsfSA_EntityPerception> shoot_list;
      extern Map<WsfSA_EntityPerception, string> mapPRMISL_AC;
      extern Map<WsfSA_EntityPerception, int> mapMXTGTD;
      extern Map<WsfSA_EntityPerception, int> mapMXTGT_AC;
      extern Map<WsfSA_EntityPerception, bool> mapPICKLE;
      extern Map<WsfSA_EntityPerception, bool> mapSTIFF_ARM;
      extern bool pitch_up;
      extern bool iout_print;
      extern double t_last_pickle;
      extern string iout_path;
      WsfSA_Processor saPROC = (WsfSA_Processor)PROCESSOR;
      extern Array<double> RPEAK_LOC;
   end_script_variables
   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init

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
      else if (TIME_NOW < (t_last_pickle+0.5))
      //Switchology delays = time it takes for pilot to select a new target (Brawler uses .5 seconds)
      {
         if(iout_print) {iout.Write(write_str(" SAM_SHOOT_IT SWITCHOLOGY DELAY UNTIL T=",t_last_pickle+0.5,"\n"));}
         return Failure("Switchology Delay");
      }
      return Success();
   end_precondition


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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_variables, on_init, precondition, execute, extern, int, pitch_up, if, foreach, return

### advanced_behavior（orbit_rules）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_init, if, else, on_new_execute, precondition, execute
- **出处**：`air_to_air/rules/orbit_rules.txt:25-229`
- **片段**：

```text
advanced_behavior orbit_rules

   script_debug_writes disable


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

   precondition
      //writeln_d(PLATFORM.Name(), " precondition behavior_alt3111_straight_level_max_speed, T=", TIME_NOW);

      //## Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "orbit")
      {
         return Success();
      }
      else
      {
         return Failure(reason);
      }

   end_precondition


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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_init, if, else, on_new_execute, precondition, execute

### advanced_behavior（intercept_rules）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_init, precondition, execute, if, else
- **出处**：`air_to_air/rules/intercept_rules.txt:23-162`
- **片段**：

```text
advanced_behavior intercept_rules

   script_debug_writes disable


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
      extern WsfTaskProcessor tsk_mgr;
      extern WsfCommandChain iflite;
      extern WsfCommandChain ielement;
      extern WsfCommandChain FORM_FLY_CHAIN;
#      extern WsfBrawlerMover my_mover;
      extern string reason;
      extern FileIO iout;
      extern FileIO log;

   end_script_variables


   on_init
      faz = "ingress";
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init

   precondition
      //writeln_d(PLATFORM.Name(), " precondition behavior_alt3111_straight_level_max_speed, T=", TIME_NOW);

      //## Evaluate conditions that would prevent behavior alternative from running

      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "intercept")
      {
         return Success();
      }
      else
      {
         return Failure(reason);
      }

   end_precondition


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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_init, precondition, execute, if, else

### advanced_behavior（selector_pursue-target_route_finder）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_new_execute, on_init, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_pursue-target_route_finder.txt:11-169`
- **片段**：

```text
advanced_behavior pursue-target_route_finder

   script_debug_writes off

   script_variables
      //expected global externs
      #extern Array<WsfGeoPoint> gAvoidPoints;
      #extern Array<double>      gAvoidRadii;
      double         cDEFAULT_ALTITUDE = 9144; // ~30,000 feet
      WsfRouteFinder mRouteFinder = WsfRouteFinder();
      bool           mDebugDraw = true;
      WsfGeoPoint    mTargetPoint;
      double         mTargetSpeed = 300;  //300 ms (~600 knots)
      bool           mForceRePath = false;
      WsfDraw        mDraw = WsfDraw();
      
      WsfGeoPoint    mCurrentAvoidancePt = WsfGeoPoint();
      WsfRoute       mCurrentRoute       = WsfRoute();
      
   end_script_variables
   
   on_new_execute 
      mForceRePath = true;
   end_on_new_execute

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


   execute
     #writeln_d("executing pursue-target_route_finder.");
     
      if (mForceRePath || PLATFORM.SlantRangeTo(mTargetPoint) > (3*mTargetSpeed))   // if we are more than 2 seconds away from our target
      {
         WsfRoute path = mRouteFinder.Route(TIME_NOW, PLATFORM.Location(), mTargetPoint, mTargetSpeed);
         if (!path.IsValid() || path.Size() <= 0)
         {
            writeln_d("***** ERROR: INVALID OR EMPTY PATH!!!");
            return 3;
         }
         WsfRoute avoidances = mRouteFinder.RouteAvoidances();
         if (!avoidances.IsValid())
         {
            writeln("***** ERROR: INVALID WsfRouteFinder AVOIDANCES!!!");
            return 3;
         }
         writeln_d("T=", TIME_NOW, ", path size: ", path.Size(), ", avoidances: ", avoidances.Size());

         if (mDebugDraw == true)
         {
            mRouteFinder.DrawAvoidances(PROCESSOR.UpdateInterval(), Vec3.Construct(0.5, 0.5, 0.5)); #gray
         }
        
         if (path.Size() <= 2)
         {
            //writeln("WsfRouteFinder path is tiny, fly straight at target!");
            //on the final leg, just fly straight at the path target now
            PLATFORM.GoToLocation(path.Back().Location());
            double linearAccel = 7.5 * Earth.ACCEL_OF_GRAVITY();
            PLATFORM.GoToSpeed(mTargetSpeed, linearAccel, true);
            return 1;
         }

         if (mDebugDraw == true)
         {
            #mRouteFinder.DrawRoute(PROCESSOR.UpdateInterval(), Vec3.Construct(0.0, 0.75, 0.0)); #green
            DrawRoute(mDraw, path);
         }
         
         if (path.Size() >= 2 && avoidances.Size() >= 1)
         {
            //check to see if we can just keep flying the same route
            WsfGeoPoint avoidance = avoidances[0].Location();
            
            if (mForceRePath == false)
            {
               double avoidRange = avoidance.GroundRangeTo(mCurrentAvoidancePt);
               double routeError = mCurrentRoute.DistanceFromRoute(PLATFORM.Location());
               writeln_d("platform route index: ", PLATFORM.RoutePointIndex(), ", route error: ", routeError);
               if (avoidRange < 185.2 && (routeError < 185.2 || PLATFORM.RoutePointIndex() > 1))
               {
                  //already flying the correct route, dont repath yet
                  writeln_d("same route, let it fly");
                  return 1;
               }
            }
            
            writeln_d("last avoid: ", mCurrentAvoidancePt.ToString(), ", current avoid: ", avoidance.ToString());
            //else save off this avoidance
            mCurrentAvoidancePt = avoidance;
         
            WsfWaypoint wpt = path[0];
            wpt.SetRadialAcceleration(500.0);
            path.Insert(0,wpt);
            path.Remove(1);
            mCurrentRoute = path;
            PLATFORM.FollowRoute(mCurrentRoute, 1);
            mForceRePath = false;
         }
      }
      return 2;
   end_execute
   
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_new_execute, on_init, precondition, execute

### advanced_behavior（rultype_change）｜

- **关键词**：advanced_behavior, script_debug_writes, enabled, script_variables, on_init, precondition, execute
- **出处**：`air_to_air/rules/rultype_change.txt:45-241`
- **片段**：

```text
advanced_behavior rultype

   script_debug_writes disable

   enabled enable
   script_variables

#      extern WsfBrawlerProcessor BRAWLER;
#      WsfSituationAwarenessProcessor saPROC = (WsfSituationAwarenessProcessor)PROCESSOR;
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

#      WsfPlatform iacid = PLATFORM;
      extern WsfPlatform iacid;
      extern bool log_print; 
         extern string log_path;
         extern string iout_path;
      extern WsfGeoPoint home_base;
      extern string rule_type;
      extern string reason;
      extern WsfCommandChain iflite;
      extern WsfCommandChain ielement;
      extern bool pitch_up;
      extern double pr_altitude;
      extern double pr_speed;
      extern double pr_heading;
      extern bool first_pass;
      extern double time_ok;
      extern bool alerted;
      extern bool apole_tct;
      extern bool sam_threatnd;
      extern double rng_cls_sam;
      extern double rng_cls_hst;
      extern bool pump_per;
      extern bool threatnd;
      extern bool needil;
      WsfLocalTrack cls_host_ltrk;
      extern string faz;
      extern WsfRoute ROUTE;
      extern bool flt_lead;
      extern bool el_lead;
        extern double t_phase; // sim time at which it is acceptable to change phase
        extern string flight_lead;
        extern bool dzr_change;
        extern string dzr_phase;
        extern bool flt_guiding;
      extern WsfTaskProcessor tsk_mgr;
      extern string RuleReason;
      WsfSA_Processor saPROC = (WsfSA_Processor)PROCESSOR;
      extern Array<string> PROTECTING;
      extern bool no_tree;
      extern FileIO iout;
      extern FileIO log;
   end_script_variables

   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init
   

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
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, enabled, script_variables, on_init, precondition, execute

### advanced_behavior（selector_engage_weapon_task_target）｜

- **关键词**：advanced_behavior, enabled, script_debug_writes, script_variables, script, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_engage_weapon_task_target.txt:13-275`
- **片段**：

```text
advanced_behavior engage_weapon_task_target
   enabled true

   script_debug_writes false

   script_variables
      //**********************************************************************//
      //** platform / agent specific shooting parameters                    **//
      //**********************************************************************//
      bool    mCoopEngageOne       = false;
     #bool    mCoopEngageOneFlightOnly  = false;
      double  mDegradedFiringAngle  = 55.0;   //negative if not valid
      double  mDegradedPercentRange = 0.50;   //range constraint if past degraded firing angle
      //specify orientation limits for shooting
      double  mMaxFiringRollAngle   =  10.0;   //dont shoot if rolled more/less than this
      double  mMaxFiringPitchAngle  =  15.0;   //dont shoot if pitched more than this
      double  mMinFiringPitchAngle  = -10.0;   //dont shoot if pitched less than this
      
      //**********************************************************************//
      //** threat specific shooting parameters                              **//
      //**********************************************************************//
      //require different track qualities to fire on different kinds of threats
      double DefaultRequiredTrackQuality                 =  0.49;
      Map<string, double> ThreatTypeRequiredTrackQuality = Map<string, double>();
      ThreatTypeRequiredTrackQuality["bomber"]           =  0.49;
      ThreatTypeRequiredTrackQuality["fighter"]          =  0.49;
      //fire off different salvos at different types of threats
      int            DefaultAirSalvo      = 1;
      int            DefaultGndSalvo      = 1;
      Map<string, int> ThreatTypeSalvo    = Map<string, int>();
      ThreatTypeSalvo["sam"]              = 2;
      ThreatTypeSalvo["ship"]             = 2;
      ThreatTypeSalvo["bomber"]           = 2;
      ThreatTypeSalvo["fighter"]          = 1;
      ThreatTypeSalvo["FIRE_CONTROL"]     = 1;
      ThreatTypeSalvo["primary_target"]   = 2;
      ThreatTypeSalvo["secondary_target"] = 2;

      //**********************************************************************//
      //** weapon + threat specific shooting parameters                     **//
      //**********************************************************************//
      //specify an Rmax based on which weapon used and which threat engaged
      double  DefaultPercentRangeMax  = 0.80; // don't launch unless within this percent of Rmax
      double  DefaultPercentRangeMin  = 1.20; // don't launch unless beyond this percent of Rmin
      Map<string, Map<string, double>> WeaponThreatRmaxMap = Map<string, Map<string, double>>();
      WeaponThreatRmaxMap["base_weapon"] = Map<string, double>();
      WeaponThreatRmaxMap["base_weapon"].Set("fighter", 0.80);
   end_script_variables


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
       #extern string GetTargetDomain(WsfTrack);
        string sTargetDomain = GetTargetDomain(track);
        if ( (sTargetDomain == "LAND") || (sTargetDomain == "SURFACE") )
        {
          return DefaultGndSalvo;
        }
        return DefaultAirSalvo;
    end_script


    script double GetRequiredTrackQualityForThreat(WsfTrack threat)
        writeln_d("checking required TQ for track: ", threat.TargetName());
        WsfPlatform plat = WsfSimulation.FindPlatform( threat.TargetName() );
        if (plat.IsValid())
        {
            foreach( string aCategory : double quality in ThreatTypeRequiredTrackQuality )
            {
                if( plat.CategoryMemberOf( aCategory ) )
                {
                   writeln_d("TQ for type ", aCategory, " = ", quality);
                    return quality;
                }
            }
        }
        return DefaultRequiredTrackQuality;
    end_script


    script double GetLaunchPercentRangeMaxOnThreat(string weaponName, WsfTrack threat)
        WsfPlatform plat = WsfSimulation.FindPlatform( threat.TargetName() );
        if (plat.IsValid())
        {
          if (WeaponThreatRmaxMap.Exists(weaponName))
          {
            Map<string, double> categoryRangeMap = WeaponThreatRmaxMap.Get(weaponName);
            foreach (string aCategory : double percent in categoryRangeMap)
            {
                if( plat.CategoryMemberOf( aCategory ) )
                {
                    return percent;
                }
            }
          }
        }
        return DefaultPercentRangeMax;
    end_script


   #on_init
   #end_on_init


   precondition
      writeln_d("precondition engage-target");

      if (!PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         writeln_d("behavior engage... not on quantum tasker processor");
         return Failure("Behavior not attached to a quantum tasker processor!");
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
      WsfTaskList tasks = proc.TasksReceivedOfType("WEAPON");
      if (tasks.Count() > 0)
      {
         writeln_d("behavior engage precondition passes!");
         return Success("Weapon task received. I should fire.");
      }
         writeln_d("no weapon task target to shoot at!");
      return Failure("No weapon task target to shoot at!");
   end_precondition



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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：enabled, script_debug_writes, script_variables, script, precondition, execute

### advanced_behavior（merge）｜

- **关键词**：advanced_behavior, script_variables, precondition, on_new_execute, on_new_fail, execute
- **出处**：`air_to_air/rules/merge.txt:18-90`
- **片段**：

```text
advanced_behavior merge

   script_variables 
      extern string faz_desired;
      extern bool change_desired;
      extern WsfPlatform iacid;
      extern string reason;
      extern WsfCommandChain iflite;
      extern bool pitch_up;
      extern double pr_altitude;
      extern double pr_speed;
      extern double pr_heading;
      extern bool first_pass;
      extern double time_ok;
      extern bool alerted;
      extern bool apole_tct;
      extern bool sam_threatnd;
      extern double rng_cls_sam;
      extern double rng_cls_hst;
      extern bool pump_per;
      extern bool threatnd;
      extern bool needil;
      extern bool solo;
      extern bool flt_lead;
      extern WsfSA_EntityPerception ppmjid;
#      extern WsfBrawlerProcessor BRAWLER;
      extern Atmosphere atmos;
   end_script_variables

   precondition 
      ////// Evaluate conditions that would prevent behavior alternative from running
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      }

      if (PLATFORM->rule_type == "ftr" && PLATFORM->faz == "merge")
      { return Success(); }
      else
      { return Failure(reason); }
 
   end_precondition
   
   on_new_execute 
      PLATFORM->solo_orig = solo; // record the original solo value
   end_on_new_execute
   on_new_fail 
      solo = PLATFORM->solo_orig; // if not in merge anymore, reset solo to the original value
   end_on_new_fail
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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_variables, precondition, on_new_execute, on_new_fail, execute

### advanced_behavior（selector_planned_route）｜

- **关键词**：advanced_behavior, enabled, script_debug_writes, script_variables, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/selector_planned_route.txt:40-123`
- **片段**：

```text
advanced_behavior planned_route
   enabled true

   script_debug_writes false

   script_variables
      bool     mDrawRoute              = false;
      WsfDraw  mDraw                   = WsfDraw();
      double   cDEFAULT_SPEED          = 450.0 * MATH.MPS_PER_NMPH();
      double   cDEFAULT_ACCEL          =   7.5 * Earth.ACCEL_OF_GRAVITY(); // 7.5 G  (m/s^2)
   end_script_variables

   precondition
      writeln_d("precondition planned_route");
      return Success();
   end_precondition

   execute
      writeln_d(PLATFORM.Name(), " executing planned_route, T=", TIME_NOW);
      #only command the platform to do something different if its not currently flying a route
      WsfMover aMover = PLATFORM.Mover();
      if (aMover.IsValid()) {
         if (aMover.IsExtrapolating()) {
            WsfGeoPoint pt = PLATFORM.Location();
            WsfRoute ro = aMover.DefaultRoute().Copy(); #now we have a modifiable route
            if (!ro.IsValid())
               return Failure("Route is invalid!");

            writeln_d("flying route, name: ", ro.Name(), ", type: ", ro.Type());
            WsfGeoPoint close = ro.LocationAtDistance(ro.DistanceAlongRoute(pt));
            if (!close.IsValid()) {
               return Failure("Invalid close point!");
            }
            close.SetAltitudeAGL(pt.Altitude());
            if (mDrawRoute)
            {
               mDraw.BeginLines();
                  mDraw.Vertex(pt);
                  mDraw.Vertex(close);
               mDraw.End();
            }
            double d1 = ro.DistanceFromRoute(pt);
            double d2 = pt.GroundRangeTo(close);
            double d3 = -1;
            Array<double> turnRad = aMover.PropertyDouble("turn_radius");
            if (turnRad.Size() > 0) {
               d3 = 2*turnRad[0];
            }
            int i = 0;
            for (; i < ro.Size(); i = i+1)
            {
               WsfWaypoint wpt = ro.Waypoint(i);
               WsfGeoPoint rpt = wpt.Location();
               //check if we are close to an existing waypoint, if so... break & fly at that one
               if (rpt.GroundRangeTo(close) < 926) {
                  break;
               }
               double dist = ro.DistanceAlongRoute(rpt);
               if (dist > d1) {
                  if (d2 > d3) {
                     ro.Insert(i, WsfWaypoint.Create(close, wpt.Speed()));
                  }
                  break;
               }
            }
            if (i >= ro.Size()) {
               i = ro.Size() - 1;
            }
            //go at default speed; this gets overwritten if route waypoint has defined a speed
            PLATFORM.GoToSpeed(cDEFAULT_SPEED, cDEFAULT_ACCEL, true);
            PLATFORM.FollowRoute(ro, i);
         }
      }
      
      if (mDrawRoute)
      {
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetLayer("behavior_planned_route");
         DrawRoute(mDraw, PLATFORM.Route());
      }
      return Running("Following planned route");
   end_execute

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：enabled, script_debug_writes, script_variables, precondition, execute

### advanced_behavior（select_wpn）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, on_init, precondition, execute
- **出处**：`air_to_air/rules/select_wpn.txt:58-336`　（同签名共 2 处，另见 `air_to_air/rules/shoot_it.txt:41`）
- **片段**：

```text
advanced_behavior select_wpn

   script_debug_writes disable

   
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
   on_init
      perception = (WsfPerceptionProcessor)PLATFORM.Processor("perception");
   end_on_init

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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, on_init, precondition, execute

### advanced_behavior（blackboard_checkpoint_1_task）｜

- **关键词**：advanced_behavior, script_variables, on_init, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_1_task.txt:10-32`　（同签名共 6 处，另见 `behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_2_task.txt:10`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_3_task.txt:10`、`behavior_tree/processors/quantum_agents/aiai/blackboard_checkpoint_4_task.txt:10`）
- **片段**：

```text
advanced_behavior checkpoint_1_task
   script_variables
      double weight = 1.0;
   end_script_variables

   on_init
      if (!SharedBlackboardExists("checkpoint_tasks"))
      {
         CreateSharedBlackboard("checkpoint_tasks");
      }
   end_on_init
   
   precondition   
      return weight;
   end_precondition
   
   execute
      SetSharedBlackboardVar("checkpoint_tasks", "checkpoint_1", true);
      weight = 0.0;
      return Success("checkpoint_1 task posted to blackboard");
   end_execute
   
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_variables, on_init, precondition, execute

### advanced_behavior（ingress）｜

- **关键词**：advanced_behavior, script_debug_writes, script_variables, precondition, execute
- **出处**：`air_to_air/rules/ingress.txt:18-142`　（同签名共 2 处，另见 `air_to_air/rules/direct.txt:22`）
- **片段**：

```text
advanced_behavior ingress

   script_debug_writes disable


   script_variables 
      extern string faz_desired;
      extern bool change_desired;
      extern WsfPlatform iacid;
      extern string reason;
      extern WsfCommandChain iflite;
      extern WsfCommandChain ielement;
      extern bool pitch_up;
      extern double pr_altitude;
      extern double pr_speed;
      extern double pr_heading;
      extern WsfSA_EntityPerception ppmjid;
      extern Atmosphere atmos;
      extern bool sam_threatnd;
      extern double rng_cls_sam;
      extern double rng_cls_hst;
      extern bool stiff_arm_all;
      extern WsfCommandChain FORM_FLY_CHAIN;
#      extern WsfBrawlerProcessor BRAWLER;
      extern double t_phase;
      extern Array<double> VECTOR_FORMATION;
      extern Array<int> PLAYBOOK;
   end_script_variables

   precondition 
      ////// Evaluate conditions that would prevent behavior alternative from running
      if (!PROCESSOR.IsA_TypeOf("WSF_SA_PROCESSOR"))
      {
         writeln_d("not a brawler processor!");
         return Failure("behavior not attached to a WSF_SA_PROCESSOR");
      } 

      if (PLATFORM->rule_type == "ftr" && PLATFORM->faz == "ingress")
      { return Success(); }
      else
      { return Failure(reason); }
 
   end_precondition
   
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

end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_debug_writes, script_variables, precondition, execute

### advanced_behavior（parallel_wait）｜

- **关键词**：advanced_behavior, script_variables, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/parallel_wait.txt:10-29`　（同签名共 54 处，另见 `behavior_tree/processors/quantum_agents/aiai/parallel_turn_left.txt:10`、`behavior_tree/processors/quantum_agents/aiai/parallel_turn_right.txt:10`、`behavior_tree/processors/quantum_agents/aiai/sequence_with_memory_checkpoint_1.txt:10`）
- **片段**：

```text
advanced_behavior wait
   
   script_variables
      int tick = 0;
   end_script_variables

   precondition
      return Success();
   end_precondition
   
   execute
      if (tick >= 20)
      {
         return Success("Done waiting!");
      }
      tick = tick + 1;
      return Running("Waiting");
   end_execute
   
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：script_variables, precondition, execute

### advanced_behavior（decorator_turn_left）｜

- **关键词**：advanced_behavior, precondition, execute
- **出处**：`behavior_tree/processors/quantum_agents/aiai/decorator_turn_left.txt:10-20`　（同签名共 2 处，另见 `behavior_tree/processors/quantum_agents/aiai/decorator_turn_right.txt:10`）
- **片段**：

```text
advanced_behavior turn_left
   precondition
      return Success();
   end_precondition
   
   execute
      PLATFORM.TurnToRelativeHeading(-18);
      return Success("turn_left maneuver complete!");
   end_execute
   
end_advanced_behavior
```

- **演示要点**：演示 advanced_behavior 的参数：precondition, execute

### advanced_behavior_tree（subtrees_striker）｜

- **关键词**：advanced_behavior_tree, btt, name, desc, root_node_type, behavior_node, advanced_behavior_tree
- **出处**：`behavior_tree/platforms/subtrees_striker.txt:50-65`
- **片段**：

```text
         advanced_behavior_tree
            btt on
            name tree_checkpoints1234
            desc "This will fly to checkpoints 1 and 2, and then will run tree_checkpoints34"
            root_node_type sequence
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            advanced_behavior_tree
               btt on
               name tree_checkpoints34
               desc "This will fly to checkpoint 3 and then to checkpoint 4"
               root_node_type sequence
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_advanced_behavior_tree
         end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, name, desc, root_node_type, behavior_node, advanced_behavior_tree

### advanced_behavior_tree（subtrees_striker）｜

- **关键词**：advanced_behavior_tree, btt, name, desc, root_node_type, behavior_node
- **出处**：`behavior_tree/platforms/subtrees_striker.txt:57-64`　（同签名共 2 处，另见 `behavior_tree/platforms/subtrees_striker.txt:66`）
- **片段**：

```text
            advanced_behavior_tree
               btt on
               name tree_checkpoints34
               desc "This will fly to checkpoint 3 and then to checkpoint 4"
               root_node_type sequence
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, name, desc, root_node_type, behavior_node

### advanced_behavior_tree（subtrees_striker）｜

- **关键词**：advanced_behavior_tree, btt, desc, root_node_type, advanced_behavior_tree, behavior_node
- **出处**：`behavior_tree/platforms/subtrees_striker.txt:46-77`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         desc "This tree will run subtrees tree_checkpoints1234, tree_checkpoints34, tree_checkpoints321, and then will fly checkpoints 4 and 5"
         root_node_type sequence
         advanced_behavior_tree
            btt on
            name tree_checkpoints1234
            desc "This will fly to checkpoints 1 and 2, and then will run tree_checkpoints34"
            root_node_type sequence
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            advanced_behavior_tree
               btt on
               name tree_checkpoints34
               desc "This will fly to checkpoint 3 and then to checkpoint 4"
               root_node_type sequence
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_advanced_behavior_tree
         end_advanced_behavior_tree
         advanced_behavior_tree
            btt on
            name tree_checkpoints321
            desc "This will fly to checkpoints 3, 2, and 1"
            root_node_type sequence
            behavior_node checkpoint_3
            behavior_node checkpoint_2
            behavior_node checkpoint_1
         end_advanced_behavior_tree
         behavior_node checkpoint_4
         behavior_node checkpoint_5
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, desc, root_node_type, advanced_behavior_tree, behavior_node

### advanced_behavior_tree（selector_with_memory_striker）｜

- **关键词**：advanced_behavior_tree, btt, selector_with_memory, behavior_node
- **出处**：`behavior_tree/platforms/selector_with_memory_striker.txt:43-51`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         selector_with_memory
            condition range_under_10000
            condition range_under_50000
            condition range_under_100000
         end_selector_with_memory
         behavior_node planned_route
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, selector_with_memory, behavior_node

### advanced_behavior_tree（selector_striker）｜

- **关键词**：advanced_behavior_tree, btt, selector, behavior_node
- **出处**：`behavior_tree/platforms/selector_striker.txt:90-100`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         selector
            behavior_node evade
            behavior_node escort
            behavior_node pincer_fsm
            behavior_node pursue_weapon_task_target
            behavior_node planned_route
         end_selector
         behavior_node engage_weapon_task_target
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, selector, behavior_node

### advanced_behavior_tree（condition_striker）｜

- **关键词**：advanced_behavior_tree, btt, behavior_node, sequence
- **出处**：`behavior_tree/platforms/condition_striker.txt:46-61`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         behavior_node checkpoint_1
         sequence
            condition checkpoint_1_reached
            behavior_node checkpoint_2
         end_sequence
         sequence
            condition checkpoint_2_reached
            behavior_node checkpoint_3
         end_sequence
         sequence
            condition checkpoint_3_reached
            behavior_node checkpoint_4
         end_sequence
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, behavior_node, sequence

### advanced_behavior_tree（state_machine_striker）｜

- **关键词**：advanced_behavior_tree, btt, sequence
- **出处**：`behavior_tree/platforms/state_machine_striker.txt:67-73`　（同签名共 8 处，另见 `behavior_tree/platforms/state_machine_striker.txt:90`、`behavior_tree/platforms/state_machine_striker.txt:105`、`behavior_tree/platforms/sequence_striker.txt:46`）
- **片段**：

```text
         advanced_behavior_tree
            btt on
            sequence
               behavior_node blue_checkpoint_1
               behavior_node blue_checkpoint_2
            end_sequence
         end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, sequence

### advanced_behavior_tree（priority_selector_striker）｜

- **关键词**：advanced_behavior_tree, btt, priority_selector
- **出处**：`behavior_tree/platforms/priority_selector_striker.txt:43-51`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         priority_selector
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
         end_priority_selector
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, priority_selector

### advanced_behavior_tree（weighted_random_striker）｜

- **关键词**：advanced_behavior_tree, btt, weighted_random
- **出处**：`behavior_tree/platforms/weighted_random_striker.txt:43-51`
- **片段**：

```text
      advanced_behavior_tree
         btt on
         weighted_random
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
         end_weighted_random
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, weighted_random

### advanced_behavior_tree（sequence_with_memory_striker）｜

- **关键词**：advanced_behavior_tree, btt, sequence_with_memory
- **出处**：`behavior_tree/platforms/sequence_with_memory_striker.txt:45-54`　（同签名共 2 处，另见 `behavior_tree/platforms/blackboard_striker.txt:47`）
- **片段**：

```text
      advanced_behavior_tree
         btt on
         sequence_with_memory
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
            behavior_node checkpoint_5
         end_sequence_with_memory
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：btt, sequence_with_memory

### advanced_behavior_tree（hvaa_dca）｜

- **关键词**：advanced_behavior_tree, behavior_node
- **出处**：`air_to_air/scenarios/hvaa_dca.txt:99-101`
- **片段**：

```text
      advanced_behavior_tree 
         behavior_node orbit_rules 
      end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree 的参数：behavior_node

### advanced_behavior_tree（run_tree）｜

- **关键词**：advanced_behavior_tree
- **出处**：`behavior_tree/run_tree.txt:47-74`
- **片段**：

```text
      advanced_behavior_tree
            btt on
            parallel #choose a tree
               behavior_node choose_tree
               sequence #engage
                  condition run_engage
                     parallel
                        selector
                           behavior_node pursue_weapon_task_target
                           behavior_node planned_route
                        end_selector
                        behavior_node engage_weapon_task_target
                     end_parallel
               end_sequence
               sequence #fly checkpoints
                  condition run_checkpoints
                  sequence
                     behavior_node fly_checkpoint_1
                     behavior_node fly_checkpoint_2
                     behavior_node fly_checkpoint_3
                  end_sequence
               end_sequence
               sequence #return to base
                  condition run_rtb
                  behavior_node rtb
               end_sequence
            end_parallel
         end_advanced_behavior_tree
```

- **演示要点**：演示 advanced_behavior_tree（最小结构，无子参数）

### air_traffic（china_air_traffic）｜

- **关键词**：air_traffic, aircraft_type, minimum_cruise_altitude, maximum_cruise_altitude, mean_cruise_speed, sigma_cruise_speed, minimum_runway_length, maximum_operating_range, airbase, runway_length, runway_heading, aircraft, departure_interval
- **出处**：`traffic_demos/scenarios/china_air_traffic.txt:9-254`
- **片段**：

```text
air_traffic

  aircraft_type B-737
    minimum_cruise_altitude 20000 ft
    maximum_cruise_altitude 30000 ft
    mean_cruise_speed         410 kts
    sigma_cruise_speed         40 kts
    minimum_runway_length    3500 ft
    maximum_operating_range  2000 nm
  end_aircraft_type

  aircraft_type B-747
    minimum_cruise_altitude 20000 ft
    maximum_cruise_altitude 34000 ft
    mean_cruise_speed         420 kts
    sigma_cruise_speed         40 kts
    minimum_runway_length    4000 ft
    maximum_operating_range  2000 nm
  end_aircraft_type

  aircraft_type B-757
    minimum_cruise_altitude 20000 ft
    maximum_cruise_altitude 33000 ft
    mean_cruise_speed         420 kts
    sigma_cruise_speed         40 kts
    minimum_runway_length    3800 ft
    maximum_operating_range  2000 nm
  end_aircraft_type

# Airport locations from WORLDAERODATA.COM

# BAIYUN INTL at Guanghouz # 02L/20R
  airbase ZGGG 23.376822N 113.283497E
    runway_length 3600 m
    runway_heading 14.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
  end_airbase

# BINHAI at Tianjin 16/34
#  airbase ZBTJ 39.137353N 117.338208E
#    runway_length 3200 m
#    runway_heading 155.0
#  end_airbase

# CAPITAL INTL at Beijing 18R/36L
  airbase ZBAA 40.102111N 116.569694E
    runway_length 3200 m
    runway_heading 173.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 105 min
    destination  VHHH .4
    destination ZSOF .3
    destination ZGGG .2
    destination ZSCN .1
  end_airbase

# CHANGBEI INTL at Nanchang  03/21
  airbase ZSCN 28.853372N 115.894394E
    runway_length 2800 m
    runway_heading 023.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 163 min
    destination  VHHH .5
    destination ZGGG .5

  end_airbase

# CHANGLE at Fuzhou 03/21
  airbase ZSFZ 25.920514N 119.655175E
    runway_length 3609 m
    runway_heading 026.7
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 175 min
    destination  VHHH .7
    destination ZGGG .2
    destination ZSCN .1

  end_airbase

# DASHUIPO at Weihai 02/20
#  airbase ZSWH 37.176033N 122.224261E
#    runway_length 2600 m
#    runway_heading 018.5
#  end_airbase


# GAOQI at Xiamen 05/23
#  airbase ZSAM 24.534589N 118.114517E
#    runway_length 3400 m
#    runway_heading 053.0
#  end_airbase

# HONGQIAO INTL at Shanghai 18/36
  airbase ZSSS 31.213250N 121.335444E
    runway_length 3400 m
    runway_heading 176.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 111 min
    destination VHHH .4
    destination ZSHC .3
    destination VHHH .3

  end_airbase


# LAISHAN at Yantai ZSYT 04/22
#  airbase ZSYT 37.391014N 121.361431E
#    runway_length 2600 m
#    runway_heading 037.5
#  end_airbase


# LISHE   ZSNB  at  Ningbo 13/31
  airbase ZSNB 29.834594N 121.448044E
    runway_length 3200 m
    runway_heading 123.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 93 min
    destination VHHH .4
    destination ZSHC .3
    destination VHHH .3
  end_airbase

# LIUTING   ZSQD at   Qingdao 17/35
#  airbase ZSQD 36.280986N 120.369700E
#    runway_length 3400 m
#    runway_heading 166.0
#  end_airbase

# LUKOU at Nanjing ZSNJ 06/24
  airbase ZSNJ 31.733450N 118.845906E
    runway_length 3600 m
    runway_heading 058.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 78 min
    destination VHHH .5
    destination ZSHC .3
    destination ZSNB .2

  end_airbase

# LUOGANG at Hefei ZSOF 14/32
  airbase ZSOF 31.789636N 117.287569E
    runway_length 3000 m
    runway_heading 135.3
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 71 min
    destination ZBAA .5
    destination ZSHC .3
    destination ZSNB .2
  end_airbase

# PUDONG at Shanghai ZSPD 16/34
  airbase ZSPD 31.159014N 121.811669E
    runway_length 3800 m
    runway_heading 162.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 73 min
    destination VHHH .5
    destination ZSHC .3
    destination ZSNB .2

  end_airbase

# XIAOSHAN aka HANGZHOU ZSHC 07/25
  airbase ZSHC 30.222119N 120.417800E
    runway_length 3600 m
    runway_heading 062.9
    aircraft B-737 .3
    aircraft B-747 .5
    aircraft B-757 .2
    departure_interval 65 min
    destination VHHH .2
    destination ZSNJ .2
    destination ZSNB .1
    destination ZBAA .5
  end_airbase

# YAOQIANG at Jinan ZSJN 01/19
  airbase  ZSJN 36.840989N 117.216003E
    runway_length 3601 m
    runway_heading 360.0
    aircraft B-737 .3
    aircraft B-747 .5
    aircraft B-757 .2
    departure_interval 50 min
    destination VHHH .2
    destination ZSNJ .4
    destination ZSNB .1
    destination ZBAA .3

  end_airbase

# ZHOUSHUIZI at Dalian ZYTL 10/28
#  airbase ZYTL 38.967131N 121.519656E
#    runway_length 3300 m
#    runway_heading  096.0
#  end_airbase

# HONG KONG INTL  at Hong Kong VHHH 07R/25L
  airbase VHHH 22.296201N 113.897975E
    runway_length 3800 m
    runway_heading  071.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 20 min
    destination ZBAA .2
    destination ZGGG .1
    destination ZSNJ .1
    destination ZSFZ .1
    destination ZSHC .2
    destination RCTP .3
  end_airbase

# Taiwan Taipei added for flights to Hong Kong
# CHIANG KAI SHEK INTL RCTP    Taipei  05/23
  airbase RCTP 25.073081N 121.215572E
    runway 25.073081N 121.215572E 25.094647N 121.243133E
  #  runway_length 3660 m
  #  runway_heading 049.0
    aircraft B-747 .5
    aircraft B-757 .25
    aircraft B-737 .25
    departure_interval 45 min
    destination VHHH 1
   end_airbase
end_air_traffic
```

- **演示要点**：演示 air_traffic 的参数：aircraft_type, minimum_cruise_altitude, maximum_cruise_altitude, mean_cruise_speed, sigma_cruise_speed, minimum_runway_length, maximum_operating_range, airbase, runway_length, runway_heading

### atmosphere_model（mid_lat_summer_day）｜

- **关键词**：atmosphere_model, background_radiance, foreground_radiance, foreground_transmittance
- **出处**：`sosm/modtran/mid_lat_summer_day.txt:13-17`　（同签名共 6 处，另见 `sosm/modtran/mid_lat_summer_night.txt:13`、`sosm/modtran/mid_lat_winter_day.txt:13`、`sosm/modtran/mid_lat_winter_night.txt:13`）
- **片段**：

```text
atmosphere_model table
   background_radiance      mid_lat_summer_day.bgr
   foreground_radiance      mid_lat_summer_day.fgr
   foreground_transmittance mid_lat_summer_day.fgt
end_atmosphere_model
```

- **演示要点**：演示 atmosphere_model 的参数：background_radiance, foreground_radiance, foreground_transmittance

### atmosphere_model · WSF_PIECEWISE_EXPONENTIAL_ATMOSPHERE｜

- **关键词**：atmosphere_model, WSF_PIECEWISE_EXPONENTIAL_ATMOSPHERE
- **出处**：`multiresolution_demos/space_mover_demo.txt:25-26`　（同签名共 2 处，另见 `satellite_demos/aerobraking_demo.txt:25`）
- **片段**：

```text
atmosphere_model basic WSF_PIECEWISE_EXPONENTIAL_ATMOSPHERE
end_atmosphere_model
```

- **演示要点**：演示 WSF_PIECEWISE_EXPONENTIAL_ATMOSPHERE（最小结构，无子参数）

### atmosphere_table（complex_test）｜

- **关键词**：atmosphere_table, include
- **出处**：`space_operations/launch_vehicles/saturn_v/complex_test.txt:13-15`
- **片段**：

```text
atmosphere_table
   include atmosphere.txt
end_atmosphere_table
```

- **演示要点**：演示 atmosphere_table 的参数：include

### atmosphere_table（six_dof_environment）｜

- **关键词**：atmosphere_table
- **出处**：`air_to_air/six_dof_types/environment/six_dof_environment.txt:43-328`　（同签名共 3 处，另见 `six_dof/six_dof_types/environment/six_dof_environment.txt:40`、`six_dof_with_brawler/six_dof_types/environment/six_dof_environment.txt:40`）
- **片段**：

```text
atmosphere_table
   0	288.15	101325.5333	1.225143063	340.29396
   304.8	286.1666667	97716.80197	1.189695308	339.123528
   609.6	284.1888889	94213.40713	1.155036082	337.947
   914.4	282.2055556	90811.99713	1.121149925	336.767424
   1219.2	280.2277778	87511.13557	1.088036836	335.581752
   1524	278.2444444	84307.47083	1.055671046	334.393032
   1828.8	276.2611111	81200.04531	1.024047402	333.201264
   2133.6	274.2833333	78185.50739	0.993155596	332.0034
   2438.4	272.3	75262.89947	0.96298532	330.802488
   2743.2	270.3222222	72428.86994	0.933515959	329.598528
   3048	268.3388889	69681.98239	0.90474236	328.388472
   3352.8	266.3555556	67019.84281	0.876654214	327.17232
   3657.6	264.3777778	64441.01479	0.849236061	325.95312
   3962.4	262.3944444	61943.10432	0.822482747	324.730872
   4267.2	260.4111111	59524.19619	0.796373656	323.502528
   4572	258.4333333	57182.3752	0.770908788	322.268088
   4876.8	256.45	54915.24734	0.746067529	321.0306
   5181.6	254.4722222	52721.855	0.721844725	319.790064
   5486.4	252.4888889	50600.28297	0.698230068	318.540384
   5791.2	250.5055556	48547.65843	0.675208096	317.287656
   6096	248.5277778	46563.45472	0.652773656	316.03188
   6400.8	246.5444444	44645.32569	0.630911287	314.770008
   6705.6	244.5611111	42791.69131	0.609615834	313.50204
   7010.4	242.5833333	41000.82788	0.588871836	312.231024
   7315.2	240.6	39271.15535	0.568674141	310.953912
   7620	238.6222222	37601.09368	0.549012439	309.670704
   7924.8	236.6388889	35988.96707	0.529871269	308.3814
   8229.6	234.6555556	34433.29122	0.51124754	307.089048
   8534.4	232.6777778	32932.48609	0.493128367	305.787552
   8839.2	230.6944444	31485.16315	0.475504473	304.483008
   9144	228.7166667	30089.74236	0.458366582	303.172368
   9448.8	226.7333333	28744.78731	0.441705415	301.85868
   9753.6	224.75	27449.00523	0.425511182	300.535848
   10058.4	222.7722222	26200.86396	0.409775636	299.209968
   10363.2	220.7888889	24999.11861	0.394488469	297.874944
   10668	218.8055556	23842.38066	0.379641952	296.536872
   10972.8	216.8277778	22729.40522	0.365226806	295.189656
   11277.6	216.65	21662.8257	0.348372373	295.070784
   11582.4	216.65	20646.28099	0.332024557	295.070784
   11887.2	216.65	19677.42498	0.316443624	295.070784
   12192	216.65	18754.00728	0.301594015	295.070784
   12496.8	216.65	17873.92117	0.287441197	295.070784
   12801.6	216.65	17035.15568	0.273952702	295.070784
   13106.4	216.65	16235.7956	0.261097093	295.070784
   13411.2	216.65	15473.87785	0.248844477	295.070784
   13716	216.65	14747.72661	0.237167024	295.070784
   14020.8	216.65	14055.66608	0.226037934	295.070784
   14325.6	216.65	13396.11621	0.215430407	295.070784
   14630.4	216.65	12767.44907	0.205321252	295.070784
   14935.2	216.65	12168.32403	0.195686245	295.070784
   15240	216.65	11597.30466	0.186503225	295.070784
   15544.8	216.65	11053.09821	0.177751062	295.070784
   15849.6	216.65	10534.41192	0.169409656	295.070784
   16154.4	216.65	10040.04876	0.161459937	295.070784
   16459.2	216.65	9568.907515	0.153883353	295.070784
   16764	216.65	9119.886921	0.146661865	295.070784
   17068.8	216.65	8691.885739	0.139779497	295.070784
   17373.6	216.65	8284.042124	0.13322027	295.070784
   17678.4	216.65	7895.302713	0.126968725	295.070784
   17983.2	216.65	7524.805661	0.121010431	295.070784
   18288	216.65	7171.689125	0.115331987	295.070784
   18592.8	216.65	6835.13914	0.109919479	295.070784
   18897.6	216.65	6514.389625	0.104761568	295.070784
   19202.4	216.65	6208.674494	0.099845369	295.070784
   19507.2	216.65	5917.323427	0.09516006	295.070784
   19812	216.65	5639.666099	0.090694303	295.070784
   20116.8	216.7666667	5375.032187	0.086392436	295.150032
   20421.6	217.0722222	5123.086531	0.08222766	295.357296
   20726.4	217.3777778	4883.302448	0.078269035	295.56456
   21031.2	217.6833333	4655.057494	0.074506254	295.771824
   21336	217.9888889	4437.767533	0.07092901	295.979088
   21640.8	218.2888889	4230.905881	0.067528025	296.186352
   21945.6	218.5944444	4033.955432	0.064295054	296.390568
   22250.4	218.9	3846.427808	0.061220819	296.597832
   22555.2	219.2055556	3667.858571	0.05829759	296.805096
   22860	219.5111111	3497.812011	0.055517637	297.01236
   23164.8	219.8166667	3335.871571	0.052873744	297.216576
   23469.6	220.1222222	3181.635056	0.05035921	297.42384
   23774.4	220.4222222	3034.729	0.047967853	297.628056
   24079.2	220.7277778	2894.794303	0.045692455	297.83532
   24384	221.0333333	2761.495803	0.04352838	298.039536
   24688.8	221.3388889	2634.503127	0.041469441	298.2468
   24993.6	221.6444444	2513.514628	0.039510486	298.451016
   25298.4	221.95	2398.233451	0.037646876	298.655232
   25603.2	222.2555556	2288.391465	0.035872943	298.862496
   25908	222.5555556	2183.720542	0.034185592	299.066712
   26212.8	222.8611111	2083.966915	0.032579157	299.270928
   26517.6	223.1666667	1988.900762	0.031050543	299.475144
   26822.4	223.4722222	1898.292256	0.029595629	299.67936
   27127.2	223.7777778	1811.925936	0.028210806	299.883576
   27432	224.0833333	1729.595918	0.026891951	300.087792
   27736.8	224.3888889	1651.115468	0.025637004	300.292008
   28041.6	224.6944444	1576.293067	0.02444184	300.496224
   28346.4	224.9944444	1504.956344	0.023304399	300.70044
   28651.2	225.3	1436.93772	0.022221073	300.904656
   28956	225.6055556	1372.07919	0.021189285	301.105824
   29260.8	225.9111111	1310.232325	0.020206973	301.31004
   29565.6	226.2166667	1251.248696	0.019271045	301.514256
   29870.4	226.5222222	1194.99424	0.018379955	301.715424
   30175.2	226.8277778	1141.339678	0.017531126	301.91964
   30480	227.1277778	1090.165311	0.016722496	302.120808
   30784.8	227.4333333	1041.346651	0.015952521	302.325024
   31089.6	227.7388889	994.7735723	0.015218621	302.526192
   31394.4	228.0444444	950.340739	0.014519252	302.730408
   31699.2	228.35	907.9523906	0.013853383	302.931576
   32004	228.6611111	867.5031906	0.013217921	303.13884
   32308.8	229.5166667	828.9548348	0.012583489	303.70272
   32613.6	230.3666667	792.2546552	0.011982042	304.2666
   32918.4	231.2222222	757.3021031	0.011411002	304.83048
   33223.2	232.0777778	724.0157822	0.010869339	305.39436
   33528	232.9277778	692.3047203	0.010355507	305.955192
   33832.8	233.7833333	662.0923088	0.009867443	306.512976
   34137.6	234.6333333	633.2971515	0.009403602	307.073808
   34442.4	235.4888889	605.8570041	0.008963468	307.631592
   34747.2	236.3444444	579.6952583	0.008545496	308.189376
   35052	237.1944444	554.7544578	0.008148654	308.744112
   35356.8	238.05	530.9675703	0.007771397	309.298848
   35661.6	238.9	508.2819276	0.007412694	309.853584
   35966.4	239.7555556	486.6448614	0.007072028	310.405272
   36271.2	240.6111111	465.9941276	0.006747855	310.95696
   36576	241.4611111	446.2914218	0.006439658	311.508648
   36880.8	242.3166667	427.488864	0.006146408	312.057288
   37185.6	243.1722222	409.5385739	0.005867588	312.608976
   37490.4	244.0222222	392.4022474	0.005602683	313.154568
   37795.2	244.8777778	376.0367922	0.005350148	313.703208
   38100	245.7277778	360.4086922	0.005109981	314.2488
   38404.8	246.5833333	345.4796432	0.004881668	314.794392
   38709.6	247.4388889	331.2209172	0.004663663	315.339984
   39014.4	248.2888889	317.5942099	0.004456481	315.882528
   39319.2	249.1444444	304.5707932	0.004259091	316.425072
   39624	250	292.121939	0.004070977	316.964568
   39928.8	250.85	280.2237073	0.003892141	317.507112
   40233.6	251.7055556	268.8521578	0.00372155	318.046608
   40538.4	252.5555556	257.9737745	0.003558691	318.586104
   40843.2	253.4111111	247.5694052	0.003403562	319.122552
   41148	254.2666667	237.6198979	0.003256163	319.659
   41452.8	255.1166667	228.1013125	0.00311495	320.195448
   41757.6	255.9722222	218.9944969	0.002980951	320.731896
   42062.4	256.8222222	210.2755109	0.002852622	321.265296
   42367.2	257.6777778	201.9347786	0.002730477	321.798696
   42672	258.5333333	193.9531479	0.002614001	322.332096
   42976.8	259.3833333	186.3066786	0.00250268	322.862448
   43281.6	260.2388889	178.9857948	0.002396511	323.3928
   43586.4	261.0944444	171.9809203	0.002294982	323.923152
   43891.2	261.9444444	165.2633271	0.002198091	324.450456
   44196	262.8	158.8330151	0.002105838	324.980808
   44500.8	263.65	152.6756203	0.002017708	325.508112
   44805.6	264.5055556	146.7719906	0.001933186	326.032368
   45110.4	265.3611111	141.11255	0.001852787	326.559672
   45415.2	266.2111111	135.6925104	0.001775995	327.083928
   45720	267.0666667	130.4975078	0.001702296	327.608184
   46024.8	267.9222222	125.5131781	0.001632205	328.13244
   46329.6	268.7722222	120.7347333	0.001565205	328.653648
   46634.4	269.6277778	116.1573854	0.001500783	329.174856
   46939.2	270.4777778	111.7619823	0.001439453	329.696064
   47244	270.65	107.5437359	0.001384308	329.799696
   47548.8	270.65	103.4834943	0.001332254	329.799696
   47853.6	270.65	99.57646926	0.001281747	329.799696
   48158.4	270.65	95.81787291	0.001233302	329.799696
   48463.2	270.65	92.20291718	0.001186917	329.799696
   48768	270.65	88.72202604	0.001142079	329.799696
   49072.8	270.65	85.37519947	0.001098788	329.799696
   49377.6	270.65	82.15286145	0.001057557	329.799696
   49682.4	270.65	79.05022395	0.001017873	329.799696
   49987.2	270.65	76.06728697	0.00097922	329.799696
   50292	270.65	73.19926249	0.000942112	329.799696
   50596.8	270.65	70.43657447	0.000906551	329.799696
   50901.6	270.65	67.77443489	0.000872536	329.799696
   51206.4	270.0722222	65.21763177	0.000841098	329.446128
   51511.2	269.2166667	62.74701302	0.000812237	328.92492
   51816	268.3666667	60.36257864	0.000783891	328.403712
   52120.8	267.5111111	58.05954062	0.000756061	327.882504
   52425.6	266.6611111	55.84268698	0.000729776	327.358248
   52730.4	265.8055556	53.69765364	0.000704007	326.833992
   53035.2	264.95	51.63401666	0.000678754	326.309736
   53340	264.1	49.63741198	0.000655046	325.782432
   53644.8	263.2444444	47.71741562	0.000631339	325.255128
   53949.6	262.3888889	45.86445156	0.000609178	324.727824
   54254.4	261.5388889	44.07851979	0.000587016	324.20052
   54559.2	260.6833333	42.35483229	0.000565886	323.670168
   54864	259.8333333	40.69338906	0.000545786	323.139816
   55168.8	258.9777778	39.08940208	0.000525686	322.609464
   55473.6	258.1222222	37.54765937	0.000506617	322.076064
   55778.4	257.2722222	36.05858489	0.000488579	321.542664
   56083.2	256.4166667	34.62696666	0.000470541	321.009264
   56388	255.5611111	33.24801666	0.000453018	320.475864
   56692.8	254.7111111	31.91694687	0.000436526	319.939416
   56997.6	253.8555556	30.63854531	0.000420549	319.402968
   57302.4	253.0055556	29.40323594	0.000405088	318.86652
   57607.2	252.15	28.21580677	0.000389626	318.327024
   57912	251.2944444	27.07146979	0.000375196	317.787528
   58216.8	250.4444444	25.970225	0.000361281	317.248032
   58521.6	249.5888889	24.91207239	0.000347881	316.708536
   58826.4	248.7388889	23.89222396	0.000334481	316.165992
   59131.2	247.8833333	22.91067969	0.000322112	315.623448
   59436	247.0277778	21.96743958	0.000309743	315.077856
   59740.8	246.1777778	21.05771562	0.000297889	314.535312
   60045.6	245.3222222	20.18629583	0.000286551	313.98972
   60350.4	244.4666667	19.34360417	0.000275728	313.44108
   60655.2	243.6166667	18.53921667	0.000264905	312.895488
   60960	242.7611111	17.75876927	0.000255113	312.346848
   61264.8	241.9111111	17.01183802	0.000244805	311.79516
   61569.6	241.0555556	16.29363489	0.000235528	311.24652
   61874.4	240.2	15.60415989	0.000226251	310.694832
   62179.2	239.35	14.94341302	0.00021749	310.143144
   62484	238.4944444	14.30660625	0.000208728	309.588408
   62788.8	237.6388889	13.69373958	0.000200998	309.033672
   63093.6	236.7888889	13.10481302	0.000192752	308.478936
   63398.4	235.9333333	12.53982656	0.000185021	307.921152
   63703.2	235.0833333	11.99878021	0.000177806	307.363368
   64008	234.2277778	11.47688594	0.00017059	306.805584
   64312.8	233.3722222	10.97893177	0.00016389	306.2478
   64617.6	232.5222222	10.49534167	0.000157191	305.686968
   64922.4	231.6666667	10.03569167	0.000151006	305.126136
   65227.2	230.8166667	9.595193749	0.000144821	304.562256
   65532	229.9611111	9.169059895	0.000139152	303.998376
   65836.8	229.1055556	8.762078124	0.000133483	303.434496
   66141.6	228.2555556	8.374248437	0.000127814	302.867568
   66446.4	227.4	8.000782812	0.00012266	302.30064
   66751.2	226.5444444	7.641681249	0.000117506	301.733712
   67056	225.6944444	7.296943749	0.000112868	301.163736
   67360.8	224.8388889	6.966570312	0.000107714	300.59376
   67665.6	223.9888889	6.650560937	0.000103591	300.023784
   67970.4	223.1333333	6.348915625	9.89527E-05	299.45076
   68275.2	222.2777778	6.056846354	9.48297E-05	298.877736
   68580	221.4277778	5.779141145	9.07067E-05	298.304712
   68884.8	220.5722222	5.5158	8.7099E-05	297.72864
   69189.6	219.7166667	5.262034895	8.34914E-05	297.152568
   69494.4	218.8666667	5.017845833	7.98837E-05	296.573448
   69799.2	218.0111111	4.783232812	7.62761E-05	295.997376
   70104	217.1611111	4.558195833	7.31838E-05	295.415208
   70408.8	216.3055556	4.347522916	7.00915E-05	294.836088
   70713.6	215.45	4.141638021	6.69992E-05	294.25392
   71018.4	214.6111111	3.945329166	6.3907E-05	293.680896
   71323.2	214.0055556	3.758596354	6.13301E-05	293.26332
   71628	213.3944444	3.581439583	5.82378E-05	292.842696
   71932.8	212.7833333	3.409070833	5.56609E-05	292.42512
   72237.6	212.1777778	3.246278125	5.3084E-05	292.007544
   72542.4	211.5666667	3.088273437	5.10225E-05	291.58692
   72847.2	210.9555556	2.939844791	4.84456E-05	291.166296
   73152	210.3444444	2.800992187	4.63841E-05	290.745672
   73456.8	209.7388889	2.662139583	4.43226E-05	290.322
   73761.6	209.1277778	2.532863021	4.22611E-05	289.901376
   74066.4	208.5166667	2.4131625	4.01995E-05	289.477704
   74371.2	207.9055556	2.293461979	3.86534E-05	289.054032
   74676	207.3	2.1833375	3.65919E-05	288.63036
   74980.8	206.6888889	2.073213021	3.50458E-05	288.206688
   75285.6	206.0777778	1.972664583	3.34996E-05	287.779968
   75590.4	205.4722222	1.876904167	3.19535E-05	287.356296
   75895.2	204.8611111	1.78114375	3.04074E-05	286.929576
   76200	204.25	1.694959375	2.88612E-05	286.499808
   76504.8	203.6388889	1.608775	2.73151E-05	286.073088
   76809.6	203.0333333	1.527378646	2.62843E-05	285.64332
   77114.4	202.4222222	1.450770312	2.52536E-05	285.2166
   77419.2	201.8111111	1.37895	2.37074E-05	284.786832
   77724	201.2	1.311917708	2.26767E-05	284.354016
   78028.8	200.5944444	1.244885417	2.16459E-05	283.924248
   78333.6	199.9833333	1.182641146	2.06152E-05	283.491432
   78638.4	199.3722222	1.120396875	1.95844E-05	283.058616
   78943.2	198.7611111	1.062940625	1.85536E-05	282.6258
   79248	198.1555556	1.010272396	1.75229E-05	282.192984
   79552.8	197.5444444	0.957604167	1.70075E-05	281.760168
   79857.6	196.9333333	0.909723958	1.59767E-05	281.324304
   80162.4	196.3277778	0.86184375	1.54614E-05	280.88844
   80467.2	195.7166667	0.818751562	1.44306E-05	280.452576
   80772	195.1055556	0.775659375	1.39152E-05	280.013664
   81076.8	194.4944444	0.732567187	1.33998E-05	279.5778
   81381.6	193.8888889	0.694263021	1.23691E-05	279.138888
   81686.4	193.2777778	0.660746875	1.18537E-05	278.699976
   81991.2	192.6666667	0.627230729	1.13383E-05	278.258016
   82296	192.0555556	0.593714583	1.0823E-05	277.819104
   82600.8	191.45	0.560198437	1.03076E-05	277.377144
   82905.6	190.8388889	0.531470312	9.7922E-06	276.935184
   83210.4	190.2277778	0.502742187	9.27682E-06	276.493224
   83515.2	189.6222222	0.474014062	8.76144E-06	276.048216
   83820	189.0111111	0.450073958	8.24606E-06	275.606256
   84124.8	188.4	0.426133854	7.73068E-06	275.161248
   84429.6	187.7888889	0.40219375	7.73068E-06	274.71624
   84734.4	187.1833333	0.383041667	7.2153E-06	274.268184
   85039.2	186.9444444	0.359101562	6.69992E-06	274.097496
   85344	186.9444444	0.339949479	6.18455E-06	274.097496
   85648.8	186.9444444	0.320797396	6.18455E-06	274.097496
   85953.6	186.9444444	0.306433333	5.66917E-06	274.097496
   121920	186.9444444	0	0	274.097496
end_atmosphere_table
```

- **演示要点**：演示 atmosphere_table（最小结构，无子参数）

### atmospheric_coefficients（AAA_README）｜

- **关键词**：atmospheric_coefficients
- **出处**：`hel/atmosphere/AAA_README.txt:81-96`　（同签名共 2 处，另见 `hel/atmosphere/COEFSxxxx_x.txt:9`）
- **片段**：

```text
atmospheric_coefficients

wavelength xxxx nanometers  // wavelength in nm for which table is valid
atmosphere_model  // 1-6; see explanation
haze_model  // 1-6; see explanation

altitude
end_altitude

attenuation
end_attenuation

scattering
end_scattering

end_atmospheric_coefficients
```

- **演示要点**：演示 atmospheric_coefficients（最小结构，无子参数）

### behavior（behavior_pursue_base）｜

- **关键词**：behavior, script_debug_writes, script_variables, script, extern, foreach, return, precondition, execute, parallel
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_base.txt:27-232`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_base.txt:27`）
- **片段**：

```text
behavior pursue_base

   script_debug_writes off

   script_variables

      //**********************************************************************//
      //**  aggregate parameters (modifeid by or used by child behaviors)   **//
      //**********************************************************************//
      //these three are modified by child behaviors, not edited here
      double mDesiredHeading;
      double mDesiredAltitude;
      double mDesiredSpeed;
      //user can edit these three
      double mDesiredLinearAccel    = 7.5 * Earth.ACCEL_OF_GRAVITY();   // 7.5 G  (m/s^2)
      double mDesiredRadialAccel    = 6.0 * Earth.ACCEL_OF_GRAVITY();   // 6.0 G  (m/s^2) //default max limit for air mover
      double mDesiredClimbDiveAngle = 35;   //(degrees) //should this be climb/dive rate instead of angle?

      //**********************************************************************//
      //**  bidding parameters (pursue-target jobs)                         **//
      //**     slant range and closing speed are the most important         **//
      //**     bids are now in units of distance (meters)                   **//
      //**     all other bid contributions are converted with their weight  **//
      //**     range will dominate the bids                                 **//
      //**********************************************************************//
      double cMIN_JOB_BID                        =  -MATH.DOUBLE_MAX();

      double cMAX_SLANT_RANGE                    = 1000000.0;  #over 539 nm away, target ranges beyond this are considered unfavorable
      double cWEIGHT_SLANT_RANGE_TO              =       1.0;

      double cMIN_CLOSING_SPEED                  =   -1050.0;  #threats running away (negative closing) faster are considered unfavorable
      double cWEIGHT_CLOSING_SPEED               =       1.0;  #scale for how closing speed translates to distance

      double cWEIGHT_FUEL                        =       0.0;  #try a value of 2.0 if you care about fuel
      double cWEIGHT_MY_WEAPONS_ACTIVE           =       0.0;  #changes bid if your own weapons are active on target
      double cWEIGHT_PEERS_WEAPONS_ACTIVE        =       0.0;  #changes bid if your peers weapons are active on target
      double cWEIGHT_THREAT_WEAPONS_ENVELOPE     =       0.0;  #uses the global "mWeaponsEnvelope" array, try value of 10000 if you care about that
      //careful with these two parameters, they are stateful
      double cWEIGHT_CURRENT_TARGET              =       0.0;   #changes bid if you are currently targeting the threat
      double cWEIGHT_OTHERS_TARGETING            =       0.0;   #changes bid if peers are currently targeting the threat


      //**********************************************************************//
      //** control / mode of operation parameters                           **//
      //**********************************************************************//
     #bool mFilterJobsOnWeapons  = true;  # ignore pursue-target jobs that we cant shoot a weapon at
      bool mFilterJobsOnWeapons  = false;  # ignore pursue-target jobs that we cant shoot a weapon at
      bool mFilterJobsOnCategory = false; # ignore pursue-target jobs that are for platform of unknown category
      bool mFilterJobsOnFuel     = false; # ignore pursue-target jobs that we dont have the fuel to reach

      bool mFilterJobsOnZone     = false; # ignore pursue-target jobs that are for platforms outsize of zone "mZoneName"
      string  mZoneName = "";
      WsfZone mFezZone;

      bool    mCheckOwnJobBoardToo  = false; # can this agent bid on & win a job off his own board

      //**********************************************************************//
      //** debugging parameters                                             **//
      //**********************************************************************//
     #bool     mDrawSteering     = false;

      //**********************************************************************//
      //********* VARIABLES BELOW THIS LINE ARE NOT FOR USER EDITING *********//
      //**********************************************************************//
      WsfRIPRJob mCurrentJob;
     #WsfDraw  mDraw             = WsfDraw();
      string   mOldTargetStr     = "no target";
      double   mLastTime         = 0.0;

   end_script_variables


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


   execute
      writeln_d(PLATFORM.Name(), " executing pursue_base, T=", TIME_NOW);

#      if (mDrawSteering == true)
#      {
#         mDraw.SetLayer("behavior_pursue_target");
#         mDraw.SetDuration(PROCESSOR.UpdateInterval());
#         mDraw.SetColor(1.0, 0.5, 0.0);
#         mDraw.SetLineSize(1);
#         mDraw.BeginLines();
#            mDraw.Vertex(PLATFORM.Location());
#            mDraw.Vertex(mTargetPoint);
#         mDraw.End();
#      }
   end_execute


   parallel
      precondition
         WsfTrack target = ((WsfRIPRProcessor)PROCESSOR).GetTarget();
         if (target.IsNull() || !target.IsValid()) {
            return Failure("target track not found");
         }
         if (!target.AirDomain()) {
            #writeln("track is not for an air-domain target");
            return Failure("track is not for an air-domain target");
         }
         return true;
      end_precondition
      behavior_node pursue_heading
      behavior_node pursue_altitude
      behavior_node pursue_speed
      behavior_node pursue_fly_simple
   end_parallel


end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, script, extern, foreach, return, precondition, execute, parallel

### behavior（behavior_timeline_reposition）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, on_new_execute, on_new_fail, precondition, execute
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_reposition.txt:15-136`
- **片段**：

```text
behavior timeline_reposition

   script_debug_writes off

   script_variables
      WsfQuantumTaskerProcessor processor;
      bool     mRepositioning = false;
   end_script_variables

   on_init
      if (PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         processor = (WsfQuantumTaskerProcessor)PROCESSOR;
      }
   end_on_init

   on_new_execute
      mRepositioning = true;
      PLATFORM.Comment("reposition");
   end_on_new_execute
   on_new_fail
      mRepositioning = false;
   end_on_new_fail

   #TODO - add hysteresis?
   #       if already repositioning, account for turn time back to engage
   #       dont reengage if we'll have to turn away before facing target
   precondition

      #writeln_d(PLATFORM.Name(), " precondition  timeline_reposition,  T=", TIME_NOW);
      if (!processor.IsValid())
      {
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }
      WsfTask timeline = GetTimeLineTask(processor);
      if (!timeline.IsValid())
      {
         return Failure("not assigned a TIMELINE task");
      }

      extern WsfLocalTrack mNearestTimeLineTarget;
      if (!mNearestTimeLineTarget.IsValid())
      {
         return Failure("no local TIMELINE target to fly against");
      }

      extern double mGeesToTurnWith;
      string RISK = timeline.AuxDataString("RISK");
      if (RISK == "HIGH")
      {
         return Failure("HIGH RISK agent does not reposition");
      }

      extern double mDragSpeed;
      extern double mEngageSpeed;

      if (mRepositioning == true)
      {
         writeln_d("testing conditions to CONTINUE dragging");
         #already dragging, look at conditions required to stop dragging & re-engage
         #check what distance we'd be at after a turn to face the target and another turn away
         #in other words: do we have the time to face the target & then turn to stay outside the gate?

         #gate determined by risk level (LOW risk gate = DOR, MEDIUM risk gate = MAR)
         double gate = timeline.AuxDataDouble("DOR");  #range (meters)
         if (RISK == "MEDIUM")
         {
            gate = timeline.AuxDataDouble("MAR");  #range (meters)
         }

         Array<double> vals = Array<double>();
         WsfGeoPoint targetLoc = mNearestTimeLineTarget.CurrentLocation();
         WsfTrack platAsTrack = PLATFORM.MakeTrack();
         platAsTrack.SetVelocity(mDragSpeed, platAsTrack.Heading());
         TurnTimeAndDistance(platAsTrack, targetLoc, mGeesToTurnWith, vals);
         double turnTime   = vals[0];
         double distClosed = vals[1];
         double rangeAfterTurningIn = PLATFORM.GroundRangeTo(targetLoc) - distClosed - mNearestTimeLineTarget.Speed()*turnTime;
         double turnAwayTime = TimeToTurn(180, mEngageSpeed, mGeesToTurnWith);
         double rangeAfterTurningAway = rangeAfterTurningIn - mNearestTimeLineTarget.Speed()*turnAwayTime;
         if (rangeAfterTurningAway >= gate)
         {
            return Failure("enough time to turn & face before gate");
         }
         return true;
      }
      else
      {
         writeln_d("testing conditions to START dragging");
         #not dragging yet, look at conditions required to start:
         #look at time required to turn & leave: compare to time until next gate

         #gate determined by risk level (LOW risk gate = DOR, MEDIUM risk gate = MAR)
         double gate = timeline.AuxDataDouble("DOR");  #range (meters)
         if (RISK == "MEDIUM")
         {
            gate = timeline.AuxDataDouble("MAR");  #range (meters)
         }

         Array<double> vals = Array<double>();
         WsfGeoPoint targetLoc = mNearestTimeLineTarget.CurrentLocation();
         double turnAngle = 180 - MATH.Fabs(PLATFORM.RelativeBearingTo(targetLoc));
         TurnAngleTimeAndDistance(turnAngle, mEngageSpeed, mGeesToTurnWith, vals);
         double turnTime = vals[0];
         double distSep  = vals[1];
         double rangeAfterTurn = distSep + PLATFORM.GroundRangeTo(targetLoc) - mNearestTimeLineTarget.Speed()*turnTime;

         if (rangeAfterTurn >= gate)
         {
            return Failure("agent not close enough to gate");
         }
         return true;
      }
   end_precondition

   execute
      extern double mDragSpeed;
      extern double mDragAltitude;
      Drag(PLATFORM, mNearestTimeLineTarget, mDragSpeed, mDragAltitude, mGeesToTurnWith);   #max speed
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, on_new_execute, on_new_fail, precondition, execute

### behavior（behavior_timeline_delay）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, script, precondition, on_new_execute, execute
- **出处**：`base_types/processors/timeline_agents/behavior_timeline_delay.txt:14-168`　（同签名共 3 处，另见 `base_types/processors/timeline_agents/behavior_timeline_engage.txt:15`、`base_types/processors/timeline_agents/behavior_go_home.txt:11`）
- **片段**：

```text
behavior timeline_delay

   script_debug_writes off

   script_variables
      WsfQuantumTaskerProcessor processor;
   end_script_variables

   on_init
      if (PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         processor = (WsfQuantumTaskerProcessor)PROCESSOR;
      }
   end_on_init


   #returns true (to wait) if no free target can be shot at (current range)
   #if target already has weapon on it, it is ignored
   script bool WaitToTurnAndShoot(Array<WsfTrack> targets)
      #only consider free targets (a target with no weapons on it)
      #compare max weapon range to each free target
      #calculate time to turn & face for a shot
      #return false if any target can be turned on & engaged
      foreach(WsfTrack target in targets)
      {
         WsfLocalTrack masterTarget = GetMasterTrackByName(PLATFORM, target.TargetName());
         if (!masterTarget.IsValid())
         {
            continue;
         }
         bool checkPeerWeapons = false;

         if (FiredOn(PLATFORM, masterTarget, checkPeerWeapons))
         {
            #LBM TODO - figure out time until weapon terminates
            #           compare that to turn time too
            #           dont necessarily skip this target
            continue;
         }

         double weaponMaxRange = 0.0;
         WsfWeapon maxRangeWeapon;
         for (int i=0; i < PLATFORM.WeaponCount(); i+=1)
         {
            WsfWeapon weapon = PLATFORM.WeaponEntry(i);
            if (WeaponCapableAvailableAgainstThreat(weapon, masterTarget))
            {
               double weaponRange = MaxRange(PLATFORM,weapon,masterTarget);
               if (weaponRange > weaponMaxRange)
               {
                  weaponMaxRange = weaponRange;
                  maxRangeWeapon = weapon;
               }
            }
         }

         if (maxRangeWeapon.IsValid())
         {
            #valid weapon found with an intelligible max range
            double targetRange = PLATFORM.GroundRangeTo(masterTarget.CurrentLocation());
            #double weaponMaxRange;
            double rangeRemaining = targetRange - weaponMaxRange;
            if(rangeRemaining <= 0)
            {
               return false;
            }

            #targets speed towards me:
            double hisClosingSpeed = masterTarget.Speed() * MATH.Cos(masterTarget.RelativeBearingTo(PLATFORM));
            #my avg speed towards him (assuming an immediate turn towards him):
            double myMinClosingSpeed = PLATFORM.Speed() * MATH.Cos(PLATFORM.RelativeBearingTo(masterTarget));
            double myMaxClosingSpeed = PLATFORM.Speed();   #assumes I turn & face
            double myAvgClosingSpeed = (myMinClosingSpeed+myMaxClosingSpeed)/2.0;
            #closing speed to use:
            double closingSpeed = hisClosingSpeed + myAvgClosingSpeed;
            extern double mGeesToTurnWith;
            double turnTime = TimeToTurnAndFace(PLATFORM.MakeTrack(), masterTarget.CurrentLocation(), mGeesToTurnWith);
            if (turnTime >= rangeRemaining/closingSpeed)
            {
               return false;   #dont wait, time to turn & shoot this guy!!!
            }
         }
      }
      return true;
   end_script


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

   on_new_execute
      PLATFORM.Comment("delay");
   end_on_new_execute

   execute
      #TODO - select beam or posthole or whatever
      Beam(PLATFORM, mNearestTimeLineTarget);
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, script, precondition, on_new_execute, execute

### behavior（behavior_launch_alert-5_aircraft）｜

- **关键词**：behavior, script_debug_writes, script_variables, script, if, else, double, return
- **出处**：`base_types/processors/quantum_agents/aigci/behavior_launch_alert-5_aircraft.txt:118-294`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aigci/behavior_launch_alert-5_aircraft.txt:118`）
- **片段**：

```text
behavior launch_alert-5_aircraft2
   script_debug_writes off

   script_variables //public
      #string mFlightLeadToSupport	= "fighter flightjlead";
      int mSalvoCount	= 2;
      double mFlightLaunchDelay	= 120.0; # 30 sec per a/c, 2 a/c per flight
      bool mFirstLaunch	= true;
      double mFirstFlightLaunchDelay	= 420.0; #account for 5 minute delay of first launch //private
      double mLastLaunchedTime	= -9999.0;
      int mNumberOfAirThreats = 0;
      int mNumberOfSubsInAir = 0;
      bool mCheckPeers = true;
      string mProtectZoneName = "";
      double mProtectRange = 1852 * 100;  //100nm (in meters)
   end_script_variables

#   #on init #end on init
#   script bool ValidType(WsfTrack track)
#      if (track.Target().IsValid())
#      {
#         if (track.Target().Type() == "STRIKER" || track.Target().Type() == "SWEEPER" || track.Target().Type() == "CAPPER" || track.Target().IsATypeOf("E-3C"))
#         {
#            return true;
#         }
#      }
#      return false;
#   end_script

   script WsfWeapon GetNextAlert5()
      WsfWeapon empty;
      for(int i=0; i<PLATFORM.WeaponCount(); i=i+l)
      {
         WsfWeapon test = PLATFORM.WeaponEntry(i);
         if (test.QuantityRemaining() >= 1)
         {
            return test;
         }
      }
      return empty;
   end_script

   script bool AnyActiveRequests()
      for(int i=0; i<PLATFORM.WeaponCount(); i=i+l)
      {
         WsfWeapon test = PLATFORM.WeaponEntry(i);
         if (test.ActiveRequestCount() > 0)
         {
            return true;
         }
      }
      return false;
   end_script

#	script WsfRIPRProcessor GetRIPR(string platformName)
#	WsfRIPRProcessor empty;
#	WsfPlatform plat = WsfSimulation.FindPlatform(platformName);
#	if (plat.IsValid())
#	{
#	for (int i=0; i<plat.ProcessorCount(); i=i+l)
#	{
#	WsfProcessor proc = plat.ProcessorEntry(i);
#	if (proc.IsA TypeOf("WSFRIPRPROCESSOR"))
#	{
#	WsfRIPRProcessor rProc = (WsfRIPRProcessor)proc;
#	return rProc;
#	}
#	}
#	}
#	return empty;
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

execute
   writeln_d("T= ", TIME_NOW," executing launch_alert-5_aircraft");
   WsfGeoPoint pt = PLATFORM.Location();
   pt.Offset(PLATFORM.Heading(), 9260, 0.0, -9260);
   WsfTrack tgt = WsfTrack();
   tgt.SetLocation(pt);
   WsfWeapon alert5Weapon = GetNextAlert5();
   if (alert5Weapon.FireSalvo(tgt, mSalvoCount))
   {
      if (mLastLaunchedTime > 0)
      {
         mFirstLaunch = false;
      }
      mLastLaunchedTime = TIME_NOW;
      PLATFORM.Comment("Launch Alert 5");
   }
end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, script, if, else, double, return

### behavior（behavior_weapon_support）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, precondition, on_new_execute, execute
- **出处**：`base_types/processors/timeline_agents/behavior_weapon_support.txt:13-91`　（同签名共 5 处，另见 `brawler/processors/quantum_agents/behavior_pursue-target_route_finder.txt:10`、`heatmap/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:11`、`route_finder_demos/processors/quantum_agents/aiai/behavior_pursue-target_route_finder.txt:11`）
- **片段**：

```text
behavior weapon_support

   script_debug_writes off

   script_variables
      WsfQuantumTaskerProcessor processor;

      Array<WsfLocalTrack> mEngaged  = Array<WsfLocalTrack>();
      Array<double>        mBearings = Array<double>();
   end_script_variables

   on_init
      if (PROCESSOR.IsA_TypeOf("WSF_QUANTUM_TASKER_PROCESSOR"))
      {
         processor = (WsfQuantumTaskerProcessor)PROCESSOR;
      }
   end_on_init

   precondition
      writeln_d(PLATFORM.Name(), " precondition  weapon_support,  T=", TIME_NOW);
      if (!processor.IsValid())
      {
         return Failure("behavior not attached to a WSF_QUANTUM_TASKER_PROCESSOR");
      }

      extern bool mRequiredToSupportWeapons;
      if (mRequiredToSupportWeapons == false)
      {
         return Failure("not required to support weapons!");
      }

      WsfTask timeline = GetTimeLineTask(processor);
      if (!timeline.IsValid())
      {
         return Failure("not assigned a TIMELINE task");
      }

      extern Array<WsfLocalTrack> mTimeLineLocalTargets;
      mEngaged.Clear();
      mBearings.Clear();
      foreach(WsfLocalTrack t in mTimeLineLocalTargets)
      {
         if (PLATFORM.WeaponsActiveFor(t.TrackId()) > 0)
         {
            mEngaged.PushBack(t);
            mBearings.PushBack(PLATFORM.RelativeBearingTo(t.CurrentLocation()));
         }
      }
      if (mEngaged.Size() <= 0)
      {
         return Failure("no weapons to support against timeline targets");
      }
      return true;
   end_precondition

   on_new_execute
      PLATFORM.Comment("crank");
   end_on_new_execute

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

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, precondition, on_new_execute, execute

### behavior（behavior_disengage）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, script, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_disengage.txt:12-176`　（同签名共 10 处，另见 `base_types/processors/ripr_agents/aiai/behavior_disengage.txt:12`、`base_types/processors/quantum_agents/aigci/behavior_create_clustering_jobs.txt:12`、`base_types/processors/ripr_agents/aigci/behavior_create_clustering_jobs.txt:12`）
- **片段**：

```text
behavior disengage

   script_debug_writes off

   script_variables
      double   cDIVE_ALTITUDE          =        304.8;            # 1000 feet
      double   cDEFAULT_SPEED          =        200.0;            # m/s
      double   cMAX_SPEED              = 9999999999.99;           # m/s
      double   cGRAVITY_ACCEL          =          9.80665;        # 1 G
      double   cDEFAULT_ACCEL          = (cGRAVITY_ACCEL * 7.5);  # m/s^2  ~7.5 Gs
      double   cANGLE_TOLERANCE          =         45.0;            # degrees
      bool     drawEscape = false;
      WsfDraw draw = WsfDraw();
   end_script_variables


   on_init
      draw.SetLineSize(2);
      draw.SetColor(1.0, 0.0, 1.0); //purple
   end_on_init


   script bool IsFlightAsset(WsfPlatform aPlat)
      if (aPlat.Mover().IsA_TypeOf("WSF_AIR_MOVER" ) ||
          aPlat.Mover().IsA_TypeOf("WSF_6DOF_MOVER")    )
      {
         return true;
      }
      else if (aPlat.MakeTrack().AirDomain())
      {
         return true;
      }
      else if((aPlat.Altitude() > 152.4) && (aPlat.Speed() > 51.44) ) // ~500 feet alt, ~100 knots speed
      {
         return true;
      }
      return false;
   end_script


   script bool IsWeapon(WsfTrack aTrack)
      if (aTrack.Target().IsValid() && aTrack.Target().WeaponEngagement().IsValid())
      {
         return true;
      }
      return false;
   end_script


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

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, script, precondition, execute

### behavior（behavior_interpret_zone_jobs）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, query_bid_type, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:17-198`　（同签名共 4 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:17`、`base_types/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:12`、`behavior_tree/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:12`）
- **片段**：

```text
behavior  interpret_zone_jobs

   script_debug_writes  off


   script_variables
      bool   fastAndDirtyBidding   = false;
      int maxJobWinnersForPursueTrack  = 1;
      Map<string, string> ThreatTypeEngageZone = Map<string, string>();
      WsfRIPRJob mCurrentJob;
   end_script_variables


   on_init
      //nothing here yet
   end_on_init



   query_bid_type    zone

       if (PLATFORM.Subordinates().Count() <= 0 || PROCESSOR.GetRIPRSubordinateProcessors().Size() <= 0)
       {
         writeln_d("behavior interpret_zone_jobs: not enough subordinates");
         return -MATH.DOUBLE_MAX();
       }

      ########################################################################
      ##  bid on the cluster is based on subordinate bids on their members
      ########################################################################
      WsfRIPRJob tempJob = WsfRIPRJob.Create(PROCESSOR,"pursue-target","job description",1.0,1);
      Array<string> targetNames = (Array<string>)JOB.GetData("ZoneThreatNameArray");
      writeln_d("job ", JOB.GetDescription(),  " -> number of target names considering: ", targetNames.Size());
      double maxBid = -MATH.DOUBLE_MAX();

      foreach(string targetName in targetNames)
      {
          bool inZone   = true;
          WsfPlatform target = WsfSimulation.FindPlatform(targetName);
          if (target.IsValid())
          {
            extern string DeterminePlatformCategory(WsfPlatform);
            string category = DeterminePlatformCategory(target);
            if (ThreatTypeEngageZone.Exists(category) && ThreatTypeEngageZone[category].Length()>0)
            {
              if ( ! target.Location().WithinZone(ThreatTypeEngageZone[category]))
              {
                inZone   = false;
                writeln_d("aifl ", PLATFORM.Name(),", target ", targetName, " outside of category ", category," zone ", ThreatTypeEngageZone[category], ".  bid = -DOUBLE_MAX.");
              }
              else
              {
                writeln_d("aifl ", PLATFORM.Name(),", target ", targetName, " inside category ", category," zone ", ThreatTypeEngageZone[category], ".  bid as usual!!!");
              }
            }
            foreach ( string aZone in PLATFORM.ZoneNames())
            {
              if ( !target.WithinZoneOf(PLATFORM, aZone) )
              {
                inZone   = false;
                writeln_d("ai flight lead, target ", targetName, " outside of defined zone ", aZone, " curBid from subordinate set to -DOUBLE_MAX.");
              }
              else
              {
                writeln_d("ai flight lead, target ", targetName, " inside of defined zone ", aZone, " curBid unchanged.");
              }
            }
         }
         if (inZone == true)
         {
         tempJob.SetData("targetTrackName", targetName);
         if (fastAndDirtyBidding)
         {
            maxBid = PROCESSOR.GetRIPRSubordinateProcessors().Get(0).QueryBid(tempJob);
            writeln_d("ai flight lead, fast dirty bid on ", JOB.Description()," = ", maxBid);
            break;
         }
         else
         {
            //by default this expands through job-pass-through agents to get all bids
            double curBid = PROCESSOR.QuerySubordinatesMaxBid(tempJob);

            writeln_d("ai flight lead, max bid on ", targetName," from subordinates: ", curBid);
            if (curBid > maxBid)
            {
               maxBid = curBid;
            }
            }
         }
         else
         {
            maxBid = -MATH.DOUBLE_MAX();
         }
      }
      return maxBid;

   end_query_bid_type



   precondition
      writeln_d("precondition interpret_zone_jobs");

      if (PROCESSOR.GetRIPRCommanderProcessor().IsValid())
      {
         return true;
      }
      else
      {
         return Failure("Agent does not have a commander to get jobs from!");
      }
   end_precondition



   execute
      writeln_d(PLATFORM.Name(), " executing interpret_zone_jobs, T=", TIME_NOW);

      // now check the board to see what we've won!
      Map<string, int> updatedTracks = Map<string, int>();
      WsfRIPRProcessor commander = PROCESSOR.GetRIPRCommanderProcessor();

      if (commander.IsJobWindowOpen())
      {
         //we can get a new job for ourselves here
         mCurrentJob = commander.GetJobFor(TIME_NOW, PROCESSOR);
      }
      else if (commander.IsBidWindowOpen())
      {
         //we dont update our own job board until here
         if( mCurrentJob.IsValid() && mCurrentJob.Name() == "zone" )
         {
            Array<string> targetNames = (Array<string>)mCurrentJob.GetData("ZoneThreatNameArray");
            writeln_d(PLATFORM.Name(), " targetNames.Size() = ", targetNames.Size());
            foreach(string targetName in targetNames)
            {
               WsfPlatform target = WsfSimulation.FindPlatform(targetName);
               if (target.IsValid())
               {
                  updatedTracks.Set( targetName, 1 );

                  WsfRIPRJob job = PROCESSOR.GetJobByData("targetTrackName", targetName);
                  if (job.IsValid())
                  {
                     //just update it, it already exists

                  }
                  else
                  {
                     extern double cPursueTargetPriority;
                     WsfRIPRJob temp = WsfRIPRJob.Create(PROCESSOR,
                                                         "pursue-target",
                                                         "pursue-target-" + targetName,
                                                         cPursueTargetPriority,
                                                         maxJobWinnersForPursueTrack);
                     temp.SetData("targetTrackName", targetName);
                     PROCESSOR.AddJob(temp);
                     writeln_d("--- ", PLATFORM.Name(), " job change, ADD: ", targetName);
                  }
               }
            }
         }
         else
         {
            writeln_d("---  currentJob not a valid zone job!!!!!  Removing all my aifl jobs.");
         }

         Array<WsfRIPRJob> jobs = PROCESSOR.GetJobs();
         foreach (WsfRIPRJob x in jobs)
         {
            string name = (string)x.GetData("targetTrackName");
            if (updatedTracks.Get(name) != 1 && x.Name() == "pursue-target")
            {
               writeln_d("--- ", PLATFORM.Name(), " job change, REMOVE: ", name);
               PROCESSOR.RemoveJob(x);
            }
         }
      }

   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, query_bid_type, precondition, execute

### behavior（behavior_radar-control_new）｜

- **关键词**：behavior, script_debug_writes, script_variables, script, query_bid_type, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:13-212`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_radar-control_new.txt:13`）
- **片段**：

```text
behavior radar-control

   script_debug_writes off

   script_variables
      bool                   mTurnOnFiringRadarInRange  = false;
      string                 mFiringRadarName           = "radar";   // replace with sensor name on platform
      double                 mFiringRadarRange          = 1852 * 50; // 50 nautical miles (units: meters)
      bool                   mTurnOnFiringRadarIfRWR    = true;
      double                 cWEIGHT_SLANT_RANGE_TO     =     -3.0;
      double                 cBASE_SLANT_RANGE_CONSTANT = 600000.0;  //over 300 nm away
      double                 cWEIGHT_SEPERATION_ANGLE   =     20.0;
      double                 cWEIGHT_RADARS_ON          =     50.0;
      double                 cMIN_JOB_BID               = -MATH.DOUBLE_MAX();
      int                    mRadarJobId                = -1;
   end_script_variables


   script bool AmEmittingAnything()
      for (int i=0; i<PLATFORM.SensorCount(); i=i+1)
      {
         WsfSensor s = PLATFORM.SensorEntry(i);
         if (s.IsTurnedOn() && s.IsA_TypeOf("WSF_RADAR_SENSOR"))
         {
            return true;
         }
      }
   end_script


   query_bid_type    radar-control

      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }
      Array<string> targetNames = (Array<string>)JOB.GetData("RadarTargetsArray");
      WsfGeoPoint point         =   (WsfGeoPoint)JOB.GetData("RadarPointOfInterest");
      string mode               =        (string)JOB.GetData("RadarMode");
      string strategy           =        (string)JOB.GetData("RadarStrategy");

      bool emitting = AmEmittingAnything();
      if (mode=="silent" && emitting==true)
      {
         return cMIN_JOB_BID;
      }

      double weightSlantRange = cWEIGHT_SLANT_RANGE_TO;
      if (strategy=="distributed" && mode=="support")
      {
         weightSlantRange = MATH.Fabs(weightSlantRange);
      }

      double current_bid = 10000.0;
      extern int GetBucket(double, double);
      extern double cBUCKET_BASE;
      current_bid = current_bid + MATH.Fabs(cWEIGHT_SLANT_RANGE_TO) * GetBucket(cBASE_SLANT_RANGE_CONSTANT, cBUCKET_BASE);
      current_bid = current_bid + weightSlantRange * GetBucket(PLATFORM.SlantRangeTo(point), cBUCKET_BASE);

      WsfRIPRJob otherJob;
      Set<int> deps = JOB.DependenciesForJob();
      if (deps.Size()>0)
      {
         int dep = (int)deps.GetIterator().Data();   //just grab first one
         WsfRIPRJob otherJob = PROCESSOR.GetJobById(dep);
      }

      if (mode=="support" && emitting==true)
      {
         current_bid = current_bid + cWEIGHT_RADARS_ON;
      }

      if (strategy=="passive" && otherJob.IsValid() && otherJob.Name()=="radar-control")
      {
         Array<WsfPlatform> others = otherJob.Winners();
         double angle1 = point.TrueBearingTo(PLATFORM.Location());
         double maxAngle = 0;
         foreach(WsfPlatform other in others)
         {
            double seperation = MATH.NormalizeAngleMinus180_180(angle1 - point.TrueBearingTo(other.Location()));
            maxAngle = MATH.Max(maxAngle, MATH.Fabs(seperation));
         }
         current_bid = current_bid + cWEIGHT_SEPERATION_ANGLE * GetBucket(maxAngle, cBUCKET_BASE);
      }
      return current_bid;
   end_query_bid_type


   precondition
      writeln_d("precondition radar-control");

      WsfRIPRJob currentJob = null;
      WsfRIPRProcessor commander = PROCESSOR.GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         Array<int> channels = PROCESSOR.JobTypeChannels("radar-control");
         if (channels.Size()>0)
         {
            foreach(int c in channels)
            {
               currentJob = commander.GetJobFor(TIME_NOW, PROCESSOR, c);
               if (!currentJob.IsNull() && currentJob.IsValid() && currentJob.Name() == "radar-control")
               {
                  mRadarJobId = currentJob.Id();
                  return true;
               }
            }
         }
         else
         {
            currentJob = PROCESSOR.GetRIPRCommanderProcessor().GetJobFor(TIME_NOW, PROCESSOR);
            if (!currentJob.IsNull() && currentJob.IsValid() && currentJob.Name() == "radar-control")
            {
               mRadarJobId = currentJob.Id();
               return true;
            }
         }
      }
      mRadarJobId = -1;

      WsfTrack curTarget = PROCESSOR.GetTarget();
      if ((mTurnOnFiringRadarInRange && !curTarget.IsNull() && curTarget.IsValid()) || mTurnOnFiringRadarIfRWR)
      {
         return true;
      }

      return Failure("no radar-control job and no radar plan set!");
   end_precondition




   script bool RWR_ShowsBeingTracked()
      for (int i=0; i < PLATFORM.SensorCount(); i=i+1)
      {
         WsfSensor sensor = PLATFORM.SensorEntry(i);
         if (sensor.IsA_TypeOf("WSF_ESM_SENSOR"))
         {
            foreach (WsfLocalTrack t in PLATFORM.MasterTrackList())
            {
               if (t.ContributorOf(PLATFORM, sensor))
               {
                  return true;
               }
            }
         }
      }
      return false;
   end_script


   execute
      writeln_d("executing radar-control.");

      WsfTrack curTarget = PROCESSOR.GetTarget();

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
         turnOnFiringRadar = RWR_ShowsBeingTracked();
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
               writeln_d(PLATFORM.Name(), " turned on active radar ", mFiringRadarName);
            }
            else
            {
               writeln_d("radar already turned on");
            }
         }
      }

   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, script, query_bid_type, precondition, execute

### behavior（behavior_create_cap-routes）｜

- **关键词**：behavior, script_debug_writes, script_variables, on_init, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aifl/behavior_create_cap-routes.txt:12-58`　（同签名共 70 处，另见 `behavior_tree/processors/quantum_agents/aifl/behavior_create_cap-routes.txt:12`、`base_types/processors/ripr_agents/aifl/behavior_create_cap-routes.txt:12`、`base_types/processors/ripr_agents/aifl/behavior_toggle_windows.txt:12`）
- **片段**：

```text
behavior  create_cap-routes

   script_debug_writes off

   script_variables
      Array<Map<string, Object>> mCapRoutes = Array<Map<string, Object>>();
          #mCapRoutes[0] = Map<string, Object>();
          #mCapRoutes[0].Set("route name", "GOALIE_CAP_CCW_ORBIT");
          #mCapRoutes[0].Set("location", WsfGeoPoint.Construct(12.60313, 117.37702, 40000));
          #mCapRoutes[0].Set("heading", 140.0);
          #mCapRoutes[0].Set("priority", 1000.0);
          #mCapRoutes[0].Set("max winners", 1);
          #mCapRoutes[0].Set("fez_zone", "lane_2");
   end_script_variables

   on_init
      foreach( Map<string, Object> map in mCapRoutes)
      {
        //create a "cap-route" job
        string      routeName  = (string)     map["route name"];
        WsfGeoPoint location   = (WsfGeoPoint)map["location"];
        double      heading    = (double)     map["heading"];
        double      priority   = (double)     map["priority"];
        int         maxWinners = (int)        map["max winners"];
        string      zoneName   = (string)     map["fez_zone"];
        string unique_desc = write_str("cap-route_", routeName, "_", location.Latitude(), "_", location.Longitude());
        writeln_d("CREATING CAP ROUTE JOB: ", unique_desc);
        WsfRIPRJob temp = WsfRIPRJob.Create( PROCESSOR, "cap-route", unique_desc, priority, maxWinners );
        temp.SetData( "location",   location );
        temp.SetData( "heading",    heading );
        temp.SetData( "route name", routeName );
        temp.SetData( "for_air",    1 );
        temp.SetData( "fez_zone",   zoneName);
        PROCESSOR.AddJob(temp);
      }
   end_on_init

   precondition
      writeln_d("precondition create_cap-routes");
      return false;
   end_precondition

   execute
      writeln_d("executing create_cap-routes");
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, on_init, precondition, execute

### behavior（behavior_within_visual_range）｜

- **关键词**：behavior, script_debug_writes, script_variables, precondition, execute, selector
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_within_visual_range.txt:22-77`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_within_visual_range.txt:22`）
- **片段**：

```text
behavior within_visual_range

   script_debug_writes off

   script_variables
      double   mVisualRange              =  37040.0;  //meters = 20 nm
                                                      // used by behavior_in_danger, behavior_snap_shot & behavior_disengage
   end_script_variables


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


   execute
      writeln("executing within_visual_range.");
      PLATFORM.Comment("within_visual_range");
   end_execute


   //any child nodes get run after "execute" if the precondition is satisfied

   selector    #for within visual range

      behavior disengage           end_behavior  #executes if the current force ratio compares poorly against the agent's aggressiveness

      behavior in_danger           end_behavior  #executes if a threat has positional advantage, *** includes unload & force_overshoot ***

      behavior low_speed_recovery  end_behavior  #executes if the platform is traveling below its desired min speed

      behavior avoid_overshoot     end_behavior  #executes if the platform is inside the targets turning circle

      behavior snap_shot           end_behavior  #executes if no other threats around & if speed & angle are advantageous

      behavior roll_over_top       end_behavior  #executes if the agent needs to climb & bleed off speed to make a tighter turn towards it's target

   end_selector

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, precondition, execute, selector

### behavior（behavior_default-flight）｜

- **关键词**：behavior, script_debug_writes, script_variables, script, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_default-flight.txt:12-94`　（同签名共 20 处，另见 `base_types/processors/ripr_agents/aiai/behavior_default-flight.txt:12`、`base_types/processors/quantum_agents/aiai/behavior_pursue_altitude.txt:11`、`base_types/processors/ripr_agents/aiai/behavior_pursue_altitude.txt:11`）
- **片段**：

```text
behavior default-flight

   script_debug_writes off

   script_variables
      bool     mDrawRoute              = false;
      WsfDraw  mDraw                   = WsfDraw();
      bool     mResumeDefaultRoute     =  true;
      double   cDEFAULT_SPEED          = 450.0 * MATH.MPS_PER_NMPH();
      double   cDEFAULT_ACCEL          =   7.5 * Earth.ACCEL_OF_GRAVITY(); // 7.5 G  (m/s^2)
      double   cLARGE_UPDATE_INTERVAL  =   3.0;                            // update once every 3 seconds
   end_script_variables

   script void DrawRoute()
      WsfRoute currRoute = PLATFORM.Route();
      if (currRoute.IsValid())
      {
         //PLATFORM.Comment("draw current route");
         mDraw.SetLayer("behavior default=flight");
         mDraw.Erase(PLATFORM.Name());
         mDraw.SetId(PLATFORM.Name());
         mDraw.SetColor(0,1,1);
         mDraw.SetLineSize(2);
         mDraw.SetLineStyle("dash_dot2");
         mDraw.BeginPolyline();
         for (int i=0; i<currRoute.Size(); i=i+1)
         {
            mDraw.Vertex(currRoute.Waypoint(i).Location());
         }
         mDraw.End();
      }
   end_script


   precondition
      writeln_d("precondition default-flight");
      return true;
   end_precondition


   execute
      writeln_d(PLATFORM.Name(), " executing default-flight, T=", TIME_NOW);
      //PLATFORM.Comment("default-flight");

      if (mResumeDefaultRoute)
      {
         bool success = false;
         //go at default speed; this gets overwritten if route waypoint has defined a speed
         success = PLATFORM.GoToSpeed(cDEFAULT_SPEED, cDEFAULT_ACCEL, true);
         //return to route, at the last target route point as re-entry
         #success = success && PLATFORM.ReturnToRoute();
         extern bool ReEnterRoute(WsfPlatform);
         success = success && ReEnterRoute(PLATFORM);

         if (!success)
         {
            string msg = "ERROR: transition to default flight, could not return to route!";
            PLATFORM.Comment(msg);
            writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
         }
         else
         {
            string msg = write_str("returning to route: ", PLATFORM.Route().Name());
            //PLATFORM.Comment(msg);
            writeln_d("    T=", TIME_NOW, " ", PLATFORM.Name(), " ", msg);
         }
      }
      else
      {
         extern double cDEFAULT_ALTITUDE;
         extern bool FlyHold (WsfPlatform, double, double, double);
         FlyHold( PLATFORM, PLATFORM.Heading(), cDEFAULT_ALTITUDE, cDEFAULT_SPEED);
      }

     #PROCESSOR.SetUpdateInterval(cLARGE_UPDATE_INTERVAL);

      if (mDrawRoute)
      {
         DrawRoute();
      }
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, script, precondition, execute

### behavior（behavior_planned_route）｜

- **关键词**：behavior, script_debug_writes, script_variables, precondition, on_new_execute, execute
- **出处**：`base_types/processors/timeline_agents/behavior_planned_route.txt:39-124`
- **片段**：

```text
behavior planned_route

   script_debug_writes off

   script_variables
      bool     mDrawRoute              = false;
      WsfDraw  mDraw                   = WsfDraw();
      double   cDEFAULT_SPEED          = 450.0 * MATH.MPS_PER_NMPH();
      double   cDEFAULT_ACCEL          =   7.5 * Earth.ACCEL_OF_GRAVITY(); // 7.5 G  (m/s^2)
   end_script_variables

   precondition
      writeln_d("precondition planned_route");
      return true;
   end_precondition

   on_new_execute
      PLATFORM.Comment("route");
   end_on_new_execute

   execute
      writeln_d(PLATFORM.Name(), " executing planned_route, T=", TIME_NOW);
      #only command the platform to do something different if its not currently flying a route
      WsfMover aMover = PLATFORM.Mover();
      if (aMover.IsValid()) {
         if (aMover.IsExtrapolating()) {
            WsfGeoPoint pt = PLATFORM.Location();
            WsfRoute ro = aMover.DefaultRoute().Copy(); #now we have a modifiable route
            if (!ro.IsValid())
               return;

            writeln_d("flying route, name: ", ro.Name(), ", type: ", ro.Type());
            WsfGeoPoint close = ro.LocationAtDistance(ro.DistanceAlongRoute(pt));
            if (!close.IsValid()) {
               return;
            }
            close.SetAltitudeAGL(pt.Altitude());
            if (mDrawRoute)
            {
               mDraw.BeginLines();
                  mDraw.Vertex(pt);
                  mDraw.Vertex(close);
               mDraw.End();
            }
            double d1 = ro.DistanceFromRoute(pt);
            double d2 = pt.GroundRangeTo(close);
            double d3 = -1;
            Array<double> turnRad = aMover.PropertyDouble("turn_radius");
            if (turnRad.Size() > 0) {
               d3 = 2*turnRad[0];
            }
            int i = 0;
            for (; i < ro.Size(); i = i+1)
            {
               WsfWaypoint wpt = ro.Waypoint(i);
               WsfGeoPoint rpt = wpt.Location();
               //check if we are close to an existing waypoint, if so... break & fly at that one
               if (rpt.GroundRangeTo(close) < 926) {
                  break;
               }
               double dist = ro.DistanceAlongRoute(rpt);
               if (dist > d1) {
                  if (d2 > d3) {
                     ro.Insert(i, WsfWaypoint.Create(close, wpt.Speed()));
                  }
                  break;
               }
            }
            if (i >= ro.Size()) {
               i = ro.Size() - 1;
            }
            //go at default speed; this gets overwritten if route waypoint has defined a speed
            PLATFORM.GoToSpeed(cDEFAULT_SPEED, cDEFAULT_ACCEL, true);
            PLATFORM.FollowRoute(ro, i);
         }
      }

      if (mDrawRoute)
      {
         mDraw.SetDuration(PROCESSOR.UpdateInterval());
         mDraw.SetLayer("behavior_planned_route");
         DrawRoute(mDraw, PLATFORM.Route());
      }
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, precondition, on_new_execute, execute

### behavior（behavior_in_danger）｜

- **关键词**：behavior, script_variables, script, precondition, execute, selector
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_in_danger.txt:20-126`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_in_danger.txt:20`）
- **片段**：

```text
behavior in_danger

   script_variables
      double    cANGLE_TOLERANCE =  45.0; # degrees
      WsfTrack  mBiggestThreat;
   end_script_variables


   script bool NotWeapon(WsfTrack aTrack)
      if (aTrack.Target().IsValid() && aTrack.Target().WeaponEngagement().IsValid())
      {
         return false;  //it is a weapon
      }
      return true;
   end_script


   script bool IsFlyer(WsfPlatform aPlat)
      if (!aPlat.IsValid())
      {
         return false;
      }
      if (aPlat.Mover().IsA_TypeOf("WSF_AIR_MOVER" ) ||
          aPlat.Mover().IsA_TypeOf("WSF_6DOF_MOVER")    )
      {
         return true;
      }
      else if (aPlat.MakeTrack().AirDomain())
      {
         return true;
      }
      else if((aPlat.Altitude() > 152.4) && (aPlat.Speed() > 51.44) ) // ~500 feet alt, ~100 knots speed
      {
         return true;
      }
      return false;
   end_script


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


   execute
      writeln("executing in_danger");
      PLATFORM.Comment("in_danger");
   end_execute


   selector
      behavior    unload            end_behavior
      behavior    force_overshoot   end_behavior
   end_selector


end_behavior
```

- **演示要点**：演示 behavior 的参数：script_variables, script, precondition, execute, selector

### behavior（behavior_pursue-target_pathing）｜

- **关键词**：behavior, script_variables, precondition, on_init, script, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue-target_pathing.txt:18-290`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue-target_pathing.txt:18`）
- **片段**：

```text
behavior pursue-target_pathing

   script_variables

      double                 cBUCKET_BASE              = 1.2;
      double                 cINTERCEPT_SPEED          = 1000;    # m/s
      double                 cWAIT_SPEED               = 200;     # m/s

      double ownshipEngagementRangeMin = 0; // set later GetWeaponRangeMin(PLATFORM, mWeaponArray);
      double ownshipEngagementRangeMax = 0; // set later GetWeaponRangeMax(PLATFORM, mWeaponArray);

     #bool                   mUseMoverDuringPursuit = true;     #set to false to force aiai to follow route during pursuit of target

      //use this offset angle if a category specific offset isn't found
      double                 mFPoleAngle = 45.0; // this should be radar-specific
      //fly different offset angles, depending on the type or category of threat
      Map<string, double> ThreatTypeOffsetAngle = Map<string, double>();
      ThreatTypeOffsetAngle["unknown"]          =  45.0;
      ThreatTypeOffsetAngle["sam"]              =  50.0;
      ThreatTypeOffsetAngle["awacs"]            =  15.0;
      ThreatTypeOffsetAngle["fighter"]          =  35.0;

   end_script_variables


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



   on_init
      extern double GetWeaponRangeMax (WsfPlatform, Array<Map<string, Object>>);
      extern double GetWeaponRangeMin (WsfPlatform, Array<Map<string, Object>>);
      extern Array<Map<string, Object>> mWeaponArray;
      ownshipEngagementRangeMin = GetWeaponRangeMin(PLATFORM, mWeaponArray);
      ownshipEngagementRangeMax = GetWeaponRangeMax(PLATFORM, mWeaponArray);
   end_on_init


    script double GetOffsetAngleOnThreat(WsfTrack threat)
        WsfPlatform plat = WsfSimulation.FindPlatform( threat.TargetName() );
        if (plat.IsValid())
        {
            foreach( string aCategory : double angle in ThreatTypeOffsetAngle )
            {
                if( plat.CategoryMemberOf( aCategory ) )
                {
                    writeln_d("offset angle for type ", aCategory, " = ", angle);
                    return angle;
                }
            }
        }
        return mFPoleAngle;
    end_script


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

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_variables, precondition, on_init, script, execute

### behavior（behavior_manage-fuel）｜

- **关键词**：behavior, script_debug_writes, script_variables, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_manage-fuel.txt:12-30`　（同签名共 23 处，另见 `base_types/processors/quantum_agents/aiai/behavior_manage-signature.txt:12`、`base_types/processors/ripr_agents/aiai/behavior_manage-fuel.txt:12`、`base_types/processors/ripr_agents/aiai/behavior_manage-signature.txt:12`）
- **片段**：

```text
behavior manage-fuel

   script_debug_writes off

   script_variables
   end_script_variables


   precondition
      writeln_d("precondition manage-fuel");
      return false;
   end_precondition


   execute
      writeln_d("executing manage-fuel");
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, script_variables, precondition, execute

### behavior（behavior_draw_target）｜

- **关键词**：behavior, script_variables, on_init, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_draw_target.txt:12-47`　（同签名共 10 处，另见 `base_types/processors/ripr_agents/aiai/behavior_draw_target.txt:12`、`base_types/processors/ripr_agents/aiai/behavior_draw_master_track_list.txt:12`、`base_types/processors/quantum_agents/aiai/behavior_draw_master_track_list.txt:12`）
- **片段**：

```text
behavior draw_target

   script_variables
      WsfDraw draw = WsfDraw();
   end_script_variables


   on_init
      draw.SetLineSize(2);
      draw.SetColor(1.0, 0.0, 1.0); //purple
   end_on_init


   precondition
      writeln("precondition draw_target");
      WsfTrack targetTrack = PROCESSOR.GetTarget();
      if (targetTrack.IsNull() || !targetTrack.IsValid())
      {
         writeln_d("target not valid for executing draw_target");
         return false;
      }
      draw.SetDuration(PROCESSOR.UpdateInterval());
      return true;
   end_precondition


   execute
      writeln("executing draw_target");
      WsfTrack targetTrack = PROCESSOR.GetTarget();
      draw.BeginLines();
         draw.Vertex(PLATFORM.Location());
         draw.Vertex(targetTrack.CurrentLocation());
      draw.End();
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_variables, on_init, precondition, execute

### behavior（behavior_force_overshoot）｜

- **关键词**：behavior, script_variables, script, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_force_overshoot.txt:13-64`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aiai/behavior_force_overshoot.txt:13`、`base_types/processors/quantum_agents/aiai/behavior_unload.txt:15`、`base_types/processors/ripr_agents/aiai/behavior_unload.txt:15`）
- **片段**：

```text
behavior force_overshoot

   script_variables
      double   cGRAVITY_ACCEL          =          9.80665;        # 1 G
      double   cDEFAULT_ACCEL          = (cGRAVITY_ACCEL * 7.5);  # m/s^2  ~7.5 Gs
      double   cMAX_RADIAL_ACCEL       = 100 * cGRAVITY_ACCEL;    # larger than possible, make the aircraft limit the turn
      double   cMAX_SPEED              = 9999999999.99;           # m/s

      double   mLastProcTime           = -1.0;
   end_script_variables


   script bool RanLastTick()
      if ((TIME_NOW-mLastProcTime) < 1.5*PROCESSOR.UpdateInterval())
      {
         return true;
      }
      else return false;
   end_script


   precondition
      writeln("precondition force_overshoot");

      //turn hard into threat
      extern WsfTrack mBiggestThreat;
      if (mBiggestThreat.IsValid())
      {
         mLastProcTime = TIME_NOW;
         return true;
      }
      mLastProcTime = -1.0;
      return false;
   end_precondition


   execute
      writeln("executing force_overshoot");
      PLATFORM.Comment("force_overshoot");

      //turn into the attacker as hard as possible
      extern WsfTrack mBiggestThreat;

      //any out of plan manuevers?   climb/dive ?
      //   no: match threat

      extern bool FlyTarget (WsfPlatform, WsfGeoPoint,    double);
      FlyTarget( PLATFORM, mBiggestThreat.CurrentLocation(), cMAX_SPEED);

   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_variables, script, precondition, execute

### behavior（behavior_alt1516_bvr_end_run_left）｜

- **关键词**：behavior, script_variables, precondition, execute
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt1516_bvr_end_run_left.txt:11-26`　（同签名共 16 处，另见 `brawler/platforms/alternatives/behavior_alt1516_bvr_end_run_left.txt:10`、`base_types/processors/quantum_agents/aiai/behavior_low_speed_recovery.txt:13`、`base_types/processors/ripr_agents/aiai/behavior_low_speed_recovery.txt:13`）
- **片段**：

```text
behavior alt1516_bvr_end_run_left

   script_variables
   end_script_variables

   precondition
      return 1.0;
   end_precondition

   execute
      extern int kturn;
      kturn = -1;   //go left around target
      writeln_d("executed alt1516_bvr_end_run_left");
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_variables, precondition, execute

### behavior（behavior_pursue_fly_simple）｜

- **关键词**：behavior, script_debug_writes, precondition, execute
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_fly_simple.txt:16-44`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_fly_simple.txt:16`）
- **片段**：

```text
behavior pursue_fly_simple

   script_debug_writes off

   #script_variables
   #end_script_variables

   precondition
      writeln_d(PLATFORM.Name(), " precondition pursue_fly_simple, T=", TIME_NOW);
      return true;
   end_precondition

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

end_behavior
```

- **演示要点**：演示 behavior 的参数：script_debug_writes, precondition, execute

### behavior（behavior_alt1514_point）｜

- **关键词**：behavior, precondition, execute
- **出处**：`base_types/platforms/brawler/alternatives/behavior_alt1514_point.txt:12-23`　（同签名共 7 处，另见 `base_types/platforms/brawler/alternatives/behavior_alt1517_bvr_end_run_right.txt:11`、`brawler/platforms/alternatives/behavior_alt1514_point.txt:11`、`brawler/platforms/alternatives/behavior_alt1517_bvr_end_run_right.txt:10`）
- **片段**：

```text
behavior alt1514_point

   precondition
      return 1.0;
   end_precondition

   execute
      extern int kturn;
      kturn = 0;   //go straight at target
   end_execute

end_behavior
```

- **演示要点**：演示 behavior 的参数：precondition, execute

### behavior_tree（brawler_platform）｜

- **关键词**：behavior_tree, parallel, priority_selector, selector
- **出处**：`brawler/platforms/brawler_platform.txt:110-169`
- **片段**：

```text
      behavior_tree
         parallel

          #behavior_node debug_data

#         #FLIGHT TACTIC DECISION
#         priority_selector
#            behavior_node  alt1516_bvr_end_run_left
#            behavior_node  alt1517_bvr_end_run_right
#            behavior_node  alt1514_point
#         end_priority_selector

#         #FLIGHT POSTURE DECISION
#         selector
#            #behavior_node  altWXYZ_blah_blah
#         end_selector

#         #PILOT POSTURE DECISION
#         selector
#            behavior_node  pilot_posture
#         end_selector

         #PILOT MANEUVERING DECISION
         priority_selector
            #when debug: prints precondition score of each selector child behavior
            #debug
            behavior_node  alt3111_straight_level_max_speed
            behavior_node  alt3121_straight_level
            behavior_node  alt3411_straight_flight
            behavior_node  alt3421_roll_15_pull
            behavior_node  alt3431_roll-15_pull
            behavior_node  alt3441_tail_attack
            behavior_node  alt3451_pull_gmax_sust
            behavior_node  alt3471_slow_current_dir
            behavior_node  alt3472_slow_pull_right
            behavior_node  alt3473_slow_pull_left
            behavior_node  alt3474_slow_pull_current_plane
            behavior_node  alt3511_break_right
            behavior_node  alt3531_break_left
            behavior_node  alt3551_run_away
            behavior_node  alt3561_force_overshoot
            behavior_node  alt3581_negative_velocity
            #behavior_node  alt3611_fly_vector
            behavior_node  alt3841_aim_missile_typ4
           #behavior_node  alt3211_route_maneuver
            behavior_node  alt3911_evade_missile
           #behavior_node  alt3A11_low_speed_recover
           #behavior_node  alt3A21_low_speed_recover_right45
           #behavior_node  alt3A31_low_speed_recover_left45
           #behavior_node  alt3B11_illuminate
            behavior_node  alt3G11_barrel_roll
         end_priority_selector

         #WEAPON EMPLOYMENT DECISION
         selector
           behavior_node weapon_decision_gun
           behavior_node weapon_decision_missile
         end_selector
         end_parallel
      end_behavior_tree
```

- **演示要点**：演示 behavior_tree 的参数：parallel, priority_selector, selector

### behavior_tree（timeline_flyer_proc）｜

- **关键词**：behavior_tree, selector, behavior_node
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:66-71`　（同签名共 11 处，另见 `base_types/processors/timeline_agents/timeline_proc_fsm.txt:528`、`route_finder_demos/platforms/striker.txt:82`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:115`）
- **片段**：

```text
      behavior_tree
         selector
            behavior_node  evade
	         behavior_node  fly_timeline
         end_selector
      end_behavior_tree
```

- **演示要点**：演示 behavior_tree 的参数：selector, behavior_node

### behavior_tree（brawler_platform）｜

- **关键词**：behavior_tree, priority_selector, selector
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:149-206`
- **片段**：

```text
      behavior_tree
        #behavior_node debug_data

#         #FLIGHT TACTIC DECISION
#         priority_selector
#            behavior_node  alt1516_bvr_end_run_left
#            behavior_node  alt1517_bvr_end_run_right
#            behavior_node  alt1514_point
#         end_priority_selector

#         #FLIGHT POSTURE DECISION
#         selector
#            #behavior_node  altWXYZ_blah_blah
#         end_selector

#         #PILOT POSTURE DECISION
#         selector
#            behavior_node  pilot_posture
#         end_selector

         #PILOT MANEUVERING DECISION
         priority_selector
            #when debug: prints precondition score of each selector child behavior
            #debug
            behavior_node  alt3111_straight_level_max_speed
            behavior_node  alt3121_straight_level
            behavior_node  alt3411_straight_flight
            behavior_node  alt3421_roll_15_pull
            behavior_node  alt3431_roll-15_pull
            behavior_node  alt3441_tail_attack
            behavior_node  alt3451_pull_gmax_sust
            behavior_node  alt3471_slow_current_dir
            behavior_node  alt3472_slow_pull_right
            behavior_node  alt3473_slow_pull_left
            behavior_node  alt3474_slow_pull_current_plane
            behavior_node  alt3511_break_right
            behavior_node  alt3531_break_left
            behavior_node  alt3551_run_away
            behavior_node  alt3561_force_overshoot
            behavior_node  alt3581_negative_velocity
           #behavior_node  alt3611_fly_vector
            behavior_node  alt3841_aim_missile_typ4
           #behavior_node  alt3211_route_maneuver
            behavior_node  alt3911_evade_missile
           #behavior_node  alt3A11_low_speed_recover
           #behavior_node  alt3A21_low_speed_recover_right45
           #behavior_node  alt3A31_low_speed_recover_left45
           #behavior_node  alt3B11_illuminate
            behavior_node  alt3G11_barrel_roll
         end_priority_selector

         #WEAPON EMPLOYMENT DECISION
         selector
           behavior_node weapon_decision_gun
           behavior_node weapon_decision_missile
         end_selector

      end_behavior_tree
```

- **演示要点**：演示 behavior_tree 的参数：priority_selector, selector

### behavior_tree（timeline_flyer_proc）｜

- **关键词**：behavior_tree, behavior_node
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:163-166`　（同签名共 5 处，另见 `base_types/processors/ripr_agents/aigci/aigci_processor.txt:28`、`behavior_tree/platforms/gci.txt:45`、`base_types/processors/quantum_agents/aiai/ai_quantum_tasker.txt:52`）
- **片段**：

```text
      behavior_tree
           #behavior_node  pursue_weapon_task_target
	         behavior_node  fly_timeline
      end_behavior_tree
```

- **演示要点**：演示 behavior_tree 的参数：behavior_node

### behavior_tree（timeline_flyer_proc）｜

- **关键词**：behavior_tree, selector
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:38-43`　（同签名共 5 处，另见 `base_types/processors/timeline_agents/timeline_proc_fsm.txt:493`、`base_types/processors/quantum_agents/aiww/ww_buddy_tasker.txt:21`、`base_types/processors/timeline_agents/timeline_proc.txt:316`）
- **片段**：

```text
      behavior_tree
         selector
            behavior_node  evade   #YES, evade will likely be in every state
            behavior_node  planned_route
         end_selector
      end_behavior_tree
```

- **演示要点**：演示 behavior_tree 的参数：selector

### behavior_tree（timeline_flyer_proc）｜

- **关键词**：behavior_tree
- **出处**：`base_types/processors/timeline_agents/timeline_flyer_proc.txt:186-188`　（同签名共 2 处，另见 `behavior_tree/processors/quantum_agents/aiai/ai_quantum_tasker.txt:42`）
- **片段**：

```text
      behavior_tree
            behavior_node  planned_route
         end_behavior_tree
```

- **演示要点**：演示 behavior_tree（最小结构，无子参数）

### callback · WSF_SCRIPT_CALLBACK｜

- **关键词**：callback, WSF_SCRIPT_CALLBACK, execute
- **出处**：`script_demos/script_demo_4.txt:30-32`
- **片段**：

```text
   callback start_maneuvering_cb WSF_SCRIPT_CALLBACK
      execute start_maneuvering in script-proc
   end_callback
```

- **演示要点**：演示 WSF_SCRIPT_CALLBACK 的参数：execute

### condition（run_tree_condition_run_checkpoints）｜

- **关键词**：condition, precondition
- **出处**：`behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_checkpoints.txt:10-18`　（同签名共 9 处，另见 `behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_engage.txt:10`、`behavior_tree/processors/quantum_agents/aiai/run_tree_condition_run_rtb.txt:10`、`behavior_tree/processors/quantum_agents/aiai/condition_checkpoint_1_reached.txt:10`）
- **片段**：

```text
condition run_checkpoints
   precondition
      if (SharedBlackboardVarExists("task", "tree_to_run"))
      {
         return ((string)GetSharedBlackboardVar("task", "tree_to_run") == "checkpoints");
      }
      return false;
   end_precondition
end_condition
```

- **演示要点**：演示 condition 的参数：precondition

### conditional_section（pm6_brawler_maneuver_comparison）｜

- **关键词**：conditional_section, conditionals, update_interval, side, heading, route, altitude, position, execute
- **出处**：`six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:18-80`　（同签名共 2 处，另见 `six_dof_with_brawler/pm6_brawler_route_comparison.txt:18`）
- **片段**：

```text
conditional_section
   conditionals
      feature_present brawler
   end_conditionals

define_path_variable CASE pm_brawler_maneuver_comparison

include std_setup.txt
include_once platforms/lte_fighter.txt

end_time 3 min

platform_type MANEUVER_TEST_PM6 BLUE_FIGHTER_PM6
   update_interval 0.01 sec 
   side light_blue
   heading 90 deg
   
   route
      position 00:05:00.00n  01:10:00.00w  altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:47:21.156e altitude 30000 ft msl speed 900 ft/s
      position 00:00:36.035n 01:57:21.156e altitude 30000 ft msl speed 900 ft/s
   end_route
   
end_platform_type

platform_type MANEUVER_TEST_BM BLUE_FIGHTER
   update_interval 0.01 sec 
   side blue
   heading 90 deg
   altitude 30000 ft msl
   position 00:05:00.00n  01:10:00.00w 
   
end_platform_type

platform slice_PM6 MANEUVER_TEST_PM6  
   execute at_interval_of 1 sec
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)Mover();
      mover.Slice(230, Math.M_PER_FT() * 15000.0, 0.75);
   end_execute 
end_platform

platform turn_PM6 MANEUVER_TEST_PM6    
   execute at_time 1 sec absolute
      WsfSixDOF_Mover mover = (WsfSixDOF_Mover)Mover();
      mover.Prlvl(230, 0.75);
   end_execute 
end_platform

platform slice_BM MANEUVER_TEST_BM
   execute at_interval_of 1 sec
      WsfBrawlerMover mover = (WsfBrawlerMover)Mover();
      mover.Slice(230, 15000, 0.75);
   end_execute 
end_platform

platform turn_BM MANEUVER_TEST_BM
   execute at_interval_of 1 sec
      WsfBrawlerMover mover = (WsfBrawlerMover) PLATFORM.Mover();
      mover.Prlvl(230, 0.75);
   end_execute 
end_platform

end_conditional_section
```

- **演示要点**：演示 conditional_section 的参数：conditionals, update_interval, side, heading, route, altitude, position, execute

### conditional_section（escort）｜

- **关键词**：conditional_section, feature_present, double, bool, int, string, file, enable
- **出处**：`air_to_air/escort.txt:24-109`
- **片段**：

```text
conditional_section

conditionals
   feature_present os:windows # escort scenario not supported on Linux at this time
end_conditionals

include_once _common.txt
include_once scenarios/${SCNRIO}.txt

$define REP 1

// create log.txt that looks like Brawler's standard output
script_variables 
   double closest_hostile = 1000*MATH.M_PER_NM();
   bool log_print = true; // set to true if desire to create a log.txt output that mimmicks brawler's standard output
   bool iout_print = true; // set to true if desire to create an iout.txt output
   bool sensor_print =  false; // **WARNING**, setting this to true causes errors, still debugging this tool
   WsfGeoPoint origin = WsfGeoPoint.Construct("00:00:00.00n 00:00:00.00e"); // scenario origin point for log print out
   int rseed = (int)WsfSimulation.RandomSeed();
   Array<string> log_string = {"output/","LOG",".",(string)$<REP>$};
   Array<string> iout_string = {"output/","IOUT",".",(string)$<REP>$};
   Array<string> sensor_string = {"output/","SENSOR",".",(string)$<REP>$};
#  string log_path = "output/log.txt";
   string log_path = "".Join(log_string);
   string iout_path = "".Join(iout_string);
   string sensor_path = "".Join(sensor_string);
   FileIO log = FileIO();
   FileIO iout = FileIO();
   FileIO sensorIO = FileIO();
end_script_variables

execute at_interval_of 10 s 
   writeln("T = ",TIME_NOW);
end_execute

include_once observer.txt
include_once sensor_observer.txt

end_time 1 hr

random_seed 13579

#end_time 2 sec

// DIS Interface
#dis_interface
#   record output/4v6_test.rep
#   suppress_comm_data on            // Mitigate large replay file sizes
#   suppress_cme_detect_beam         // Mitigate large replay file sizes (due to angle ranging processor)
#   suppress_emissions_data    true  // Mitigate large replay file sizes (due to angle ranging processor)
#   suppress_non_standard_data true // Only use if all else fails in reducing replay size
#end_dis_interface

// Mystic event pipe configuration
event_pipe
   file output/${SCNRIO}.aer
   enable AIRCOMBAT
   enable TRACK_UPDATE
   enable BEHAVIOR_TOOL
end_event_pipe

// Events output file
event_output
   file output/${SCNRIO}.evt
#   enable all
#   disable all
#    enable PLATFORM_INITIALIZED
#   enable PLATFORM_ADDED
#    enable BTREE_NODE_CHILDREN
#    enable BTREE_NODE_EXEC
#   enable LOCAL_TRACK_CORRELATION
#   enable LOCAL_TRACK_DECORRELATION
#   enable LOCAL_TRACK_DROPPED
#   enable LOCAL_TRACK_INITIATED
#   enable LOCAL_TRACK_UPDATED    
#   enable SENSOR_TRACK_INITIATED
#   enable SENSOR_DETECTION_ATTEMPT
#    enable MESSAGE_TRANSMITTED
#    enable MESSAGE_RECEIVED
#   enable WEAPON_HIT
#   enable WEAPON_MISSED
#   enable BTREE_NODE_CHILDREN
#   enable BTREE_NODE_EXEC
end_event_output

end_conditional_section
```

- **演示要点**：演示 conditional_section 的参数：feature_present, double, bool, int, string, file, enable

### conditional_section（check_for_warlock）｜

- **关键词**：conditional_section, conditionals, script
- **出处**：`wargame/scripts/check_for_warlock.txt:11-19`　（同签名共 2 处，另见 `wargame/scripts/check_for_warlock.txt:21`）
- **片段**：

```text
conditional_section
   conditionals
      feature_present warlock
   end_conditionals
  
   script void checkForWarlock()
      // Do nothing
   end_script
end_conditional_section
```

- **演示要点**：演示 conditional_section 的参数：conditionals, script

### conditionals（escort）｜

- **关键词**：conditionals, feature_present
- **出处**：`air_to_air/escort.txt:26-28`　（同签名共 4 处，另见 `six_dof_with_brawler/pm6_brawler_maneuver_comparison.txt:19`、`six_dof_with_brawler/pm6_brawler_route_comparison.txt:19`、`wargame/scripts/check_for_warlock.txt:12`）
- **片段**：

```text
conditionals
   feature_present os:windows # escort scenario not supported on Linux at this time
end_conditionals
```

- **演示要点**：演示 conditionals 的参数：feature_present

### conditionals（check_for_warlock）｜

- **关键词**：conditionals, feature_not_present
- **出处**：`wargame/scripts/check_for_warlock.txt:22-24`
- **片段**：

```text
   conditionals
      feature_not_present warlock
   end_conditionals
```

- **演示要点**：演示 conditionals 的参数：feature_not_present

### container（receiver_definition）｜

- **关键词**：container, commodity, initial_mass_quantity
- **出处**：`exchange_proc/receiver_definition.txt:23-29`　（同签名共 2 处，另见 `exchange_proc/tanker_definition.txt:23`）
- **片段**：

```text
      container fuel_and_receive_tank
         commodity JP8_FUEL
           maximum_mass_quantity 8000 kg
           mass_rate 40 kg/s
         end_commodity
         initial_mass_quantity 3000 kg
      end_container
```

- **演示要点**：演示 container 的参数：commodity, initial_mass_quantity

### container（logistics_platform）｜

- **关键词**：container
- **出处**：`logistics/platforms/logistics_platform.txt:352-354`　（同签名共 2 处，另见 `logistics/platforms/logistics_platform.txt:375`）
- **片段**：

```text
      container fuel_container
         # Derived types must set values in this!
      end_container
```

- **演示要点**：演示 container（最小结构，无子参数）

### cyber_attack · WSF_CYBER_ATTACK｜

- **关键词**：cyber_attack, WSF_CYBER_ATTACK, effect, probability_of_scan_detection, probability_of_scan_attribution, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_attack_attribution, probability_of_future_immunity, attack_success_draw_frequency, status_report_draw_frequency, attack_detection_draw_frequency, scan_detection_draw_frequency
- **出处**：`cyber/cyber/cyber_attacks/crash.txt:14-33`
- **片段**：

```text
cyber_attack CRASH WSF_CYBER_ATTACK
   effect CRASH_EFFECT
   
   probability_of_scan_detection 1.0
   probability_of_scan_attribution 0.5
   probability_of_attack_success .05
   probability_of_status_report 1.0
   probability_of_attack_detection 1.0
   probability_of_attack_attribution 0.5
   probability_of_future_immunity 0.0
   
   attack_success_draw_frequency always
   status_report_draw_frequency always
   attack_detection_draw_frequency always
   scan_detection_draw_frequency always
   future_immunity_draw_frequency always
   
   scan_delay_time 1 s
   delivery_delay_time 5 s
end_cyber_attack
```

- **演示要点**：演示 WSF_CYBER_ATTACK 的参数：effect, probability_of_scan_detection, probability_of_scan_attribution, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_attack_attribution, probability_of_future_immunity, attack_success_draw_frequency, status_report_draw_frequency

### cyber_attack · WSF_CYBER_ATTACK｜

- **关键词**：cyber_attack, WSF_CYBER_ATTACK, effect, probability_of_scan_detection, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_future_immunity, attack_success_draw_frequency, status_report_draw_frequency, attack_detection_draw_frequency, scan_detection_draw_frequency, future_immunity_draw_frequency, scan_delay_time
- **出处**：`cyber/cyber/cyber_attacks/delay_comms.txt:14-31`　（同签名共 2 处，另见 `cyber/cyber/cyber_attacks/lower_altitude.txt:14`）
- **片段**：

```text
cyber_attack DELAY_COMMS WSF_CYBER_ATTACK
   effect DELAY_COMMS_EFFECT
   
   probability_of_scan_detection 1.0
   probability_of_attack_success 0.5
   probability_of_status_report 1.0
   probability_of_attack_detection 1.0
   probability_of_future_immunity 0.0
   
   attack_success_draw_frequency always
   status_report_draw_frequency always
   attack_detection_draw_frequency always
   scan_detection_draw_frequency always
   future_immunity_draw_frequency always
   
   scan_delay_time 1 s
   delivery_delay_time 0 s
end_cyber_attack
```

- **演示要点**：演示 WSF_CYBER_ATTACK 的参数：effect, probability_of_scan_detection, probability_of_attack_success, probability_of_status_report, probability_of_attack_detection, probability_of_future_immunity, attack_success_draw_frequency, status_report_draw_frequency, attack_detection_draw_frequency, scan_detection_draw_frequency

### cyber_attack · WSF_CYBER_ATTACK｜

- **关键词**：cyber_attack, WSF_CYBER_ATTACK, probability_of_attack_success, resources_required
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:143-146`　（同签名共 2 处，另见 `cyber/GoneFishing_ConstraintDemo.txt:148`）
- **片段**：

```text
cyber_attack SMALL_CATCH WSF_CYBER_ATTACK
   probability_of_attack_success 1.0
   resources_required 1.0
end_cyber_attack
```

- **演示要点**：演示 WSF_CYBER_ATTACK 的参数：probability_of_attack_success, resources_required

### cyber_attack · WSF_CYBER_ATTACK｜

- **关键词**：cyber_attack, WSF_CYBER_ATTACK, effect, probability_of_attack_success
- **出处**：`cyber/avengers_detonate_effect.txt:47-51`
- **片段**：

```text
cyber_attack MIND_CONTROL WSF_CYBER_ATTACK
   effect DETONATE
   
   probability_of_attack_success 0.05 
end_cyber_attack
```

- **演示要点**：演示 WSF_CYBER_ATTACK 的参数：effect, probability_of_attack_success

### cyber_attack · WSF_CYBER_ATTACK｜

- **关键词**：cyber_attack, WSF_CYBER_ATTACK, effect
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:43-45`
- **片段**：

```text
cyber_attack EXFILTRATE WSF_CYBER_ATTACK
   effect EXFILTRATE 
end_cyber_attack
```

- **演示要点**：演示 WSF_CYBER_ATTACK 的参数：effect

### cyber_constraint · WSF_CYBER_CONSTRAINT｜

- **关键词**：cyber_constraint, WSF_CYBER_CONSTRAINT, resources
- **出处**：`cyber/GoneFishing_ConstraintDemo.txt:163-165`
- **片段**：

```text
   cyber_constraint WSF_CYBER_CONSTRAINT 
      resources 5.0
   end_cyber_constraint
```

- **演示要点**：演示 WSF_CYBER_CONSTRAINT 的参数：resources

### cyber_effect · WSF_CYBER_DETONATE_EFFECT｜

- **关键词**：cyber_effect, WSF_CYBER_DETONATE_EFFECT, weapon_name
- **出处**：`cyber/avengers_detonate_effect.txt:43-45`
- **片段**：

```text
cyber_effect DETONATE WSF_CYBER_DETONATE_EFFECT 
   weapon_name hulk
end_cyber_effect
```

- **演示要点**：演示 WSF_CYBER_DETONATE_EFFECT 的参数：weapon_name

### cyber_effect · WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT｜

- **关键词**：cyber_effect, WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT, default
- **出处**：`cyber/exfiltrate_demo/MITM_exfiltrate_demo.txt:36-41`
- **片段**：

```text
cyber_effect EXFILTRATE WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT 
   default 
      exfiltrate true
      all
   end_default
end_cyber_effect
```

- **演示要点**：演示 WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT 的参数：default

### cyber_effect · WSF_CYBER_SCRIPT_EFFECT｜

- **关键词**：cyber_effect, WSF_CYBER_SCRIPT_EFFECT, default
- **出处**：`cyber/cyber/cyber_effects/lower_altitude.txt:16-29`　（同签名共 2 处，另见 `cyber/cyber/cyber_effects/crash.txt:12`）
- **片段**：

```text
cyber_effect LOWER_ALTITUDE_EFFECT WSF_CYBER_SCRIPT_EFFECT
   default
      script void Attack(WsfCyberEngagement aEngagement)
         WsfPlatform victim = aEngagement.VictimPlatform();
         originalAltitude.Set(victim, victim.Altitude());
         victim.GoToAltitude(1000*MATH.M_PER_FT());
      end_script
      
      script void Restore(WsfCyberEngagement aEngagement)
         WsfPlatform victim = aEngagement.VictimPlatform();
         victim.GoToAltitude(originalAltitude.Get(victim));
      end_script
   end_default
end_cyber_effect
```

- **演示要点**：演示 WSF_CYBER_SCRIPT_EFFECT 的参数：default

### cyber_effect · WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT｜

- **关键词**：cyber_effect, WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT, platform_type
- **出处**：`cyber/cyber/cyber_effects/delay_comms.txt:12-27`
- **片段**：

```text
cyber_effect DELAY_COMMS_EFFECT WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT
   
   platform_type SPOTTER
      all
            
      script   WsfCyberMitmMessage OnSend(WsfMessage aMessage)
         writeln("TIME NOW = ",TIME_NOW, " ",aMessage.Originator(), " TRYING TO SEND A MESSAGE");
         return WsfCyberMitmMessage.Construct(aMessage, 20, false);
      end_script
      
      script   WsfCyberMitmMessage OnReceive(WsfMessage aMessage)
         return WsfCyberMitmMessage.Construct(aMessage, 20, false);
      end_script
   end_platform_type

end_cyber_effect
```

- **演示要点**：演示 WSF_CYBER_MAN_IN_THE_MIDDLE_EFFECT 的参数：platform_type

### cyber_protect · WSF_CYBER_PROTECT｜

- **关键词**：cyber_protect, WSF_CYBER_PROTECT, attack_response
- **出处**：`cyber/cyber/cyber_protections/altitude_protect.txt:13-26`　（同签名共 3 处，另见 `cyber/cyber/cyber_protections/crash_protect.txt:11`、`cyber/cyber/cyber_protections/delay_comms.txt:13`）
- **片段**：

```text
cyber_protect ALTITUDE_PROTECT WSF_CYBER_PROTECT
   attack_response LOWER_ALTITUDE
      probability_of_scan_detection 1.0
      probability_of_attack_success 1.0
      probability_of_status_report 1.0
      probability_of_attack_detection 1.0
      probability_of_future_immunity 0.0
      
      
      attack_detection_delay_time 1 s
      attack_recovery_delay_time 20 s
      restore      
    end_attack_response     
end_cyber_protect
```

- **演示要点**：演示 WSF_CYBER_PROTECT 的参数：attack_response

### cyber_protect（uav）｜

- **关键词**：cyber_protect
- **出处**：`cyber/platforms/uav.txt:27-28`　（同签名共 2 处，另见 `cyber/weapons/agm/leader_agm.txt:49`）
- **片段**：

```text
   cyber_protect ALTITUDE_PROTECT
   end_cyber_protect
```

- **演示要点**：演示 cyber_protect（最小结构，无子参数）

### decorator（decorator_striker）｜

- **关键词**：decorator, behavior_node
- **出处**：`behavior_tree/platforms/decorator_striker.txt:49-51`　（同签名共 4 处，另见 `behavior_tree/platforms/decorator_striker.txt:52`、`behavior_tree/platforms/decorator_striker.txt:57`、`behavior_tree/platforms/decorator_striker.txt:64`）
- **片段**：

```text
            decorator inverter
               behavior_node checkpoint_3
            end_decorator
```

- **演示要点**：演示 decorator 的参数：behavior_node

### decorator（decorator_striker）｜

- **关键词**：decorator, decorator
- **出处**：`behavior_tree/platforms/decorator_striker.txt:56-60`
- **片段**：

```text
            decorator repeater until_done
               decorator repeater repeat 20
                  behavior_node turn_right
               end_decorator
            end_decorator
```

- **演示要点**：演示 decorator 的参数：decorator

### decorator（decorator_striker）｜

- **关键词**：decorator
- **出处**：`behavior_tree/platforms/decorator_striker.txt:61-63`
- **片段**：

```text
            decorator repeater for 5 minutes
                  behavior_node turn_left
            end_decorator
```

- **演示要点**：演示 decorator（最小结构，无子参数）

### departure_traffic（west_coast_sea_traffic）｜

- **关键词**：departure_traffic, ship
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:126-144`
- **片段**：

```text
   departure_traffic 0.50
      ship TANKER_SHIP
         fraction     0.50
         mean_speed  20.0 knots
         sigma_speed  5.0 knots
      end_ship

      ship CONTAINER_SHIP
         fraction     0.30
         mean_speed  25.0 knots
         sigma_speed  5.0 knots
      end_ship

      ship LARGE_FISHING_TRAWLER_SHIP
         fraction     0.20
         mean_speed  30.0 knots
         sigma_speed 10.0 knots
      end_ship
   end_departure_traffic
```

- **演示要点**：演示 departure_traffic 的参数：ship

### global_environment（clutter_demo）｜

- **关键词**：global_environment, land_cover, land_formation, sea_state
- **出处**：`sensor_demos/clutter_demo.txt:16-20`
- **片段**：

```text
global_environment
   land_cover general
   land_formation rolling
   sea_state 2
end_global_environment
```

- **演示要点**：演示 global_environment 的参数：land_cover, land_formation, sea_state

### global_environment（clutter_table_generation）｜

- **关键词**：global_environment, land_cover, land_formation
- **出处**：`sensor_plot/clutter/clutter_table_generation.txt:20-23`　（同签名共 2 处，另见 `sensor_plot/clutter/clutter_table_regneration_test.txt:21`）
- **片段**：

```text
global_environment
   land_cover forest_clear_cut
   land_formation ridged
end_global_environment
```

- **演示要点**：演示 global_environment 的参数：land_cover, land_formation

### global_environment（noise_cloud）｜

- **关键词**：global_environment
- **出处**：`space_operations/scenarios/noise_cloud.txt:61-64`
- **片段**：

```text
global_environment
wind_speed 10 m/s
wind_direction 270 deg
end_global_environment
```

- **演示要点**：演示 global_environment（最小结构，无子参数）

### initial_state（orbiter）｜

- **关键词**：initial_state, include
- **出处**：`cislunar/scenarios/orbiter.txt:24-26`
- **片段**：

```text
      initial_state
         include ../elements/orbiter.txt
      end_initial_state
```

- **演示要点**：演示 initial_state 的参数：include

### ionospheric_characteristics（oth_radar）｜

- **关键词**：ionospheric_characteristics, electron_temperature, electron_density_at_max, electron_height_at_max, reflection_height, ionosphere_constrains_minimum_range
- **出处**：`oth_radar/sensors/radar/oth_radar.txt:33-39`
- **片段**：

```text
  ionospheric_characteristics
    electron_temperature       1540
    electron_density_at_max    4.0e11
    electron_height_at_max     250 km
    reflection_height          300 km
    ionosphere_constrains_minimum_range  true
  end_ionospheric_characteristics
```

- **演示要点**：演示 ionospheric_characteristics 的参数：electron_temperature, electron_density_at_max, electron_height_at_max, reflection_height, ionosphere_constrains_minimum_range

### items（flight_path）｜

- **关键词**：items, variable
- **出处**：`engage/flight_path.txt:164-169`　（同签名共 16 处，另见 `engage/flight_route.txt:175`、`engage/grid.txt:160`、`engage/grid_react_man.txt:233`）
- **片段**：

```text
      items
         variable time format "%.2f"
         variable target_x units km format " %7.3f"
         variable target_y units km format " %7.3f"
         variable target_z units m
      end_items
```

- **演示要点**：演示 items 的参数：variable

### local_traffic（west_coast_sea_traffic）｜

- **关键词**：local_traffic, ship
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:147-165`
- **片段**：

```text
   local_traffic 0.50
      ship SMALL_FISHING_SHIP
         fraction           0.75
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
      end_ship

      ship JETSKI
         fraction           0.25
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
         loiter_route ship-loiter-route-1
         loiter_route ship-loiter-route-2
      end_ship
   end_local_traffic
```

- **演示要点**：演示 local_traffic 的参数：ship

### moe · WSF_REVISIT_TIME_MOE｜

- **关键词**：moe, WSF_REVISIT_TIME_MOE, subtype, output
- **出处**：`coverage_demos/coverage_grids/conus_zone_coverage.txt:44-47`　（同签名共 6 处，另见 `coverage_demos/coverage_grids/conus_zone_coverage.txt:49`、`coverage_demos/coverage_grids/geo_belt_grid_coverage.txt:49`、`coverage_demos/coverage_grids/global_lat_lon_coverage.txt:48`）
- **片段**：

```text
   moe revisit_conus_max WSF_REVISIT_TIME_MOE 
      subtype maximum
      output data end_output
   end_moe
```

- **演示要点**：演示 WSF_REVISIT_TIME_MOE 的参数：subtype, output

### moe · WSF_SIMPLE_COVERAGE_MOE｜

- **关键词**：moe, WSF_SIMPLE_COVERAGE_MOE, output
- **出处**：`coverage_demos/coverage_grids/conus_zone_coverage.txt:39-42`　（同签名共 6 处，另见 `coverage_demos/coverage_grids/existing_grid_coverage.txt:42`、`coverage_demos/coverage_grids/state_zone_lat_lon_grid_coverage.txt:51`、`coverage_demos/coverage_grids/uav_stepped_grid_coverage.txt:40`）
- **片段**：

```text
   moe simple_conus WSF_SIMPLE_COVERAGE_MOE
      output data end_output
      output grid_stats end_output
   end_moe 
```

- **演示要点**：演示 WSF_SIMPLE_COVERAGE_MOE 的参数：output

### navigation（strike）｜

- **关键词**：navigation, position, insert_route
- **出处**：`aea_iads/scenarios/strike.txt:115-120`　（同签名共 7 处，另见 `aea_iads/scenarios/strike.txt:129`、`aea_iads/scenarios/strike.txt:143`、`iads/scenarios/strike.txt:115`）
- **片段**：

```text
      navigation
         position 40:43:48.000n 116:30:48.000w altitude 35000 ft msl
            speed 450 kts
         position 39:48:36.000n 117:37:48.000w altitude 35000 ft msl
         insert_route soj_orbit reference_heading -135.0 deg
      end_navigation
```

- **演示要点**：演示 navigation 的参数：position, insert_route

### navigation（soj）｜

- **关键词**：navigation, label, goto
- **出处**：`aea_iads/platforms/soj.txt:457-468`　（同签名共 2 处，另见 `iads/platforms/soj.txt:230`）
- **片段**：

```text
   navigation
      label start
         offset  20   0 km speed 450 kts altitude 35000 ft msl
            radial_acceleration 2 g
         offset  20   5 km speed 450 kts altitude 35000 ft msl
            radial_acceleration 2 g
         offset  0    5 km speed 450 kts altitude 35000 ft msl
            radial_acceleration 2 g
         offset  0    0 km speed 450 kts altitude 35000 ft msl
            radial_acceleration 2 g
      goto start
   end_navigation
```

- **演示要点**：演示 navigation 的参数：label, goto

### navigation（strike_cali_merged_targets_cali）｜

- **关键词**：navigation, position, speed
- **出处**：`iads/scenarios/strike_cali_merged_targets_cali.txt:25-36`　（同签名共 2 处，另见 `iads/scenarios/strike_cali_merged_targets_cali.txt:100`）
- **片段**：

```text
      navigation
         position 32:56:00.000n 121:55:36.000w altitude 5.76 nm msl
            speed 460 kts
         position 34:34:36.193n 120:54:04.079w altitude 5.76 nm msl
            speed 460 kts
         position 35:45:23.917n 120:34:01.295w altitude 5.76 nm msl
            speed 460 kts
         position 35:43:12.000n 120:28:00.000w altitude 5.76 nm msl
            speed 460 kts
        position 33:09:12.000n 121:36:00.000w altitude 5.76 nm msl
          speed 460 kts
      end_navigation
```

- **演示要点**：演示 navigation 的参数：position, speed

### navigation（ttr_test）｜

- **关键词**：navigation, position
- **出处**：`iads/ttr_test.txt:116-118`　（同签名共 24 处，另见 `cyber/scenarios/blue_laydown.txt:18`、`cyber/scenarios/mitm_blue_laydown.txt:20`、`traffic_demos/roads/osm_roadnetwork.txt:16`）
- **片段**：

```text
     navigation
        position 40:00:00n 89:00:00w altitude 35000 ft heading 270 deg speed 400 kts
     end_navigation
```

- **演示要点**：演示 navigation 的参数：position

### navigation（strike_cali_merged_targets_cali）｜

- **关键词**：navigation, speed
- **出处**：`iads/scenarios/strike_cali_merged_targets_cali.txt:50-61`　（同签名共 2 处，另见 `iads/scenarios/strike_cali_merged_targets_cali.txt:75`）
- **片段**：

```text
      navigation
      position 33:03:36.000n 122:08:00.000w altitude 5.76 nm msl
         speed 460 kts
      position 34:27:24.076n 121:00:56.411w altitude 5.76 nm msl
         speed 460 kts
      position 35:46:11.936n 120:38:50.636w altitude 5.76 nm msl
         speed 460 kts
      position 35:48:48.000n 120:25:36.000w altitude 5.76 nm msl
         speed 460 kts
     position 33:06:00.000n 121:32:00.000w altitude 5.76 nm msl
       speed 460 kts
      end_navigation
```

- **演示要点**：演示 navigation 的参数：speed

### navigation_errors（gps_denied）｜

- **关键词**：navigation_errors, gps_status, gps_degraded_multiplier, gps_in_track_error, gps_cross_track_error, gps_vertical_error, ins_accelerometer_bias_error, ins_gyroscope_bias_error, ins_random_walk_error, ins_vertical_error
- **出处**：`satellite_demos/scenarios/gps_denied.txt:110-120`
- **片段**：

```text
   navigation_errors
      gps_status 1
      gps_degraded_multiplier 100
      gps_in_track_error 1 m
      gps_cross_track_error 1 m
      gps_vertical_error 1 m
      ins_accelerometer_bias_error 1 m/s^2
      ins_gyroscope_bias_error 1 deg/hr
      ins_random_walk_error 1 deg/sqrt-hr
      ins_vertical_error 1 m
   end_navigation_errors
```

- **演示要点**：演示 navigation_errors 的参数：gps_status, gps_degraded_multiplier, gps_in_track_error, gps_cross_track_error, gps_vertical_error, ins_accelerometer_bias_error, ins_gyroscope_bias_error, ins_random_walk_error, ins_vertical_error

### navigation_errors（nav_demo）｜

- **关键词**：navigation_errors, gps_in_track_error, gps_cross_track_error, gps_vertical_error, ins_vertical_error, time_history_path, show_status_changes
- **出处**：`sensor_demos/nav_demo.txt:50-66`
- **片段**：

```text
   navigation_errors
      # GPS errors
      gps_in_track_error               8 m
      gps_cross_track_error            2 m
      gps_vertical_error               3 m

      # INS errors
      ins_vertical_error               10 m

      # The following commands aren't strictly necessary. They produce output that
      # is useful for analysis and debugging.

      time_history_path   .          # write time history data
                                     # <time_history_path>/<platform_name>.neh

      show_status_changes true       # write a message to standard output when status changes
   end_navigation_errors
```

- **演示要点**：演示 navigation_errors 的参数：gps_in_track_error, gps_cross_track_error, gps_vertical_error, ins_vertical_error, time_history_path, show_status_changes

### navigation_errors（intelsat）｜

- **关键词**：navigation_errors, gps_status
- **出处**：`satellite_demos/platforms/intelsat.txt:26-28`
- **片段**：

```text
   navigation_errors
      gps_status 1
   end_navigation_errors
```

- **演示要点**：演示 navigation_errors 的参数：gps_status

### noise_cloud · WSF_NOISE_CLOUD｜

- **关键词**：noise_cloud, WSF_NOISE_CLOUD, noise_frequency, noise_octaves, sensor_modifier, comm_modifier, constant_height, scalar, threshold
- **出处**：`space_operations/scenarios/noise_cloud.txt:11-21`
- **片段**：

```text
noise_cloud cloud_layer WSF_NOISE_CLOUD
   noise_frequency 4
   noise_octaves 4
   sensor_modifier cloud_mod .05
   comm_modifier comm_mod .003
   constant_height 10000 ft
   scalar 5000 km
   threshold 0.55
#   use_global_wind
#   origin 40s 90e
end_noise_cloud
```

- **演示要点**：演示 WSF_NOISE_CLOUD 的参数：noise_frequency, noise_octaves, sensor_modifier, comm_modifier, constant_height, scalar, threshold

### noise_cloud · WSF_NOISE_CLOUD｜

- **关键词**：noise_cloud, WSF_NOISE_CLOUD, noise_frequency, noise_octaves, sensor_modifier, constant_height, scalar, threshold
- **出处**：`noise_cloud/noise_cloud.txt:36-43`
- **片段**：

```text
noise_cloud cloud_layer WSF_NOISE_CLOUD
   noise_frequency 3
   noise_octaves 3
   sensor_modifier cloud_mod 0.001
   constant_height 3300 ft
   scalar 5 km
   threshold 0.6
end_noise_cloud
```

- **演示要点**：演示 WSF_NOISE_CLOUD 的参数：noise_frequency, noise_octaves, sensor_modifier, constant_height, scalar, threshold

### osm_traffic（osm_traffic）｜

- **关键词**：osm_traffic, network, vehicle_count, maximum_speed, vehicle
- **出处**：`traffic_demos/scenarios/osm_traffic.txt:9-37`
- **片段**：

```text
osm_traffic
  network osm_roadnetwork 
    vehicle_count                50
    maximum_speed                75 mi/h
    #minimum_distance_off_road    1 nm
    #maximum_distance_off_road    2 nm
    #pause_time_off_road        240 min
    #mean_travel_time            40.0 min
    #sigma_travel_time            5.0 min

    vehicle CAR
      fraction      0.80
      mean_speed   60 mi/h
      sigma_speed   5 mi/h
    end_vehicle

    vehicle PICKUP_TRUCK
      fraction      0.15
      mean_speed   60 mi/h
      sigma_speed  10 mi/h
    end_vehicle

    vehicle SCHOOL_BUS
      fraction      0.05
      mean_speed   50 mi/h
      sigma_speed  10 mi/h
    end_vehicle
  end_network
end_osm_traffic
```

- **演示要点**：演示 osm_traffic 的参数：network, vehicle_count, maximum_speed, vehicle

### parallel（combined_platform）｜

- **关键词**：parallel, precondition, selector, behavior_node
- **出处**：`brawler/platforms/combined_platform.txt:114-131`
- **片段**：

```text
            parallel
               precondition
                  extern bool mTargetIsWVR;
                  if (mTargetIsWVR == true)
                  {
                     return Failure("Target is WVR, use brawler subtree");
                  }
                  return true;
               end_precondition
               selector
                  behavior_node  evade
                  behavior_node  go_home
                  behavior_node  escort
                  behavior_node  pursue_weapon_task_target
                  behavior_node  planned_route
               end_selector
               behavior_node  engage_weapon_task_target
            end_parallel
```

- **演示要点**：演示 parallel 的参数：precondition, selector, behavior_node

### parallel（combined_platform）｜

- **关键词**：parallel, precondition, priority_selector, selector
- **出处**：`brawler/platforms/combined_platform.txt:132-171`
- **片段**：

```text
            parallel
               precondition
                  #if reach here, then we must have a WVR target
                  return true;
               end_precondition
               #PILOT MANEUVERING DECISION
               priority_selector
                  #debug   #prints precondition score of each selector child behavior
                  behavior_node  alt3111_straight_level_max_speed
                  behavior_node  alt3121_straight_level
                  behavior_node  alt3411_straight_flight
                  behavior_node  alt3421_roll_15_pull
                  behavior_node  alt3431_roll-15_pull
                  behavior_node  alt3441_tail_attack
                  behavior_node  alt3451_pull_gmax_sust
                  behavior_node  alt3471_slow_current_dir
                  behavior_node  alt3472_slow_pull_right
                  behavior_node  alt3473_slow_pull_left
                  behavior_node  alt3474_slow_pull_current_plane
                  behavior_node  alt3511_break_right
                  behavior_node  alt3531_break_left
                  behavior_node  alt3551_run_away
                  behavior_node  alt3561_force_overshoot
                  behavior_node  alt3581_negative_velocity
                 #behavior_node  alt3611_fly_vector
                  behavior_node  alt3841_aim_missile_typ4
                 #behavior_node  alt3211_route_maneuver
                  behavior_node  alt3911_evade_missile
                 #behavior_node  alt3A11_low_speed_recover
                 #behavior_node  alt3A21_low_speed_recover_right45
                 #behavior_node  alt3A31_low_speed_recover_left45
                 #behavior_node  alt3B11_illuminate
                  behavior_node  alt3G11_barrel_roll
               end_priority_selector
               #WEAPON EMPLOYMENT DECISION
               selector
                 behavior_node weapon_decision_gun
                 behavior_node weapon_decision_missile
               end_selector
            end_parallel
```

- **演示要点**：演示 parallel 的参数：precondition, priority_selector, selector

### parallel（parallel_striker）｜

- **关键词**：parallel, success_policy, behavior_node
- **出处**：`behavior_tree/platforms/parallel_striker.txt:57-61`　（同签名共 3 处，另见 `behavior_tree/platforms/parallel_striker.txt:62`、`behavior_tree/platforms/parallel_striker.txt:67`）
- **片段**：

```text
            parallel
               success_policy threshold 2
               behavior_node turn_left
               behavior_node speed_450
            end_parallel
```

- **演示要点**：演示 parallel 的参数：success_policy, behavior_node

### parallel（run_tree）｜

- **关键词**：parallel, selector, behavior_node
- **出处**：`behavior_tree/run_tree.txt:53-59`
- **片段**：

```text
                     parallel
                        selector
                           behavior_node pursue_weapon_task_target
                           behavior_node planned_route
                        end_selector
                        behavior_node engage_weapon_task_target
                     end_parallel
```

- **演示要点**：演示 parallel 的参数：selector, behavior_node

### parallel（behavior_pursue_base）｜

- **关键词**：parallel, precondition, behavior_node
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_pursue_base.txt:213-229`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/behavior_pursue_base.txt:213`）
- **片段**：

```text
   parallel
      precondition
         WsfTrack target = ((WsfRIPRProcessor)PROCESSOR).GetTarget();
         if (target.IsNull() || !target.IsValid()) {
            return Failure("target track not found");
         }
         if (!target.AirDomain()) {
            #writeln("track is not for an air-domain target");
            return Failure("track is not for an air-domain target");
         }
         return true;
      end_precondition
      behavior_node pursue_heading
      behavior_node pursue_altitude
      behavior_node pursue_speed
      behavior_node pursue_fly_simple
   end_parallel
```

- **演示要点**：演示 parallel 的参数：precondition, behavior_node

### parallel（run_tree）｜

- **关键词**：parallel, behavior_node, sequence
- **出处**：`behavior_tree/run_tree.txt:49-73`
- **片段**：

```text
            parallel #choose a tree
               behavior_node choose_tree
               sequence #engage
                  condition run_engage
                     parallel
                        selector
                           behavior_node pursue_weapon_task_target
                           behavior_node planned_route
                        end_selector
                        behavior_node engage_weapon_task_target
                     end_parallel
               end_sequence
               sequence #fly checkpoints
                  condition run_checkpoints
                  sequence
                     behavior_node fly_checkpoint_1
                     behavior_node fly_checkpoint_2
                     behavior_node fly_checkpoint_3
                  end_sequence
               end_sequence
               sequence #return to base
                  condition run_rtb
                  behavior_node rtb
               end_sequence
            end_parallel
```

- **演示要点**：演示 parallel 的参数：behavior_node, sequence

### parallel（blackboard_striker）｜

- **关键词**：parallel, behavior_node
- **出处**：`behavior_tree/platforms/blackboard_striker.txt:56-61`　（同签名共 2 处，另见 `brawler/platforms/brawler_platform.txt:111`）
- **片段**：

```text
            parallel
               behavior_node checkpoint_1
               behavior_node checkpoint_2
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_parallel
```

- **演示要点**：演示 parallel 的参数：behavior_node

### priority_selector（priority_selector_striker）｜

- **关键词**：priority_selector, behavior_node
- **出处**：`behavior_tree/platforms/priority_selector_striker.txt:45-50`　（同签名共 4 处，另见 `brawler/platforms/combined_platform.txt:138`、`base_types/platforms/brawler/brawler_platform.txt:170`、`brawler/platforms/brawler_platform.txt:133`）
- **片段**：

```text
         priority_selector
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
         end_priority_selector
```

- **演示要点**：演示 priority_selector 的参数：behavior_node

### program（hellfire_type）｜

- **关键词**：program, pitch, pitch_rate
- **出处**：`hellfire/laser_designation_via_dis/hellfire_type.txt:182-185`　（同签名共 6 处，另见 `hellfire/laser_designation_via_dis/hellfire_type.txt:187`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:181`、`hellfire/semiactive_laser_hellfire/hellfire_type.txt:186`）
- **片段**：

```text
      program pitch_up_one ATTITUDE_PROGRAM
         pitch 10.0 deg  # 4 + 6 deg
         pitch_rate 45 deg/s
      end_program
```

- **演示要点**：演示 program 的参数：pitch, pitch_rate

### program（saturn_v_complex）｜

- **关键词**：program, flight_path_angle, pitch_rate
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:292-295`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:219`）
- **片段**：

```text
         program FLIGHT_PATH_ANGLE_PROGRAM
            flight_path_angle 85.60 deg
            pitch_rate 0.15596 deg/sec
         end_program
```

- **演示要点**：演示 program 的参数：flight_path_angle, pitch_rate

### program（proton-m）｜

- **关键词**：program, g_bias
- **出处**：`space_operations/launch_vehicles/proton_m/proton-m.txt:163-165`　（同签名共 2 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_simple.txt:234`）
- **片段**：

```text
         program GRAVITY_BIAS_PROGRAM
            g_bias 0.0
         end_program
```

- **演示要点**：演示 program 的参数：g_bias

### program（saturn_v_complex）｜

- **关键词**：program, gravity_bias
- **出处**：`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:312-314`　（同签名共 6 处，另见 `space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:319`、`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:326`、`space_operations/launch_vehicles/saturn_v/saturn_v_complex.txt:334`）
- **片段**：

```text
         program GRAVITY_BIAS_PROGRAM
            gravity_bias 0.088      # FPA good, altitude 0.4% high
         end_program
```

- **演示要点**：演示 program 的参数：gravity_bias

### program（atlas_v_401_base）｜

- **关键词**：program, pitch_rate
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:162-165`　（同签名共 6 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:119`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:172`、`space_operations/launch_vehicles/falcon_heavy/falcon_heavy_base.txt:234`）
- **片段**：

```text
         program FLIGHT_PATH_ANGLE_PROGRAM
            # The launch computer will define the flight path angle that is used.
            pitch_rate 0.125 deg/sec      # Derived by tuning...
         end_program
```

- **演示要点**：演示 program 的参数：pitch_rate

### program（atlas_v_401_base）｜

- **关键词**：program
- **出处**：`space_operations/launch_vehicles/atlas_v_401/atlas_v_401_base.txt:175-176`　（同签名共 9 处，另见 `space_operations/launch_vehicles/delta_iv_m/delta_iv_m_base.txt:127`、`space_operations/launch_vehicles/falcon_9/falcon_9_base.txt:185`、`space_operations/launch_vehicles/proton_m/proton-m.txt:170`）
- **片段**：

```text
         program ORBIT_INSERTION_PROGRAM
         end_program
```

- **演示要点**：演示 program（最小结构，无子参数）

### query_bid（aiai_processor.old）｜

- **关键词**：query_bid, if, double, else, return
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.old.txt:1538-1708`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aifl/aifl_processor.old.txt:234`）
- **片段**：

```text
   query_bid

      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }

      double current_bid = 10000.0;
      //writeln_d("    - bidding on ", JOB.Name(), ", desc: ", JOB.GetDescription());

      if (JOB.Name() == "pursue-target")
      {
         Map<string, Object>tempData = JOB.GetData();
         string name = (string)tempData["targetTrackName"];
        #extern WsfTrack GetTrackByName(WsfPlatform, string);
         WsfTrack track = GetTrackByName(PLATFORM, name);

         // if the track is not a foe or is damaged, we'll ignore it
         if (!(track.IsValid()))  // || !(track.IFF_Foe()))
         {
            writeln_d("!!! No track for JOB: ", JOB.Name(), ", ", JOB.GetDescription(), ", ", name);
            return cMIN_JOB_BID;
         }

        #extern double EffectiveRange (WsfPlatform, WsfTrack);
         double effRange = EffectiveRange(PLATFORM, track);
         double slantRange = PLATFORM.SlantRangeTo(track);

         bool isCapable = false;
         string tName = track.TargetName();
         if (!mTrackMinRangeOkMap.Exists(tName))
         {
            mTrackMinRangeOkMap.Set(tName,true);
         }

         double maxCapableWeaponRange = 0.0;

         //determine if this agent has any weapons that are capable of engaging this kind of target (domain check)
        #extern bool IsWeaponDomainCapable(WsfTrack,Map<string, Object>);
         foreach (Map<string, Object> curWeapon in mWeaponArray)
         {
            #writeln_d("    ", (string)curWeapon["name"], " weapon is domain capable: ", IsWeaponDomainCapable(track,curWeapon));
            #writeln_d("    ", (string)curWeapon["name"], " weapons remaining       : ", ((WsfWeapon)curWeapon["weapon"]).QuantityRemaining());

            if ( IsWeaponDomainCapable(track,curWeapon) &&
                 (((WsfWeapon)curWeapon["weapon"]).QuantityRemaining() > 0))
            {
               isCapable = true;
               double curRange = (double)curWeapon["rangeMax"];
               if (curRange > maxCapableWeaponRange) maxCapableWeaponRange = curRange;

               if (mTrackMinRangeOkMap.Get(tName)==true    &&
                   (double)curWeapon["rangeMin"] < effRange  )
               {
                  mTrackMinRangeOkMap.Set(tName, true);
               }
               else if (mTrackMinRangeOkMap.Get(tName)==false   &&
                        ((double)curWeapon["rangeMin"] * 2.0) < slantRange )
               {
                  mTrackMinRangeOkMap.Set(tName, true);
               }
               else
               {
                  mTrackMinRangeOkMap.Set(tName, false);

                 writeln_d("    weapon min range failure");
               }
            }
         }
         if (isCapable==false)
         {
           #extern string GetTargetDomain(WsfTrack);
            writeln_d("!!! No weapon capable in the ", GetTargetDomain(track)," domain and in range for: ", JOB.GetDescription());
            return cMIN_JOB_BID;
         }

         if (mTrackMinRangeOkMap.Get(tName)==false)
         {
            writeln_d("!!! TrackMinRangeOk == false");
            return cMIN_JOB_BID;
         }

         double currentlyTargeted = 0;
         if (GetTargetName() == name)
         {
            currentlyTargeted = 1.0;
         }
         //writeln_d("      Currently Targeted: ", currentlyTargeted );



         //determine if the missile range is added to the escort protect radius
         if (!escortAddMissileProtectRange)
         {
            maxCapableWeaponRange = 0.0;
         }
         // if escoring a package, determine if the threat is engageable
         // check if it lies within the protect radius
         if (mEscortFollowing)
         {
            #if already engaging the threat, allow a little chase
            if (slantRange > (escortProtectDistance + maxCapableWeaponRange + (currentlyTargeted * escortChaseDistance)))
            {
                #writeln_d("      Target not a threat to escort package!");
                return cMIN_JOB_BID;
            }
         }

        #extern string DetermineTrackCategory (WsfTrack);
         string targetType = DetermineTrackCategory(track);
         //writeln_d("      track category: ",targetType);
        #extern bool TestTrackCategory(WsfTrack, string);
         if (TestTrackCategory(track, "unknown"))
         {
            writeln_d("!!! Target type unknown for current job. ");
            return cMIN_JOB_BID;
         }

         int othersTargeting = GetRIPRCommanderProcessor().SubsTargeting( track, PLATFORM );
         //writeln_d("      Others Targeting: ", othersTargeting );

         // set the target type
         //writeln_d("   -Creating track record for ", name, " -- ", targetType);
         //writeln_d("      track closing speed: ", PLATFORM.ClosingSpeedOf(track) );
         //writeln_d("      track slant range  : ", PLATFORM.SlantRangeTo(track) );

         // account for bidding parameters
        #extern int GetBucket(double, double);
         //writeln_d("      GetBucket(track closing speed): ", GetBucket(PLATFORM.ClosingSpeedOf(track), cBUCKET_BASE) );
         //writeln_d("      GetBucket(track slant range): ", GetBucket(PLATFORM.SlantRangeTo(track), cBUCKET_BASE) );

         //current_bid = current_bid + cWEIGHT_BEING_TARGETED    * beingTargeted;
         current_bid = current_bid + cWEIGHT_CURRENT_TARGET    * currentlyTargeted;
         current_bid = current_bid + cWEIGHT_CLOSING_SPEED_OF  * GetBucket(PLATFORM.ClosingSpeedOf(track), cBUCKET_BASE) + GetBucket(cBASE_CLOSING_SPEED_CONSTANT, cBUCKET_BASE);
         current_bid = current_bid + cWEIGHT_SLANT_RANGE_TO    * GetBucket(PLATFORM.SlantRangeTo(track), cBUCKET_BASE) + GetBucket(cBASE_SLANT_RANGE_CONSTANT, cBUCKET_BASE);
         current_bid = current_bid + cWEIGHT_OTHERS_TARGETING  * othersTargeting;
         current_bid = current_bid + cWEIGHT_WEAPONS_IN_FLIGHT * PROCESSOR.WeaponsActive(track);
         current_bid = current_bid + cWEIGHT_WEAPONS_FIRED_AT  * mRoundsFiredAtMap.Get(track);
         current_bid = current_bid + cWEIGHT_ANY_WEAPONS_ACTIVE * (WeaponsActive(track) + PeersWeaponsActive(track));

      ### if ( (WeaponsActive(aTarget) > 0) || (PeersWeaponsActive(aTarget) > 0) )



         if( ThreatTypePriority.Exists( targetType ) )
         {
           current_bid = current_bid + ThreatTypePriority.Get( targetType );
         }
      }
      else if( JOB.Name() == "pursue-point" )
      {
         Map<string, Object>tempData = JOB.GetData();
         string name = (string)tempData["targetTrackName"];

         WsfGeoPoint point = (WsfGeoPoint)tempData["targetPoint"];

         if (!point.IsValid())
         {
            writeln_d("!!! Invalid point for current job: ",JOB.Name(), ", ", JOB.GetDescription() );
            return cMIN_JOB_BID;
         }

         // account for bidding parameters
        #extern int GetBucket(double, double);
         current_bid = current_bid + cWEIGHT_SLANT_RANGE_TO * GetBucket(PLATFORM.SlantRangeTo(point), cBUCKET_BASE) + GetBucket(cBASE_SLANT_RANGE_CONSTANT, cBUCKET_BASE);
      }

      //writeln_d("      calculated bid: ", current_bid);
      return current_bid;

   end_query_bid
```

- **演示要点**：演示 query_bid 的参数：if, double, else, return

### query_bid_type（behavior_radar-control_new）｜

- **关键词**：query_bid_type, if, string, bool, double, extern, current_bid, return
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_radar-control_new.txt:43-98`
- **片段**：

```text
   query_bid_type    radar-control

      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }
      Array<string> targetNames = (Array<string>)JOB.GetData("RadarTargetsArray");
      WsfGeoPoint point         =   (WsfGeoPoint)JOB.GetData("RadarPointOfInterest");
      string mode               =        (string)JOB.GetData("RadarMode");
      string strategy           =        (string)JOB.GetData("RadarStrategy");

      bool emitting = AmEmittingAnything();
      if (mode=="silent" && emitting==true)
      {
         return cMIN_JOB_BID;
      }

      double weightSlantRange = cWEIGHT_SLANT_RANGE_TO;
      if (strategy=="distributed" && mode=="support")
      {
         weightSlantRange = MATH.Fabs(weightSlantRange);
      }

      double current_bid = 10000.0;
      extern int GetBucket(double, double);
      extern double cBUCKET_BASE;
      current_bid = current_bid + MATH.Fabs(cWEIGHT_SLANT_RANGE_TO) * GetBucket(cBASE_SLANT_RANGE_CONSTANT, cBUCKET_BASE);
      current_bid = current_bid + weightSlantRange * GetBucket(PLATFORM.SlantRangeTo(point), cBUCKET_BASE);

      WsfRIPRJob otherJob;
      Set<int> deps = JOB.DependenciesForJob();
      if (deps.Size()>0)
      {
         int dep = (int)deps.GetIterator().Data();   //just grab first one
         WsfRIPRJob otherJob = PROCESSOR.GetJobById(dep);
      }

      if (mode=="support" && emitting==true)
      {
         current_bid = current_bid + cWEIGHT_RADARS_ON;
      }

      if (strategy=="passive" && otherJob.IsValid() && otherJob.Name()=="radar-control")
      {
         Array<WsfPlatform> others = otherJob.Winners();
         double angle1 = point.TrueBearingTo(PLATFORM.Location());
         double maxAngle = 0;
         foreach(WsfPlatform other in others)
         {
            double seperation = MATH.NormalizeAngleMinus180_180(angle1 - point.TrueBearingTo(other.Location()));
            maxAngle = MATH.Max(maxAngle, MATH.Fabs(seperation));
         }
         current_bid = current_bid + cWEIGHT_SEPERATION_ANGLE * GetBucket(maxAngle, cBUCKET_BASE);
      }
      return current_bid;
   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, string, bool, double, extern, current_bid, return

### query_bid_type（aiai_processor）｜

- **关键词**：query_bid_type, if, double, string, int, else, return
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.txt:450-502`
- **片段**：

```text
   query_bid_type    weapon_uplink

      writeln_d("BEHAVIOR NODE query_bid_type weapon_uplink");

      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }
      double current_bid = 10000.0;
      //check if I can support this weapon
     #extern WsfTrack GetTrackByName(WsfPlatform, string);

      string name             = (string)JOB.GetData("targetTrackName");
      int weaponPlatformIndex = (int)JOB.GetData("weaponPlatformIndex");
      int targetPlatformIndex = (int)JOB.GetData("targetPlatformIndex");

      WsfTrack track = GetTrackByName(PLATFORM, name);
      WsfPlatform weaponPlatform = WsfSimulation.FindPlatform(weaponPlatformIndex);
      WsfPlatform targetPlatform = WsfSimulation.FindPlatform(targetPlatformIndex);
      WsfLocalTrack t = (WsfLocalTrack)track;
      if (!weaponPlatform.IsValid() ||
          !targetPlatform.IsValid() ||
          !track.IsValid())
      {
          writeln_d("!!! Invalid weapon or target for job: ", JOB.GetDescription() );
          return cMIN_JOB_BID;
      }

      if (!mAllowCoopEngage &&
          !t.ContributorOf(PLATFORM))
      {
          return cMIN_JOB_BID;
      }

      if (PLATFORM.WithinFieldOfView(targetPlatform, mUplinkSensorName))
      {
         double alreadyUplinking = 0.0;
         if (PROCESSOR.IsUplinkingTo(weaponPlatform))
         {
            alreadyUplinking = 1.0;
         }
         current_bid += cWEIGHT_SLANT_RANGE_TO * (cMAX_SLANT_RANGE    - PLATFORM.SlantRangeTo(targetPlatform));
         current_bid += cWEIGHT_CLOSING_SPEED * (-cMIN_CLOSING_SPEED + PLATFORM.ClosingSpeedOf(targetPlatform));
         current_bid += cWEIGHT_CURRENT_TARGET   * alreadyUplinking;
      }
      else
      {
        writeln_d("!!! target for uplink job is out of view: ", JOB.GetDescription() );
        return cMIN_JOB_BID;
      }
      //writeln_d("      uplink returning calculated bid: ", current_bid);
      return current_bid;
   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, double, string, int, else, return

### query_bid_type（behavior_radar-control_new）｜

- **关键词**：query_bid_type, if, string, bool, double, current_bid, return
- **出处**：`base_types/processors/ripr_agents/aiai/behavior_radar-control_new.txt:43-98`
- **片段**：

```text
   query_bid_type    radar-control

      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }
      Array<string> targetNames = (Array<string>)JOB.GetData("RadarTargetsArray");
      WsfGeoPoint point         =   (WsfGeoPoint)JOB.GetData("RadarPointOfInterest");
      string mode               =        (string)JOB.GetData("RadarMode");
      string strategy           =        (string)JOB.GetData("RadarStrategy");

      bool emitting = AmEmittingAnything();
      if (mode=="silent" && emitting==true)
      {
         return cMIN_JOB_BID;
      }

      double weightSlantRange = cWEIGHT_SLANT_RANGE_TO;
      if (strategy=="distributed" && mode=="support")
      {
         weightSlantRange = MATH.Fabs(weightSlantRange);
      }

      double current_bid = 10000.0;
     #extern int GetBucket(double, double);
     #extern double cBUCKET_BASE;
      current_bid = current_bid + MATH.Fabs(cWEIGHT_SLANT_RANGE_TO) * GetBucket(cBASE_SLANT_RANGE_CONSTANT, cBUCKET_BASE);
      current_bid = current_bid + weightSlantRange * GetBucket(PLATFORM.SlantRangeTo(point), cBUCKET_BASE);

      WsfRIPRJob otherJob;
      Set<int> deps = JOB.DependenciesForJob();
      if (deps.Size()>0)
      {
         int dep = (int)deps.GetIterator().Data();   //just grab first one
         WsfRIPRJob otherJob = PROCESSOR.GetJobById(dep);
      }

      if (mode=="support" && emitting==true)
      {
         current_bid = current_bid + cWEIGHT_RADARS_ON;
      }

      if (strategy=="passive" && otherJob.IsValid() && otherJob.Name()=="radar-control")
      {
         Array<WsfPlatform> others = otherJob.Winners();
         double angle1 = point.TrueBearingTo(PLATFORM.Location());
         double maxAngle = 0;
         foreach(WsfPlatform other in others)
         {
            double seperation = MATH.NormalizeAngleMinus180_180(angle1 - point.TrueBearingTo(other.Location()));
            maxAngle = MATH.Max(maxAngle, MATH.Fabs(seperation));
         }
         current_bid = current_bid + cWEIGHT_SEPERATION_ANGLE * GetBucket(maxAngle, cBUCKET_BASE);
      }
      return current_bid;
   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, string, bool, double, current_bid, return

### query_bid_type（aiai_processor）｜

- **关键词**：query_bid_type, if, string, double, bid, return
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.txt:180-300`
- **片段**：

```text
   query_bid_type pursue-target

     #extern Map<string, double> ThreatTypePriority;
     #extern WsfTrack   GetTrackByName (WsfPlatform, string);
     #extern bool       HasEnoughFuelToTravel (WsfPlatform,double);
     #extern string     DetermineTrackCategory (WsfTrack);
     #extern bool       TestTrackCategory (WsfTrack, string);
     #extern double     GetWeaponsEnvelope (WsfPlatform);
     #extern double     GetWeaponRangeMax(WsfPlatform aPlatform, Array<Map<string, Object>> aWeaponArray);
     #extern Array<Map<string, Object>> mWeaponArray;

      if (!JOB.IsValid())
      {
         writeln_d("query_bid_type pursue-target: JOB not valid");
         return cMIN_JOB_BID;
      }

      string targetTrackName = (string)JOB.GetData("targetTrackName");
      WsfTrack targetTrack = GetTrackByName(PLATFORM, targetTrackName);
      if (!targetTrack.IsValid())
      {
         writeln_d("!!! No track for JOB: ", JOB.Name(), ", ", JOB.GetDescription(), ", ", targetTrackName);
         return cMIN_JOB_BID;
      }

      double slantRangeTo   = PLATFORM.SlantRangeTo(targetTrack);
      double closingSpeed   = PLATFORM.ClosingSpeedOf(targetTrack);
      double maxWeaponRange = GetWeaponRangeMax(PLATFORM, mWeaponArray);

      if (mFilterJobsOnFuel == true)
      {
         if (!HasEnoughFuelToTravel(PLATFORM,slantRangeTo-maxWeaponRange))
         {
            writeln_d("!!! Not enough fuel for JOB: ", JOB.Name(), ", ", JOB.GetDescription(), ", ", targetTrackName);
            return cMIN_JOB_BID;
         }
      }

      if (mFilterJobsOnCategory == true)
      {
         if (TestTrackCategory(targetTrack, "unknown"))
         {
            writeln_d("!!! Target type unknown for current job. ");
            return cMIN_JOB_BID;
         }
      }

      if (mFilterJobsOnWeapons == true)
      {
         //check here if we have any weapons remaining that are capable against target domain
         if (!HaveWeaponsForThreat(targetTrack) &&
             PROCESSOR.WeaponsActive(targetTrack) <= 0)
         {
            writeln_d("!!! No domain capable weapons left for target!");
            return cMIN_JOB_BID;
         }
      }

      if (mFilterJobsOnZone == true)
      {
         if (mZoneName != "")
         {
            mFezZone = PLATFORM.Zone(mZoneName);
            if (!mFezZone.IsValid() || !mFezZone.PointIsInside(PLATFORM.Location()))
            {
               writeln_d("!!! Target outside of given FEZ!");
               return cMIN_JOB_BID;
            }
         }
      }

      double weight_closing_speed = cWEIGHT_CLOSING_SPEED;
      if (targetTrack.LandDomain())
      {
        weight_closing_speed = 2.0 * cWEIGHT_CLOSING_SPEED;
      }

      /////////////////////////////////////////////////////////////////////////
      // calculate bulk of the bid HERE
      double bid = 0.0;
      bid += cWEIGHT_SLANT_RANGE_TO * (cMAX_SLANT_RANGE    - slantRangeTo);
      bid += weight_closing_speed * (-cMIN_CLOSING_SPEED + closingSpeed);
      // the bid has its major contributers now
      /////////////////////////////////////////////////////////////////////////

      //calculate other optional bid contributions here
      WsfFuel fuelObj = PLATFORM.Fuel();
      if (fuelObj.IsValid())
      {
         bid = bid + cWEIGHT_FUEL * fuelObj.QuantityRemaining();
      }
      //contribution if I have an active weapon on the target
      bid = bid + cWEIGHT_MY_WEAPONS_ACTIVE * PROCESSOR.WeaponsActive(targetTrack);
      //contribution if peers have an active weapon on the target
      bid = bid + cWEIGHT_PEERS_WEAPONS_ACTIVE * PROCESSOR.PeersWeaponsActive(targetTrack);
      //contribution if I am currently targeting the target
      if (PROCESSOR.GetTargetName() == targetTrackName)
      {
         bid = bid + cWEIGHT_CURRENT_TARGET;
      }
      //contribution if any peers are targeting the target
      WsfRIPRProcessor commander = PROCESSOR.GetRIPRCommanderProcessor();
      if (commander.IsValid())
      {
         bid = bid + cWEIGHT_OTHERS_TARGETING * commander.SubsTargeting(targetTrack, PLATFORM);
      }
      //contribution bonus if you care about weapon envelopes
      if (slantRangeTo < GetWeaponsEnvelope(targetTrack.Target()))
      {
         bid = bid + cWEIGHT_THREAT_WEAPONS_ENVELOPE;
      }
      //contribution bonus from threat type (category)
      string targetType = DetermineTrackCategory(targetTrack);
      if( ThreatTypePriority.Exists( targetType ) )
      {
        bid = bid + ThreatTypePriority.Get( targetType );
      }

      writeln_d(PLATFORM.Name(), " bid on target ", targetTrackName, ": ", bid);
      return bid;
   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, string, double, bid, return

### query_bid_type（aiai_processor）｜

- **关键词**：query_bid_type, if, double, current_bid, return
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.txt:419-447`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/aiai_processor.txt:354`）
- **片段**：

```text
   query_bid_type    pursue-point
      writeln_d("BEHAVIOR NODE query_bid_type pursue-point");
      if (!JOB.IsValid())
      {
         return cMIN_JOB_BID;
      }
      double current_bid = 10000.0;
      WsfGeoPoint point = (WsfGeoPoint)JOB.GetData("targetPoint");
      if (!point.IsValid())
      {
         writeln_d("!!! Invalid point for current job: ",JOB.Name(), ", ", JOB.GetDescription() );
         return cMIN_JOB_BID;
      }

      double distToPoint = PLATFORM.SlantRangeTo(point);

      // check fuel levels
     #extern bool HasEnoughFuelToTravel(WsfPlatform,double);
      if (mFilterJobsOnFuel &&
          !HasEnoughFuelToTravel(PLATFORM,distToPoint))
      {
         writeln_d("!!! Not enough fuel for JOB: ", JOB.Name(), ", ", JOB.GetDescription());
         return cMIN_JOB_BID;
      }

      current_bid += cWEIGHT_SLANT_RANGE_TO * (cMAX_SLANT_RANGE    - distToPoint);

      return current_bid;
   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, double, current_bid, return

### query_bid_type（aijam_processor）｜

- **关键词**：query_bid_type, if, return, string, double
- **出处**：`base_types/processors/ripr_agents/aijam/aijam_processor.txt:373-415`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiai/aiai_processor.txt:303`）
- **片段**：

```text
  query_bid_type jam-target

    if (!JOB.IsValid())
    {
      writeln_d("job not valid, can not process, no bid!");
      return -MATH.DOUBLE_MAX();
    }

    if (mChannelJammers.Size() <= 0)
    {
      writeln_d("no jammer weapons found, impossible, no bid!");
      return -MATH.DOUBLE_MAX();
    }

    WsfTrack track = GetJobsTrack(JOB);
    if (!track.IsValid())
    {
      writeln_d("track not valid for job: ", JOB.Name(), " - ", JOB.GetDescription(), ", no bid.");
      return -MATH.DOUBLE_MAX();
    }

    string jammerName = mChannelJammers.Get(CHANNEL);
    if(!jammerName.IsValid())
    {
      jammerName = mChannelJammers.Get(0);
    }

    if (MATH.Fabs(PLATFORM.Roll()) >= RESOURCE_ROLL_ANGLE)
    {
      writeln_d("platform is rolled beyond the resource limit!");
      return -MATH.DOUBLE_MAX();
    }

    if (PLATFORM.SlantRangeTo(track) >= DISTANCE_3D)
    {
      writeln_d("jamming target is too far away!");
      return -MATH.DOUBLE_MAX();
    }

    double jobBidValue = CalculateJamTargetBidValue( track, jammerName);
    return jobBidValue;

  end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, return, string, double

### query_bid_type（aifl_processor）｜

- **关键词**：query_bid_type, if, double, bool, else
- **出处**：`base_types/processors/ripr_agents/aifl/aifl_processor.txt:166-255`　（同签名共 3 处，另见 `base_types/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:32`、`behavior_tree/processors/quantum_agents/aifl/behavior_interpret_flank_jobs.txt:32`）
- **片段**：

```text
   query_bid_type    flank

      if (PLATFORM.Subordinates().Count() <= 0)
      {
         writeln_d("no subordinates to carry out flank job");
         return -MATH.DOUBLE_MAX();
      }

      WsfGeoPoint zonePoint    = (WsfGeoPoint)JOB.GetData("ZonePoint");
      double      zoneBearing  = (double)     JOB.GetData("ZoneBearing");
      WsfZone     flankZone    = (WsfZone)    JOB.GetData("FlankZone");
      double      flankDist    = (double)     JOB.GetData("FlankDistance");
      bool        bearingValid = (bool)       JOB.GetData("ZoneBearingValid");

      //determine which side to flank on, based on subordinate that is closest to flank point
      //find closest subordinate & then calculate relative geometry

      WsfPlatform ClosestFlanker;

      if( zonePoint.IsValid() )
      {
         double MinRange = MATH.DOUBLE_MAX();
         double NumSubordinates = (double)(PLATFORM.Subordinates().Count());
         foreach (WsfPlatform sub in PLATFORM.Subordinates())
         {
            double range = sub.SlantRangeTo( zonePoint );
            if( range < MinRange )
            {
               MinRange = range;
               ClosestFlanker = sub;
            }
         }
         if (!ClosestFlanker.IsValid())
         {
            writeln_d("!!!   no valid subordinates to compare to flank point!");
            return -MATH.DOUBLE_MAX();
         }

         double clusterBearingTrue = 0.0;
         if (bearingValid)
         {
            //cluster heading is with reference to east (instead of north), so subtract 90 degrees
            #clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing - 90.0 );
            clusterBearingTrue = MATH.NormalizeAngle0_360( zoneBearing );
         }
         else
         {
            writeln_d("cluster bearing invalid, bearing: ", zoneBearing);
            //assume cluster is flying straight at me, flank to side I'm already oriented towards
            clusterBearingTrue = ClosestFlanker.TrueBearingTo( zonePoint ) - 180.0;
         }

        //don't need to normalize it here, the next line catches it
        double angle = ClosestFlanker.TrueBearingTo( zonePoint ) - 180.0;
        double relativeFlankBearing = MATH.NormalizeAngle0_360( angle - clusterBearingTrue );
        double flankAngle = 90.0;
        if( relativeFlankBearing > 180.0 )
        {
          flankAngle = 270.0;
        }

        if (cPreferredFlank == "left")
        {
          flankAngle = 90.0;
        }
        else if(cPreferredFlank == "right")
        {
          flankAngle = 270.0;
        }

        double flankBearing = MATH.NormalizeAngle0_360( clusterBearingTrue + flankAngle );
        WsfGeoPoint ePoint = WsfGeoPoint(zonePoint);
        ePoint.Extrapolate( flankBearing, flankDist );

        //save off the flank point, in case we win this job
        mFlankJobIdToFlankPointMap.Set( JOB.GetId(), ePoint );

        //find the range to the place we will fly so as to flank the target
        MinRange = ClosestFlanker.SlantRangeTo( ePoint );

        double JobBidValue = 100000 + NumSubordinates * flankDist / MinRange;
        return JobBidValue;
      }
      else
      {
        writeln_d("!!!   Invalid point in flank job");
        return -MATH.DOUBLE_MAX();
      }

   end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, double, bool, else

### query_bid_type（aisc_processor）｜

- **关键词**：query_bid_type, if, return, double
- **出处**：`base_types/processors/ripr_agents/aisc/aisc_processor.txt:270-317`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aifl/aifl_processor.txt:86`、`base_types/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:36`、`behavior_tree/processors/quantum_agents/aifl/behavior_interpret_zone_jobs.txt:36`）
- **片段**：

```text
      query_bid_type zone

        if (!JOB.IsValid())
        {
          writeln_d("aisc query_bid, job invalid!!");
          return -MATH.DOUBLE_MAX();
        }

        //only bid on jobs that ground platforms can perform
        if (((int)JOB.GetData("for_ground")) != 1)
        {
          writeln_d("aisc query_bid, job NOT for ground!");
          return -MATH.DOUBLE_MAX();
        }

        double current_bid = 0;
        writeln_d("aisc query_bid, bidding on ", JOB.Name(), ", desc: ", JOB.GetDescription());
        double maxBid = -MATH.DOUBLE_MAX();

        //iterate over all targets in the zone cluster
        //find out what my subordinates would bid on each of these targets
        //return the best bid from my subordinate on one target as my own bid on the whole cluster of targets
        WsfRIPRJob tempJob = WsfRIPRJob.Create(  PROCESSOR,
                                                 "pursue-zone",
                                                 "pursue-" + JOB.GetDescription(),
                                                 1.0,
                                                 mMaxJobWinners);

        if( !tempJob.IsValid() )
        {
          writeln_d( "AISC query_bid - job, pursue-zone, could not be created" );
          return -MATH.DOUBLE_MAX();
        }

        Array<string> targetNames = (Array<string>)JOB.GetData("ZoneThreatNameArray");
        foreach(string targetName in targetNames)
        {
          tempJob.SetData("targetTrackName", targetName);
          //by default this expands through job-pass-through agents to get all bids
          double curBid = QuerySubordinatesMaxBid(tempJob);
          writeln_d("aisc query_bid, max bid on ", targetName," from subordinates: ", curBid);
          if (curBid > maxBid)
          {
            maxBid = curBid;
          }
        }
        return maxBid;
      end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, return, double

### query_bid_type（aisc_processor）｜

- **关键词**：query_bid_type, if, return
- **出处**：`base_types/processors/ripr_agents/aisc/aisc_processor.txt:253-267`　（同签名共 2 处，另见 `base_types/processors/ripr_agents/aiss/aiss_processor.txt:919`）
- **片段**：

```text
      query_bid_type pursue-target
        if (!JOB.IsValid())
        {
          writeln_d("aisc query_bid, job invalid!!");
          return -MATH.DOUBLE_MAX();
        }

        //only bid on jobs that ground platforms can perform
        if (((int)JOB.GetData("for_ground")) != 1)
        {
          writeln_d("aisc query_bid, job NOT for ground!");
          return -MATH.DOUBLE_MAX();
        }
        return QuerySubordinatesMaxBid(JOB);
      end_query_bid_type
```

- **演示要点**：演示 query_bid_type 的参数：if, return

### repeater（agile_auto-repeater_jamming）｜

- **关键词**：repeater, frequency_following, operating_mode
- **出处**：`electronic_warfare/agile_auto-repeater_jamming.txt:76-80`　（同签名共 7 处，另见 `electronic_warfare/agile_repeater_jamming-rt1.txt:74`、`electronic_warfare/agile_repeater_jamming-rt2.txt:74`、`electronic_warfare/air-to-air-rt1.txt:73`）
- **片段**：

```text
   repeater
      frequency_following    true
      operating_mode         auto
      #debug
   end_repeater
```

- **演示要点**：演示 repeater 的参数：frequency_following, operating_mode

### repeater（agile_repeater_jamming）｜

- **关键词**：repeater, signal_following, operating_mode
- **出处**：`electronic_warfare/agile_repeater_jamming.txt:81-85`　（同签名共 3 处，另见 `electronic_warfare/manual_repeater_jamming.txt:74`、`sensor_plot/radar/hm-repeater-effect.txt:56`）
- **片段**：

```text
   repeater
      signal_following    true
      operating_mode         auto
      #debug
   end_repeater
```

- **演示要点**：演示 repeater 的参数：signal_following, operating_mode

### road_traffic（nkorea_traffic）｜

- **关键词**：road_traffic, network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle
- **出处**：`traffic_demos/scenarios/nkorea_traffic.txt:10-38`　（同签名共 2 处，另见 `traffic_demos/scenarios/stl_traffic.txt:9`）
- **片段**：

```text
road_traffic
  network nkorea_roadnetwork
    vehicle_count              500
    maximum_speed               80 mi/h
    minimum_distance_off_road    0.09 nm
    maximum_distance_off_road    0.11 nm
    pause_time_off_road          0.5 min
    mean_travel_time            40.0 min
    sigma_travel_time            5.0 min

    vehicle CAR
      fraction      0.80
      mean_speed   60 mi/h
      sigma_speed   5 mi/h
    end_vehicle

    vehicle PICKUP_TRUCK
      fraction      0.15
      mean_speed   60 mi/h
      sigma_speed  10 mi/h
    end_vehicle

    vehicle SCHOOL_BUS
      fraction      0.05
      mean_speed   50 mi/h
      sigma_speed  10 mi/h
    end_vehicle
  end_network
end_road_traffic
```

- **演示要点**：演示 road_traffic 的参数：network, vehicle_count, maximum_speed, minimum_distance_off_road, maximum_distance_off_road, pause_time_off_road, mean_travel_time, sigma_travel_time, vehicle

### road_traffic（taiwan_traffic）｜

- **关键词**：road_traffic, network
- **出处**：`traffic_demos/scenarios/taiwan_traffic.txt:58-89`　（同签名共 4 处，另见 `traffic_demos/scenarios/china_traffic.txt:15`、`traffic_demos/scenarios/taiwan_traffic.txt:15`、`traffic_demos/scenarios/korea_traffic.txt:15`）
- **片段**：

```text
road_traffic
   network taiwan_highways

      vehicle_count               200
      maximum_speed               100.0 mi/h
      minimum_distance_off_road     0.1 nm
      maximum_distance_off_road     0.2 nm
      pause_time_off_road           0.01 min
      mean_travel_time              2 hr
      sigma_travel_time             1 hr

      vehicle CAR
         fraction      0.75
         mean_speed   60 mi/h
         sigma_speed   5 mi/h
      end_vehicle

      vehicle PICKUP_TRUCK
         fraction      0.20
         mean_speed   55 mi/h
         sigma_speed  10 mi/h
      end_vehicle

      vehicle SCHOOL_BUS
         fraction      0.05
         mean_speed   50 mi/h
         sigma_speed   5 mi/h
      end_vehicle

  end_network

end_road_traffic
```

- **演示要点**：演示 road_traffic 的参数：network

### scattering（AAA_README）｜

- **关键词**：scattering
- **出处**：`hel/atmosphere/AAA_README.txt:93-94`　（同签名共 27 处，另见 `hel/atmosphere/COEFSxxxx_x.txt:21`、`hel/atmosphere/COEFS1000_1.txt:223`、`hel/atmosphere/COEFS1000_2.txt:223`）
- **片段**：

```text
scattering
end_scattering
```

- **演示要点**：演示 scattering（最小结构，无子参数）

### scheduler（spin_scheduler）｜

- **关键词**：scheduler, scan_period, starting_beam_azimuth, clockwise
- **出处**：`sensor_demos/spin_scheduler.txt:91-95`
- **片段**：

```text
      scheduler spin
         scan_period 30 sec
         starting_beam_azimuth 240 deg
         clockwise true
      end_scheduler
```

- **演示要点**：演示 scheduler 的参数：scan_period, starting_beam_azimuth, clockwise

### sea_traffic（west_coast_sea_traffic）｜

- **关键词**：sea_traffic, port, lane, departure_traffic, local_traffic
- **出处**：`traffic_demos/scenarios/west_coast_sea_traffic.txt:12-166`
- **片段**：

```text
sea_traffic

   // Define the ports
   port port-seattle
      position 48:15:00n 123:00:00w 1 km

      port_route
         position 48:30:00n 125:00:00w 10 km
         position 48:15:00n 124:00:00w  1 km
      end_port_route

      local_traffic_region 48:15:00n 123:00:00w 10 km 0.25
      local_traffic_region 48:10:00n 122:50:00w 10 km 0.25
      local_traffic_region 48:20:00n 122:52:00w 15 km 0.25
      local_traffic_region 48:25:00n 123:10:00w 15 km 0.25

      departure_interval 25 min

      // If you don't want to specify lanes explicitly, use_all_lanes
      // will use all lanes that are defined with this port being
      // one of the endpoints.
      //use_all_lanes

      // Or you can explicity specify which lanes outgoing traffic will travel on.
      lane lane-seattle-to-british-columbia 0.70
      lane lane-seattle-to-baja-mexico      0.30
   end_port

   port port-british-columbia
      position 50:45:00n 127:00:00w 1 km

      port_route
         position 51:00:00n 129:00:00w 10 km
         position 51:00:00n 127:40:00w  1 km
      end_port_route

      local_traffic_region 50:45:00n 127:00:00w 30 km 0.5
      local_traffic_region 50:40:00n 126:45:00w 20 km 0.5

      departure_interval 10 min

      use_all_lanes
   end_port

   port port-baja-mexico
      position 31:40:00n 114:40:00w 1 km

      port_route
         position 22:00:00n 112:00:00w 100 km
         position 22:00:00n 108:00:00w  50 km
         position 28:20:00n 112:20:00w   1 km
         position 28:45:00n 112:45:00w   1 km
         position 29:15:00n 112:45:00w   1 km
      end_port_route

      local_traffic_region 31:40:00n 114:40:00w 30 km 0.4
      local_traffic_region 31:00:00n 113:20:00w 25 km 0.4
      local_traffic_region 31:20:00n 114:40:00w 15 km 0.2

      departure_interval 20 min

      use_all_lanes
   end_port

   port port-seoul
      position 37:54:00n 125:45:00e 1 km

      port_route
         position 37:20:00n 125:40:00e 10 km
      end_port_route

      local_traffic_region 37:54:00n 125:45:00e 60 km 0.4
      local_traffic_region 37:30:00n 126:00:00e 30 km 0.6

      departure_interval 30 min

      use_all_lanes
   end_port

   // Define the shipping lanes
   lane lane-seattle-to-british-columbia
      port port-seattle
      port port-british-columbia

      lane_route
         position 50:00:00n 129:00:00w 50 km
      end_lane_route
   end_lane

   lane lane-seattle-to-baja-mexico
      port port-seattle
      port port-baja-mexico

      lane_route
         position 48:00:00n 125:30:00w 100 km
         position 36:00:00n 126:00:00w 100 km
         position 30:00:00n 120:00:00w 100 km
      end_lane_route
   end_lane

   lane lane-seoul-to-seattle
      port port-seoul
      port port-seattle

      lane_route
         position 34:00:00n 124:00:00e 100 km
         position 29:00:00n 130:00:00e  25 km
         position 30:00:00n 135:00:00e 300 km
         position 40:00:00n 180:00:00e 300 km
         position 48:00:00n 145:00:00w 100 km
      end_lane_route
   end_lane

   // Define the departure traffic
   departure_traffic 0.50
      ship TANKER_SHIP
         fraction     0.50
         mean_speed  20.0 knots
         sigma_speed  5.0 knots
      end_ship

      ship CONTAINER_SHIP
         fraction     0.30
         mean_speed  25.0 knots
         sigma_speed  5.0 knots
      end_ship

      ship LARGE_FISHING_TRAWLER_SHIP
         fraction     0.20
         mean_speed  30.0 knots
         sigma_speed 10.0 knots
      end_ship
   end_departure_traffic

   // Define the local traffic
   local_traffic 0.50
      ship SMALL_FISHING_SHIP
         fraction           0.75
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
      end_ship

      ship JETSKI
         fraction           0.25
         mean_loiter_time  30.0 min
         sigma_loiter_time 10.0 min
         mean_speed        40.0 knots
         sigma_speed       15.0 knots
         loiter_route ship-loiter-route-1
         loiter_route ship-loiter-route-2
      end_ship
   end_local_traffic
end_sea_traffic
```

- **演示要点**：演示 sea_traffic 的参数：port, lane, departure_traffic, local_traffic

### selector（aiai_processor）｜

- **关键词**：selector, behavior_node, sequence
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.txt:115-130`
- **片段**：

```text
      selector
         behavior_node  evade
         behavior_node  go_home
         behavior_node  escort
         behavior_node  cap-route
         behavior_node  pincer_fsm
         sequence
            selector
               behavior_node  pursue-target
              #behavior_node  sar_job
               behavior_node  pursue-point
               behavior_node  default-flight
            end_selector
            behavior_node  guide_weapons
         end_sequence
      end_selector
```

- **演示要点**：演示 selector 的参数：behavior_node, sequence

### selector（brawler_platform）｜

- **关键词**：selector, behavior_node
- **出处**：`base_types/platforms/brawler/brawler_platform.txt:201-204`　（同签名共 28 处，另见 `base_types/processors/quantum_agents/aiww/ww_buddy_tasker.txt:22`、`base_types/processors/ripr_agents/aifl/aifl_processor.txt:55`、`base_types/processors/timeline_agents/timeline_flyer_proc.txt:39`）
- **片段**：

```text
         selector
           behavior_node weapon_decision_gun
           behavior_node weapon_decision_missile
         end_selector
```

- **演示要点**：演示 selector 的参数：behavior_node

### selector（behavior_in_danger）｜

- **关键词**：selector, behavior
- **出处**：`base_types/processors/quantum_agents/aiai/behavior_in_danger.txt:120-123`　（同签名共 4 处，另见 `base_types/processors/ripr_agents/aiai/behavior_in_danger.txt:120`、`base_types/processors/quantum_agents/aiai/behavior_within_visual_range.txt:61`、`base_types/processors/ripr_agents/aiai/behavior_within_visual_range.txt:61`）
- **片段**：

```text
   selector
      behavior    unload            end_behavior
      behavior    force_overshoot   end_behavior
   end_selector
```

- **演示要点**：演示 selector 的参数：behavior

### selector（combined_platform）｜

- **关键词**：selector, parallel
- **出处**：`brawler/platforms/combined_platform.txt:113-172`
- **片段**：

```text
         selector
            parallel
               precondition
                  extern bool mTargetIsWVR;
                  if (mTargetIsWVR == true)
                  {
                     return Failure("Target is WVR, use brawler subtree");
                  }
                  return true;
               end_precondition
               selector
                  behavior_node  evade
                  behavior_node  go_home
                  behavior_node  escort
                  behavior_node  pursue_weapon_task_target
                  behavior_node  planned_route
               end_selector
               behavior_node  engage_weapon_task_target
            end_parallel
            parallel
               precondition
                  #if reach here, then we must have a WVR target
                  return true;
               end_precondition
               #PILOT MANEUVERING DECISION
               priority_selector
                  #debug   #prints precondition score of each selector child behavior
                  behavior_node  alt3111_straight_level_max_speed
                  behavior_node  alt3121_straight_level
                  behavior_node  alt3411_straight_flight
                  behavior_node  alt3421_roll_15_pull
                  behavior_node  alt3431_roll-15_pull
                  behavior_node  alt3441_tail_attack
                  behavior_node  alt3451_pull_gmax_sust
                  behavior_node  alt3471_slow_current_dir
                  behavior_node  alt3472_slow_pull_right
                  behavior_node  alt3473_slow_pull_left
                  behavior_node  alt3474_slow_pull_current_plane
                  behavior_node  alt3511_break_right
                  behavior_node  alt3531_break_left
                  behavior_node  alt3551_run_away
                  behavior_node  alt3561_force_overshoot
                  behavior_node  alt3581_negative_velocity
                 #behavior_node  alt3611_fly_vector
                  behavior_node  alt3841_aim_missile_typ4
                 #behavior_node  alt3211_route_maneuver
                  behavior_node  alt3911_evade_missile
                 #behavior_node  alt3A11_low_speed_recover
                 #behavior_node  alt3A21_low_speed_recover_right45
                 #behavior_node  alt3A31_low_speed_recover_left45
                 #behavior_node  alt3B11_illuminate
                  behavior_node  alt3G11_barrel_roll
               end_priority_selector
               #WEAPON EMPLOYMENT DECISION
               selector
                 behavior_node weapon_decision_gun
                 behavior_node weapon_decision_missile
               end_selector
            end_parallel
         end_selector
```

- **演示要点**：演示 selector 的参数：parallel

### selector_with_memory（selector_with_memory_striker）｜

- **关键词**：selector_with_memory, condition
- **出处**：`behavior_tree/platforms/selector_with_memory_striker.txt:45-49`
- **片段**：

```text
         selector_with_memory
            condition range_under_10000
            condition range_under_50000
            condition range_under_100000
         end_selector_with_memory
```

- **演示要点**：演示 selector_with_memory 的参数：condition

### sequence（brawler_test）｜

- **关键词**：sequence, behavior_node, selector, sequence
- **出处**：`air_to_air/platforms/brawler_test.txt:244-277`　（同签名共 2 处，另见 `air_to_air/platforms/brawler_test.txt:379`）
- **片段**：

```text
         sequence 
            behavior_node rultype //select which RULES type I want

            # *******  PHASE CHANGING LOGIC ********

            selector # execute chosen RULES type
               behavior_node ftr_rules  // brawler rules
               behavior_node route_rules // follow a wsf_route
               behavior_node orbit_rules // cap
               behavior_node intercept_rules // intercept a task track
            end_selector

            selector
//             if rule_type == ftr, these nodes are used
               behavior_node ingress
               behavior_node direct
               behavior_node vectoring
               behavior_node sam_vctr
               behavior_node crank
               behavior_node reaction
               behavior_node pump
               behavior_node pump_in
               behavior_node merge
               behavior_node egress
            end_selector

            # *******  WEAPON EMPLOYMENT DECISION ********

            sequence  # weapon logic
               behavior_node select_wpn     // pair a weapon w/ target track
               behavior_node shoot_it       // loop through shoot list, fire weapon if proper conditions are met
               behavior_node sam_shoot_it   // fire weapon against SAMs if proper conditions are met
            end_sequence
         end_sequence 
```

- **演示要点**：演示 sequence 的参数：behavior_node, selector, sequence

### sequence（run_tree）｜

- **关键词**：sequence, condition, behavior_node
- **出处**：`behavior_tree/run_tree.txt:69-72`　（同签名共 4 处，另见 `behavior_tree/platforms/condition_striker.txt:49`、`behavior_tree/platforms/condition_striker.txt:53`、`behavior_tree/platforms/condition_striker.txt:57`）
- **片段**：

```text
               sequence #return to base
                  condition run_rtb
                  behavior_node rtb
               end_sequence
```

- **演示要点**：演示 sequence 的参数：condition, behavior_node

### sequence（run_tree）｜

- **关键词**：sequence, condition, sequence
- **出处**：`behavior_tree/run_tree.txt:61-68`
- **片段**：

```text
               sequence #fly checkpoints
                  condition run_checkpoints
                  sequence
                     behavior_node fly_checkpoint_1
                     behavior_node fly_checkpoint_2
                     behavior_node fly_checkpoint_3
                  end_sequence
               end_sequence
```

- **演示要点**：演示 sequence 的参数：condition, sequence

### sequence（aiai_processor）｜

- **关键词**：sequence, selector, behavior_node
- **出处**：`base_types/processors/ripr_agents/aiai/aiai_processor.txt:121-129`
- **片段**：

```text
         sequence
            selector
               behavior_node  pursue-target
              #behavior_node  sar_job
               behavior_node  pursue-point
               behavior_node  default-flight
            end_selector
            behavior_node  guide_weapons
         end_sequence
```

- **演示要点**：演示 sequence 的参数：selector, behavior_node

### sequence（decorator_striker）｜

- **关键词**：sequence, behavior_node, decorator
- **出处**：`behavior_tree/platforms/decorator_striker.txt:47-67`
- **片段**：

```text
         sequence
            behavior_node checkpoint_1
            decorator inverter
               behavior_node checkpoint_3
            end_decorator
            decorator succeeder
               behavior_node checkpoint_3
            end_decorator
            behavior_node checkpoint_4
            decorator repeater until_done
               decorator repeater repeat 20
                  behavior_node turn_right
               end_decorator
            end_decorator
            decorator repeater for 5 minutes
                  behavior_node turn_left
            end_decorator
            decorator negator
               behavior_node checkpoint_2
            end_decorator
         end_sequence
```

- **演示要点**：演示 sequence 的参数：behavior_node, decorator

### sequence（state_machine_striker）｜

- **关键词**：sequence, behavior_node
- **出处**：`behavior_tree/platforms/state_machine_striker.txt:69-72`　（同签名共 7 处，另见 `air_to_air/platforms/brawler_test.txt:272`、`air_to_air/platforms/brawler_test.txt:407`、`behavior_tree/run_tree.txt:63`）
- **片段**：

```text
            sequence
               behavior_node blue_checkpoint_1
               behavior_node blue_checkpoint_2
            end_sequence
```

- **演示要点**：演示 sequence 的参数：behavior_node

### sequence（run_tree）｜

- **关键词**：sequence, condition
- **出处**：`behavior_tree/run_tree.txt:51-60`
- **片段**：

```text
               sequence #engage
                  condition run_engage
                     parallel
                        selector
                           behavior_node pursue_weapon_task_target
                           behavior_node planned_route
                        end_selector
                        behavior_node engage_weapon_task_target
                     end_parallel
               end_sequence
```

- **演示要点**：演示 sequence 的参数：condition

### sequence（parallel_striker）｜

- **关键词**：sequence, parallel
- **出处**：`behavior_tree/platforms/parallel_striker.txt:56-72`
- **片段**：

```text
         sequence
            parallel
               success_policy threshold 2
               behavior_node turn_left
               behavior_node speed_450
            end_parallel
            parallel
               success_policy succeed_on_all
               behavior_node wait
               behavior_node speed_100
            end_parallel
            parallel
               success_policy succeed_on_all
               behavior_node turn_right
               behavior_node speed_450
            end_parallel
         end_sequence
```

- **演示要点**：演示 sequence 的参数：parallel

### sequence_with_memory（blackboard_striker）｜

- **关键词**：sequence_with_memory, weighted_random, parallel
- **出处**：`behavior_tree/platforms/blackboard_striker.txt:49-62`
- **片段**：

```text
         sequence_with_memory
            weighted_random
               behavior_node checkpoint_1_task
               behavior_node checkpoint_2_task
               behavior_node checkpoint_3_task
               behavior_node checkpoint_4_task
            end_weighted_random
            parallel
               behavior_node checkpoint_1
               behavior_node checkpoint_2
               behavior_node checkpoint_3
               behavior_node checkpoint_4
            end_parallel
         end_sequence_with_memory
```

- **演示要点**：演示 sequence_with_memory 的参数：weighted_random, parallel

### sequence_with_memory（sequence_with_memory_striker）｜

- **关键词**：sequence_with_memory, behavior_node
- **出处**：`behavior_tree/platforms/sequence_with_memory_striker.txt:47-53`
- **片段**：

```text
         sequence_with_memory
            behavior_node checkpoint_1
            behavior_node checkpoint_2
            behavior_node checkpoint_3
            behavior_node checkpoint_4
            behavior_node checkpoint_5
         end_sequence_with_memory
```

- **演示要点**：演示 sequence_with_memory 的参数：behavior_node

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_nx_below, action_null, sequencer, event_timer, action_shutdown_subobject, action_jett_obj, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1095-1137`
- **片段**：

```text
                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_nx_below, action_null, sequencer, event_timer, action_shutdown_subobject, action_jett_obj, action_change_aero_mode

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_nx_below, action_ignite_subobject, sequencer, event_timer, action_jett_obj, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1076-1140`　（同签名共 3 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1071`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1053`）
- **片段**：

```text
                  sequencer IgniteStage3
                    event_nx_below            0.4 g
                    action_ignite_subobject   Stage3

                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
                  end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_nx_below, action_ignite_subobject, sequencer, event_timer, action_jett_obj, action_change_aero_mode

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_dynamic_pressure_below, action_ignite_subobject, sequencer, event_timer, action_jett_obj, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1068-1142`
- **片段**：

```text
              sequencer  IgniteNosecone
                event_dynamic_pressure_below  2.0 psf
                action_ignite_subobject       Nosecone
                sequencer  JettNosecone
                  event_timer              0.5 sec
                  action_jett_obj          Nosecone
                  action_change_aero_mode  Stage2BurnWithoutNosecone

                  sequencer IgniteStage3
                    event_nx_below            0.4 g
                    action_ignite_subobject   Stage3

                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
                  end_sequencer
                end_sequencer
              end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_dynamic_pressure_below, action_ignite_subobject, sequencer, event_timer, action_jett_obj, action_change_aero_mode

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_ignite_subobject, event_nx_above, action_null, sequencer, event_nx_below
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1022-1148`
- **片段**：

```text
      sequencer Ignition
# no longer used        event_released_from_parent
        event_timer                  0.01 sec

###        action_set_target_LLA          21.321 -157.9266 0.0
#          action_set_target_LLA          35.696111 51.423056 0.0

        action_ignite_subobject       Stage1

#        sequencer
#           name                         IgniteNosecone
##          event_dynamic_pressure_below 10.0
#           event_dynamic_pressure_below 5.0 psf
#           event_above_alt              100000.0 ft
#           all_events
#           action_ignite_subobject      Nosecone
#           sequencer
#             name                       JettNosecone
#             event_timer                0.5 sec
#             action_jett_obj            Nosecone
#           end_sequencer
#        end_sequencer

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

      sequencer FirstStageBurn
        event_nx_above               1.0 g
        action_null

        sequencer IgniteStage2
#         event_timer               33.0 sec
          event_nx_below            0.4 g
          action_ignite_subobject   Stage2
          sequencer JettStage1
            event_timer              0.1 sec
            action_jett_obj          Stage1
            action_change_aero_mode  Stage2BurnWithNosecone
            sequencer JettInterstage12
              event_timer      10.0 sec
              action_jett_obj  Interstage12A
              action_jett_obj  Interstage12B
              action_jett_obj  Interstage12C
              action_jett_obj  Interstage12D

              sequencer  IgniteNosecone
                event_dynamic_pressure_below  2.0 psf
                action_ignite_subobject       Nosecone
                sequencer  JettNosecone
                  event_timer              0.5 sec
                  action_jett_obj          Nosecone
                  action_change_aero_mode  Stage2BurnWithoutNosecone

                  sequencer IgniteStage3
                    event_nx_below            0.4 g
                    action_ignite_subobject   Stage3

                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
                  end_sequencer
                end_sequencer
              end_sequencer
            end_sequencer
          end_sequencer
        end_sequencer
      end_sequencer

      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_ignite_subobject, event_nx_above, action_null, sequencer, event_nx_below

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_released_from_parent, action_change_aero_mode, sequencer, event_timer, action_enable_size_factor
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:595-602`
- **片段**：

```text
      sequencer  BalloonReleased
        event_released_from_parent
        action_change_aero_mode    PostStaging
        sequencer StartInflating
          event_timer            5.0 sec
          action_enable_size_factor
        end_sequencer
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_change_aero_mode, sequencer, event_timer, action_enable_size_factor

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_shutdown_subobject, action_jett_obj, action_change_aero_mode, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1099-1136`
- **片段**：

```text
                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_shutdown_subobject, action_jett_obj, action_change_aero_mode, sequencer

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_jett_obj, sequencer, event_nx_below, action_null
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1084-1138`
- **片段**：

```text
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj, sequencer, event_nx_below, action_null

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_jett_obj, sequencer, event_dynamic_pressure_below, action_ignite_subobject
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1061-1143`
- **片段**：

```text
            sequencer JettInterstage12
              event_timer      10.0 sec
              action_jett_obj  Interstage12A
              action_jett_obj  Interstage12B
              action_jett_obj  Interstage12C
              action_jett_obj  Interstage12D

              sequencer  IgniteNosecone
                event_dynamic_pressure_below  2.0 psf
                action_ignite_subobject       Nosecone
                sequencer  JettNosecone
                  event_timer              0.5 sec
                  action_jett_obj          Nosecone
                  action_change_aero_mode  Stage2BurnWithoutNosecone

                  sequencer IgniteStage3
                    event_nx_below            0.4 g
                    action_ignite_subobject   Stage3

                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
                  end_sequencer
                end_sequencer
              end_sequencer
            end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj, sequencer, event_dynamic_pressure_below, action_ignite_subobject

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_nx_above, action_null, sequencer, event_nx_below, action_ignite_subobject
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1049-1146`
- **片段**：

```text
      sequencer FirstStageBurn
        event_nx_above               1.0 g
        action_null

        sequencer IgniteStage2
#         event_timer               33.0 sec
          event_nx_below            0.4 g
          action_ignite_subobject   Stage2
          sequencer JettStage1
            event_timer              0.1 sec
            action_jett_obj          Stage1
            action_change_aero_mode  Stage2BurnWithNosecone
            sequencer JettInterstage12
              event_timer      10.0 sec
              action_jett_obj  Interstage12A
              action_jett_obj  Interstage12B
              action_jett_obj  Interstage12C
              action_jett_obj  Interstage12D

              sequencer  IgniteNosecone
                event_dynamic_pressure_below  2.0 psf
                action_ignite_subobject       Nosecone
                sequencer  JettNosecone
                  event_timer              0.5 sec
                  action_jett_obj          Nosecone
                  action_change_aero_mode  Stage2BurnWithoutNosecone

                  sequencer IgniteStage3
                    event_nx_below            0.4 g
                    action_ignite_subobject   Stage3

                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
                  end_sequencer
                end_sequencer
              end_sequencer
            end_sequencer
          end_sequencer
        end_sequencer
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_nx_above, action_null, sequencer, event_nx_below, action_ignite_subobject

### sequencer（agm-mrc）｜

- **关键词**：sequencer, event_released_from_parent, action_ignite_engine, action_disable_controls, sequencer
- **出处**：`p6dof/p6dof_types/weapons/agm-mrc/agm-mrc.txt:77-85`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/agm-mrc.txt:77`、`six_dof/six_dof_types/weapons/agm-mrc/agm-mrc.txt:136`）
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_engine Engine
         action_disable_controls         
         sequencer WaitToControl
            event_timer             6 s
            action_enable_controls 
         end_sequencer         
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_ignite_engine, action_disable_controls, sequencer

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_ignite_subobject, sequencer, action_jett_obj
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1180-1190`
- **片段**：

```text
      sequencer  IgniteICBM
        event_timer                        3.0 sec
#       event_manual_input_button_released 10
        action_ignite_subobject            ICBM_Stage1

        sequencer  ReleaseICBM
          event_timer      0.5 sec
          action_jett_obj  ICBM
        end_sequencer

      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_ignite_subobject, sequencer, action_jett_obj

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_jett_obj, action_change_aero_mode, sequencer
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1080-1139`　（同签名共 2 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1057`）
- **片段**：

```text
                    sequencer  JettStage2
                      event_timer              0.1 sec
                      action_jett_obj          Stage2
                      action_change_aero_mode  Stage3BurnWithoutNosecone
                      sequencer JettInterstage23
                        event_timer       2.0 sec
                        action_jett_obj   Interstage23A
                        action_jett_obj   Interstage23B
                        action_jett_obj   Interstage23C
                        action_jett_obj   Interstage23D

# 60.1 sec nominal burn time
# 63.4 sec nominal burn time
# 59.0 sec nominal burn time

                        sequencer JettStage3a
                          event_nx_below  0.05 g
                          action_null

                          sequencer  JettStage3b
                            event_timer                3.0 sec
                            action_shutdown_subobject  Stage3
                            action_jett_obj            Stage3

                            action_change_aero_mode    PBVBurn
#                           action_ignite_subobject    PBV

#                            sequencer
#                              name                       TerminatePBVBurn
#                              event_timer                10.0 sec
#                              action_shutdown_subobject  PBV
#                            end_sequencer

                            sequencer  JettBalloon1
                              event_timer      12.0 sec
                              action_jett_obj  Balloon1
                            end_sequencer
                            sequencer  JettBalloon2
                              event_timer      14.0 sec
                              action_jett_obj  Balloon2
                            end_sequencer
                            sequencer JettBalloon3
                              event_timer      16.0 sec
                              action_jett_obj  Balloon3
                            end_sequencer
                            sequencer JettBalloon4
                              event_timer      18.0 sec
                              action_jett_obj  Balloon4
                            end_sequencer

                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer

                          end_sequencer
                        end_sequencer
                      end_sequencer
                    end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj, action_change_aero_mode, sequencer

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_jett_obj, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:1130-1134`
- **片段**：

```text
                            sequencer JettRV
                              event_timer              22.0 sec
                              action_jett_obj          PBV
                              action_change_aero_mode  RVFree
                            end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj, action_change_aero_mode

### sequencer（ubu-500-hd）｜

- **关键词**：sequencer, event_timer, action_change_aero_mode, action_set_graphical_model
- **出处**：`p6dof/p6dof_types/weapons/ubu-500/ubu-500-hd.txt:37-41`
- **片段**：

```text
         sequencer DeployHighDrag
            event_timer                   1.0 sec
            action_change_aero_mode       WithBallute
            action_set_graphical_model    1
         end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_change_aero_mode, action_set_graphical_model

### sequencer（orbiter-main）｜

- **关键词**：sequencer, event_nx_below, action_jett_obj, action_ignite_engine
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:78-84`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:85`、`six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:150`）
- **片段**：

```text
      sequencer BoosterExpended
         event_nx_below  0.0 g
         
         action_jett_obj BoosterStage
         #action_enable_controls 
         action_ignite_engine Engine
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_nx_below, action_jett_obj, action_ignite_engine

### sequencer（a-lgt-bombs）｜

- **关键词**：sequencer, event_timer, action_jett_obj, sequencer
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:98-105`　（同签名共 4 处，另见 `p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:95`、`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:92`、`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:89`）
- **片段**：

```text
                  sequencer AttackDropBombs5
                     event_timer                    0.15 sec
                     action_jett_obj                LD_Bomb5
                     sequencer AttackDropBombs6
                        event_timer                    0.15 sec
                        action_jett_obj                LD_Bomb6
                     end_sequencer
                  end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj, sequencer

### sequencer（fa-lgt-bombs-hd）｜

- **关键词**：sequencer, event_null, action_jett_obj, sequencer
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-hd.txt:179-186`　（同签名共 7 处，另见 `p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:175`、`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:206`、`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-bombs-hd.txt:209`）
- **片段**：

```text
      sequencer DropLowDragBombs
         event_null //Force this sequencer to be activated via script
         action_jett_obj                  LD_Bomb1
         sequencer DropSecondLowDropBomb
           event_timer                    0.15 sec
           action_jett_obj                LD_Bomb2
         end_sequencer
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_null, action_jett_obj, sequencer

### sequencer（a-lgt-bombs）｜

- **关键词**：sequencer, event_timer, action_jett_obj
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:101-104`　（同签名共 36 处，另见 `p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:179`、`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:209`、`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:213`）
- **片段**：

```text
                     sequencer AttackDropBombs6
                        event_timer                    0.15 sec
                        action_jett_obj                LD_Bomb6
                     end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_obj

### sequencer（fa-lgt-zll）｜

- **关键词**：sequencer, event_timer, action_ignite_subobject
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:49-52`　（同签名共 3 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:49`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:86`）
- **片段**：

```text
      sequencer  IgniteZellRocket
         event_timer                 4.9 sec
         action_ignite_subobject     ZellRocket
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_ignite_subobject

### sequencer（fa-lgt-zll）｜

- **关键词**：sequencer, event_timer, action_jett_self
- **出处**：`p6dof/p6dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:54-57`　（同签名共 3 处，另见 `six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:54`、`six_dof/six_dof_types/aircraft/fa-lgt/fa-lgt-zll.txt:91`）
- **片段**：

```text
      sequencer  Launch
         event_timer                 5 sec
         action_jett_self
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_jett_self

### sequencer（srb-rato）｜

- **关键词**：sequencer, event_released_from_parent, action_ignite_engine
- **出处**：`p6dof/p6dof_types/misc/srb-rato/srb-rato.txt:57-60`　（同签名共 19 处，另见 `p6dof/p6dof_types/weapons/aam-mr/aam-mr.txt:59`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr-tvc.txt:59`、`p6dof/p6dof_types/weapons/aam-sr/aam-sr.txt:59`）
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_engine Engine
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_ignite_engine

### sequencer（agm-mrc）｜

- **关键词**：sequencer, event_timer, action_enable_controls
- **出处**：`p6dof/p6dof_types/weapons/agm-mrc/agm-mrc.txt:81-84`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/agm-mrc/agm-mrc.txt:81`、`six_dof/six_dof_types/weapons/agm-mrc/agm-mrc.txt:140`）
- **片段**：

```text
         sequencer WaitToControl
            event_timer             6 s
            action_enable_controls 
         end_sequencer         
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_enable_controls

### sequencer（gbu-500）｜

- **关键词**：sequencer, event_released_from_parent, action_null
- **出处**：`p6dof/p6dof_types/weapons/gbu-500/gbu-500.txt:38-41`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/gbu-500/gbu-500.txt:37`、`six_dof/six_dof_types/weapons/gbu-500/gbu-500.txt:56`）
- **片段**：

```text
      sequencer Release
         event_released_from_parent
         action_null
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_null

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_released_from_parent, action_change_aero_mode
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:43-46`　（同签名共 14 处，另见 `p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:70`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:95`、`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:120`）
- **片段**：

```text
      sequencer NewAeroAtStaging
        event_released_from_parent
        action_change_aero_mode     PostStaging
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_change_aero_mode

### sequencer（simple-icbm）｜

- **关键词**：sequencer, event_timer, action_enable_size_factor
- **出处**：`p6dof/p6dof_types/weapons/simple-icbm/simple-icbm.txt:598-601`
- **片段**：

```text
        sequencer StartInflating
          event_timer            5.0 sec
          action_enable_size_factor
        end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_enable_size_factor

### sequencer（lrm-1-c）｜

- **关键词**：sequencer, event_released_from_parent, action_disable_controls
- **出处**：`six_dof/six_dof_types/weapons/lrm-1-c/lrm-1-c.txt:73-76`
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_disable_controls
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_disable_controls

### sequencer（ubu-500-hd）｜

- **关键词**：sequencer, event_timer, action_change_aero_mode
- **出处**：`six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:38-41`　（同签名共 2 处，另见 `six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:58`）
- **片段**：

```text
         sequencer DeployHighDrag
            event_timer                   1.0 sec
            action_change_aero_mode       WithBallute
         end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer, action_change_aero_mode

### sequencer（orbiter-main）｜

- **关键词**：sequencer, event_released_from_parent, action_ignite_subobject
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-main/orbiter-main.txt:72-76`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:79`、`six_dof/six_dof_types/weapons/lrm-1-a/lrm-1-a.txt:144`）
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_released_from_parent
         action_ignite_subobject BoosterStage
         #action_disable_controls
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, action_ignite_subobject

### sequencer（ubu-500-hd）｜

- **关键词**：sequencer, event_released_from_parent, sequencer
- **出处**：`six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:36-42`　（同签名共 3 处，另见 `six_dof/six_dof_types/weapons/ubu-500/ubu-500-hd.txt:56`、`p6dof/p6dof_types/weapons/ubu-500/ubu-500-hd.txt:35`）
- **片段**：

```text
      sequencer Release
         event_released_from_parent
         sequencer DeployHighDrag
            event_timer                   1.0 sec
            action_change_aero_mode       WithBallute
         end_sequencer
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent, sequencer

### sequencer（a-lgt-bombs）｜

- **关键词**：sequencer, action_jett_obj, sequencer
- **出处**：`p6dof/p6dof_types/aircraft/a-lgt/a-lgt-bombs.txt:87-109`
- **片段**：

```text
      sequencer AttackDropBombs
         action_jett_obj                LD_Bomb1
         sequencer AttackDropBombs2
            event_timer                    0.15 sec
            action_jett_obj                LD_Bomb2
            sequencer AttackDropBombs3
               event_timer                    0.15 sec
               action_jett_obj                LD_Bomb3
               sequencer AttackDropBombs4
                  event_timer                    0.15 sec
                  action_jett_obj                LD_Bomb4
                  sequencer AttackDropBombs5
                     event_timer                    0.15 sec
                     action_jett_obj                LD_Bomb5
                     sequencer AttackDropBombs6
                        event_timer                    0.15 sec
                        action_jett_obj                LD_Bomb6
                     end_sequencer
                  end_sequencer
               end_sequencer
            end_sequencer
         end_sequencer
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：action_jett_obj, sequencer

### sequencer（b-fw-bombs）｜

- **关键词**：sequencer, action_jett_obj
- **出处**：`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:186-188`　（同签名共 33 处，另见 `p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:189`、`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:192`、`p6dof/p6dof_types/aircraft/b-fw/b-fw-bombs.txt:195`）
- **片段**：

```text
      sequencer HD_DropBomb1
         action_jett_obj                HD_Bomb1
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：action_jett_obj

### sequencer（orbiter-booster）｜

- **关键词**：sequencer, event_timer
- **出处**：`six_dof/six_dof_types/spacecraft/orbiter-booster/orbiter-booster.txt:64-66`
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_timer 0 s
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_timer

### sequencer（lrm-1-c）｜

- **关键词**：sequencer, event_released_from_parent
- **出处**：`six_dof/six_dof_types/weapons/lrm-1-c/lrm-1-c.txt:124-126`
- **片段**：

```text
      sequencer ReleaseFromVehicle
         event_released_from_parent
      end_sequencer
```

- **演示要点**：演示 sequencer 的参数：event_released_from_parent

### slot_group（jtids）｜

- **关键词**：slot_group, slots_per_frame
- **出处**：`l16_j11/jtids.txt:13-15`
- **片段**：

```text
   slot_group WEAPON_GRP
      slots_per_frame 512
   end_slot_group
```

- **演示要点**：演示 slot_group 的参数：slots_per_frame

### solar_characteristics（oth_radar）｜

- **关键词**：solar_characteristics, day_of_year, hour_of_day
- **出处**：`oth_radar/sensors/radar/oth_radar.txt:28-31`
- **片段**：

```text
  solar_characteristics
    day_of_year                182
    hour_of_day                12
  end_solar_characteristics
```

- **演示要点**：演示 solar_characteristics 的参数：day_of_year, hour_of_day

### spectrum_data（acoustic_demo2）｜

- **关键词**：spectrum_data
- **出处**：`acoustic/acoustic_demo2.txt:170-172`　（同签名共 7 处，另见 `acoustic/acoustic_demo2.txt:14`、`acoustic/acoustic_demo2.txt:35`、`acoustic/acoustic_demo2.txt:56`）
- **片段**：

```text
   spectrum_data
        freq    31.5 hz   noise_pressure 20.3 dB_20uPa
   end_spectrum_data
```

- **演示要点**：演示 spectrum_data（最小结构，无子参数）

### technique（simple_auto_jamming）｜

- **关键词**：technique, mitigation_class_name, default_on, effect, debug
- **出处**：`electronic_warfare/simple_auto_jamming.txt:81-88`
- **片段**：

```text
         technique noise_jamming
         debug
            mitigation_class_name NOISE_JAMMING
            default_on
            effect power_effect WSF_JAMMER_POWER_EFFECT
            debug
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：mitigation_class_name, default_on, effect, debug

### technique（agile_repeater_jamming）｜

- **关键词**：technique, default_on, mitigation_class_name, effect
- **出处**：`electronic_warfare/agile_repeater_jamming.txt:93-98`　（同签名共 10 处，另见 `electronic_warfare/air-to-air-rt1.txt:85`、`electronic_warfare/air-to-air-rt2.txt:85`、`electronic_warfare/slc_slb_script_jamming.txt:48`）
- **片段**：

```text
         technique noise_jamming
            default_on
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：default_on, mitigation_class_name, effect

### technique · WSF_EA_TECHNIQUE｜

- **关键词**：technique, WSF_EA_TECHNIQUE, debug, mitigation_class_name, effect
- **出处**：`electronic_warfare/false-target_jamming_2.txt:46-54`　（同签名共 3 处，另见 `electronic_warfare/false-target_jamming_3.txt:51`、`electronic_warfare/false-target_jamming_4.txt:49`）
- **片段**：

```text
   technique false_target_jamming WSF_EA_TECHNIQUE
      debug
      mitigation_class_name false_target_jamming
      effect ft_effect WSF_FALSE_TARGET_EFFECT
         jamming_pulse_density 0.1
         false_target_name FALSE_TARGET
         scan_rate_multiplier 5
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EA_TECHNIQUE 的参数：debug, mitigation_class_name, effect

### technique（track_error）｜

- **关键词**：technique, default_on, mitigated_techniques, effect
- **出处**：`electronic_warfare/track_error.txt:208-219`　（同签名共 4 处，另见 `electronic_warfare/false-target_command_center.txt:166`、`electronic_warfare/repeater_jamming.txt:190`、`electronic_warfare/simple_ft_jamming.txt:142`）
- **片段**：

```text
         technique
            default_on
            mitigated_techniques
               track_error_inducement
            end_mitigated_techniques
            effect mitigate_track_error WSF_TRACK_EFFECT
               track_behavior distort
               range_error     50   m
               azimuth_error    0.5 deg
               elevation_error  1   deg
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：default_on, mitigated_techniques, effect

### technique · WSF_EP_TECHNIQUE｜

- **关键词**：technique, WSF_EP_TECHNIQUE, externally_controlled, mitigated_technique_classes, effect
- **出处**：`aea_iads/sensors/radar/ew_radar.txt:35-52`　（同签名共 2 处，另见 `aea_iads/sensors/radar/ew_radar.txt:54`）
- **片段**：

```text
   technique sidelobe_canceling WSF_EP_TECHNIQUE
      externally_controlled
      mitigated_technique_classes
         noise_jamming
      end_mitigated_technique_classes
      effect sidelobe_cancelation WSF_SLC_EFFECT
         number_canceler_channels 2
         cancelation_lock_ratio   2 dB
         auxiliary_antenna_pattern EW_RADAR_AUX_ANTENNA
         cancelation_ratios
            jammer_to_noise         0.0 db   0.0 db
            jammer_to_noise        15.0 db  10.0 db
            jammer_to_noise        30.0 db  20.0 db
            saturation_ratio       10.0 dB
         end_cancelation_ratios
        receiver_noise_power_gain 3.0 db
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EP_TECHNIQUE 的参数：externally_controlled, mitigated_technique_classes, effect

### technique（slc_slb_script_jamming）｜

- **关键词**：technique, externally_controlled, mitigated_technique_classes, effect
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:157-175`
- **片段**：

```text
         technique sidelobe_cancelation
            externally_controlled
            mitigated_technique_classes
               NOISE_JAMMING
            end_mitigated_technique_classes

            effect slc_effect WSF_SLC_EFFECT
               debug
               number_canceller_channels  2
               cancellation_lock_ratio    3 dB
               antenna_pattern            AUX_ANTENNA
               cancellation_ratios
                  jammer_to_noise   0.0 db  0.0 db
                  jammer_to_noise  15.0 db 10.0 db
                  jammer_to_noise  30.0 db 20.0 db
                  saturation_ratio 10.0 dB
               end_cancellation_ratios
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：externally_controlled, mitigated_technique_classes, effect

### technique · WSF_EP_TECHNIQUE｜

- **关键词**：technique, WSF_EP_TECHNIQUE, mitigated_techniques, effect, target_blanking_effect
- **出处**：`electronic_warfare/cover_pulse_jamming.txt:90-111`　（同签名共 2 处，另见 `electronic_warfare/jtos_power.txt:89`）
- **片段**：

```text
   technique sensor_sidelobe_blanker WSF_EP_TECHNIQUE
      mitigated_techniques
         false_targets
      end_mitigated_techniques
      effect slb_effect WSF_SLB_EFFECT
         antenna_pattern      AUX_ANTENNA
         blanking_threshold 0 dB
         saturation_effect
            duty_cycle_limit_effect
            duty_cycle_limit 0.5
       end_saturation_effect
       target_blanking_effect
          probabilities
             pulse_density 0.0 0.0
             pulse_density 0.1 0.2
             pulse_density 0.3 0.6
             pulse_density 0.5 0.8
             pulse_density 1.0 1.0
           end_probabilities
         end_target_blanking_effect
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EP_TECHNIQUE 的参数：mitigated_techniques, effect, target_blanking_effect

### technique（manual_repeater_jamming）｜

- **关键词**：technique, mitigation_class_name, effect
- **出处**：`electronic_warfare/manual_repeater_jamming.txt:86-90`　（同签名共 9 处，另见 `electronic_warfare/agile_auto-repeater_jamming.txt:88`、`electronic_warfare/agile_repeater_jamming-rt1.txt:86`、`electronic_warfare/agile_repeater_jamming-rt2.txt:86`）
- **片段**：

```text
         technique noise_jamming
            mitigation_class_name NOISE_JAMMING
            effect power_effect WSF_JAMMER_POWER_EFFECT
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：mitigation_class_name, effect

### technique（jam_strobe_direction_finder）｜

- **关键词**：technique, default_on, effect
- **出处**：`electronic_warfare/jam_strobe_direction_finder.txt:162-166`　（同签名共 7 处，另见 `electronic_warfare/jam_strobe_tracking.txt:49`、`electronic_warfare/false-target_command_center.txt:87`、`electronic_warfare/pol_mod_jamming.txt:61`）
- **片段**：

```text
         technique noise_jamming
            default_on
            effect noise_power_effect WSF_POWER_EFFECT
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：default_on, effect

### technique · WSF_EA_TECHNIQUE｜

- **关键词**：technique, WSF_EA_TECHNIQUE, mitigation_class, effect
- **出处**：`aea_iads/weapons/jammer/soj_base_jammer.txt:17-22`　（同签名共 10 处，另见 `alv_routing/weapons/alv_jammer.txt:24`、`electronic_warfare/comm_jamming.txt:217`、`satellite_demos/scenarios/gps_denied.txt:235`）
- **片段**：

```text
   technique noise_jamming WSF_EA_TECHNIQUE
      mitigation_class noise_jamming
      effect noise_effect WSF_POWER_EFFECT
         jamming_delta_gain 0 dB
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EA_TECHNIQUE 的参数：mitigation_class, effect

### technique · WSF_EA_TECHNIQUE｜

- **关键词**：technique, WSF_EA_TECHNIQUE, mitigation_class_name, effect
- **出处**：`electronic_warfare/agile_jamming.txt:68-74`　（同签名共 10 处，另见 `electronic_warfare/spot_jamming.txt:55`、`sensor_demos/bistatic_sp_false_target_jamming_demo.txt:17`、`sensor_demos/bistatic_support_false_target_jamming_demo.txt:17`）
- **片段**：

```text
   technique noise_jamming WSF_EA_TECHNIQUE
      #debug
      mitigation_class_name noise_jamming
      effect power_effect WSF_POWER_EFFECT
         #debug
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EA_TECHNIQUE 的参数：mitigation_class_name, effect

### technique（soj_xband_jammer）｜

- **关键词**：technique, effect, debug
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:68-74`　（同签名共 2 处，另见 `electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:76`）
- **片段**：

```text
         technique false_targets
            effect ft_effect WSF_FALSE_TARGET_EFFECT
            debug
               //jamming_pulse_density 0.01
               false_target_technique FALSE_TARGET_1
            end_effect
        end_technique
```

- **演示要点**：演示 technique 的参数：effect, debug

### technique · WSF_EP_TECHNIQUE｜

- **关键词**：technique, WSF_EP_TECHNIQUE, mitigated_techniques, effect
- **出处**：`aea_iads/sensors/radar/acq_radar.txt:25-32`　（同签名共 3 处，另见 `electronic_warfare/comm_jamming.txt:64`、`electronic_warfare/track_drop_maintain_effect.txt:95`）
- **片段**：

```text
   technique pulse_suppression WSF_EP_TECHNIQUE
      mitigated_techniques
         random_pulse_jamming
      end_mitigated_techniques
      effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
         reject pulses 0.05
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EP_TECHNIQUE 的参数：mitigated_techniques, effect

### technique · WSF_EP_TECHNIQUE｜

- **关键词**：technique, WSF_EP_TECHNIQUE, mitigated_technique_classes, effect
- **出处**：`electronic_warfare/false-target_jamming_1.txt:116-123`　（同签名共 11 处，另见 `electronic_warfare/ft_track_plot.txt:351`、`aea_iads/sensors/radar/ew_radar.txt:73`、`electronic_warfare/agile_jamming.txt:212`）
- **片段**：

```text
   technique signal_gain WSF_EP_TECHNIQUE
      mitigated_technique_classes
         false_target_jamming
      end_mitigated_technique_classes
      effect signal_gain_effect WSF_POWER_EFFECT
         signal_power_gain 3.0 db
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EP_TECHNIQUE 的参数：mitigated_technique_classes, effect

### technique（acq_radar）｜

- **关键词**：technique, mitigated_techniques, effect
- **出处**：`electronic_warfare/test_false_targets/sensors/radar/acq_radar.txt:64-71`　（同签名共 6 处，另见 `electronic_warfare/test_multi_beam/sensors/radar/ew_radar.txt:65`、`electronic_warfare/jam_strobe_tracking.txt:119`、`electronic_warfare/test_false_targets/sensors/radar/ew_radar.txt:71`）
- **片段**：

```text
         technique pulse_suppression
            mitigated_techniques
               random_pulse_jamming
            end_mitigated_techniques
            effect ps_effect WSF_PULSE_SUPPRESS_EFFECT
               reject pulses 0.05
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：mitigated_techniques, effect

### technique（air-to-air-rt1）｜

- **关键词**：technique, mitigated_technique_classes, effect
- **出处**：`electronic_warfare/air-to-air-rt1.txt:270-280`　（同签名共 14 处，另见 `electronic_warfare/air-to-air-rt2.txt:270`、`electronic_warfare/agile_auto-repeater_jamming.txt:173`、`electronic_warfare/semi-auto_repeater_jamming_1.txt:244`）
- **片段**：

```text
            technique agility
               mitigated_technique_classes
                  NOISE_JAMMING
                  FALSE_TARGET_JAMMING
               end_mitigated_technique_classes
               effect agility_effect WSF_AGILITY_EFFECT
                  #debug
                  agility_type frequency_changing
                  end_agility_type
               end_effect
            end_technique
```

- **演示要点**：演示 technique 的参数：mitigated_technique_classes, effect

### technique（false-target_jamming_1）｜

- **关键词**：technique, default_on
- **出处**：`electronic_warfare/false-target_jamming_1.txt:61-63`　（同签名共 12 处，另见 `electronic_warfare/false-target_jamming_2.txt:65`、`electronic_warfare/false-target_jamming_3.txt:70`、`electronic_warfare/false-target_jamming_4.txt:68`）
- **片段**：

```text
         technique false_target_jamming
            default_on
         end_technique
```

- **演示要点**：演示 technique 的参数：default_on

### technique（soj_xband_jammer）｜

- **关键词**：technique, effect
- **出处**：`electronic_warfare/test_false_targets/weapons/jammer/soj_xband_jammer.txt:63-67`　（同签名共 6 处，另见 `electronic_warfare/test_multi_beam/weapons/jammer/soj_sband_jammer.txt:44`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_vhf_jammer.txt:34`、`electronic_warfare/test_multi_beam/weapons/jammer/soj_xband_jammer.txt:45`）
- **片段**：

```text
        technique noise_jamming
           effect noise_effect WSF_JAMMER_POWER_EFFECT
              jamming_delta_gain 0 dB
           end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：effect

### technique · WSF_EA_TECHNIQUE｜

- **关键词**：technique, WSF_EA_TECHNIQUE, effect
- **出处**：`electronic_warfare/track_drop_maintain_effect.txt:38-47`
- **片段**：

```text
   technique drop_track_technique WSF_EA_TECHNIQUE
      effect drop_track_effect WSF_TRACK_EFFECT
         debug
         track_behavior drop
         required_j_to_s 2.0 dB
         #maintain_drop_delay_time   5 sec
         #maintain_drop_holdout_time 10 sec
         #maintain_drop_recycle     true
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EA_TECHNIQUE 的参数：effect

### technique · WSF_EP_TECHNIQUE｜

- **关键词**：technique, WSF_EP_TECHNIQUE, drop_track_technique
- **出处**：`electronic_warfare/track_effect_1.txt:85-94`
- **片段**：

```text
      technique mitigate_drop_track_technique WSF_EP_TECHNIQUE
      #debug
      mitigated_technique_classes
         drop_track_technique
      end_mitigated_technique_classes
      effect track_mitigate_effect WSF_TRACK_EFFECT
         #debug
           track_behavior maintain
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EP_TECHNIQUE 的参数：drop_track_technique

### technique（slc_slb_script_jamming）｜

- **关键词**：technique, debug
- **出处**：`electronic_warfare/slc_slb_script_jamming.txt:130-155`
- **片段**：

```text
         technique sidelobe_blanking
         externally_controlled
         mitigated_technique_classes
            FALSE_TARGET_JAMMING
         end_mitigated_technique_classes

         effect slb_effect WSF_SLB_EFFECT
            debug
               antenna_pattern    AUX_ANTENNA
               blanking_threshold 3 dB
               saturation_effect
                  no_saturation_effect
                  duty_cycle_limit_effect
                  duty_cycle_limit 0.8
               end_saturation_effect
               target_blanking_effect
                  probabilities
                     pulse_density 0.0 0.0
                     pulse_density 0.1 0.2
                     pulse_density 0.3 0.6
                     pulse_density 0.5 0.8
                     pulse_density 1.0 1.0
                  end_probabilities
               end_target_blanking_effect
            end_effect
         end_technique
```

- **演示要点**：演示 technique 的参数：debug

### technique（agile_jamming）｜

- **关键词**：technique
- **出处**：`electronic_warfare/agile_jamming.txt:84-85`　（同签名共 3 处，另见 `electronic_warfare/cover_pulse_jamming.txt:62`、`electronic_warfare/jtos_power.txt:61`）
- **片段**：

```text
         technique noise_jamming
         end_technique
```

- **演示要点**：演示 technique（最小结构，无子参数）

### technique · WSF_EA_TECHNIQUE｜

- **关键词**：technique, WSF_EA_TECHNIQUE
- **出处**：`electronic_warfare/track_effect_1.txt:38-53`
- **片段**：

```text
   technique drop_track_technique WSF_EA_TECHNIQUE
      #debug
        effect ea_effect WSF_TRACK_EFFECT
         debug
          track_behavior distort
          required_j_to_s 2 dB
          range_error 0 km
          range_walkoff_rate 0.5 km/s
          range_holdout_time 6 sec
          range_recycle true
          azimuth_error 0 deg
          #azimuth_walkoff_rate 0.1 deg/s
          elevation_error 0 deg
          #elevation_walkoff_rate 0.01 deg/s
      end_effect
   end_technique
```

- **演示要点**：演示 WSF_EA_TECHNIQUE（最小结构，无子参数）

### term（space_mover）｜

- **关键词**：term, cross_sectional_area, drag_coefficient, atmosphere_model
- **出处**：`multiresolution_demos/movers/space_mover.txt:27-31`　（同签名共 2 处，另见 `satellite_demos/aerobraking_demo.txt:53`）
- **片段**：

```text
            term atmospheric_drag
               cross_sectional_area 1.0 m^2
               drag_coefficient 1.0e-6
               atmosphere_model basic
            end_term
```

- **演示要点**：演示 term 的参数：cross_sectional_area, drag_coefficient, atmosphere_model

### term（space_mover）｜

- **关键词**：term, egm96
- **出处**：`multiresolution_demos/movers/space_mover.txt:32-34`　（同签名共 2 处，另见 `multiresolution_demos/movers/space_mover.txt:35`）
- **片段**：

```text
            term earth_monopole
               egm96
            end_term
```

- **演示要点**：演示 term 的参数：egm96

### term（space_mover）｜

- **关键词**：term, interpolation_interval
- **出处**：`multiresolution_demos/movers/space_mover.txt:40-42`
- **片段**：

```text
            term moon_monopole
               interpolation_interval 100.0 s
            end_term
```

- **演示要点**：演示 term 的参数：interpolation_interval

### term（orbiter）｜

- **关键词**：term
- **出处**：`cislunar/scenarios/orbiter.txt:42-43`　（同签名共 5 处，另见 `cislunar/scenarios/orbiter.txt:47`、`multiresolution_demos/movers/space_mover.txt:38`、`multiresolution_demos/movers/space_mover.txt:43`）
- **片段**：

```text
         term earth_monopole
         end_term
```

- **演示要点**：演示 term（最小结构，无子参数）

### terrain（uav_coverage_terrain）｜地形

- **关键词**：terrain, raw_dted, 地形
- **出处**：`coverage_demos/terrain/uav_coverage_terrain.txt:12-14`　（同签名共 7 处，另见 `hellfire/active_radar_hellfire/rf_autonomous_test.txt:22`、`hellfire/laser_designation_via_dis/ldt_designator_only.txt:22`、`hellfire/laser_designation_via_dis/ldt_shooter_only.txt:22`）
- **片段**：

```text
terrain
   raw_dted 2 dted 39 -107 40 -106
end_terrain
```

- **演示要点**：演示 terrain 的参数：raw_dted

### terrain（terrain）｜地形

- **关键词**：terrain, dted, 地形
- **出处**：`laser_designator/terrain.txt:9-11`　（同签名共 2 处，另见 `orwaca_iads/terrain.txt:15`）
- **片段**：

```text
terrain
   dted 1  d:\AFSIM\dted1\dted115
end_terrain
```

- **演示要点**：演示 terrain 的参数：dted

### terrain（terrain_config）｜地形

- **关键词**：terrain, region, 地形
- **出处**：`air_to_air/six_dof_types/environment/terrain_config.txt:10-52`　（同签名共 3 处，另见 `six_dof/six_dof_types/environment/terrain_config.txt:10`、`six_dof_with_brawler/six_dof_types/environment/terrain_config.txt:10`）
- **片段**：

```text
terrain

   region
      # Oahu, HI

      location
         # Honolulu Intl, PHNL
         lat    21.3178275
         lon  -157.92026310
         alt_ft  5.0
      end_location

      location
         # Kalaeloa, PHJR
         lat    21.3073539
         lon  -158.0703017
         alt_ft 30.0
      end_location

      location
         # Kaneohe Bay MCAS, PHNG
         lat    21.4504556
         lon  -157.7679486
         alt_ft 24.0
      end_location

      location
         # Wheeler AFB, HHI/PHHI
         lat     21.4814475
         lon   -158.0378379
         alt_ft 843.0
      end_location

      location
         # Dillingham, PHDH
         lat    21.5794736
         lon  -158.1972814
         alt_ft 14.0
      end_location

   end_region

end_terrain
```

- **演示要点**：演示 terrain 的参数：region

### terrain（terrain）｜地形

- **关键词**：terrain, 地形
- **出处**：`aea_iads/terrain.txt:11-13`　（同签名共 66 处，另见 `ballistic/terrain.txt:11`、`cyber/exfiltrate_demo/terrain.txt:11`、`draw/draw_demo.txt:230`）
- **片段**：

```text
terrain
  #no terrain for now
end_terrain
```

- **演示要点**：演示 terrain（最小结构，无子参数）

### test（test_qd）｜

- **关键词**：test, target_altitude, target_to_sensor_range, target_to_sensor_azimuth, target_to_sensor_elevation
- **出处**：`sosm/test_mission/query_detect/test_qd.txt:23-28`
- **片段**：

```text
   test query_detect
      target_altitude                  30000 ft
      target_to_sensor_range           26.0960 km
      target_to_sensor_azimuth         0.0 deg
      target_to_sensor_elevation       0.0 deg
   end_test
```

- **演示要点**：演示 test 的参数：target_altitude, target_to_sensor_range, target_to_sensor_azimuth, target_to_sensor_elevation

### test（test_qa）｜

- **关键词**：test, sensor_altitude, sensor_to_target_elevation, sensor_to_target_range
- **出处**：`sosm/test_mission/query_atmosphere/test_qa.txt:20-24`
- **片段**：

```text
   test query_atmosphere
      sensor_altitude                  30000 ft
      sensor_to_target_elevation       5 deg
      sensor_to_target_range           10 nm
   end_test
```

- **演示要点**：演示 test 的参数：sensor_altitude, sensor_to_target_elevation, sensor_to_target_range

### test（test_qt）｜

- **关键词**：test, target_altitude, target_to_sensor_azimuth, target_to_sensor_elevation
- **出处**：`sosm/test_mission/query_target/test_qt.txt:23-27`
- **片段**：

```text
   test query_target
      target_altitude                  30000 ft
      target_to_sensor_azimuth         0 deg
      target_to_sensor_elevation       0 deg
   end_test
```

- **演示要点**：演示 test 的参数：target_altitude, target_to_sensor_azimuth, target_to_sensor_elevation

### tool（ata_blue_lr_a2a_rf_missile_lc_generator）｜

- **关键词**：tool, position, heading, output_object_name, output_file_name, maximum_iterations_per_engagement, range_tolerance, start_range_for_increasing, start_range_for_decreasing, rmax_limit, launch_computer_table
- **出处**：`base_types/weapons/aam/ata_blue_lr_a2a_rf_missile_lc_generator.txt:49-94`
- **片段**：

```text
tool AIR_TO_AIR_LAUNCH_COMPUTER_GENERATOR

  # === Tool Input Keywords ===
  #tool_debug

  # The inputs below position the test case somewhere on the globe, and indicate the firing conditions
  position 34:54n 117:53w  # Near Edwards AFB
  heading 0.0 deg

  output_object_name AIM120_AIR_TO_AIR_LAUNCH_COMPUTER    # *** TEMPORARY NON_DEFAULT OVERRIDE
  output_file_name aim120_air_to_air_launch_computer.txt  # *** TEMPORARY NON_DEFAULT OVERRIDE

  # === WsfAirtoAirLaunchComputer Input Keywords ===

  maximum_iterations_per_engagement  20
  range_tolerance                    5 m
  start_range_for_increasing    1000.0 m
  start_range_for_decreasing   10000.0 m
  rmax_limit                  222240.0 m   ### 120 nm

#  launch_computer_table
#     no_escape_maneuver 7 g
#     independent_variables
#        shooter_altitudes 10000 ft 20000 ft 30000 ft end_shooter_altitudes
#        shooter_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0 end_shooter_machs
#        target_altitudes 10000 ft 20000 ft 30000 ft end_target_altitudes
#        target_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0  end_target_machs
#        target_aspects     0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_aspects
#        target_lead_angles 0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_lead_angles
#     end_independent_variables
#  end_launch_computer_table

  # For testing: (smaller set of independent variables)
  launch_computer_table
     no_escape_maneuver 7 g
     independent_variables
        shooter_altitudes 20000 ft end_shooter_altitudes
        shooter_machs 0.8 end_shooter_machs
        target_altitudes 20000 ft end_target_altitudes
        target_machs 0.8 end_target_machs
        target_aspects 44 deg 46 deg end_target_aspects
        target_lead_angles -45 deg 45 deg end_target_lead_angles
     end_independent_variables
  end_launch_computer_table

end_tool
```

- **演示要点**：演示 tool 的参数：position, heading, output_object_name, output_file_name, maximum_iterations_per_engagement, range_tolerance, start_range_for_increasing, start_range_for_decreasing, rmax_limit, launch_computer_table

### tool（ata4_generator）｜

- **关键词**：tool, position, heading, output_object_name, output_file_name, maximum_iterations_per_engagement, engagement_range_tolerance, start_range_for_increasing, start_range_for_decreasing, maximum_rmax_limit, launch_computer_table
- **出处**：`base_types/weapons/aam/ata4_generator.txt:55-151`
- **片段**：

```text
tool AIR_TO_AIR_LAUNCH_COMPUTER_GENERATOR # air_to_air_launch_computer_generator

  # === Tool Input Keywords ===

  #tool_debug

  # The inputs below position the test case somewhere
  # on the globe, and indicate the firing conditions

  position 34:54n 117:53w  # Near Edwards AFB

  heading 0.0 deg

  #frame_step            0.5 sec # Time interval between Tool updates

  #target_platform_type TARGET_PLATFORM_TYPE
  #launch_platform_type LAUNCH_PLATFORM_TYPE

  # The default is to select the first weapon on the launch_platform_type
  #weapon_name <first_weapon_on_launch_platform_type> # (No matter what it is named.)

  # (The PK should usually boosted to 1.0 for this generator to work properly.)
  #weapon_effects WEAPON_TOOL_LETHALITY

  # The following two string values are used to assist with naming output
  # objects and files, if the names are not explicitly provided by user input.

  #tool_produces _air_to_air_launch_computer

  #output_file_extension .txt

  # The user may have letter case preferences on file names, or a preferred naming
  # convention, so may choose to explicitly override the two Tool-provided names below:

  # 1. Output object name
  # (If not provided, the default name is to aggregate the two items shown below.)
  #output_object_name <weapon_platform_type><tool_produces>

  # 2. Output file name
  # (If not provided, the default name is to aggregate the two items shown below.)
  #output_file_name   <output_object_name><output_file_extension>

  output_object_name TEST_MEDIUM_RANGE_MISSILE_AIR_TO_AIR_LAUNCH_COMPUTER    # *** TEMPORARY NON_DEFAULT OVERRIDE
  output_file_name test_medium_range_missile_air_to_air_launch_computer.txt  # *** TEMPORARY NON_DEFAULT OVERRIDE

  # === WsfAirtoAirLaunchComputer Input Keywords ===

  maximum_iterations_per_engagement  20
  engagement_range_tolerance         5 m
  start_range_for_increasing    1000.0 m
  start_range_for_decreasing   10000.0 m
 #maximum_rmax_limit           25000.0 m
  maximum_rmax_limit          222240.0 m   ### 120 nm


  # ==== The file included and read in below will specify the independent ====
  # ==== variable engagment conditions for which results are generated    ====

  //load_table test_medium_range_missile_air_to_air_launch_computer_table.txt

  # ====        OR ALTERNATELY, READ IN IV's BELOW                 ====
  # ==== (NO DV's are given here, as the Tool will Generate them.) ====



  launch_computer_table
     no_escape_maneuver 7 g
     independent_variables
        shooter_altitudes 10000 ft 20000 ft 30000 ft end_shooter_altitudes
        shooter_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0 end_shooter_machs
        target_altitudes 10000 ft 20000 ft 30000 ft end_target_altitudes
        target_machs 0.8 1.0 1.2 1.4 1.6 1.8 2.0  end_target_machs
        target_aspects     0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_aspects
        target_lead_angles 0 deg 30 deg 60 deg 90 deg 135 deg 180 deg  end_target_lead_angles
     end_independent_variables
  end_launch_computer_table


/*
##   for testing:
  launch_computer_table
     no_escape_maneuver 7 g
     independent_variables
        shooter_altitudes 10000 ft end_shooter_altitudes
        shooter_machs 1.0 end_shooter_machs
        target_altitudes 10000 ft end_target_altitudes
        target_machs 1.0 end_target_machs
        target_aspects 0 deg 20 deg end_target_aspects
        target_lead_angles 0 deg 70 deg end_target_lead_angles
     end_independent_variables
  end_launch_computer_table
*/


  #  ==== --------------------------------- ====

end_tool
```

- **演示要点**：演示 tool 的参数：position, heading, output_object_name, output_file_name, maximum_iterations_per_engagement, engagement_range_tolerance, start_range_for_increasing, start_range_for_decreasing, maximum_rmax_limit, launch_computer_table

### tool（tune）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, launch_heading, pitch_rates, loft_angles, pitch_rate, tool_debug
- **出处**：`space_operations/launch_vehicles/saturn_v/tune.txt:36-55`
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file tune_output.tmp

   launch_platform_type LAUNCHER

   # Altitude is the midpoint of the rocket. This is what the time history files have.
   position 28.608422n 80.604133w altitude 59 m
   launch_heading 72.058 deg

   pitch_rates from 0.1 deg/sec to 0.2 deg/sec by 0.005 deg/sec
   loft_angles from 80 deg to 89 deg by 0.2 deg

   pitch_rates from 0.150 deg/sec to 0.170 deg/sec by 0.0001 deg/sec
   loft_angles from 83 deg to 89 deg by 0.2 deg

   # Pretty much any would work for our purpose
   pitch_rate 0.160 deg/sec
   loft_angles from 83 deg to 88 deg by 0.05 deg
   tool_debug
end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, launch_heading, pitch_rates, loft_angles, pitch_rate, tool_debug

### tool（blue_lr_sam_lcg）｜

- **关键词**：tool, tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range, limited_to_preapogee
- **出处**：`base_types/weapons/sam/blue_lr_sam_lcg.txt:22-50`
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR # ballistic_missile_launch_computer_generator
   tool_debug

   frame_step 0.5 sec # sample time of trajectory

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   air_target_file blue_lr_sam_launch_data.txt
   #gnuplot_file    blue_lr_sam_trajectory.plt

   loft_angles from 20 deg to 75 deg by 0.2 deg

   ############################################################################
   # All of the remaining data is used to keep the launch computer dataset
   # small and to only enable solutions that are doctrinally allowed.
   ############################################################################

   # 'minimum_output_time' should be greater than or equal to the burn time.
   # (No intercept during boost)
   minimum_output_time       20 sec

#  these are new (bwf)
#  maximum_output_time       300.0 sec
   maximum_output_range      200.0 km
#JAJ   maximum_output_altitude 150.0 km
   limited_to_preapogee

end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range, limited_to_preapogee

### tool（blue_sr_sam_lcg）｜

- **关键词**：tool, tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range, maximum_output_altitude
- **出处**：`base_types/weapons/sam/blue_sr_sam_lcg.txt:28-65`
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR # ballistic_missile_launch_computer_generator
   tool_debug

   frame_step 0.5 sec # sample time of trajectory

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   air_target_file blue_sr_sam_launch_data.txt
   #gnuplot_file    blue_sr_sam_trajectory.plt

   loft_angles from 20 deg to 85 deg by 0.2 deg

   ############################################################################
   # All of the remaining data is used to keep the launch computer dataset
   # small and to only enable solutions that are doctrinally allowed.
   #
   # If you change these values, also review the weapon fuse definitions in
   # blue_sr_sam.txt. It has limits that will cause the weapon to self-destruct in
   # certain cases.
   ############################################################################

   # 'minimum_output_time' should be greater than or equal to the burn time.
   # (No intercept during boost)
   minimum_output_time     10 sec

   # Jane's says the max range is 15-20km, but may be more things like
   # fighters or cruise missiles.
   #
   # (MJM) Missiles were fusing on min mach for low trajectories; setting range
   # to just over 20 km.
   maximum_output_range    22.5 km

   # Jane's says the max intercept altitude is 15 km, but we may need to
   # go past apogee, so we'll set it higher.
   maximum_output_altitude 20 km

end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range, maximum_output_altitude

### tool（lcg_ccafs_leo）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, launch_headings, loft_angles, launch_heading, tool_debug
- **出处**：`space_operations/launch_vehicles/falcon_9/lcg_ccafs_leo.txt:21-37`
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file falcon_9_ccafs_leo.txt

   launch_platform_type FALCON_9_LAUNCHER

   # CCAFS SLC-40, inclinations 28.5 - 51.6
   position 28.5620n 80.5772w altitude 1 m

   # The documentation says they handle inclinations of about 28-57.
   launch_headings from 40 deg to 90 deg by 10 deg     # gives inc ~57.5-27.8
   loft_angles from 84 deg to 89 deg by 0.2 deg

   launch_heading 90 deg
   loft_angles from 84 deg to 89 deg by 0.2 deg

   tool_debug
end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, launch_headings, loft_angles, launch_heading, tool_debug

### tool（tune）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, launch_heading, pitch_rates, loft_angles, pitch_rate
- **出处**：`space_operations/launch_vehicles/atlas_v_401/tune.txt:20-41`　（同签名共 4 处，另见 `space_operations/launch_vehicles/falcon_9/tune.txt:20`、`space_operations/launch_vehicles/falcon_heavy/tune.txt:20`、`space_operations/launch_vehicles/delta_iv_m/tune.txt:20`）
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file output_tune.tmp

   launch_platform_type LAUNCHER

   # Cape Canaveral Air Force Station, SLC-37
   position 28.531986n 80.566821w altitude 1 m

   launch_heading 90 deg

   # Initial guess
   pitch_rates from 0.1 deg/sec to 0.3 deg/sec by 0.01 deg/sec
   loft_angles from 80 deg to 89 deg by 0.2 deg

   # 0.12-0.13 gives a good range of altitudes...
   pitch_rates from 0.12 deg/sec to 0.13 deg/sec by 0.001 deg/sec
   loft_angles from 80 deg to 89 deg by 0.2 deg

   # 0.125 gives a good range of altitudes...
   pitch_rate 0.125 deg/sec
   loft_angles from 80 deg to 89 deg by 0.2 deg
end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, launch_heading, pitch_rates, loft_angles, pitch_rate

### tool（blue_naval_sam_lcg）｜

- **关键词**：tool, tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range
- **出处**：`ballistic_missile_shootdown/weapons/sam/blue_naval_sam_lcg.txt:23-47`　（同签名共 3 处，另见 `base_types/weapons/sam/blue_naval_sam_lcg.txt:23`、`space_operations/weapons/blue_naval_sam_lcg.txt:22`）
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR # ballistic_missile_launch_computer_generator
   tool_debug

   frame_step 0.5 sec # sample time of trajectory

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   air_target_file blue_naval_sam_launch_data.txt
   #gnuplot_file    blue_naval_sam_trajectory.plt

   loft_angles from 62 deg to 89.8 deg by 0.2 deg

   ############################################################################
   # All of the remaining data is used to keep the launch computer dataset
   # small and to only enable solutions that are doctrinally allowed.
   ############################################################################

   # 'minimum_output_time' should be greater than or equal to the burn time.
   # (No intercept during boost)
   minimum_output_time       46 sec

   maximum_output_range      1000 km
   #maximum_output_altitude   440 km
end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, frame_step, position, air_target_file, loft_angles, minimum_output_time, maximum_output_range

### tool（blue_slbm_lcg）｜

- **关键词**：tool, tool_debug, position, heading, surface_target_file, loft_angle, burn_times
- **出处**：`base_types_nx/weapons/ssm/blue_slbm_lcg.txt:19-28`
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR
   tool_debug
   position 0n 0e altitude 1 m
   heading 90 deg
   surface_target_file blue_slbm_launch_data.txt
   #loft_angles from 68 deg to 71 deg by .5 deg
   loft_angle 69 deg
   burn_times from 140 sec to 172 sec by .5 sec #
   #pass_2_loft_angle_step 0.01 deg
end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, position, heading, surface_target_file, loft_angle, burn_times

### tool（tune）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, launch_heading, loft_angles, tool_debug
- **出处**：`space_operations/launch_vehicles/proton_m/tune.txt:31-42`
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file output_tune.tmp

   launch_platform_type LAUNCHER

   position 46.1n 63.0e # altitude 1 m agl
   launch_heading 61.3 deg

   loft_angles from 50 deg to 80 deg by 0.1 deg

   tool_debug
end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, launch_heading, loft_angles, tool_debug

### tool（lcg_ccafs_leo）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, launch_headings, loft_angles, tool_debug
- **出处**：`space_operations/launch_vehicles/delta_iv_m/lcg_ccafs_leo.txt:21-34`　（同签名共 4 处，另见 `space_operations/launch_vehicles/launcher_one/lcg_ccafs_leo.txt:34`、`space_operations/launch_vehicles/atlas_v_401/lcg_ccafs_leo.txt:21`、`space_operations/launch_vehicles/falcon_heavy/lcg_ccafs_leo.txt:20`）
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file delta_iv_m_ccafs_leo.txt

   launch_platform_type LAUNCHER

   # Cape Canaveral Air Force Station, SLC-37
   position 28.531986n 80.566821w altitude 1 m

   # The documentation says they handle inclinations of about 28-57.
   launch_headings from 40 deg to 90 deg by 10 deg     # gives inc ~57.5-27.8
   loft_angles from 81 deg to 89 deg by 0.2 deg

   tool_debug
end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, launch_headings, loft_angles, tool_debug

### tool（red_srbm_3_lcg）｜

- **关键词**：tool, tool_debug, position, surface_target_file, pass_1_loft_angle_start, pass_2_loft_angle_step, burn_times
- **出处**：`base_types/weapons/ssm/red_srbm_3_lcg.txt:21-36`　（同签名共 2 处，另见 `base_types/weapons/ssm/red_srbm_4_lcg.txt:21`）
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR # ballistic_missile_launch_computer_generator
   tool_debug

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   surface_target_file red_srbm_3_launch_data.txt

   pass_1_loft_angle_start 45.0 deg

   pass_2_loft_angle_step 0.02 deg

   # Best loft angle will automatically be determined
   burn_times from 70 sec to 110 sec by 0.02 sec

end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, position, surface_target_file, pass_1_loft_angle_start, pass_2_loft_angle_step, burn_times

### tool（red_icbm_2_lcg）｜

- **关键词**：tool, tool_debug, position, surface_target_file, pass_2_loft_angle_step, burn_times
- **出处**：`base_types/weapons/ssm/red_icbm_2_lcg.txt:25-38`
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR
   tool_debug

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   surface_target_file red_icbm_2_launch_data.txt

   # Be a little more precise for this bad boy
   pass_2_loft_angle_step 0.01 deg

   # Best loft angle will automatically be determined
   burn_times from 293 sec to 317 sec by 0.02 sec
end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, position, surface_target_file, pass_2_loft_angle_step, burn_times

### tool（red_icbm_1_lcg）｜

- **关键词**：tool, tool_debug, position, surface_target_file, loft_angle, burn_times
- **出处**：`base_types/weapons/ssm/red_icbm_1_lcg.txt:36-54`
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR # ballistic_missile_launch_computer_generator
   tool_debug

   # altitude 1 m choosen to correspond with typical scenario altitudes
   #position 0n 0e altitude 1 m
   position 50:19n 123:51e heading 40 deg altitude 1 m

   surface_target_file red_icbm_1_launch_data.txt

   # Step 1
   #loft_angles from 70 deg to 80 deg by  2 deg

   # Step 2
   #loft_angles from 72.0 deg to 73.0 deg by 0.05 deg

   # Step 3
   loft_angle 72.1 deg
   burn_times from 151 sec to 250 sec by 0.5 sec
end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, position, surface_target_file, loft_angle, burn_times

### tool（tune）｜

- **关键词**：tool, leo_data_file, launch_platform_type, position, pitch_rates, loft_angles
- **出处**：`space_operations/launch_vehicles/launcher_one/tune.txt:34-53`
- **片段**：

```text
tool ORBITAL_LAUNCH_COMPUTER_GENERATOR
   leo_data_file output_tune.tmp

   launch_platform_type COSMIC_GIRL

   # The Cosmic Girl takes off from the Mojave Spaceport (MHV) and will then fly to
   # somewhere 'tens of kilometers off the California coast'

   #position 35:03n 118:09w      # about the center of MHV
   #position 35n 120w

   position 28.608422n 80.604133w altitude 35000 ft heading 90 deg pitch 10 deg speed 450 kts

   pitch_rates from 0.05 deg/sec to 0.50 deg/sec by 0.05 deg/sec
   loft_angles from 20 deg to 80 deg by 2 deg

   pitch_rates from 0.14 deg/sec to 0.16 deg/sec by 0.01 deg/sec
   loft_angles from 25 deg to 50 deg by 1 deg

end_tool
```

- **演示要点**：演示 tool 的参数：leo_data_file, launch_platform_type, position, pitch_rates, loft_angles

### tool（atg_mach_4_missile_lc_generator）｜

- **关键词**：tool, position, output_object_name, output_file_name, altitude_and_mach, target_offsets
- **出处**：`base_types/weapons/agm/atg_mach_4_missile_lc_generator.txt:30-61`
- **片段**：

```text
tool ATG_LAR_AND_LC_GENERATOR
  position     00:00n 00:00w
  output_object_name mach_4_missile_atg_launch_computer    # *** TEMPORARY NON_DEFAULT OVERRIDE
  output_file_name mach_4_missile_atg_launch_computer.txt  # *** TEMPORARY NON_DEFAULT OVERRIDE
#  altitude_and_mach 40000 ft  0.8    target_ranges 40 miles 5.0 miles  26
#  altitude_and_mach 40000 ft  1.2    target_ranges 50 miles 5.0 miles  27
#  altitude_and_mach 40000 ft  1.4    target_ranges 60 miles 5.0 miles  28
#  altitude_and_mach 35000 ft  0.8    target_ranges 40 miles 5.0 miles  23
#  altitude_and_mach 35000 ft  1.2    target_ranges 40 miles 5.0 miles  27
#  altitude_and_mach 35000 ft  1.4    target_ranges 55 miles 5.0 miles  28
#  altitude_and_mach 25000 ft  0.8    target_ranges 40 miles 5.0 miles  20
#  altitude_and_mach 25000 ft  1.2    target_ranges 50 miles 5.0 miles  23
#  altitude_and_mach 25000 ft  1.4    target_ranges 50 miles 5.0 miles  24
  altitude_and_mach 20000 ft  0.8    target_ranges 10 miles 25.0 miles  24
#  altitude_and_mach 20000 ft 1.2     target_ranges 40 miles 5.0 miles  22
#  altitude_and_mach 20000 ft 1.4     target_ranges 45 miles 5.0 miles  23
#  altitude_and_mach 15000 ft 0.8     target_ranges 30 miles 5.0 miles 17
#  altitude_and_mach 15000 ft 1.2     target_ranges 35 miles 5.0 miles 19
#  altitude_and_mach 15000 ft 1.4     target_ranges 40 miles 5.0 miles 20
#  altitude_and_mach 10000 ft  0.8    target_ranges 25 miles 5.0 miles 15
#  altitude_and_mach 10000 ft  1.2    target_ranges 35 miles 5.0 miles 16
#  altitude_and_mach 10000 ft  1.4    target_ranges 40 miles 5.0 miles 17
#  altitude_and_mach 5000 ft  0.8     target_ranges 25 miles 5.0 miles 13
#  altitude_and_mach  1000 ft  0.8    target_ranges 25 miles 5.0 miles 10

#  target_ranges     40 miles 5.0 miles 21 # min, delta, number of target offsets forward of the launcher
#  target_ranges     40 miles 2.5 miles 50 # min, delta, number of target offsets forward of the launcher
#  target_offsets    10.0 miles 4 # delta, number of target offsets lateral to the launcher
 target_offsets    25.0 miles 30 # delta, number of target offsets lateral to the launcher
#  target_offsets    .1 meter 2 # delta, number of target offsets lateral to the launcher
 #shrink_factor         0.8
end_tool
```

- **演示要点**：演示 tool 的参数：position, output_object_name, output_file_name, altitude_and_mach, target_offsets

### tool（red_mrbm_1_lcg）｜

- **关键词**：tool, tool_debug, position, surface_target_file, burn_times
- **出处**：`ballistic_missile_shootdown/weapons/ssm/red_mrbm_1_lcg.txt:21-31`　（同签名共 5 处，另见 `base_types/weapons/ssm/red_mrbm_1_lcg.txt:21`、`base_types/weapons/ssm/red_mrbm_2_lcg.txt:21`、`base_types/weapons/ssm/red_srbm_1_lcg.txt:21`）
- **片段**：

```text
tool BALLISTIC_MISSILE_LAUNCH_COMPUTER_GENERATOR
   tool_debug

   # altitude 1 m choosen to correspond with typical scenario altitudes
   position 0n 0e altitude 1 m

   surface_target_file red_mrbm_1_launch_data.txt

   # Best loft angle will automatically be determined
   burn_times from 91 sec to 126 sec by 0.02 sec
end_tool
```

- **演示要点**：演示 tool 的参数：tool_debug, position, surface_target_file, burn_times

### weighted_random（blackboard_striker）｜

- **关键词**：weighted_random, behavior_node
- **出处**：`behavior_tree/platforms/blackboard_striker.txt:50-55`　（同签名共 2 处，另见 `behavior_tree/platforms/weighted_random_striker.txt:45`）
- **片段**：

```text
            weighted_random
               behavior_node checkpoint_1_task
               behavior_node checkpoint_2_task
               behavior_node checkpoint_3_task
               behavior_node checkpoint_4_task
            end_weighted_random
```

- **演示要点**：演示 weighted_random 的参数：behavior_node
