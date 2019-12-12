Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E3C11DF20
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2019 09:09:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20234C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Dec 2019 08:09:43 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4846C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2019 00:49:03 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s2so815472iog.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2019 16:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmFA5FxD9napyhuLFpjKYEM+4G2l+6KnT/Da41VMWWA=;
 b=YFpxSaQCSFPgVl9NUfhqDpc5gIKSFw8zUx7QrDPKUW8hP5kJfC30vK46/MF0CVOTaz
 Yl++nuy3XFutCRMqvCtSHepZ4Z1R3MrusflO7MgeVBdWfXWK5WcUKA+zQdZyE5I9sc/I
 shDZMKo/ZOa4hiuDGcCSYgF2nPJh0lRra+AEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmFA5FxD9napyhuLFpjKYEM+4G2l+6KnT/Da41VMWWA=;
 b=XcXexlZg26HUVfrg1x4zagPD7oF9Wcs+ANTB+amU9Zv/CDeAZEoNgJQz2EHsKTibKP
 bbudJFs5SQTN9Js5ukAV3fvJ3CDi4oMxO/gPdfrBfBmeVH1SDanZqwKTdH0GC2LhLnES
 TCbAac4T5G1xGG2SDA4vojYioookMpyKLlAxGr9kfOaqz9a4DX8cZRsyZJASMh5UWsRe
 ONQU/hMy1bwbg08dIdVyU+9xrzXGT/0B/+h0dK9WKpya2viqkGBuNLOrMgjoj8EoUyT4
 nNEZ2EJk+A/R1/Oru4opbOCO+yNmJro/rH4Cr1itrG05dN0OXF1vKUCvE4N2kUvBdWa7
 KVDg==
X-Gm-Message-State: APjAAAX9XbfQmHqhwzimBp+wdkQ8oDWQCsHbCpR4ayCOUU1KXHvfs3cI
 jSIiEl8lAyv6DFZW0dP57zx6Wg==
X-Google-Smtp-Source: APXvYqz/CyCXeMDetAVx99oxeemHv5xQtRnQkDgQr08OMbs43FjFmqyAQ78KwhQ7pTThaT7dncHK2w==
X-Received: by 2002:a02:6d2b:: with SMTP id m43mr5941587jac.37.1576111741778; 
 Wed, 11 Dec 2019 16:49:01 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 a11sm880194ioc.86.2019.12.11.16.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 16:49:01 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Wed, 11 Dec 2019 17:47:47 -0700
Message-Id: <20191211174637.28.Ibf2a89e8247fb54de790b3b8b55622b9ed234b2b@changeid>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191212004755.11091-2-sjg@chromium.org>
References: <20191212004755.11091-2-sjg@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:09:41 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chander Kashyap <k.chander@samsung.com>,
 Andrej Rosano <andrej@inversepath.com>, Michal Simek <michal.simek@xilinx.com>,
 Daniel Gorsulowski <daniel.gorsulowski@esd.eu>,
 Poonam Aggrwal <poonam.aggrwal@nxp.com>, Ye Li <ye.li@nxp.com>,
 Parthiban Nallathambi <parthitce@gmail.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Jon Mason <jon.mason@broadcom.com>,
 Steve Rae <steve.rae@raedomain.com>,
 Sandeep Sheriker M <sandeep.sheriker@microchip.com>,
 Stefano Babic <sbabic@denx.de>, Krunal Bhargav <k-bhargav@ti.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Dalon Westergreen <dalon.westergreen@intel.com>,
 Brad Griffis <bgriffis@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Udit Agarwal <udit.agarwal@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 u-boot-amlogic@groups.io, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Stelian Pop <stelian@popies.net>, Erik van Luijk <evanluijk@interact.nl>,
 Igor Grinberg <grinberg@compulab.co.il>, Vitaly Andrianov <vitalya@ti.com>,
 Ben Whitten <ben.whitten@lairdtech.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>, Mario Six <mario.six@gdsys.cc>,
 Marcel Ziswiler <marcel@ziswiler.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Andes <uboot@andestech.com>, Minkyu Kang <mk7.kang@samsung.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Max Krummenacher <max.krummenacher@toradex.com>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Tom Rini <trini@konsulko.com>, Pankaj Bansal <pankaj.bansal@nxp.com>,
 Niel Fourie <lusus@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Dirk Eibach <dirk.eibach@gdsys.cc>,
 Wolfgang Denk <wd@denx.de>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Alison Wang <alison.wang@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Yuantian Tang <andy.tang@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?q?Andreas=20Bie=C3=9Fmann?= <andreas@biessmann.org>,
 Thomas Schaefer <thomas.schaefer@kontron.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 =?UTF-8?q?Eddy=20Petri=C8=99or?= <eddy.petrisor@gmail.com>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wegner <w.wegner@astro-kom.de>, Marek Vasut <marex@denx.de>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Trevor Woerner <trevor@toganlabs.com>,
 egnite GmbH <info@egnite.de>, Jason Liu <Jason.hui.liu@nxp.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Ilko Iliev <iliev@ronetix.at>,
 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>,
 Stefan Agner <stefan.agner@toradex.com>, Hans de Goede <hdegoede@redhat.com>,
 Reinhard Arlt <reinhard.arlt@esd-electronics.com>,
 Bin Meng <bmeng.cn@gmail.com>, Ilya Yanok <yanok@emcraft.com>,
 Martyn Welch <martyn.welch@collabora.com>, Keerthy <j-keerthy@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Tom Warren <twarren@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>
Subject: [Uboot-stm32] [PATCH 28/35] common: Move RAM-sizing functions to
	init.h
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

