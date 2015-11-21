the webpage link: https://littlefoxshiny.shinyapps.io/myapp

Background of the application.

Simulation of Dynamic System

In general, a stochastic dynamic system is a dynamic system which subjected to the effects of noise. It can be described by the state-space model. Next, I will show how to simulate a stochastic dynamic system with the dynmaic equation xn = x/2 + 25* x/(1+x*x) + 8 * cos(1.2*k) + n. Note, x and xn are the the state value at current and next time instant, respectively. k is the discrete time instants. n is the random noise. The simulation step is 250. In the left side, the initial value of x and the variance of the noise can be tunned. On the rightside, three figures are shown. The first shows the state value without the noise. The second figure shows the state value with the noise and the nosie value is shown in the third figure. With the increasing of the variance of noise, the noise value becomes large. The state value therefore is far from the true value (without noise).