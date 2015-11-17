% This script is an example of how to get dynamic parameters from the MMS
% database.

%% Setup

% Adding a path to the top folder.
addpath(genpath('H:\TNK103\KOD'),'-end');

import core.*               %Core classes

% Setting the enviroment (i.e loading all jar files)
% We do not wanna set the enviroment if it is allready set.
try
    Time(); % This is just to see if the import was successful.
catch
    setEnviroment
end

    % Importing all java classes that will be used.
    import java.lang.*          %String classes
    import java.util.*          %Wrapper classes
    import core.*               %Core classes
    import matrix.*             %Matrix classes
    import netconfig.*          %Network clases
    import bAE.*               %Output data classes not needed in this example
    import highwaycommon.*      %Parameter classes
    %import highwayflowmodel.*  %Flow model classes not needed in this example
    %import highway.*           %Highway classes not needed in this example

    % Setting the network id and configuration id.
    NETWORKID = 50;
    CONFIGURATIONID = 15001;

    core.Monitor.set_db_env('tal_local') 
    core.Monitor.set_prog_name('mms_matlab')
    core.Monitor.set_nid(NETWORKID);
    core.Monitor.set_cid(CONFIGURATIONID);


%% Kan behövas
% fundamentalDiagramObject = datatypes.FundamentalDiagramParameters(network, CONFIGURATIONID);
% 
% % Creating a network object.
network = Network();

% 
% linksInNetwork = fundamentalDiagramObject.getAvalibleAreas;
% f = fundamentalDiagramObject.readFromDatabaseAsTable(linksInNetwork(1));


test = network.getRadarSensors;

sensorId = Integer(224);
startTime = Time.newTimeFromBerkeleyDateTime(2013,03,21,8,0,0,0);
endTime = Time.newTimeFromBerkeleyDateTime(2013,03,21,10,0,0,0);

utdata = output.SensorOutput.getSensorOutput(network,sensorId,startTime,endTime);

a = utdata.speed .* 3.6;




