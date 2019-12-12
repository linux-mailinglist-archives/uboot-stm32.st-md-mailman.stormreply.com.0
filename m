Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405D11DF21
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2019 09:09:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D0F5C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2019 08:09:43 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3C2DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 00:49:16 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id v3so851154ioj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2019 16:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAIeEFLzEl6GKeVFI/M9T26yxP7QagMxlp2dD/j+ePs=;
 b=Mi1WvYF3RNtXL/Ds34+utOlOGI82fmsm/hJM5DvhXkH2gy0SdUz5IBFzBxzZhi3LYl
 zolVXMyPMdHO51oVDDIm0ibVGcl/FBUpkVzenrNLEMX/+sAcKFu+/ttEtLTqsq5RQBrr
 jMp+3grsMMRm+BC9qM/5mukexXYWh1Fo2BG8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAIeEFLzEl6GKeVFI/M9T26yxP7QagMxlp2dD/j+ePs=;
 b=pbQ+XCIMfgIensyI0A0fJFlSnC44SOlXanNfEOvDUqC+4GN1rCKaMaEmUGG0jZmgYV
 fZ0MQPqmrLP5197KO+i8vQemcfM8/Eeo2YuHSJ+ag27QqcCRP4zcfWdmUQNA/8QviYQV
 Q2r651gquo9qKVGZR0WtDl9mA3rhifNuyofCfxRbG0vOWrojVq9wNxKNLlE5jC+fr/or
 83DwTnAd3evDyyTu9lASQusNuwMDze8/xO0dkY0dh41MoC49Vmvzc/8t00GHihdiOmga
 Ekih5HO3RQnMlw/6TP66lzzER6Qw2J8YZvfOtzLlkx7Z6eDfNhU0mK2oV2hPB0nF+jlf
 Ny5A==
X-Gm-Message-State: APjAAAXbCAMRSLm9iKmzvFKcnFU4n0W7Ne9PQApC+rMgoJBW0Uhqej3Y
 O20c3GgVlWiH4Jb7Em2QhojJRw==
X-Google-Smtp-Source: APXvYqz7kunnYYa1yOugeD9ZAkwEbXAiHHPjJP5oJWLBb6QF/LEb6A66JJG8vXX30wFL1xbwu/gviQ==
X-Received: by 2002:a02:2404:: with SMTP id f4mr5815073jaa.50.1576111754492;
 Wed, 11 Dec 2019 16:49:14 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 a11sm880194ioc.86.2019.12.11.16.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 16:49:14 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 11 Dec 2019 17:47:49 -0700
Message-Id: <20191211174637.30.Ib56e30aaca2085dc27227e82b20395025365142f@changeid>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191212004755.11091-2-sjg@chromium.org>
References: <20191212004755.11091-2-sjg@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:09:41 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Lukasz Majewski <lukma@denx.de>, Robert Hancock <hancock@sedsystems.ca>,
 York Sun <york.sun@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Kevin Scholz <k-scholz@ti.com>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Stefano Babic <sbabic@denx.de>, Krunal Bhargav <k-bhargav@ti.com>,
 Anup Patel <anup.patel@wdc.com>, Paul Burton <paul.burton@mips.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lukas Auer <lukas.auer@aisec.fraunhofer.de>,
 Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>,
 Udit Agarwal <udit.agarwal@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sumit Garg <sumit.garg@nxp.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Eric Jarrige <eric.jarrige@armadeus.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Alexander Graf <agraf@csgraf.de>, Maxime Ripard <mripard@kernel.org>,
 Vitaly Andrianov <vitalya@ti.com>, Philippe Reynes <tremyfr@yahoo.fr>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Mario Six <mario.six@gdsys.cc>, Suman Anna <s-anna@ti.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Lokesh Vutla <lokeshvutla@ti.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Pankaj Bansal <pankaj.bansal@nxp.com>, Minkyu Kang <mk7.kang@samsung.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Thomas Chou <thomas@wytron.com.tw>,
 Dirk Eibach <dirk.eibach@gdsys.cc>, Vikas Manocha <vikas.manocha@st.com>,
 Wolfgang Denk <wd@denx.de>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Levin Du <djw@t-chip.com.cn>, Adam Ford <aford173@gmail.com>,
 Yuantian Tang <andy.tang@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Urja Rannikko <urjaman@gmail.com>,
 Thomas Schaefer <thomas.schaefer@kontron.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Vignesh R <vigneshr@ti.com>,
 Rick Chen <rick@andestech.com>, "Cogent Embedded,
 Inc." <source@cogentembedded.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marex@denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Trevor Woerner <trevor@toganlabs.com>,
 Stefan Roese <sr@denx.de>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Tim Harvey <tharvey@gateworks.com>, Hans de Goede <hdegoede@redhat.com>,
 Michal Simek <monstr@monstr.eu>, Vagrant Cascadian <vagrant@debian.org>,
 Keerthy <j-keerthy@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Tom Warren <twarren@nvidia.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 30/35] common: Move hang() to the same header
	as panic()
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

