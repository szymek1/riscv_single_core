// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Sat Jun  7 19:28:13 2025
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 35024)
`pragma protect data_block
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
/o0vQpJAdsW95pw/FT/NtZvpwW16GMjru2c=
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