These functions relate to memory init so move them into the init
header.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/cpu/arm926ejs/mxs/spl_mem_init.c           | 1 +
 arch/arm/cpu/arm926ejs/spear/spr_misc.c             | 1 +
 arch/arm/cpu/armv8/fsl-layerscape/cpu.c             | 1 +
 arch/arm/mach-davinci/misc.c                        | 1 +
 arch/arm/mach-imx/imx8/cpu.c                        | 1 +
 arch/arm/mach-imx/mx5/mx53_dram.c                   | 1 +
 arch/arm/mach-imx/mx6/litesom.c                     | 1 +
 arch/arm/mach-mediatek/mt7623/init.c                | 1 +
 arch/arm/mach-meson/board-axg.c                     | 1 +
 arch/arm/mach-meson/board-g12a.c                    | 1 +
 arch/arm/mach-meson/board-gx.c                      | 1 +
 arch/arm/mach-mvebu/dram.c                          | 1 +
 arch/arm/mach-omap2/am33xx/board.c                  | 1 +
 arch/arm/mach-omap2/emif-common.c                   | 1 +
 arch/arm/mach-omap2/sec-common.c                    | 1 +
 arch/arm/mach-orion5x/dram.c                        | 1 +
 arch/arm/mach-sunxi/dram_sun4i.c                    | 1 +
 arch/arm/mach-tegra/board.c                         | 1 +
 arch/mips/mach-ath79/dram.c                         | 1 +
 arch/mips/mach-mtmips/cpu.c                         | 1 +
 arch/powerpc/cpu/mpc85xx/traps.c                    | 1 +
 arch/powerpc/cpu/mpc86xx/traps.c                    | 1 +
 arch/powerpc/lib/bootm.c                            | 1 +
 arch/x86/cpu/tangier/sdram.c                        | 1 +
 board/AndesTech/adp-ae3xx/adp-ae3xx.c               | 1 +
 board/AndesTech/adp-ag101p/adp-ag101p.c             | 1 +
 board/AndesTech/ax25-ae350/ax25-ae350.c             | 1 +
 board/CarMediaLab/flea3/flea3.c                     | 1 +
 board/armltd/integrator/integrator.c                | 1 +
 board/armltd/vexpress/vexpress_common.c             | 1 +
 board/astro/mcf5373l/mcf5373l.c                     | 1 +
 board/atmel/at91rm9200ek/at91rm9200ek.c             | 1 +
 board/atmel/at91sam9260ek/at91sam9260ek.c           | 1 +
 board/atmel/at91sam9261ek/at91sam9261ek.c           | 1 +
 board/atmel/at91sam9263ek/at91sam9263ek.c           | 1 +
 board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c     | 1 +
 board/atmel/at91sam9n12ek/at91sam9n12ek.c           | 1 +
 board/atmel/at91sam9rlek/at91sam9rlek.c             | 1 +
 board/atmel/sam9x60ek/sam9x60ek.c                   | 1 +
 board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c | 1 +
 board/barco/platinum/platinum.c                     | 1 +
 board/barco/titanium/titanium.c                     | 1 +
 board/bluewater/snapper9260/snapper9260.c           | 1 +
 board/broadcom/bcm23550_w1d/bcm23550_w1d.c          | 1 +
 board/broadcom/bcm28155_ap/bcm28155_ap.c            | 1 +
 board/broadcom/bcm_ep/board.c                       | 1 +
 board/broadcom/bcmns2/northstar2.c                  | 1 +
 board/calao/usb_a9263/usb_a9263.c                   | 1 +
 board/compulab/cl-som-imx7/spl.c                    | 1 +
 board/compulab/cm_fx6/spl.c                         | 1 +
 board/compulab/cm_t335/spl.c                        | 1 +
 board/compulab/cm_t43/spl.c                         | 1 +
 board/egnite/ethernut5/ethernut5.c                  | 1 +
 board/esd/meesc/meesc.c                             | 1 +
 board/esd/vme8349/vme8349.c                         | 1 +
 board/freescale/bsc9131rdb/ddr.c                    | 1 +
 board/freescale/mpc8308rdb/sdram.c                  | 1 +
 board/freescale/mx53ard/mx53ard.c                   | 1 +
 board/freescale/mx53smd/mx53smd.c                   | 1 +
 board/freescale/s32v234evb/s32v234evb.c             | 1 +
 board/freescale/vf610twr/vf610twr.c                 | 1 +
 board/gdsys/mpc8308/sdram.c                         | 1 +
 board/hisilicon/poplar/poplar.c                     | 1 +
 board/ids/ids8313/ids8313.c                         | 1 +
 board/inversepath/usbarmory/usbarmory.c             | 1 +
 board/l+g/vinco/vinco.c                             | 1 +
 board/laird/wb45n/wb45n.c                           | 1 +
 board/mini-box/picosam9g45/picosam9g45.c            | 1 +
 board/mpc8308_p1m/sdram.c                           | 1 +
 board/phytec/pcl063/pcl063.c                        | 1 +
 board/phytec/phycore_am335x_r2/board.c              | 1 +
 board/ronetix/pm9261/pm9261.c                       | 1 +
 board/ronetix/pm9263/pm9263.c                       | 1 +
 board/ronetix/pm9g45/pm9g45.c                       | 1 +
 board/samsung/arndale/arndale.c                     | 1 +
 board/samsung/smdkc100/smdkc100.c                   | 1 +
 board/samsung/smdkv310/smdkv310.c                   | 1 +
 board/seco/mx6quq7/mx6quq7.c                        | 1 +
 board/siemens/corvus/board.c                        | 1 +
 board/siemens/smartweb/smartweb.c                   | 1 +
 board/siemens/taurus/taurus.c                       | 1 +
 board/socrates/sdram.c                              | 1 +
 board/sunxi/board.c                                 | 1 +
 board/sysam/amcore/amcore.c                         | 1 +
 board/technexion/pico-imx6ul/spl.c                  | 2 ++
 board/technologic/ts4800/ts4800.c                   | 1 +
 board/ti/ks2_evm/board.c                            | 1 +
 board/timll/devkit3250/devkit3250.c                 | 1 +
 board/toradex/colibri_imx7/colibri_imx7.c           | 2 ++
 board/tqc/tqm834x/tqm834x.c                         | 1 +
 board/ve8313/ve8313.c                               | 2 +-
 board/woodburn/woodburn.c                           | 1 +
 cmd/ti/ddr3.c                                       | 1 +
 common/memsize.c                                    | 1 +
 drivers/ddr/altera/sdram_gen5.c                     | 1 +
 drivers/ddr/altera/sdram_s10.c                      | 1 +
 drivers/ram/bmips_ram.c                             | 1 +
 drivers/ram/mpc83xx_sdram.c                         | 1 +
 drivers/ram/stm32mp1/stm32mp1_ram.c                 | 1 +
 drivers/ram/stm32mp1/stm32mp1_tests.c               | 1 +
 include/common.h                                    | 4 ----
 include/init.h                                      | 3 +++
 lib/fdtdec.c                                        | 1 +
 103 files changed, 106 insertions(+), 5 deletions(-)

diff --git a/arch/arm/cpu/arm926ejs/mxs/spl_mem_init.c b/arch/arm/cpu/arm926ejs/mxs/spl_mem_init.c
index 7818d72908..542543cc28 100644
--- a/arch/arm/cpu/arm926ejs/mxs/spl_mem_init.c
+++ b/arch/arm/cpu/arm926ejs/mxs/spl_mem_init.c
@@ -8,6 +8,7 @@
 
 #include <common.h>
 #include <config.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/sys_proto.h>
