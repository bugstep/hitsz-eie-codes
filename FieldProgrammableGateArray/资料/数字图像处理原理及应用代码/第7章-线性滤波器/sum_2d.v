//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// ?? 3? 16 2016 10:59:46
//
//      Input file      : 
//      Component name  : sum_2d
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module sum_2d(

			rst_n,
			clk, 
			din_valid,
			din,
			dout,
			vsync,
			vsync_out,
			is_boarder,
			dout_valid
		);
   
   parameter         DW  = 8;
   parameter         KSZ = 5;
   parameter         IH  = 512;
   parameter         IW  = 640;
   
   input             rst_n;
   input             clk;
   input             din_valid;
   input  [DW-1:0]   din;
   output [2*DW-1:0] dout;
   input             vsync;
   output            vsync_out;
   reg               vsync_out;
   output            is_boarder;
   output            dout_valid;
   
   parameter         radius   = ((KSZ >> 1));
   parameter         num_all  = KSZ * KSZ;
   parameter         fifo_num = KSZ - 1;
   parameter         med_idx  = ((num_all >> 1));
   
   reg               rst_all;
   reg  [DW-1:0]     line_dinl[0:KSZ-2];
   wire [DW-1:0]     line_doutl[0:KSZ-2];
   reg  [DW-1:0]     line_dinh[0:KSZ-2];
   wire [DW-1:0]     line_douth[0:KSZ-2];
   wire [KSZ-2:0]    line_emptyl;
   wire [KSZ-2:0]    line_fulll;
   wire [KSZ-2:0]    line_rdenl;
   wire [KSZ-2:0]    line_wrenl;
   wire [KSZ-2:0]    line_emptyh;
   wire [KSZ-2:0]    line_fullh;
   wire [KSZ-2:0]    line_rdenh;
   wire [KSZ-2:0]    line_wrenh;
   wire [9:0]        line_countl[0:KSZ-2];
   wire [9:0]        line_counth[0:KSZ-2];
   wire [9:0]        line_count[0:KSZ-2];
   
   wire              din_valid_r;
   wire [2*DW-1:0]   sum;
   wire [2*DW-1:0]   sum_col;
   
   reg  [KSZ-2:0]    buf_pop_en;
   reg               valid_r;
   
   reg  [10:0]       in_line_cnt;
   reg  [15:0]       flush_cnt;
   reg               flush_line;
   reg  [15:0]       out_pixel_cnt;
   reg  [10:0]       out_line_cnt;
   reg  [2*DW-1:0]   dout_temp_r;
   reg               dout_valid_temp_r;
   wire [2*DW-1:0]   dout_temp;
   wire              dout_valid_temp;
   
   wire [2*DW-1:0]   sum_row1;
   wire [2*DW-1:0]   sum_row2;
   reg  [2*DW-1:0]   sum_1_2;
   reg  [2*DW-1:0]   sum_col_r;
   reg  [2*DW-1:0]   sum_all;
   wire              is_boarder_tmp;
   reg               is_boarder_r;
   wire              valid;
   wire              row_valid;
   
   wire [31:0]       j;
   wire [31:0]       k;
   
   reg  [10:0]       line_valid_r;
   wire [2*DW-1:0]   sum_row3;
   wire [2*DW-1:0]   sum_row4;
   reg  [2*DW-1:0]   sum_3_4;
   reg  [2*DW-1:0]   sum_0_1_2;
   reg  [2*DW-1:0]   sum_3_4_r;
   wire [2*DW-1:0]   sum_row5;
   wire [2*DW-1:0]   sum_row6;
   
   reg  [2*DW-1:0]   sum_5_6;
   reg  [2*DW-1:0]   sum_3_4_5_6;
   
   wire [2*DW-1:0]   sum_row7;
   wire [2*DW-1:0]   sum_row8;
   wire [2*DW-1:0]   sum_row9;
   wire [2*DW-1:0]   sum_row10;
   wire [2*DW-1:0]   sum_row11;
   wire [2*DW-1:0]   sum_row12;
   wire [2*DW-1:0]   sum_row13;
   wire [2*DW-1:0]   sum_row14;
   
   reg  [2*DW-1:0]   sum_7_8;
   reg  [2*DW-1:0]   sum_9_10;
   reg  [2*DW-1:0]   sum_11_12;
   reg  [2*DW-1:0]   sum_13_14;
   reg  [2*DW-1:0]   sum_7_8_9_10;
   reg  [2*DW-1:0]   sum_11_12_13_14;
   reg  [2*DW-1:0]   sum_0_to_6;
   reg  [2*DW-1:0]   sum_7_to_14;
   reg               row_valid_r;
   wire              vsync_out_tmp;
   
	 reg [DW-1:0]      xhdl4[0:KSZ-2];
   reg [DW-1:0]      xhdl5[0:KSZ-2];
   wire[DW*2-1:0]    xhdl13;
   
    assign valid = din_valid | flush_line;
   
    always @(posedge clk or negedge rst_n)
		begin
			if (rst_n == 1'b0)
				rst_all <= #1 1'b1;
			else 
			begin
				if (vsync == 1'b1)
					rst_all <= #1 1'b1;
				else
					rst_all <= #1 1'b0;
			end
		end 
   
   
    always @(posedge clk)
	  begin
	  	if (rst_all == 1'b1)
				row_valid_r <= #1 1'b1;
		  else
				row_valid_r <= #1 row_valid;
	  end
 
   
    sum_1d #(DW, KSZ)
		  row_sum(
			  .clk(clk),
			  .din(din),
			  .din_valid(valid),
			  .dout(sum_col),
			  .dout_valid(row_valid)
		  );
   
    generate
	  begin : line_buffer_inst
	 
			genvar            i;
	
			for (i = 0; i <= KSZ - 2; i = i + 1)
			begin : line_buf
				if (i == 0)
				begin : row_1st
					always @(*) line_dinl[i] <= sum_col[DW - 1:0];
					always @(*) line_dinh[i] <= sum_col[2 * DW - 1:DW];
					assign line_wrenl[i] = row_valid;
					assign line_wrenh[i] = row_valid;
				end
				
				if ((~(i == 0)))
				begin : row_others
					always @(*) line_dinl[i] <= line_doutl[i - 1];
					always @(*) line_dinh[i] <= line_douth[i - 1];
					assign line_wrenh[i] = line_rdenh[i - 1];
					assign line_wrenl[i] = line_rdenl[i - 1];
				end
				
				assign line_rdenl[i] = buf_pop_en[i] & row_valid;
				assign line_rdenh[i] = buf_pop_en[i] & row_valid;
				
				always @(posedge clk)
				begin
					if (rst_all == 1'b1)
					  buf_pop_en[i] <= #1 1'b0;
					else if (line_countl[i] == IW)
						buf_pop_en[i] <= #1 1'b1;
				end
				
				always @(*) xhdl4[i] <= line_dinl[i];
				
				line_buffer #(DW, IW)
					line_buf_l(
						.rst(rst_all),
						.clk(clk),
						.din(xhdl4[i]),
						.dout(line_doutl[i]),
						.wr_en(line_wrenl[i]),
						.rd_en(line_rdenl[i]),
						.empty(line_emptyl[i]),
						.full(line_fulll[i]),
						.count(line_countl[i])
					);
				
				always @(*) xhdl5[i] <= line_dinh[i];
				
				line_buffer #(DW, IW) 
					line_buf_h(
						.rst(rst_all),
						.clk(clk), 
						.din(xhdl5[i]),
						.dout(line_douth[i]),
						.wr_en(line_wrenh[i]),
						.rd_en(line_rdenh[i]),
						.empty(line_emptyh[i]),
						.full(line_fullh[i]),
						.count(line_counth[i])
					);
					
				end
			end
		endgenerate

    endgenerate
   
    generate
      if (KSZ == 3)
      begin : sum_ksz_3   
			
				assign sum_row1 = ({line_douth[0][DW - 1:0], line_doutl[0][DW - 1:0]});
				assign sum_row2 = (((buf_pop_en[1]) == 1'b1)) ? 
													({line_douth[1][DW - 1:0], line_doutl[1][DW - 1:0]}) : 
													 {2*DW-1+1{1'b0}};
				assign dout_valid_temp = line_valid_r[1 + 1];

				always @(posedge clk)	
				begin
					line_valid_r[2:0] <= ({line_valid_r[1:0], line_rdenl[0]});
					if ((line_rdenl[0]) == 1'b1)
						sum_col_r <= #1 sum_col;
					if ((line_rdenl[0]) == 1'b1)
						sum_1_2 <= #1 sum_row2 + sum_row1;
			  	if ((line_valid_r[0]) == 1'b1)
						sum_all <= #1 sum_1_2 + sum_col_r;
				end				
      end	
    endgenerate
   
	
  
   
endmodule




