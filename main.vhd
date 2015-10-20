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
function maj (i1,i2,i3 : std_logic) return std_logic is 
begin 
	return ((i1 and i2) or (i1 and i3) or (i2 and i3));
end maj;
begin -------------------
process (X,Y)
type array8x8 is array (0 to 7) of std_logic_vector (7 downto 0);
variable pc: array8x8; --bits de componente 
variable pcs: array8x8; --bits de suma del sumador completo
variable pcc: array8x8;	--bits de salida de acarreo del sumador completo 
variable ras,rac: std_logic_vector (7 downto 0); --suma de sumador en rizo
begin --inicia proceso
	for i in 0 to 7 loop for j in 0 to 7 loop 
		pc(i)(j) := y(i) and X(j); --calculo de bits de componente de producto
	end loop; end loop;
	for j in 0 to 7 loop 
		pcs(0)(j) := pc(0)(j);	--inicializar primer renglon virtual
		pcc(0)(j) := '0';		--sumadores 
	end loop;	
	for i in 1 to 7 loop  --hacer todos los sumadores completos excepto el ultimo renglon
		for j in 0 to 6 loop 
		pcs(i)(j) := pc(i)(j) xor pcs(i-1)(j+1) xor pcc(i-1)(j);
		pcc(i)(j) := maj(pc(i)(j), pcs(i-1)(j+1),pcc(i-1)(j));
		pcs(i)(7) := pc (i)(7);  -- señal de suma del sumador virtual que esta en el extremo izquierdo 
		end loop;
	end loop;
	rac(0) := '0';
	for i in 0 to 6 loop  --sumador en rizo final 
		ras(i) := pcs(7)(i+1) xor pcc(7)(i) xor rac(i);
		rac(i+1) := maj(pcs(7)(i+1),pcc(7)(i),rac(i));
	end loop;
	for i in 0 to 7 loop 
		p(i) <= pcs(i)(0);  --primeros 8 bits de producto de las sumas del sumador 
	end loop;
	for i in 8 to 14 loop 
		p(i) <= ras(i-8); --siguientes 7 bits de la sumas del sumador en rizo 
	end loop;
	p(15) <= rac(7); --ultimo bit del acarreo del sumador en rizo

end process;
end Behavioral;

