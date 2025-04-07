function  rlocexp(sys,Name,Title,Folder,export)
% RLOCEXP Generate a Root Locus plot and export it as a PDF.
%   This function creates a Root Locus plot for a given transfer function 
%   system and optionally exports the figure as a PDF.
%
%   Usage:
%       RLOCEXP(SYS, NAME, TITLE, MAPPE, EXPORT)
%
%   Inputs:
%       SYS     - The transfer function system for which the Root Locus plot 
%                 will be generated.
%       NAME    - The name of the PDF file when exporting the figure.
%       TITLE   - (Optional) Title for the plot. If TITLE = 0, no title is displayed.
%       MAPPE   - (Optional) Directory where the figure will be saved.
%                 Defaults to the current working directory if not specified.
%       EXPORT  - (Optional) Set to 1 to export the figure, or 0 to skip export.
%                 If not provided, the figure will be exported by default.
%
%   Outputs:
%       None. The function generates and displays the Root Locus plot.
%
%   Plot Details:
%       - The function plots the closed-loop poles of the system on the
%         complex plane, showing how they change with varying gain values (K).
%       - Open-loop poles and zeros are marked with blue 'x' (poles) and 
%         red 'o' (zeros).
%       - Axis limits, figure size, and resolution are adjustable within the code.
%       - The plot includes real and imaginary axes markers (xline and yline).
%
%   Example:
%       % Example: Generate and export a Root Locus plot
%       sys = tf([1], [1 1 1]);
%       RLOCEXP(sys, 'root_locus_plot', 'Root Locus of System', 'Plots', 1)
%       % This will generate a Root Locus plot and save it as 
%       % 'root_locus_plot.pdf' in the 'Plots' folder.
%
%   **IMPORTANT**:
%       - Ensure that 'NAME' and 'MAPPE' are set correctly when exporting.
%       - Set EXPORT to 0 if you do not want to export the figure as a PDF.
%       - The 'wn', 'xlim', and 'ylim' variables should be customized to fit 
%         the specific system you are analyzing.
%
%   Requirements:
%       - This function requires the Control System Toolbox.
%       - The `figexp` function must be available for exporting the figure.
%
%   - Created by Sebastian Siggaard -
clf
% Change to whatever you need to show
wn = [200 500 1000 2000];
xmin = -100;
xmax = 2;
ylimit = 1000;
% Figuresize
factor = 1.4;
w = 500*factor; h = 250*factor;
set(0, 'defaultFigurePosition', [1, 1, w, h]) 
% Find number of system poles:
np = size(pole(sys),1);
nz = size(zero(sys),1);
% The rlocus function can output the values normally plotted and the gains
% associated with each value on the complex plane
[complexVec,gainsVec] = rlocus(sys);
% Recall: the root locus is displayed on the complex plane (s = \sigma +
% j*\omega)
realPart = real(complexVec);
imagPart = imag(complexVec);
% First closed loop pole with increasing gain, K
realCLpole1 = realPart(1,:);
imagCLpole1 = imagPart(1,:);
% Second closed loop pole with increasing gain, K - and so on...
if np>1
    realCLpole2 = realPart(2,:);
    imagCLpole2 = imagPart(2,:);
end
if np>2
    realCLpole3 = realPart(3,:);
    imagCLpole3 = imagPart(3,:);
end
if np>3
    realCLpole4 = realPart(4,:);
    imagCLpole4 = imagPart(4,:);
end
if np>4
    realCLpole5 = realPart(5,:);
    imagCLpole5 = imagPart(5,:);
end
if np>5
    realCLpole6 = realPart(6,:);
    imagCLpole6 = imagPart(6,:);
end
if np>6
    realCLpole7 = realPart(7,:);
    imagCLpole7 = imagPart(7,:);
end
if np>7
    realCLpole8 = realPart(8,:);
    imagCLpole8 = imagPart(8,:);
end
% Plot the closed loop poles as varying with gain K
plot(realCLpole1,imagCLpole1,'g'); hold on;
if np>1
    plot(realCLpole2,imagCLpole2,'g');
end
if np>2
    plot(realCLpole3,imagCLpole3,'g');
end
if np>3
    plot(realCLpole4,imagCLpole4,'g');
end
if np>4
    plot(realCLpole5,imagCLpole5,'g');
end
if np>5
    plot(realCLpole6,imagCLpole6,'g');
end
if np>6
    plot(realCLpole7,imagCLpole7,'g');
end
if np>7
    plot(realCLpole8,imagCLpole8,'g');
end
% Plot open loop poles and zeros
plot(realCLpole1(1),imagCLpole1(1),'bx'); hold on;
plot(realCLpole1(end),imagCLpole1(end),'ro'); hold on;
if np>1
    plot(realCLpole2(1),imagCLpole2(1),'bx');
    plot(realCLpole2(end),imagCLpole2(end),'ro');
end
if np>2
    plot(realCLpole3(1),imagCLpole3(1),'bx');
    plot(realCLpole3(end),imagCLpole3(end),'ro');
end
if np>3
    plot(realCLpole4(1),imagCLpole4(1),'bx');
    plot(realCLpole4(end),imagCLpole4(end),'ro');
end
if np>4
    plot(realCLpole5(1),imagCLpole5(1),'bx');
    plot(realCLpole5(end),imagCLpole5(end),'ro');
end
if np>5
    plot(realCLpole6(1),imagCLpole6(1),'bx');
    plot(realCLpole6(end),imagCLpole6(end),'ro');
end
if np>6
    plot(realCLpole7(1),imagCLpole7(1),'bx');
    plot(realCLpole7(end),imagCLpole7(end),'ro');
end
if np>7
    plot(realCLpole8(1),imagCLpole8(1),'bx');
    plot(realCLpole8(end),imagCLpole8(end),'ro');
end
% Set limits of x- and y-axis
xlim([xmin xmax]) 
ylim([-ylimit ylimit])
xline(0)
yline(0)
grid off
% Define figure x/y-labels
ylabel('Imaginary Axis [rad/s]','interpreter','tex');
xlabel('Real Axis [rad/s]','interpreter','tex');
% check if there is a title, else set title to 0
try
    logical(Title == 0);
catch
    title(Title,'FontWeight','normal')
end
if nargin > 4
        if export == 0
            % clear
        else
            export = 1;
            % export to pdf using figexp
            figexp(Name, Folder,export)
        end
else
    figexp(Name, Folder,export)
end
end
