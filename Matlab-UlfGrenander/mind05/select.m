function number=select(probs)
%selects at random integer from 1 to length(probs) with probabilities in "probs"
r=length(probs);
number=1+sum(rand(1)>cumsum(probs));