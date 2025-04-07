function bodeexp(sys, legends, w,phase_lim, Title,name, Folder,export)
    % BODEEXP Generate Bode plots and optionally export them as a PDF.
    %   This function creates Bode plots (magnitude and phase) for one or more 
    %   transfer functions and optionally exports the figure as a PDF.
    %
    %   Usage:
    %       BODEEXP(SYS, LEGENDS, W, PHASE_LIM, TITLE, NAME, MAPPE, EXPORT)
    %
    %   Inputs:
    %       SYS       - A cell array of transfer function systems to plot. 
    %                   Each element must be a valid transfer function.
    %       LEGENDS   - A cell array of strings containing legends for each system. 
    %                   Must match the number of systems in SYS.
    %       W         - (Optional) Frequency range for the Bode plot. 
    %                   Defaults to {1e1, 1e4}. Set W = 0 to use the default range.
    %       PHASE_LIM - (Optional) Limits for the phase plot's y-axis (in degrees).
    %                   Defaults to [-180 0]. Set PHASE_LIM = 0 to use default limits.
    %       TITLE     - (Optional) Title for the plot. If no title is provided, 
    %                   no title is displayed (as a string).
    %       NAME      - (Optional) Name of the PDF file if the figure is exported (as a string).
    %       MAPPE     - (Optional) Folder where the PDF file will be saved. 
    %                   Defaults to the current working directory if not specified (as a string).
    %       EXPORT    - (Optional) A flag to control exporting:
    %                   - 1: Export the figure to PDF.
    %                   - 0: Do not export. If EXPORT is omitted, no export occurs.
    %
    %   Outputs:
    %       None. The function generates and displays the Bode plot.
    %
    %   Example:
    %       % Example 1: Plot and export Bode plots
    %       sys1 = tf([1], [1 1]); 
    %       sys2 = tf([1], [1 0.1 1]);
    %       BODEEXP({sys1, sys2}, {'System 1', 'System 2'}, {1e1, 1e4}, [-180 0], "Bode Plot", "bode_plot', "Plots", 1)
    %       % This will generate Bode plots for two systems and export them as 
    %       % 'bode_plot.pdf' to the 'Plots' folder.
    %
    %       % Example 2: Plot without export
    %       BODEEXP({sys1, sys2}, {'System 1', 'System 2'}, {1e1, 1e4}, [-180 0], "Bode Plot", "bode_plot", "Plots", 0)
    %       % This will generate Bode plots but will not export them.
    %
    %   **IMPORTANT**:
    %       - The function requires the Signal Processing Toolbox.
    %       - Always ensure that the 'sys' and 'legends' arrays have matching lengths.
    %       - Update the path to match your folder structure when exporting.
    %
    %   - Created by Sebastian Siggaard -
    % Validate input (at least one system and legends)
    if isempty(sys) || ~iscell(sys)
        error('bodeexp:InvalidInput', 'sys must be a cell array of transfer functions.');
    end
    if isempty(legends) || ~iscellstr(legends) || numel(legends) ~= numel(sys)
        error('bodeexp:InvalidInput', 'legends must be a cell array of strings with the same length as sys.');
    end
    % Set default values for optional arguments
    try 
        if w == 0
        w = {1e1, 1e4};
        end
    catch
    end
    
    try
        if phase_lim == 0
            phase_lim = [-180 0];
        end
    catch
    end
    if nargin < 7
        Folder = '';
    end
    close all; clf
    
        figure()
        tiledlayout(2, 1);  % Set up tiled layout with 2 rows and 1 column
        nexttile  % Indexing for the current tile
        hold on
        for i = 1:numel(sys)
            [mag, ph, w] = bode(sys{i}, w);
            mag = squeeze(mag);
            % Magnitude subplot for odd indices
            semilogx(w, mag2db(mag))
        end
        ylabel('Magnitude [dB]')
        xscale('log')  % Set x-axis to logarithmic scale
    
    
    
        % check if there is a title, else set title to 0
        try
            logical(Title == 0);
        catch
            title(Title,'FontWeight','normal')
        end
    
        nexttile
            hold on
        for i = 1:numel(sys)
            [mag, ph, w] = bode(sys{i}, w);
            ph = squeeze(ph);
            % Phase subplot for even indices
            semilogx(w, ph)
    
            % ... (rest of phase plot formatting)
        end
        legend(legends)  % Use a cell array with one element for legend
        ylabel('Phase [deg]')
        xlabel('Frequency [rad/s]')
        yticks([-270 -180 -90 0 90 180])
        ylim(phase_lim)
        xscale('log')  % Set x-axis to logarithmic scale
    
    
    
    
    if export ~= 0
        % Export to PDF (optional)
        if ~isempty(Folder)
            figexp(name, Folder);  % Use the provided name for export
        end
    
        disp('Bode plots generated successfully!');
    end
end