At present panic() is in the vsprintf.h header file. That does not seem
like an obvious choice for hang(), even though it relates to panic(). So
let's put hang() in its own header.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/cpu/arm926ejs/mxs/mxs.c              |  1 +
 arch/arm/cpu/arm926ejs/mxs/spl_power_init.c   |  1 +
 arch/arm/cpu/armv8/cache_v8.c                 |  1 +
 arch/arm/cpu/armv8/fsl-layerscape/cpu.c       |  1 +
 arch/arm/include/asm/armv8/mmu.h              |  1 +
 arch/arm/lib/bootm.c                          |  1 +
 arch/arm/lib/div0.c                           |  4 ++--
 arch/arm/mach-at91/spl.c                      |  1 +
 arch/arm/mach-at91/spl_at91.c                 |  1 +
 arch/arm/mach-at91/spl_atmel.c                |  1 +
 arch/arm/mach-davinci/spl.c                   |  1 +
 arch/arm/mach-imx/mx6/ddr.c                   |  1 +
 arch/arm/mach-imx/spl.c                       |  1 +
 arch/arm/mach-k3/security.c                   |  1 +
 arch/arm/mach-keystone/mon.c                  |  1 +
 arch/arm/mach-mediatek/spl.c                  |  1 +
 arch/arm/mach-mvebu/spl.c                     |  1 +
 arch/arm/mach-omap2/am33xx/clock.c            |  1 +
 arch/arm/mach-omap2/am33xx/fdt.c              |  1 +
 arch/arm/mach-omap2/clocks-common.c           |  1 +
 arch/arm/mach-omap2/emif-common.c             |  1 +
 arch/arm/mach-omap2/omap5/dra7xx_iodelay.c    |  1 +
 arch/arm/mach-omap2/omap5/fdt.c               |  1 +
 arch/arm/mach-omap2/sec-common.c              |  1 +
 arch/arm/mach-rockchip/bootrom.c              |  1 +
 arch/arm/mach-rockchip/rk3188/rk3188.c        |  1 +
 arch/arm/mach-rockchip/spl.c                  |  1 +
 arch/arm/mach-rockchip/tpl.c                  |  1 +
 arch/arm/mach-socfpga/mailbox_s10.c           |  1 +
 arch/arm/mach-socfpga/spl_a10.c               |  1 +
 arch/arm/mach-socfpga/spl_gen5.c              |  1 +
 arch/arm/mach-socfpga/spl_s10.c               |  1 +
 arch/arm/mach-stm32mp/spl.c                   |  1 +
 arch/arm/mach-tegra/cboot.c                   |  1 +
 arch/arm/mach-uniphier/spl_board_init.c       |  1 +
 arch/arm/mach-zynq/spl.c                      |  1 +
 arch/microblaze/cpu/exception.c               |  1 +
 arch/microblaze/lib/bootm.c                   |  1 +
 arch/mips/lib/traps.c                         |  1 +
 arch/mips/mach-ath79/ar934x/clk.c             |  1 +
 arch/mips/mach-jz47xx/jz4780/jz4780.c         |  1 +
 arch/mips/mach-jz47xx/jz4780/sdram.c          |  1 +
 arch/nds32/lib/bootm.c                        |  1 +
 arch/nios2/cpu/traps.c                        |  5 +++--
 arch/powerpc/cpu/mpc8xxx/fsl_lbc.c            |  1 +
 arch/riscv/lib/bootm.c                        |  1 +
 arch/riscv/lib/interrupts.c                   |  1 +
 arch/riscv/lib/reset.c                        |  1 +
 arch/riscv/lib/spl.c                          |  1 +
 arch/sandbox/cpu/spl.c                        |  1 +
 arch/x86/cpu/i386/interrupt.c                 |  1 +
 arch/x86/cpu/quark/mrc_util.c                 |  1 +
 arch/x86/lib/bootm.c                          |  1 +
 arch/x86/lib/spl.c                            |  1 +
 arch/x86/lib/tpl.c                            |  1 +
 board/BuR/brppt2/board.c                      |  1 +
 board/armadeus/apf27/apf27.c                  |  1 +
 board/bosch/shc/mux.c                         |  1 +
 board/compulab/cl-som-imx7/spl.c              |  1 +
 board/compulab/cm_fx6/spl.c                   |  1 +
 board/compulab/cm_t43/spl.c                   |  1 +
 board/firefly/firefly-rk3288/firefly-rk3288.c |  1 +
 board/freescale/imx8mm_evk/spl.c              |  1 +
 board/freescale/imx8mn_evk/spl.c              |  1 +
 board/freescale/imx8mq_evk/spl.c              |  1 +
 board/freescale/ls1012ardb/ls1012ardb.c       |  1 +
 board/freescale/p1_p2_rdb_pc/p1_p2_rdb_pc.c   |  1 +
 board/gateworks/gw_ventana/gw_ventana_spl.c   |  1 +
 board/gdsys/p1022/controlcenterd-id.c         |  1 +
 board/renesas/alt/alt.c                       |  1 +
 board/renesas/condor/condor.c                 |  1 +
 board/renesas/draak/draak.c                   |  1 +
 board/renesas/eagle/eagle.c                   |  1 +
 board/renesas/ebisu/ebisu.c                   |  1 +
 board/renesas/gose/gose.c                     |  1 +
 board/renesas/koelsch/koelsch.c               |  1 +
 board/renesas/lager/lager.c                   |  1 +
 board/renesas/porter/porter.c                 |  1 +
 board/renesas/silk/silk.c                     |  1 +
 board/samsung/common/board.c                  |  1 +
 board/st/stm32mp1/stm32mp1.c                  |  1 +
 board/sunxi/board.c                           |  1 +
 board/technexion/pico-imx6ul/spl.c            |  1 +
 board/ti/ks2_evm/board.c                      |  1 +
 board/ti/ks2_evm/board_k2g.c                  |  1 +
 common/board_f.c                              |  1 +
 common/board_r.c                              |  1 +
 common/bootstage.c                            |  1 +
 common/cli.c                                  |  1 +
 common/spl/spl.c                              |  1 +
 common/spl/spl_opensbi.c                      |  1 +
 drivers/cache/cache-v5l2.c                    |  1 +
 drivers/ddr/altera/sdram_s10.c                |  1 +
 drivers/misc/imx8/scu_api.c                   |  1 +
 drivers/mmc/fsl_esdhc_spl.c                   |  1 +
 drivers/mtd/nand/raw/mxc_nand_spl.c           |  1 +
 drivers/mtd/spi/fsl_espi_spl.c                |  1 +
 drivers/net/fsl_mcdmafec.c                    |  1 +
 drivers/net/mcffec.c                          |  1 +
 drivers/net/mpc8xx_fec.c                      |  1 +
 drivers/ram/k3-j721e/k3-j721e-ddrss.c         |  1 +
 drivers/ram/rockchip/dmc-rk3368.c             |  1 +
 drivers/ram/rockchip/sdram_rk3188.c           |  1 +
 drivers/ram/rockchip/sdram_rk3288.c           |  1 +
 drivers/serial/serial.c                       |  1 +
 drivers/serial/serial_pxa.c                   |  1 +
 drivers/sysreset/sysreset-uclass.c            |  1 +
 drivers/usb/musb/musb_udc.c                   |  1 +
 drivers/usb/phy/rockchip_usb2_phy.c           |  1 +
 drivers/watchdog/imx_watchdog.c               |  1 +
 drivers/watchdog/mtk_wdt.c                    |  1 +
 drivers/watchdog/wdt-uclass.c                 |  1 +
 examples/api/libgenwrap.c                     |  3 ++-
 include/common.h                              |  5 -----
 include/hang.h                                | 22 +++++++++++++++++++
 lib/fdtdec.c                                  |  1 +
 lib/hang.c                                    |  1 +
 lib/libavb/avb_sysdeps_posix.c                |  1 +
 lib/panic.c                                   |  1 +
 lib/zlib/zutil.c                              |  3 ++-
 120 files changed, 145 insertions(+), 11 deletions(-)
 create mode 100644 include/hang.h

diff --git a/arch/arm/cpu/arm926ejs/mxs/mxs.c b/arch/arm/cpu/arm926ejs/mxs/mxs.c
index 62ad8b8c25..23a8aca745 100644
--- a/arch/arm/cpu/arm926ejs/mxs/mxs.c
+++ b/arch/arm/cpu/arm926ejs/mxs/mxs.c
@@ -11,6 +11,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <linux/errno.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
diff --git a/arch/arm/cpu/arm926ejs/mxs/spl_power_init.c b/arch/arm/cpu/arm926ejs/mxs/spl_power_init.c
index 7a1b39844e..7c57cab0b1 100644
--- a/arch/arm/cpu/arm926ejs/mxs/spl_power_init.c
+++ b/arch/arm/cpu/arm926ejs/mxs/spl_power_init.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <config.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 
diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8.c
index c1a08fb4ac..6a5518f9de 100644
--- a/arch/arm/cpu/armv8/cache_v8.c
+++ b/arch/arm/cpu/armv8/cache_v8.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <asm/system.h>
 #include <asm/armv8/mmu.h>
 
diff --git a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
index 7a378d93df..d8326d1147 100644
--- a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
+++ b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
@@ -9,6 +9,7 @@
 #include <env.h>
 #include <fsl_ddr_sdram.h>
 #include <init.h>
+#include <hang.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <linux/errno.h>
diff --git a/arch/arm/include/asm/armv8/mmu.h b/arch/arm/include/asm/armv8/mmu.h
index 4a573208df..fc97c55114 100644
--- a/arch/arm/include/asm/armv8/mmu.h
+++ b/arch/arm/include/asm/armv8/mmu.h
@@ -7,6 +7,7 @@
 #ifndef _ASM_ARMV8_MMU_H_
 #define _ASM_ARMV8_MMU_H_
 
