function evlab_save_activation_maps(varargin)
    %   REQUIRED INPUTS
    %   subjectID: string of subject ID (include 3-digit unique ID)
    %              ex: '208_KAN_evDB_20140121a_PL2017'
    %
    %   experiment: string of experiment (model) name
    %               ex: 'langlocSN'
    %
    %   contrast: string of contrast name
    %             ex: 'S-N'
    %
    %   outputDir: string for output path
    %             ex: '/mindhive/evlab/u/jaffourt/800LanA/activationMaps'
    % 
    %   OPTIONAL INPUT
    %   p_value: double value of p-val thresholding
    %             ex: 0.0001

    addpath('./func')
    temp_software_dir=[pwd]; % if you move/copy this software, change this
    if isempty(varargin)
        error('No parameters provided.');
    elseif size(varargin)<4
        error('REQUIRED INPUTS: subjectID, experiment, contrast, outputDir');
    elseif size(varargin)<5
        disp('By default p-val set to 0.001.');
        varargin{5}=0.001;
    end
    if ~exist(which('spm'),'file')
        addpath('/om/group/evlab/software/spm12');
    elseif ~strcmp(which('spm'),'/om/group/evlab/software/spm12/spm.m')
        rmpath(fileparts(which('spm')));
        addpath('/om/group/evlab/software/spm12');
    end
    varargin{6}=evlab_find_contrast(varargin);
    if varargin{6}
varargin{7}=spm_render_evlab(varargin{6},NaN,fullfile(temp_software_dir,'func','render_single_subj.mat'),varargin{5});
        if ~exist(varargin{4},'dir') && ~exist([pwd '/evlab_activations_output'],'dir')
            warning('Error finding output directory, creating a default output folder.')
            mkdir([pwd '/evlab_activations_output']);
            saveas(varargin{7},fullfile([pwd '/evlab_activations_output'],[varargin{1} '_' varargin{3} '.png']));
        elseif exist(varargin{4},'dir')
            saveas(varargin{7},fullfile(varargin{4},[varargin{1} '_' varargin{3} '.png']));
        else
            warning('Unable to find output directory, writing to a default output folder');
            saveas(varargin{7},fullfile([pwd '/evlab_activations_output'],[varargin{1} '_' varargin{3} '.png']));
        end
        close(varargin{7});
    end
end
