Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90677138CA2
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 09:10:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CC79C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 08:10:14 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E5D0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 19:07:47 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id v69so6042934ili.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 11:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y/3/FC1XnDVxWzU3k8QMDiKcpDwUp++vQZ53xpXfySI=;
 b=WUQkPFuM2VamDKIKwlNQeKvgPg25UuUyBHofhg1u2C4HQ5Z57H9lRhTkzrql2rlQvO
 tXmjXl4Apg14YQqESQyNppzcfny7s0oeqTho24YSvlX9Gb8K/knIRX0PdTE8KTaYndN3
 SGLD/HxgWgzXDl6Hkihk7shtQbn8AQTbABvWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/3/FC1XnDVxWzU3k8QMDiKcpDwUp++vQZ53xpXfySI=;
 b=RMYKS1LRi410ZcYUONO7OvHoQwndRYt21eYia7lfTUJ9fuOb9HiHDc7FOGASBAEW/j
 Z0wAQkPOrDnb6hPREqNk5fuEpwkbf2LMYzT2xitnHiQ2t4BG+c4J/prYQtFSzlzlqCjH
 D2SJSAzoe89+W2k1URRiahM+CpTl+PUQ2nt19dBWrcDrKv8oyE036/yUv3VCbG0fFIel
 9mfMhRjKEtYUVZqLqj0qIAv4Th18WBhZujUbJSK3JDHPVBSsGcBfUD7ciJ2XhDXAi7s3
 LHFOKbhCd7bhX2ufrRDZACdCdQxGRRpZ4cwL4uA8TThIbVwkB+ow5KBleDVmbCC5NnC1
 359g==
X-Gm-Message-State: APjAAAVpAFYewPQPIyFz80AFAdOSu5rUjPASEAV7n0Twh9GvfRFlPIYK
 u3BL3gy7+grFlFEKMT0hqM00OA==
X-Google-Smtp-Source: APXvYqzq4/UrGehohRDXF7YdkajaPbdHKFa3sDJlZqLckv+iIcYrYvF1+IXVsQA+xyllhkpcgLOJ7w==
X-Received: by 2002:a92:afcf:: with SMTP id v76mr11499043ill.20.1578856064368; 
 Sun, 12 Jan 2020 11:07:44 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 r22sm3039219ilb.25.2020.01.12.11.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:07:43 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 12 Jan 2020 12:06:20 -0700
Message-Id: <20200112120216.29.I451105ed1149334d1ef6eca303eede6e56b833d1@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200112190624.79077-1-sjg@chromium.org>
References: <20200112190624.79077-1-sjg@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 08:10:12 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Carlo Caione <ccaione@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Sergey Kubushyn <ksi@koi8.net>,
 Ramon Fried <rfried.dev@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ye Li <ye.li@nxp.com>, "Derald D. Woods" <woods.technical@gmail.com>,
 Sekhar Nori <nsekhar@ti.com>, Stefano Babic <sbabic@denx.de>,
 Andreas Dannenberg <dannenberg@ti.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?q?=E9=BB=98=E9=BB=98?= <wangqiang1588@sina.com>,
 titron <tiezhuang.dong.yh@renesas.com>, Anup Patel <Anup.Patel@wdc.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Stefan Roese <sr@denx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabien Dessenne <fabien.dessenne@st.com>, u-boot-amlogic@groups.io,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Shyam Saini <shyam.saini@amarulasolutions.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sherry Sun <sherry.sun@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>, Suman Anna <s-anna@ti.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Atish Patra <atish.patra@wdc.com>,
 Lukas Auer <lukas.auer@aisec.fraunhofer.de>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Joel Stanley <joel@jms.id.au>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 William Zhang <william.zhang@broadcom.com>,
 Frank Wunderlich <frank-w@public-files.de>, Levin Du <djw@t-chip.com.cn>,
 Adam Ford <aford173@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Kyungmin Park <kmpark@infradead.org>, Priyanka Jain <priyanka.jain@nxp.com>,
 Trent Piepho <tpiepho@impinj.com>, Nishanth Menon <nm@ti.com>,
 Vignesh R <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Rick Chen <rick@andestech.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Marek Vasut <marex@denx.de>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Marek Vasut <marek.vasut@gmail.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Stefan Agner <stefan.agner@toradex.com>,
 Andre Przywara <andre.przywara@arm.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, Keerthy <j-keerthy@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 29/33] dm: core: Require users of devres to
	include the header
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

At present devres.h is included in all files that include dm.h but few
make use of it. Also this pulls in linux/compat which adds several more
headers. Drop the automatic inclusion and require files to include devres
themselves. This provides a good indication of which files use devres.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/mach-aspeed/ast2500/clk_ast2500.c      | 1 +
 arch/arm/mach-imx/cmd_nandbcb.c                 | 1 +
 arch/arm/mach-meson/board-info.c                | 1 +
 arch/arm/mach-meson/sm.c                        | 1 +
 arch/arm/mach-rockchip/px30/clk_px30.c          | 1 +
 arch/arm/mach-rockchip/rk3036/clk_rk3036.c      | 1 +
 arch/arm/mach-rockchip/rk3128/clk_rk3128.c      | 1 +
 arch/arm/mach-rockchip/rk3188/clk_rk3188.c      | 1 +
 arch/arm/mach-rockchip/rk3188/rk3188.c          | 1 +
 arch/arm/mach-rockchip/rk322x/clk_rk322x.c      | 1 +
 arch/arm/mach-rockchip/rk3288/clk_rk3288.c      | 1 +
 arch/arm/mach-rockchip/rk3288/rk3288.c          | 1 +
 arch/arm/mach-rockchip/rk3308/clk_rk3308.c      | 1 +
 arch/arm/mach-rockchip/rk3328/clk_rk3328.c      | 1 +
 arch/arm/mach-rockchip/rk3368/clk_rk3368.c      | 1 +
 arch/arm/mach-rockchip/rk3399/clk_rk3399.c      | 1 +
 arch/arm/mach-rockchip/rv1108/clk_rv1108.c      | 1 +
 arch/arm/mach-stm32mp/pwr_regulator.c           | 1 +
 arch/riscv/lib/andes_plic.c                     | 1 +
 arch/riscv/lib/andes_plmt.c                     | 1 +
 arch/riscv/lib/sifive_clint.c                   | 1 +
 board/google/veyron/veyron.c                    | 1 +
 board/st/stm32mp1/stm32mp1.c                    | 1 +
 cmd/gpio.c                                      | 1 +
 cmd/gpt.c                                       | 1 +
 cmd/mtd.c                                       | 2 ++
 cmd/ubi.c                                       | 1 +
 drivers/adc/rockchip-saradc.c                   | 1 +
 drivers/block/blk-uclass.c                      | 1 +
 drivers/clk/altera/clk-arria10.c                | 1 +
 drivers/clk/aspeed/clk_ast2500.c                | 1 +
 drivers/clk/at91/clk-generated.c                | 1 +
 drivers/clk/at91/clk-usb.c                      | 1 +
 drivers/clk/clk-composite.c                     | 2 ++
 drivers/clk/clk-divider.c                       | 2 ++
 drivers/clk/clk-fixed-factor.c                  | 2 ++
 drivers/clk/clk-gate.c                          | 2 ++
 drivers/clk/clk-mux.c                           | 2 ++
 drivers/clk/clk-ti-sci.c                        | 1 +
 drivers/clk/clk-uclass.c                        | 4 +++-
 drivers/clk/clk_fixed_factor.c                  | 1 +
 drivers/clk/clk_sandbox_ccf.c                   | 2 ++
 drivers/clk/clk_sandbox_test.c                  | 1 +
 drivers/clk/clk_versal.c                        | 1 +
 drivers/clk/clk_zynqmp.c                        | 1 +
 drivers/clk/imx/clk-composite-8m.c              | 2 ++
 drivers/clk/imx/clk-gate2.c                     | 2 ++
 drivers/clk/imx/clk-pfd.c                       | 2 ++
 drivers/clk/imx/clk-pll14xx.c                   | 2 ++
 drivers/clk/imx/clk-pllv3.c                     | 2 ++
 drivers/clk/meson/axg.c                         | 1 +
 drivers/clk/meson/g12a.c                        | 1 +
 drivers/clk/meson/gxbb.c                        | 1 +
 drivers/clk/rockchip/clk_rk3188.c               | 1 +
 drivers/clk/rockchip/clk_rk3288.c               | 1 +
 drivers/clk/sifive/fu540-prci.c                 | 1 +
 drivers/core/devres.c                           | 1 +
 drivers/dfu/dfu_mtd.c                           | 1 +
 drivers/dma/ti/k3-udma.c                        | 2 ++
 drivers/firmware/ti_sci.c                       | 1 +
 drivers/gpio/dwapb_gpio.c                       | 1 +
 drivers/gpio/mscc_sgpio.c                       | 1 +
 drivers/i2c/ast_i2c.c                           | 1 +
 drivers/i2c/designware_i2c.c                    | 1 +
 drivers/i2c/meson_i2c.c                         | 1 +
 drivers/i2c/muxes/i2c-mux-gpio.c                | 1 +
 drivers/i2c/tegra_i2c.c                         | 1 +
 drivers/misc/microchip_flexcom.c                | 1 +
 drivers/misc/tegra186_bpmp.c                    | 1 +
 drivers/mmc/am654_sdhci.c                       | 1 +
 drivers/mmc/aspeed_sdhci.c                      | 1 +
 drivers/mmc/fsl_esdhc_imx.c                     | 1 +
 drivers/mmc/omap_hsmmc.c                        | 2 ++
 drivers/mmc/rockchip_sdhci.c                    | 1 +
 drivers/mmc/tegra_mmc.c                         | 1 +
 drivers/mmc/zynq_sdhci.c                        | 1 +
 drivers/mtd/mtd_uboot.c                         | 1 +
 drivers/mtd/mtdconcat.c                         | 1 +
 drivers/mtd/mtdcore.c                           | 1 +
 drivers/mtd/mtdpart.c                           | 1 +
 drivers/mtd/nand/bbt.c                          | 1 +
 drivers/mtd/nand/raw/atmel_nand.c               | 1 +
 drivers/mtd/nand/raw/brcmnand/bcm63158_nand.c   | 1 +
 drivers/mtd/nand/raw/brcmnand/bcm6838_nand.c    | 1 +
 drivers/mtd/nand/raw/brcmnand/bcm6858_nand.c    | 1 +
 drivers/mtd/nand/raw/brcmnand/brcmnand.c        | 2 ++
 drivers/mtd/nand/raw/brcmnand/brcmnand_compat.c | 1 +
 drivers/mtd/nand/raw/denali.c                   | 2 ++
 drivers/mtd/nand/raw/fsl_elbc_nand.c            | 1 +
 drivers/mtd/nand/raw/fsl_ifc_nand.c             | 1 +
 drivers/mtd/nand/raw/mxs_nand_spl.c             | 1 +
 drivers/mtd/nand/raw/nand_base.c                | 1 +
 drivers/mtd/nand/raw/nand_bbt.c                 | 1 +
 drivers/mtd/nand/raw/nand_bch.c                 | 1 +
 drivers/mtd/nand/raw/nand_timings.c             | 1 +
 drivers/mtd/nand/raw/nand_util.c                | 1 +
 drivers/mtd/nand/raw/pxa3xx_nand.c              | 2 ++
 drivers/mtd/nand/raw/stm32_fmc2_nand.c          | 1 +
 drivers/mtd/nand/raw/sunxi_nand.c               | 2 ++
 drivers/mtd/nand/spi/core.c                     | 1 +
 drivers/mtd/onenand/onenand_base.c              | 1 +
 drivers/mtd/spi/spi-nor-core.c                  | 1 +
 drivers/mtd/ubi/attach.c                        | 1 +
 drivers/mtd/ubi/build.c                         | 1 +
 drivers/mtd/ubi/debug.c                         | 1 +
 drivers/mtd/ubi/eba.c                           | 1 +
 drivers/mtd/ubi/fastmap.c                       | 2 ++
 drivers/mtd/ubi/io.c                            | 1 +
 drivers/mtd/ubi/kapi.c                          | 1 +
 drivers/mtd/ubi/vmt.c                           | 1 +
 drivers/mtd/ubi/vtbl.c                          | 1 +
 drivers/mtd/ubi/wl.c                            | 1 +
 drivers/net/designware.c                        | 1 +
 drivers/net/dwmac_socfpga.c                     | 1 +
 drivers/net/mvneta.c                            | 1 +
 drivers/net/mvpp2.c                             | 2 ++
 drivers/net/phy/dp83867.c                       | 1 +
 drivers/net/sni_ave.c                           | 1 +
 drivers/net/zynq_gem.c                          | 1 +
 drivers/pci/pcie_dw_ti.c                        | 1 +
 drivers/pci/pcie_mediatek.c                     | 1 +
 drivers/phy/allwinner/phy-sun4i-usb.c           | 1 +
 drivers/phy/marvell/comphy_core.c               | 1 +
 drivers/phy/omap-usb2-phy.c                     | 1 +
 drivers/phy/phy-mtk-tphy.c                      | 1 +
 drivers/phy/phy-ti-am654.c                      | 1 +
 drivers/phy/ti-pipe3-phy.c                      | 1 +
 drivers/pinctrl/intel/pinctrl.c                 | 1 +
 drivers/pinctrl/mscc/mscc-common.c              | 1 +
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c     | 1 +
 drivers/pinctrl/nxp/pinctrl-imx.c               | 1 +
 drivers/pinctrl/nxp/pinctrl-mxs.c               | 1 +
 drivers/pinctrl/pinctrl_stm32.c                 | 1 +
 drivers/pinctrl/renesas/pfc.c                   | 1 +
 drivers/power/domain/meson-ee-pwrc.c            | 1 +
 drivers/power/domain/meson-gx-pwrc-vpu.c        | 1 +
 drivers/power/domain/mtk-power-domain.c         | 1 +
 drivers/power/domain/ti-sci-power-domain.c      | 1 +
 drivers/power/regulator/pbias_regulator.c       | 1 +
 drivers/ram/rockchip/dmc-rk3368.c               | 1 +
 drivers/remoteproc/rproc-elf-loader.c           | 1 +
 drivers/remoteproc/stm32_copro.c                | 1 +
 drivers/remoteproc/ti_k3_arm64_rproc.c          | 1 +
 drivers/remoteproc/ti_k3_dsp_rproc.c            | 1 +
 drivers/remoteproc/ti_k3_r5f_rproc.c            | 1 +
 drivers/reset/reset-mediatek.c                  | 1 +
 drivers/reset/reset-ti-sci.c                    | 1 +
 drivers/reset/reset-uclass.c                    | 1 +
 drivers/serial/ns16550.c                        | 1 +
 drivers/serial/serial_mtk.c                     | 3 ++-
 drivers/serial/serial_omap.c                    | 1 +
 drivers/serial/serial_sifive.c                  | 1 +
 drivers/serial/serial_zynq.c                    | 1 +
 drivers/smem/msm_smem.c                         | 2 ++
 drivers/soc/ti/k3-navss-ringacc.c               | 2 ++
 drivers/spi/atmel-quadspi.c                     | 1 +
 drivers/spi/cadence_qspi.c                      | 1 +
 drivers/spi/spi-mem.c                           | 1 +
 drivers/spi/ti_qspi.c                           | 1 +
 drivers/spi/zynqmp_gqspi.c                      | 1 +
 drivers/sysreset/sysreset-ti-sci.c              | 1 +
 drivers/sysreset/sysreset_syscon.c              | 1 +
 drivers/tee/optee/core.c                        | 1 +
 drivers/timer/ast_timer.c                       | 1 +
 drivers/timer/cadence-ttc.c                     | 1 +
 drivers/timer/timer-uclass.c                    | 1 +
 drivers/ufs/cdns-platform.c                     | 1 +
 drivers/ufs/ti-j721e-ufs.c                      | 1 +
 drivers/ufs/ufs.c                               | 1 +
 drivers/usb/cdns3/core.c                        | 1 +
 drivers/usb/cdns3/gadget.c                      | 2 ++
 drivers/usb/cdns3/host.c                        | 1 +
 drivers/usb/dwc3/core.c                         | 2 ++
 drivers/usb/dwc3/dwc3-omap.c                    | 1 +
 drivers/usb/dwc3/gadget.c                       | 1 +
 drivers/usb/dwc3/ti_usb_phy.c                   | 1 +
 drivers/usb/gadget/at91_udc.c                   | 2 ++
 drivers/usb/gadget/composite.c                  | 1 +
 drivers/usb/gadget/dwc2_udc_otg.c               | 1 +
 drivers/usb/gadget/f_mass_storage.c             | 1 +
 drivers/usb/gadget/pxa25x_udc.c                 | 1 +
 drivers/usb/gadget/udc/udc-core.c               | 1 +
 drivers/usb/host/ehci-generic.c                 | 1 +
 drivers/usb/host/ohci-da8xx.c                   | 1 +
 drivers/usb/host/ohci-generic.c                 | 1 +
 drivers/usb/musb-new/am35x.c                    | 1 +
 drivers/usb/musb-new/musb_core.c                | 1 +
 drivers/usb/musb-new/musb_dsps.c                | 1 +
 drivers/usb/musb-new/musb_gadget.c              | 1 +
 drivers/usb/musb-new/musb_host.c                | 1 +
 drivers/usb/musb-new/musb_uboot.c               | 1 +
 drivers/usb/musb-new/omap2430.c                 | 1 +
 drivers/video/exynos/exynos_mipi_dsi.c          | 1 +
 drivers/video/mipi_dsi.c                        | 1 +
 drivers/video/rockchip/rk3288_mipi.c            | 1 +
 drivers/video/rockchip/rk3399_mipi.c            | 1 +
 drivers/video/rockchip/rk_vop.c                 | 1 +
 drivers/video/tegra124/sor.c                    | 1 +
 drivers/virtio/virtio_mmio.c                    | 1 +
 drivers/virtio/virtio_pci_legacy.c              | 1 +
 drivers/virtio/virtio_pci_modern.c              | 1 +
 drivers/virtio/virtio_sandbox.c                 | 1 +
 drivers/watchdog/ast_wdt.c                      | 1 +
 drivers/watchdog/cdns_wdt.c                     | 1 +
 drivers/watchdog/sp805_wdt.c                    | 1 +
 drivers/watchdog/xilinx_tb_wdt.c                | 1 +
 fs/ubifs/debug.c                                | 1 +
 fs/ubifs/gc.c                                   | 1 +
 fs/ubifs/io.c                                   | 1 +
 fs/ubifs/log.c                                  | 1 +
 fs/ubifs/lpt.c                                  | 1 +
 fs/ubifs/lpt_commit.c                           | 1 +
 fs/ubifs/master.c                               | 1 +
 fs/ubifs/orphan.c                               | 1 +
 fs/ubifs/recovery.c                             | 1 +
 fs/ubifs/replay.c                               | 1 +
 fs/ubifs/sb.c                                   | 1 +
 fs/ubifs/scan.c                                 | 1 +
 fs/ubifs/super.c                                | 1 +
 fs/ubifs/tnc.c                                  | 1 +
 fs/ubifs/tnc_misc.c                             | 1 +
 fs/ubifs/ubifs.c                                | 1 +
 fs/yaffs2/yaffs_allocator.c                     | 1 +
 fs/yaffs2/yaffs_checkptrw.c                     | 1 +
 fs/yaffs2/yaffs_guts.c                          | 1 +
 fs/yaffs2/yaffs_summary.c                       | 1 +
 fs/yaffs2/yaffs_yaffs1.c                        | 1 +
 fs/yaffs2/yaffs_yaffs2.c                        | 1 +
 fs/yaffs2/yaffsfs.c                             | 1 +
 include/dm/device.h                             | 2 --
 include/dm/devres.h                             | 4 ++++
 lib/bch.c                                       | 1 +
 lib/crypto/asymmetric_type.c                    | 2 ++
 lib/crypto/pkcs7_parser.c                       | 1 +
 lib/crypto/public_key.c                         | 2 ++
 lib/crypto/x509_cert_parser.c                   | 1 +
 lib/crypto/x509_public_key.c                    | 2 ++
 lib/list_sort.c                                 | 1 +
 test/dm/devres.c                                | 1 +
 test/dm/regmap.c                                | 1 +
 test/dm/syscon.c                                | 1 +
 test/dm/test-fdt.c                              | 1 +
 242 files changed, 275 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-aspeed/ast2500/clk_ast2500.c b/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
