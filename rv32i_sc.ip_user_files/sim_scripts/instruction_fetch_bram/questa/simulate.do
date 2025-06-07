onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib instruction_fetch_bram_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {instruction_fetch_bram.udo}

run 1000ns

quit -force