diff --git a/arch/arm/cpu/arm926ejs/spear/spr_misc.c b/arch/arm/cpu/arm926ejs/spear/spr_misc.c
index ccf944f814..d5be646555 100644
--- a/arch/arm/cpu/arm926ejs/spear/spr_misc.c
+++ b/arch/arm/cpu/arm926ejs/spear/spr_misc.c
@@ -9,6 +9,7 @@
 #include <cpu_func.h>
 #include <env.h>
 #include <i2c.h>
+#include <init.h>
 #include <net.h>
 #include <linux/mtd/st_smi.h>
 #include <asm/io.h>
diff --git a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
index 6c87c1b11a..7a378d93df 100644
--- a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
+++ b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
@@ -8,6 +8,7 @@
 #include <cpu_func.h>
 #include <env.h>
 #include <fsl_ddr_sdram.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <linux/errno.h>
diff --git a/arch/arm/mach-davinci/misc.c b/arch/arm/mach-davinci/misc.c
index 80e964274e..3e5185261c 100644
--- a/arch/arm/mach-davinci/misc.c
+++ b/arch/arm/mach-davinci/misc.c
@@ -11,6 +11,7 @@
 #include <common.h>
 #include <env.h>
 #include <i2c.h>
+#include <init.h>
 #include <net.h>
 #include <asm/arch/hardware.h>
 #include <asm/io.h>
diff --git a/arch/arm/mach-imx/imx8/cpu.c b/arch/arm/mach-imx/imx8/cpu.c
index d31af47c31..2110380957 100644
--- a/arch/arm/mach-imx/imx8/cpu.c
+++ b/arch/arm/mach-imx/imx8/cpu.c
@@ -8,6 +8,7 @@
 #include <cpu.h>
 #include <cpu_func.h>
 #include <dm.h>
+#include <init.h>
 #include <dm/device-internal.h>
 #include <dm/lists.h>
 #include <dm/uclass.h>
diff --git a/arch/arm/mach-imx/mx5/mx53_dram.c b/arch/arm/mach-imx/mx5/mx53_dram.c
index 39ac287fb4..a7f033f3f4 100644
--- a/arch/arm/mach-imx/mx5/mx53_dram.c
+++ b/arch/arm/mach-imx/mx5/mx53_dram.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/arch/arm/mach-imx/mx6/litesom.c b/arch/arm/mach-imx/mx6/litesom.c
index 4f4df7433b..b0a6bd589c 100644
--- a/arch/arm/mach-imx/mx6/litesom.c
+++ b/arch/arm/mach-imx/mx6/litesom.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2016 Grinn
  */
 
+#include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/iomux.h>
 #include <asm/arch/imx-regs.h>
diff --git a/arch/arm/mach-mediatek/mt7623/init.c b/arch/arm/mach-mediatek/mt7623/init.c
index 0ee8c6664c..2778e260e0 100644
--- a/arch/arm/mach-mediatek/mt7623/init.c
+++ b/arch/arm/mach-mediatek/mt7623/init.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <linux/io.h>
 #include <linux/sizes.h>
 #include <asm/arch/misc.h>
diff --git a/arch/arm/mach-meson/board-axg.c b/arch/arm/mach-meson/board-axg.c
index 173905e762..6874458e36 100644
--- a/arch/arm/mach-meson/board-axg.c
+++ b/arch/arm/mach-meson/board-axg.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/arch/boot.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/axg.h>
diff --git a/arch/arm/mach-meson/board-g12a.c b/arch/arm/mach-meson/board-g12a.c
index 24786df6cd..26d6b90790 100644
--- a/arch/arm/mach-meson/board-g12a.c
+++ b/arch/arm/mach-meson/board-g12a.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/arch/boot.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/g12a.h>
diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
index ab8f1a81f8..191fd49005 100644
--- a/arch/arm/mach-meson/board-gx.c
+++ b/arch/arm/mach-meson/board-gx.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/arch/boot.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/gx.h>
diff --git a/arch/arm/mach-mvebu/dram.c b/arch/arm/mach-mvebu/dram.c
index ba8ebc6288..6c6f8d8c5c 100644
--- a/arch/arm/mach-mvebu/dram.c
+++ b/arch/arm/mach-mvebu/dram.c
@@ -7,6 +7,7 @@
 
 #include <config.h>
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/soc.h>
diff --git a/arch/arm/mach-omap2/am33xx/board.c b/arch/arm/mach-omap2/am33xx/board.c
index 03460c3eb7..055eb6b760 100644
--- a/arch/arm/mach-omap2/am33xx/board.c
+++ b/arch/arm/mach-omap2/am33xx/board.c
@@ -11,6 +11,7 @@
 #include <dm.h>
 #include <debug_uart.h>
 #include <errno.h>
+#include <init.h>
 #include <ns16550.h>
 #include <spl.h>
 #include <asm/arch/cpu.h>
diff --git a/arch/arm/mach-omap2/emif-common.c b/arch/arm/mach-omap2/emif-common.c
index c900f28af2..bb81063c0f 100644
--- a/arch/arm/mach-omap2/emif-common.c
+++ b/arch/arm/mach-omap2/emif-common.c
@@ -9,6 +9,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <net.h>
 #include <asm/emif.h>
 #include <asm/arch/clock.h>
diff --git a/arch/arm/mach-omap2/sec-common.c b/arch/arm/mach-omap2/sec-common.c
index e9b3e746fe..f3df8affa3 100644
--- a/arch/arm/mach-omap2/sec-common.c
+++ b/arch/arm/mach-omap2/sec-common.c
@@ -14,6 +14,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <stdarg.h>
 
 #include <asm/arch/sys_proto.h>
diff --git a/arch/arm/mach-orion5x/dram.c b/arch/arm/mach-orion5x/dram.c
index b52c417e30..33f65db48e 100644
--- a/arch/arm/mach-orion5x/dram.c
+++ b/arch/arm/mach-orion5x/dram.c
@@ -10,6 +10,7 @@
 
 #include <common.h>
 #include <config.h>
+#include <init.h>
 #include <asm/arch/cpu.h>
 
 DECLARE_GLOBAL_DATA_PTR;
diff --git a/arch/arm/mach-sunxi/dram_sun4i.c b/arch/arm/mach-sunxi/dram_sun4i.c
index 396c0424ea..72de807a47 100644
--- a/arch/arm/mach-sunxi/dram_sun4i.c
+++ b/arch/arm/mach-sunxi/dram_sun4i.c
@@ -21,6 +21,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
diff --git a/arch/arm/mach-tegra/board.c b/arch/arm/mach-tegra/board.c
index 61eaba711a..31c49a7c84 100644
--- a/arch/arm/mach-tegra/board.c
+++ b/arch/arm/mach-tegra/board.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <dm.h>
+#include <init.h>
 #include <ns16550.h>
 #include <spl.h>
 #include <asm/io.h>
