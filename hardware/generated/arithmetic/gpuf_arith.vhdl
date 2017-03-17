--------------------------------------------------------------------------------
--                     SmallMultTableP2x2r4XuYu_F100_uid9
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid9 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid9 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                    SmallMultTableP2x2r4XuYu_F100_uid20
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid20 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid20 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                    SmallMultTableP2x2r4XuYu_F100_uid31
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid31 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid31 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                    SmallMultTableP2x2r4XuYu_F100_uid36
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid36 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid36 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                    SmallMultTableP2x2r4XuYu_F100_uid47
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid47 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid47 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                    SmallMultTableP2x2r4XuYu_F100_uid58
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP2x2r4XuYu_F100_uid58 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(3 downto 0);
          Y : out  std_logic_vector(3 downto 0)   );
end entity;

architecture arch of SmallMultTableP2x2r4XuYu_F100_uid58 is
signal TableOut :  std_logic_vector(3 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "0000" when "0000",
   "0000" when "0001",
   "0000" when "0010",
   "0000" when "0011",
   "0000" when "0100",
   "0001" when "0101",
   "0010" when "0110",
   "0011" when "0111",
   "0000" when "1000",
   "0010" when "1001",
   "0100" when "1010",
   "0110" when "1011",
   "0000" when "1100",
   "0011" when "1101",
   "0110" when "1110",
   "1001" when "1111",
   "----" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                              Compressor_14_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "001" when "01000", 
      "010" when "01001", 
      "010" when "01010", 
      "011" when "01011", 
      "010" when "01100", 
      "011" when "01101", 
      "011" when "01110", 
      "100" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "011" when "11000", 
      "100" when "11001", 
      "100" when "11010", 
      "101" when "11011", 
      "100" when "11100", 
      "101" when "11101", 
      "101" when "11110", 
      "110" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_23_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "010" when "01000", 
      "011" when "01001", 
      "011" when "01010", 
      "100" when "01011", 
      "011" when "01100", 
      "100" when "01101", 
      "100" when "01110", 
      "101" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "100" when "11000", 
      "101" when "11001", 
      "101" when "11010", 
      "110" when "11011", 
      "101" when "11100", 
      "110" when "11101", 
      "110" when "11110", 
      "111" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_13_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_13_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_13_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "0000", 
      "001" when "0001", 
      "001" when "0010", 
      "010" when "0011", 
      "001" when "0100", 
      "010" when "0101", 
      "010" when "0110", 
      "011" when "0111", 
      "010" when "1000", 
      "011" when "1001", 
      "011" when "1010", 
      "100" when "1011", 
      "011" when "1100", 
      "100" when "1101", 
      "100" when "1110", 
      "101" when "1111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_3_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_3_2 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2 is
signal X :  std_logic_vector(2 downto 0);
begin
   X <=X0 ;
   with X select R <= 
      "00" when "000", 
      "01" when "001", 
      "01" when "010", 
      "10" when "011", 
      "01" when "100", 
      "10" when "101", 
      "10" when "110", 
      "11" when "111", 
      "--" when others;

end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_36_f100_uid105
--                     (IntAdderClassical_36_F100_uid107)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_36_f100_uid105 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(35 downto 0);
          Y : in  std_logic_vector(35 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(35 downto 0)   );
end entity;

architecture arch of IntAdder_36_f100_uid105 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--             IntMultiplier_UsingDSP_18_18_36_unsigned_F100_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_18_18_36_unsigned_F100_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          Y : in  std_logic_vector(17 downto 0);
          R : out  std_logic_vector(35 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_18_18_36_unsigned_F100_uid4 is
   component IntAdder_36_f100_uid105 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(35 downto 0);
             Y : in  std_logic_vector(35 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(35 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid9 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid20 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid31 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid36 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid47 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component SmallMultTableP2x2r4XuYu_F100_uid58 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(3 downto 0);
             Y : out  std_logic_vector(3 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_13_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

signal XX_m5 :  std_logic_vector(17 downto 0);
signal YY_m5 :  std_logic_vector(17 downto 0);
signal Xp_m5b7 :  std_logic_vector(7 downto 0);
signal Yp_m5b7 :  std_logic_vector(1 downto 0);
signal x_m5b7_0 :  std_logic_vector(1 downto 0);
signal x_m5b7_1 :  std_logic_vector(1 downto 0);
signal x_m5b7_2 :  std_logic_vector(1 downto 0);
signal x_m5b7_3 :  std_logic_vector(1 downto 0);
signal y_m5b7_0 :  std_logic_vector(1 downto 0);
signal Y0X0_7_m5 :  std_logic_vector(3 downto 0);
signal PP7X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w10_0 :  std_logic;
signal heap_bh6_w11_0 :  std_logic;
signal heap_bh6_w12_0 :  std_logic;
signal Y0X1_7_m5 :  std_logic_vector(3 downto 0);
signal PP7X1Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w12_1 :  std_logic;
signal heap_bh6_w13_0 :  std_logic;
signal heap_bh6_w14_0 :  std_logic;
signal Y0X2_7_m5 :  std_logic_vector(3 downto 0);
signal PP7X2Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w14_1 :  std_logic;
signal heap_bh6_w15_0 :  std_logic;
signal heap_bh6_w16_0 :  std_logic;
signal Y0X3_7_m5 :  std_logic_vector(3 downto 0);
signal PP7X3Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w16_1 :  std_logic;
signal heap_bh6_w17_0 :  std_logic;
signal heap_bh6_w18_0 :  std_logic;
signal Xp_m5b18 :  std_logic_vector(7 downto 0);
signal Yp_m5b18 :  std_logic_vector(1 downto 0);
signal x_m5b18_0 :  std_logic_vector(1 downto 0);
signal x_m5b18_1 :  std_logic_vector(1 downto 0);
signal x_m5b18_2 :  std_logic_vector(1 downto 0);
signal x_m5b18_3 :  std_logic_vector(1 downto 0);
signal y_m5b18_0 :  std_logic_vector(1 downto 0);
signal Y0X0_18_m5 :  std_logic_vector(3 downto 0);
signal PP18X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w2_0 :  std_logic;
signal heap_bh6_w3_0 :  std_logic;
signal heap_bh6_w4_0 :  std_logic;
signal Y0X1_18_m5 :  std_logic_vector(3 downto 0);
signal PP18X1Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w4_1 :  std_logic;
signal heap_bh6_w5_0 :  std_logic;
signal heap_bh6_w6_0 :  std_logic;
signal Y0X2_18_m5 :  std_logic_vector(3 downto 0);
signal PP18X2Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w6_1 :  std_logic;
signal heap_bh6_w7_0 :  std_logic;
signal heap_bh6_w8_0 :  std_logic;
signal Y0X3_18_m5 :  std_logic_vector(3 downto 0);
signal PP18X3Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w8_1 :  std_logic;
signal heap_bh6_w9_0 :  std_logic;
signal heap_bh6_w10_1 :  std_logic;
signal Xp_m5b29 :  std_logic_vector(1 downto 0);
signal Yp_m5b29 :  std_logic_vector(1 downto 0);
signal x_m5b29_0 :  std_logic_vector(1 downto 0);
signal y_m5b29_0 :  std_logic_vector(1 downto 0);
signal Y0X0_29_m5 :  std_logic_vector(3 downto 0);
signal PP29X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w1_0 :  std_logic;
signal heap_bh6_w2_1 :  std_logic;
signal Xp_m5b34 :  std_logic_vector(1 downto 0);
signal Yp_m5b34 :  std_logic_vector(7 downto 0);
signal x_m5b34_0 :  std_logic_vector(1 downto 0);
signal y_m5b34_0 :  std_logic_vector(1 downto 0);
signal y_m5b34_1 :  std_logic_vector(1 downto 0);
signal y_m5b34_2 :  std_logic_vector(1 downto 0);
signal y_m5b34_3 :  std_logic_vector(1 downto 0);
signal Y0X0_34_m5 :  std_logic_vector(3 downto 0);
signal PP34X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w10_2 :  std_logic;
signal heap_bh6_w11_1 :  std_logic;
signal heap_bh6_w12_2 :  std_logic;
signal Y1X0_34_m5 :  std_logic_vector(3 downto 0);
signal PP34X0Y1_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w12_3 :  std_logic;
signal heap_bh6_w13_1 :  std_logic;
signal heap_bh6_w14_2 :  std_logic;
signal Y2X0_34_m5 :  std_logic_vector(3 downto 0);
signal PP34X0Y2_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w14_3 :  std_logic;
signal heap_bh6_w15_1 :  std_logic;
signal heap_bh6_w16_2 :  std_logic;
signal Y3X0_34_m5 :  std_logic_vector(3 downto 0);
signal PP34X0Y3_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w16_3 :  std_logic;
signal heap_bh6_w17_1 :  std_logic;
signal heap_bh6_w18_1 :  std_logic;
signal Xp_m5b45 :  std_logic_vector(1 downto 0);
signal Yp_m5b45 :  std_logic_vector(7 downto 0);
signal x_m5b45_0 :  std_logic_vector(1 downto 0);
signal y_m5b45_0 :  std_logic_vector(1 downto 0);
signal y_m5b45_1 :  std_logic_vector(1 downto 0);
signal y_m5b45_2 :  std_logic_vector(1 downto 0);
signal y_m5b45_3 :  std_logic_vector(1 downto 0);
signal Y0X0_45_m5 :  std_logic_vector(3 downto 0);
signal PP45X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w2_2 :  std_logic;
signal heap_bh6_w3_1 :  std_logic;
signal heap_bh6_w4_2 :  std_logic;
signal Y1X0_45_m5 :  std_logic_vector(3 downto 0);
signal PP45X0Y1_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w4_3 :  std_logic;
signal heap_bh6_w5_1 :  std_logic;
signal heap_bh6_w6_2 :  std_logic;
signal Y2X0_45_m5 :  std_logic_vector(3 downto 0);
signal PP45X0Y2_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w6_3 :  std_logic;
signal heap_bh6_w7_1 :  std_logic;
signal heap_bh6_w8_2 :  std_logic;
signal Y3X0_45_m5 :  std_logic_vector(3 downto 0);
signal PP45X0Y3_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w8_3 :  std_logic;
signal heap_bh6_w9_1 :  std_logic;
signal heap_bh6_w10_3 :  std_logic;
signal Xp_m5b56 :  std_logic_vector(1 downto 0);
signal Yp_m5b56 :  std_logic_vector(1 downto 0);
signal x_m5b56_0 :  std_logic_vector(1 downto 0);
signal y_m5b56_0 :  std_logic_vector(1 downto 0);
signal Y0X0_56_m5 :  std_logic_vector(3 downto 0);
signal PP56X0Y0_m5 :  std_logic_vector(3 downto 0);
signal heap_bh6_w0_0 :  std_logic;
signal heap_bh6_w1_1 :  std_logic;
signal heap_bh6_w2_3 :  std_logic;
signal DSP_bh6_ch0_0 :  std_logic_vector(33 downto 0);
signal heap_bh6_w35_0 :  std_logic;
signal heap_bh6_w34_0 :  std_logic;
signal heap_bh6_w33_0 :  std_logic;
signal heap_bh6_w32_0 :  std_logic;
signal heap_bh6_w31_0 :  std_logic;
signal heap_bh6_w30_0 :  std_logic;
signal heap_bh6_w29_0 :  std_logic;
signal heap_bh6_w28_0 :  std_logic;
signal heap_bh6_w27_0 :  std_logic;
signal heap_bh6_w26_0 :  std_logic;
signal heap_bh6_w25_0 :  std_logic;
signal heap_bh6_w24_0 :  std_logic;
signal heap_bh6_w23_0 :  std_logic;
signal heap_bh6_w22_0 :  std_logic;
signal heap_bh6_w21_0 :  std_logic;
signal heap_bh6_w20_0 :  std_logic;
signal heap_bh6_w19_0 :  std_logic;
signal heap_bh6_w18_2 :  std_logic;
signal heap_bh6_w17_2 :  std_logic;
signal heap_bh6_w16_4 :  std_logic;
signal heap_bh6_w15_2 :  std_logic;
signal heap_bh6_w14_4 :  std_logic;
signal heap_bh6_w13_2 :  std_logic;
signal heap_bh6_w12_4 :  std_logic;
signal heap_bh6_w11_2 :  std_logic;
signal heap_bh6_w10_4 :  std_logic;
signal heap_bh6_w9_2 :  std_logic;
signal heap_bh6_w8_4 :  std_logic;
signal heap_bh6_w7_2 :  std_logic;
signal heap_bh6_w6_4 :  std_logic;
signal heap_bh6_w5_2 :  std_logic;
signal heap_bh6_w4_4 :  std_logic;
signal heap_bh6_w3_2 :  std_logic;
signal heap_bh6_w2_4 :  std_logic;
signal tempR_bh6_0 :  std_logic;
signal CompressorIn_bh6_0_0 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_0_1 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh6_w2_5 :  std_logic;
signal heap_bh6_w3_3 :  std_logic;
signal heap_bh6_w4_5 :  std_logic;
signal CompressorIn_bh6_1_2 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_1_3 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh6_w4_6 :  std_logic;
signal heap_bh6_w5_3 :  std_logic;
signal heap_bh6_w6_5 :  std_logic;
signal CompressorIn_bh6_2_4 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_2_5 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_6 :  std_logic;
signal heap_bh6_w7_3 :  std_logic;
signal heap_bh6_w8_5 :  std_logic;
signal CompressorIn_bh6_3_6 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_3_7 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh6_w8_6 :  std_logic;
signal heap_bh6_w9_3 :  std_logic;
signal heap_bh6_w10_5 :  std_logic;
signal CompressorIn_bh6_4_8 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_4_9 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_6 :  std_logic;
signal heap_bh6_w11_3 :  std_logic;
signal heap_bh6_w12_5 :  std_logic;
signal CompressorIn_bh6_5_10 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_5_11 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_6 :  std_logic;
signal heap_bh6_w13_3 :  std_logic;
signal heap_bh6_w14_5 :  std_logic;
signal CompressorIn_bh6_6_12 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_6_13 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_6 :  std_logic;
signal heap_bh6_w15_3 :  std_logic;
signal heap_bh6_w16_5 :  std_logic;
signal CompressorIn_bh6_7_14 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_7_15 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_6 :  std_logic;
signal heap_bh6_w17_3 :  std_logic;
signal heap_bh6_w18_3 :  std_logic;
signal CompressorIn_bh6_8_16 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_8_8 :  std_logic_vector(1 downto 0);
signal heap_bh6_w18_4 :  std_logic;
signal heap_bh6_w19_1 :  std_logic;
signal CompressorIn_bh6_9_17 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_9_18 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh6_w3_4 :  std_logic;
signal heap_bh6_w4_7 :  std_logic;
signal heap_bh6_w5_4 :  std_logic;
signal CompressorIn_bh6_10_19 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_10_20 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh6_w5_5 :  std_logic;
signal heap_bh6_w6_7 :  std_logic;
signal heap_bh6_w7_4 :  std_logic;
signal CompressorIn_bh6_11_21 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_11_22 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_5 :  std_logic;
signal heap_bh6_w8_7 :  std_logic;
signal heap_bh6_w9_4 :  std_logic;
signal CompressorIn_bh6_12_23 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_12_24 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_12_12 :  std_logic_vector(2 downto 0);
signal heap_bh6_w9_5 :  std_logic;
signal heap_bh6_w10_7 :  std_logic;
signal heap_bh6_w11_4 :  std_logic;
signal CompressorIn_bh6_13_25 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_13_26 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_13_13 :  std_logic_vector(2 downto 0);
signal heap_bh6_w11_5 :  std_logic;
signal heap_bh6_w12_7 :  std_logic;
signal heap_bh6_w13_4 :  std_logic;
signal CompressorIn_bh6_14_27 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_14_28 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_14_14 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_5 :  std_logic;
signal heap_bh6_w14_7 :  std_logic;
signal heap_bh6_w15_4 :  std_logic;
signal CompressorIn_bh6_15_29 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_15_30 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_15_15 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_5 :  std_logic;
signal heap_bh6_w16_7 :  std_logic;
signal heap_bh6_w17_4 :  std_logic;
signal CompressorIn_bh6_16_31 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_16_32 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_16_16 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_5 :  std_logic;
signal heap_bh6_w18_5 :  std_logic;
signal heap_bh6_w19_2 :  std_logic;
signal CompressorIn_bh6_17_33 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_17_34 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_17_17 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_3 :  std_logic;
signal heap_bh6_w20_1 :  std_logic;
signal heap_bh6_w21_1 :  std_logic;
signal finalAdderIn0_bh6 :  std_logic_vector(35 downto 0);
signal finalAdderIn1_bh6 :  std_logic_vector(35 downto 0);
signal finalAdderCin_bh6 :  std_logic;
signal finalAdderOut_bh6 :  std_logic_vector(35 downto 0);
signal CompressionResult6 :  std_logic_vector(36 downto 0);
attribute altera_attribute: string;
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid20: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid31: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid36: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid47: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid58: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
attribute altera_attribute of SmallMultTableP2x2r4XuYu_F100_uid9: component is "-name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   XX_m5 <= X ;
   YY_m5 <= Y ;
   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=10 lsbY=0 msbX=18 msbY=1
   Xp_m5b7 <= XX_m5(17 downto 10) & "";
   Yp_m5b7 <= YY_m5(0 downto 0) & "0";
   x_m5b7_0 <= Xp_m5b7(1 downto 0);
   x_m5b7_1 <= Xp_m5b7(3 downto 2);
   x_m5b7_2 <= Xp_m5b7(5 downto 4);
   x_m5b7_3 <= Xp_m5b7(7 downto 6);
   y_m5b7_0 <= Yp_m5b7(1 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_7_m5 <= y_m5b7_0 & x_m5b7_0;
   PP_m5_7X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_7_m5,
                 Y => PP7X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w10_0 <= PP7X0Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w11_0 <= PP7X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w12_0 <= PP7X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X1_7_m5 <= y_m5b7_0 & x_m5b7_1;
   PP_m5_7X1Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_7_m5,
                 Y => PP7X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_1 <= PP7X1Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w13_0 <= PP7X1Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w14_0 <= PP7X1Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X2_7_m5 <= y_m5b7_0 & x_m5b7_2;
   PP_m5_7X2Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_7_m5,
                 Y => PP7X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w14_1 <= PP7X2Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w15_0 <= PP7X2Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w16_0 <= PP7X2Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X3_7_m5 <= y_m5b7_0 & x_m5b7_3;
   PP_m5_7X3Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid9  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_7_m5,
                 Y => PP7X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w16_1 <= PP7X3Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w17_0 <= PP7X3Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w18_0 <= PP7X3Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=2 lsbY=0 msbX=10 msbY=1
   Xp_m5b18 <= XX_m5(9 downto 2) & "";
   Yp_m5b18 <= YY_m5(0 downto 0) & "0";
   x_m5b18_0 <= Xp_m5b18(1 downto 0);
   x_m5b18_1 <= Xp_m5b18(3 downto 2);
   x_m5b18_2 <= Xp_m5b18(5 downto 4);
   x_m5b18_3 <= Xp_m5b18(7 downto 6);
   y_m5b18_0 <= Yp_m5b18(1 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_18_m5 <= y_m5b18_0 & x_m5b18_0;
   PP_m5_18X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_18_m5,
                 Y => PP18X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_0 <= PP18X0Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w3_0 <= PP18X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w4_0 <= PP18X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X1_18_m5 <= y_m5b18_0 & x_m5b18_1;
   PP_m5_18X1Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_18_m5,
                 Y => PP18X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w4_1 <= PP18X1Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w5_0 <= PP18X1Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w6_0 <= PP18X1Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X2_18_m5 <= y_m5b18_0 & x_m5b18_2;
   PP_m5_18X2Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_18_m5,
                 Y => PP18X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_1 <= PP18X2Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w7_0 <= PP18X2Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w8_0 <= PP18X2Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   Y0X3_18_m5 <= y_m5b18_0 & x_m5b18_3;
   PP_m5_18X3Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid20  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_18_m5,
                 Y => PP18X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w8_1 <= PP18X3Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w9_0 <= PP18X3Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w10_1 <= PP18X3Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=1 lsbY=0 msbX=2 msbY=1
   Xp_m5b29 <= XX_m5(1 downto 1) & "0";
   Yp_m5b29 <= YY_m5(0 downto 0) & "0";
   x_m5b29_0 <= Xp_m5b29(1 downto 0);
   y_m5b29_0 <= Yp_m5b29(1 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_29_m5 <= y_m5b29_0 & x_m5b29_0;
   PP_m5_29X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid31  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_29_m5,
                 Y => PP29X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w1_0 <= PP29X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w2_1 <= PP29X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=10 msbX=1 msbY=18
   Xp_m5b34 <= XX_m5(0 downto 0) & "0";
   Yp_m5b34 <= YY_m5(17 downto 10) & "";
   x_m5b34_0 <= Xp_m5b34(1 downto 0);
   y_m5b34_0 <= Yp_m5b34(1 downto 0);
   y_m5b34_1 <= Yp_m5b34(3 downto 2);
   y_m5b34_2 <= Yp_m5b34(5 downto 4);
   y_m5b34_3 <= Yp_m5b34(7 downto 6);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_34_m5 <= y_m5b34_0 & x_m5b34_0;
   PP_m5_34X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_34_m5,
                 Y => PP34X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w10_2 <= PP34X0Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w11_1 <= PP34X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w12_2 <= PP34X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 1
   Y1X0_34_m5 <= y_m5b34_1 & x_m5b34_0;
   PP_m5_34X0Y1_Tbl: SmallMultTableP2x2r4XuYu_F100_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_34_m5,
                 Y => PP34X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_3 <= PP34X0Y1_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w13_1 <= PP34X0Y1_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w14_2 <= PP34X0Y1_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 2
   Y2X0_34_m5 <= y_m5b34_2 & x_m5b34_0;
   PP_m5_34X0Y2_Tbl: SmallMultTableP2x2r4XuYu_F100_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_34_m5,
                 Y => PP34X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w14_3 <= PP34X0Y2_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w15_1 <= PP34X0Y2_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w16_2 <= PP34X0Y2_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 3
   Y3X0_34_m5 <= y_m5b34_3 & x_m5b34_0;
   PP_m5_34X0Y3_Tbl: SmallMultTableP2x2r4XuYu_F100_uid36  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_34_m5,
                 Y => PP34X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w16_3 <= PP34X0Y3_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w17_1 <= PP34X0Y3_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w18_1 <= PP34X0Y3_m5(3); -- cycle= 0 cp= 7.61e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=2 msbX=1 msbY=10
   Xp_m5b45 <= XX_m5(0 downto 0) & "0";
   Yp_m5b45 <= YY_m5(9 downto 2) & "";
   x_m5b45_0 <= Xp_m5b45(1 downto 0);
   y_m5b45_0 <= Yp_m5b45(1 downto 0);
   y_m5b45_1 <= Yp_m5b45(3 downto 2);
   y_m5b45_2 <= Yp_m5b45(5 downto 4);
   y_m5b45_3 <= Yp_m5b45(7 downto 6);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_45_m5 <= y_m5b45_0 & x_m5b45_0;
   PP_m5_45X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid47  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_45_m5,
                 Y => PP45X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w2_2 <= PP45X0Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w3_1 <= PP45X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w4_2 <= PP45X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 1
   Y1X0_45_m5 <= y_m5b45_1 & x_m5b45_0;
   PP_m5_45X0Y1_Tbl: SmallMultTableP2x2r4XuYu_F100_uid47  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_45_m5,
                 Y => PP45X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w4_3 <= PP45X0Y1_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w5_1 <= PP45X0Y1_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w6_2 <= PP45X0Y1_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 2
   Y2X0_45_m5 <= y_m5b45_2 & x_m5b45_0;
   PP_m5_45X0Y2_Tbl: SmallMultTableP2x2r4XuYu_F100_uid47  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_45_m5,
                 Y => PP45X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_3 <= PP45X0Y2_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w7_1 <= PP45X0Y2_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w8_2 <= PP45X0Y2_m5(3); -- cycle= 0 cp= 7.61e-10

   -- Partial product row number 3
   Y3X0_45_m5 <= y_m5b45_3 & x_m5b45_0;
   PP_m5_45X0Y3_Tbl: SmallMultTableP2x2r4XuYu_F100_uid47  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_45_m5,
                 Y => PP45X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w8_3 <= PP45X0Y3_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w9_1 <= PP45X0Y3_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w10_3 <= PP45X0Y3_m5(3); -- cycle= 0 cp= 7.61e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=0 msbX=1 msbY=2
   Xp_m5b56 <= XX_m5(0 downto 0) & "0";
   Yp_m5b56 <= YY_m5(1 downto 0) & "";
   x_m5b56_0 <= Xp_m5b56(1 downto 0);
   y_m5b56_0 <= Yp_m5b56(1 downto 0);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_56_m5 <= y_m5b56_0 & x_m5b56_0;
   PP_m5_56X0Y0_Tbl: SmallMultTableP2x2r4XuYu_F100_uid58  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_56_m5,
                 Y => PP56X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w0_0 <= PP56X0Y0_m5(1); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w1_1 <= PP56X0Y0_m5(2); -- cycle= 0 cp= 7.61e-10
   heap_bh6_w2_3 <= PP56X0Y0_m5(3); -- cycle= 0 cp= 7.61e-10

   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch0_0 <= std_logic_vector(unsigned("" & XX_m5(17 downto 1) & "") * unsigned("" & YY_m5(17 downto 1) & ""));
   heap_bh6_w35_0 <= DSP_bh6_ch0_0(33); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w34_0 <= DSP_bh6_ch0_0(32); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w33_0 <= DSP_bh6_ch0_0(31); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w32_0 <= DSP_bh6_ch0_0(30); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w31_0 <= DSP_bh6_ch0_0(29); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w30_0 <= DSP_bh6_ch0_0(28); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w29_0 <= DSP_bh6_ch0_0(27); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w28_0 <= DSP_bh6_ch0_0(26); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w27_0 <= DSP_bh6_ch0_0(25); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w26_0 <= DSP_bh6_ch0_0(24); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w25_0 <= DSP_bh6_ch0_0(23); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w24_0 <= DSP_bh6_ch0_0(22); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w23_0 <= DSP_bh6_ch0_0(21); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w22_0 <= DSP_bh6_ch0_0(20); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w21_0 <= DSP_bh6_ch0_0(19); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w20_0 <= DSP_bh6_ch0_0(18); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w19_0 <= DSP_bh6_ch0_0(17); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w18_2 <= DSP_bh6_ch0_0(16); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w17_2 <= DSP_bh6_ch0_0(15); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w16_4 <= DSP_bh6_ch0_0(14); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w15_2 <= DSP_bh6_ch0_0(13); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w14_4 <= DSP_bh6_ch0_0(12); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w13_2 <= DSP_bh6_ch0_0(11); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w12_4 <= DSP_bh6_ch0_0(10); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w11_2 <= DSP_bh6_ch0_0(9); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w10_4 <= DSP_bh6_ch0_0(8); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w9_2 <= DSP_bh6_ch0_0(7); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w8_4 <= DSP_bh6_ch0_0(6); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w7_2 <= DSP_bh6_ch0_0(5); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w6_4 <= DSP_bh6_ch0_0(4); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w5_2 <= DSP_bh6_ch0_0(3); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w4_4 <= DSP_bh6_ch0_0(2); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w3_2 <= DSP_bh6_ch0_0(1); -- cycle= 0 cp= 2.86e-09
   heap_bh6_w2_4 <= DSP_bh6_ch0_0(0); -- cycle= 0 cp= 2.86e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_0 <= heap_bh6_w0_0; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_0_0 <= heap_bh6_w2_3 & heap_bh6_w2_2 & heap_bh6_w2_1 & heap_bh6_w2_0;
   CompressorIn_bh6_0_1(0) <= heap_bh6_w3_1;
   Compressor_bh6_0: Compressor_14_3
      port map ( R => CompressorOut_bh6_0_0   ,
                 X0 => CompressorIn_bh6_0_0,
                 X1 => CompressorIn_bh6_0_1);
   heap_bh6_w2_5 <= CompressorOut_bh6_0_0(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w3_3 <= CompressorOut_bh6_0_0(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w4_5 <= CompressorOut_bh6_0_0(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_1_2 <= heap_bh6_w4_3 & heap_bh6_w4_2 & heap_bh6_w4_1 & heap_bh6_w4_0;
   CompressorIn_bh6_1_3(0) <= heap_bh6_w5_1;
   Compressor_bh6_1: Compressor_14_3
      port map ( R => CompressorOut_bh6_1_1   ,
                 X0 => CompressorIn_bh6_1_2,
                 X1 => CompressorIn_bh6_1_3);
   heap_bh6_w4_6 <= CompressorOut_bh6_1_1(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w5_3 <= CompressorOut_bh6_1_1(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w6_5 <= CompressorOut_bh6_1_1(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_2_4 <= heap_bh6_w6_3 & heap_bh6_w6_2 & heap_bh6_w6_1 & heap_bh6_w6_0;
   CompressorIn_bh6_2_5(0) <= heap_bh6_w7_1;
   Compressor_bh6_2: Compressor_14_3
      port map ( R => CompressorOut_bh6_2_2   ,
                 X0 => CompressorIn_bh6_2_4,
                 X1 => CompressorIn_bh6_2_5);
   heap_bh6_w6_6 <= CompressorOut_bh6_2_2(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w7_3 <= CompressorOut_bh6_2_2(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w8_5 <= CompressorOut_bh6_2_2(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_3_6 <= heap_bh6_w8_3 & heap_bh6_w8_2 & heap_bh6_w8_1 & heap_bh6_w8_0;
   CompressorIn_bh6_3_7(0) <= heap_bh6_w9_1;
   Compressor_bh6_3: Compressor_14_3
      port map ( R => CompressorOut_bh6_3_3   ,
                 X0 => CompressorIn_bh6_3_6,
                 X1 => CompressorIn_bh6_3_7);
   heap_bh6_w8_6 <= CompressorOut_bh6_3_3(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w9_3 <= CompressorOut_bh6_3_3(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w10_5 <= CompressorOut_bh6_3_3(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_4_8 <= heap_bh6_w10_3 & heap_bh6_w10_2 & heap_bh6_w10_1 & heap_bh6_w10_0;
   CompressorIn_bh6_4_9(0) <= heap_bh6_w11_1;
   Compressor_bh6_4: Compressor_14_3
      port map ( R => CompressorOut_bh6_4_4   ,
                 X0 => CompressorIn_bh6_4_8,
                 X1 => CompressorIn_bh6_4_9);
   heap_bh6_w10_6 <= CompressorOut_bh6_4_4(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w11_3 <= CompressorOut_bh6_4_4(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w12_5 <= CompressorOut_bh6_4_4(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_5_10 <= heap_bh6_w12_3 & heap_bh6_w12_2 & heap_bh6_w12_1 & heap_bh6_w12_0;
   CompressorIn_bh6_5_11(0) <= heap_bh6_w13_1;
   Compressor_bh6_5: Compressor_14_3
      port map ( R => CompressorOut_bh6_5_5   ,
                 X0 => CompressorIn_bh6_5_10,
                 X1 => CompressorIn_bh6_5_11);
   heap_bh6_w12_6 <= CompressorOut_bh6_5_5(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w13_3 <= CompressorOut_bh6_5_5(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w14_5 <= CompressorOut_bh6_5_5(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_6_12 <= heap_bh6_w14_3 & heap_bh6_w14_2 & heap_bh6_w14_1 & heap_bh6_w14_0;
   CompressorIn_bh6_6_13(0) <= heap_bh6_w15_1;
   Compressor_bh6_6: Compressor_14_3
      port map ( R => CompressorOut_bh6_6_6   ,
                 X0 => CompressorIn_bh6_6_12,
                 X1 => CompressorIn_bh6_6_13);
   heap_bh6_w14_6 <= CompressorOut_bh6_6_6(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w15_3 <= CompressorOut_bh6_6_6(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w16_5 <= CompressorOut_bh6_6_6(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_7_14 <= heap_bh6_w16_3 & heap_bh6_w16_2 & heap_bh6_w16_1 & heap_bh6_w16_0;
   CompressorIn_bh6_7_15(0) <= heap_bh6_w17_1;
   Compressor_bh6_7: Compressor_14_3
      port map ( R => CompressorOut_bh6_7_7   ,
                 X0 => CompressorIn_bh6_7_14,
                 X1 => CompressorIn_bh6_7_15);
   heap_bh6_w16_6 <= CompressorOut_bh6_7_7(0); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w17_3 <= CompressorOut_bh6_7_7(1); -- cycle= 0 cp= 1.522e-09
   heap_bh6_w18_3 <= CompressorOut_bh6_7_7(2); -- cycle= 0 cp= 1.522e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_8_16 <= heap_bh6_w18_1 & heap_bh6_w18_0 & heap_bh6_w18_3;
   Compressor_bh6_8: Compressor_3_2
      port map ( R => CompressorOut_bh6_8_8   ,
                 X0 => CompressorIn_bh6_8_16);
   heap_bh6_w18_4 <= CompressorOut_bh6_8_8(0); -- cycle= 0 cp= 2.283e-09
   heap_bh6_w19_1 <= CompressorOut_bh6_8_8(1); -- cycle= 0 cp= 2.283e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_9_17 <= heap_bh6_w3_0 & heap_bh6_w3_3 & heap_bh6_w3_2;
   CompressorIn_bh6_9_18 <= heap_bh6_w4_6 & heap_bh6_w4_5;
   Compressor_bh6_9: Compressor_23_3
      port map ( R => CompressorOut_bh6_9_9   ,
                 X0 => CompressorIn_bh6_9_17,
                 X1 => CompressorIn_bh6_9_18);
   heap_bh6_w3_4 <= CompressorOut_bh6_9_9(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w4_7 <= CompressorOut_bh6_9_9(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w5_4 <= CompressorOut_bh6_9_9(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_10_19 <= heap_bh6_w5_0 & heap_bh6_w5_3 & heap_bh6_w5_2;
   CompressorIn_bh6_10_20 <= heap_bh6_w6_6 & heap_bh6_w6_5;
   Compressor_bh6_10: Compressor_23_3
      port map ( R => CompressorOut_bh6_10_10   ,
                 X0 => CompressorIn_bh6_10_19,
                 X1 => CompressorIn_bh6_10_20);
   heap_bh6_w5_5 <= CompressorOut_bh6_10_10(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w6_7 <= CompressorOut_bh6_10_10(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w7_4 <= CompressorOut_bh6_10_10(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_11_21 <= heap_bh6_w7_0 & heap_bh6_w7_3 & heap_bh6_w7_2;
   CompressorIn_bh6_11_22 <= heap_bh6_w8_6 & heap_bh6_w8_5;
   Compressor_bh6_11: Compressor_23_3
      port map ( R => CompressorOut_bh6_11_11   ,
                 X0 => CompressorIn_bh6_11_21,
                 X1 => CompressorIn_bh6_11_22);
   heap_bh6_w7_5 <= CompressorOut_bh6_11_11(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w8_7 <= CompressorOut_bh6_11_11(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w9_4 <= CompressorOut_bh6_11_11(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_12_23 <= heap_bh6_w9_0 & heap_bh6_w9_3 & heap_bh6_w9_2;
   CompressorIn_bh6_12_24 <= heap_bh6_w10_6 & heap_bh6_w10_5;
   Compressor_bh6_12: Compressor_23_3
      port map ( R => CompressorOut_bh6_12_12   ,
                 X0 => CompressorIn_bh6_12_23,
                 X1 => CompressorIn_bh6_12_24);
   heap_bh6_w9_5 <= CompressorOut_bh6_12_12(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w10_7 <= CompressorOut_bh6_12_12(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w11_4 <= CompressorOut_bh6_12_12(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_13_25 <= heap_bh6_w11_0 & heap_bh6_w11_3 & heap_bh6_w11_2;
   CompressorIn_bh6_13_26 <= heap_bh6_w12_6 & heap_bh6_w12_5;
   Compressor_bh6_13: Compressor_23_3
      port map ( R => CompressorOut_bh6_13_13   ,
                 X0 => CompressorIn_bh6_13_25,
                 X1 => CompressorIn_bh6_13_26);
   heap_bh6_w11_5 <= CompressorOut_bh6_13_13(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w12_7 <= CompressorOut_bh6_13_13(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w13_4 <= CompressorOut_bh6_13_13(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_14_27 <= heap_bh6_w13_0 & heap_bh6_w13_3 & heap_bh6_w13_2;
   CompressorIn_bh6_14_28 <= heap_bh6_w14_6 & heap_bh6_w14_5;
   Compressor_bh6_14: Compressor_23_3
      port map ( R => CompressorOut_bh6_14_14   ,
                 X0 => CompressorIn_bh6_14_27,
                 X1 => CompressorIn_bh6_14_28);
   heap_bh6_w13_5 <= CompressorOut_bh6_14_14(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w14_7 <= CompressorOut_bh6_14_14(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w15_4 <= CompressorOut_bh6_14_14(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_15_29 <= heap_bh6_w15_0 & heap_bh6_w15_3 & heap_bh6_w15_2;
   CompressorIn_bh6_15_30 <= heap_bh6_w16_6 & heap_bh6_w16_5;
   Compressor_bh6_15: Compressor_23_3
      port map ( R => CompressorOut_bh6_15_15   ,
                 X0 => CompressorIn_bh6_15_29,
                 X1 => CompressorIn_bh6_15_30);
   heap_bh6_w15_5 <= CompressorOut_bh6_15_15(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w16_7 <= CompressorOut_bh6_15_15(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w17_4 <= CompressorOut_bh6_15_15(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_16_31 <= heap_bh6_w17_0 & heap_bh6_w17_3 & heap_bh6_w17_2;
   CompressorIn_bh6_16_32 <= heap_bh6_w18_4 & heap_bh6_w18_2;
   Compressor_bh6_16: Compressor_23_3
      port map ( R => CompressorOut_bh6_16_16   ,
                 X0 => CompressorIn_bh6_16_31,
                 X1 => CompressorIn_bh6_16_32);
   heap_bh6_w17_5 <= CompressorOut_bh6_16_16(0); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w18_5 <= CompressorOut_bh6_16_16(1); -- cycle= 0 cp= 3.621e-09
   heap_bh6_w19_2 <= CompressorOut_bh6_16_16(2); -- cycle= 0 cp= 3.621e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_17_33 <= heap_bh6_w19_1 & heap_bh6_w19_0 & heap_bh6_w19_2;
   CompressorIn_bh6_17_34(0) <= heap_bh6_w20_0;
   Compressor_bh6_17: Compressor_13_3
      port map ( R => CompressorOut_bh6_17_17   ,
                 X0 => CompressorIn_bh6_17_33,
                 X1 => CompressorIn_bh6_17_34);
   heap_bh6_w19_3 <= CompressorOut_bh6_17_17(0); -- cycle= 0 cp= 4.382e-09
   heap_bh6_w20_1 <= CompressorOut_bh6_17_17(1); -- cycle= 0 cp= 4.382e-09
   heap_bh6_w21_1 <= CompressorOut_bh6_17_17(2); -- cycle= 0 cp= 4.382e-09
   ----------------Synchro barrier, entering cycle 0----------------
   finalAdderIn0_bh6 <= "0" & heap_bh6_w35_0 & heap_bh6_w34_0 & heap_bh6_w33_0 & heap_bh6_w32_0 & heap_bh6_w31_0 & heap_bh6_w30_0 & heap_bh6_w29_0 & heap_bh6_w28_0 & heap_bh6_w27_0 & heap_bh6_w26_0 & heap_bh6_w25_0 & heap_bh6_w24_0 & heap_bh6_w23_0 & heap_bh6_w22_0 & heap_bh6_w21_0 & heap_bh6_w20_1 & heap_bh6_w19_3 & heap_bh6_w18_5 & heap_bh6_w17_5 & heap_bh6_w16_4 & heap_bh6_w15_5 & heap_bh6_w14_4 & heap_bh6_w13_5 & heap_bh6_w12_4 & heap_bh6_w11_5 & heap_bh6_w10_4 & heap_bh6_w9_5 & heap_bh6_w8_4 & heap_bh6_w7_5 & heap_bh6_w6_4 & heap_bh6_w5_5 & heap_bh6_w4_4 & heap_bh6_w3_4 & heap_bh6_w2_5 & heap_bh6_w1_1;
   finalAdderIn1_bh6 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w21_1 & '0' & '0' & '0' & heap_bh6_w17_4 & heap_bh6_w16_7 & heap_bh6_w15_4 & heap_bh6_w14_7 & heap_bh6_w13_4 & heap_bh6_w12_7 & heap_bh6_w11_4 & heap_bh6_w10_7 & heap_bh6_w9_4 & heap_bh6_w8_7 & heap_bh6_w7_4 & heap_bh6_w6_7 & heap_bh6_w5_4 & heap_bh6_w4_7 & '0' & heap_bh6_w2_4 & heap_bh6_w1_0;
   finalAdderCin_bh6 <= '0';
   Adder_final6_0: IntAdder_36_f100_uid105  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh6,
                 R => finalAdderOut_bh6   ,
                 X => finalAdderIn0_bh6,
                 Y => finalAdderIn1_bh6);
   -- concatenate all the compressed chunks
   CompressionResult6 <= finalAdderOut_bh6 & tempR_bh6_0;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult6(35 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_26_f100_uid115
--                    (IntAdderAlternative_26_F100_uid119)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_26_f100_uid115 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(25 downto 0);
          Y : in  std_logic_vector(25 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(25 downto 0)   );
end entity;

architecture arch of IntAdder_26_f100_uid115 is
signal s_sum_l0_idx0 :  std_logic_vector(17 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(9 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1 :  std_logic_vector(16 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(8 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(9 downto 0);
signal sum_l1_idx1 :  std_logic_vector(8 downto 0);
signal c_l1_idx1 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            c_l0_idx0_d1 <=  c_l0_idx0;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(16 downto 0)) + ( "0" & Y(16 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(25 downto 17)) + ( "0" & Y(25 downto 17));
   sum_l0_idx0 <= s_sum_l0_idx0(16 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(17 downto 17);
   sum_l0_idx1 <= s_sum_l0_idx1(8 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(9 downto 9);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(8 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(9 downto 9);
   R <= sum_l1_idx1(8 downto 0) & sum_l0_idx0_d1(16 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                                  GPUFMult
--                     (FPMult_7_17_7_17_7_17_F100_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GPUFMult is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7+17+2 downto 0);
          Y : in  std_logic_vector(7+17+2 downto 0);
          R : out  std_logic_vector(7+17+2 downto 0)   );
end entity;

architecture arch of GPUFMult is
   component IntMultiplier_UsingDSP_18_18_36_unsigned_F100_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             Y : in  std_logic_vector(17 downto 0);
             R : out  std_logic_vector(35 downto 0)   );
   end component;

   component IntAdder_26_f100_uid115 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(25 downto 0);
             Y : in  std_logic_vector(25 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(25 downto 0)   );
   end component;

signal sign, sign_d1 :  std_logic;
signal expX :  std_logic_vector(6 downto 0);
signal expY :  std_logic_vector(6 downto 0);
signal expSumPreSub :  std_logic_vector(8 downto 0);
signal bias :  std_logic_vector(8 downto 0);
signal expSum :  std_logic_vector(8 downto 0);
signal sigX :  std_logic_vector(17 downto 0);
signal sigY :  std_logic_vector(17 downto 0);
signal sigProd :  std_logic_vector(35 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(8 downto 0);
signal sigProdExt :  std_logic_vector(35 downto 0);
signal expSig :  std_logic_vector(25 downto 0);
signal sticky :  std_logic;
signal guard :  std_logic;
signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(25 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            exc_d1 <=  exc;
         end if;
      end process;
   sign <= X(24) xor Y(24);
   expX <= X(23 downto 17);
   expY <= Y(23 downto 17);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(63,9);
   expSum <= expSumPreSub - bias;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(16 downto 0);
   sigY <= "1" & Y(16 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_18_18_36_unsigned_F100_uid4  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(26 downto 25) & Y(26 downto 25);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd(35);
   -- exponent update
   expPostNorm <= expSum + ("00000000" & norm);
   -- significand normalization shift
   sigProdExt <= sigProd(34 downto 0) & "0" when norm='1' else
                         sigProd(33 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(35 downto 19);
   sticky <= sigProdExt(18);
   guard <= '0' when sigProdExt(17 downto 0)="000000000000000000" else '1';
   round <= sticky and ( (guard and not(sigProdExt(19))) or (sigProdExt(19) ))  ;
   RoundingAdder: IntAdder_26_f100_uid115  -- pipelineDepth=1 maxInDelay=8.114e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound   ,
                 X => expSig,
                 Y => "00000000000000000000000000");
   ----------------Synchro barrier, entering cycle 1----------------
   with expSigPostRound(25 downto 24) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d1 select 
   finalExc <= exc_d1 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d1 & expSigPostRound(23 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                   RightShifter_18_by_max_34_F100_uid125
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_18_by_max_34_F100_uid125 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(51 downto 0)   );
end entity;

architecture arch of RightShifter_18_by_max_34_F100_uid125 is
signal level0 :  std_logic_vector(17 downto 0);
signal ps :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(18 downto 0);
signal level2 :  std_logic_vector(20 downto 0);
signal level3 :  std_logic_vector(24 downto 0);
signal level4 :  std_logic_vector(32 downto 0);
signal level5 :  std_logic_vector(48 downto 0);
signal level6 :  std_logic_vector(80 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   level6<=  (31 downto 0 => '0') & level5 when ps(5) = '1' else    level5 & (31 downto 0 => '0');
   R <= level6(80 downto 29);
end architecture;

--------------------------------------------------------------------------------
--                   RightShifter_18_by_max_34_F100_uid129
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_18_by_max_34_F100_uid129 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(51 downto 0)   );
end entity;

architecture arch of RightShifter_18_by_max_34_F100_uid129 is
signal level0 :  std_logic_vector(17 downto 0);
signal ps :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(18 downto 0);
signal level2 :  std_logic_vector(20 downto 0);
signal level3 :  std_logic_vector(24 downto 0);
signal level4 :  std_logic_vector(32 downto 0);
signal level5 :  std_logic_vector(48 downto 0);
signal level6 :  std_logic_vector(80 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   level6<=  (31 downto 0 => '0') & level5 when ps(5) = '1' else    level5 & (31 downto 0 => '0');
   R <= level6(80 downto 29);
end architecture;

--------------------------------------------------------------------------------
--                   RightShifter_18_by_max_34_F100_uid133
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter_18_by_max_34_F100_uid133 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(17 downto 0);
          S : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(51 downto 0)   );
end entity;

architecture arch of RightShifter_18_by_max_34_F100_uid133 is
signal level0 :  std_logic_vector(17 downto 0);
signal ps :  std_logic_vector(5 downto 0);
signal level1 :  std_logic_vector(18 downto 0);
signal level2 :  std_logic_vector(20 downto 0);
signal level3 :  std_logic_vector(24 downto 0);
signal level4 :  std_logic_vector(32 downto 0);
signal level5 :  std_logic_vector(48 downto 0);
signal level6 :  std_logic_vector(80 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   level6<=  (31 downto 0 => '0') & level5 when ps(5) = '1' else    level5 & (31 downto 0 => '0');
   R <= level6(80 downto 29);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_55_f100_uid137
--                    (IntAdderAlternative_55_F100_uid141)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_55_f100_uid137 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(54 downto 0);
          Y : in  std_logic_vector(54 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(54 downto 0)   );
end entity;

architecture arch of IntAdder_55_f100_uid137 is
signal s_sum_l0_idx0 :  std_logic_vector(46 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(9 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1 :  std_logic_vector(45 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(8 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(9 downto 0);
signal sum_l1_idx1 :  std_logic_vector(8 downto 0);
signal c_l1_idx1 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            c_l0_idx0_d1 <=  c_l0_idx0;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(45 downto 0)) + ( "0" & Y(45 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(54 downto 46)) + ( "0" & Y(54 downto 46));
   sum_l0_idx0 <= s_sum_l0_idx0(45 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(46 downto 46);
   sum_l0_idx1 <= s_sum_l0_idx1(8 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(9 downto 9);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(8 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(9 downto 9);
   R <= sum_l1_idx1(8 downto 0) & sum_l0_idx0_d1(45 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_55_f100_uid143
--                    (IntAdderAlternative_55_F100_uid147)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_55_f100_uid143 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(54 downto 0);
          Y : in  std_logic_vector(54 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(54 downto 0)   );
end entity;

architecture arch of IntAdder_55_f100_uid143 is
signal s_sum_l0_idx0 :  std_logic_vector(46 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(9 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1 :  std_logic_vector(45 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(8 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(9 downto 0);
signal sum_l1_idx1 :  std_logic_vector(8 downto 0);
signal c_l1_idx1 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            c_l0_idx0_d1 <=  c_l0_idx0;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(45 downto 0)) + ( "0" & Y(45 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(54 downto 46)) + ( "0" & Y(54 downto 46));
   sum_l0_idx0 <= s_sum_l0_idx0(45 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(46 downto 46);
   sum_l0_idx1 <= s_sum_l0_idx1(8 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(9 downto 9);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(8 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(9 downto 9);
   R <= sum_l1_idx1(8 downto 0) & sum_l0_idx0_d1(45 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_55_f100_uid149
--                    (IntAdderAlternative_55_F100_uid153)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_55_f100_uid149 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(54 downto 0);
          Y : in  std_logic_vector(54 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(54 downto 0)   );
end entity;

architecture arch of IntAdder_55_f100_uid149 is
signal s_sum_l0_idx0 :  std_logic_vector(46 downto 0);
signal s_sum_l0_idx1, s_sum_l0_idx1_d1 :  std_logic_vector(9 downto 0);
signal sum_l0_idx0, sum_l0_idx0_d1 :  std_logic_vector(45 downto 0);
signal c_l0_idx0, c_l0_idx0_d1 :  std_logic_vector(0 downto 0);
signal sum_l0_idx1 :  std_logic_vector(8 downto 0);
signal c_l0_idx1 :  std_logic_vector(0 downto 0);
signal s_sum_l1_idx1 :  std_logic_vector(9 downto 0);
signal sum_l1_idx1 :  std_logic_vector(8 downto 0);
signal c_l1_idx1 :  std_logic_vector(0 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            s_sum_l0_idx1_d1 <=  s_sum_l0_idx1;
            sum_l0_idx0_d1 <=  sum_l0_idx0;
            c_l0_idx0_d1 <=  c_l0_idx0;
         end if;
      end process;
   --Alternative
   s_sum_l0_idx0 <= ( "0" & X(45 downto 0)) + ( "0" & Y(45 downto 0)) + Cin;
   s_sum_l0_idx1 <= ( "0" & X(54 downto 46)) + ( "0" & Y(54 downto 46));
   sum_l0_idx0 <= s_sum_l0_idx0(45 downto 0);
   c_l0_idx0 <= s_sum_l0_idx0(46 downto 46);
   sum_l0_idx1 <= s_sum_l0_idx1(8 downto 0);
   c_l0_idx1 <= s_sum_l0_idx1(9 downto 9);
   ----------------Synchro barrier, entering cycle 1----------------
   s_sum_l1_idx1 <=  s_sum_l0_idx1_d1 + c_l0_idx0_d1(0 downto 0);
   sum_l1_idx1 <= s_sum_l1_idx1(8 downto 0);
   c_l1_idx1 <= s_sum_l1_idx1(9 downto 9);
   R <= sum_l1_idx1(8 downto 0) & sum_l0_idx0_d1(45 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_55_f100_uid225
--                     (IntAdderClassical_55_F100_uid227)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_55_f100_uid225 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(54 downto 0);
          Y : in  std_logic_vector(54 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(54 downto 0)   );
end entity;

architecture arch of IntAdder_55_f100_uid225 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_54_f100_uid233
--                     (IntAdderClassical_54_F100_uid235)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_54_f100_uid233 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(53 downto 0);
          Y : in  std_logic_vector(53 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(53 downto 0)   );
end entity;

architecture arch of IntAdder_54_f100_uid233 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                LZCShifter_38_to_38_counting_64_F100_uid241
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_38_to_38_counting_64_F100_uid241 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(37 downto 0);
          Count : out  std_logic_vector(5 downto 0);
          O : out  std_logic_vector(37 downto 0)   );
end entity;

architecture arch of LZCShifter_38_to_38_counting_64_F100_uid241 is
signal level6, level6_d1 :  std_logic_vector(37 downto 0);
signal count5, count5_d1 :  std_logic;
signal level5 :  std_logic_vector(37 downto 0);
signal count4, count4_d1 :  std_logic;
signal level4 :  std_logic_vector(37 downto 0);
signal count3, count3_d1 :  std_logic;
signal level3 :  std_logic_vector(37 downto 0);
signal count2, count2_d1 :  std_logic;
signal level2, level2_d1 :  std_logic_vector(37 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(37 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(37 downto 0);
signal sCount :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            level6_d1 <=  level6;
            count5_d1 <=  count5;
            count4_d1 <=  count4;
            count3_d1 <=  count3;
            count2_d1 <=  count2;
            level2_d1 <=  level2;
         end if;
      end process;
   level6 <= I ;
   ----------------Synchro barrier, entering cycle 1----------------
   count5<= '1' when level6_d1(37 downto 6) = (37 downto 6=>'0') else '0';
   level5<= level6_d1(37 downto 0) when count5='0' else level6_d1(5 downto 0) & (31 downto 0 => '0');

   count4<= '1' when level5(37 downto 22) = (37 downto 22=>'0') else '0';
   level4<= level5(37 downto 0) when count4='0' else level5(21 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(37 downto 30) = (37 downto 30=>'0') else '0';
   level3<= level4(37 downto 0) when count3='0' else level4(29 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(37 downto 34) = (37 downto 34=>'0') else '0';
   level2<= level3(37 downto 0) when count2='0' else level3(33 downto 0) & (3 downto 0 => '0');

   ----------------Synchro barrier, entering cycle 2----------------
   count1<= '1' when level2_d1(37 downto 36) = (37 downto 36=>'0') else '0';
   level1<= level2_d1(37 downto 0) when count1='0' else level2_d1(35 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(37 downto 37) = (37 downto 37=>'0') else '0';
   level0<= level1(37 downto 0) when count0='0' else level1(36 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count5_d1 & count4_d1 & count3_d1 & count2_d1 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_26_f100_uid245
--                     (IntAdderClassical_26_F100_uid247)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_26_f100_uid245 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(25 downto 0);
          Y : in  std_logic_vector(25 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(25 downto 0)   );
end entity;

architecture arch of IntAdder_26_f100_uid245 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                  GPUF3Add
--                       (FPAdd3Input_7_17_F100_uid123)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GPUF3Add is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7+17+2 downto 0);
          Y : in  std_logic_vector(7+17+2 downto 0);
          Z : in  std_logic_vector(7+17+2 downto 0);
          R : out  std_logic_vector(7+17+2 downto 0)   );
end entity;

architecture arch of GPUF3Add is
   component RightShifter_18_by_max_34_F100_uid125 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(51 downto 0)   );
   end component;

   component RightShifter_18_by_max_34_F100_uid129 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(51 downto 0)   );
   end component;

   component RightShifter_18_by_max_34_F100_uid133 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(17 downto 0);
             S : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(51 downto 0)   );
   end component;

   component IntAdder_55_f100_uid137 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(54 downto 0);
             Y : in  std_logic_vector(54 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(54 downto 0)   );
   end component;

   component IntAdder_55_f100_uid143 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(54 downto 0);
             Y : in  std_logic_vector(54 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(54 downto 0)   );
   end component;

   component IntAdder_55_f100_uid149 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(54 downto 0);
             Y : in  std_logic_vector(54 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(54 downto 0)   );
   end component;

   component IntAdder_55_f100_uid225 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(54 downto 0);
             Y : in  std_logic_vector(54 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(54 downto 0)   );
   end component;

   component IntAdder_54_f100_uid233 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(53 downto 0);
             Y : in  std_logic_vector(53 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(53 downto 0)   );
   end component;

   component LZCShifter_38_to_38_counting_64_F100_uid241 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(37 downto 0);
             Count : out  std_logic_vector(5 downto 0);
             O : out  std_logic_vector(37 downto 0)   );
   end component;

   component IntAdder_26_f100_uid245 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(25 downto 0);
             Y : in  std_logic_vector(25 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(25 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

signal neX :  std_logic_vector(6 downto 0);
signal neY :  std_logic_vector(6 downto 0);
signal neZ :  std_logic_vector(6 downto 0);
signal mX :  std_logic_vector(16 downto 0);
signal mY :  std_logic_vector(16 downto 0);
signal mZ :  std_logic_vector(16 downto 0);
signal sX :  std_logic;
signal sY :  std_logic;
signal sZ :  std_logic;
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal excZ :  std_logic_vector(1 downto 0);
signal eX :  std_logic_vector(6 downto 0);
signal eY :  std_logic_vector(6 downto 0);
signal eZ :  std_logic_vector(6 downto 0);
signal expRes1, expRes1_d1, expRes1_d2, expRes1_d3 :  std_logic;
signal expRes0, expRes0_d1, expRes0_d2, expRes0_d3 :  std_logic;
signal sgn, sgn_d1, sgn_d2, sgn_d3 :  std_logic;
signal dexy :  std_logic_vector(7 downto 0);
signal deyz :  std_logic_vector(7 downto 0);
signal dezx :  std_logic_vector(7 downto 0);
signal cdexy :  std_logic;
signal cdeyz :  std_logic;
signal cdezx :  std_logic;
signal eMaxSel :  std_logic_vector(2 downto 0);
signal eMax, eMax_d1, eMax_d2, eMax_d3 :  std_logic_vector(6 downto 0);
signal m1 :  std_logic;
signal m2 :  std_logic;
signal m3 :  std_logic;
signal alpha :  std_logic_vector(1 downto 0);
signal beta :  std_logic_vector(1 downto 0);
signal gama :  std_logic_vector(1 downto 0);
signal mux1out :  std_logic_vector(7 downto 0);
signal mux2out :  std_logic_vector(7 downto 0);
signal mux3out :  std_logic_vector(7 downto 0);
signal nmux1out :  std_logic_vector(7 downto 0);
signal nmux2out :  std_logic_vector(7 downto 0);
signal nmux3out :  std_logic_vector(7 downto 0);
signal amx :  std_logic_vector(7 downto 0);
signal bmx :  std_logic_vector(7 downto 0);
signal gmx :  std_logic_vector(7 downto 0);
signal sval0 :  std_logic_vector(5 downto 0);
signal sval1 :  std_logic_vector(5 downto 0);
signal sval2 :  std_logic_vector(5 downto 0);
signal sout0 :  std_logic;
signal sout1 :  std_logic;
signal sout2 :  std_logic;
signal nfX :  std_logic_vector(17 downto 0);
signal nfY :  std_logic_vector(17 downto 0);
signal nfZ :  std_logic_vector(17 downto 0);
signal fX :  std_logic_vector(17 downto 0);
signal fY :  std_logic_vector(17 downto 0);
signal fZ :  std_logic_vector(17 downto 0);
signal sfX :  std_logic_vector(51 downto 0);
signal sfY :  std_logic_vector(51 downto 0);
signal sfZ :  std_logic_vector(51 downto 0);
signal efX :  std_logic_vector(54 downto 0);
signal efY :  std_logic_vector(54 downto 0);
signal efZ :  std_logic_vector(54 downto 0);
signal xsefX :  std_logic_vector(54 downto 0);
signal xsefY :  std_logic_vector(54 downto 0);
signal xsefZ :  std_logic_vector(54 downto 0);
signal sefX :  std_logic_vector(54 downto 0);
signal sefY :  std_logic_vector(54 downto 0);
signal sefZ :  std_logic_vector(54 downto 0);
signal heap_bh160_w0_0 :  std_logic;
signal heap_bh160_w1_0 :  std_logic;
signal heap_bh160_w2_0 :  std_logic;
signal heap_bh160_w3_0 :  std_logic;
signal heap_bh160_w4_0 :  std_logic;
signal heap_bh160_w5_0 :  std_logic;
signal heap_bh160_w6_0 :  std_logic;
signal heap_bh160_w7_0 :  std_logic;
signal heap_bh160_w8_0 :  std_logic;
signal heap_bh160_w9_0 :  std_logic;
signal heap_bh160_w10_0 :  std_logic;
signal heap_bh160_w11_0 :  std_logic;
signal heap_bh160_w12_0 :  std_logic;
signal heap_bh160_w13_0 :  std_logic;
signal heap_bh160_w14_0 :  std_logic;
signal heap_bh160_w15_0 :  std_logic;
signal heap_bh160_w16_0 :  std_logic;
signal heap_bh160_w17_0 :  std_logic;
signal heap_bh160_w18_0 :  std_logic;
signal heap_bh160_w19_0 :  std_logic;
signal heap_bh160_w20_0 :  std_logic;
signal heap_bh160_w21_0 :  std_logic;
signal heap_bh160_w22_0 :  std_logic;
signal heap_bh160_w23_0 :  std_logic;
signal heap_bh160_w24_0 :  std_logic;
signal heap_bh160_w25_0 :  std_logic;
signal heap_bh160_w26_0 :  std_logic;
signal heap_bh160_w27_0 :  std_logic;
signal heap_bh160_w28_0 :  std_logic;
signal heap_bh160_w29_0 :  std_logic;
signal heap_bh160_w30_0 :  std_logic;
signal heap_bh160_w31_0 :  std_logic;
signal heap_bh160_w32_0 :  std_logic;
signal heap_bh160_w33_0 :  std_logic;
signal heap_bh160_w34_0 :  std_logic;
signal heap_bh160_w35_0 :  std_logic;
signal heap_bh160_w36_0 :  std_logic;
signal heap_bh160_w37_0 :  std_logic;
signal heap_bh160_w38_0 :  std_logic;
signal heap_bh160_w39_0 :  std_logic;
signal heap_bh160_w40_0 :  std_logic;
signal heap_bh160_w41_0 :  std_logic;
signal heap_bh160_w42_0 :  std_logic;
signal heap_bh160_w43_0 :  std_logic;
signal heap_bh160_w44_0 :  std_logic;
signal heap_bh160_w45_0 :  std_logic;
signal heap_bh160_w46_0 :  std_logic;
signal heap_bh160_w47_0 :  std_logic;
signal heap_bh160_w48_0 :  std_logic;
signal heap_bh160_w49_0 :  std_logic;
signal heap_bh160_w50_0 :  std_logic;
signal heap_bh160_w51_0 :  std_logic;
signal heap_bh160_w52_0 :  std_logic;
signal heap_bh160_w53_0 :  std_logic;
signal heap_bh160_w54_0 :  std_logic;
signal heap_bh160_w0_1 :  std_logic;
signal heap_bh160_w1_1 :  std_logic;
signal heap_bh160_w2_1 :  std_logic;
signal heap_bh160_w3_1 :  std_logic;
signal heap_bh160_w4_1 :  std_logic;
signal heap_bh160_w5_1 :  std_logic;
signal heap_bh160_w6_1 :  std_logic;
signal heap_bh160_w7_1 :  std_logic;
signal heap_bh160_w8_1 :  std_logic;
signal heap_bh160_w9_1 :  std_logic;
signal heap_bh160_w10_1 :  std_logic;
signal heap_bh160_w11_1 :  std_logic;
signal heap_bh160_w12_1 :  std_logic;
signal heap_bh160_w13_1 :  std_logic;
signal heap_bh160_w14_1 :  std_logic;
signal heap_bh160_w15_1 :  std_logic;
signal heap_bh160_w16_1 :  std_logic;
signal heap_bh160_w17_1 :  std_logic;
signal heap_bh160_w18_1 :  std_logic;
signal heap_bh160_w19_1 :  std_logic;
signal heap_bh160_w20_1 :  std_logic;
signal heap_bh160_w21_1 :  std_logic;
signal heap_bh160_w22_1 :  std_logic;
signal heap_bh160_w23_1 :  std_logic;
signal heap_bh160_w24_1 :  std_logic;
signal heap_bh160_w25_1 :  std_logic;
signal heap_bh160_w26_1 :  std_logic;
signal heap_bh160_w27_1 :  std_logic;
signal heap_bh160_w28_1 :  std_logic;
signal heap_bh160_w29_1 :  std_logic;
signal heap_bh160_w30_1 :  std_logic;
signal heap_bh160_w31_1 :  std_logic;
signal heap_bh160_w32_1 :  std_logic;
signal heap_bh160_w33_1 :  std_logic;
signal heap_bh160_w34_1 :  std_logic;
signal heap_bh160_w35_1 :  std_logic;
signal heap_bh160_w36_1 :  std_logic;
signal heap_bh160_w37_1 :  std_logic;
signal heap_bh160_w38_1 :  std_logic;
signal heap_bh160_w39_1 :  std_logic;
signal heap_bh160_w40_1 :  std_logic;
signal heap_bh160_w41_1 :  std_logic;
signal heap_bh160_w42_1 :  std_logic;
signal heap_bh160_w43_1 :  std_logic;
signal heap_bh160_w44_1 :  std_logic;
signal heap_bh160_w45_1 :  std_logic;
signal heap_bh160_w46_1 :  std_logic;
signal heap_bh160_w47_1 :  std_logic;
signal heap_bh160_w48_1 :  std_logic;
signal heap_bh160_w49_1 :  std_logic;
signal heap_bh160_w50_1 :  std_logic;
signal heap_bh160_w51_1 :  std_logic;
signal heap_bh160_w52_1 :  std_logic;
signal heap_bh160_w53_1 :  std_logic;
signal heap_bh160_w54_1 :  std_logic;
signal heap_bh160_w0_2 :  std_logic;
signal heap_bh160_w1_2 :  std_logic;
signal heap_bh160_w2_2 :  std_logic;
signal heap_bh160_w3_2 :  std_logic;
signal heap_bh160_w4_2 :  std_logic;
signal heap_bh160_w5_2 :  std_logic;
signal heap_bh160_w6_2 :  std_logic;
signal heap_bh160_w7_2 :  std_logic;
signal heap_bh160_w8_2 :  std_logic;
signal heap_bh160_w9_2 :  std_logic;
signal heap_bh160_w10_2 :  std_logic;
signal heap_bh160_w11_2 :  std_logic;
signal heap_bh160_w12_2 :  std_logic;
signal heap_bh160_w13_2 :  std_logic;
signal heap_bh160_w14_2 :  std_logic;
signal heap_bh160_w15_2 :  std_logic;
signal heap_bh160_w16_2 :  std_logic;
signal heap_bh160_w17_2 :  std_logic;
signal heap_bh160_w18_2 :  std_logic;
signal heap_bh160_w19_2 :  std_logic;
signal heap_bh160_w20_2 :  std_logic;
signal heap_bh160_w21_2 :  std_logic;
signal heap_bh160_w22_2 :  std_logic;
signal heap_bh160_w23_2 :  std_logic;
signal heap_bh160_w24_2 :  std_logic;
signal heap_bh160_w25_2 :  std_logic;
signal heap_bh160_w26_2 :  std_logic;
signal heap_bh160_w27_2 :  std_logic;
signal heap_bh160_w28_2 :  std_logic;
signal heap_bh160_w29_2 :  std_logic;
signal heap_bh160_w30_2 :  std_logic;
signal heap_bh160_w31_2 :  std_logic;
signal heap_bh160_w32_2 :  std_logic;
signal heap_bh160_w33_2 :  std_logic;
signal heap_bh160_w34_2 :  std_logic;
signal heap_bh160_w35_2 :  std_logic;
signal heap_bh160_w36_2 :  std_logic;
signal heap_bh160_w37_2 :  std_logic;
signal heap_bh160_w38_2 :  std_logic;
signal heap_bh160_w39_2 :  std_logic;
signal heap_bh160_w40_2 :  std_logic;
signal heap_bh160_w41_2 :  std_logic;
signal heap_bh160_w42_2 :  std_logic;
signal heap_bh160_w43_2 :  std_logic;
signal heap_bh160_w44_2 :  std_logic;
signal heap_bh160_w45_2 :  std_logic;
signal heap_bh160_w46_2 :  std_logic;
signal heap_bh160_w47_2 :  std_logic;
signal heap_bh160_w48_2 :  std_logic;
signal heap_bh160_w49_2 :  std_logic;
signal heap_bh160_w50_2 :  std_logic;
signal heap_bh160_w51_2 :  std_logic;
signal heap_bh160_w52_2 :  std_logic;
signal heap_bh160_w53_2 :  std_logic;
signal heap_bh160_w54_2 :  std_logic;
signal CompressorIn_bh160_0_0 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_0_1 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh160_w0_3 :  std_logic;
signal heap_bh160_w1_3 :  std_logic;
signal heap_bh160_w2_3 :  std_logic;
signal CompressorIn_bh160_1_2 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_1_3 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh160_w2_4 :  std_logic;
signal heap_bh160_w3_3 :  std_logic;
signal heap_bh160_w4_3 :  std_logic;
signal CompressorIn_bh160_2_4 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_2_5 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh160_w4_4 :  std_logic;
signal heap_bh160_w5_3 :  std_logic;
signal heap_bh160_w6_3 :  std_logic;
signal CompressorIn_bh160_3_6 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_3_7 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh160_w6_4 :  std_logic;
signal heap_bh160_w7_3 :  std_logic;
signal heap_bh160_w8_3 :  std_logic;
signal CompressorIn_bh160_4_8 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_4_9 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh160_w8_4 :  std_logic;
signal heap_bh160_w9_3 :  std_logic;
signal heap_bh160_w10_3 :  std_logic;
signal CompressorIn_bh160_5_10 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_5_11 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh160_w10_4 :  std_logic;
signal heap_bh160_w11_3 :  std_logic;
signal heap_bh160_w12_3 :  std_logic;
signal CompressorIn_bh160_6_12 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_6_13 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh160_w12_4 :  std_logic;
signal heap_bh160_w13_3 :  std_logic;
signal heap_bh160_w14_3 :  std_logic;
signal CompressorIn_bh160_7_14 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_7_15 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh160_w14_4 :  std_logic;
signal heap_bh160_w15_3 :  std_logic;
signal heap_bh160_w16_3 :  std_logic;
signal CompressorIn_bh160_8_16 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_8_17 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh160_w16_4 :  std_logic;
signal heap_bh160_w17_3 :  std_logic;
signal heap_bh160_w18_3 :  std_logic;
signal CompressorIn_bh160_9_18 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_9_19 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh160_w18_4 :  std_logic;
signal heap_bh160_w19_3 :  std_logic;
signal heap_bh160_w20_3 :  std_logic;
signal CompressorIn_bh160_10_20 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_10_21 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh160_w20_4 :  std_logic;
signal heap_bh160_w21_3 :  std_logic;
signal heap_bh160_w22_3 :  std_logic;
signal CompressorIn_bh160_11_22 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_11_23 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh160_w22_4 :  std_logic;
signal heap_bh160_w23_3 :  std_logic;
signal heap_bh160_w24_3 :  std_logic;
signal CompressorIn_bh160_12_24 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_12_25 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_12_12 :  std_logic_vector(2 downto 0);
signal heap_bh160_w24_4 :  std_logic;
signal heap_bh160_w25_3 :  std_logic;
signal heap_bh160_w26_3 :  std_logic;
signal CompressorIn_bh160_13_26 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_13_27 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_13_13 :  std_logic_vector(2 downto 0);
signal heap_bh160_w26_4 :  std_logic;
signal heap_bh160_w27_3 :  std_logic;
signal heap_bh160_w28_3 :  std_logic;
signal CompressorIn_bh160_14_28 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_14_29 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_14_14 :  std_logic_vector(2 downto 0);
signal heap_bh160_w28_4 :  std_logic;
signal heap_bh160_w29_3 :  std_logic;
signal heap_bh160_w30_3 :  std_logic;
signal CompressorIn_bh160_15_30 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_15_31 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_15_15 :  std_logic_vector(2 downto 0);
signal heap_bh160_w30_4 :  std_logic;
signal heap_bh160_w31_3 :  std_logic;
signal heap_bh160_w32_3 :  std_logic;
signal CompressorIn_bh160_16_32 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_16_33 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_16_16 :  std_logic_vector(2 downto 0);
signal heap_bh160_w32_4 :  std_logic;
signal heap_bh160_w33_3 :  std_logic;
signal heap_bh160_w34_3 :  std_logic;
signal CompressorIn_bh160_17_34 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_17_35 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_17_17 :  std_logic_vector(2 downto 0);
signal heap_bh160_w34_4 :  std_logic;
signal heap_bh160_w35_3 :  std_logic;
signal heap_bh160_w36_3 :  std_logic;
signal CompressorIn_bh160_18_36 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_18_37 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_18_18 :  std_logic_vector(2 downto 0);
signal heap_bh160_w36_4 :  std_logic;
signal heap_bh160_w37_3 :  std_logic;
signal heap_bh160_w38_3 :  std_logic;
signal CompressorIn_bh160_19_38 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_19_39 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_19_19 :  std_logic_vector(2 downto 0);
signal heap_bh160_w38_4 :  std_logic;
signal heap_bh160_w39_3 :  std_logic;
signal heap_bh160_w40_3 :  std_logic;
signal CompressorIn_bh160_20_40 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_20_41 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_20_20 :  std_logic_vector(2 downto 0);
signal heap_bh160_w40_4 :  std_logic;
signal heap_bh160_w41_3 :  std_logic;
signal heap_bh160_w42_3 :  std_logic;
signal CompressorIn_bh160_21_42 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_21_43 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_21_21 :  std_logic_vector(2 downto 0);
signal heap_bh160_w42_4 :  std_logic;
signal heap_bh160_w43_3 :  std_logic;
signal heap_bh160_w44_3 :  std_logic;
signal CompressorIn_bh160_22_44 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_22_45 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_22_22 :  std_logic_vector(2 downto 0);
signal heap_bh160_w44_4 :  std_logic;
signal heap_bh160_w45_3 :  std_logic;
signal heap_bh160_w46_3 :  std_logic;
signal CompressorIn_bh160_23_46 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_23_47 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_23_23 :  std_logic_vector(2 downto 0);
signal heap_bh160_w46_4 :  std_logic;
signal heap_bh160_w47_3 :  std_logic;
signal heap_bh160_w48_3 :  std_logic;
signal CompressorIn_bh160_24_48 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_24_49 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_24_24 :  std_logic_vector(2 downto 0);
signal heap_bh160_w48_4 :  std_logic;
signal heap_bh160_w49_3 :  std_logic;
signal heap_bh160_w50_3 :  std_logic;
signal CompressorIn_bh160_25_50 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_25_51 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_25_25 :  std_logic_vector(2 downto 0);
signal heap_bh160_w50_4 :  std_logic;
signal heap_bh160_w51_3 :  std_logic;
signal heap_bh160_w52_3 :  std_logic;
signal CompressorIn_bh160_26_52 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh160_26_53 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh160_26_26 :  std_logic_vector(2 downto 0);
signal heap_bh160_w52_4 :  std_logic;
signal heap_bh160_w53_3 :  std_logic;
signal heap_bh160_w54_3 :  std_logic;
signal CompressorIn_bh160_27_54 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh160_27_27 :  std_logic_vector(1 downto 0);
signal heap_bh160_w54_4 :  std_logic;
signal finalAdderIn0_bh160 :  std_logic_vector(54 downto 0);
signal finalAdderIn1_bh160 :  std_logic_vector(54 downto 0);
signal finalAdderCin_bh160 :  std_logic;
signal finalAdderOut_bh160 :  std_logic_vector(54 downto 0);
signal tempR_bh160_0 :  std_logic;
signal CompressionResult160 :  std_logic_vector(55 downto 0);
signal addRes :  std_logic_vector(54 downto 0);
signal trSign, trSign_d1, trSign_d2 :  std_logic;
signal xposExtF :  std_logic_vector(53 downto 0);
signal posExtF :  std_logic_vector(53 downto 0);
signal sticky :  std_logic;
signal posExtFsticky :  std_logic_vector(37 downto 0);
signal nZerosNew :  std_logic_vector(5 downto 0);
signal shiftedFrac :  std_logic_vector(37 downto 0);
signal stk :  std_logic;
signal rnd :  std_logic;
signal grd :  std_logic;
signal lsb :  std_logic;
signal tfracR :  std_logic_vector(17 downto 0);
signal biasedZeros :  std_logic_vector(7 downto 0);
signal addToRoundBit :  std_logic;
signal xroundedExpFrac :  std_logic_vector(25 downto 0);
signal roundedExpFrac :  std_logic_vector(25 downto 0);
signal tnexp :  std_logic_vector(7 downto 0);
signal upexp :  std_logic_vector(7 downto 0);
signal path1_exp :  std_logic_vector(6 downto 0);
signal path1_frac :  std_logic_vector(16 downto 0);
signal path1_exc :  std_logic_vector(1 downto 0);
signal path1_sign :  std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            expRes1_d1 <=  expRes1;
            expRes1_d2 <=  expRes1_d1;
            expRes1_d3 <=  expRes1_d2;
            expRes0_d1 <=  expRes0;
            expRes0_d2 <=  expRes0_d1;
            expRes0_d3 <=  expRes0_d2;
            sgn_d1 <=  sgn;
            sgn_d2 <=  sgn_d1;
            sgn_d3 <=  sgn_d2;
            eMax_d1 <=  eMax;
            eMax_d2 <=  eMax_d1;
            eMax_d3 <=  eMax_d2;
            trSign_d1 <=  trSign;
            trSign_d2 <=  trSign_d1;
         end if;
      end process;
   neX<= X(23 downto 17);
   neY<= Y(23 downto 17);
   neZ<= Z(23 downto 17);
   mX<= X(16 downto 0);
   mY<= Y(16 downto 0);
   mZ<= Z(16 downto 0);
   sX<= X(24);
   sY<= Y(24);
   sZ<= Z(24);
   excX <= X(26 downto 25);
   excY <= Y(26 downto 25);
   excZ <= Z(26 downto 25);

   eX <= "0000000" when excX="00" else neX;
   eY <= "0000000" when excY="00" else neY;
   eZ <= "0000000" when excZ="00" else neZ;
   expRes1 <= '1' when (excX(1)='1' or excY(1)='1' or excZ(1)='1') else '0';
   expRes0 <= '1' when (((excX(1)='0' and excY(1)='0' and excZ(1)='0') and (excX(0)='1' or excY(0)='1' or excZ(0)='1') ) or 
      (excX="10" and sX='1' and excY="10" and sY='0') or 
      (excX="10" and sX='0' and excY="10" and sY='1') or 
      (excZ="10" and sZ='1' and excY="10" and sY='0') or 
      (excZ="10" and sZ='0' and excY="10" and sY='1') or 
      (excX="10" and sX='1' and excZ="10" and sZ='0') or 
      (excX="10" and sX='0' and excZ="10" and sZ='1') or 
      (excX="11" or excY="11" or excZ="11")) else '0';
   sgn<= '1' when ((excX="10" and sX='1') or (excY="10" and sY='1') or (excZ="10" and sZ='1') ) else '0';
   ---------------- cycle 0----------------
   dexy <= ("0" & eX) - ("0" & eY);
   deyz <= ("0" & eY) - ("0" & eZ);
   dezx <= ("0" & eZ) - ("0" & eX);
   cdexy <= dexy(7);
   cdeyz <= deyz(7);
   cdezx <= dezx(7);
   eMaxSel <= cdexy & cdeyz & cdezx;
   with (eMaxSel) select 
   eMax <= eX when "001"|"011",
       eY when "100"|"101",
       eZ when "010"|"110",
       eX when others;
   with (eMaxSel) select 
   m1 <=  '1' when "010"|"110", '0' when others;
   with (eMaxSel) select 
   m2 <= '1' when "001"|"011", '0' when others;
   with (eMaxSel) select 
   m3 <= '1' when "100"|"101", '0' when others;
   with (eMaxSel) select 
   alpha <= "00" when "010"|"110",
       "01" when "100"|"101",
       "10" when "001"|"011",
       "11" when others;
   with (eMaxSel) select 
   beta <= "00" when "001"|"011",
       "01" when "010"|"110",
       "10" when "100"|"101",
       "11" when others;
   with (eMaxSel) select 
   gama <= "00" when "100"|"101",
       "01" when "001"|"011",
       "10" when "010"|"110",
       "11" when others;
   mux1out <= dexy when m1='0' else dezx;
   mux2out <= deyz when m2='0' else dexy;
   mux3out <= dezx when m3='0' else deyz;
   nmux1out <=  not(mux1out) + '1';
   nmux2out <=  not(mux2out) + '1';
   nmux3out <=  not(mux3out) + '1';
   with (alpha) select 
   amx <= mux1out when "00",
      nmux1out when "01", 
      "00000000" when "10",
   "00000000" when others;
   with (beta) select 
   bmx <= mux2out when "00",
      nmux2out when "01", 
      "00000000" when "10",
   "00000000" when others;
   with (gama) select 
   gmx <= mux3out when "00",
      nmux3out when "01", 
      "00000000" when "10",
   "00000000" when others;
   sval0<= amx(5 downto 0);
   sval1<= bmx(5 downto 0);
   sval2<= gmx(5 downto 0);
   sout0 <=  '1' when amx(7 downto 6)>0 else '0';
   sout1 <=  '1' when bmx(7 downto 6)>0 else '0';
   sout2 <=  '1' when gmx(7 downto 6)>0 else '0';
   nfX <=  "1" & mX;
   nfY <=  "1" & mY;
   nfZ <=  "1" & mZ;
   fX <= "000000000000000000" when excX="00" else nfX;
   fY <= "000000000000000000" when excY="00" else nfY;
   fZ <= "000000000000000000" when excZ="00" else nfZ;
   fxShifter: RightShifter_18_by_max_34_F100_uid125  -- pipelineDepth=0 maxInDelay=5.852e-09
      port map ( clk  => clk,
                 rst  => rst,
                 R => sfX,
                 S => sval0,
                 X => fX);
   fyShifter: RightShifter_18_by_max_34_F100_uid129  -- pipelineDepth=0 maxInDelay=5.852e-09
      port map ( clk  => clk,
                 rst  => rst,
                 R => sfY,
                 S => sval1,
                 X => fY);
   fzShifter: RightShifter_18_by_max_34_F100_uid133  -- pipelineDepth=0 maxInDelay=5.852e-09
      port map ( clk  => clk,
                 rst  => rst,
                 R => sfZ,
                 S => sval2,
                 X => fZ);
   efX <= ("000" & sfX) when sout0='0' else "0000000000000000000000000000000000000000000000000000000";
   efY <= ("000" & sfY) when sout1='0' else "0000000000000000000000000000000000000000000000000000000";
   efZ <= ("000" & sfZ) when sout2='0' else "0000000000000000000000000000000000000000000000000000000";
   xsefX <= (efX xor (54 downto 0 => sX));
   xsefY <= (efY xor (54 downto 0 => sY));
   xsefZ <= (efZ xor (54 downto 0 => sZ));
   Twoscompl0: IntAdder_55_f100_uid137  -- pipelineDepth=1 maxInDelay=6.413e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => sX,
                 R => sefX   ,
                 X => xsefX,
                 Y => "0000000000000000000000000000000000000000000000000000000");

   Twoscompl1: IntAdder_55_f100_uid143  -- pipelineDepth=1 maxInDelay=6.413e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => sY,
                 R => sefY   ,
                 X => xsefY,
                 Y => "0000000000000000000000000000000000000000000000000000000");

   Twoscompl2: IntAdder_55_f100_uid149  -- pipelineDepth=1 maxInDelay=6.413e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => sZ,
                 R => sefZ   ,
                 X => xsefZ,
                 Y => "0000000000000000000000000000000000000000000000000000000");

   ----------------Synchro barrier, entering cycle 1----------------
   ---------------- cycle 1----------------
   heap_bh160_w0_0 <= sefX(0); -- cycle= 1 cp= 0
   heap_bh160_w1_0 <= sefX(1); -- cycle= 1 cp= 0
   heap_bh160_w2_0 <= sefX(2); -- cycle= 1 cp= 0
   heap_bh160_w3_0 <= sefX(3); -- cycle= 1 cp= 0
   heap_bh160_w4_0 <= sefX(4); -- cycle= 1 cp= 0
   heap_bh160_w5_0 <= sefX(5); -- cycle= 1 cp= 0
   heap_bh160_w6_0 <= sefX(6); -- cycle= 1 cp= 0
   heap_bh160_w7_0 <= sefX(7); -- cycle= 1 cp= 0
   heap_bh160_w8_0 <= sefX(8); -- cycle= 1 cp= 0
   heap_bh160_w9_0 <= sefX(9); -- cycle= 1 cp= 0
   heap_bh160_w10_0 <= sefX(10); -- cycle= 1 cp= 0
   heap_bh160_w11_0 <= sefX(11); -- cycle= 1 cp= 0
   heap_bh160_w12_0 <= sefX(12); -- cycle= 1 cp= 0
   heap_bh160_w13_0 <= sefX(13); -- cycle= 1 cp= 0
   heap_bh160_w14_0 <= sefX(14); -- cycle= 1 cp= 0
   heap_bh160_w15_0 <= sefX(15); -- cycle= 1 cp= 0
   heap_bh160_w16_0 <= sefX(16); -- cycle= 1 cp= 0
   heap_bh160_w17_0 <= sefX(17); -- cycle= 1 cp= 0
   heap_bh160_w18_0 <= sefX(18); -- cycle= 1 cp= 0
   heap_bh160_w19_0 <= sefX(19); -- cycle= 1 cp= 0
   heap_bh160_w20_0 <= sefX(20); -- cycle= 1 cp= 0
   heap_bh160_w21_0 <= sefX(21); -- cycle= 1 cp= 0
   heap_bh160_w22_0 <= sefX(22); -- cycle= 1 cp= 0
   heap_bh160_w23_0 <= sefX(23); -- cycle= 1 cp= 0
   heap_bh160_w24_0 <= sefX(24); -- cycle= 1 cp= 0
   heap_bh160_w25_0 <= sefX(25); -- cycle= 1 cp= 0
   heap_bh160_w26_0 <= sefX(26); -- cycle= 1 cp= 0
   heap_bh160_w27_0 <= sefX(27); -- cycle= 1 cp= 0
   heap_bh160_w28_0 <= sefX(28); -- cycle= 1 cp= 0
   heap_bh160_w29_0 <= sefX(29); -- cycle= 1 cp= 0
   heap_bh160_w30_0 <= sefX(30); -- cycle= 1 cp= 0
   heap_bh160_w31_0 <= sefX(31); -- cycle= 1 cp= 0
   heap_bh160_w32_0 <= sefX(32); -- cycle= 1 cp= 0
   heap_bh160_w33_0 <= sefX(33); -- cycle= 1 cp= 0
   heap_bh160_w34_0 <= sefX(34); -- cycle= 1 cp= 0
   heap_bh160_w35_0 <= sefX(35); -- cycle= 1 cp= 0
   heap_bh160_w36_0 <= sefX(36); -- cycle= 1 cp= 0
   heap_bh160_w37_0 <= sefX(37); -- cycle= 1 cp= 0
   heap_bh160_w38_0 <= sefX(38); -- cycle= 1 cp= 0
   heap_bh160_w39_0 <= sefX(39); -- cycle= 1 cp= 0
   heap_bh160_w40_0 <= sefX(40); -- cycle= 1 cp= 0
   heap_bh160_w41_0 <= sefX(41); -- cycle= 1 cp= 0
   heap_bh160_w42_0 <= sefX(42); -- cycle= 1 cp= 0
   heap_bh160_w43_0 <= sefX(43); -- cycle= 1 cp= 0
   heap_bh160_w44_0 <= sefX(44); -- cycle= 1 cp= 0
   heap_bh160_w45_0 <= sefX(45); -- cycle= 1 cp= 0
   heap_bh160_w46_0 <= sefX(46); -- cycle= 1 cp= 0
   heap_bh160_w47_0 <= sefX(47); -- cycle= 1 cp= 0
   heap_bh160_w48_0 <= sefX(48); -- cycle= 1 cp= 0
   heap_bh160_w49_0 <= sefX(49); -- cycle= 1 cp= 0
   heap_bh160_w50_0 <= sefX(50); -- cycle= 1 cp= 0
   heap_bh160_w51_0 <= sefX(51); -- cycle= 1 cp= 0
   heap_bh160_w52_0 <= sefX(52); -- cycle= 1 cp= 0
   heap_bh160_w53_0 <= sefX(53); -- cycle= 1 cp= 0
   heap_bh160_w54_0 <= sefX(54); -- cycle= 1 cp= 0
   ---------------- cycle 1----------------
   heap_bh160_w0_1 <= sefY(0); -- cycle= 1 cp= 0
   heap_bh160_w1_1 <= sefY(1); -- cycle= 1 cp= 0
   heap_bh160_w2_1 <= sefY(2); -- cycle= 1 cp= 0
   heap_bh160_w3_1 <= sefY(3); -- cycle= 1 cp= 0
   heap_bh160_w4_1 <= sefY(4); -- cycle= 1 cp= 0
   heap_bh160_w5_1 <= sefY(5); -- cycle= 1 cp= 0
   heap_bh160_w6_1 <= sefY(6); -- cycle= 1 cp= 0
   heap_bh160_w7_1 <= sefY(7); -- cycle= 1 cp= 0
   heap_bh160_w8_1 <= sefY(8); -- cycle= 1 cp= 0
   heap_bh160_w9_1 <= sefY(9); -- cycle= 1 cp= 0
   heap_bh160_w10_1 <= sefY(10); -- cycle= 1 cp= 0
   heap_bh160_w11_1 <= sefY(11); -- cycle= 1 cp= 0
   heap_bh160_w12_1 <= sefY(12); -- cycle= 1 cp= 0
   heap_bh160_w13_1 <= sefY(13); -- cycle= 1 cp= 0
   heap_bh160_w14_1 <= sefY(14); -- cycle= 1 cp= 0
   heap_bh160_w15_1 <= sefY(15); -- cycle= 1 cp= 0
   heap_bh160_w16_1 <= sefY(16); -- cycle= 1 cp= 0
   heap_bh160_w17_1 <= sefY(17); -- cycle= 1 cp= 0
   heap_bh160_w18_1 <= sefY(18); -- cycle= 1 cp= 0
   heap_bh160_w19_1 <= sefY(19); -- cycle= 1 cp= 0
   heap_bh160_w20_1 <= sefY(20); -- cycle= 1 cp= 0
   heap_bh160_w21_1 <= sefY(21); -- cycle= 1 cp= 0
   heap_bh160_w22_1 <= sefY(22); -- cycle= 1 cp= 0
   heap_bh160_w23_1 <= sefY(23); -- cycle= 1 cp= 0
   heap_bh160_w24_1 <= sefY(24); -- cycle= 1 cp= 0
   heap_bh160_w25_1 <= sefY(25); -- cycle= 1 cp= 0
   heap_bh160_w26_1 <= sefY(26); -- cycle= 1 cp= 0
   heap_bh160_w27_1 <= sefY(27); -- cycle= 1 cp= 0
   heap_bh160_w28_1 <= sefY(28); -- cycle= 1 cp= 0
   heap_bh160_w29_1 <= sefY(29); -- cycle= 1 cp= 0
   heap_bh160_w30_1 <= sefY(30); -- cycle= 1 cp= 0
   heap_bh160_w31_1 <= sefY(31); -- cycle= 1 cp= 0
   heap_bh160_w32_1 <= sefY(32); -- cycle= 1 cp= 0
   heap_bh160_w33_1 <= sefY(33); -- cycle= 1 cp= 0
   heap_bh160_w34_1 <= sefY(34); -- cycle= 1 cp= 0
   heap_bh160_w35_1 <= sefY(35); -- cycle= 1 cp= 0
   heap_bh160_w36_1 <= sefY(36); -- cycle= 1 cp= 0
   heap_bh160_w37_1 <= sefY(37); -- cycle= 1 cp= 0
   heap_bh160_w38_1 <= sefY(38); -- cycle= 1 cp= 0
   heap_bh160_w39_1 <= sefY(39); -- cycle= 1 cp= 0
   heap_bh160_w40_1 <= sefY(40); -- cycle= 1 cp= 0
   heap_bh160_w41_1 <= sefY(41); -- cycle= 1 cp= 0
   heap_bh160_w42_1 <= sefY(42); -- cycle= 1 cp= 0
   heap_bh160_w43_1 <= sefY(43); -- cycle= 1 cp= 0
   heap_bh160_w44_1 <= sefY(44); -- cycle= 1 cp= 0
   heap_bh160_w45_1 <= sefY(45); -- cycle= 1 cp= 0
   heap_bh160_w46_1 <= sefY(46); -- cycle= 1 cp= 0
   heap_bh160_w47_1 <= sefY(47); -- cycle= 1 cp= 0
   heap_bh160_w48_1 <= sefY(48); -- cycle= 1 cp= 0
   heap_bh160_w49_1 <= sefY(49); -- cycle= 1 cp= 0
   heap_bh160_w50_1 <= sefY(50); -- cycle= 1 cp= 0
   heap_bh160_w51_1 <= sefY(51); -- cycle= 1 cp= 0
   heap_bh160_w52_1 <= sefY(52); -- cycle= 1 cp= 0
   heap_bh160_w53_1 <= sefY(53); -- cycle= 1 cp= 0
   heap_bh160_w54_1 <= sefY(54); -- cycle= 1 cp= 0
   ---------------- cycle 1----------------
   heap_bh160_w0_2 <= sefZ(0); -- cycle= 1 cp= 0
   heap_bh160_w1_2 <= sefZ(1); -- cycle= 1 cp= 0
   heap_bh160_w2_2 <= sefZ(2); -- cycle= 1 cp= 0
   heap_bh160_w3_2 <= sefZ(3); -- cycle= 1 cp= 0
   heap_bh160_w4_2 <= sefZ(4); -- cycle= 1 cp= 0
   heap_bh160_w5_2 <= sefZ(5); -- cycle= 1 cp= 0
   heap_bh160_w6_2 <= sefZ(6); -- cycle= 1 cp= 0
   heap_bh160_w7_2 <= sefZ(7); -- cycle= 1 cp= 0
   heap_bh160_w8_2 <= sefZ(8); -- cycle= 1 cp= 0
   heap_bh160_w9_2 <= sefZ(9); -- cycle= 1 cp= 0
   heap_bh160_w10_2 <= sefZ(10); -- cycle= 1 cp= 0
   heap_bh160_w11_2 <= sefZ(11); -- cycle= 1 cp= 0
   heap_bh160_w12_2 <= sefZ(12); -- cycle= 1 cp= 0
   heap_bh160_w13_2 <= sefZ(13); -- cycle= 1 cp= 0
   heap_bh160_w14_2 <= sefZ(14); -- cycle= 1 cp= 0
   heap_bh160_w15_2 <= sefZ(15); -- cycle= 1 cp= 0
   heap_bh160_w16_2 <= sefZ(16); -- cycle= 1 cp= 0
   heap_bh160_w17_2 <= sefZ(17); -- cycle= 1 cp= 0
   heap_bh160_w18_2 <= sefZ(18); -- cycle= 1 cp= 0
   heap_bh160_w19_2 <= sefZ(19); -- cycle= 1 cp= 0
   heap_bh160_w20_2 <= sefZ(20); -- cycle= 1 cp= 0
   heap_bh160_w21_2 <= sefZ(21); -- cycle= 1 cp= 0
   heap_bh160_w22_2 <= sefZ(22); -- cycle= 1 cp= 0
   heap_bh160_w23_2 <= sefZ(23); -- cycle= 1 cp= 0
   heap_bh160_w24_2 <= sefZ(24); -- cycle= 1 cp= 0
   heap_bh160_w25_2 <= sefZ(25); -- cycle= 1 cp= 0
   heap_bh160_w26_2 <= sefZ(26); -- cycle= 1 cp= 0
   heap_bh160_w27_2 <= sefZ(27); -- cycle= 1 cp= 0
   heap_bh160_w28_2 <= sefZ(28); -- cycle= 1 cp= 0
   heap_bh160_w29_2 <= sefZ(29); -- cycle= 1 cp= 0
   heap_bh160_w30_2 <= sefZ(30); -- cycle= 1 cp= 0
   heap_bh160_w31_2 <= sefZ(31); -- cycle= 1 cp= 0
   heap_bh160_w32_2 <= sefZ(32); -- cycle= 1 cp= 0
   heap_bh160_w33_2 <= sefZ(33); -- cycle= 1 cp= 0
   heap_bh160_w34_2 <= sefZ(34); -- cycle= 1 cp= 0
   heap_bh160_w35_2 <= sefZ(35); -- cycle= 1 cp= 0
   heap_bh160_w36_2 <= sefZ(36); -- cycle= 1 cp= 0
   heap_bh160_w37_2 <= sefZ(37); -- cycle= 1 cp= 0
   heap_bh160_w38_2 <= sefZ(38); -- cycle= 1 cp= 0
   heap_bh160_w39_2 <= sefZ(39); -- cycle= 1 cp= 0
   heap_bh160_w40_2 <= sefZ(40); -- cycle= 1 cp= 0
   heap_bh160_w41_2 <= sefZ(41); -- cycle= 1 cp= 0
   heap_bh160_w42_2 <= sefZ(42); -- cycle= 1 cp= 0
   heap_bh160_w43_2 <= sefZ(43); -- cycle= 1 cp= 0
   heap_bh160_w44_2 <= sefZ(44); -- cycle= 1 cp= 0
   heap_bh160_w45_2 <= sefZ(45); -- cycle= 1 cp= 0
   heap_bh160_w46_2 <= sefZ(46); -- cycle= 1 cp= 0
   heap_bh160_w47_2 <= sefZ(47); -- cycle= 1 cp= 0
   heap_bh160_w48_2 <= sefZ(48); -- cycle= 1 cp= 0
   heap_bh160_w49_2 <= sefZ(49); -- cycle= 1 cp= 0
   heap_bh160_w50_2 <= sefZ(50); -- cycle= 1 cp= 0
   heap_bh160_w51_2 <= sefZ(51); -- cycle= 1 cp= 0
   heap_bh160_w52_2 <= sefZ(52); -- cycle= 1 cp= 0
   heap_bh160_w53_2 <= sefZ(53); -- cycle= 1 cp= 0
   heap_bh160_w54_2 <= sefZ(54); -- cycle= 1 cp= 0
   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 1----------------

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_0_0 <= heap_bh160_w0_2 & heap_bh160_w0_1 & heap_bh160_w0_0;
   CompressorIn_bh160_0_1 <= heap_bh160_w1_2 & heap_bh160_w1_1;
   Compressor_bh160_0: Compressor_23_3
      port map ( R => CompressorOut_bh160_0_0   ,
                 X0 => CompressorIn_bh160_0_0,
                 X1 => CompressorIn_bh160_0_1);
   heap_bh160_w0_3 <= CompressorOut_bh160_0_0(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w1_3 <= CompressorOut_bh160_0_0(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w2_3 <= CompressorOut_bh160_0_0(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_1_2 <= heap_bh160_w2_2 & heap_bh160_w2_1 & heap_bh160_w2_0;
   CompressorIn_bh160_1_3 <= heap_bh160_w3_2 & heap_bh160_w3_1;
   Compressor_bh160_1: Compressor_23_3
      port map ( R => CompressorOut_bh160_1_1   ,
                 X0 => CompressorIn_bh160_1_2,
                 X1 => CompressorIn_bh160_1_3);
   heap_bh160_w2_4 <= CompressorOut_bh160_1_1(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w3_3 <= CompressorOut_bh160_1_1(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w4_3 <= CompressorOut_bh160_1_1(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_2_4 <= heap_bh160_w4_2 & heap_bh160_w4_1 & heap_bh160_w4_0;
   CompressorIn_bh160_2_5 <= heap_bh160_w5_2 & heap_bh160_w5_1;
   Compressor_bh160_2: Compressor_23_3
      port map ( R => CompressorOut_bh160_2_2   ,
                 X0 => CompressorIn_bh160_2_4,
                 X1 => CompressorIn_bh160_2_5);
   heap_bh160_w4_4 <= CompressorOut_bh160_2_2(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w5_3 <= CompressorOut_bh160_2_2(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w6_3 <= CompressorOut_bh160_2_2(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_3_6 <= heap_bh160_w6_2 & heap_bh160_w6_1 & heap_bh160_w6_0;
   CompressorIn_bh160_3_7 <= heap_bh160_w7_2 & heap_bh160_w7_1;
   Compressor_bh160_3: Compressor_23_3
      port map ( R => CompressorOut_bh160_3_3   ,
                 X0 => CompressorIn_bh160_3_6,
                 X1 => CompressorIn_bh160_3_7);
   heap_bh160_w6_4 <= CompressorOut_bh160_3_3(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w7_3 <= CompressorOut_bh160_3_3(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w8_3 <= CompressorOut_bh160_3_3(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_4_8 <= heap_bh160_w8_2 & heap_bh160_w8_1 & heap_bh160_w8_0;
   CompressorIn_bh160_4_9 <= heap_bh160_w9_2 & heap_bh160_w9_1;
   Compressor_bh160_4: Compressor_23_3
      port map ( R => CompressorOut_bh160_4_4   ,
                 X0 => CompressorIn_bh160_4_8,
                 X1 => CompressorIn_bh160_4_9);
   heap_bh160_w8_4 <= CompressorOut_bh160_4_4(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w9_3 <= CompressorOut_bh160_4_4(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w10_3 <= CompressorOut_bh160_4_4(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_5_10 <= heap_bh160_w10_2 & heap_bh160_w10_1 & heap_bh160_w10_0;
   CompressorIn_bh160_5_11 <= heap_bh160_w11_2 & heap_bh160_w11_1;
   Compressor_bh160_5: Compressor_23_3
      port map ( R => CompressorOut_bh160_5_5   ,
                 X0 => CompressorIn_bh160_5_10,
                 X1 => CompressorIn_bh160_5_11);
   heap_bh160_w10_4 <= CompressorOut_bh160_5_5(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w11_3 <= CompressorOut_bh160_5_5(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w12_3 <= CompressorOut_bh160_5_5(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_6_12 <= heap_bh160_w12_2 & heap_bh160_w12_1 & heap_bh160_w12_0;
   CompressorIn_bh160_6_13 <= heap_bh160_w13_2 & heap_bh160_w13_1;
   Compressor_bh160_6: Compressor_23_3
      port map ( R => CompressorOut_bh160_6_6   ,
                 X0 => CompressorIn_bh160_6_12,
                 X1 => CompressorIn_bh160_6_13);
   heap_bh160_w12_4 <= CompressorOut_bh160_6_6(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w13_3 <= CompressorOut_bh160_6_6(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w14_3 <= CompressorOut_bh160_6_6(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_7_14 <= heap_bh160_w14_2 & heap_bh160_w14_1 & heap_bh160_w14_0;
   CompressorIn_bh160_7_15 <= heap_bh160_w15_2 & heap_bh160_w15_1;
   Compressor_bh160_7: Compressor_23_3
      port map ( R => CompressorOut_bh160_7_7   ,
                 X0 => CompressorIn_bh160_7_14,
                 X1 => CompressorIn_bh160_7_15);
   heap_bh160_w14_4 <= CompressorOut_bh160_7_7(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w15_3 <= CompressorOut_bh160_7_7(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w16_3 <= CompressorOut_bh160_7_7(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_8_16 <= heap_bh160_w16_2 & heap_bh160_w16_1 & heap_bh160_w16_0;
   CompressorIn_bh160_8_17 <= heap_bh160_w17_2 & heap_bh160_w17_1;
   Compressor_bh160_8: Compressor_23_3
      port map ( R => CompressorOut_bh160_8_8   ,
                 X0 => CompressorIn_bh160_8_16,
                 X1 => CompressorIn_bh160_8_17);
   heap_bh160_w16_4 <= CompressorOut_bh160_8_8(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w17_3 <= CompressorOut_bh160_8_8(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w18_3 <= CompressorOut_bh160_8_8(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_9_18 <= heap_bh160_w18_2 & heap_bh160_w18_1 & heap_bh160_w18_0;
   CompressorIn_bh160_9_19 <= heap_bh160_w19_2 & heap_bh160_w19_1;
   Compressor_bh160_9: Compressor_23_3
      port map ( R => CompressorOut_bh160_9_9   ,
                 X0 => CompressorIn_bh160_9_18,
                 X1 => CompressorIn_bh160_9_19);
   heap_bh160_w18_4 <= CompressorOut_bh160_9_9(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w19_3 <= CompressorOut_bh160_9_9(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w20_3 <= CompressorOut_bh160_9_9(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_10_20 <= heap_bh160_w20_2 & heap_bh160_w20_1 & heap_bh160_w20_0;
   CompressorIn_bh160_10_21 <= heap_bh160_w21_2 & heap_bh160_w21_1;
   Compressor_bh160_10: Compressor_23_3
      port map ( R => CompressorOut_bh160_10_10   ,
                 X0 => CompressorIn_bh160_10_20,
                 X1 => CompressorIn_bh160_10_21);
   heap_bh160_w20_4 <= CompressorOut_bh160_10_10(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w21_3 <= CompressorOut_bh160_10_10(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w22_3 <= CompressorOut_bh160_10_10(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_11_22 <= heap_bh160_w22_2 & heap_bh160_w22_1 & heap_bh160_w22_0;
   CompressorIn_bh160_11_23 <= heap_bh160_w23_2 & heap_bh160_w23_1;
   Compressor_bh160_11: Compressor_23_3
      port map ( R => CompressorOut_bh160_11_11   ,
                 X0 => CompressorIn_bh160_11_22,
                 X1 => CompressorIn_bh160_11_23);
   heap_bh160_w22_4 <= CompressorOut_bh160_11_11(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w23_3 <= CompressorOut_bh160_11_11(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w24_3 <= CompressorOut_bh160_11_11(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_12_24 <= heap_bh160_w24_2 & heap_bh160_w24_1 & heap_bh160_w24_0;
   CompressorIn_bh160_12_25 <= heap_bh160_w25_2 & heap_bh160_w25_1;
   Compressor_bh160_12: Compressor_23_3
      port map ( R => CompressorOut_bh160_12_12   ,
                 X0 => CompressorIn_bh160_12_24,
                 X1 => CompressorIn_bh160_12_25);
   heap_bh160_w24_4 <= CompressorOut_bh160_12_12(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w25_3 <= CompressorOut_bh160_12_12(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w26_3 <= CompressorOut_bh160_12_12(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_13_26 <= heap_bh160_w26_2 & heap_bh160_w26_1 & heap_bh160_w26_0;
   CompressorIn_bh160_13_27 <= heap_bh160_w27_2 & heap_bh160_w27_1;
   Compressor_bh160_13: Compressor_23_3
      port map ( R => CompressorOut_bh160_13_13   ,
                 X0 => CompressorIn_bh160_13_26,
                 X1 => CompressorIn_bh160_13_27);
   heap_bh160_w26_4 <= CompressorOut_bh160_13_13(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w27_3 <= CompressorOut_bh160_13_13(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w28_3 <= CompressorOut_bh160_13_13(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_14_28 <= heap_bh160_w28_2 & heap_bh160_w28_1 & heap_bh160_w28_0;
   CompressorIn_bh160_14_29 <= heap_bh160_w29_2 & heap_bh160_w29_1;
   Compressor_bh160_14: Compressor_23_3
      port map ( R => CompressorOut_bh160_14_14   ,
                 X0 => CompressorIn_bh160_14_28,
                 X1 => CompressorIn_bh160_14_29);
   heap_bh160_w28_4 <= CompressorOut_bh160_14_14(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w29_3 <= CompressorOut_bh160_14_14(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w30_3 <= CompressorOut_bh160_14_14(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_15_30 <= heap_bh160_w30_2 & heap_bh160_w30_1 & heap_bh160_w30_0;
   CompressorIn_bh160_15_31 <= heap_bh160_w31_2 & heap_bh160_w31_1;
   Compressor_bh160_15: Compressor_23_3
      port map ( R => CompressorOut_bh160_15_15   ,
                 X0 => CompressorIn_bh160_15_30,
                 X1 => CompressorIn_bh160_15_31);
   heap_bh160_w30_4 <= CompressorOut_bh160_15_15(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w31_3 <= CompressorOut_bh160_15_15(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w32_3 <= CompressorOut_bh160_15_15(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_16_32 <= heap_bh160_w32_2 & heap_bh160_w32_1 & heap_bh160_w32_0;
   CompressorIn_bh160_16_33 <= heap_bh160_w33_2 & heap_bh160_w33_1;
   Compressor_bh160_16: Compressor_23_3
      port map ( R => CompressorOut_bh160_16_16   ,
                 X0 => CompressorIn_bh160_16_32,
                 X1 => CompressorIn_bh160_16_33);
   heap_bh160_w32_4 <= CompressorOut_bh160_16_16(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w33_3 <= CompressorOut_bh160_16_16(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w34_3 <= CompressorOut_bh160_16_16(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_17_34 <= heap_bh160_w34_2 & heap_bh160_w34_1 & heap_bh160_w34_0;
   CompressorIn_bh160_17_35 <= heap_bh160_w35_2 & heap_bh160_w35_1;
   Compressor_bh160_17: Compressor_23_3
      port map ( R => CompressorOut_bh160_17_17   ,
                 X0 => CompressorIn_bh160_17_34,
                 X1 => CompressorIn_bh160_17_35);
   heap_bh160_w34_4 <= CompressorOut_bh160_17_17(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w35_3 <= CompressorOut_bh160_17_17(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w36_3 <= CompressorOut_bh160_17_17(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_18_36 <= heap_bh160_w36_2 & heap_bh160_w36_1 & heap_bh160_w36_0;
   CompressorIn_bh160_18_37 <= heap_bh160_w37_2 & heap_bh160_w37_1;
   Compressor_bh160_18: Compressor_23_3
      port map ( R => CompressorOut_bh160_18_18   ,
                 X0 => CompressorIn_bh160_18_36,
                 X1 => CompressorIn_bh160_18_37);
   heap_bh160_w36_4 <= CompressorOut_bh160_18_18(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w37_3 <= CompressorOut_bh160_18_18(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w38_3 <= CompressorOut_bh160_18_18(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_19_38 <= heap_bh160_w38_2 & heap_bh160_w38_1 & heap_bh160_w38_0;
   CompressorIn_bh160_19_39 <= heap_bh160_w39_2 & heap_bh160_w39_1;
   Compressor_bh160_19: Compressor_23_3
      port map ( R => CompressorOut_bh160_19_19   ,
                 X0 => CompressorIn_bh160_19_38,
                 X1 => CompressorIn_bh160_19_39);
   heap_bh160_w38_4 <= CompressorOut_bh160_19_19(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w39_3 <= CompressorOut_bh160_19_19(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w40_3 <= CompressorOut_bh160_19_19(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_20_40 <= heap_bh160_w40_2 & heap_bh160_w40_1 & heap_bh160_w40_0;
   CompressorIn_bh160_20_41 <= heap_bh160_w41_2 & heap_bh160_w41_1;
   Compressor_bh160_20: Compressor_23_3
      port map ( R => CompressorOut_bh160_20_20   ,
                 X0 => CompressorIn_bh160_20_40,
                 X1 => CompressorIn_bh160_20_41);
   heap_bh160_w40_4 <= CompressorOut_bh160_20_20(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w41_3 <= CompressorOut_bh160_20_20(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w42_3 <= CompressorOut_bh160_20_20(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_21_42 <= heap_bh160_w42_2 & heap_bh160_w42_1 & heap_bh160_w42_0;
   CompressorIn_bh160_21_43 <= heap_bh160_w43_2 & heap_bh160_w43_1;
   Compressor_bh160_21: Compressor_23_3
      port map ( R => CompressorOut_bh160_21_21   ,
                 X0 => CompressorIn_bh160_21_42,
                 X1 => CompressorIn_bh160_21_43);
   heap_bh160_w42_4 <= CompressorOut_bh160_21_21(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w43_3 <= CompressorOut_bh160_21_21(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w44_3 <= CompressorOut_bh160_21_21(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_22_44 <= heap_bh160_w44_2 & heap_bh160_w44_1 & heap_bh160_w44_0;
   CompressorIn_bh160_22_45 <= heap_bh160_w45_2 & heap_bh160_w45_1;
   Compressor_bh160_22: Compressor_23_3
      port map ( R => CompressorOut_bh160_22_22   ,
                 X0 => CompressorIn_bh160_22_44,
                 X1 => CompressorIn_bh160_22_45);
   heap_bh160_w44_4 <= CompressorOut_bh160_22_22(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w45_3 <= CompressorOut_bh160_22_22(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w46_3 <= CompressorOut_bh160_22_22(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_23_46 <= heap_bh160_w46_2 & heap_bh160_w46_1 & heap_bh160_w46_0;
   CompressorIn_bh160_23_47 <= heap_bh160_w47_2 & heap_bh160_w47_1;
   Compressor_bh160_23: Compressor_23_3
      port map ( R => CompressorOut_bh160_23_23   ,
                 X0 => CompressorIn_bh160_23_46,
                 X1 => CompressorIn_bh160_23_47);
   heap_bh160_w46_4 <= CompressorOut_bh160_23_23(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w47_3 <= CompressorOut_bh160_23_23(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w48_3 <= CompressorOut_bh160_23_23(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_24_48 <= heap_bh160_w48_2 & heap_bh160_w48_1 & heap_bh160_w48_0;
   CompressorIn_bh160_24_49 <= heap_bh160_w49_2 & heap_bh160_w49_1;
   Compressor_bh160_24: Compressor_23_3
      port map ( R => CompressorOut_bh160_24_24   ,
                 X0 => CompressorIn_bh160_24_48,
                 X1 => CompressorIn_bh160_24_49);
   heap_bh160_w48_4 <= CompressorOut_bh160_24_24(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w49_3 <= CompressorOut_bh160_24_24(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w50_3 <= CompressorOut_bh160_24_24(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_25_50 <= heap_bh160_w50_2 & heap_bh160_w50_1 & heap_bh160_w50_0;
   CompressorIn_bh160_25_51 <= heap_bh160_w51_2 & heap_bh160_w51_1;
   Compressor_bh160_25: Compressor_23_3
      port map ( R => CompressorOut_bh160_25_25   ,
                 X0 => CompressorIn_bh160_25_50,
                 X1 => CompressorIn_bh160_25_51);
   heap_bh160_w50_4 <= CompressorOut_bh160_25_25(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w51_3 <= CompressorOut_bh160_25_25(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w52_3 <= CompressorOut_bh160_25_25(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_26_52 <= heap_bh160_w52_2 & heap_bh160_w52_1 & heap_bh160_w52_0;
   CompressorIn_bh160_26_53 <= heap_bh160_w53_2 & heap_bh160_w53_1;
   Compressor_bh160_26: Compressor_23_3
      port map ( R => CompressorOut_bh160_26_26   ,
                 X0 => CompressorIn_bh160_26_52,
                 X1 => CompressorIn_bh160_26_53);
   heap_bh160_w52_4 <= CompressorOut_bh160_26_26(0); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w53_3 <= CompressorOut_bh160_26_26(1); -- cycle= 1 cp= 7.61e-10
   heap_bh160_w54_3 <= CompressorOut_bh160_26_26(2); -- cycle= 1 cp= 7.61e-10

   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh160_27_54 <= heap_bh160_w54_2 & heap_bh160_w54_1 & heap_bh160_w54_0;
   Compressor_bh160_27: Compressor_3_2
      port map ( R => CompressorOut_bh160_27_27   ,
                 X0 => CompressorIn_bh160_27_54);
   heap_bh160_w54_4 <= CompressorOut_bh160_27_27(0); -- cycle= 1 cp= 7.61e-10
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh160 <= "0" & heap_bh160_w54_4 & heap_bh160_w53_0 & heap_bh160_w52_4 & heap_bh160_w51_0 & heap_bh160_w50_4 & heap_bh160_w49_0 & heap_bh160_w48_4 & heap_bh160_w47_0 & heap_bh160_w46_4 & heap_bh160_w45_0 & heap_bh160_w44_4 & heap_bh160_w43_0 & heap_bh160_w42_4 & heap_bh160_w41_0 & heap_bh160_w40_4 & heap_bh160_w39_0 & heap_bh160_w38_4 & heap_bh160_w37_0 & heap_bh160_w36_4 & heap_bh160_w35_0 & heap_bh160_w34_4 & heap_bh160_w33_0 & heap_bh160_w32_4 & heap_bh160_w31_0 & heap_bh160_w30_4 & heap_bh160_w29_0 & heap_bh160_w28_4 & heap_bh160_w27_0 & heap_bh160_w26_4 & heap_bh160_w25_0 & heap_bh160_w24_4 & heap_bh160_w23_0 & heap_bh160_w22_4 & heap_bh160_w21_0 & heap_bh160_w20_4 & heap_bh160_w19_0 & heap_bh160_w18_4 & heap_bh160_w17_0 & heap_bh160_w16_4 & heap_bh160_w15_0 & heap_bh160_w14_4 & heap_bh160_w13_0 & heap_bh160_w12_4 & heap_bh160_w11_0 & heap_bh160_w10_4 & heap_bh160_w9_0 & heap_bh160_w8_4 & heap_bh160_w7_0 & heap_bh160_w6_4 & heap_bh160_w5_0 & heap_bh160_w4_4 & heap_bh160_w3_0 & heap_bh160_w2_4 & heap_bh160_w1_0;
   finalAdderIn1_bh160 <= "0" & heap_bh160_w54_3 & heap_bh160_w53_3 & heap_bh160_w52_3 & heap_bh160_w51_3 & heap_bh160_w50_3 & heap_bh160_w49_3 & heap_bh160_w48_3 & heap_bh160_w47_3 & heap_bh160_w46_3 & heap_bh160_w45_3 & heap_bh160_w44_3 & heap_bh160_w43_3 & heap_bh160_w42_3 & heap_bh160_w41_3 & heap_bh160_w40_3 & heap_bh160_w39_3 & heap_bh160_w38_3 & heap_bh160_w37_3 & heap_bh160_w36_3 & heap_bh160_w35_3 & heap_bh160_w34_3 & heap_bh160_w33_3 & heap_bh160_w32_3 & heap_bh160_w31_3 & heap_bh160_w30_3 & heap_bh160_w29_3 & heap_bh160_w28_3 & heap_bh160_w27_3 & heap_bh160_w26_3 & heap_bh160_w25_3 & heap_bh160_w24_3 & heap_bh160_w23_3 & heap_bh160_w22_3 & heap_bh160_w21_3 & heap_bh160_w20_3 & heap_bh160_w19_3 & heap_bh160_w18_3 & heap_bh160_w17_3 & heap_bh160_w16_3 & heap_bh160_w15_3 & heap_bh160_w14_3 & heap_bh160_w13_3 & heap_bh160_w12_3 & heap_bh160_w11_3 & heap_bh160_w10_3 & heap_bh160_w9_3 & heap_bh160_w8_3 & heap_bh160_w7_3 & heap_bh160_w6_3 & heap_bh160_w5_3 & heap_bh160_w4_3 & heap_bh160_w3_3 & heap_bh160_w2_3 & heap_bh160_w1_3;
   finalAdderCin_bh160 <= '0';
   Adder_final160_0: IntAdder_55_f100_uid225  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh160,
                 R => finalAdderOut_bh160   ,
                 X => finalAdderIn0_bh160,
                 Y => finalAdderIn1_bh160);
   ----------------Synchro barrier, entering cycle 1----------------
   tempR_bh160_0 <= heap_bh160_w0_3; -- already compressed
   -- concatenate all the compressed chunks
   CompressionResult160 <= finalAdderOut_bh160 & tempR_bh160_0;
   -- End of code generated by BitHeap::generateCompressorVHDL
   addRes <= CompressionResult160(54 downto 0);
   trSign <= addRes(54);
   xposExtF <= (addRes(53 downto 0) xor (53 downto 0 => trSign));
   AdderSignMag: IntAdder_54_f100_uid233  -- pipelineDepth=0 maxInDelay=1.847e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => trSign,
                 R => posExtF   ,
                 X => xposExtF,
                 Y => "000000000000000000000000000000000000000000000000000000");

   sticky <=  '1' when posExtF(15 downto 0)>"0000000000000000" else '0';
   posExtFsticky <= posExtF(53 downto 17) & sticky;
   LZC_component: LZCShifter_38_to_38_counting_64_F100_uid241  -- pipelineDepth=2 maxInDelay=8.392e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => posExtFsticky,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 3----------------
   stk<= '1' when shiftedFrac(17 downto 0)>"000000000000000000"else '0';
   rnd<= shiftedFrac(18);
   grd<= shiftedFrac(19);
   lsb<= shiftedFrac(20);
   tfracR<= shiftedFrac(36 downto 19);
   biasedZeros <= CONV_STD_LOGIC_VECTOR(2,8) - ("00" & nZerosNew);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   xroundedExpFrac<= ("0" & eMax_d3 & tfracR);
   Rounding_Adder: IntAdder_26_f100_uid245  -- pipelineDepth=0 maxInDelay=3.399e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => roundedExpFrac   ,
                 X => xroundedExpFrac,
                 Y => "00000000000000000000000000");

   tnexp<= roundedExpFrac(25 downto 18);
   upexp  <=  tnexp + biasedZeros;
   path1_exp <= upexp(6 downto 0);
   path1_frac <= roundedExpFrac(17 downto 1);
   path1_exc<= expRes1_d3 & expRes0_d3;
   path1_sign<= sgn_d3 when path1_exc>"01" else trSign_d2;
   R <= path1_exc & path1_sign & path1_exp & path1_frac;
end architecture;

--------------------------------------------------------------------------------
--                    Fix2FP_0_4_US_7_17_F100_uid253zeroD
--                          (IntAdder_6_f100_uid255)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_4_US_7_17_F100_uid253zeroD is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : in  std_logic_vector(5 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of Fix2FP_0_4_US_7_17_F100_uid253zeroD is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                    Fix2FP_0_4_US_7_17_F100_uid253_LZCS
--                (LZCShifter_5_to_18_counting_8_F100_uid263)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_4_US_7_17_F100_uid253_LZCS is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(4 downto 0);
          Count : out  std_logic_vector(2 downto 0);
          O : out  std_logic_vector(17 downto 0)   );
end entity;

architecture arch of Fix2FP_0_4_US_7_17_F100_uid253_LZCS is
signal level3 :  std_logic_vector(4 downto 0);
signal count2 :  std_logic;
signal level2 :  std_logic_vector(4 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(4 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(4 downto 0);
signal sCount :  std_logic_vector(2 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level3 <= I ;
   count2<= '1' when level3(4 downto 1) = (4 downto 1=>'0') else '0';
   level2<= level3(4 downto 0) when count2='0' else level3(0 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(4 downto 3) = (4 downto 3=>'0') else '0';
   level1<= level2(4 downto 0) when count1='0' else level2(2 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(4 downto 4) = (4 downto 4=>'0') else '0';
   level0<= level1(4 downto 0) when count0='0' else level1(3 downto 0) & (0 downto 0 => '0');

   O <= level0&(12 downto 0 => '0');
   sCount <= count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--              Fix2FP_0_4_US_7_17_F100_uid253exponentConversion
--                          (IntAdder_7_f100_uid267)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_4_US_7_17_F100_uid253exponentConversion is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(6 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(6 downto 0)   );
end entity;

architecture arch of Fix2FP_0_4_US_7_17_F100_uid253exponentConversion is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                Fix2FP_0_4_US_7_17_F100_uid253exponentFinal
--                          (IntAdder_8_f100_uid275)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_4_US_7_17_F100_uid253exponentFinal is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : in  std_logic_vector(7 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of Fix2FP_0_4_US_7_17_F100_uid253exponentFinal is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                  Fix2FP_0_4_US_7_17_F100_uid253expCorrect
--                          (IntAdder_8_f100_uid283)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Fix2FP_0_4_US_7_17_F100_uid253expCorrect is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : in  std_logic_vector(7 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(7 downto 0)   );
end entity;

architecture arch of Fix2FP_0_4_US_7_17_F100_uid253expCorrect is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                 FixtoGPUF
--                      (Fix2FP_0_4_US_7_17_F100_uid253)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Radu Tudoran, Bogdan Pasca (2009)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FixtoGPUF is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(4 downto 0);
          O : out  std_logic_vector(7+17+2 downto 0)   );
end entity;

architecture arch of FixtoGPUF is
   component Fix2FP_0_4_US_7_17_F100_uid253zeroD is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : in  std_logic_vector(5 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(5 downto 0)   );
   end component;

   component Fix2FP_0_4_US_7_17_F100_uid253_LZCS is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(4 downto 0);
             Count : out  std_logic_vector(2 downto 0);
             O : out  std_logic_vector(17 downto 0)   );
   end component;

   component Fix2FP_0_4_US_7_17_F100_uid253exponentConversion is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(6 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(6 downto 0)   );
   end component;

   component Fix2FP_0_4_US_7_17_F100_uid253exponentFinal is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : in  std_logic_vector(7 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(7 downto 0)   );
   end component;

   component Fix2FP_0_4_US_7_17_F100_uid253expCorrect is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Y : in  std_logic_vector(7 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(7 downto 0)   );
   end component;

signal input :  std_logic_vector(4 downto 0);
signal signSignal :  std_logic;
signal passedInput :  std_logic_vector(4 downto 0);
signal input2LZOC :  std_logic_vector(3 downto 0);
signal minusOne4ZD :  std_logic_vector(5 downto 0);
signal passedInputBit :  std_logic_vector(5 downto 0);
signal zeroDS :  std_logic_vector(5 downto 0);
signal zeroInput :  std_logic;
signal temporalExponent :  std_logic_vector(2 downto 0);
signal temporalFraction :  std_logic_vector(17 downto 0);
signal tempFractionResult :  std_logic_vector(18 downto 0);
signal correctingExponent :  std_logic;
signal convertedFraction :  std_logic_vector(16 downto 0);
signal MSB2Signal :  std_logic_vector(6 downto 0);
signal zeroPadding4Exponent :  std_logic_vector(3 downto 0);
signal valueExponent :  std_logic_vector(6 downto 0);
signal partialConvertedExponent :  std_logic_vector(6 downto 0);
signal biassOfOnes :  std_logic_vector(5 downto 0);
signal biassSignal :  std_logic_vector(6 downto 0);
signal biassSignalBit :  std_logic_vector(7 downto 0);
signal zeroBitExponent :  std_logic;
signal partialConvertedExponentBit :  std_logic_vector(7 downto 0);
signal sign4OU :  std_logic;
signal convertedExponentBit :  std_logic_vector(7 downto 0);
signal OUflowSignal1 :  std_logic_vector(1 downto 0);
signal underflowSignal :  std_logic;
signal overflowSignal1 :  std_logic;
signal zeroInput4Exponent :  std_logic_vector(7 downto 0);
signal possibleConvertedExponent2 :  std_logic_vector(6 downto 0);
signal possibleConvertedExponent20 :  std_logic_vector(7 downto 0);
signal sign4OU2 :  std_logic;
signal finalConvertedExponent :  std_logic_vector(7 downto 0);
signal convertedExponent :  std_logic_vector(6 downto 0);
signal overflowSignal2 :  std_logic;
signal overflowSignal :  std_logic;
signal MSBSelection :  std_logic;
signal LSBSelection :  std_logic;
signal Selection :  std_logic_vector(1 downto 0);
signal specialBits :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   input <= I;
   signSignal<= '0';
   passedInput<=input(4 downto 0);
   input2LZOC<=passedInput(3 downto 0);
   minusOne4ZD<=CONV_STD_LOGIC_VECTOR(-1,6);
   passedInputBit<= '0' & passedInput;
   zeroD: Fix2FP_0_4_US_7_17_F100_uid253zeroD  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => zeroDS,
                 X => passedInputBit,
                 Y => minusOne4ZD);
   ---------------- cycle 0----------------
   zeroInput<= zeroDS(5) and not (signSignal);
   ---------------- cycle 0----------------
   LZC_component: Fix2FP_0_4_US_7_17_F100_uid253_LZCS  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Count => temporalExponent,
                 I => passedInput,
                 O => temporalFraction);
   ---------------- cycle 0----------------
   tempFractionResult<= '0' & temporalFraction;
   correctingExponent<=tempFractionResult(18);
   convertedFraction<=tempFractionResult(16 downto 0);
   ---------------- cycle 0----------------
   MSB2Signal<= CONV_STD_LOGIC_VECTOR(4,7);
   zeroPadding4Exponent<= CONV_STD_LOGIC_VECTOR(0,4);
   valueExponent<= not(zeroPadding4Exponent & temporalExponent);
   exponentConversion: Fix2FP_0_4_US_7_17_F100_uid253exponentConversion  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => partialConvertedExponent,
                 X => MSB2Signal,
                 Y => valueExponent);
   biassOfOnes<=CONV_STD_LOGIC_VECTOR(127,6);
   biassSignal<='0' & biassOfOnes;
   biassSignalBit<='0' & biassSignal;
   zeroBitExponent<='0';
   partialConvertedExponentBit<= '0' & partialConvertedExponent;
   sign4OU<= partialConvertedExponent(6);
   exponentFinal: Fix2FP_0_4_US_7_17_F100_uid253exponentFinal  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '0',
                 R => convertedExponentBit,
                 X => partialConvertedExponentBit,
                 Y => biassSignalBit);
   OUflowSignal1<= convertedExponentBit(7 downto 6);
   underflowSignal<= '1' when (sign4OU='1' and OUflowSignal1="01" ) else '0';
   overflowSignal1<= '1' when (sign4OU='0' and OUflowSignal1="10" ) else '0';
   zeroInput4Exponent<=(others=>'0');
   possibleConvertedExponent2<= convertedExponentBit(6 downto 0);
   possibleConvertedExponent20<= '0' & possibleConvertedExponent2;
   sign4OU2<= possibleConvertedExponent2(6);
   expCorrect: Fix2FP_0_4_US_7_17_F100_uid253expCorrect  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => correctingExponent,
                 R => finalConvertedExponent,
                 X => possibleConvertedExponent20,
                 Y => zeroInput4Exponent);
   convertedExponent<= finalConvertedExponent(6 downto 0);
   overflowSignal2<= '1' when (sign4OU2='0' and finalConvertedExponent(7 downto 6) = "10" ) else '0' ;
   overflowSignal<= overflowSignal2 or overflowSignal1;
   MSBSelection<= overflowSignal;
   LSBSelection<= not(underflowSignal or zeroInput);
   Selection<= MSBSelection & LSBSelection when zeroInput='0' else "00";
   specialBits <= Selection;
   O<= specialBits & signSignal & convertedExponent & convertedFraction;
end architecture;

--------------------------------------------------------------------------------
--                                 IEEEtoGPUF
--                          (InputIEEE_8_23_to_7_17)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2008)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IEEEtoGPUF is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(31 downto 0);
          R : out  std_logic_vector(7+17+2 downto 0)   );
end entity;

architecture arch of IEEEtoGPUF is
signal expX :  std_logic_vector(7 downto 0);
signal fracX :  std_logic_vector(22 downto 0);
signal sX :  std_logic;
signal expZero :  std_logic;
signal expInfty :  std_logic;
signal fracZero :  std_logic;
signal unSub :  std_logic_vector(8 downto 0);
signal underflow :  std_logic;
signal ovSub :  std_logic_vector(8 downto 0);
signal overflow :  std_logic;
signal expXO :  std_logic_vector(6 downto 0);
signal resultLSB :  std_logic;
signal roundBit :  std_logic;
signal sticky :  std_logic;
signal round :  std_logic;
signal expfracR0 :  std_logic_vector(24 downto 0);
signal roundOverflow :  std_logic;
signal fracR :  std_logic_vector(16 downto 0);
signal expR :  std_logic_vector(6 downto 0);
signal NaN :  std_logic;
signal infinity :  std_logic;
signal zero :  std_logic;
signal exnR :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   expX  <= X(30 downto 23);
   fracX  <= X(22 downto 0);
   sX  <= X(31);
   expZero  <= '1' when expX = (7 downto 0 => '0') else '0';
   expInfty  <= '1' when expX = (7 downto 0 => '1') else '0';
   fracZero <= '1' when fracX = (22 downto 0 => '0') else '0';
   -- min exponent value without underflow, biased with input bias: 64
   unSub <= ('0' & expX) - CONV_STD_LOGIC_VECTOR(64,9);
   underflow <= unSub(8);
   -- max exponent value without overflow, biased with input bias: 191
   ovSub <= CONV_STD_LOGIC_VECTOR(191,9)  -  ('0' & expX);
   overflow <= ovSub(8);
   -- copy exponent. Result valid only in the absence of ov/underflow
   expXO <= (not expX(6)) & expX(5 downto 0);
   -- wFO < wFI, need to round fraction
   resultLSB <= fracX(6);
   roundBit <= fracX(5);
   sticky <=  '0' when fracX(4 downto 0) = CONV_STD_LOGIC_VECTOR(0,4)   else '1';
   round <= roundBit and (sticky or resultLSB);
   -- The following addition may overflow
   expfracR0 <= ('0' & expXO & fracX(22 downto 6))  +  (CONV_STD_LOGIC_VECTOR(0,24) & round);
   roundOverflow <= expfracR0(24);
   fracR <= expfracR0(16 downto 0);
   expR <= expfracR0(23 downto 17);
   NaN <= expInfty and not fracZero;
   infinity <= (expInfty and fracZero) or (not NaN and (overflow or roundOverflow));
   zero <= expZero or underflow;
   exnR <= 
           "11" when NaN='1' 
      else "10" when infinity='1' 
      else "00" when zero='1' 
      else "01" ;  -- normal number
   R <= exnR & sX & expR & fracR; 
end architecture;

