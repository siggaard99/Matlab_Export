function figuresize(rows,columns)
    % FIGURESIZE Set the size of a figure.
    %   This function sets the size of a figure in two different formats:
    %
    %   1. Format 1: 
    %      FIGURESIZE("X", "Y")
    %      - Takes two string inputs, "X" and "Y", which represent the width and height in pt units.
    %      - 455pt is the width of my LaTeX document. You can check the width in LaTeX with \the\textwidth.
    %      - **Remember to update these values in the script if your LaTeX document width changes.**
    %
    %   2. Format 2: 
    %      FIGURESIZE(X, Y)
    %      - Takes two numeric inputs, X and Y.
    %      - X represents the number of rows in the figure.
    %      - Y represents the number of columns in the figure.
    %      - Each row increases the figure height by 50pt (h_p).
    %
    %   Inputs:
    %       "X" - (String) Specific width of the figure in pt units.
    %       "Y" - (String) Specific height of the figure in pt units.
    %       
    %       X - (Numeric) Number of rows in the figure.
    %       Y - (Numeric) Number of columns in the figure.
    %
    %   Outputs:
    %       None.
    %
    %   Example:
    %       % Example 1: Custom dimensions
    %       FIGURESIZE("455", "150")
    %       figure
    %       ...
    %       % This will create a figure that is 455pt wide and 150pt high.
    %       
    %       % Example 2: Number of rows and columns
    %       FIGURESIZE(1, 4)
    %       figure
    %       ...
    %       % This will set the figure size to 455pt x 350pt. 
    %       % Each row increases the figure height by 50pt.
    %
    %   **IMPORTANT**:
    %       - Always call `figuresize` before creating the figure environment.
    %       - If specifying rows/columns, custom values in the script can be 
    %         adjusted as needed.
    %
    %   - Created by Sebastian Siggaard -
    
    % costume values to chance
    factor = 1.17;
    w_fig = 455; % Standard width
    h_fig = 150; % Standard heigth
    h_p = 50; % height of exrta rows
    
    % INFO %
    % Skal der defineres en speciel størrelse skrives det 
    % ("455","150"), eksempel
    % Standard brede er "455", højde kan defineret efter hvad der er behov
    % for
    % Check if the row input is a string or subplot value
    string_row = 0;
    try 
        logical(rows);
        string_row = 0;
    catch
        string_row = 1;
        r = str2double(rows);
    end
    
    % Check if the collumn input is a string or subplot value
    string_collumn = 0;
    try 
        logical(columns);
        string_collumn = 0;
    catch
        string_collumn = 1;
        c = str2double(columns);
    end
    
    % Default
    w = w_fig*factor; h = h_fig*factor;
    set(0,'defaultFigurePosition',[1,1,w,h])
    if string_row == 0 && string_collumn == 0
        if rows == 1 && columns == 1 % 1x1 plot
           w = w_fig * factor; h = h_fig * factor;
           set(0,'defaultFigurePosition',[1,1,w,h])
        
        elseif rows > 1 && columns == 1 % multipel rows
           w = w_fig * factor; h = h_fig + rows * h_p * factor;
           set(0,'defaultFigurePosition',[1,1,w,h])
        end
    % 
    elseif string_collumn == 1 && string_row == 0
        w = w_fig*factor; h = c*factor;
        set(0,'defaultFigurePosition',[1,1,w,h])
    
    %
    elseif string_collumn == 0 && string_row == 1
        w = r*factor; h = h_fig*factor;
        set(0,'defaultFigurePosition',[1,1,w,h])
    %
    elseif string_collumn == 1 && string_row == 1
        w = r*factor; h = c*factor;
        set(0,'defaultFigurePosition',[1,1,w,h])
    end
end
