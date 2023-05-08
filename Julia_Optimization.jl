using TickTock
tick()

using Pkg
Pkg.add("JuMP")
Pkg.add("GLPK")

using JuMP
using GLPK


#Define the model
m = Model();

#set optimizer
set_optimizer(m,GLPK.Optimizer);

#Define the variables
@variable(m, x>=0);
@variable(m, y>=0);

#Define constraints
@constraint(m, x+y<=5);
@constraint(m, 10x+8y<=900);

#Define objective function
@objective(m, Max, 5x + 10y);

# RUn solver
optimize!(m);

#output
println(objective_value(m))
println("x= ", value.(x), "\n", "y= ", value.(y))

tock()