+#include <hang.h>
 #include <linux/const.h>
 
 /*
diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
index 769a64257f..a135bcfc7b 100644
--- a/arch/arm/lib/bootm.c
+++ b/arch/arm/lib/bootm.c
@@ -15,6 +15,7 @@
 #include <command.h>
 #include <cpu_func.h>
 #include <dm.h>
+#include <hang.h>
 #include <dm/root.h>
 #include <env.h>
 #include <image.h>
diff --git a/arch/arm/lib/div0.c b/arch/arm/lib/div0.c
index e185bfe0c6..b91b408f64 100644
--- a/arch/arm/lib/div0.c
+++ b/arch/arm/lib/div0.c
@@ -4,10 +4,10 @@
  * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
  */
 
+#include <hang.h>
+
 /* Replacement (=dummy) for GNU/Linux division-by zero handler */
 void __div0 (void)
 {
-	extern void hang (void);
-
 	hang();
 }
diff --git a/arch/arm/mach-at91/spl.c b/arch/arm/mach-at91/spl.c
index 6da6d41be2..156150c89c 100644
--- a/arch/arm/mach-at91/spl.c
+++ b/arch/arm/mach-at91/spl.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/at91_wdt.h>
diff --git a/arch/arm/mach-at91/spl_at91.c b/arch/arm/mach-at91/spl_at91.c
index 1065f090e0..822f877de7 100644
--- a/arch/arm/mach-at91/spl_at91.c
+++ b/arch/arm/mach-at91/spl_at91.c
@@ -9,6 +9,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/at91sam9_matrix.h>
diff --git a/arch/arm/mach-at91/spl_atmel.c b/arch/arm/mach-at91/spl_atmel.c
index 85290be369..6ee0e1c24c 100644
--- a/arch/arm/mach-at91/spl_atmel.c
+++ b/arch/arm/mach-at91/spl_atmel.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/at91_pit.h>
diff --git a/arch/arm/mach-davinci/spl.c b/arch/arm/mach-davinci/spl.c
index be3daa9bc0..d44e840aa0 100644
--- a/arch/arm/mach-davinci/spl.c
+++ b/arch/arm/mach-davinci/spl.c
@@ -5,6 +5,7 @@
  */
 #include <common.h>
 #include <config.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/u-boot.h>
 #include <asm/utils.h>
diff --git a/arch/arm/mach-imx/mx6/ddr.c b/arch/arm/mach-imx/mx6/ddr.c
index 84b9236249..a1fa613708 100644
--- a/arch/arm/mach-imx/mx6/ddr.c
+++ b/arch/arm/mach-imx/mx6/ddr.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <linux/types.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/mx6-ddr.h>
diff --git a/arch/arm/mach-imx/spl.c b/arch/arm/mach-imx/spl.c
index dde1635a9d..4d869eed30 100644
--- a/arch/arm/mach-imx/spl.c
+++ b/arch/arm/mach-imx/spl.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/sys_proto.h>
diff --git a/arch/arm/mach-k3/security.c b/arch/arm/mach-k3/security.c
index 4e011ee10e..6934e88a96 100644
--- a/arch/arm/mach-k3/security.c
+++ b/arch/arm/mach-k3/security.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <hang.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <mach/spl.h>
 #include <spl.h>
diff --git a/arch/arm/mach-keystone/mon.c b/arch/arm/mach-keystone/mon.c
index cc2ec88505..b7de9ba099 100644
--- a/arch/arm/mach-keystone/mon.c
+++ b/arch/arm/mach-keystone/mon.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2012-2019 Texas Instruments Incorporated - http://www.ti.com/
  */
 
+#include <hang.h>
 #include <asm/unaligned.h>
 #include <common.h>
 #include <command.h>
diff --git a/arch/arm/mach-mediatek/spl.c b/arch/arm/mach-mediatek/spl.c
index 9b3590ff3d..37f1f219b2 100644
--- a/arch/arm/mach-mediatek/spl.c
+++ b/arch/arm/mach-mediatek/spl.c
@@ -6,6 +6,7 @@
 
 #include <clk.h>
 #include <common.h>
+#include <hang.h>
 #include <spl.h>
 
 #include "init.h"
diff --git a/arch/arm/mach-mvebu/spl.c b/arch/arm/mach-mvebu/spl.c
index 3cb27b7f4b..a99bf166fd 100644
--- a/arch/arm/mach-mvebu/spl.c
+++ b/arch/arm/mach-mvebu/spl.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <debug_uart.h>
 #include <fdtdec.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/io.h>
 #include <asm/arch/cpu.h>
diff --git a/arch/arm/mach-omap2/am33xx/clock.c b/arch/arm/mach-omap2/am33xx/clock.c
index 7c666be758..8c61547ee9 100644
--- a/arch/arm/mach-omap2/am33xx/clock.c
+++ b/arch/arm/mach-omap2/am33xx/clock.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2013, Texas Instruments, Incorporated - http://www.ti.com/
  */
 #include <common.h>
+#include <hang.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/hardware.h>
diff --git a/arch/arm/mach-omap2/am33xx/fdt.c b/arch/arm/mach-omap2/am33xx/fdt.c
index 1005a5be96..c81dc808e5 100644
--- a/arch/arm/mach-omap2/am33xx/fdt.c
+++ b/arch/arm/mach-omap2/am33xx/fdt.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <linux/libfdt.h>
 #include <fdt_support.h>
 #include <malloc.h>
diff --git a/arch/arm/mach-omap2/clocks-common.c b/arch/arm/mach-omap2/clocks-common.c
index 5932d694d3..9aff83e9df 100644
--- a/arch/arm/mach-omap2/clocks-common.c
+++ b/arch/arm/mach-omap2/clocks-common.c
@@ -13,6 +13,7 @@
  *	Rajendra Nayak <rnayak@ti.com>
  */
 #include <common.h>
+#include <hang.h>
 #include <i2c.h>
 #include <asm/omap_common.h>
 #include <asm/gpio.h>
diff --git a/arch/arm/mach-omap2/emif-common.c b/arch/arm/mach-omap2/emif-common.c
index bb81063c0f..4658f67e84 100644
--- a/arch/arm/mach-omap2/emif-common.c
+++ b/arch/arm/mach-omap2/emif-common.c
@@ -9,6 +9,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <init.h>
 #include <net.h>
 #include <asm/emif.h>
diff --git a/arch/arm/mach-omap2/omap5/dra7xx_iodelay.c b/arch/arm/mach-omap2/omap5/dra7xx_iodelay.c
index 9eda57c450..598074ba21 100644
--- a/arch/arm/mach-omap2/omap5/dra7xx_iodelay.c
+++ b/arch/arm/mach-omap2/omap5/dra7xx_iodelay.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/utils.h>
 #include <asm/arch/dra7xx_iodelay.h>
 #include <asm/arch/omap.h>
diff --git a/arch/arm/mach-omap2/omap5/fdt.c b/arch/arm/mach-omap2/omap5/fdt.c
index 5ba8806dd7..c4adba31e6 100644
--- a/arch/arm/mach-omap2/omap5/fdt.c
+++ b/arch/arm/mach-omap2/omap5/fdt.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <linux/libfdt.h>
 #include <fdt_support.h>
 #include <malloc.h>
diff --git a/arch/arm/mach-omap2/sec-common.c b/arch/arm/mach-omap2/sec-common.c
index f3df8affa3..28b929f84f 100644
--- a/arch/arm/mach-omap2/sec-common.c
+++ b/arch/arm/mach-omap2/sec-common.c
@@ -14,6 +14,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <init.h>
 #include <stdarg.h>
 
