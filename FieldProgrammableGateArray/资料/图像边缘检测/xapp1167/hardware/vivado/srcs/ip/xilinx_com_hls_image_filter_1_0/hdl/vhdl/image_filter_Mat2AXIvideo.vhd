-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2014.4
-- Copyright (C) 2014 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity image_filter_Mat2AXIvideo is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    img_rows_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    img_cols_V_read : IN STD_LOGIC_VECTOR (11 downto 0);
    img_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    img_data_stream_0_V_empty_n : IN STD_LOGIC;
    img_data_stream_0_V_read : OUT STD_LOGIC;
    img_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    img_data_stream_1_V_empty_n : IN STD_LOGIC;
    img_data_stream_1_V_read : OUT STD_LOGIC;
    video_out_TDATA : OUT STD_LOGIC_VECTOR (15 downto 0);
    video_out_TVALID : OUT STD_LOGIC;
    video_out_TREADY : IN STD_LOGIC;
    video_out_TKEEP : OUT STD_LOGIC_VECTOR (1 downto 0);
    video_out_TSTRB : OUT STD_LOGIC_VECTOR (1 downto 0);
    video_out_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    video_out_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    video_out_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    video_out_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of image_filter_Mat2AXIvideo is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_pp0_stg0_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_st5_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv13_1FFF : STD_LOGIC_VECTOR (12 downto 0) := "1111111111111";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_23 : BOOLEAN;
    signal p_3_reg_158 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_bdd_56 : BOOLEAN;
    signal op2_assign_fu_174_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal op2_assign_reg_251 : STD_LOGIC_VECTOR (12 downto 0);
    signal exitcond3_fu_185_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_70 : BOOLEAN;
    signal i_V_fu_190_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal i_V_reg_260 : STD_LOGIC_VECTOR (11 downto 0);
    signal exitcond4_fu_196_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal exitcond4_reg_265 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sig_cseq_ST_pp0_stg0_fsm_2 : STD_LOGIC;
    signal ap_sig_bdd_81 : BOOLEAN;
    signal ap_reg_ppiten_pp0_it0 : STD_LOGIC := '0';
    signal ap_sig_bdd_92 : BOOLEAN;
    signal ap_sig_ioackin_video_out_TREADY : STD_LOGIC;
    signal ap_reg_ppiten_pp0_it1 : STD_LOGIC := '0';
    signal j_V_fu_201_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal axi_last_V_fu_211_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_V_reg_274 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_s_reg_147 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sig_cseq_ST_st5_fsm_3 : STD_LOGIC;
    signal ap_sig_bdd_123 : BOOLEAN;
    signal tmp_user_V_fu_90 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ioackin_video_out_TREADY : STD_LOGIC := '0';
    signal tmp_cast_fu_170_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal tmp_cast_25_fu_207_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);


