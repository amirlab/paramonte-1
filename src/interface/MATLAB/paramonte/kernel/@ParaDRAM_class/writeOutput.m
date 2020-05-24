%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ParaMonte: plain powerful parallel Monte Carlo library.
%
%   Copyright (C) 2012-present, The Computational Data Science Lab
%
%   This file is part of the ParaMonte library.
%
%   ParaMonte is free software: you can redistribute it and/or modify it 
%   under the terms of the GNU Lesser General Public License as published 
%   by the Free Software Foundation, version 3 of the License.
%
%   ParaMonte is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
%   GNU Lesser General Public License for more details.
%
%   You should have received a copy of the GNU Lesser General Public License
%   along with the ParaMonte library. If not, see, 
%
%       https://github.com/cdslaborg/paramonte/blob/master/LICENSE
%
%   ACKNOWLEDGMENT
%
%   As per the ParaMonte library license agreement terms, 
%   if you use any parts of this library for any purposes, 
%   we ask you to acknowledge the use of the ParaMonte library
%   in your work (education/research/industry/development/...)
%   by citing the ParaMonte library as described on this page:
%
%       https://github.com/cdslaborg/paramonte/blob/master/ACKNOWLEDGMENT.md
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
function out = writeOutput(self)
    
    % if new point has been sampled, write the previous sampled point to output file

    nd = self.nd.val;

    if self.Stats.NumFunCall.accepted > 0   % blockOutputWrite

        if self.SpecBase.chainFileFormat.isCompact
            fprintf(self.ChainFile.unit , self.ChainFile.format                                     ...
                                        , self.Chain.ProcessID  (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.DelRejStage(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.MeanAccRate(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.Adaptation (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.BurninLoc  (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.Weight     (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.LogFunc    (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.State (1:nd,self.Stats.NumFunCall.accepted)    ...
                                        ) ;
        elseif self.SpecBase.chainFileFormat.isBinary
            fprintf(self.ChainFile.unit , self.ChainFile.format                                     ...
                                        , self.Chain.ProcessID  (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.DelRejStage(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.MeanAccRate(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.Adaptation (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.BurninLoc  (self.Stats.NumFunCall.accepted)    ...
                                        , 1                                                         ...
                                        , self.Chain.LogFunc    (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.State (1:nd,self.Stats.NumFunCall.accepted)    ...
                                        ) ;
        elseif self.SpecBase.chainFileFormat.isVerbose
            for j = 1 : self.Chain.Weight(self.Stats.NumFunCall.accepted)
            fprintf(self.ChainFile.unit , self.ChainFile.format                                     ...
                                        , self.Chain.ProcessID  (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.DelRejStage(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.MeanAccRate(self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.Adaptation (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.BurninLoc  (self.Stats.NumFunCall.accepted)    ...
                                        , 1                                                         ...
                                        , self.Chain.LogFunc    (self.Stats.NumFunCall.accepted)    ...
                                        , self.Chain.State (1:nd,self.Stats.NumFunCall.accepted)    ...
                                        ) ;
            end
        end

    end % blockOutputWrite

end