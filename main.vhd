----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:07 10/18/2015 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( Y : in  STD_LOGIC_VECTOR (7 downto 0);
           X : in  STD_LOGIC_VECTOR (7 downto 0);
           P : out  STD_LOGIC_VECTOR (15 downto 0));
end main;

architecture Behavioral of main is
type array8x8 is array (0 to 15)  of std_logic_vector (15 downto 0);
signal componentes: array8x8;
signal Y_buffer :  STD_LOGIC_VECTOR (15 downto 0);
signal X_buffer :STD_LOGIC_VECTOR (15 downto 0);
signal P_buffer  :STD_LOGIC_VECTOR (15 downto 0);
begin
Y_buffer <= "00000000" & y;
X_buffer <= "00000000" & x;

process (y,x)
 begin 
	for i in 0 to 15 loop for j in 0 to 15 loop 
		componentes(i)(j) <= y_buffer(i) and x_buffer(j) ;
	end loop;	end loop;
	
end process;	



P_buffer <= Y_buffer + X_buffer;
p <= p_buffer;


end Behavioral;

