# WASP

Using data from past matches, it is possible to predict the score of the team batting in the
first innings given the running circumstances of the limited overs match. The entire work
involves a dynamic programming model and thus works backwards to calculate the total
runs.

Let E(b,w) be the expected additional no. of runs to be made when b balls have been
bowled and w wickets have fallen. Further, let r(b,w) be the expected runs to be made in
the ball no. b+1 when w wickets have fallen and let p(b,w) be the probability of losing a
wicket on the ball no. b+1 when w wickets have already fallen.

E[b,w] = r(b,w) + E(b+1,w+1)*p(b,w) + E(b+1,w)*(1-p(b,w))

Boundary Condition:
Since no additional runs are to be made after 300 balls in an ODI match, we set E(300, w)
= 0 (where w = 0, 1, ... , 10). Using this condition, the model can be solved backwards to
calculate the entire E matrix.

