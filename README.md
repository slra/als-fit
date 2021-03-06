ALS-FIT: adjusted least squares for algebraic hypersurface fitting
==============================================================================
This package contains a collection of functions for algebraic hypersurface fitting,
including the ordinary least squares and adjusted least squares methods described in

    @techreport{als14,
        author = {K. Usevich and I. Markovsky},
        title = {Adjusted least squares fitting of algebraic hypersurfaces},
        url = {http://arxiv.org/abs/1412.2291},
        pdf = {http://arxiv.org/pdf/1412.2291v1.pdf},
        year = {2014},
    }

Using the package
-----------------

The main four functions are `algebraicFit`, `geometricFit`, `alsKsigmaFit` and `alsUsigmaFit`.

All the functions have a common interface
    
    [theta, ...] = xxxxFit(D, A, ...)

where D is an array of data point and A is the matrix of multidegrees,
and theta is the computed estimate.

All the separate functions are documented, 
help for the functions can be obtained by typing `help ...`.
The list of functions can be obtaioned

Examples of usage can be found contained in the directory `test`,
where the reproducible examples from the paper are contained.
