%rng(13745945);
rng('shuffle');
% cd('/home/ssuen/TBmac/');

%In the original simulation, there are 200000 people to reduce noise to managable levels, and the simulation is
%run for 50 years after 1996.  
NumPpl        = 2000;  %use smaller number of people for debugging, though!
yrsOfAnalysis = 25;  %25  %for now, let's have an objective value of minimizing total TB prevalence in 20 years from now (2018+20 = 2038, so 42 years from 1996).

durationYrs = 130 + yrsOfAnalysis;
numberPpl = NumPpl;
% plotResolution
% loadBurnInStr
startScenarioYr = 2018;
startScenarioYr2 = 0;
latToAct_cal = 1.140;
oldActSlope_cal = 0.00018;
oldActIntercept_cal = 0.00007;
FOI_cal = 0.0025;
aveUptake_cal = 0.8;
cat2uptake_cal = 1.3;



% This generates a population that reasonably approximates the Indian population in 1996.
% Rerun this if you need to change the number of people or number of years of analysis.
% It will create a saved file that can be used for all subsequent simulation runs (burnintester.mat), 
% so comment this out if those 2 variables don't change.
%TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r70','writeBurnIn', 2018,0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'base');


% This runs the actual simulation (base case).  
FOI_cal = 0.0025;
TBuptakeParams;
for i = 1:1
    %rng(seed);
    %TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r70','loadBurnIn', 2018, 0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'base', 'before');
    %rng(seed);
    %TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r70','loadBurnIn', 2018, 0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'base', 'after');
    %rng(seed);
    %TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r70','loadBurnIn', 2018, 0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'base', 'test', 0);
    [Group1, Group1_latent, age_population] = TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r0','loadBurnIn', 2018, 0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'base', 'customized', uptakeParams.finerUptakeUrbanKnowledge, uptakeParams.finerUptakeAgeBracs);
    %[Group1, age_population] = TBsimulation_jan23(folderName, logComment,durationYrs, numberPpl, plotResolution, loadBurnInStr, startScenarioYr,startScenarioYr2, latToAct_cal, oldActSlope_cal, oldActIntercept_cal, FOI_cal, aveUptake_cal, cat2uptake_cal, simParamsFolder, modifiedMethod, customizedUptakeUrbanKnowledge, customizedUptakeAgeBracs)
end


% This runs the "increaseTBuptake" scenario, which increases knowledge of
% TB treatment programs by 20% from base case, starting in 2018.
%TBsimulation_jan23('.','p01', 130+yrsOfAnalysis, NumPpl, '-r70','loadBurnIn', 2018,0, 1.140, 0.00018, 0.00007, 0.0025, 0.8, 1.3,'increaseTBuptake');

% You may want to make your own output tables inside TBsimulation_jan23,
% in the time loop.  All individuals are recorded as a row in stateMat,
% which updates over time.  Columns are individual features (see line 171
% in TBsimulation_jan23.m for descriptions)