diff --git a/arch/arm/mach-rockchip/bootrom.c b/arch/arm/mach-rockchip/bootrom.c
index 10614c99d9..1524eca272 100644
--- a/arch/arm/mach-rockchip/bootrom.c
+++ b/arch/arm/mach-rockchip/bootrom.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/arch-rockchip/bootrom.h>
 #include <asm/arch-rockchip/boot_mode.h>
 #include <asm/io.h>
diff --git a/arch/arm/mach-rockchip/rk3188/rk3188.c b/arch/arm/mach-rockchip/rk3188/rk3188.c
index 1b012f7f67..61d410d780 100644
--- a/arch/arm/mach-rockchip/rk3188/rk3188.c
+++ b/arch/arm/mach-rockchip/rk3188/rk3188.c
@@ -4,6 +4,7 @@
  */
 #include <common.h>
 #include <dm.h>
+#include <hang.h>
 #include <syscon.h>
 #include <asm/io.h>
 #include <asm/arch-rockchip/bootrom.h>
diff --git a/arch/arm/mach-rockchip/spl.c b/arch/arm/mach-rockchip/spl.c
index 514032a44a..7d0e6fa1af 100644
--- a/arch/arm/mach-rockchip/spl.c
+++ b/arch/arm/mach-rockchip/spl.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <debug_uart.h>
 #include <dm.h>
+#include <hang.h>
 #include <ram.h>
 #include <spl.h>
 #include <asm/arch-rockchip/bootrom.h>
diff --git a/arch/arm/mach-rockchip/tpl.c b/arch/arm/mach-rockchip/tpl.c
index c3734cb070..31a3eb4c28 100644
--- a/arch/arm/mach-rockchip/tpl.c
+++ b/arch/arm/mach-rockchip/tpl.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <debug_uart.h>
 #include <dm.h>
+#include <hang.h>
 #include <ram.h>
 #include <spl.h>
 #include <version.h>
diff --git a/arch/arm/mach-socfpga/mailbox_s10.c b/arch/arm/mach-socfpga/mailbox_s10.c
index 4498ab55df..1fbb732a03 100644
--- a/arch/arm/mach-socfpga/mailbox_s10.c
+++ b/arch/arm/mach-socfpga/mailbox_s10.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <wait_bit.h>
 #include <asm/io.h>
 #include <asm/arch/mailbox_s10.h>
diff --git a/arch/arm/mach-socfpga/spl_a10.c b/arch/arm/mach-socfpga/spl_a10.c
index d36732447b..4679b870b4 100644
--- a/arch/arm/mach-socfpga/spl_a10.c
+++ b/arch/arm/mach-socfpga/spl_a10.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/pl310.h>
 #include <asm/u-boot.h>
diff --git a/arch/arm/mach-socfpga/spl_gen5.c b/arch/arm/mach-socfpga/spl_gen5.c
index 408e409375..9c8c12ddc2 100644
--- a/arch/arm/mach-socfpga/spl_gen5.c
+++ b/arch/arm/mach-socfpga/spl_gen5.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/u-boot.h>
 #include <asm/utils.h>
diff --git a/arch/arm/mach-socfpga/spl_s10.c b/arch/arm/mach-socfpga/spl_s10.c
index ec65e1ce64..c02fa7d518 100644
--- a/arch/arm/mach-socfpga/spl_s10.c
+++ b/arch/arm/mach-socfpga/spl_s10.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/u-boot.h>
 #include <asm/utils.h>
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index a3b0d6f382..ca4231cd0d 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
diff --git a/arch/arm/mach-tegra/cboot.c b/arch/arm/mach-tegra/cboot.c
index 0762144ecf..c5361ca73d 100644
--- a/arch/arm/mach-tegra/cboot.c
+++ b/arch/arm/mach-tegra/cboot.c
@@ -7,6 +7,7 @@
 #include <env.h>
 #include <fdt_support.h>
 #include <fdtdec.h>
+#include <hang.h>
 #include <stdlib.h>
 #include <string.h>
 
diff --git a/arch/arm/mach-uniphier/spl_board_init.c b/arch/arm/mach-uniphier/spl_board_init.c
index d09c91ab42..c7262d70a5 100644
--- a/arch/arm/mach-uniphier/spl_board_init.c
+++ b/arch/arm/mach-uniphier/spl_board_init.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <hang.h>
 #include <spl.h>
 
 #include "init.h"
diff --git a/arch/arm/mach-zynq/spl.c b/arch/arm/mach-zynq/spl.c
index 9b7c0be951..96ba90fb7a 100644
--- a/arch/arm/mach-zynq/spl.c
+++ b/arch/arm/mach-zynq/spl.c
@@ -4,6 +4,7 @@
  */
 #include <common.h>
 #include <debug_uart.h>
+#include <hang.h>
 #include <spl.h>
 
 #include <asm/io.h>
diff --git a/arch/microblaze/cpu/exception.c b/arch/microblaze/cpu/exception.c
index bdcbe08685..b8dedc4e19 100644
--- a/arch/microblaze/cpu/exception.c
+++ b/arch/microblaze/cpu/exception.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/asm.h>
 
 void _hw_exception_handler (void)
diff --git a/arch/microblaze/lib/bootm.c b/arch/microblaze/lib/bootm.c
index efd5acf359..2d6a41be2f 100644
--- a/arch/microblaze/lib/bootm.c
+++ b/arch/microblaze/lib/bootm.c
@@ -12,6 +12,7 @@
 #include <cpu_func.h>
 #include <env.h>
 #include <fdt_support.h>
+#include <hang.h>
 #include <image.h>
 #include <u-boot/zlib.h>
 #include <asm/byteorder.h>
diff --git a/arch/mips/lib/traps.c b/arch/mips/lib/traps.c
index 6fe8ebd16b..b8568c00fe 100644
--- a/arch/mips/lib/traps.c
+++ b/arch/mips/lib/traps.c
@@ -12,6 +12,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <init.h>
 #include <asm/mipsregs.h>
 #include <asm/addrspace.h>
diff --git a/arch/mips/mach-ath79/ar934x/clk.c b/arch/mips/mach-ath79/ar934x/clk.c
index fc4625d62a..09bdc253ae 100644
--- a/arch/mips/mach-ath79/ar934x/clk.c
+++ b/arch/mips/mach-ath79/ar934x/clk.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <clock_legacy.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/addrspace.h>
 #include <asm/types.h>
diff --git a/arch/mips/mach-jz47xx/jz4780/jz4780.c b/arch/mips/mach-jz47xx/jz4780/jz4780.c
index 0ae5e09e01..015840de25 100644
--- a/arch/mips/mach-jz47xx/jz4780/jz4780.c
+++ b/arch/mips/mach-jz47xx/jz4780/jz4780.c
@@ -9,6 +9,7 @@
 #include <config.h>
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <init.h>
 #include <asm/io.h>
 #include <asm/sections.h>
diff --git a/arch/mips/mach-jz47xx/jz4780/sdram.c b/arch/mips/mach-jz47xx/jz4780/sdram.c
index 5b25c8d002..65afefe53e 100644
--- a/arch/mips/mach-jz47xx/jz4780/sdram.c
+++ b/arch/mips/mach-jz47xx/jz4780/sdram.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <mach/jz4780.h>
 #include <mach/jz4780_dram.h>
