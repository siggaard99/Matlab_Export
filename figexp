function figexp(Name,Folder,export)
%FIGEXP Export figures as PDF.
    %   This function exports figures to PDF format and places them in a specified folder.
    %
    %   Usage:
    %       FIGEXP("X", "Y", Z)
    %       - X: The name of the file to be exported (as a string).
    %       - Y: The location/directory where the file should be saved (as a string).
    %       - Z: A flag for export (numeric). 
    %            - 1 to export the file.
    %            - 0 to skip the export. If Z is excluded, the file will be exported by default.
    %
    %   Inputs:
    %       "X" - The name of the file (e.g., "Name").
    %       "Y" - The folder where the file should be saved (e.g., "Folder").
    %        Z  - Export flag (1 or 0):
    %             - 1: Export the figure as a PDF.
    %             - 0: Do not export the figure.
    %             - If Z is omitted, the figure is exported by default.
    %
    %   Example:
    %       % Example 1: Export the figure
    %       figexp("Strength", "Lab", 1)
    %       % This will export the figure as 'Strength.pdf' to the 'Lab' folder.
    %       
    %       % Example 2: Do not export the figure
    %       export = 0;
    %       figexp("Strength", "Lab", export)
    %       % This will NOT export the figure since Z is set to 0.
    %
    %   **IMPORTANT**:
    %       - Make sure to update the Dropbox path or any other file path 
    %         to match your system's configuration.
    %
    %   - Created by Sebastian Siggaard -
    % Get the computer name of your computer
    computerName = getenv('COMPUTERNAME'); % for Windows
    if isempty(computerName)
        computerName = getenv('USER'); % for Linux and Mac
    end
    % Initialize db (dropbox) to a default value
    db = "";
    
    % Place your computerName is a case, with dropbox path
    % Switch case based on the computer name
    switch computerName
        case ' ' % enter name of computer here
            db = " ";
            % Add actions specific to Mac
        case ' ' % enter name of computer here
            db = "";
            % Add actions specific to Mac
        otherwise
            disp('Unknown computer.');
    end
    
    % Current folder
    curr_path = pwd;
    % Define the name of folder where files are placed.
    def_folder = "Wrong placement"; %
    % Check if export is empty or 1, if yes export, else if export is 0
    % then dont export
    no_exp = 1;
    if nargin > 2
        if export == 0
            no_exp = 0;
        end
    end
    % place the file in a defined dropbox folder
    %disp('No export of figure')
    
    if no_exp ~= 0
        try
            cd(db + Folder);
            disp('Fil placeret under: ' + Folder)
        catch
            exit = 0;
            while exit == 0
                %disp('Mappen findes ikke, vil du oprette denne y/n?')
                prompt = 'Mappen "' + Folder + '" findes ikke, vil du oprette denne y/n? ';
                x = input(prompt,"s");
                switch x
                    case "y"
                        mkdir(db+Folder)
                        disp('Mappe "'+ Folder +'" oprettet')
                        cd(db+Folder);
                        disp('Fil placeret under: ' + Folder)
    
                        % exit the loop
                        exit = 1;
                    case "n"
                        try
                            cd(db+def_folder)
                            disp('Mappe du valgte findes ikke, fil placeret under: ' + def_folder)
                            
                            % exit the loop
                            exit = 1;
                        catch
                            mkdir(db+def_folder)
                            disp('Mappe du valgte findes ikke, folder "'+ def_folder +'" oprettet')
                            cd(db+def_folder);
                            disp('Fil placeret under: ' + def_folder)
    
                            % exit the loop
                            exit = 1;
                        end
                    otherwise
                        disp('Valg er ikke muligt, vælg y eller n')
                end
            end
        end
    % Define figure type
    fig_type = ".pdf";
    
    % Export af figur
    exportgraphics(gcf,Name+fig_type)
    open(Name+fig_type) % Optional if you wanna open or not
    % Back to original path
    cd(curr_path)
    end
end