diff --git a/arch/mips/mach-ath79/dram.c b/arch/mips/mach-ath79/dram.c
index 138a7f8483..1abe2a49e6 100644
--- a/arch/mips/mach-ath79/dram.c
+++ b/arch/mips/mach-ath79/dram.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <linux/sizes.h>
 #include <asm/addrspace.h>
 #include <mach/ddr.h>
diff --git a/arch/mips/mach-mtmips/cpu.c b/arch/mips/mach-mtmips/cpu.c
index 7afc2c5940..cee3c0cb0a 100644
--- a/arch/mips/mach-mtmips/cpu.c
+++ b/arch/mips/mach-mtmips/cpu.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <init.h>
 #include <ram.h>
 #include <wdt.h>
 #include <asm/io.h>
diff --git a/arch/powerpc/cpu/mpc85xx/traps.c b/arch/powerpc/cpu/mpc85xx/traps.c
index 804788d050..bc2fc93e11 100644
--- a/arch/powerpc/cpu/mpc85xx/traps.c
+++ b/arch/powerpc/cpu/mpc85xx/traps.c
@@ -21,6 +21,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <init.h>
 #include <irq_func.h>
 #include <kgdb.h>
 #include <asm/processor.h>
diff --git a/arch/powerpc/cpu/mpc86xx/traps.c b/arch/powerpc/cpu/mpc86xx/traps.c
index 1820187d1d..79bab91367 100644
--- a/arch/powerpc/cpu/mpc86xx/traps.c
+++ b/arch/powerpc/cpu/mpc86xx/traps.c
@@ -15,6 +15,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <init.h>
 #include <kgdb.h>
 #include <asm/processor.h>
 
diff --git a/arch/powerpc/lib/bootm.c b/arch/powerpc/lib/bootm.c
index f2e670eb6b..390e8c0673 100644
--- a/arch/powerpc/lib/bootm.c
+++ b/arch/powerpc/lib/bootm.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <env.h>
+#include <init.h>
 #include <watchdog.h>
 #include <command.h>
 #include <image.h>
diff --git a/arch/x86/cpu/tangier/sdram.c b/arch/x86/cpu/tangier/sdram.c
index b47d896e20..8c7e1c10c2 100644
--- a/arch/x86/cpu/tangier/sdram.c
+++ b/arch/x86/cpu/tangier/sdram.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/e820.h>
 #include <asm/global_data.h>
 #include <asm/sfi.h>
diff --git a/board/AndesTech/adp-ae3xx/adp-ae3xx.c b/board/AndesTech/adp-ae3xx/adp-ae3xx.c
index db08d86de5..a04415deca 100644
--- a/board/AndesTech/adp-ae3xx/adp-ae3xx.c
+++ b/board/AndesTech/adp-ae3xx/adp-ae3xx.c
@@ -5,6 +5,7 @@
  * Macpaul Lin, Andes Technology Corporation <macpaul@andestech.com>
  */
 
+#include <init.h>
 #include <asm/mach-types.h>
 #include <common.h>
 #if defined(CONFIG_FTMAC100) && !defined(CONFIG_DM_ETH)
diff --git a/board/AndesTech/adp-ag101p/adp-ag101p.c b/board/AndesTech/adp-ag101p/adp-ag101p.c
index 657921e741..faf39b4ba6 100644
--- a/board/AndesTech/adp-ag101p/adp-ag101p.c
+++ b/board/AndesTech/adp-ag101p/adp-ag101p.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #if defined(CONFIG_FTMAC100) && !defined(CONFIG_DM_ETH)
 #include <netdev.h>
 #endif
diff --git a/board/AndesTech/ax25-ae350/ax25-ae350.c b/board/AndesTech/ax25-ae350/ax25-ae350.c
index 47e6929365..f164073000 100644
--- a/board/AndesTech/ax25-ae350/ax25-ae350.c
+++ b/board/AndesTech/ax25-ae350/ax25-ae350.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #if defined(CONFIG_FTMAC100) && !defined(CONFIG_DM_ETH)
 #include <netdev.h>
 #endif
diff --git a/board/CarMediaLab/flea3/flea3.c b/board/CarMediaLab/flea3/flea3.c
index be0bc228ec..fb66c9ecc7 100644
--- a/board/CarMediaLab/flea3/flea3.c
+++ b/board/CarMediaLab/flea3/flea3.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <env.h>
 #include <linux/errno.h>
diff --git a/board/armltd/integrator/integrator.c b/board/armltd/integrator/integrator.c
index 5cdf7905a9..1a472f50d3 100644
--- a/board/armltd/integrator/integrator.c
+++ b/board/armltd/integrator/integrator.c
@@ -20,6 +20,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <env.h>
+#include <init.h>
 #include <netdev.h>
 #include <asm/io.h>
 #include <dm/platform_data/serial_pl01x.h>
diff --git a/board/armltd/vexpress/vexpress_common.c b/board/armltd/vexpress/vexpress_common.c
index 416c18adec..14626c1f55 100644
--- a/board/armltd/vexpress/vexpress_common.c
+++ b/board/armltd/vexpress/vexpress_common.c
@@ -17,6 +17,7 @@
  */
 #include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <malloc.h>
 #include <errno.h>
 #include <netdev.h>
diff --git a/board/astro/mcf5373l/mcf5373l.c b/board/astro/mcf5373l/mcf5373l.c
index db157a83c8..9adf58eb8a 100644
--- a/board/astro/mcf5373l/mcf5373l.c
+++ b/board/astro/mcf5373l/mcf5373l.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <serial.h>
 #include <watchdog.h>
 #include <command.h>
diff --git a/board/atmel/at91rm9200ek/at91rm9200ek.c b/board/atmel/at91rm9200ek/at91rm9200ek.c
index 5d228fcc16..e75d5b182f 100644
--- a/board/atmel/at91rm9200ek/at91rm9200ek.c
+++ b/board/atmel/at91rm9200ek/at91rm9200ek.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <netdev.h>
 #include <asm/mach-types.h>
 #include <asm/arch/hardware.h>
