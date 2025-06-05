// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Jun  5 11:02:33 2025
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