index 7d864a4088..3e9f5e57ed 100644
--- a/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
+++ b/arch/arm/mach-aspeed/ast2500/clk_ast2500.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <asm/io.h>
 #include <asm/arch/scu_ast2500.h>
+#include <linux/err.h>
 
 int ast_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-imx/cmd_nandbcb.c b/arch/arm/mach-imx/cmd_nandbcb.c
index 334cc0766e..a1c265f46f 100644
--- a/arch/arm/mach-imx/cmd_nandbcb.c
+++ b/arch/arm/mach-imx/cmd_nandbcb.c
@@ -11,6 +11,7 @@
 
 #include <common.h>
 #include <nand.h>
+#include <dm/devres.h>
 
 #include <asm/io.h>
 #include <jffs2/jffs2.h>
diff --git a/arch/arm/mach-meson/board-info.c b/arch/arm/mach-meson/board-info.c
index 0d3b40a249..4b88afa9b7 100644
--- a/arch/arm/mach-meson/board-info.c
+++ b/arch/arm/mach-meson/board-info.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <regmap.h>
 #include <syscon.h>
+#include <linux/err.h>
 
 #define AO_SEC_SD_CFG8		0xe0
 #define AO_SEC_SOCINFO_OFFSET	AO_SEC_SD_CFG8
diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
index fabcb3bfd7..fac286b9c8 100644
--- a/arch/arm/mach-meson/sm.c
+++ b/arch/arm/mach-meson/sm.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <asm/arch/sm.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <dm.h>
 #include <linux/bitfield.h>
diff --git a/arch/arm/mach-rockchip/px30/clk_px30.c b/arch/arm/mach-rockchip/px30/clk_px30.c
index 0bd6b471da..98a1bcd224 100644
--- a/arch/arm/mach-rockchip/px30/clk_px30.c
+++ b/arch/arm/mach-rockchip/px30/clk_px30.c
@@ -8,6 +8,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_px30.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3036/clk_rk3036.c b/arch/arm/mach-rockchip/rk3036/clk_rk3036.c
index 20e2ed6813..5d0def3b52 100644
--- a/arch/arm/mach-rockchip/rk3036/clk_rk3036.c
+++ b/arch/arm/mach-rockchip/rk3036/clk_rk3036.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3036.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3128/clk_rk3128.c b/arch/arm/mach-rockchip/rk3128/clk_rk3128.c
index 827750bf98..f9ce1f7234 100644
--- a/arch/arm/mach-rockchip/rk3128/clk_rk3128.c
+++ b/arch/arm/mach-rockchip/rk3128/clk_rk3128.c
@@ -8,6 +8,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3128.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3188/clk_rk3188.c b/arch/arm/mach-rockchip/rk3188/clk_rk3188.c
index 9d4fc37eda..a0dcac3732 100644
--- a/arch/arm/mach-rockchip/rk3188/clk_rk3188.c
+++ b/arch/arm/mach-rockchip/rk3188/clk_rk3188.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3188.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3188/rk3188.c b/arch/arm/mach-rockchip/rk3188/rk3188.c
index 1b012f7f67..ecb9af1470 100644
--- a/arch/arm/mach-rockchip/rk3188/rk3188.c
+++ b/arch/arm/mach-rockchip/rk3188/rk3188.c
@@ -10,6 +10,7 @@
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/grf_rk3188.h>
 #include <asm/arch-rockchip/hardware.h>
+#include <linux/err.h>
 
 #define GRF_BASE	0x20008000
 
diff --git a/arch/arm/mach-rockchip/rk322x/clk_rk322x.c b/arch/arm/mach-rockchip/rk322x/clk_rk322x.c
index 958c7b82b9..fc5abd736e 100644
--- a/arch/arm/mach-rockchip/rk322x/clk_rk322x.c
+++ b/arch/arm/mach-rockchip/rk322x/clk_rk322x.c
@@ -8,6 +8,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk322x.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3288/clk_rk3288.c b/arch/arm/mach-rockchip/rk3288/clk_rk3288.c
index e64ee86f08..1b97a2e9f2 100644
--- a/arch/arm/mach-rockchip/rk3288/clk_rk3288.c
+++ b/arch/arm/mach-rockchip/rk3288/clk_rk3288.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3288.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3288/rk3288.c b/arch/arm/mach-rockchip/rk3288/rk3288.c
index 9572f7ea9c..05ba48ab27 100644
--- a/arch/arm/mach-rockchip/rk3288/rk3288.c
+++ b/arch/arm/mach-rockchip/rk3288/rk3288.c
@@ -17,6 +17,7 @@
 #include <asm/arch-rockchip/pmu_rk3288.h>
 #include <asm/arch-rockchip/qos_rk3288.h>
 #include <asm/arch-rockchip/sdram.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/arch/arm/mach-rockchip/rk3308/clk_rk3308.c b/arch/arm/mach-rockchip/rk3308/clk_rk3308.c
index 51b43153e8..1feb237224 100644
--- a/arch/arm/mach-rockchip/rk3308/clk_rk3308.c
+++ b/arch/arm/mach-rockchip/rk3308/clk_rk3308.c
@@ -8,6 +8,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch/cru_rk3308.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3328/clk_rk3328.c b/arch/arm/mach-rockchip/rk3328/clk_rk3328.c
index f64f0cbbe5..e5375514de 100644
--- a/arch/arm/mach-rockchip/rk3328/clk_rk3328.c
+++ b/arch/arm/mach-rockchip/rk3328/clk_rk3328.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3328.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3368/clk_rk3368.c b/arch/arm/mach-rockchip/rk3368/clk_rk3368.c
index 55e5dd768a..9a33c67bc9 100644
--- a/arch/arm/mach-rockchip/rk3368/clk_rk3368.c
+++ b/arch/arm/mach-rockchip/rk3368/clk_rk3368.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3368.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rk3399/clk_rk3399.c b/arch/arm/mach-rockchip/rk3399/clk_rk3399.c
index f0411c0a21..08f677ac4d 100644
--- a/arch/arm/mach-rockchip/rk3399/clk_rk3399.c
+++ b/arch/arm/mach-rockchip/rk3399/clk_rk3399.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3399.h>
+#include <linux/err.h>
 
 static int rockchip_get_cruclk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-rockchip/rv1108/clk_rv1108.c b/arch/arm/mach-rockchip/rv1108/clk_rv1108.c