diff --git a/board/atmel/at91sam9260ek/at91sam9260ek.c b/board/atmel/at91sam9260ek/at91sam9260ek.c
index d1e78dabf2..42fa762772 100644
--- a/board/atmel/at91sam9260ek/at91sam9260ek.c
+++ b/board/atmel/at91sam9260ek/at91sam9260ek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <net.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9260_matrix.h>
diff --git a/board/atmel/at91sam9261ek/at91sam9261ek.c b/board/atmel/at91sam9261ek/at91sam9261ek.c
index 28765315f7..36f2149b61 100644
--- a/board/atmel/at91sam9261ek/at91sam9261ek.c
+++ b/board/atmel/at91sam9261ek/at91sam9261ek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9261.h>
diff --git a/board/atmel/at91sam9263ek/at91sam9263ek.c b/board/atmel/at91sam9263ek/at91sam9263ek.c
index fc941d447f..b811d931c4 100644
--- a/board/atmel/at91sam9263ek/at91sam9263ek.c
+++ b/board/atmel/at91sam9263ek/at91sam9263ek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <net.h>
 #include <vsprintf.h>
 #include <linux/sizes.h>
diff --git a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
index 6df915fcf1..8aabc55951 100644
--- a/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
+++ b/board/atmel/at91sam9m10g45ek/at91sam9m10g45ek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <net.h>
 #include <vsprintf.h>
 #include <asm/io.h>
diff --git a/board/atmel/at91sam9n12ek/at91sam9n12ek.c b/board/atmel/at91sam9n12ek/at91sam9n12ek.c
index 51b24e1d59..90d32353e9 100644
--- a/board/atmel/at91sam9n12ek/at91sam9n12ek.c
+++ b/board/atmel/at91sam9n12ek/at91sam9n12ek.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9x5_matrix.h>
diff --git a/board/atmel/at91sam9rlek/at91sam9rlek.c b/board/atmel/at91sam9rlek/at91sam9rlek.c
index 4e674d49b3..f81dccc9cc 100644
--- a/board/atmel/at91sam9rlek/at91sam9rlek.c
+++ b/board/atmel/at91sam9rlek/at91sam9rlek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <asm/mach-types.h>
diff --git a/board/atmel/sam9x60ek/sam9x60ek.c b/board/atmel/sam9x60ek/sam9x60ek.c
index 7be1dd54f4..fbd05c78a9 100644
--- a/board/atmel/sam9x60ek/sam9x60ek.c
+++ b/board/atmel/sam9x60ek/sam9x60ek.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9_smc.h>
 #include <asm/arch/at91_common.h>
diff --git a/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c b/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
index fda06c824d..e9159d470f 100644
--- a/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
+++ b/board/atmel/sama5d27_wlsom1_ek/sama5d27_wlsom1_ek.c
@@ -7,6 +7,7 @@
 
 #include <common.h>
 #include <debug_uart.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/atmel_pio4.h>
diff --git a/board/barco/platinum/platinum.c b/board/barco/platinum/platinum.c
index 1c6514af6e..c2c7c09553 100644
--- a/board/barco/platinum/platinum.c
+++ b/board/barco/platinum/platinum.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <mmc.h>
 #include <fsl_esdhc_imx.h>
 #include <miiphy.h>
diff --git a/board/barco/titanium/titanium.c b/board/barco/titanium/titanium.c
index 407bfe95ed..6348f123ad 100644
--- a/board/barco/titanium/titanium.c
+++ b/board/barco/titanium/titanium.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/imx-regs.h>
diff --git a/board/bluewater/snapper9260/snapper9260.c b/board/bluewater/snapper9260/snapper9260.c
index d2a1b97d7b..47ce307880 100644
--- a/board/bluewater/snapper9260/snapper9260.c
+++ b/board/bluewater/snapper9260/snapper9260.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <asm/mach-types.h>
diff --git a/board/broadcom/bcm23550_w1d/bcm23550_w1d.c b/board/broadcom/bcm23550_w1d/bcm23550_w1d.c
index ce9f0494ee..d83eb9bd52 100644
--- a/board/broadcom/bcm23550_w1d/bcm23550_w1d.c
+++ b/board/broadcom/bcm23550_w1d/bcm23550_w1d.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/mach-types.h>
 #include <env.h>
diff --git a/board/broadcom/bcm28155_ap/bcm28155_ap.c b/board/broadcom/bcm28155_ap/bcm28155_ap.c
index 87616386cb..40ced1a87c 100644
--- a/board/broadcom/bcm28155_ap/bcm28155_ap.c
+++ b/board/broadcom/bcm28155_ap/bcm28155_ap.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/mach-types.h>
 #include <env.h>
diff --git a/board/broadcom/bcm_ep/board.c b/board/broadcom/bcm_ep/board.c
index 63fb98ba7c..e4dbe42649 100644
--- a/board/broadcom/bcm_ep/board.c
+++ b/board/broadcom/bcm_ep/board.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <asm/io.h>
 #include <config.h>
 #include <netdev.h>
diff --git a/board/broadcom/bcmns2/northstar2.c b/board/broadcom/bcmns2/northstar2.c
index 292802f4c0..6cbad9c1f0 100644
--- a/board/broadcom/bcmns2/northstar2.c
+++ b/board/broadcom/bcmns2/northstar2.c
@@ -4,6 +4,7 @@
  */
 #include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <asm/system.h>
 #include <asm/armv8/mmu.h>
 
diff --git a/board/calao/usb_a9263/usb_a9263.c b/board/calao/usb_a9263/usb_a9263.c
index 9e8e1f36f7..919e3ed27c 100644
--- a/board/calao/usb_a9263/usb_a9263.c
+++ b/board/calao/usb_a9263/usb_a9263.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/arch/at91sam9_smc.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/at91_matrix.h>
diff --git a/board/compulab/cl-som-imx7/spl.c b/board/compulab/cl-som-imx7/spl.c
index f9a19f08da..6833608a53 100644
--- a/board/compulab/cl-som-imx7/spl.c
+++ b/board/compulab/cl-som-imx7/spl.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <spl.h>
 #include <fsl_esdhc_imx.h>
 #include <asm/mach-imx/iomux-v3.h>
diff --git a/board/compulab/cm_fx6/spl.c b/board/compulab/cm_fx6/spl.c
index a406d0046e..1ddf424e42 100644
--- a/board/compulab/cm_fx6/spl.c
+++ b/board/compulab/cm_fx6/spl.c
@@ -9,6 +9,7 @@
 
 #include <common.h>
 #include <clock_legacy.h>
+#include <init.h>
 #include <spl.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
diff --git a/board/compulab/cm_t335/spl.c b/board/compulab/cm_t335/spl.c
index 6d5b15aef4..39ca535d11 100644
--- a/board/compulab/cm_t335/spl.c
+++ b/board/compulab/cm_t335/spl.c
@@ -12,6 +12,7 @@
 #include <common.h>
 #include <cpu_func.h>
 #include <errno.h>
+#include <init.h>
 
 #include <asm/arch/ddr_defs.h>
 #include <asm/arch/clock.h>
