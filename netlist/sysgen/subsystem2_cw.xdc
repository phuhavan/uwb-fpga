

# Global period constraint
create_clock -name clk -period 20.0 [get_ports clk]
# LOC constraints
set_property LOC Fixed [get_ports clk]
