ESrank: Poly-Logarithmic Side Channel Rank Estimation via Exponential Sampling

This is a Matlab implementation.

The main function is ESrank:
Input:
   gamma   - should be a number between 1<gamma<=2
   b       - b should be an integer s.t. (b+1)/b<=gamma
   d       - d is the dimension, i.e., the number of the probability distributions
   keyProb - is the probability of a given key
Return:
   [lower,upper] - a lower and an upper bounds on the rank of the key whose probability is keyProb 


ESrank reads d files: 1.txt, 2.txt, 3.txt., ...
Each file "i.txt" contains P_i, i.e., a probability distribution, each probability in a new line.
Each probability distribution is sorted in non-increasing order of probabilities.

An example for usage:
[lower,upper] = ESrank(1.025,41,8)


Copyright (C) Avishai Wool and Liron David, 2019. All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

If you find this software useful, we ask that you cite our paper:

@inproceedings{david2019poly,
  title={Poly-logarithmic side channel rank estimation via exponential sampling},
  author={David, Liron and Wool, Avishai},
  booktitle={Cryptographers’ Track at the RSA Conference},
  pages={330--349},
  year={2019},
  organization={Springer}
}

Liron David and Avishai Wool.
Poly-Logarithmic Side Channel Rank Estimation via Exponential Sampling
RSA 2019
Technical report https://eprint.iacr.org/2018/867.pdf


Send comments / requests / patches to:
   Liron David <lirondavid@gmail.com>
  

