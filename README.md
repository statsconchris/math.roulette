## math.roulette : A Matlab / Octave (.m) code to simulate the results of the roulette 
To check the functionality of this code refer to the article:: [nepy.pe/en/math.roulette.](http://www.nepy.pe/en/programming/learning-to-code-with-the-roulette-and-answering-if-we-are-alone-in-the-universe/) 

There are 3 files:

1. rouletteDeterministicUS.m : The bet is fixed, e.g., red color bet.
2. rouletteStochasticUS.m : The bet is random, e.g., in each round a random number is chosen.
3. rouletteMartingaleUS.m : The bet considers the Martingale strategy.

All files require an input value. Details are self-explained in the code.
For the parameters given (laps = 1000000), each file takes to compute less than 1 minute in Matlab and more than 5 minutes in Octave.