begin




    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_done_reg assign process. --
    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond3_fu_185_p2 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ioackin_video_out_TREADY assign process. --
    ap_reg_ioackin_video_out_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_video_out_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1)))))) then 
                    ap_reg_ioackin_video_out_TREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_92 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (ap_const_logic_1 = video_out_TREADY)))) then 
                    ap_reg_ioackin_video_out_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it0 assign process. --
    ap_reg_ppiten_pp0_it0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond4_fu_196_p2 = ap_const_lv1_0)))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond3_fu_185_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- ap_reg_ppiten_pp0_it1 assign process. --
    ap_reg_ppiten_pp0_it1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (exitcond4_fu_196_p2 = ap_const_lv1_0))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_1;
                elsif ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond3_fu_185_p2 = ap_const_lv1_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond4_fu_196_p2 = ap_const_lv1_0))))) then 
                    ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    -- p_3_reg_158 assign process. --
    p_3_reg_158_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (exitcond4_fu_196_p2 = ap_const_lv1_0))) then 
                p_3_reg_158 <= j_V_fu_201_p2;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond3_fu_185_p2 = ap_const_lv1_0))) then 
                p_3_reg_158 <= ap_const_lv12_0;
            end if; 
        end if;
    end process;

    -- p_s_reg_147 assign process. --
    p_s_reg_147_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_3)) then 
                p_s_reg_147 <= i_V_reg_260;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_56))) then 
                p_s_reg_147 <= ap_const_lv12_0;
            end if; 
        end if;
    end process;

    -- tmp_user_V_fu_90 assign process. --
    tmp_user_V_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
                tmp_user_V_fu_90 <= ap_const_lv1_0;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_56))) then 
                tmp_user_V_fu_90 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (exitcond4_fu_196_p2 = ap_const_lv1_0))) then
                axi_last_V_reg_274 <= axi_last_V_fu_211_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then
                exitcond4_reg_265 <= exitcond4_fu_196_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                i_V_reg_260 <= i_V_fu_190_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not(ap_sig_bdd_56))) then
                op2_assign_reg_251 <= op2_assign_fu_174_p2;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_sig_bdd_56, exitcond3_fu_185_p2, exitcond4_fu_196_p2, exitcond4_reg_265, ap_reg_ppiten_pp0_it0, ap_sig_bdd_92, ap_sig_ioackin_video_out_TREADY, ap_reg_ppiten_pp0_it1)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not(ap_sig_bdd_56)) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((exitcond3_fu_185_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_pp0_stg0_fsm_2 => 
                if (not(((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond4_fu_196_p2 = ap_const_lv1_0))))) then
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                elsif (((ap_const_logic_1 = ap_reg_ppiten_pp0_it0) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and not((exitcond4_fu_196_p2 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_3;
                else
                    ap_NS_fsm <= ap_ST_pp0_stg0_fsm_2;
                end if;
            when ap_ST_st5_fsm_3 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_done_reg, exitcond3_fu_185_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_done_reg) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond3_fu_185_p2 = ap_const_lv1_0))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(exitcond3_fu_185_p2, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond3_fu_185_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_bdd_123 assign process. --
    ap_sig_bdd_123_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_123 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    -- ap_sig_bdd_23 assign process. --
    ap_sig_bdd_23_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_23 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_56 assign process. --
    ap_sig_bdd_56_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_sig_bdd_56 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    -- ap_sig_bdd_70 assign process. --
    ap_sig_bdd_70_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_70 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_bdd_81 assign process. --
    ap_sig_bdd_81_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_81 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    -- ap_sig_bdd_92 assign process. --
    ap_sig_bdd_92_assign_proc : process(img_data_stream_0_V_empty_n, img_data_stream_1_V_empty_n, exitcond4_reg_265)
    begin
                ap_sig_bdd_92 <= (((img_data_stream_0_V_empty_n = ap_const_logic_0) and (exitcond4_reg_265 = ap_const_lv1_0)) or ((exitcond4_reg_265 = ap_const_lv1_0) and (img_data_stream_1_V_empty_n = ap_const_logic_0)));
    end process;


    -- ap_sig_cseq_ST_pp0_stg0_fsm_2 assign process. --
    ap_sig_cseq_ST_pp0_stg0_fsm_2_assign_proc : process(ap_sig_bdd_81)
    begin
        if (ap_sig_bdd_81) then 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_pp0_stg0_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_23)
    begin
        if (ap_sig_bdd_23) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm_1 assign process. --
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_70)
    begin
        if (ap_sig_bdd_70) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st5_fsm_3 assign process. --
    ap_sig_cseq_ST_st5_fsm_3_assign_proc : process(ap_sig_bdd_123)
    begin
        if (ap_sig_bdd_123) then 
            ap_sig_cseq_ST_st5_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st5_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_ioackin_video_out_TREADY assign process. --
    ap_sig_ioackin_video_out_TREADY_assign_proc : process(video_out_TREADY, ap_reg_ioackin_video_out_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_video_out_TREADY)) then 
            ap_sig_ioackin_video_out_TREADY <= video_out_TREADY;
        else 
            ap_sig_ioackin_video_out_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    axi_last_V_fu_211_p2 <= "1" when (tmp_cast_25_fu_207_p1 = op2_assign_reg_251) else "0";
    exitcond3_fu_185_p2 <= "1" when (p_s_reg_147 = img_rows_V_read) else "0";
    exitcond4_fu_196_p2 <= "1" when (p_3_reg_158 = img_cols_V_read) else "0";
    i_V_fu_190_p2 <= std_logic_vector(unsigned(p_s_reg_147) + unsigned(ap_const_lv12_1));

    -- img_data_stream_0_V_read assign process. --
    img_data_stream_0_V_read_assign_proc : process(exitcond4_reg_265, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_92, ap_sig_ioackin_video_out_TREADY, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_data_stream_0_V_read <= ap_const_logic_1;
        else 
            img_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    -- img_data_stream_1_V_read assign process. --
    img_data_stream_1_V_read_assign_proc : process(exitcond4_reg_265, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_92, ap_sig_ioackin_video_out_TREADY, ap_reg_ppiten_pp0_it1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not(((ap_sig_bdd_92 or ((exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_0 = ap_sig_ioackin_video_out_TREADY))) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))))) then 
            img_data_stream_1_V_read <= ap_const_logic_1;
        else 
            img_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;

    j_V_fu_201_p2 <= std_logic_vector(unsigned(p_3_reg_158) + unsigned(ap_const_lv12_1));
    op2_assign_fu_174_p2 <= std_logic_vector(unsigned(tmp_cast_fu_170_p1) + unsigned(ap_const_lv13_1FFF));
    tmp_cast_25_fu_207_p1 <= std_logic_vector(resize(unsigned(p_3_reg_158),13));
    tmp_cast_fu_170_p1 <= std_logic_vector(resize(unsigned(img_cols_V_read),13));
    video_out_TDATA <= (img_data_stream_1_V_dout & img_data_stream_0_V_dout);
    video_out_TDEST <= ap_const_lv1_0;
    video_out_TID <= ap_const_lv1_0;
    video_out_TKEEP <= ap_const_lv2_3;
    video_out_TLAST <= axi_last_V_reg_274;
    video_out_TSTRB <= ap_const_lv2_0;
    video_out_TUSER <= tmp_user_V_fu_90;

    -- video_out_TVALID assign process. --
    video_out_TVALID_assign_proc : process(exitcond4_reg_265, ap_sig_cseq_ST_pp0_stg0_fsm_2, ap_sig_bdd_92, ap_reg_ppiten_pp0_it1, ap_reg_ioackin_video_out_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_pp0_stg0_fsm_2) and (exitcond4_reg_265 = ap_const_lv1_0) and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1) and not((ap_sig_bdd_92 and (ap_const_logic_1 = ap_reg_ppiten_pp0_it1))) and (ap_const_logic_0 = ap_reg_ioackin_video_out_TREADY)))) then 
            video_out_TVALID <= ap_const_logic_1;
        else 
            video_out_TVALID <= ap_const_logic_0;
        end if; 
    end process;

end behav;