diff --git a/board/compulab/cm_t43/spl.c b/board/compulab/cm_t43/spl.c
index 7da9a9ad86..fdab9c3fd1 100644
--- a/board/compulab/cm_t43/spl.c
+++ b/board/compulab/cm_t43/spl.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <spl.h>
 #include <i2c.h>
 #include <asm/arch/clock.h>
diff --git a/board/egnite/ethernut5/ethernut5.c b/board/egnite/ethernut5/ethernut5.c
index 9dea2ba80e..bfd5a4fe36 100644
--- a/board/egnite/ethernut5/ethernut5.c
+++ b/board/egnite/ethernut5/ethernut5.c
@@ -53,6 +53,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <net.h>
 #include <netdev.h>
 #include <miiphy.h>
diff --git a/board/esd/meesc/meesc.c b/board/esd/meesc/meesc.c
index 4271b0db19..6c5992733c 100644
--- a/board/esd/meesc/meesc.c
+++ b/board/esd/meesc/meesc.c
@@ -11,6 +11,7 @@
 
 #include <common.h>
 #include <env.h>
+#include <init.h>
 #include <serial.h>
 #include <vsprintf.h>
 #include <asm/io.h>
diff --git a/board/esd/vme8349/vme8349.c b/board/esd/vme8349/vme8349.c
index 49d085acf9..ff811643a6 100644
--- a/board/esd/vme8349/vme8349.c
+++ b/board/esd/vme8349/vme8349.c
@@ -13,6 +13,7 @@
 
 #include <common.h>
 #include <fdt_support.h>
+#include <init.h>
 #include <ioports.h>
 #include <mpc83xx.h>
 #include <asm/mpc8349_pci.h>
diff --git a/board/freescale/bsc9131rdb/ddr.c b/board/freescale/bsc9131rdb/ddr.c
index 4b6d91df21..0951d7758a 100644
--- a/board/freescale/bsc9131rdb/ddr.c
+++ b/board/freescale/bsc9131rdb/ddr.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/mmu.h>
 #include <asm/immap_85xx.h>
diff --git a/board/freescale/mpc8308rdb/sdram.c b/board/freescale/mpc8308rdb/sdram.c
index 317e63ea6a..6e0922cd53 100644
--- a/board/freescale/mpc8308rdb/sdram.c
+++ b/board/freescale/mpc8308rdb/sdram.c
@@ -12,6 +12,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <mpc83xx.h>
 
 #include <asm/bitops.h>
diff --git a/board/freescale/mx53ard/mx53ard.c b/board/freescale/mx53ard/mx53ard.c
index e8fccccafd..33d056b47d 100644
--- a/board/freescale/mx53ard/mx53ard.c
+++ b/board/freescale/mx53ard/mx53ard.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/sys_proto.h>
diff --git a/board/freescale/mx53smd/mx53smd.c b/board/freescale/mx53smd/mx53smd.c
index cab0e79a6b..2599272173 100644
--- a/board/freescale/mx53smd/mx53smd.c
+++ b/board/freescale/mx53smd/mx53smd.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/sys_proto.h>
diff --git a/board/freescale/s32v234evb/s32v234evb.c b/board/freescale/s32v234evb/s32v234evb.c
index 9bc9ddf649..a7301e2a2e 100644
--- a/board/freescale/s32v234evb/s32v234evb.c
+++ b/board/freescale/s32v234evb/s32v234evb.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/siul.h>
diff --git a/board/freescale/vf610twr/vf610twr.c b/board/freescale/vf610twr/vf610twr.c
index f6cd7a4c8d..17427f23d8 100644
--- a/board/freescale/vf610twr/vf610twr.c
+++ b/board/freescale/vf610twr/vf610twr.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/iomux-vf610.h>
diff --git a/board/gdsys/mpc8308/sdram.c b/board/gdsys/mpc8308/sdram.c
index 2a77fed270..9695fb0a10 100644
--- a/board/gdsys/mpc8308/sdram.c
+++ b/board/gdsys/mpc8308/sdram.c
@@ -14,6 +14,7 @@
 #ifndef CONFIG_MPC83XX_SDRAM
 
 #include <common.h>
+#include <init.h>
 #include <mpc83xx.h>
 #include <spd_sdram.h>
 
diff --git a/board/hisilicon/poplar/poplar.c b/board/hisilicon/poplar/poplar.c
index 304f64a032..36999bdcea 100644
--- a/board/hisilicon/poplar/poplar.c
+++ b/board/hisilicon/poplar/poplar.c
@@ -7,6 +7,7 @@
 #include <cpu_func.h>
 #include <dm.h>
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <dm/platform_data/serial_pl01x.h>
 #include <asm/arch/hi3798cv200.h>
diff --git a/board/ids/ids8313/ids8313.c b/board/ids/ids8313/ids8313.c
index 2b6e4df86f..6e74e939c3 100644
--- a/board/ids/ids8313/ids8313.c
+++ b/board/ids/ids8313/ids8313.c
@@ -13,6 +13,7 @@
 
 #include <common.h>
 #include <fdt_support.h>
+#include <init.h>
 #include <mpc83xx.h>
 #include <spi.h>
 #include <linux/libfdt.h>
diff --git a/board/inversepath/usbarmory/usbarmory.c b/board/inversepath/usbarmory/usbarmory.c
index e9eea40e45..4fa34e1b51 100644
--- a/board/inversepath/usbarmory/usbarmory.c
+++ b/board/inversepath/usbarmory/usbarmory.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <command.h>
 #include <fs.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/sys_proto.h>
diff --git a/board/l+g/vinco/vinco.c b/board/l+g/vinco/vinco.c
index 029ab12391..5a998e37d8 100644
--- a/board/l+g/vinco/vinco.c
+++ b/board/l+g/vinco/vinco.c
@@ -10,6 +10,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91_common.h>
 #include <asm/arch/at91_pmc.h>
diff --git a/board/laird/wb45n/wb45n.c b/board/laird/wb45n/wb45n.c
index e7f31ec9e7..0d1be3f784 100644
--- a/board/laird/wb45n/wb45n.c
+++ b/board/laird/wb45n/wb45n.c
@@ -3,6 +3,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9x5_matrix.h>
 #include <asm/arch/at91sam9_smc.h>
diff --git a/board/mini-box/picosam9g45/picosam9g45.c b/board/mini-box/picosam9g45/picosam9g45.c
index 9a724040b0..5e55918fa6 100644
--- a/board/mini-box/picosam9g45/picosam9g45.c
+++ b/board/mini-box/picosam9g45/picosam9g45.c
@@ -11,6 +11,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <asm/io.h>
 #include <asm/arch/clk.h>
