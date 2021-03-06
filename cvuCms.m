% cvuCms - (CV Utility) Compute Cumulative Matching Score
%
% Synopsis
%   [CMS] = cvuCms(Rank, C)
%
% Description
%   Compute Cumulative Matching Score
%
% Inputs ([]s are optional)
%   (matrix) Rank     c x N matrix representing the classification ranking
%                     result where c is the number of classes and N
%                     is the number of feature vectors. 
%                     Rank(1,:) is the top one, Rank(2,:) is the 2nd.
%   (vector) C        1 x N vector representing correct class. 
%
% Outputs ([]s are optional)
%   (vector) CMS      1 x N vector representing the cumulative
%                     match score
%
% Example
%  CMS = cvuCms(Rank, C);
%  figure; 
%  plot(1:length(CMS), CMS);
%  xlabel('Rank');
%  ylabel('Cumulative Match Score');

% Authors
%   Naotoshi Seo <sonots(at)sonots.com>
%
% License
%   The program is free to use for non-commercial academic purposes,
%   but for course works, you must understand what is going inside to use.
%   The program can be used, modified, or re-distributed for any purposes
%   if you or one of your group understand codes (the one must come to
%   court if court cases occur.) Please contact the authors if you are
%   interested in using the program without meeting the above conditions.
%
% Changes
%   10/09/2008  First Edition
function CMS = cvuCms(Rank, C)
[nClass, N] = size(Rank);
Rate = sum(Rank == repmat(C, nClass, 1), 2) ./ N;
CMS  = cumsum(Rate);