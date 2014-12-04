A = trgSet(2, 2);
save2pdf('intro1.pdf', testCurveFitting(A(:,[1 4 6]), [-1 1 -1], [-2 2 -2.5 2.5], 20, 0.3, 'n2')) %intro1
save2pdf('intro2.pdf', testCurveFitting(degSet(2,2), [-2  1 0], [-2 2 -1 1], 50, 0.1, 'n2'))

%testCurveFitting([0 1 -2], [-2 2 -1 1], 20, degSet(2,2), 0.1, 'tn0123')

[h1] = testCurveFitting(A, [-2 0 0 2 -3 4.25], [-1.5 1.5 -1.2 1.2],  30,  0.15, 'n2');
[h2] = testCurveFitting(A, [-2 0 0 2 -3 4.25], [-1.5 1.5 -1.2 1.2], 30,  0.15, 'tn012')
save2pdf('estim1.pdf', h1)
save2pdf('estim2.pdf', h2)

[h3] = testCurveFitting(trgSet(2,2), [1 0 -1 1 0 0], [-1 1 1 2.2], 20, 0.1, 'tn012', 'parabola');
save2pdf('estim3.pdf', h3)





  
