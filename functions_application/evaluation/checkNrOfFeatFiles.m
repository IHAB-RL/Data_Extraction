function [obj]=checkNrOfFeatFiles(obj)
% function to check whether the number of feature files is valid or not
% Usage [obj]=checkNrOfFeatFiles(obj)
%
% Parameters
% ----------
% obj
%
% Returns
% -------
% obj
%
% Author: J. Pohlhausen (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create (empty) 19-Nov-2019  JP

% pre allocate
obj.UseAudio = false;

% List all feat files
AllFeatFiles = listFiles(obj.szDir,'*.feat');
AllFeatFiles = {AllFeatFiles.name}';

if isempty(AllFeatFiles)
    obj.UseAudio = true;
    return;
end

NrOfPSDFiles = sum(contains(AllFeatFiles, 'PSD'));
NrOfRMSFiles = sum(contains(AllFeatFiles, 'RMS'));
NrOfZCRFiles = sum(contains(AllFeatFiles, 'ZCR'));

if NrOfPSDFiles < 2
    obj.UseAudio = true;
    return;
elseif NrOfZCRFiles ~= NrOfRMSFiles
    obj.UseAudio = true;
elseif  NrOfPSDFiles < NrOfRMSFiles-1
    obj.UseAudio = true;
end


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