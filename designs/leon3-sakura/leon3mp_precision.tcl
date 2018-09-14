new_project -name leon3mp -folder . -createimpl_name precision
setup_design -manufacturer  -family  -part  -package  -speed -2
set_input_dir .
add_input_file -format VHDL -work grlib ../../lib/grlib/stdlib/version.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/stdlib/config_types.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/stdlib/config.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/stdlib/stdlib.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/sparc/sparc.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/modgen/multlib.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/modgen/leaves.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/amba.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/devices.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/defmst.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/apbctrl.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/ahbctrl.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/dma2ahb_pkg.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/dma2ahb.vhd
add_input_file -format VHDL -work grlib ../../lib/grlib/amba/ahbmst.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/gencomp/gencomp.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/gencomp/netcomp.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/inferred/memory_inferred.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/inferred/ddr_inferred.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/inferred/mul_inferred.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/inferred/ddr_phy_inferred.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/inferred/ddrphy_datapath.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/memory_virtex.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/memory_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/buffer_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/pads_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/clkgen_virtex.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/clkgen_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/tap_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/ddr_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/ddr_phy_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/sysmon_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/mul_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/unisim/spictrl_unisim.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/allclkgen.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/allddr.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/allmem.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/allmul.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/allpads.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/alltap.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkgen.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkmux.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkinv.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkand.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/ddr_ireg.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/ddr_oreg.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/ddrphy.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram64.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram_2p.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram_dp.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncfifo_2p.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/regfile_3p.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/tap.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/techbuf.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/nandtree.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkpad_ds.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/inpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/inpad_ds.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/iodpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/iopad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/iopad_ds.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/lvds_combo.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/odpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/outpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/outpad_ds.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/toutpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/skew_outpad.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/grlfpw_net.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/grfpw_net.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/leon4_net.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/mul_61x61.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/cpu_disas_net.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/ringosc.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/system_monitor.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/grgates.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/inpad_ddr.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/outpad_ddr.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/iopad_ddr.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram128bw.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram256bw.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram128.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram156bw.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/techmult.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/spictrl_net.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/scanreg.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncrambw.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncram_2pbw.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/sdram_phy.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/syncreg.vhd
add_input_file -format VHDL -work techmap ../../lib/techmap/maps/clkinv.vhd
add_input_file -format VHDL -work eth ../../lib/eth/comp/ethcomp.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/greth_pkg.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/eth_rstgen.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/eth_edcl_ahb_mst.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/eth_ahb_mst.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/greth_tx.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/greth_rx.vhd
add_input_file -format VHDL -work eth ../../lib/eth/core/grethc.vhd
add_input_file -format VHDL -work eth ../../lib/eth/wrapper/greth_gen.vhd
add_input_file -format VHDL -work eth ../../lib/eth/wrapper/greth_gbit_gen.vhd
add_input_file -format VHDL -work opencores ../../lib/opencores/i2c/i2c_master_bit_ctrl.vhd
add_input_file -format VHDL -work opencores ../../lib/opencores/i2c/i2c_master_byte_ctrl.vhd
add_input_file -format VHDL -work opencores ../../lib/opencores/i2c/i2coc.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/arith/arith.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/arith/mul32.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/arith/div32.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/memctrl/memctrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/memctrl/sdctrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/memctrl/sdctrl64.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/memctrl/sdmctrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/memctrl/srctrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmuconfig.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmuiface.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/libmmu.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmutlbcam.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmulrue.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmulru.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmutlb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmutw.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/srmmu/mmu.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3/leon3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3/grfpushwx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/tbufmem.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/dsu3x.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/dsu3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/dsu3_mb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/libfpu.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/libiu.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/libcache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/libleon3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/regfile_3p_l3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/mmu_acache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/mmu_icache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/mmu_dcache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/cachemem.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/mmu_cache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/grfpwx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/grlfpwx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/ff.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/canary.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/canary2.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/count_bil.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/iu3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/proc3.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/leon3cg.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/leon3s.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/leon3sh.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/leon3x.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/leon3v3/grfpwxsh.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/irqmp/irqmp.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/l2cache/v2-pkg/l2cache.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/misc.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/rstgen.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/gptimer.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbram.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbdpram.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbtrace_mmb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbtrace_mb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbtrace.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/grgpio.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahbstat.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/logan.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/apbps2.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/charrom_package.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/charrom.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/apbvga.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/svgactrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/grsysmon.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/gracectrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/grgpreg.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/ahb_mst_iface.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/misc/grgprbank.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/net/net.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/uart.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/libdcom.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/apbuart.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/dcom.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/dcom_uart.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/uart/ahbuart.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/jtag.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/libjtagcom.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/jtagcom.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/ahbjtag.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/ahbjtag_bsd.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/bscanregs.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/bscanregsbd.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/jtag/jtagcom2.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/ethernet_mac.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/greth.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/greth_mb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/greth_gbit.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/greth_gbit_mb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/grethm.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/greth/rgmii.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddrpkg.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddrintpkg.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddrphy_wrap.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddrspa.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr2spa.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr2buf.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr2spax.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr2spax_ahb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr2spax_ddr.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr1spax.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ddr1spax_ddr.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ahb2mig_series7_pkg.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ahb2mig_series7.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ahb2avl_async.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/ddr/ahb2avl_async_be.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2cmst.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2cmst_gen.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2cslv.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c2ahbx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c2ahb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c2ahb_apb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c2ahb_gen.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/i2c/i2c2ahb_apb_gen.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spi.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spimctrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spictrlx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spictrl.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spi2ahbx.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spi2ahb.vhd
add_input_file -format VHDL -work gaisler ../../lib/gaisler/spi/spi2ahb_apb.vhd
add_input_file -format VHDL -work esa ../../lib/esa/memoryctrl/memoryctrl.vhd
add_input_file -format VHDL -work esa ../../lib/esa/memoryctrl/mctrl.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/examplevhd/examplevhd.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/examplevhd/apb_example.vhd
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/vlog_aes.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_cipher_top.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_inv_cipher_top.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_inv_sbox.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_sbox.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_key_expand_128.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes/aes_rcon.v
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/aes/aes.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/aes/apb_aes.vhd
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/vlog_aes_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_cipher_top_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_inv_cipher_top_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_inv_sbox_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_sbox_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_key_expand_128_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_rcon_em.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_sensor.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/aes_em/aes_sensor_32.v
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/aes_em/aes_em.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/aes_em/apb_aes_em.vhd
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/emsensor/sensorcell.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/emsensor/sensor32.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/emsensor/sensor_grlib.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/emsensor/timing_sensor32.v
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/emsensor/apb_sensor.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/emsensor/emsensor.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/emsensor/tsensor.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/emsensor/tsensor_inv.vhd
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/keymill/vlog_keymill.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/keymill/LR_Keymill_8.v
add_input_file -format VERILOG -work coprocessors ../../lib/coprocessors/keymill/fifo.v
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/keymill/keymill.vhd
add_input_file -format VHDL -work coprocessors ../../lib/coprocessors/keymill/apb_keymill_vlog.vhd
add_input_file -format VHDL -work work config.vhd
add_input_file -format VHDL -work work ahbrom.vhd
add_input_file -format VHDL -work work leon3mp.vhd
setup_design -design leon3mp
setup_design -retiming
setup_design -vhdl
setup_design -transformations=false
setup_design -frequency=""

save_impl
