library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
    port(
        signal clk, reset : in std_logic;
        signal PCSrc : in std_logic;
        signal ALUSrc : in std_logic;
        signal ALUControl : in std_logic_vector(2 downto 0);
        signal RegWrite : in std_logic;
        signal ImmSrc : in std_logic_vector(1 downto 0);
        signal PC_buf : buffer std_logic_vector(31 downto 0);
        signal ALUResult, WriteData, ImmExt : buffer std_logic_vector(31 downto 0);
        signal MemWrite : in std_logic;
        signal ResultSrc : in std_logic;
        signal Zero : out std_logic
    );
end datapath;

architecture rtl of datapath is
    --Components
    -- component adder is
    --     generic(numberbits_b : integer := 32);
    --     port(
    --         a_in : in std_logic_vector(31 downto 0);
    --         b_in : in std_logic_vector(numberbits_b - 1 downto 0);
    --         c_out: out std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component ALU
    --     port(
    --         SrcA : in std_logic_vector(31 downto 0);
    --         SrcB : in std_logic_vector(31 downto 0);
    --         ALUControl : in std_logic_vector(2 downto 0);
    --         Zero : out std_logic;
    --         ALUResult : buffer std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component data_memr is
    --     port(
    --         addr_port : in std_logic_vector(31 downto 0);
    --         write_data : in std_logic_vector(31 downto 0);
    --         clk : in std_logic;
    --         write_en : in std_logic;
    --         read_data : out std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component extend is
    --     port(
    --         ImmSrc      : in std_logic_vector(1 downto 0);
    --         instruction : in std_logic_vector(31 downto 7);
    --         ImmExt      : buffer std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component instr_mem is
    --     port(
    --         addr_instr : in std_logic_vector(31 downto 0);
    --         rd_instr : out std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component mux_2 is
    --     generic(number : integer := 8);
    --     port(
    --         port_in1 :  in std_logic_vector(number-1 downto 0); 
    --         port_in2 :  in std_logic_vector(number-1 downto 0);
    --         sel      :  in std_logic;
    --         port_out :  out std_logic_vector(number-1 downto 0)
    --     );
    -- end component;

    -- component pc is
    --     port(
    --         PCNext : in std_logic_vector(31 downto 0);
    --         clk    : in std_logic;
    --         reset  : in std_logic;
    --         PC_cur : buffer std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- component reg_file is
    --     port(
    --         read_port_addr1 : in std_logic_vector(4 downto 0);
    --         read_port_addr2 : in std_logic_vector(4 downto 0);
    --         write_port_addr : in std_logic_vector(4 downto 0);
    --         write_data : in std_logic_vector(31 downto 0);
    --         write_en : in std_logic;
    --         clk : in std_logic;
    --         read_data1 : out std_logic_vector(31 downto 0);
    --         read_data2 : buffer std_logic_vector(31 downto 0)
    --     );
    -- end component;

    -- Signals
    signal RD1 : std_logic_vector(31 downto 0):= (others => '0');
    signal PCPlus4 : std_logic_vector(31 downto 0):= (others => '0');
    signal PCTarget : std_logic_vector(31 downto 0):= (others => '0');
    signal PCNext : std_logic_vector(31 downto 0):= (others => '0');
    signal Instr : std_logic_vector(31 downto 0):= (others => '0');
    signal Result : std_logic_vector(31 downto 0):= (others => '0');
    signal SrcB : std_logic_vector(31 downto 0):= (others => '0');
    signal ReadData : std_logic_vector(31 downto 0):= (others => '0');

    begin

        inst_PCSrc : entity work.mux_2(rtl)
                    generic map(32)
                    port map(port_in1 => PCPlus4, port_in2 => PCTarget, sel => PCSrc, port_out => PCNext);

        inst_register : entity work.pc(rtl) 
                    port map (PCNext => PCNext, clk => clk, reset => reset, PC_cur => PC_buf);
            
        inst_instruction_memory : entity work.instr_mem(rtl)
                    port map(addr_instr => PC_buf, rd_instr => Instr);
                    
        inst_PCPlus4 : entity work.adder(rtl)
                        generic map(32)
                        port map(a_in => PC_buf, b_in => x"00000004", c_out => PCPlus4);
                
        inst_register_file : entity work.reg_file(rtl)
                        port map(read_port_addr1 => Instr(19 downto 15), read_port_addr2 => Instr(24 downto 20), write_port_addr => Instr(11 downto 7),
                                write_data => Result, write_en => RegWrite, clk => clk, read_data1 => RD1, read_data2 => WriteData);
                            
        inst_extend : entity work.extend(rtl)
                        port map(ImmSrc => ImmSrc, Instruction => Instr(31 downto 7), ImmExt => ImmExt);
            
        inst_PCTarget :  entity work.adder(rtl)
                        generic map(32)
                        port map(a_in => PC_buf, b_in => ImmExt, c_out => PCTarget);

        inst_ALUSrc : entity work.mux_2(rtl)
                    generic map(32)
                    port map(port_in1 => WriteData, port_in2 => ImmExt, sel => ALUSrc, port_out => SrcB);

        inst_ALU : entity work.ALU(rtl)
                    port map(SrcA => RD1, SrcB => SrcB, ALUControl => ALUControl, Zero => Zero, ALUResult => ALUResult);

        inst_data_memory : entity work.data_memr(rtl)
                    port map(addr_port => ALUResult, write_data => WriteData, clk => clk, write_en => MemWrite, read_data => ReadData);
                
        inst_ResultSrc : entity work.mux_2(rtl)
                    generic map(32)
                    port map(port_in1 => ALUResult, port_in2 => ReadData, sel => ResultSrc, port_out => Result);
                
        

    end rtl;