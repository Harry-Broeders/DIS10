hs = tf(1000*2*pi, [1 1000*2*pi]);
hz = c2d(hs, 1/8000, 'tustin')
opts = bodeoptions;
opts.Title.String = '';
opts.FreqUnits = 'Hz';
opts.FreqScale = 'linear';
opts.grid = 'on';
opts.Xlim = [0 8000];
h = bodeplot(hz, opts);
L = findobj(gcf, 'type' , 'line')
set(L, 'Color', [204/255 0 51/255]);
%http://nl.mathworks.com/help/matlab/ref/datacursormode.html
%You place data tips only by clicking data objects on graphs.
%You cannot place them programmatically (by executing code to position a data cursor).
%Set datamarkers for f=1000Hz and press any key
pause
%generate pdf file for use in LaTeX
file = '../figs/lpfzbodelin';
print(gcf,'-dpdf', file);
system(sprintf('pdfcrop %s.pdf %s.pdf', file, file));