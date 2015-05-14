----------------------------------------------------------------------------------------
-- Project       : TASE500
-- File          : tase500_fpga_pkg.vhd
-- Description   : Package file for tase500 FPGAs
-- Author        : gjones
----------------------------------------------------------------------------------------
library ieee;
use     ieee.std_logic_1164.all;

package tase500_fpga_pkg is


----------------------------------------------------------------------------------------
-- Blocks on cpubus outside of embedded system. The bus is an output from the axi_if_cpubus.
-- Constants are the bit positions of the 'cpu_sels()' bus that select the block.
----------------------------------------------------------------------------------------

-- Define the number of blocks outside of embedded system that are addressed by the cpubus
constant C_NUM_CPU_BLOCKS   : integer   := 3; 
type t_arr_cpu_rdata is array (0 to C_NUM_CPU_BLOCKS-1) of std_logic_vector(31 downto 0);

constant SEL_FSGEN          : integer   :=  0;  -- Frame sync generator
constant SEL_LMOTOR         : integer   :=  1;  -- Lens motor controller
constant SEL_CPUREGS        : integer   :=  2;  -- Other miscellaneous interfaces. Version registers, Config EEPROM, Lasers.

-- Address spaces used by sub-blocks
constant C_ADR_FSGEN        : std_logic_vector( 3 downto 0) := "0000"; -- std_logic_vector(to_unsigned(0, 4));   
constant C_ADR_LMOTOR       : std_logic_vector( 3 downto 0) := "0001"; -- std_logic_vector(to_unsigned(1, 4));   
constant C_ADR_CPUREGS      : std_logic_vector( 3 downto 0) := "0010"; -- std_logic_vector(to_unsigned(2, 4));  


----------------------------------------------------------------------------------------
-- Identifiers for the cameralink input deserializers
----------------------------------------------------------------------------------------
constant C_CLD0             : integer := 0; -- Sony 7500 (and Sony XCL if using shared CLAM board interface)
constant C_CLD1             : integer := 1; -- MWIR 
constant C_CLD2             : integer := 2; -- SWIR 
constant C_CLD_MX0          : integer := 3; -- MX6 display port 0 
constant C_CLD_MX1          : integer := 4; -- (Unused) diplay port 1 

constant BIT_CAM0_PWR_OFF   : integer :=  0;    -- Power control for camera regulator - '1' turns OFF power
constant BIT_CAM1_PWR_OFF   : integer :=  1;    -- Power control for camera regulator - '1' turns OFF power
constant BIT_CAM2_PWR_OFF   : integer :=  2;    -- Power control for camera regulator - '1' turns OFF power
constant BIT_CAM3_PWR_OFF   : integer :=  3;    -- Power control for camera regulator - '1' turns OFF power
constant BIT_CAM1_PWR_SW    : integer :=  4;    -- Separate switch to control MWIR sensor power - '1' turns ON power
constant BIT_EN_CAM0        : integer :=  5;    -- Enables serdes
constant BIT_EN_CAM1        : integer :=  6;    -- Enables serdes
constant BIT_EN_CAM2        : integer :=  7;    -- Enables serdes
constant BIT_EN_CAM3        : integer :=  8;    -- Enables serdes
constant BIT_EN_MX6_IN      : integer :=  9;    -- Enables serdes
constant BIT_EN_IMX6CS0     : integer := 10;    -- Enables camera interface
constant BIT_EN_IMX6CS1     : integer := 11;    -- Enables camera interface
constant BIT_SONY_SELECT    : integer := 12;    -- Selected between sony 6500 and sony 7x00 family
constant BIT_SDVID_EN       : integer := 13;    -- Enables sd video output
constant BIT_SD_MODE_DECIM  : integer := 14;    -- 2 bits: 00 normal, 01 invert, 10 odd 11 even
constant BIT_SD_PHASE_ADJ   : integer := 16;    -- 2 bits: Set phase delay 0-3
constant BIT_SD_SEL_SOURCE  : integer := 18;    -- Select between '1' video from embd_sys or '0' test pattern generator
constant BIT_SD_TPATTERN    : integer := 19;    -- 2 bits: Select test pattern 00 color bars100, 01 color_bars75, 10 black bars, 11 inv color bars
constant BIT_VID_ENC_RESET  : integer := 21;    -- Reset for video encoder
constant BIT_MB_SPI_RST_N   : integer := 22;    -- Microblaze spi reset active low
constant BIT_MB_SPI_W_N     : integer := 23;    -- Microblaze spi write active low
constant BIT_MB_SPI_HOLD_N  : integer := 24;    -- Microblaze spi hold active low
constant BIT_LED_A          : integer := 25;    -- Sw controlled LEDa
constant BIT_LED_B          : integer := 26;    -- Sw controlled LEDb
constant BIT_LENS0Z_RST_N   : integer := 27;    -- Motor controller reset active low
constant BIT_LENS0F_RST_N   : integer := 28;    -- Motor controller reset active low
constant BIT_LENS1Z_RST_N   : integer := 29;    -- Motor controller reset active low
constant BIT_LENS1F_RST_N   : integer := 30;    -- Motor controller reset active low

end package tase500_fpga_pkg;

