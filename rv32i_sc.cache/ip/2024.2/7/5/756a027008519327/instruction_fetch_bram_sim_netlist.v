// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Sat Jun  7 19:28:13 2025
// Host        : sigma running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ instruction_fetch_bram_sim_netlist.v
// Design      : instruction_fetch_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instruction_fetch_bram,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    clkb,
    rstb,
    enb,
    addrb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire enb;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.7864 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "instruction_fetch_bram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[11:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[11:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 34944)
`pragma protect data_block
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
Ab5O
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
