--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:22:58 10/18/2015
-- Design Name:   
-- Module Name:   C:/Users/Javier Armenta/Documents/Xilinx_proyectos/Multiplicador/simulacion.vhd
-- Project Name:  Multiplicador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simulacion IS
END simulacion;
 
ARCHITECTURE behavior OF simulacion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         Y : IN  std_logic_vector(7 downto 0);
         X : IN  std_logic_vector(7 downto 0);
         P : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Y : std_logic_vector(7 downto 0) := (others => '0');
   signal X : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          Y => Y,
          X => X,
          P => P
        );

 Y <= "00000000" after 500 ns, "00101010" after 1000 ns, "00010110" after 1500 ns;
 X <= "00000000" after 500 ns, "00101010" after 1000 ns, "00010110" after 1500 ns;
END;