diff --git a/board/mpc8308_p1m/sdram.c b/board/mpc8308_p1m/sdram.c
index baf70d8807..cbf8781746 100644
--- a/board/mpc8308_p1m/sdram.c
+++ b/board/mpc8308_p1m/sdram.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <mpc83xx.h>
 
 #include <asm/bitops.h>
diff --git a/board/phytec/pcl063/pcl063.c b/board/phytec/pcl063/pcl063.c
index 96dd9e38f3..9e6940f9c7 100644
--- a/board/phytec/pcl063/pcl063.c
+++ b/board/phytec/pcl063/pcl063.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2015-2016 Stefan Roese <sr@denx.de>
  */
 
+#include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/crm_regs.h>
 #include <asm/arch/mx6-pins.h>
diff --git a/board/phytec/phycore_am335x_r2/board.c b/board/phytec/phycore_am335x_r2/board.c
index 02d6c27cec..8964fb5dda 100644
--- a/board/phytec/phycore_am335x_r2/board.c
+++ b/board/phytec/phycore_am335x_r2/board.c
@@ -11,6 +11,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <spl.h>
 #include <asm/arch/cpu.h>
 #include <asm/arch/ddr_defs.h>
diff --git a/board/ronetix/pm9261/pm9261.c b/board/ronetix/pm9261/pm9261.c
index bad673412a..57f8a20ccb 100644
--- a/board/ronetix/pm9261/pm9261.c
+++ b/board/ronetix/pm9261/pm9261.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <vsprintf.h>
 #include <linux/sizes.h>
 #include <asm/io.h>
diff --git a/board/ronetix/pm9263/pm9263.c b/board/ronetix/pm9263/pm9263.c
index 2da39c4acd..3cd6384fc3 100644
--- a/board/ronetix/pm9263/pm9263.c
+++ b/board/ronetix/pm9263/pm9263.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <linux/sizes.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
diff --git a/board/ronetix/pm9g45/pm9g45.c b/board/ronetix/pm9g45/pm9g45.c
index c5d28c61e2..17dc7d6b4d 100644
--- a/board/ronetix/pm9g45/pm9g45.c
+++ b/board/ronetix/pm9g45/pm9g45.c
@@ -11,6 +11,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <linux/sizes.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
diff --git a/board/samsung/arndale/arndale.c b/board/samsung/arndale/arndale.c
index 1d547b1c38..9abad3f824 100644
--- a/board/samsung/arndale/arndale.c
+++ b/board/samsung/arndale/arndale.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <usb.h>
 #include <asm/gpio.h>
 #include <asm/arch/pinmux.h>
diff --git a/board/samsung/smdkc100/smdkc100.c b/board/samsung/smdkc100/smdkc100.c
index 13c057b426..a80300b0c0 100644
--- a/board/samsung/smdkc100/smdkc100.c
+++ b/board/samsung/smdkc100/smdkc100.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <asm/arch/sromc.h>
diff --git a/board/samsung/smdkv310/smdkv310.c b/board/samsung/smdkv310/smdkv310.c
index 0eba7b66ee..05369d2227 100644
--- a/board/samsung/smdkv310/smdkv310.c
+++ b/board/samsung/smdkv310/smdkv310.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <netdev.h>
diff --git a/board/seco/mx6quq7/mx6quq7.c b/board/seco/mx6quq7/mx6quq7.c
index c1e36b652e..671fba283e 100644
--- a/board/seco/mx6quq7/mx6quq7.c
+++ b/board/seco/mx6quq7/mx6quq7.c
@@ -7,6 +7,7 @@
  * Modified by: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
+#include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/imx-regs.h>
 #include <asm/arch/iomux.h>
diff --git a/board/siemens/corvus/board.c b/board/siemens/corvus/board.c
index a569bd53af..03768201c3 100644
--- a/board/siemens/corvus/board.c
+++ b/board/siemens/corvus/board.c
@@ -12,6 +12,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9g45_matrix.h>
 #include <asm/arch/at91sam9_smc.h>
diff --git a/board/siemens/smartweb/smartweb.c b/board/siemens/smartweb/smartweb.c
index e1be384994..cb7206a561 100644
--- a/board/siemens/smartweb/smartweb.c
+++ b/board/siemens/smartweb/smartweb.c
@@ -17,6 +17,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9_sdramc.h>
 #include <asm/arch/at91sam9260_matrix.h>
diff --git a/board/siemens/taurus/taurus.c b/board/siemens/taurus/taurus.c
index 1cf1f9e1f7..0979df563a 100644
--- a/board/siemens/taurus/taurus.c
+++ b/board/siemens/taurus/taurus.c
@@ -15,6 +15,7 @@
 #include <common.h>
 #include <dm.h>
 #include <env.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/arch/at91sam9260_matrix.h>
 #include <asm/arch/at91sam9_smc.h>
diff --git a/board/socrates/sdram.c b/board/socrates/sdram.c
index 4c76b4d0a8..9ee6f3d154 100644
--- a/board/socrates/sdram.c
+++ b/board/socrates/sdram.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/processor.h>
 #include <asm/immap_85xx.h>
 #include <fsl_ddr_sdram.h>
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index b9450a0e36..a7c4f7f71c 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -13,6 +13,7 @@
 #include <common.h>
 #include <dm.h>
 #include <env.h>
+#include <init.h>
 #include <mmc.h>
 #include <axp_pmic.h>
 #include <generic-phy.h>
diff --git a/board/sysam/amcore/amcore.c b/board/sysam/amcore/amcore.c
index 0efea3d5cc..4502005941 100644
--- a/board/sysam/amcore/amcore.c
+++ b/board/sysam/amcore/amcore.c
@@ -8,6 +8,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/immap.h>
 #include <asm/io.h>
 #include <dm.h>
diff --git a/board/technexion/pico-imx6ul/spl.c b/board/technexion/pico-imx6ul/spl.c
index ae51113f32..d3cbaf3989 100644
--- a/board/technexion/pico-imx6ul/spl.c
+++ b/board/technexion/pico-imx6ul/spl.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/iomux.h>
 #include <asm/arch/imx-regs.h>
diff --git a/board/technologic/ts4800/ts4800.c b/board/technologic/ts4800/ts4800.c
index 82eb0c285c..ff1a189c7e 100644
--- a/board/technologic/ts4800/ts4800.c
+++ b/board/technologic/ts4800/ts4800.c
@@ -7,6 +7,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <asm/arch/imx-regs.h>
diff --git a/board/ti/ks2_evm/board.c b/board/ti/ks2_evm/board.c
index e3305fbaf6..da98c1c739 100644
--- a/board/ti/ks2_evm/board.c
+++ b/board/ti/ks2_evm/board.c
@@ -9,6 +9,7 @@
 #include <common.h>
 #include "board.h"
 #include <env.h>