diff --git a/arch/nds32/lib/bootm.c b/arch/nds32/lib/bootm.c
index a472f6a187..1003bc87b9 100644
--- a/arch/nds32/lib/bootm.c
+++ b/arch/nds32/lib/bootm.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <command.h>
 #include <env.h>
+#include <hang.h>
 #include <image.h>
 #include <u-boot/zlib.h>
 #include <asm/byteorder.h>
diff --git a/arch/nios2/cpu/traps.c b/arch/nios2/cpu/traps.c
index 1c3cc03178..087a05097d 100644
--- a/arch/nios2/cpu/traps.c
+++ b/arch/nios2/cpu/traps.c
@@ -4,8 +4,9 @@
  * Scott McNutt <smcnutt@psyent.com>
  */
 
-#include <asm/ptrace.h>
 #include <common.h>
+#include <hang.h>
+#include <asm/ptrace.h>
 
 void trap_handler (struct pt_regs *regs)
 {
@@ -21,5 +22,5 @@ void soft_emulation (struct pt_regs *regs)
 	 */
 	printf ("\n\n*** ERROR: unimplemented instruction @ %08x\n",
 			regs->reg[29] - 4);
-	hang ();
+	hang();
 }
diff --git a/arch/powerpc/cpu/mpc8xxx/fsl_lbc.c b/arch/powerpc/cpu/mpc8xxx/fsl_lbc.c
index c43732f7c5..afcb75ba17 100644
--- a/arch/powerpc/cpu/mpc8xxx/fsl_lbc.c
+++ b/arch/powerpc/cpu/mpc8xxx/fsl_lbc.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/fsl_lbc.h>
 
 #ifdef CONFIG_MPC83xx
diff --git a/arch/riscv/lib/bootm.c b/arch/riscv/lib/bootm.c
index d1d1573c62..fad16901c5 100644
--- a/arch/riscv/lib/bootm.c
+++ b/arch/riscv/lib/bootm.c
@@ -10,6 +10,7 @@
 #include <command.h>
 #include <dm.h>
 #include <fdt_support.h>
+#include <hang.h>
 #include <dm/root.h>
 #include <image.h>
 #include <asm/byteorder.h>
diff --git a/arch/riscv/lib/interrupts.c b/arch/riscv/lib/interrupts.c
index 3b25c5b7a7..512dce0619 100644
--- a/arch/riscv/lib/interrupts.c
+++ b/arch/riscv/lib/interrupts.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <irq_func.h>
 #include <asm/ptrace.h>
 #include <asm/system.h>
