function varargout = evlab_find_contrast(varargin)
% Search subject directory for first level then SPM.mat for the contrast
    mindhive='/mindhive/evlab/u/Shared/SUBJECTS/';
    firstlevel = sprintf('firstlevel_%s', varargin{1}{2});
    varargout{1}=fullfile(mindhive,varargin{1}{1});
    if ~exist(varargout{1},'dir')
        warning('Subject does not exist in SUBJECTS directory. Skipping.');
        varargout{1}=[]; return;
    elseif ~exist(fullfile(varargout{1},firstlevel),'dir')
        warning('First level folder does not exist. Skipping.');
        varargout{1}=[]; return;
    else
        varargout{1}=fullfile(varargout{1},firstlevel);
        if exist(fullfile(varargout{1},'SPM.mat'),'file')
            load(fullfile(varargout{1},'SPM.mat'),'SPM');
        end
        [~,idx] = ismember(varargin{1}{3}, {SPM.xCon.name});
        varargout{1}=fullfile(varargout{1},sprintf('spmT_%04d',idx));
        if exist([varargout{1} '.nii'],'file')
            varargout{1}=[varargout{1} '.nii'];
            return 
        elseif exist([varargout{1} '.img'],'file')
            varargout{1}=[varargout{1} '.img'];
            return 
        end           
    end
end