+#include <init.h>
 #include <spl.h>
 #include <exports.h>
 #include <fdt_support.h>
diff --git a/board/timll/devkit3250/devkit3250.c b/board/timll/devkit3250/devkit3250.c
index a4b963d463..b455844c89 100644
--- a/board/timll/devkit3250/devkit3250.c
+++ b/board/timll/devkit3250/devkit3250.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/arch/sys_proto.h>
 #include <asm/arch/clk.h>
 #include <asm/arch/cpu.h>
diff --git a/board/toradex/colibri_imx7/colibri_imx7.c b/board/toradex/colibri_imx7/colibri_imx7.c
index 15257b68e2..caa34abc68 100644
--- a/board/toradex/colibri_imx7/colibri_imx7.c
+++ b/board/toradex/colibri_imx7/colibri_imx7.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2016-2018 Toradex AG
  */
 
+#include <common.h>
 #include <cpu_func.h>
+#include <init.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/crm_regs.h>
 #include <asm/arch/imx-regs.h>
diff --git a/board/tqc/tqm834x/tqm834x.c b/board/tqc/tqm834x/tqm834x.c
index 95f95a5c82..02b3d2dea1 100644
--- a/board/tqc/tqm834x/tqm834x.c
+++ b/board/tqc/tqm834x/tqm834x.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <fdt_support.h>
+#include <init.h>
 #include <ioports.h>
 #include <mpc83xx.h>
 #include <asm/mpc8349_pci.h>
diff --git a/board/ve8313/ve8313.c b/board/ve8313/ve8313.c
index 2ea762ccfa..d1c9535f46 100644
--- a/board/ve8313/ve8313.c
+++ b/board/ve8313/ve8313.c
@@ -82,7 +82,7 @@ static long fixed_sdram(void)
 
 	/* now check the real size */
 	disable_addr_trans ();
-	msize = get_ram_size (CONFIG_SYS_SDRAM_BASE, msize);
+	msize = get_ram_size(CONFIG_SYS_SDRAM_BASE, msize);
 	enable_addr_trans ();
 #endif
 
diff --git a/board/woodburn/woodburn.c b/board/woodburn/woodburn.c
index 5cab3f4487..c69df6c7bf 100644
--- a/board/woodburn/woodburn.c
+++ b/board/woodburn/woodburn.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 #include <asm/io.h>
 #include <linux/errno.h>
 #include <asm/arch/imx-regs.h>
diff --git a/cmd/ti/ddr3.c b/cmd/ti/ddr3.c
index 55130898c9..a452fe7876 100644
--- a/cmd/ti/ddr3.c
+++ b/cmd/ti/ddr3.c
@@ -6,6 +6,7 @@
  */
 
 #include <cpu_func.h>
+#include <init.h>
 #include <asm/arch/hardware.h>
 #include <asm/cache.h>
 #include <asm/emif.h>
diff --git a/common/memsize.c b/common/memsize.c
index 13b0047786..e95c68265a 100644
--- a/common/memsize.c
+++ b/common/memsize.c
@@ -5,6 +5,7 @@
  */
 
 #include <common.h>
+#include <init.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
diff --git a/drivers/ddr/altera/sdram_gen5.c b/drivers/ddr/altera/sdram_gen5.c
index 8c8ea19eb9..ed46e49143 100644
--- a/drivers/ddr/altera/sdram_gen5.c
+++ b/drivers/ddr/altera/sdram_gen5.c
@@ -6,6 +6,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <div64.h>
+#include <init.h>
 #include <ram.h>
 #include <reset.h>
 #include <watchdog.h>
diff --git a/drivers/ddr/altera/sdram_s10.c b/drivers/ddr/altera/sdram_s10.c
index 82d9a13efa..f61aad2e9a 100644
--- a/drivers/ddr/altera/sdram_s10.c
+++ b/drivers/ddr/altera/sdram_s10.c
@@ -10,6 +10,7 @@
 #include <errno.h>
 #include <div64.h>
 #include <fdtdec.h>
+#include <init.h>
 #include <ram.h>
 #include <reset.h>
 #include "sdram_s10.h"
diff --git a/drivers/ram/bmips_ram.c b/drivers/ram/bmips_ram.c
index 3e1dd9e241..8f953e79af 100644
--- a/drivers/ram/bmips_ram.c
+++ b/drivers/ram/bmips_ram.c
@@ -10,6 +10,7 @@
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
+#include <init.h>
 #include <ram.h>
 #include <asm/io.h>
 
diff --git a/drivers/ram/mpc83xx_sdram.c b/drivers/ram/mpc83xx_sdram.c
index f03d0428b2..46449d3d12 100644
--- a/drivers/ram/mpc83xx_sdram.c
+++ b/drivers/ram/mpc83xx_sdram.c
@@ -6,6 +6,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <init.h>
 #include <ram.h>
 #include <dt-bindings/memory/mpc83xx-sdram.h>
 
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index a362cf98bf..eb78f1198d 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -6,6 +6,7 @@
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
+#include <init.h>
 #include <ram.h>
 #include <regmap.h>
 #include <syscon.h>
diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index 581ee4897f..12298cf327 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -4,6 +4,7 @@
  */
 #include <common.h>
 #include <console.h>
+#include <init.h>
 #include <watchdog.h>
 #include <asm/io.h>
 #include <linux/log2.h>
diff --git a/include/common.h b/include/common.h
index c69bad9771..f9ad184f4a 100644
--- a/include/common.h
+++ b/include/common.h
@@ -59,10 +59,6 @@ void	hang		(void) __attribute__ ((noreturn));
 
 #include <display_options.h>
 
-/* common/memsize.c */
-long	get_ram_size  (long *, long);
-phys_size_t get_effective_memsize(void);
-
 #if defined(CONFIG_SYS_DRAM_TEST)
 int testdram(void);
 #endif /* CONFIG_SYS_DRAM_TEST */
diff --git a/include/init.h b/include/init.h
index ba0d4bc973..3dc109b209 100644
--- a/include/init.h
+++ b/include/init.h
@@ -95,6 +95,9 @@ int dram_init(void);
  */
 int dram_init_banksize(void);
 
+long get_ram_size(long *base, long size);
+phys_size_t get_effective_memsize(void);
+
 /**
  * arch_reserve_stacks() - Reserve all necessary stacks
  *
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 61af3472e6..f1bdc9f2e2 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -7,6 +7,7 @@
 #include <common.h>
 #include <boot_fit.h>
 #include <dm.h>
+#include <init.h>
 #include <dm/of_extra.h>
 #include <env.h>
 #include <errno.h>
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
