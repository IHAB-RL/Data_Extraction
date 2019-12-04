function [nOVperDay, nOVS, nFrames]=analyseDistributionOVSperDay(obj, stDate)
% function to analyse distribution of OVS per day
% Usage [nOVperDay]=analyseDistributionOVSperDay(obj, stDate)
%
% Parameters
% ----------
% obj - class IHABdata, contains all informations
% 
% stDate - struct which contains valid date informations about the time 
%          informations: start and end day and time; this struct results 
%          from calling checkInputFormat.m
%
% Returns
% -------
% nOVperDay - number of predicted OVS relative to total number of blocks
%
% Author: J. Pohlhausen (c) TGM @ Jade Hochschule applied licence see EOF
% Version History:
% Ver. 0.01 initial create (empty) 27-Nov-2019 JP

% predict voice sequences with a trained random forest
szMode = 'OVD';
[vPredictedOVS] = detectVoiceRandomForest(obj, stDate, szMode);

% number of blocks (each 125ms)
nFrames = size(vPredictedOVS, 1);

if isempty(nFrames)
    nFrames = 0;
    nOVS = 0;
    nOVperDay = NaN;
    return;
end

% calculate OV per day
nOVS = sum(vPredictedOVS);
nOVperDay = nOVS/nFrames;

%--------------------Licence ---------------------------------------------
% Copyright (c) <2019> J. Pohlhausen
% Jade University of Applied Sciences
% Permission is hereby granted, free of charge, to any person obtaining
% a copy of this software and associated documentation files
% (the "Software"), to deal in the Software without restriction, including
% without limitation the rights to use, copy, modify, merge, publish,
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject
% to the following conditions:
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.