diff --git a/arch/riscv/lib/reset.c b/arch/riscv/lib/reset.c
index b8cecb309d..ce3c1cf872 100644
--- a/arch/riscv/lib/reset.c
+++ b/arch/riscv/lib/reset.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <hang.h>
 
 int do_reset(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
 {
diff --git a/arch/riscv/lib/spl.c b/arch/riscv/lib/spl.c
index dc7577f751..ae07bbe40a 100644
--- a/arch/riscv/lib/spl.c
+++ b/arch/riscv/lib/spl.c
@@ -5,6 +5,7 @@
  */
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/smp.h>
 
diff --git a/arch/sandbox/cpu/spl.c b/arch/sandbox/cpu/spl.c
index 44c68a39bc..d5f683bbaa 100644
--- a/arch/sandbox/cpu/spl.c
+++ b/arch/sandbox/cpu/spl.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <hang.h>
 #include <os.h>
 #include <spl.h>
 #include <asm/spl.h>
diff --git a/arch/x86/cpu/i386/interrupt.c b/arch/x86/cpu/i386/interrupt.c
index 991cf5c56b..70edbe06e4 100644
--- a/arch/x86/cpu/i386/interrupt.c
+++ b/arch/x86/cpu/i386/interrupt.c
@@ -13,6 +13,7 @@
 #include <common.h>
 #include <dm.h>
 #include <efi_loader.h>
+#include <hang.h>
 #include <init.h>
 #include <irq_func.h>
 #include <asm/control_regs.h>
diff --git a/arch/x86/cpu/quark/mrc_util.c b/arch/x86/cpu/quark/mrc_util.c
index 8a68ddba97..b0bc59b71e 100644
--- a/arch/x86/cpu/quark/mrc_util.c
+++ b/arch/x86/cpu/quark/mrc_util.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/arch/device.h>
 #include <asm/arch/mrc.h>
 #include <asm/arch/msg_port.h>
diff --git a/arch/x86/lib/bootm.c b/arch/x86/lib/bootm.c
index 5443a862ab..07d8f1f279 100644
--- a/arch/x86/lib/bootm.c
+++ b/arch/x86/lib/bootm.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <hang.h>
 #include <dm/device.h>
 #include <dm/root.h>
 #include <errno.h>
diff --git a/arch/x86/lib/spl.c b/arch/x86/lib/spl.c
index f0e2bf053d..90baec2a17 100644
--- a/arch/x86/lib/spl.c
+++ b/arch/x86/lib/spl.c
@@ -7,6 +7,7 @@
 #include <cpu_func.h>
 #include <debug_uart.h>
 #include <dm.h>
+#include <hang.h>
 #include <irq_func.h>
 #include <malloc.h>
 #include <spl.h>
diff --git a/arch/x86/lib/tpl.c b/arch/x86/lib/tpl.c
index 784e3a02de..34804b53cc 100644
--- a/arch/x86/lib/tpl.c
+++ b/arch/x86/lib/tpl.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <debug_uart.h>
 #include <dm.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/cpu.h>
 #include <asm/mtrr.h>
diff --git a/board/BuR/brppt2/board.c b/board/BuR/brppt2/board.c
index 590e92b5a0..c91d2f9494 100644
--- a/board/BuR/brppt2/board.c
+++ b/board/BuR/brppt2/board.c
@@ -8,6 +8,7 @@
  */
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <spl.h>
 #include <dm.h>
 #include <miiphy.h>
diff --git a/board/armadeus/apf27/apf27.c b/board/armadeus/apf27/apf27.c
index 75395d92cd..29e0bf388d 100644
--- a/board/armadeus/apf27/apf27.c
+++ b/board/armadeus/apf27/apf27.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <init.h>
 #include <jffs2/jffs2.h>
 #include <nand.h>
diff --git a/board/bosch/shc/mux.c b/board/bosch/shc/mux.c
index b04c5914f0..0a97eafea6 100644
--- a/board/bosch/shc/mux.c
+++ b/board/bosch/shc/mux.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/arch/sys_proto.h>
 #include <asm/arch/hardware.h>
 #include <asm/arch/mux.h>
diff --git a/board/compulab/cl-som-imx7/spl.c b/board/compulab/cl-som-imx7/spl.c
index 6833608a53..360c4df17b 100644
--- a/board/compulab/cl-som-imx7/spl.c
+++ b/board/compulab/cl-som-imx7/spl.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <init.h>
 #include <spl.h>
 #include <fsl_esdhc_imx.h>
diff --git a/board/compulab/cm_fx6/spl.c b/board/compulab/cm_fx6/spl.c
index 1ddf424e42..592d741095 100644
--- a/board/compulab/cm_fx6/spl.c
+++ b/board/compulab/cm_fx6/spl.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <clock_legacy.h>
+#include <hang.h>
 #include <init.h>
 #include <spl.h>
 #include <asm/io.h>
diff --git a/board/compulab/cm_t43/spl.c b/board/compulab/cm_t43/spl.c
index fdab9c3fd1..016c63a509 100644
--- a/board/compulab/cm_t43/spl.c
+++ b/board/compulab/cm_t43/spl.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <init.h>
 #include <spl.h>
 #include <i2c.h>
diff --git a/board/firefly/firefly-rk3288/firefly-rk3288.c b/board/firefly/firefly-rk3288/firefly-rk3288.c
index a3f784f0a3..a2b0eb5a99 100644
--- a/board/firefly/firefly-rk3288/firefly-rk3288.c
+++ b/board/firefly/firefly-rk3288/firefly-rk3288.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 
 #ifdef CONFIG_SPL_BUILD
 static int setup_led(void)
diff --git a/board/freescale/imx8mm_evk/spl.c b/board/freescale/imx8mm_evk/spl.c
index d125dc9317..a26fc96b91 100644
--- a/board/freescale/imx8mm_evk/spl.c
+++ b/board/freescale/imx8mm_evk/spl.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/io.h>
 #include <asm/mach-imx/iomux-v3.h>
diff --git a/board/freescale/imx8mn_evk/spl.c b/board/freescale/imx8mn_evk/spl.c
index 7bc22d905f..7aed14c52b 100644
--- a/board/freescale/imx8mn_evk/spl.c
+++ b/board/freescale/imx8mn_evk/spl.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/io.h>
 #include <asm/mach-imx/iomux-v3.h>
diff --git a/board/freescale/imx8mq_evk/spl.c b/board/freescale/imx8mq_evk/spl.c
index 9164cfb9d8..e442510f44 100644
--- a/board/freescale/imx8mq_evk/spl.c
+++ b/board/freescale/imx8mq_evk/spl.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <errno.h>
 #include <asm/io.h>
diff --git a/board/freescale/ls1012ardb/ls1012ardb.c b/board/freescale/ls1012ardb/ls1012ardb.c
index 90c1824e46..0f665c7bc6 100644
--- a/board/freescale/ls1012ardb/ls1012ardb.c
+++ b/board/freescale/ls1012ardb/ls1012ardb.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <fdt_support.h>
+#include <hang.h>
 #include <i2c.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
diff --git a/board/freescale/p1_p2_rdb_pc/p1_p2_rdb_pc.c b/board/freescale/p1_p2_rdb_pc/p1_p2_rdb_pc.c
index c85243f58b..71fca8ca1e 100644
--- a/board/freescale/p1_p2_rdb_pc/p1_p2_rdb_pc.c
+++ b/board/freescale/p1_p2_rdb_pc/p1_p2_rdb_pc.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <command.h>
 #include <env.h>
+#include <hang.h>
 #include <hwconfig.h>
 #include <init.h>
 #include <pci.h>
diff --git a/board/gateworks/gw_ventana/gw_ventana_spl.c b/board/gateworks/gw_ventana/gw_ventana_spl.c
index b0891379a1..80fec5f9cf 100644
--- a/board/gateworks/gw_ventana/gw_ventana_spl.c
+++ b/board/gateworks/gw_ventana/gw_ventana_spl.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <env.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <asm/arch/crm_regs.h>
 #include <asm/arch/mx6-ddr.h>
diff --git a/board/gdsys/p1022/controlcenterd-id.c b/board/gdsys/p1022/controlcenterd-id.c
index 04d3809566..ad56dd7d01 100644
--- a/board/gdsys/p1022/controlcenterd-id.c
+++ b/board/gdsys/p1022/controlcenterd-id.c
@@ -14,6 +14,7 @@
 #include <command.h>
 #include <dm.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <fs.h>
 #include <i2c.h>
diff --git a/board/renesas/alt/alt.c b/board/renesas/alt/alt.c
index 70c14d9f33..a6d7cb48a2 100644
--- a/board/renesas/alt/alt.c
+++ b/board/renesas/alt/alt.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <dm.h>
 #include <dm/platform_data/serial_sh.h>
diff --git a/board/renesas/condor/condor.c b/board/renesas/condor/condor.c
index 11fbd5b07d..6505beda81 100644
--- a/board/renesas/condor/condor.c
+++ b/board/renesas/condor/condor.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <asm/processor.h>
 #include <asm/mach-types.h>
 #include <asm/io.h>
diff --git a/board/renesas/draak/draak.c b/board/renesas/draak/draak.c
index 7ad21f9812..2f9364c484 100644
--- a/board/renesas/draak/draak.c
+++ b/board/renesas/draak/draak.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <malloc.h>
 #include <netdev.h>
 #include <dm.h>
diff --git a/board/renesas/eagle/eagle.c b/board/renesas/eagle/eagle.c
index d5f40717d4..cf06a173e4 100644
--- a/board/renesas/eagle/eagle.c
+++ b/board/renesas/eagle/eagle.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <malloc.h>
 #include <netdev.h>
 #include <dm.h>
diff --git a/board/renesas/ebisu/ebisu.c b/board/renesas/ebisu/ebisu.c
index b608c61e23..81d7f8eafa 100644
--- a/board/renesas/ebisu/ebisu.c
+++ b/board/renesas/ebisu/ebisu.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <malloc.h>
 #include <netdev.h>
 #include <dm.h>
diff --git a/board/renesas/gose/gose.c b/board/renesas/gose/gose.c
index c137da64b3..eb6ee6f6a4 100644
--- a/board/renesas/gose/gose.c
+++ b/board/renesas/gose/gose.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <dm.h>
 #include <dm/platform_data/serial_sh.h>
diff --git a/board/renesas/koelsch/koelsch.c b/board/renesas/koelsch/koelsch.c
index ff7e458b3c..e09d3d0a63 100644
--- a/board/renesas/koelsch/koelsch.c
+++ b/board/renesas/koelsch/koelsch.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <dm.h>
 #include <dm/platform_data/serial_sh.h>
diff --git a/board/renesas/lager/lager.c b/board/renesas/lager/lager.c
index d6b388fead..9ac9515925 100644
--- a/board/renesas/lager/lager.c
+++ b/board/renesas/lager/lager.c
@@ -11,6 +11,7 @@
 #include <cpu_func.h>
 #include <env.h>
 #include <env_internal.h>
+#include <hang.h>
 #include <malloc.h>
 #include <netdev.h>
 #include <dm.h>
diff --git a/board/renesas/porter/porter.c b/board/renesas/porter/porter.c
index b9c29349cc..097710b479 100644
--- a/board/renesas/porter/porter.c
+++ b/board/renesas/porter/porter.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <dm.h>
 #include <dm/platform_data/serial_sh.h>
diff --git a/board/renesas/silk/silk.c b/board/renesas/silk/silk.c
index b69e7035ab..e7cbd75776 100644
--- a/board/renesas/silk/silk.c
+++ b/board/renesas/silk/silk.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <dm.h>
 #include <dm/platform_data/serial_sh.h>
diff --git a/board/samsung/common/board.c b/board/samsung/common/board.c
index ee2fc7971e..5d4646d14c 100644
--- a/board/samsung/common/board.c
+++ b/board/samsung/common/board.c
@@ -8,6 +8,7 @@
 #include <cros_ec.h>
 #include <errno.h>
 #include <fdtdec.h>
+#include <hang.h>
 #include <init.h>
 #include <spi.h>
 #include <tmu.h>
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index cee3500737..5f6bcab034 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -12,6 +12,7 @@
 #include <env_internal.h>
 #include <g_dnl.h>
 #include <generic-phy.h>
+#include <hang.h>
 #include <i2c.h>
 #include <init.h>
 #include <led.h>
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index a7c4f7f71c..6afea6ef42 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -13,6 +13,7 @@
 #include <common.h>
 #include <dm.h>
 #include <env.h>
+#include <hang.h>
 #include <init.h>
 #include <mmc.h>
 #include <axp_pmic.h>
diff --git a/board/technexion/pico-imx6ul/spl.c b/board/technexion/pico-imx6ul/spl.c
index d3cbaf3989..41b053ab1c 100644
--- a/board/technexion/pico-imx6ul/spl.c
+++ b/board/technexion/pico-imx6ul/spl.c
@@ -2,6 +2,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/iomux.h>
diff --git a/board/ti/ks2_evm/board.c b/board/ti/ks2_evm/board.c
index da98c1c739..6554c0eb11 100644
--- a/board/ti/ks2_evm/board.c
+++ b/board/ti/ks2_evm/board.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include "board.h"
 #include <env.h>
+#include <hang.h>
 #include <init.h>
 #include <spl.h>
 #include <exports.h>
diff --git a/board/ti/ks2_evm/board_k2g.c b/board/ti/ks2_evm/board_k2g.c
index 920d0d3420..c6a14a0554 100644
--- a/board/ti/ks2_evm/board_k2g.c
+++ b/board/ti/ks2_evm/board_k2g.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <eeprom.h>
 #include <env.h>
+#include <hang.h>
 #include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/ti-common/keystone_net.h>
diff --git a/common/board_f.c b/common/board_f.c
index 3c6877da33..3f0132a6e3 100644
--- a/common/board_f.c
+++ b/common/board_f.c
@@ -20,6 +20,7 @@
 #include <env_internal.h>
 #include <fdtdec.h>
 #include <fs.h>
+#include <hang.h>
 #include <i2c.h>
 #include <init.h>
 #include <initcall.h>
diff --git a/common/board_r.c b/common/board_r.c
index b13d310774..5a80e7e439 100644
--- a/common/board_r.c
+++ b/common/board_r.c
@@ -13,6 +13,7 @@
 #include <api.h>
 #include <cpu_func.h>
 #include <exports.h>
+#include <hang.h>
 #include <image.h>
 #include <irq_func.h>
 #include <net.h>
diff --git a/common/bootstage.c b/common/bootstage.c
index 79972e46f2..d2ed33663b 100644
--- a/common/bootstage.c
+++ b/common/bootstage.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <malloc.h>
 #include <sort.h>
 #include <spl.h>
diff --git a/common/cli.c b/common/cli.c
index 67ceb635a6..7ffe902b88 100644
--- a/common/cli.c
+++ b/common/cli.c
@@ -15,6 +15,7 @@
 #include <console.h>
 #include <env.h>
 #include <fdtdec.h>
+#include <hang.h>
 #include <malloc.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/common/spl/spl.c b/common/spl/spl.c
index d51dbe9942..4fbc6d6762 100644
--- a/common/spl/spl.c
+++ b/common/spl/spl.c
@@ -11,6 +11,7 @@
 #include <binman_sym.h>
 #include <dm.h>
 #include <handoff.h>
+#include <hang.h>
 #include <irq_func.h>
 #include <serial.h>
 #include <spl.h>
diff --git a/common/spl/spl_opensbi.c b/common/spl/spl_opensbi.c
index 6404373eca..a136073fdb 100644
--- a/common/spl/spl_opensbi.c
+++ b/common/spl/spl_opensbi.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <errno.h>
+#include <hang.h>
 #include <spl.h>
 #include <asm/smp.h>
 #include <opensbi.h>
diff --git a/drivers/cache/cache-v5l2.c b/drivers/cache/cache-v5l2.c
index d367171b36..1373e7c387 100644
--- a/drivers/cache/cache-v5l2.c
+++ b/drivers/cache/cache-v5l2.c
@@ -8,6 +8,7 @@
 #include <command.h>
 #include <cache.h>
 #include <dm.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <dm/ofnode.h>
 
diff --git a/drivers/ddr/altera/sdram_s10.c b/drivers/ddr/altera/sdram_s10.c
index f61aad2e9a..d7e24a5226 100644
--- a/drivers/ddr/altera/sdram_s10.c
+++ b/drivers/ddr/altera/sdram_s10.c
@@ -10,6 +10,7 @@
 #include <errno.h>
 #include <div64.h>
 #include <fdtdec.h>
+#include <hang.h>
 #include <init.h>
 #include <ram.h>
 #include <reset.h>
diff --git a/drivers/misc/imx8/scu_api.c b/drivers/misc/imx8/scu_api.c
index b2fdeef13a..b34191753b 100644
--- a/drivers/misc/imx8/scu_api.c
+++ b/drivers/misc/imx8/scu_api.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <dm.h>
 #include <asm/arch/sci/sci.h>
diff --git a/drivers/mmc/fsl_esdhc_spl.c b/drivers/mmc/fsl_esdhc_spl.c
index 3021c3d6d4..afe55fad9d 100644
--- a/drivers/mmc/fsl_esdhc_spl.c
+++ b/drivers/mmc/fsl_esdhc_spl.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <mmc.h>
 #include <malloc.h>
 
diff --git a/drivers/mtd/nand/raw/mxc_nand_spl.c b/drivers/mtd/nand/raw/mxc_nand_spl.c
index 6c03db8428..e1e542519d 100644
--- a/drivers/mtd/nand/raw/mxc_nand_spl.c
+++ b/drivers/mtd/nand/raw/mxc_nand_spl.c
@@ -11,6 +11,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <nand.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/spi/fsl_espi_spl.c b/drivers/mtd/spi/fsl_espi_spl.c
index 580b1e24b7..5c41d7558c 100644
--- a/drivers/mtd/spi/fsl_espi_spl.c
+++ b/drivers/mtd/spi/fsl_espi_spl.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <spi_flash.h>
 #include <malloc.h>
 
diff --git a/drivers/net/fsl_mcdmafec.c b/drivers/net/fsl_mcdmafec.c
index b2936b78d7..ec912a6cca 100644
--- a/drivers/net/fsl_mcdmafec.c
+++ b/drivers/net/fsl_mcdmafec.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 #include <command.h>
 #include <config.h>
diff --git a/drivers/net/mcffec.c b/drivers/net/mcffec.c
index 9a3a8455a1..96f6321e94 100644
--- a/drivers/net/mcffec.c
+++ b/drivers/net/mcffec.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <env.h>
+#include <hang.h>
 #include <malloc.h>
 
 #include <command.h>
diff --git a/drivers/net/mpc8xx_fec.c b/drivers/net/mpc8xx_fec.c
index 0a80985192..69b2174ab3 100644
--- a/drivers/net/mpc8xx_fec.c
+++ b/drivers/net/mpc8xx_fec.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <hang.h>
 #include <malloc.h>
 #include <net.h>
 #include <netdev.h>
diff --git a/drivers/ram/k3-j721e/k3-j721e-ddrss.c b/drivers/ram/k3-j721e/k3-j721e-ddrss.c
index 9feb0aa766..a9b7d40890 100644
--- a/drivers/ram/k3-j721e/k3-j721e-ddrss.c
+++ b/drivers/ram/k3-j721e/k3-j721e-ddrss.c
@@ -8,6 +8,7 @@
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
+#include <hang.h>
 #include <ram.h>
 #include <asm/io.h>
 #include <power-domain.h>
diff --git a/drivers/ram/rockchip/dmc-rk3368.c b/drivers/ram/rockchip/dmc-rk3368.c
index 9df8f8f4af..8addee8cc3 100644
--- a/drivers/ram/rockchip/dmc-rk3368.c
+++ b/drivers/ram/rockchip/dmc-rk3368.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
+#include <hang.h>
 #include <dt-bindings/memory/rk3368-dmc.h>
 #include <dt-structs.h>
 #include <ram.h>
diff --git a/drivers/ram/rockchip/sdram_rk3188.c b/drivers/ram/rockchip/sdram_rk3188.c
index d3e4316ef0..9b5eb38ecc 100644
--- a/drivers/ram/rockchip/sdram_rk3188.c
+++ b/drivers/ram/rockchip/sdram_rk3188.c
@@ -11,6 +11,7 @@
 #include <dm.h>
 #include <dt-structs.h>
 #include <errno.h>
+#include <hang.h>
 #include <ram.h>
 #include <regmap.h>
 #include <syscon.h>
diff --git a/drivers/ram/rockchip/sdram_rk3288.c b/drivers/ram/rockchip/sdram_rk3288.c
index 690751d074..3eb14cdb32 100644
--- a/drivers/ram/rockchip/sdram_rk3288.c
+++ b/drivers/ram/rockchip/sdram_rk3288.c
@@ -11,6 +11,7 @@
 #include <dm.h>
 #include <dt-structs.h>
 #include <errno.h>
+#include <hang.h>
 #include <ram.h>
 #include <regmap.h>
 #include <syscon.h>
diff --git a/drivers/serial/serial.c b/drivers/serial/serial.c
index bf5f39215d..baeaeaac8e 100644
--- a/drivers/serial/serial.c
+++ b/drivers/serial/serial.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <env_internal.h>
+#include <hang.h>
 #include <serial.h>
 #include <stdio_dev.h>
 #include <post.h>
diff --git a/drivers/serial/serial_pxa.c b/drivers/serial/serial_pxa.c
index cf4d8f6442..6f8f7e1198 100644
--- a/drivers/serial/serial_pxa.c
+++ b/drivers/serial/serial_pxa.c
@@ -20,6 +20,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/arch/pxa-regs.h>
 #include <asm/arch/regs-uart.h>
 #include <asm/io.h>
diff --git a/drivers/sysreset/sysreset-uclass.c b/drivers/sysreset/sysreset-uclass.c
index 8eff6036e7..51fdb1055e 100644
--- a/drivers/sysreset/sysreset-uclass.c
+++ b/drivers/sysreset/sysreset-uclass.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <hang.h>
 #include <sysreset.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/usb/musb/musb_udc.c b/drivers/usb/musb/musb_udc.c
index 584564bac2..4d7723621d 100644
--- a/drivers/usb/musb/musb_udc.c
+++ b/drivers/usb/musb/musb_udc.c
@@ -38,6 +38,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <serial.h>
 #include <usbdevice.h>
 #include <usb/udc.h>
diff --git a/drivers/usb/phy/rockchip_usb2_phy.c b/drivers/usb/phy/rockchip_usb2_phy.c
index 69e408b6c1..ec998901ab 100644
--- a/drivers/usb/phy/rockchip_usb2_phy.c
+++ b/drivers/usb/phy/rockchip_usb2_phy.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <asm/io.h>
 
 #include "../gadget/dwc2_udc_otg_priv.h"
diff --git a/drivers/watchdog/imx_watchdog.c b/drivers/watchdog/imx_watchdog.c
index 62bf25e9cc..01762df019 100644
--- a/drivers/watchdog/imx_watchdog.c
+++ b/drivers/watchdog/imx_watchdog.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <dm.h>
+#include <hang.h>
 #include <asm/io.h>
 #include <wdt.h>
 #include <watchdog.h>
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index dafd2b56a8..669a32320d 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <hang.h>
 #include <wdt.h>
 #include <asm/io.h>
 
diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
index bbfac4f0f9..cf1c527473 100644
--- a/drivers/watchdog/wdt-uclass.c
+++ b/drivers/watchdog/wdt-uclass.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
+#include <hang.h>
 #include <wdt.h>
 #include <dm/device-internal.h>
 #include <dm/lists.h>
diff --git a/examples/api/libgenwrap.c b/examples/api/libgenwrap.c
index 67b2d641fc..769dcc7038 100644
--- a/examples/api/libgenwrap.c
+++ b/examples/api/libgenwrap.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #include <linux/types.h>
 #include <api_public.h>
 
@@ -41,7 +42,7 @@ void *malloc (size_t len)
 	return NULL;
 }
 
-void hang (void)
+void hang(void)
 {
 	while (1) ;
 }
diff --git a/include/common.h b/include/common.h
index b25744854c..ca08db0467 100644
--- a/include/common.h
+++ b/include/common.h
@@ -52,11 +52,6 @@
  */
 #include <init.h>
 
-/*
- * Function Prototypes
- */
-void	hang		(void) __attribute__ ((noreturn));
-
 #include <display_options.h>
 
 /* lib/uuid.c */
diff --git a/include/hang.h b/include/hang.h
new file mode 100644
index 0000000000..27cda49359
--- /dev/null
+++ b/include/hang.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * (C) Copyright 2000-2009
+ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+ */
+
+#ifndef __HANG_H
+#define __HANG_H
+
+#ifndef __ASSEMBLY__
+/**
+ * hang() - Print a message and stop execution
+ *
+ * This shows a 'hang' message where possible and then goes into an infinite
+ * loop. This is called by panic() if CONFIG_PANIC_HANG is enabled.
+ *
+ * This function does not return.
+ */
+void hang(void) __attribute__ ((noreturn));
+#endif
+
+#endif
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index f1bdc9f2e2..17051d409c 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <boot_fit.h>
 #include <dm.h>
+#include <hang.h>
 #include <init.h>
 #include <dm/of_extra.h>
 #include <env.h>
diff --git a/lib/hang.c b/lib/hang.c
index 4d026a3e64..578ac78d45 100644
--- a/lib/hang.c
+++ b/lib/hang.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <bootstage.h>
+#include <hang.h>
 #include <os.h>
 
 /**
diff --git a/lib/libavb/avb_sysdeps_posix.c b/lib/libavb/avb_sysdeps_posix.c
index 4ccf41e428..0bb0cc1498 100644
--- a/lib/libavb/avb_sysdeps_posix.c
+++ b/lib/libavb/avb_sysdeps_posix.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2016 The Android Open Source Project
  */
 
+#include <hang.h>
 #include <stdarg.h>
 #include <stdlib.h>
 
diff --git a/lib/panic.c b/lib/panic.c
index bae8a35935..8e72c265a6 100644
--- a/lib/panic.c
+++ b/lib/panic.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <hang.h>
 #if !defined(CONFIG_PANIC_HANG)
 #include <command.h>
 #endif
diff --git a/lib/zlib/zutil.c b/lib/zlib/zutil.c
index 227343e48d..609aac55ce 100644
--- a/lib/zlib/zutil.c
+++ b/lib/zlib/zutil.c
@@ -6,6 +6,7 @@
 /* @(#) $Id$ */
 
 #include "zutil.h"
+#include <hang.h>
 
 #ifndef NO_DUMMY_DECL
 struct internal_state      {int dummy;}; /* for buggy compilers */
@@ -34,7 +35,7 @@ void z_error (m)
     char *m;
 {
 	fprintf(stderr, "%s\n", m);
-	hang ();
+	hang();
 }
 #endif
 
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
