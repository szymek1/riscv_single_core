// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu May 29 21:57:50 2025
// Host        : sigma running 64-bit Debian GNU/Linux 12 (bookworm)
// Command     : write_verilog -force -mode funcsim
//               /home/szymon/Documents/ISAE/research_project/implemnetations/riscv_single_core/rv32i_sc.gen/sources_1/ip/instruction_fetch_bram/instruction_fetch_bram_sim_netlist.v
// Design      : instruction_fetch_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instruction_fetch_bram,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module instruction_fetch_bram
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.96515 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  instruction_fetch_bram_blk_mem_gen_v8_4_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 35088)
`pragma protect data_block
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
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