index 58a7e889cc..b37ae1c494 100644
--- a/arch/arm/mach-rockchip/rv1108/clk_rv1108.c
+++ b/arch/arm/mach-rockchip/rv1108/clk_rv1108.c
@@ -9,6 +9,7 @@
 #include <syscon.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rv1108.h>
+#include <linux/err.h>
 
 int rockchip_get_clk(struct udevice **devp)
 {
diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
index 9484645dbd..977cc7d348 100644
--- a/arch/arm/mach-stm32mp/pwr_regulator.c
+++ b/arch/arm/mach-stm32mp/pwr_regulator.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <regmap.h>
 #include <syscon.h>
+#include <linux/err.h>
 #include <power/pmic.h>
 #include <power/regulator.h>
 
diff --git a/arch/riscv/lib/andes_plic.c b/arch/riscv/lib/andes_plic.c
index 3868569a65..20529ab3eb 100644
--- a/arch/riscv/lib/andes_plic.c
+++ b/arch/riscv/lib/andes_plic.c
@@ -17,6 +17,7 @@
 #include <asm/io.h>
 #include <asm/syscon.h>
 #include <cpu.h>
+#include <linux/err.h>
 
 /* pending register */
 #define PENDING_REG(base, hart)	((ulong)(base) + 0x1000 + ((hart) / 4) * 4)
diff --git a/arch/riscv/lib/andes_plmt.c b/arch/riscv/lib/andes_plmt.c
index 84f4607500..a7e90ca992 100644
--- a/arch/riscv/lib/andes_plmt.c
+++ b/arch/riscv/lib/andes_plmt.c
@@ -13,6 +13,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm/syscon.h>
+#include <linux/err.h>
 
 /* mtime register */
 #define MTIME_REG(base)			((ulong)(base))
diff --git a/arch/riscv/lib/sifive_clint.c b/arch/riscv/lib/sifive_clint.c
index d7899d16d7..5e0d25720b 100644
--- a/arch/riscv/lib/sifive_clint.c
+++ b/arch/riscv/lib/sifive_clint.c
@@ -13,6 +13,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm/syscon.h>
+#include <linux/err.h>
 
 /* MSIP registers */
 #define MSIP_REG(base, hart)		((ulong)(base) + (hart) * 4)
diff --git a/board/google/veyron/veyron.c b/board/google/veyron/veyron.c
index dd2c014c60..6b9c34818b 100644
--- a/board/google/veyron/veyron.c
+++ b/board/google/veyron/veyron.c
@@ -8,6 +8,7 @@
 #include <dm.h>
 #include <asm/arch-rockchip/clock.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <linux/err.h>
 #include <power/regulator.h>
 
 /*
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 1d4a54c902..d57a50de11 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -31,6 +31,7 @@
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 #include <jffs2/load_kernel.h>
+#include <linux/err.h>
 #include <power/regulator.h>
 #include <usb/dwc2_udc.h>
 
diff --git a/cmd/gpio.c b/cmd/gpio.c
index eff36ab2af..5f4c7ff114 100644
--- a/cmd/gpio.c
+++ b/cmd/gpio.c
@@ -11,6 +11,7 @@
 #include <errno.h>
 #include <dm.h>
 #include <asm/gpio.h>
+#include <linux/err.h>
 
 __weak int name_to_gpio(const char *name)
 {
diff --git a/cmd/gpt.c b/cmd/gpt.c
index 0c4349f4b2..ca17070805 100644
--- a/cmd/gpt.c
+++ b/cmd/gpt.c
@@ -20,6 +20,7 @@
 #include <div64.h>
 #include <memalign.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/sizes.h>
 #include <stdlib.h>
 
diff --git a/cmd/mtd.c b/cmd/mtd.c
index 1b6b8dda2b..21afce03ca 100644
--- a/cmd/mtd.c
+++ b/cmd/mtd.c
@@ -14,6 +14,8 @@
 #include <malloc.h>
 #include <mapmem.h>
 #include <mtd.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 
 #include <linux/ctype.h>
 
diff --git a/cmd/ubi.c b/cmd/ubi.c
index 22ba5b1a2c..7fb4cdfc2a 100644
--- a/cmd/ubi.c
+++ b/cmd/ubi.c
@@ -19,6 +19,7 @@
 #include <mtd.h>
 #include <nand.h>
 #include <onenand_uboot.h>
+#include <dm/devres.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/err.h>
diff --git a/drivers/adc/rockchip-saradc.c b/drivers/adc/rockchip-saradc.c
index ed773b9642..850142cce3 100644
--- a/drivers/adc/rockchip-saradc.c
+++ b/drivers/adc/rockchip-saradc.c
@@ -11,6 +11,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <asm/io.h>
+#include <linux/err.h>
 
 #define SARADC_CTRL_CHN_MASK		GENMASK(2, 0)
 #define SARADC_CTRL_POWER_CTRL		BIT(3)
diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
index ca8978f0e1..7771114491 100644
--- a/drivers/block/blk-uclass.c
+++ b/drivers/block/blk-uclass.c
@@ -10,6 +10,7 @@
 #include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 
 static const char *if_typename_str[IF_TYPE_COUNT] = {
 	[IF_TYPE_IDE]		= "ide",
diff --git a/drivers/clk/altera/clk-arria10.c b/drivers/clk/altera/clk-arria10.c
index 179869df45..a39cd34fe5 100644
--- a/drivers/clk/altera/clk-arria10.c
+++ b/drivers/clk/altera/clk-arria10.c
@@ -7,6 +7,7 @@
 #include <asm/io.h>
 #include <clk-uclass.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <dm/util.h>
 
diff --git a/drivers/clk/aspeed/clk_ast2500.c b/drivers/clk/aspeed/clk_ast2500.c
index b3a3f3d4dd..f4a441ad68 100644
--- a/drivers/clk/aspeed/clk_ast2500.c
+++ b/drivers/clk/aspeed/clk_ast2500.c
@@ -10,6 +10,7 @@
 #include <asm/arch/scu_ast2500.h>
 #include <dm/lists.h>
 #include <dt-bindings/clock/ast2500-scu.h>
+#include <linux/err.h>
 
 /*
  * MAC Clock Delay settings, taken from Aspeed SDK
diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 70b277e26f..d8562e131d 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <mach/at91_pmc.h>
 #include "pmc.h"
diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 24af183b55..c3cb2ba014 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <mach/at91_pmc.h>
 #include "pmc.h"
diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index a5626c33d1..414185031e 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -9,8 +9,10 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <clk.h>
+#include <linux/err.h>
 
 #include "clk.h"
 
diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 822e09b084..d79ae367b8 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -14,10 +14,12 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <dm/uclass.h>
 #include <dm/lists.h>
 #include <dm/device-internal.h>
 #include <linux/clk-provider.h>
+#include <linux/err.h>
 #include <linux/log2.h>
 #include <div64.h>
 #include <clk.h>
diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 711b0588bc..2ceb6bb171 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -9,10 +9,12 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <div64.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_IMX_FIXED_FACTOR "ccf_clk_fixed_factor"
 
diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 70b8794554..6415c2f1b9 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -12,9 +12,11 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_GATE "clk_gate"
 
diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 5acc0b8cbd..b9d2ae6778 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -26,9 +26,11 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_CCF_MUX "ccf_clk_mux"
 
diff --git a/drivers/clk/clk-ti-sci.c b/drivers/clk/clk-ti-sci.c
index 5ef9035ece..4612fbcdc7 100644
--- a/drivers/clk/clk-ti-sci.c
+++ b/drivers/clk/clk-ti-sci.c
@@ -12,6 +12,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <clk-uclass.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <k3-avs.h>
 
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 7ac580d661..a4f6b15e3d 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -10,10 +10,12 @@
 #include <clk.h>
 #include <clk-uclass.h>
 #include <dm.h>
-#include <dm/read.h>
 #include <dt-structs.h>
 #include <errno.h>
+#include <dm/devres.h>
+#include <dm/read.h>
 #include <linux/clk-provider.h>
+#include <linux/err.h>
 
 static inline const struct clk_ops *clk_dev_ops(struct udevice *dev)
 {
diff --git a/drivers/clk/clk_fixed_factor.c b/drivers/clk/clk_fixed_factor.c
index dcdb6ddf5c..cf9c4ae367 100644
--- a/drivers/clk/clk_fixed_factor.c
+++ b/drivers/clk/clk_fixed_factor.c
@@ -9,6 +9,7 @@
 #include <clk-uclass.h>
 #include <div64.h>
 #include <dm.h>
+#include <linux/err.h>
 
 struct clk_fixed_factor {
 	struct clk parent;
diff --git a/drivers/clk/clk_sandbox_ccf.c b/drivers/clk/clk_sandbox_ccf.c
index 9fa27229e1..0903c817a6 100644
--- a/drivers/clk/clk_sandbox_ccf.c
+++ b/drivers/clk/clk_sandbox_ccf.c
@@ -11,8 +11,10 @@
 #include <clk.h>
 #include <asm/clk.h>
 #include <clk-uclass.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <sandbox-clk.h>
+#include <linux/err.h>
 
 /*
  * Sandbox implementation of CCF primitives necessary for clk-uclass testing
diff --git a/drivers/clk/clk_sandbox_test.c b/drivers/clk/clk_sandbox_test.c
index 41954660ea..628110de3e 100644
--- a/drivers/clk/clk_sandbox_test.c
+++ b/drivers/clk/clk_sandbox_test.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <clk.h>
 #include <asm/clk.h>
+#include <linux/err.h>
 
 struct sandbox_clk_test {
 	struct clk clks[SANDBOX_CLK_TEST_NON_DEVM_COUNT];
diff --git a/drivers/clk/clk_versal.c b/drivers/clk/clk_versal.c
index 7e97b0c4bf..66cbef15ab 100644
--- a/drivers/clk/clk_versal.c
+++ b/drivers/clk/clk_versal.c
@@ -13,6 +13,7 @@
 #include <dm.h>
 #include <asm/arch/sys_proto.h>
 #include <zynqmp_firmware.h>
+#include <linux/err.h>
 
 #define MAX_PARENT			100
 #define MAX_NODES			6
diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
index 72fc39fa47..a365b565e1 100644
--- a/drivers/clk/clk_zynqmp.c
+++ b/drivers/clk/clk_zynqmp.c
@@ -11,6 +11,7 @@
 #include <clk.h>
 #include <asm/arch/sys_proto.h>
 #include <dm.h>
+#include <linux/err.h>
 
 static const resource_size_t zynqmp_crf_apb_clkc_base = 0xfd1a0020;
 static const resource_size_t zynqmp_crl_apb_clkc_base = 0xff5e0020;
diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index 95120d6559..3e99c528de 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -8,9 +8,11 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_IMX_COMPOSITE "imx_clk_composite"
 
diff --git a/drivers/clk/imx/clk-gate2.c b/drivers/clk/imx/clk-gate2.c
index 1b9db6e791..b38890d5ba 100644
--- a/drivers/clk/imx/clk-gate2.c
+++ b/drivers/clk/imx/clk-gate2.c
@@ -19,9 +19,11 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_IMX_GATE2 "imx_clk_gate2"
 
diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index 188b2b3b90..f0f2eeb4a7 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -19,10 +19,12 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
 #include <div64.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_IMX_PFD "imx_clk_pfd"
 
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 2246beb21b..1673eb26b2 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -10,7 +10,9 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/clk-provider.h>
+#include <linux/err.h>
 #include <linux/iopoll.h>
 #include <clk.h>
 #include <div64.h>
diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index fbb7b24d5e..77efd394e9 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -9,9 +9,11 @@
 #include <malloc.h>
 #include <clk-uclass.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <dm/uclass.h>
 #include <clk.h>
 #include "clk.h"
+#include <linux/err.h>
 
 #define UBOOT_DM_CLK_IMX_PLLV3 "imx_clk_pllv3"
 
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 32cbf752ae..7035b59a13 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -15,6 +15,7 @@
 #include <div64.h>
 #include <dt-bindings/clock/axg-clkc.h>
 #include "clk_meson.h"
+#include <linux/err.h>
 
 #define XTAL_RATE 24000000
 
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 1b2523bbf1..686d94ebfe 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -14,6 +14,7 @@
 #include <syscon.h>
 #include <div64.h>
 #include <dt-bindings/clock/g12a-clkc.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include "clk_meson.h"
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index abb5337e78..e781e08d9d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -15,6 +15,7 @@
 #include <syscon.h>
 #include <dt-bindings/clock/gxbb-clkc.h>
 #include "clk_meson.h"
+#include <linux/err.h>
 
 /* This driver support only basic clock tree operations :
  * - Can calculate clock frequency on a limited tree
diff --git a/drivers/clk/rockchip/clk_rk3188.c b/drivers/clk/rockchip/clk_rk3188.c
index 3ea9a81b32..82eea40063 100644
--- a/drivers/clk/rockchip/clk_rk3188.c
+++ b/drivers/clk/rockchip/clk_rk3188.c
@@ -20,6 +20,7 @@
 #include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <linux/log2.h>
 
 enum rk3188_clk_type {
diff --git a/drivers/clk/rockchip/clk_rk3288.c b/drivers/clk/rockchip/clk_rk3288.c
index 85d1b67e43..14dfa85942 100644
--- a/drivers/clk/rockchip/clk_rk3288.c
+++ b/drivers/clk/rockchip/clk_rk3288.c
@@ -21,6 +21,7 @@
 #include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <linux/log2.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index ce0769f2d1..8847178001 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -35,6 +35,7 @@
 #include <div64.h>
 #include <dm.h>
 #include <errno.h>
+#include <linux/err.h>
 
 #include <linux/math64.h>
 #include <linux/clk/analogbits-wrpll-cln28hpc.h>
diff --git a/drivers/core/devres.c b/drivers/core/devres.c
index 237b42653c..d98e80de26 100644
--- a/drivers/core/devres.c
+++ b/drivers/core/devres.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <dm/root.h>
 #include <dm/util.h>
 
diff --git a/drivers/dfu/dfu_mtd.c b/drivers/dfu/dfu_mtd.c
index 9528a7b4ee..36cd4e945b 100644
--- a/drivers/dfu/dfu_mtd.c
+++ b/drivers/dfu/dfu_mtd.c
@@ -11,6 +11,7 @@
 #include <dfu.h>
 #include <mtd.h>
 #include <jffs2/load_kernel.h>
+#include <linux/err.h>
 
 static bool mtd_is_aligned_with_block_size(struct mtd_info *mtd, u64 size)
 {
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 23d6ed0697..4859b3f32c 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -12,12 +12,14 @@
 #include <malloc.h>
 #include <asm/dma-mapping.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/read.h>
 #include <dm/of_access.h>
 #include <dma.h>
 #include <dma-uclass.h>
 #include <linux/delay.h>
 #include <dt-bindings/dma/k3-udma.h>
+#include <linux/err.h>
 #include <linux/soc/ti/k3-navss-ringacc.h>
 #include <linux/soc/ti/cppi5.h>
 #include <linux/soc/ti/ti-udma.h>
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 62b1dc2006..5e37ee0570 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -12,6 +12,7 @@
 #include <errno.h>
 #include <mailbox.h>
 #include <dm/device.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <linux/err.h>
 #include <linux/soc/ti/k3-sec-proxy.h>
diff --git a/drivers/gpio/dwapb_gpio.c b/drivers/gpio/dwapb_gpio.c
index 2eb1547b4f..58e3e7b1f7 100644
--- a/drivers/gpio/dwapb_gpio.c
+++ b/drivers/gpio/dwapb_gpio.c
@@ -12,6 +12,7 @@
 #include <asm/io.h>
 #include <dm.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <dm/root.h>
 #include <errno.h>
diff --git a/drivers/gpio/mscc_sgpio.c b/drivers/gpio/mscc_sgpio.c
index c899454ec4..3378ebb442 100644
--- a/drivers/gpio/mscc_sgpio.c
+++ b/drivers/gpio/mscc_sgpio.c
@@ -13,6 +13,7 @@
 #include <asm/io.h>
 #include <errno.h>
 #include <clk.h>
+#include <linux/err.h>
 
 #define MSCC_SGPIOS_PER_BANK	32
 #define MSCC_SGPIO_BANK_DEPTH	4
diff --git a/drivers/i2c/ast_i2c.c b/drivers/i2c/ast_i2c.c
index 763183d649..3f7382a0c9 100644
--- a/drivers/i2c/ast_i2c.c
+++ b/drivers/i2c/ast_i2c.c
@@ -13,6 +13,7 @@
 #include <i2c.h>
 #include <asm/io.h>
 #include <asm/arch/scu_ast2500.h>
+#include <linux/err.h>
 
 #include "ast_i2c.h"
 
diff --git a/drivers/i2c/designware_i2c.c b/drivers/i2c/designware_i2c.c
index b8cdd1c661..03d6ca09f7 100644
--- a/drivers/i2c/designware_i2c.c
+++ b/drivers/i2c/designware_i2c.c
@@ -12,6 +12,7 @@
 #include <reset.h>
 #include <asm/io.h>
 #include "designware_i2c.h"
+#include <linux/err.h>
 
 #ifdef CONFIG_SYS_I2C_DW_ENABLE_STATUS_UNSUPPORTED
 static int  dw_i2c_enable(struct i2c_regs *i2c_base, bool enable)
diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
index ee59bac123..bcf45160d8 100644
--- a/drivers/i2c/meson_i2c.c
+++ b/drivers/i2c/meson_i2c.c
@@ -7,6 +7,7 @@
 #include <clk.h>
 #include <dm.h>
 #include <i2c.h>
+#include <linux/err.h>
 
 #define I2C_TIMEOUT_MS		100
 
diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index e8b124f4f5..29e283ce25 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -11,6 +11,7 @@
 #include <asm-generic/gpio.h>
 #include <common.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/pinctrl.h>
 #include <fdtdec.h>
 #include <i2c.h>
diff --git a/drivers/i2c/tegra_i2c.c b/drivers/i2c/tegra_i2c.c
index 4be41ddbf0..f37db31c3c 100644
--- a/drivers/i2c/tegra_i2c.c
+++ b/drivers/i2c/tegra_i2c.c
@@ -18,6 +18,7 @@
 #endif
 #include <asm/arch/gpio.h>
 #include <asm/arch-tegra/tegra_i2c.h>
+#include <linux/err.h>
 
 enum i2c_type {
 	TYPE_114,
diff --git a/drivers/misc/microchip_flexcom.c b/drivers/misc/microchip_flexcom.c
index 1bc19edfcb..4cff160d88 100644
--- a/drivers/misc/microchip_flexcom.c
+++ b/drivers/misc/microchip_flexcom.c
@@ -9,6 +9,7 @@
 #include <errno.h>
 #include <misc.h>
 #include <asm/io.h>
+#include <linux/err.h>
 
 struct microchip_flexcom_regs {
 	u32 cr;
diff --git a/drivers/misc/tegra186_bpmp.c b/drivers/misc/tegra186_bpmp.c
index 89e27dd526..489337c3d0 100644
--- a/drivers/misc/tegra186_bpmp.c
+++ b/drivers/misc/tegra186_bpmp.c
@@ -12,6 +12,7 @@
 #include <misc.h>
 #include <asm/arch-tegra/bpmp_abi.h>
 #include <asm/arch-tegra/ivc.h>
+#include <linux/err.h>
 
 #define BPMP_IVC_FRAME_COUNT 1
 #define BPMP_IVC_FRAME_SIZE 128
diff --git a/drivers/mmc/am654_sdhci.c b/drivers/mmc/am654_sdhci.c
index 7cd5516197..37952d6ace 100644
--- a/drivers/mmc/am654_sdhci.c
+++ b/drivers/mmc/am654_sdhci.c
@@ -12,6 +12,7 @@
 #include <power-domain.h>
 #include <regmap.h>
 #include <sdhci.h>
+#include <linux/err.h>
 
 /* CTL_CFG Registers */
 #define CTL_CFG_2		0x14
diff --git a/drivers/mmc/aspeed_sdhci.c b/drivers/mmc/aspeed_sdhci.c
index 1321ec37e1..8929e603f3 100644
--- a/drivers/mmc/aspeed_sdhci.c
+++ b/drivers/mmc/aspeed_sdhci.c
@@ -9,6 +9,7 @@
 #include <dm.h>
 #include <malloc.h>
 #include <sdhci.h>
+#include <linux/err.h>
 
 struct aspeed_sdhci_plat {
 	struct mmc_config cfg;
diff --git a/drivers/mmc/fsl_esdhc_imx.c b/drivers/mmc/fsl_esdhc_imx.c
index f7b754bd9d..ab1ef8d77c 100644
--- a/drivers/mmc/fsl_esdhc_imx.c
+++ b/drivers/mmc/fsl_esdhc_imx.c
@@ -19,6 +19,7 @@
 #include <hwconfig.h>
 #include <mmc.h>
 #include <part.h>
+#include <linux/err.h>
 #include <power/regulator.h>
 #include <malloc.h>
 #include <fsl_esdhc_imx.h>
diff --git a/drivers/mmc/omap_hsmmc.c b/drivers/mmc/omap_hsmmc.c
index 5d0cfb2ebd..5334723a9f 100644
--- a/drivers/mmc/omap_hsmmc.c
+++ b/drivers/mmc/omap_hsmmc.c
@@ -47,6 +47,8 @@
 #include <asm/arch/mux.h>
 #endif
 #include <dm.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <power/regulator.h>
 #include <thermal.h>
 
diff --git a/drivers/mmc/rockchip_sdhci.c b/drivers/mmc/rockchip_sdhci.c
index dd3d5574db..b440996b26 100644
--- a/drivers/mmc/rockchip_sdhci.c
+++ b/drivers/mmc/rockchip_sdhci.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <dm.h>
 #include <dt-structs.h>
+#include <linux/err.h>
 #include <linux/libfdt.h>
 #include <malloc.h>
 #include <mapmem.h>
diff --git a/drivers/mmc/tegra_mmc.c b/drivers/mmc/tegra_mmc.c
index 22990fa98b..f022e93552 100644
--- a/drivers/mmc/tegra_mmc.c
+++ b/drivers/mmc/tegra_mmc.c
@@ -14,6 +14,7 @@
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <asm/arch-tegra/tegra_mmc.h>
+#include <linux/err.h>
 
 struct tegra_mmc_plat {
 	struct mmc_config cfg;
diff --git a/drivers/mmc/zynq_sdhci.c b/drivers/mmc/zynq_sdhci.c
index 529eec9c45..83c32a361a 100644
--- a/drivers/mmc/zynq_sdhci.c
+++ b/drivers/mmc/zynq_sdhci.c
@@ -10,6 +10,7 @@
 #include <dm.h>
 #include <fdtdec.h>
 #include "mmc_private.h"
+#include <linux/err.h>
 #include <linux/libfdt.h>
 #include <malloc.h>
 #include <sdhci.h>
diff --git a/drivers/mtd/mtd_uboot.c b/drivers/mtd/mtd_uboot.c
index 8aeccb016d..17df8b0ffc 100644
--- a/drivers/mtd/mtd_uboot.c
+++ b/drivers/mtd/mtd_uboot.c
@@ -7,6 +7,7 @@
 #include <env.h>
 #include <dm/device.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <mtd.h>
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 592f58dcd3..5621c3fd26 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -10,6 +10,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 838c288318..f8d3f4d246 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -9,6 +9,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index fd8d8e5ea7..56acdbf65b 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -9,6 +9,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index f3d05e6757..133670cb19 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)	"nand-bbt: " fmt
 
 #include <common.h>
+#include <dm/devres.h>
 #include <linux/mtd/nand.h>
 #ifndef __UBOOT__
 #include <linux/slab.h>
diff --git a/drivers/mtd/nand/raw/atmel_nand.c b/drivers/mtd/nand/raw/atmel_nand.c
index 31ad2cfa88..3526585349 100644
--- a/drivers/mtd/nand/raw/atmel_nand.c
+++ b/drivers/mtd/nand/raw/atmel_nand.c
@@ -13,6 +13,7 @@
 #include <common.h>
 #include <asm/gpio.h>
 #include <asm/arch/gpio.h>
+#include <dm/devres.h>
 
 #include <malloc.h>
 #include <nand.h>
diff --git a/drivers/mtd/nand/raw/brcmnand/bcm63158_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm63158_nand.c
index 16b0d4440a..ea7c65a1f6 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm63158_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm63158_nand.c
@@ -4,6 +4,7 @@
 #include <asm/io.h>
 #include <memalign.h>
 #include <nand.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
diff --git a/drivers/mtd/nand/raw/brcmnand/bcm6838_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm6838_nand.c
index ece944485c..3a136155dd 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm6838_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm6838_nand.c
@@ -4,6 +4,7 @@
 #include <asm/io.h>
 #include <memalign.h>
 #include <nand.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
diff --git a/drivers/mtd/nand/raw/brcmnand/bcm6858_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm6858_nand.c
index 3586baa4fa..6aca011db2 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm6858_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm6858_nand.c
@@ -4,6 +4,7 @@
 #include <asm/io.h>
 #include <memalign.h>
 #include <nand.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0745929253..d3e39661e1 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -17,6 +17,8 @@
 #include <memalign.h>
 #include <nand.h>
 #include <clk.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <linux/ioport.h>
 #include <linux/completion.h>
 #include <linux/errno.h>
diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand_compat.c b/drivers/mtd/nand/raw/brcmnand/brcmnand_compat.c
index 883948355c..bb8aea2d01 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand_compat.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand_compat.c
@@ -2,6 +2,7 @@
 
 #include <common.h>
 #include "brcmnand_compat.h"
+#include <dm/devres.h>
 
 static char *devm_kvasprintf(struct udevice *dev, gfp_t gfp, const char *fmt,
 			     va_list ap)
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index f0b528485c..0bd7eb7f1f 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -8,8 +8,10 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <nand.h>
+#include <dm/devres.h>
 #include <linux/bitfield.h>
 #include <linux/dma-direction.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index cbf689af63..0c1bd7b474 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -11,6 +11,7 @@
 #include <command.h>
 #include <malloc.h>
 #include <nand.h>
+#include <dm/devres.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index e2419e18a9..cf20238782 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -10,6 +10,7 @@
 #include <command.h>
 #include <malloc.h>
 #include <nand.h>
+#include <dm/devres.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
diff --git a/drivers/mtd/nand/raw/mxs_nand_spl.c b/drivers/mtd/nand/raw/mxs_nand_spl.c
index 975a91a37d..a653dfa5ed 100644
--- a/drivers/mtd/nand/raw/mxs_nand_spl.c
+++ b/drivers/mtd/nand/raw/mxs_nand_spl.c
@@ -7,6 +7,7 @@
 #include <nand.h>
 #include <malloc.h>
 #include <mxs_nand.h>
+#include <linux/err.h>
 
 static struct mtd_info *mtd;
 static struct nand_chip nand_chip;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index aba8ac019d..49d5e261b5 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -34,6 +34,7 @@
 #endif
 #include <malloc.h>
 #include <watchdog.h>
+#include <dm/devres.h>
 #include <linux/err.h>
 #include <linux/compat.h>
 #include <linux/mtd/mtd.h>
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index ba785c5d53..a6e6e0ef6d 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -59,6 +59,7 @@
 
 #include <common.h>
 #include <malloc.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/bbm.h>
diff --git a/drivers/mtd/nand/raw/nand_bch.c b/drivers/mtd/nand/raw/nand_bch.c
index afa0418168..11a22e021d 100644
--- a/drivers/mtd/nand/raw/nand_bch.c
+++ b/drivers/mtd/nand/raw/nand_bch.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <dm/devres.h>
 /*#include <asm/io.h>*/
 #include <linux/types.h>
 
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index c0545a4fb1..e6aa790391 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -9,6 +9,7 @@
  *
  */
 #include <common.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/mtd/rawnand.h>
 
diff --git a/drivers/mtd/nand/raw/nand_util.c b/drivers/mtd/nand/raw/nand_util.c
index fc2235c1a0..f3c8f7f2cb 100644
--- a/drivers/mtd/nand/raw/nand_util.c
+++ b/drivers/mtd/nand/raw/nand_util.c
@@ -24,6 +24,7 @@
 #include <malloc.h>
 #include <memalign.h>
 #include <div64.h>
+#include <dm/devres.h>
 
 #include <linux/errno.h>
 #include <linux/mtd/mtd.h>
diff --git a/drivers/mtd/nand/raw/pxa3xx_nand.c b/drivers/mtd/nand/raw/pxa3xx_nand.c
index 4d2712df4c..e179a780db 100644
--- a/drivers/mtd/nand/raw/pxa3xx_nand.c
+++ b/drivers/mtd/nand/raw/pxa3xx_nand.c
@@ -10,6 +10,8 @@
 #include <malloc.h>
 #include <fdtdec.h>
 #include <nand.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <asm/io.h>
 #include <asm/arch/cpu.h>
diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index f3179cc21f..1c212daa1d 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -9,6 +9,7 @@
 #include <dm.h>
 #include <nand.h>
 #include <reset.h>
+#include <linux/err.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 
diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3ccb168d13..cd5c31e76b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -28,6 +28,8 @@
 #include <fdtdec.h>
 #include <memalign.h>
 #include <nand.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 
 #include <linux/kernel.h>
 #include <linux/mtd/mtd.h>
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fba8cc056a..d976c19b7a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -24,6 +24,7 @@
 #include <errno.h>
 #include <spi.h>
 #include <spi-mem.h>
+#include <dm/devres.h>
 #include <linux/mtd/spinand.h>
 #endif
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 371e2ecaa7..693bb78b87 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -21,6 +21,7 @@
 
 #include <common.h>
 #include <watchdog.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <linux/mtd/mtd.h>
 #include "linux/mtd/flashchip.h"
diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 6e7fc2311e..277ec68bce 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <dm/devres.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/log2.h>
diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 19defd8831..f02a06fc35 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -70,6 +70,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 42c5270c7f..7de65bc7c3 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -17,6 +17,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/stringify.h>
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index f3d348da83..aec2613a09 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -10,6 +10,7 @@
 #include "ubi.h"
 #ifndef __UBOOT__
 #include <linux/debugfs.h>
+#include <linux/err.h>
 #include <linux/uaccess.h>
 #include <linux/module.h>
 #endif
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0c8b998e7e..8428278e21 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -29,6 +29,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <u-boot/crc.h>
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 646c778e87..a3f5e3e1a9 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -7,7 +7,9 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
+#include <linux/err.h>
 #include <u-boot/crc.h>
 #else
 #include <div64.h>
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 608dede492..8ba22d8142 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -74,6 +74,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
 #include <linux/err.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index bcea71b1b2..41680cdad1 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -8,6 +8,7 @@
 /* This file mostly implements UBI kernel API functions */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/namei.h>
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index a2ff1b5769..2114abbe7c 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -11,6 +11,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/export.h>
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 9c46ef6695..123c2f344d 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -46,6 +46,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
 #include <linux/err.h>
 #include <linux/slab.h>
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 89ca90feb3..4038b7f04e 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -86,6 +86,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/freezer.h>
diff --git a/drivers/net/designware.c b/drivers/net/designware.c
index 19fc34f771..aa33fd511b 100644
--- a/drivers/net/designware.c
+++ b/drivers/net/designware.c
@@ -17,6 +17,7 @@
 #include <malloc.h>
 #include <pci.h>
 #include <reset.h>
+#include <dm/devres.h>
 #include <linux/compiler.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
diff --git a/drivers/net/dwmac_socfpga.c b/drivers/net/dwmac_socfpga.c
index b7bf5dbe69..66a5f95112 100644
--- a/drivers/net/dwmac_socfpga.c
+++ b/drivers/net/dwmac_socfpga.c
@@ -14,6 +14,7 @@
 #include <reset.h>
 #include <syscon.h>
 #include "designware.h"
+#include <linux/err.h>
 
 #include <asm/arch/system_manager.h>
 
diff --git a/drivers/net/mvneta.c b/drivers/net/mvneta.c
index 5fe8500199..505fabd3fa 100644
--- a/drivers/net/mvneta.c
+++ b/drivers/net/mvneta.c
@@ -20,6 +20,7 @@
 #include <config.h>
 #include <malloc.h>
 #include <asm/io.h>
+#include <dm/devres.h>
 #include <linux/errno.h>
 #include <phy.h>
 #include <miiphy.h>
diff --git a/drivers/net/mvpp2.c b/drivers/net/mvpp2.c
index 917d06b6e0..d120278ab1 100644
--- a/drivers/net/mvpp2.c
+++ b/drivers/net/mvpp2.c
@@ -17,12 +17,14 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <net.h>
 #include <netdev.h>
 #include <config.h>
 #include <malloc.h>
 #include <asm/io.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <phy.h>
 #include <miiphy.h>
diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index a43793cd42..08935d9c15 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -5,6 +5,7 @@
  */
 #include <common.h>
 #include <phy.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <malloc.h>
 
diff --git a/drivers/net/sni_ave.c b/drivers/net/sni_ave.c
index 6d333e24ee..64e92abb03 100644
--- a/drivers/net/sni_ave.c
+++ b/drivers/net/sni_ave.c
@@ -8,6 +8,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <fdt_support.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <miiphy.h>
diff --git a/drivers/net/zynq_gem.c b/drivers/net/zynq_gem.c
index 78f94148b4..3cf6570fc2 100644
--- a/drivers/net/zynq_gem.c
+++ b/drivers/net/zynq_gem.c
@@ -25,6 +25,7 @@
 #include <asm/system.h>
 #include <asm/arch/hardware.h>
 #include <asm/arch/sys_proto.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 
 /* Bit/mask specification */
diff --git a/drivers/pci/pcie_dw_ti.c b/drivers/pci/pcie_dw_ti.c
index b37fc2de7f..199a3bb50a 100644
--- a/drivers/pci/pcie_dw_ti.c
+++ b/drivers/pci/pcie_dw_ti.c
@@ -12,6 +12,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm-generic/gpio.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/pci/pcie_mediatek.c b/drivers/pci/pcie_mediatek.c
index a0dcb258b0..1271227c6a 100644
--- a/drivers/pci/pcie_mediatek.c
+++ b/drivers/pci/pcie_mediatek.c
@@ -14,6 +14,7 @@
 #include <pci.h>
 #include <reset.h>
 #include <asm/io.h>
+#include <dm/devres.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
 
diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 5e8f87717f..f4ad4c3cc3 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -21,6 +21,7 @@
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/cpu.h>
+#include <linux/err.h>
 
 #define REG_ISCR			0x00
 #define REG_PHYCTL_A10			0x04
diff --git a/drivers/phy/marvell/comphy_core.c b/drivers/phy/marvell/comphy_core.c
index 9c24692629..d52f42df84 100644
--- a/drivers/phy/marvell/comphy_core.c
+++ b/drivers/phy/marvell/comphy_core.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <dm.h>
 #include <fdtdec.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <asm/io.h>
 
diff --git a/drivers/phy/omap-usb2-phy.c b/drivers/phy/omap-usb2-phy.c
index be3bb0d367..321569e4c0 100644
--- a/drivers/phy/omap-usb2-phy.c
+++ b/drivers/phy/omap-usb2-phy.c
@@ -13,6 +13,7 @@
 #include <generic-phy.h>
 #include <regmap.h>
 #include <syscon.h>
+#include <linux/err.h>
 
 #define OMAP_USB2_CALIBRATE_FALSE_DISCONNECT	BIT(0)
 
diff --git a/drivers/phy/phy-mtk-tphy.c b/drivers/phy/phy-mtk-tphy.c
index 3701481256..31345764a7 100644
--- a/drivers/phy/phy-mtk-tphy.c
+++ b/drivers/phy/phy-mtk-tphy.c
@@ -11,6 +11,7 @@
 #include <generic-phy.h>
 #include <mapmem.h>
 #include <asm/io.h>
+#include <dm/devres.h>
 
 #include <dt-bindings/phy/phy.h>
 
diff --git a/drivers/phy/phy-ti-am654.c b/drivers/phy/phy-ti-am654.c
index 39490124ea..1c7db0dd0f 100644
--- a/drivers/phy/phy-ti-am654.c
+++ b/drivers/phy/phy-ti-am654.c
@@ -18,6 +18,7 @@
 #include <power-domain.h>
 #include <regmap.h>
 #include <syscon.h>
+#include <linux/err.h>
 
 #define CMU_R07C		0x7c
 #define CMU_MASTER_CDN_O	BIT(24)
diff --git a/drivers/phy/ti-pipe3-phy.c b/drivers/phy/ti-pipe3-phy.c
index 0c59552bb8..7fc36319cb 100644
--- a/drivers/phy/ti-pipe3-phy.c
+++ b/drivers/phy/ti-pipe3-phy.c
@@ -12,6 +12,7 @@
 #include <asm/arch/sys_proto.h>
 #include <syscon.h>
 #include <regmap.h>
+#include <linux/err.h>
 
 /* PLLCTRL Registers */
 #define PLL_STATUS              0x00000004
diff --git a/drivers/pinctrl/intel/pinctrl.c b/drivers/pinctrl/intel/pinctrl.c
index 4875a3b0b5..c4287ec406 100644
--- a/drivers/pinctrl/intel/pinctrl.c
+++ b/drivers/pinctrl/intel/pinctrl.c
@@ -28,6 +28,7 @@
 #include <asm/arch/itss.h>
 #include <dm/device-internal.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <linux/err.h>
 
 #define GPIO_DW_SIZE(x)			(sizeof(u32) * (x))
 #define PAD_CFG_OFFSET(x, dw_num)	((x) + GPIO_DW_SIZE(dw_num))
diff --git a/drivers/pinctrl/mscc/mscc-common.c b/drivers/pinctrl/mscc/mscc-common.c
index bd3e6ea328..2d76c41dea 100644
--- a/drivers/pinctrl/mscc/mscc-common.c
+++ b/drivers/pinctrl/mscc/mscc-common.c
@@ -14,6 +14,7 @@
 #include <config.h>
 #include <dm.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <dm/pinctrl.h>
 #include <dm/root.h>
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index f197f4a142..da1f091aec 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -20,6 +20,7 @@
 #include <config.h>
 #include <dm.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <dm/pinctrl.h>
 #include <dm/root.h>
diff --git a/drivers/pinctrl/nxp/pinctrl-imx.c b/drivers/pinctrl/nxp/pinctrl-imx.c
index 69c4144365..77a8a53202 100644
--- a/drivers/pinctrl/nxp/pinctrl-imx.c
+++ b/drivers/pinctrl/nxp/pinctrl-imx.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <mapmem.h>
+#include <dm/devres.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <dm.h>
diff --git a/drivers/pinctrl/nxp/pinctrl-mxs.c b/drivers/pinctrl/nxp/pinctrl-mxs.c
index 6f6ca84674..5147bdc3cc 100644
--- a/drivers/pinctrl/nxp/pinctrl-mxs.c
+++ b/drivers/pinctrl/nxp/pinctrl-mxs.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <dm/devres.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <dm.h>
diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 3a235ae5a7..e0380c349a 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -6,6 +6,7 @@
 #include <asm/io.h>
 #include <dm/lists.h>
 #include <dm/pinctrl.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/pinctrl/renesas/pfc.c b/drivers/pinctrl/renesas/pfc.c
index 5ec560ec0f..5ee11615de 100644
--- a/drivers/pinctrl/renesas/pfc.c
+++ b/drivers/pinctrl/renesas/pfc.c
@@ -14,6 +14,7 @@
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
+#include <dm/devres.h>
 #include <dm/pinctrl.h>
 #include <linux/io.h>
 #include <linux/sizes.h>
diff --git a/drivers/power/domain/meson-ee-pwrc.c b/drivers/power/domain/meson-ee-pwrc.c
index 7f5d13e872..aa11866591 100644
--- a/drivers/power/domain/meson-ee-pwrc.c
+++ b/drivers/power/domain/meson-ee-pwrc.c
@@ -13,6 +13,7 @@
 #include <clk.h>
 #include <dt-bindings/power/meson-g12a-power.h>
 #include <dt-bindings/power/meson-sm1-power.h>
+#include <linux/err.h>
 
 /* AO Offsets */
 
diff --git a/drivers/power/domain/meson-gx-pwrc-vpu.c b/drivers/power/domain/meson-gx-pwrc-vpu.c
index bd69aea8dd..02f73548d6 100644
--- a/drivers/power/domain/meson-gx-pwrc-vpu.c
+++ b/drivers/power/domain/meson-gx-pwrc-vpu.c
@@ -13,6 +13,7 @@
 #include <syscon.h>
 #include <reset.h>
 #include <clk.h>
+#include <linux/err.h>
 
 enum {
 	VPU_PWRC_COMPATIBLE_GX		= 0,
diff --git a/drivers/power/domain/mtk-power-domain.c b/drivers/power/domain/mtk-power-domain.c
index 992ee51947..5084bff766 100644
--- a/drivers/power/domain/mtk-power-domain.c
+++ b/drivers/power/domain/mtk-power-domain.c
@@ -12,6 +12,7 @@
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm/processor.h>
+#include <linux/err.h>
 #include <linux/iopoll.h>
 
 #include <dt-bindings/power/mt7623-power.h>
diff --git a/drivers/power/domain/ti-sci-power-domain.c b/drivers/power/domain/ti-sci-power-domain.c
index b59af2b13b..3866db589a 100644
--- a/drivers/power/domain/ti-sci-power-domain.c
+++ b/drivers/power/domain/ti-sci-power-domain.c
@@ -12,6 +12,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <power-domain-uclass.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
diff --git a/drivers/power/regulator/pbias_regulator.c b/drivers/power/regulator/pbias_regulator.c
index 88dc9f273a..60255eeab0 100644
--- a/drivers/power/regulator/pbias_regulator.c
+++ b/drivers/power/regulator/pbias_regulator.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <errno.h>
 #include <dm.h>
+#include <linux/err.h>
 #include <power/pmic.h>
 #include <power/regulator.h>
 #include <regmap.h>
diff --git a/drivers/ram/rockchip/dmc-rk3368.c b/drivers/ram/rockchip/dmc-rk3368.c
index 9df8f8f4af..7dcfa2943f 100644
--- a/drivers/ram/rockchip/dmc-rk3368.c
+++ b/drivers/ram/rockchip/dmc-rk3368.c
@@ -18,6 +18,7 @@
 #include <asm/arch-rockchip/ddr_rk3368.h>
 #include <asm/arch-rockchip/sdram.h>
 #include <asm/arch-rockchip/sdram_rk3288.h>
+#include <linux/err.h>
 
 struct dram_info {
 	struct ram_info info;
diff --git a/drivers/remoteproc/rproc-elf-loader.c b/drivers/remoteproc/rproc-elf-loader.c
index 538481241f..b2007fd31d 100644
--- a/drivers/remoteproc/rproc-elf-loader.c
+++ b/drivers/remoteproc/rproc-elf-loader.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <elf.h>
 #include <remoteproc.h>
+#include <linux/err.h>
 
 /**
  * struct resource_table - firmware resource table header
diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index c25488f54d..80e8dffdbb 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -12,6 +12,7 @@
 #include <reset.h>
 #include <syscon.h>
 #include <asm/io.h>
+#include <linux/err.h>
 
 #define RCC_GCR_HOLD_BOOT	0
 #define RCC_GCR_RELEASE_BOOT	1
diff --git a/drivers/remoteproc/ti_k3_arm64_rproc.c b/drivers/remoteproc/ti_k3_arm64_rproc.c
index 3e35293514..d048cf4161 100644
--- a/drivers/remoteproc/ti_k3_arm64_rproc.c
+++ b/drivers/remoteproc/ti_k3_arm64_rproc.c
@@ -15,6 +15,7 @@
 #include <reset.h>
 #include <asm/io.h>
 #include <power-domain.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include "ti_sci_proc.h"
 
diff --git a/drivers/remoteproc/ti_k3_dsp_rproc.c b/drivers/remoteproc/ti_k3_dsp_rproc.c
index c5dc6b25da..913aca36d6 100644
--- a/drivers/remoteproc/ti_k3_dsp_rproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_rproc.c
@@ -15,6 +15,7 @@
 #include <reset.h>
 #include <asm/io.h>
 #include <power-domain.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include "ti_sci_proc.h"
 
diff --git a/drivers/remoteproc/ti_k3_r5f_rproc.c b/drivers/remoteproc/ti_k3_r5f_rproc.c
index ae1e4b9e04..cecfb0ef86 100644
--- a/drivers/remoteproc/ti_k3_r5f_rproc.c
+++ b/drivers/remoteproc/ti_k3_r5f_rproc.c
@@ -13,6 +13,7 @@
 #include <clk.h>
 #include <reset.h>
 #include <asm/io.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include "ti_sci_proc.h"
diff --git a/drivers/reset/reset-mediatek.c b/drivers/reset/reset-mediatek.c
index cfbf2af863..4684cbfb6a 100644
--- a/drivers/reset/reset-mediatek.c
+++ b/drivers/reset/reset-mediatek.c
@@ -12,6 +12,7 @@
 #include <regmap.h>
 #include <reset-uclass.h>
 #include <syscon.h>
+#include <linux/err.h>
 
 struct mediatek_reset_priv {
 	struct regmap *regmap;
diff --git a/drivers/reset/reset-ti-sci.c b/drivers/reset/reset-ti-sci.c
index 7b6f736f5e..99e3d9ad5c 100644
--- a/drivers/reset/reset-ti-sci.c
+++ b/drivers/reset/reset-ti-sci.c
@@ -12,6 +12,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <reset-uclass.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
 /**
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index bf1cba4124..8e6c0a4fd0 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -8,6 +8,7 @@
 #include <fdtdec.h>
 #include <reset.h>
 #include <reset-uclass.h>
+#include <dm/devres.h>
 
 static inline struct reset_ops *reset_dev_ops(struct udevice *dev)
 {
diff --git a/drivers/serial/ns16550.c b/drivers/serial/ns16550.c
index 754b6e9921..3faf2cd4b9 100644
--- a/drivers/serial/ns16550.c
+++ b/drivers/serial/ns16550.c
@@ -12,6 +12,7 @@
 #include <reset.h>
 #include <serial.h>
 #include <watchdog.h>
+#include <linux/err.h>
 #include <linux/types.h>
 #include <asm/io.h>
 
diff --git a/drivers/serial/serial_mtk.c b/drivers/serial/serial_mtk.c
index 18530a4fd1..e63f2306f0 100644
--- a/drivers/serial/serial_mtk.c
+++ b/drivers/serial/serial_mtk.c
@@ -15,6 +15,7 @@
 #include <watchdog.h>
 #include <asm/io.h>
 #include <asm/types.h>
+#include <linux/err.h>
 
 struct mtk_serial_regs {
 	u32 rbr;
@@ -454,4 +455,4 @@ static inline void _debug_uart_putc(int ch)
 
 DEBUG_UART_FUNCS
 
-#endif
\ No newline at end of file
+#endif
diff --git a/drivers/serial/serial_omap.c b/drivers/serial/serial_omap.c
index a31d73766d..4d4d919358 100644
--- a/drivers/serial/serial_omap.c
+++ b/drivers/serial/serial_omap.c
@@ -12,6 +12,7 @@
 #include <ns16550.h>
 #include <serial.h>
 #include <clk.h>
+#include <linux/err.h>
 
 #ifndef CONFIG_SYS_NS16550_CLK
 #define CONFIG_SYS_NS16550_CLK  0
diff --git a/drivers/serial/serial_sifive.c b/drivers/serial/serial_sifive.c
index c142ccdf3d..5a02f0c8fe 100644
--- a/drivers/serial/serial_sifive.c
+++ b/drivers/serial/serial_sifive.c
@@ -13,6 +13,7 @@
 #include <asm/io.h>
 #include <linux/compiler.h>
 #include <serial.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/serial/serial_zynq.c b/drivers/serial/serial_zynq.c
index 7e486a68ff..c07375901b 100644
--- a/drivers/serial/serial_zynq.c
+++ b/drivers/serial/serial_zynq.c
@@ -14,6 +14,7 @@
 #include <asm/io.h>
 #include <linux/compiler.h>
 #include <serial.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/smem/msm_smem.c b/drivers/smem/msm_smem.c
index 9fa653ad28..711ce626aa 100644
--- a/drivers/smem/msm_smem.c
+++ b/drivers/smem/msm_smem.c
@@ -8,9 +8,11 @@
 #include <common.h>
 #include <errno.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/of_access.h>
 #include <dm/of_addr.h>
 #include <asm/io.h>
+#include <linux/err.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
 #include <smem.h>
diff --git a/drivers/soc/ti/k3-navss-ringacc.c b/drivers/soc/ti/k3-navss-ringacc.c
index 64ebc0ba00..2eba1c1d18 100644
--- a/drivers/soc/ti/k3-navss-ringacc.c
+++ b/drivers/soc/ti/k3-navss-ringacc.c
@@ -11,9 +11,11 @@
 #include <asm/dma-mapping.h>
 #include <asm/bitops.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/read.h>
 #include <dm/uclass.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/soc/ti/k3-navss-ringacc.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 7d9a54011d..195ea5fae6 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -15,6 +15,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <fdtdec.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
diff --git a/drivers/spi/cadence_qspi.c b/drivers/spi/cadence_qspi.c
index 8fd23a7702..2425f5ad8e 100644
--- a/drivers/spi/cadence_qspi.c
+++ b/drivers/spi/cadence_qspi.c
@@ -11,6 +11,7 @@
 #include <malloc.h>
 #include <reset.h>
 #include <spi.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include "cadence_qspi.h"
 
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 7788ab9953..c907729b54 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -7,6 +7,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/dmaengine.h>
 #include <linux/pm_runtime.h>
 #include "internals.h"
diff --git a/drivers/spi/ti_qspi.c b/drivers/spi/ti_qspi.c
index c3d9e7f2ee..1fdd0ca448 100644
--- a/drivers/spi/ti_qspi.c
+++ b/drivers/spi/ti_qspi.c
@@ -17,6 +17,7 @@
 #include <asm/omap_gpio.h>
 #include <asm/omap_common.h>
 #include <asm/ti-common/ti-edma3.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <regmap.h>
 #include <syscon.h>
diff --git a/drivers/spi/zynqmp_gqspi.c b/drivers/spi/zynqmp_gqspi.c
index 4cca418012..c05d46e084 100644
--- a/drivers/spi/zynqmp_gqspi.c
+++ b/drivers/spi/zynqmp_gqspi.c
@@ -16,6 +16,7 @@
 #include <spi.h>
 #include <ubi_uboot.h>
 #include <wait_bit.h>
+#include <linux/err.h>
 
 #define GQSPI_GFIFO_STRT_MODE_MASK	BIT(29)
 #define GQSPI_CONFIG_MODE_EN_MASK	(3 << 30)
diff --git a/drivers/sysreset/sysreset-ti-sci.c b/drivers/sysreset/sysreset-ti-sci.c
index 890a607c4b..6caea3aab3 100644
--- a/drivers/sysreset/sysreset-ti-sci.c
+++ b/drivers/sysreset/sysreset-ti-sci.c
@@ -10,6 +10,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <sysreset.h>
+#include <linux/err.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
 /**
diff --git a/drivers/sysreset/sysreset_syscon.c b/drivers/sysreset/sysreset_syscon.c
index d0e586f66f..f64701aab3 100644
--- a/drivers/sysreset/sysreset_syscon.c
+++ b/drivers/sysreset/sysreset_syscon.c
@@ -13,6 +13,7 @@
 #include <regmap.h>
 #include <sysreset.h>
 #include <syscon.h>
+#include <linux/err.h>
 
 struct syscon_reboot_priv {
 	struct regmap *regmap;
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 7f870f2f73..a7b175ee62 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -8,6 +8,7 @@
 #include <log.h>
 #include <tee.h>
 #include <linux/arm-smccc.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 #include "optee_smc.h"
diff --git a/drivers/timer/ast_timer.c b/drivers/timer/ast_timer.c
index 21ffdbf575..3838601f54 100644
--- a/drivers/timer/ast_timer.c
+++ b/drivers/timer/ast_timer.c
@@ -9,6 +9,7 @@
 #include <timer.h>
 #include <asm/io.h>
 #include <asm/arch/timer.h>
+#include <linux/err.h>
 
 #define AST_TICK_TIMER  1
 #define AST_TMC_RELOAD_VAL  0xffffffff
diff --git a/drivers/timer/cadence-ttc.c b/drivers/timer/cadence-ttc.c
index 75263c5375..ed48a145f2 100644
--- a/drivers/timer/cadence-ttc.c
+++ b/drivers/timer/cadence-ttc.c
@@ -8,6 +8,7 @@
 #include <errno.h>
 #include <timer.h>
 #include <asm/io.h>
+#include <linux/err.h>
 
 #define CNT_CNTRL_RESET		BIT(4)
 
diff --git a/drivers/timer/timer-uclass.c b/drivers/timer/timer-uclass.c
index 97a4c74851..b619200f00 100644
--- a/drivers/timer/timer-uclass.c
+++ b/drivers/timer/timer-uclass.c
@@ -11,6 +11,7 @@
 #include <clk.h>
 #include <errno.h>
 #include <timer.h>
+#include <linux/err.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/ufs/cdns-platform.c b/drivers/ufs/cdns-platform.c
index c80f4253e4..5bd0c1e0c7 100644
--- a/drivers/ufs/cdns-platform.c
+++ b/drivers/ufs/cdns-platform.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include <dm.h>
 #include <ufs.h>
+#include <linux/err.h>
 
 #include "ufs.h"
 
diff --git a/drivers/ufs/ti-j721e-ufs.c b/drivers/ufs/ti-j721e-ufs.c
index 24ec3ebea1..6e4d0cd3ac 100644
--- a/drivers/ufs/ti-j721e-ufs.c
+++ b/drivers/ufs/ti-j721e-ufs.c
@@ -7,6 +7,7 @@
 #include <clk.h>
 #include <common.h>
 #include <dm.h>
+#include <linux/err.h>
 
 #define UFS_SS_CTRL             0x4
 #define UFS_SS_RST_N_PCS        BIT(0)
diff --git a/drivers/ufs/ufs.c b/drivers/ufs/ufs.c
index 23306863d5..512c63a8f2 100644
--- a/drivers/ufs/ufs.c
+++ b/drivers/ufs/ufs.c
@@ -11,6 +11,7 @@
 #include <charset.h>
 #include <common.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <dm/device-internal.h>
 #include <malloc.h>
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 8c8e02169e..6f5e5af47d 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -14,6 +14,7 @@
 #include <common.h>
 #include <dm.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/lists.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 0e02b77965..e095760099 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -57,6 +57,8 @@
  */
 
 #include <dm.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <linux/usb/gadget.h>
 #include <linux/compat.h>
 #include <linux/iopoll.h>
diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 425d9d053d..b44e7df113 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -9,6 +9,7 @@
  *          Pawel Laszczak <pawell@cadence.com>
  */
 #include <dm.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <usb.h>
 #include <usb/xhci.h>
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 77c555e769..cbf21d31dd 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -18,6 +18,8 @@
 #include <malloc.h>
 #include <dwc3-uboot.h>
 #include <asm/dma-mapping.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <linux/ioport.h>
 #include <dm.h>
 #include <generic-phy.h>
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 8b19140182..7ffec12fc5 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -18,6 +18,7 @@
 #include <asm/io.h>
 #include <dm.h>
 #include <dwc3-omap-uboot.h>
+#include <dm/devres.h>
 #include <linux/usb/dwc3-omap.h>
 #include <linux/ioport.h>
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 4353dffb6b..677607ab32 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -17,6 +17,7 @@
 #include <cpu_func.h>
 #include <malloc.h>
 #include <asm/dma-mapping.h>
+#include <dm/devres.h>
 #include <linux/bug.h>
 #include <linux/list.h>
 
diff --git a/drivers/usb/dwc3/ti_usb_phy.c b/drivers/usb/dwc3/ti_usb_phy.c
index e7ea12c163..a90868216a 100644
--- a/drivers/usb/dwc3/ti_usb_phy.c
+++ b/drivers/usb/dwc3/ti_usb_phy.c
@@ -19,6 +19,7 @@
 #include <common.h>
 #include <malloc.h>
 #include <ti-usb-phy-uboot.h>
+#include <dm/devres.h>
 #include <linux/ioport.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
diff --git a/drivers/usb/gadget/at91_udc.c b/drivers/usb/gadget/at91_udc.c
index 2a6626b443..13dec517f6 100644
--- a/drivers/usb/gadget/at91_udc.c
+++ b/drivers/usb/gadget/at91_udc.c
@@ -14,6 +14,8 @@
 #undef	PACKET_TRACE
 
 #include <common.h>
+#include <dm/devres.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 4a6f4271d5..b2b279358e 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -7,6 +7,7 @@
  */
 #undef DEBUG
 
+#include <dm/devres.h>
 #include <linux/bitops.h>
 #include <linux/usb/composite.h>
 
diff --git a/drivers/usb/gadget/dwc2_udc_otg.c b/drivers/usb/gadget/dwc2_udc_otg.c
index 35f4147840..229a61affd 100644
--- a/drivers/usb/gadget/dwc2_udc_otg.c
+++ b/drivers/usb/gadget/dwc2_udc_otg.c
@@ -23,6 +23,7 @@
 #include <generic-phy.h>
 #include <malloc.h>
 #include <reset.h>
+#include <dm/devres.h>
 
 #include <linux/errno.h>
 #include <linux/list.h>
diff --git a/drivers/usb/gadget/f_mass_storage.c b/drivers/usb/gadget/f_mass_storage.c
index c1e6506659..5250fc8b26 100644
--- a/drivers/usb/gadget/f_mass_storage.c
+++ b/drivers/usb/gadget/f_mass_storage.c
@@ -245,6 +245,7 @@
 #include <common.h>
 #include <console.h>
 #include <g_dnl.h>
+#include <dm/devres.h>
 
 #include <linux/err.h>
 #include <linux/usb/ch9.h>
diff --git a/drivers/usb/gadget/pxa25x_udc.c b/drivers/usb/gadget/pxa25x_udc.c
index 09c0a30b2b..6e1e57f9fd 100644
--- a/drivers/usb/gadget/pxa25x_udc.c
+++ b/drivers/usb/gadget/pxa25x_udc.c
@@ -22,6 +22,7 @@
 #include <asm/system.h>
 #include <asm/mach-types.h>
 #include <asm/unaligned.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <malloc.h>
 #include <asm/io.h>
diff --git a/drivers/usb/gadget/udc/udc-core.c b/drivers/usb/gadget/udc/udc-core.c
index 8d1d90e3e3..52384b9afb 100644
--- a/drivers/usb/gadget/udc/udc-core.c
+++ b/drivers/usb/gadget/udc/udc-core.c
@@ -13,6 +13,7 @@
  *		       usb_
  */
 
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <malloc.h>
 #include <asm/cache.h>
diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 682a070306..80ac876d89 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <clk.h>
+#include <dm/devres.h>
 #include <dm/ofnode.h>
 #include <generic-phy.h>
 #include <reset.h>
diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 233df57b4d..29a702052e 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -7,6 +7,7 @@
 #include <asm/io.h>
 #include <clk.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/ofnode.h>
 #include <generic-phy.h>
 #include <reset.h>
diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
index 916ea0b955..7b6ec51704 100644
--- a/drivers/usb/host/ohci-generic.c
+++ b/drivers/usb/host/ohci-generic.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
+#include <dm/devres.h>
 #include <dm/ofnode.h>
 #include <generic-phy.h>
 #include <reset.h>
diff --git a/drivers/usb/musb-new/am35x.c b/drivers/usb/musb-new/am35x.c
index bda099c63f..58cde22615 100644
--- a/drivers/usb/musb-new/am35x.c
+++ b/drivers/usb/musb-new/am35x.c
@@ -12,6 +12,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
diff --git a/drivers/usb/musb-new/musb_core.c b/drivers/usb/musb-new/musb_core.c
index ab5e3aa9d1..cc6e0a71c9 100644
--- a/drivers/usb/musb-new/musb_core.c
+++ b/drivers/usb/musb-new/musb_core.c
@@ -65,6 +65,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
diff --git a/drivers/usb/musb-new/musb_dsps.c b/drivers/usb/musb-new/musb_dsps.c
index 0c794b310a..d342eeba80 100644
--- a/drivers/usb/musb-new/musb_dsps.c
+++ b/drivers/usb/musb-new/musb_dsps.c
@@ -15,6 +15,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/err.h>
diff --git a/drivers/usb/musb-new/musb_gadget.c b/drivers/usb/musb-new/musb_gadget.c
index b35d33ffed..74b645715d 100644
--- a/drivers/usb/musb-new/musb_gadget.c
+++ b/drivers/usb/musb-new/musb_gadget.c
@@ -9,6 +9,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/timer.h>
diff --git a/drivers/usb/musb-new/musb_host.c b/drivers/usb/musb-new/musb_host.c
index 8e92ade471..55ad8ead70 100644
--- a/drivers/usb/musb-new/musb_host.c
+++ b/drivers/usb/musb-new/musb_host.c
@@ -9,6 +9,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
diff --git a/drivers/usb/musb-new/musb_uboot.c b/drivers/usb/musb-new/musb_uboot.c
index 9eb593402e..f4d0e1fdc2 100644
--- a/drivers/usb/musb-new/musb_uboot.c
+++ b/drivers/usb/musb-new/musb_uboot.c
@@ -1,6 +1,7 @@
 #include <common.h>
 #include <console.h>
 #include <watchdog.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
diff --git a/drivers/usb/musb-new/omap2430.c b/drivers/usb/musb-new/omap2430.c
index 05059ce3cb..8a45b05613 100644
--- a/drivers/usb/musb-new/omap2430.c
+++ b/drivers/usb/musb-new/omap2430.c
@@ -13,6 +13,7 @@
 #include <serial.h>
 #include <dm/device-internal.h>
 #include <dm/lists.h>
+#include <linux/err.h>
 #include <linux/usb/otg.h>
 #include <asm/omap_common.h>
 #include <asm/omap_musb.h>
diff --git a/drivers/video/exynos/exynos_mipi_dsi.c b/drivers/video/exynos/exynos_mipi_dsi.c
index 74a66e83d2..ad5ef93e01 100644
--- a/drivers/video/exynos/exynos_mipi_dsi.c
+++ b/drivers/video/exynos/exynos_mipi_dsi.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include <malloc.h>
 #include <fdtdec.h>
+#include <dm/devres.h>
 #include <linux/libfdt.h>
 #include <linux/compat.h>
 #include <linux/err.h>
diff --git a/drivers/video/mipi_dsi.c b/drivers/video/mipi_dsi.c
index cdc3ef58ab..ecacea1dbe 100644
--- a/drivers/video/mipi_dsi.c
+++ b/drivers/video/mipi_dsi.c
@@ -38,6 +38,7 @@
 #include <dm.h>
 #include <mipi_display.h>
 #include <mipi_dsi.h>
+#include <dm/devres.h>
 
 /**
  * DOC: dsi helpers
diff --git a/drivers/video/rockchip/rk3288_mipi.c b/drivers/video/rockchip/rk3288_mipi.c
index 7c4a4cc53b..a6c222bcd9 100644
--- a/drivers/video/rockchip/rk3288_mipi.c
+++ b/drivers/video/rockchip/rk3288_mipi.c
@@ -16,6 +16,7 @@
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3288.h>
diff --git a/drivers/video/rockchip/rk3399_mipi.c b/drivers/video/rockchip/rk3399_mipi.c
index a93b73400b..7c696bc1ea 100644
--- a/drivers/video/rockchip/rk3399_mipi.c
+++ b/drivers/video/rockchip/rk3399_mipi.c
@@ -16,6 +16,7 @@
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <asm/arch-rockchip/clock.h>
 #include <asm/arch-rockchip/cru_rk3399.h>
diff --git a/drivers/video/rockchip/rk_vop.c b/drivers/video/rockchip/rk_vop.c
index b56c3f336c..e91d4dfa7f 100644
--- a/drivers/video/rockchip/rk_vop.c
+++ b/drivers/video/rockchip/rk_vop.c
@@ -19,6 +19,7 @@
 #include <asm/arch-rockchip/vop_rk3288.h>
 #include <dm/device-internal.h>
 #include <dm/uclass-internal.h>
+#include <linux/err.h>
 #include <power/regulator.h>
 #include "rk_vop.h"
 
diff --git a/drivers/video/tegra124/sor.c b/drivers/video/tegra124/sor.c
index 172bb14d6c..8dc3df61aa 100644
--- a/drivers/video/tegra124/sor.c
+++ b/drivers/video/tegra124/sor.c
@@ -15,6 +15,7 @@
 #include <asm/arch-tegra/dc.h>
 #include "displayport.h"
 #include "sor.h"
+#include <linux/err.h>
 
 #define DEBUG_SOR 0
 
diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index a67b354122..60ece133ab 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -13,6 +13,7 @@
 #include <virtio.h>
 #include <virtio_ring.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include "virtio_mmio.h"
 
diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
index 202e5ab1d3..d9be2601bb 100644
--- a/drivers/virtio/virtio_pci_legacy.c
+++ b/drivers/virtio/virtio_pci_legacy.c
@@ -13,6 +13,7 @@
 #include <virtio_ring.h>
 #include <dm/device.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include "virtio_pci.h"
 
diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
index da76aea8d1..4673f4ab55 100644
--- a/drivers/virtio/virtio_pci_modern.c
+++ b/drivers/virtio/virtio_pci_modern.c
@@ -13,6 +13,7 @@
 #include <virtio_ring.h>
 #include <dm/device.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include "virtio_pci.h"
 
diff --git a/drivers/virtio/virtio_sandbox.c b/drivers/virtio/virtio_sandbox.c
index 2addb1ebc5..61f6a96008 100644
--- a/drivers/virtio/virtio_sandbox.c
+++ b/drivers/virtio/virtio_sandbox.c
@@ -11,6 +11,7 @@
 #include <virtio.h>
 #include <virtio_ring.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 struct virtio_sandbox_priv {
diff --git a/drivers/watchdog/ast_wdt.c b/drivers/watchdog/ast_wdt.c
index d344d54aee..fe2f6be5a7 100644
--- a/drivers/watchdog/ast_wdt.c
+++ b/drivers/watchdog/ast_wdt.c
@@ -9,6 +9,7 @@
 #include <wdt.h>
 #include <asm/io.h>
 #include <asm/arch/wdt.h>
+#include <linux/err.h>
 
 #define WDT_AST2500	2500
 #define WDT_AST2400	2400
diff --git a/drivers/watchdog/cdns_wdt.c b/drivers/watchdog/cdns_wdt.c
index 6a608b6371..13952e1e97 100644
--- a/drivers/watchdog/cdns_wdt.c
+++ b/drivers/watchdog/cdns_wdt.c
@@ -11,6 +11,7 @@
 #include <wdt.h>
 #include <clk.h>
 #include <div64.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index f1e781e4e6..ca3ccbe76c 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <watchdog.h>
 #include <wdt.h>
+#include <linux/err.h>
 
 #define WDTLOAD			0x000
 #define WDTCONTROL		0x008
diff --git a/drivers/watchdog/xilinx_tb_wdt.c b/drivers/watchdog/xilinx_tb_wdt.c
index 929c8e60d3..5580764da7 100644
--- a/drivers/watchdog/xilinx_tb_wdt.c
+++ b/drivers/watchdog/xilinx_tb_wdt.c
@@ -11,6 +11,7 @@
 #include <common.h>
 #include <dm.h>
 #include <wdt.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 #define XWT_CSR0_WRS_MASK	0x00000008 /* Reset status Mask */
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 782aa9a250..6835f86fec 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -16,6 +16,7 @@
  */
 
 #include <hexdump.h>
+#include <dm/devres.h>
 
 #ifndef __UBOOT__
 #include <linux/module.h>
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 42f22a487e..f923d07652 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -41,6 +41,7 @@
  * good, and GC takes extra care when moving them.
  */
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/slab.h>
 #include <linux/pagemap.h>
 #include <linux/list_sort.h>
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 7fe94e1093..8148055f67 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -59,6 +59,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
 #include <linux/slab.h>
 #include <u-boot/crc.h>
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 331a891a57..5cbb8aa1b2 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -16,6 +16,7 @@
  */
 
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/err.h>
 #endif
 #include "ubifs.h"
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index c0076bde74..ebfb1d4dd7 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -33,6 +33,7 @@
 
 #include "ubifs.h"
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc16.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 260216205d..aa5956c52e 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -14,6 +14,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc16.h>
 #include <linux/slab.h>
 #include <linux/random.h>
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 5654d45dfb..2740aaee8b 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -12,6 +12,7 @@
 
 #include "ubifs.h"
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <linux/err.h>
 #include <ubi_uboot.h>
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index c807ff1beb..a67b3eec93 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -7,6 +7,7 @@
  * Author: Adrian Hunter
  */
 
+#include <dm/devres.h>
 #include <linux/err.h>
 #include "ubifs.h"
 
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index b568012fec..3388efe2b7 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -36,6 +36,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
 #include <linux/slab.h>
 #include <u-boot/crc.h>
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 4064157f15..3a9fa4130e 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -21,6 +21,7 @@
  */
 
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/compat.h>
 #include <linux/err.h>
 #endif
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 52db611d1c..599e1a35fb 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -16,6 +16,7 @@
 
 #include "ubifs.h"
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/slab.h>
 #include <linux/random.h>
 #include <linux/math64.h>
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 8ff668eec6..876a6ee661 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -17,6 +17,7 @@
 
 #ifdef __UBOOT__
 #include <hexdump.h>
+#include <dm/devres.h>
 #include <linux/err.h>
 #endif
 #include "ubifs.h"
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9939b4404f..b38513660b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -15,6 +15,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 8afc08ad7d..fc6fdaff8d 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -19,6 +19,7 @@
  */
 
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/crc32.h>
 #include <linux/slab.h>
 #include <u-boot/crc.h>
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index b8ea7e9ddb..dfa9e91903 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -16,6 +16,7 @@
  */
 
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/err.h>
 #endif
 #include "ubifs.h"
diff --git a/fs/ubifs/ubifs.c b/fs/ubifs/ubifs.c
index 1ffdfe0d90..388451512a 100644
--- a/fs/ubifs/ubifs.c
+++ b/fs/ubifs/ubifs.c
@@ -16,6 +16,7 @@
 #include <gzip.h>
 #include <memalign.h>
 #include "ubifs.h"
+#include <dm/devres.h>
 #include <u-boot/zlib.h>
 
 #include <linux/compat.h>
diff --git a/fs/yaffs2/yaffs_allocator.c b/fs/yaffs2/yaffs_allocator.c
index 611061fb45..961dc22ef3 100644
--- a/fs/yaffs2/yaffs_allocator.c
+++ b/fs/yaffs2/yaffs_allocator.c
@@ -15,6 +15,7 @@
 #include "yaffs_guts.h"
 #include "yaffs_trace.h"
 #include "yportenv.h"
+#include <dm/devres.h>
 
 /*
  * Each entry in yaffs_tnode_list and yaffs_obj_list hold blocks
diff --git a/fs/yaffs2/yaffs_checkptrw.c b/fs/yaffs2/yaffs_checkptrw.c
index 997a618aee..628f02bb48 100644
--- a/fs/yaffs2/yaffs_checkptrw.c
+++ b/fs/yaffs2/yaffs_checkptrw.c
@@ -13,6 +13,7 @@
 
 #include "yaffs_checkptrw.h"
 #include "yaffs_getblockinfo.h"
+#include <dm/devres.h>
 
 static int yaffs2_checkpt_space_ok(struct yaffs_dev *dev)
 {
diff --git a/fs/yaffs2/yaffs_guts.c b/fs/yaffs2/yaffs_guts.c
index c8b27adda9..e13a73298b 100644
--- a/fs/yaffs2/yaffs_guts.c
+++ b/fs/yaffs2/yaffs_guts.c
@@ -13,6 +13,7 @@
 
 #include "yportenv.h"
 #include "yaffs_trace.h"
+#include <dm/devres.h>
 
 #include "yaffs_guts.h"
 #include "yaffs_getblockinfo.h"
diff --git a/fs/yaffs2/yaffs_summary.c b/fs/yaffs2/yaffs_summary.c
index e9e1b5d857..4f9449a844 100644
--- a/fs/yaffs2/yaffs_summary.c
+++ b/fs/yaffs2/yaffs_summary.c
@@ -28,6 +28,7 @@
 #include "yaffs_nand.h"
 #include "yaffs_getblockinfo.h"
 #include "yaffs_bitmap.h"
+#include <dm/devres.h>
 
 /*
  * The summary is built up in an array of summary tags.
diff --git a/fs/yaffs2/yaffs_yaffs1.c b/fs/yaffs2/yaffs_yaffs1.c
index 357d8f75dd..8c176b982f 100644
--- a/fs/yaffs2/yaffs_yaffs1.c
+++ b/fs/yaffs2/yaffs_yaffs1.c
@@ -18,6 +18,7 @@
 #include "yaffs_getblockinfo.h"
 #include "yaffs_nand.h"
 #include "yaffs_attribs.h"
+#include <dm/devres.h>
 
 int yaffs1_scan(struct yaffs_dev *dev)
 {
diff --git a/fs/yaffs2/yaffs_yaffs2.c b/fs/yaffs2/yaffs_yaffs2.c
index f76dcaeeb1..14d497eb99 100644
--- a/fs/yaffs2/yaffs_yaffs2.c
+++ b/fs/yaffs2/yaffs_yaffs2.c
@@ -21,6 +21,7 @@
 #include "yaffs_verify.h"
 #include "yaffs_attribs.h"
 #include "yaffs_summary.h"
+#include <dm/devres.h>
 
 /*
  * Checkpoints are really no benefit on very small partitions.
diff --git a/fs/yaffs2/yaffsfs.c b/fs/yaffs2/yaffsfs.c
index 47abc6beda..510faaeed1 100644
--- a/fs/yaffs2/yaffsfs.c
+++ b/fs/yaffs2/yaffsfs.c
@@ -17,6 +17,7 @@
 #include "yaffscfg.h"
 #include "yportenv.h"
 #include "yaffs_trace.h"
+#include <dm/devres.h>
 
 #define YAFFSFS_MAX_SYMLINK_DEREFERENCES 5
 
diff --git a/include/dm/device.h b/include/dm/device.h
index 1138a09149..a93fa22d5d 100644
--- a/include/dm/device.h
+++ b/include/dm/device.h
@@ -720,8 +720,6 @@ static inline bool device_is_on_pci_bus(struct udevice *dev)
  */
 int dm_scan_fdt_dev(struct udevice *dev);
 
-#include <dm/devres.h>
-
 /*
  * REVISIT:
  * remove the following after resolving conflicts with <linux/compat.h>
diff --git a/include/dm/devres.h b/include/dm/devres.h
index 9c69196054..17bb1ee8da 100644
--- a/include/dm/devres.h
+++ b/include/dm/devres.h
@@ -11,6 +11,10 @@
 #ifndef _DM_DEVRES_H
 #define _DM_DEVRES_H
 
+#include <linux/compat.h>
+
+struct udevice;
+
 /* device resource management */
 typedef void (*dr_release_t)(struct udevice *dev, void *res);
 typedef int (*dr_match_t)(struct udevice *dev, void *res, void *match_data);
diff --git a/lib/bch.c b/lib/bch.c
index c4fac77d61..86709cc875 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -56,6 +56,7 @@
 #ifndef USE_HOSTCC
 #include <common.h>
 #include <ubi_uboot.h>
+#include <dm/devres.h>
 
 #include <linux/bitops.h>
 #else
diff --git a/lib/crypto/asymmetric_type.c b/lib/crypto/asymmetric_type.c
index e04666c080..7aa55092ac 100644
--- a/lib/crypto/asymmetric_type.c
+++ b/lib/crypto/asymmetric_type.c
@@ -7,6 +7,7 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <keys/asymmetric-subtype.h>
 #include <keys/asymmetric-parser.h>
 #endif
@@ -14,6 +15,7 @@
 #ifdef __UBOOT__
 #include <linux/compat.h>
 #include <linux/ctype.h>
+#include <linux/err.h>
 #include <linux/string.h>
 #else
 #include <linux/seq_file.h>
diff --git a/lib/crypto/pkcs7_parser.c b/lib/crypto/pkcs7_parser.c
index bf9e7e888f..f5dda1179f 100644
--- a/lib/crypto/pkcs7_parser.c
+++ b/lib/crypto/pkcs7_parser.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) "PKCS7: "fmt
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/bitops.h>
 #include <linux/compat.h>
 #endif
diff --git a/lib/crypto/public_key.c b/lib/crypto/public_key.c
index 634377472f..8b4821767a 100644
--- a/lib/crypto/public_key.c
+++ b/lib/crypto/public_key.c
@@ -9,7 +9,9 @@
 
 #define pr_fmt(fmt) "PKEY: "fmt
 #ifdef __UBOOT__
+#include <dm/devres.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #else
 #include <linux/module.h>
 #include <linux/export.h>
diff --git a/lib/crypto/x509_cert_parser.c b/lib/crypto/x509_cert_parser.c
index e6d2a426a0..4e41cffd23 100644
--- a/lib/crypto/x509_cert_parser.c
+++ b/lib/crypto/x509_cert_parser.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) "X.509: "fmt
+#include <dm/devres.h>
 #include <linux/kernel.h>
 #ifndef __UBOOT__
 #include <linux/export.h>
diff --git a/lib/crypto/x509_public_key.c b/lib/crypto/x509_public_key.c
index 04bdb672b4..676c0df174 100644
--- a/lib/crypto/x509_public_key.c
+++ b/lib/crypto/x509_public_key.c
@@ -8,7 +8,9 @@
 #define pr_fmt(fmt) "X.509: "fmt
 #ifdef __UBOOT__
 #include <common.h>
+#include <dm/devres.h>
 #include <linux/compat.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #else
 #include <linux/module.h>
diff --git a/lib/list_sort.c b/lib/list_sort.c
index e841da53ee..beb7273fd3 100644
--- a/lib/list_sort.c
+++ b/lib/list_sort.c
@@ -1,4 +1,5 @@
 #ifndef __UBOOT__
+#include <dm/devres.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
diff --git a/test/dm/devres.c b/test/dm/devres.c
index e7331897de..cbd0972c9b 100644
--- a/test/dm/devres.c
+++ b/test/dm/devres.c
@@ -10,6 +10,7 @@
 #include <dm.h>
 #include <malloc.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/test.h>
 #include <dm/uclass-internal.h>
 #include <test/ut.h>
diff --git a/test/dm/regmap.c b/test/dm/regmap.c
index 6fd1f20656..b21f66732b 100644
--- a/test/dm/regmap.c
+++ b/test/dm/regmap.c
@@ -10,6 +10,7 @@
 #include <syscon.h>
 #include <asm/test.h>
 #include <dm/test.h>
+#include <linux/err.h>
 #include <test/ut.h>
 
 /* Base test of register maps */
diff --git a/test/dm/syscon.c b/test/dm/syscon.c
index 0ff9da7ec6..f1021f374b 100644
--- a/test/dm/syscon.c
+++ b/test/dm/syscon.c
@@ -9,6 +9,7 @@
 #include <regmap.h>
 #include <asm/test.h>
 #include <dm/test.h>
+#include <linux/err.h>
 #include <test/ut.h>
 
 /* Base test of system controllers */
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index d59c449ce0..64a94a521b 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -12,6 +12,7 @@
 #include <dm/test.h>
 #include <dm/root.h>
 #include <dm/device-internal.h>
+#include <dm/devres.h>
 #include <dm/uclass-internal.h>
 #include <dm/util.h>
 #include <dm/lists.h>
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
