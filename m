Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645436C16C
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Apr 2021 11:02:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11A67C424BD;
	Tue, 27 Apr 2021 09:02:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBAF2C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Apr 2021 09:02:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13R9232W007999; Tue, 27 Apr 2021 11:02:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=AnR5863WaVqmu8U2Ea8shrcE8zbYmIoR3M+D5klmKHw=;
 b=gHUgnXbv9OdStW/ylJShMljtKyNfjfGe3Q5q6758rJJntrnzEWNJIfxNTOKZ45YcUtq/
 tknniUKryy5iT/1kVKF0BaTXUSzdFDmdhKA3lMJOilmPYNl5obf6PSgyNsfC8tbXk6Lq
 dOc9SnW0f1RAnnr52fHwASK0Gscz3E2HngZyZScLImBaC7iK6lLKVblIKesMMDi29Tvo
 1iJWKhZREjaj5eca10BkWnISeT5c86r6ziewNwboT1DWaGTdklRRh4NoUFWAkbNdqKE2
 sUgatofJUIjuFFBChljz9acz61B0pq+l4eueAYvdKxZ7mJo7a1U1SpPL/Z9ZmE5UGwRR Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38675r2hn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 11:02:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8495E100034;
 Tue, 27 Apr 2021 11:02:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C533208F44;
 Tue, 27 Apr 2021 11:02:22 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Apr 2021 11:02:21
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 27 Apr 2021 11:02:19 +0200
Message-ID: <20210427110153.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_05:2021-04-27,
 2021-04-27 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] dm: define LOG_CATEGORY for all uclass
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

Define LOG_CATEGORY for all uclass to allow filtering with
log command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/adc/adc-uclass.c                    | 2 ++
 drivers/ata/ahci-uclass.c                   | 2 ++
 drivers/axi/axi-emul-uclass.c               | 2 ++
 drivers/axi/axi-uclass.c                    | 2 ++
 drivers/block/blk-uclass.c                  | 2 ++
 drivers/block/ide.c                         | 2 ++
 drivers/bootcount/bootcount-uclass.c        | 2 ++
 drivers/button/button-uclass.c              | 2 ++
 drivers/cache/cache-uclass.c                | 2 ++
 drivers/clk/clk-uclass.c                    | 2 ++
 drivers/core/root.c                         | 2 ++
 drivers/core/simple-bus.c                   | 2 ++
 drivers/cpu/cpu-uclass.c                    | 2 ++
 drivers/crypto/rsa_mod_exp/mod_exp_uclass.c | 2 ++
 drivers/dma/dma-uclass.c                    | 2 ++
 drivers/firmware/firmware-uclass.c          | 2 ++
 drivers/hwspinlock/hwspinlock-uclass.c      | 2 ++
 drivers/i2c/i2c-emul-uclass.c               | 2 ++
 drivers/i2c/i2c-uclass.c                    | 2 ++
 drivers/i2c/muxes/i2c-mux-uclass.c          | 2 ++
 drivers/input/keyboard-uclass.c             | 2 ++
 drivers/led/led-uclass.c                    | 2 ++
 drivers/mailbox/mailbox-uclass.c            | 2 ++
 drivers/misc/fs_loader.c                    | 3 +++
 drivers/misc/i2c_eeprom.c                   | 2 ++
 drivers/misc/misc-uclass.c                  | 2 ++
 drivers/misc/p2sb-uclass.c                  | 2 ++
 drivers/misc/pwrseq-uclass.c                | 2 ++
 drivers/mmc/mmc-uclass.c                    | 2 ++
 drivers/mtd/mtd-uclass.c                    | 2 ++
 drivers/mtd/spi/sf-uclass.c                 | 2 ++
 drivers/mux/mux-uclass.c                    | 2 ++
 drivers/nvme/nvme-uclass.c                  | 2 ++
 drivers/pch/pch-uclass.c                    | 2 ++
 drivers/pci/pci-uclass.c                    | 2 ++
 drivers/pci_endpoint/pci_ep-uclass.c        | 2 ++
 drivers/phy/phy-uclass.c                    | 2 ++
 drivers/pinctrl/pinctrl-uclass.c            | 2 ++
 drivers/power/domain/power-domain-uclass.c  | 2 ++
 drivers/power/pmic/pmic-uclass.c            | 2 ++
 drivers/power/regulator/regulator-uclass.c  | 2 ++
 drivers/pwm/pwm-uclass.c                    | 2 ++
 drivers/ram/ram-uclass.c                    | 2 ++
 drivers/remoteproc/rproc-uclass.c           | 3 +++
 drivers/reset/reset-uclass.c                | 2 ++
 drivers/rng/rng-uclass.c                    | 2 ++
 drivers/rtc/rtc-uclass.c                    | 2 ++
 drivers/scsi/scsi-uclass.c                  | 2 ++
 drivers/serial/serial-uclass.c              | 2 ++
 drivers/smem/smem-uclass.c                  | 2 ++
 drivers/soc/soc-uclass.c                    | 2 ++
 drivers/sound/codec-uclass.c                | 2 ++
 drivers/sound/i2s-uclass.c                  | 2 ++
 drivers/sound/sound-uclass.c                | 2 ++
 drivers/spi/spi-emul-uclass.c               | 2 ++
 drivers/spmi/spmi-uclass.c                  | 2 ++
 drivers/sysinfo/sysinfo-uclass.c            | 2 ++
 drivers/tee/tee-uclass.c                    | 2 ++
 drivers/thermal/thermal-uclass.c            | 2 ++
 drivers/timer/timer-uclass.c                | 2 ++
 drivers/ufs/ufs-uclass.c                    | 2 ++
 drivers/usb/emul/usb-emul-uclass.c          | 2 ++
 drivers/usb/gadget/udc/udc-uclass.c         | 2 ++
 drivers/usb/host/usb-uclass.c               | 2 ++
 drivers/video/backlight-uclass.c            | 2 ++
 drivers/video/bridge/video-bridge-uclass.c  | 2 ++
 drivers/video/display-uclass.c              | 2 ++
 drivers/video/dsi-host-uclass.c             | 2 ++
 drivers/video/panel-uclass.c                | 2 ++
 drivers/video/vidconsole-uclass.c           | 2 ++
 drivers/video/video-uclass.c                | 2 ++
 drivers/video/video_osd-uclass.c            | 2 ++
 drivers/virtio/virtio-uclass.c              | 2 ++
 drivers/w1-eeprom/w1-eeprom-uclass.c        | 2 ++
 drivers/w1/w1-uclass.c                      | 2 ++
 drivers/watchdog/wdt-uclass.c               | 2 ++
 drivers/xen/pvblock.c                       | 3 +++
 77 files changed, 157 insertions(+)

diff --git a/drivers/adc/adc-uclass.c b/drivers/adc/adc-uclass.c
index 8781f32855..67137ffb34 100644
--- a/drivers/adc/adc-uclass.c
+++ b/drivers/adc/adc-uclass.c
@@ -4,6 +4,8 @@
  * Przemyslaw Marczak <p.marczak@samsung.com>
  */
 
+#define LOG_CATEGORY UCLASS_ADC
+
 #include <common.h>
 #include <errno.h>
 #include <div64.h>
diff --git a/drivers/ata/ahci-uclass.c b/drivers/ata/ahci-uclass.c
index c4c7a03fe7..d398b50b9a 100644
--- a/drivers/ata/ahci-uclass.c
+++ b/drivers/ata/ahci-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_AHCI
+
 #include <common.h>
 #include <ahci.h>
 #include <dm.h>
diff --git a/drivers/axi/axi-emul-uclass.c b/drivers/axi/axi-emul-uclass.c
index b28351f1ad..793336d8c4 100644
--- a/drivers/axi/axi-emul-uclass.c
+++ b/drivers/axi/axi-emul-uclass.c
@@ -4,6 +4,8 @@
  * Mario Six, Guntermann & Drunck GmbH, mario.six@gdsys.cc
  */
 
+#define LOG_CATEGORY UCLASS_AXI_EMUL
+
 #include <common.h>
 #include <axi.h>
 #include <dm.h>
diff --git a/drivers/axi/axi-uclass.c b/drivers/axi/axi-uclass.c
index af8acd9f88..afb4844ecb 100644
--- a/drivers/axi/axi-uclass.c
+++ b/drivers/axi/axi-uclass.c
@@ -4,6 +4,8 @@
  * Mario Six,  Guntermann & Drunck GmbH, mario.six@gdsys.cc
  */
 
+#define LOG_CATEGORY UCLASS_AXI
+
 #include <common.h>
 #include <dm.h>
 #include <axi.h>
diff --git a/drivers/block/blk-uclass.c b/drivers/block/blk-uclass.c
index d0d91db540..dfc0d46970 100644
--- a/drivers/block/blk-uclass.c
+++ b/drivers/block/blk-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_BLK
+
 #include <common.h>
 #include <blk.h>
 #include <dm.h>
diff --git a/drivers/block/ide.c b/drivers/block/ide.c
index 862a85bc87..c99076c6f4 100644
--- a/drivers/block/ide.c
+++ b/drivers/block/ide.c
@@ -4,6 +4,8 @@
  * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
  */
 
+#define LOG_CATEGORY UCLASS_IDE
+
 #include <common.h>
 #include <ata.h>
 #include <blk.h>
diff --git a/drivers/bootcount/bootcount-uclass.c b/drivers/bootcount/bootcount-uclass.c
index 34ac08d59a..c747c9ab27 100644
--- a/drivers/bootcount/bootcount-uclass.c
+++ b/drivers/bootcount/bootcount-uclass.c
@@ -3,6 +3,8 @@
  * (C) Copyright 2018 Theobroma Systems Design und Consulting GmbH
  */
 
+#define LOG_CATEGORY UCLASS_BOOTCOUNT
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/button/button-uclass.c b/drivers/button/button-uclass.c
index e06d3eb7da..e33ed7d01d 100644
--- a/drivers/button/button-uclass.c
+++ b/drivers/button/button-uclass.c
@@ -5,6 +5,8 @@
  * Based on led-uclass.c
  */
 
+#define LOG_CATEGORY UCLASS_BUTTON
+
 #include <common.h>
 #include <button.h>
 #include <dm.h>
diff --git a/drivers/cache/cache-uclass.c b/drivers/cache/cache-uclass.c
index 3b20a10f08..0c13dbdb75 100644
--- a/drivers/cache/cache-uclass.c
+++ b/drivers/cache/cache-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2019 Intel Corporation <www.intel.com>
  */
 
+#define LOG_CATEGORY UCLASS_CACHE
+
 #include <common.h>
 #include <cache.h>
 #include <dm.h>
diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
index 4ab3c402ed..24fdf9511b 100644
--- a/drivers/clk/clk-uclass.c
+++ b/drivers/clk/clk-uclass.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2018, Theobroma Systems Design und Consulting GmbH
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk.h>
 #include <clk-uclass.h>
diff --git a/drivers/core/root.c b/drivers/core/root.c
index d9a19c5e6b..b007447ff0 100644
--- a/drivers/core/root.c
+++ b/drivers/core/root.c
@@ -6,6 +6,8 @@
  * Pavel Herrmann <morpheus.ibis@gmail.com>
  */
 
+#define LOG_CATEGORY UCLASS_ROOT
+
 #include <common.h>
 #include <errno.h>
 #include <fdtdec.h>
diff --git a/drivers/core/simple-bus.c b/drivers/core/simple-bus.c
index 18f52d26df..abc55c2171 100644
--- a/drivers/core/simple-bus.c
+++ b/drivers/core/simple-bus.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_SIMPLE_BUS
+
 #include <common.h>
 #include <asm/global_data.h>
 #include <dm.h>
diff --git a/drivers/cpu/cpu-uclass.c b/drivers/cpu/cpu-uclass.c
index 1c338bad9a..a5cda6a62c 100644
--- a/drivers/cpu/cpu-uclass.c
+++ b/drivers/cpu/cpu-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_CPU
+
 #include <common.h>
 #include <cpu.h>
 #include <dm.h>
diff --git a/drivers/crypto/rsa_mod_exp/mod_exp_uclass.c b/drivers/crypto/rsa_mod_exp/mod_exp_uclass.c
index f5ae35e132..6a4d235d57 100644
--- a/drivers/crypto/rsa_mod_exp/mod_exp_uclass.c
+++ b/drivers/crypto/rsa_mod_exp/mod_exp_uclass.c
@@ -4,6 +4,8 @@
  * Author: Ruchika Gupta <ruchika.gupta@freescale.com>
  */
 
+#define LOG_CATEGORY UCLASS_MOD_EXP
+
 #include <common.h>
 #include <dm.h>
 #include <asm/global_data.h>
diff --git a/drivers/dma/dma-uclass.c b/drivers/dma/dma-uclass.c
index a93b0b7ba0..652ddbb62b 100644
--- a/drivers/dma/dma-uclass.c
+++ b/drivers/dma/dma-uclass.c
@@ -9,6 +9,8 @@
  * Author: Mugunthan V N <mugunthanvnm@ti.com>
  */
 
+#define LOG_CATEGORY UCLASS_DMA
+
 #include <common.h>
 #include <cpu_func.h>
 #include <dm.h>
diff --git a/drivers/firmware/firmware-uclass.c b/drivers/firmware/firmware-uclass.c
index 7fcd7fb904..bfaf283eed 100644
--- a/drivers/firmware/firmware-uclass.c
+++ b/drivers/firmware/firmware-uclass.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#define LOG_CATEGORY UCLASS_FIRMWARE
+
 #include <common.h>
 #include <dm.h>
 
diff --git a/drivers/hwspinlock/hwspinlock-uclass.c b/drivers/hwspinlock/hwspinlock-uclass.c
index 8997243421..cbe7236011 100644
--- a/drivers/hwspinlock/hwspinlock-uclass.c
+++ b/drivers/hwspinlock/hwspinlock-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_HWSPINLOCK
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/i2c/i2c-emul-uclass.c b/drivers/i2c/i2c-emul-uclass.c
index 7917b63c55..aeec6aa9fa 100644
--- a/drivers/i2c/i2c-emul-uclass.c
+++ b/drivers/i2c/i2c-emul-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_I2C_EMUL
+
 #include <common.h>
 #include <dm.h>
 #include <i2c.h>
diff --git a/drivers/i2c/i2c-uclass.c b/drivers/i2c/i2c-uclass.c
index be56785217..04c88503a2 100644
--- a/drivers/i2c/i2c-uclass.c
+++ b/drivers/i2c/i2c-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_I2C
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/i2c/muxes/i2c-mux-uclass.c b/drivers/i2c/muxes/i2c-mux-uclass.c
index dbca409ee3..a5d1bb0576 100644
--- a/drivers/i2c/muxes/i2c-mux-uclass.c
+++ b/drivers/i2c/muxes/i2c-mux-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_I2C_MUX
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/input/keyboard-uclass.c b/drivers/input/keyboard-uclass.c
index 2c6680337d..aefc8e825e 100644
--- a/drivers/input/keyboard-uclass.c
+++ b/drivers/input/keyboard-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_KEYBOARD
+
 #include <common.h>
 #include <dm.h>
 #include <keyboard.h>
diff --git a/drivers/led/led-uclass.c b/drivers/led/led-uclass.c
index e15a2967ff..7e298dbb06 100644
--- a/drivers/led/led-uclass.c
+++ b/drivers/led/led-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_LED
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/mailbox/mailbox-uclass.c b/drivers/mailbox/mailbox-uclass.c
index c972d84608..01c9e75fa5 100644
--- a/drivers/mailbox/mailbox-uclass.c
+++ b/drivers/mailbox/mailbox-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.
  */
 
+#define LOG_CATEGORY UCLASS_MAILBOX
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/misc/fs_loader.c b/drivers/misc/fs_loader.c
index e77b3af770..0139bd66ba 100644
--- a/drivers/misc/fs_loader.c
+++ b/drivers/misc/fs_loader.c
@@ -3,6 +3,9 @@
  * Copyright (C) 2018-2019 Intel Corporation <www.intel.com>
  *
  */
+
+#define LOG_CATEGORY UCLASS_FS_FIRMWARE_LOADER
+
 #include <common.h>
 #include <dm.h>
 #include <env.h>
diff --git a/drivers/misc/i2c_eeprom.c b/drivers/misc/i2c_eeprom.c
index 5926c91a2e..3b249842f8 100644
--- a/drivers/misc/i2c_eeprom.c
+++ b/drivers/misc/i2c_eeprom.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_I2C_EEPROM
+
 #include <common.h>
 #include <eeprom.h>
 #include <linux/delay.h>
diff --git a/drivers/misc/misc-uclass.c b/drivers/misc/misc-uclass.c
index 55381edc98..72720b0e59 100644
--- a/drivers/misc/misc-uclass.c
+++ b/drivers/misc/misc-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2010 Thomas Chou <thomas@wytron.com.tw>
  */
 
+#define LOG_CATEGORY UCLASS_MISC
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/misc/p2sb-uclass.c b/drivers/misc/p2sb-uclass.c
index ac2852559f..94d273de9b 100644
--- a/drivers/misc/p2sb-uclass.c
+++ b/drivers/misc/p2sb-uclass.c
@@ -6,6 +6,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_P2SB
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/misc/pwrseq-uclass.c b/drivers/misc/pwrseq-uclass.c
index c8f6c46069..a0f24e1bf3 100644
--- a/drivers/misc/pwrseq-uclass.c
+++ b/drivers/misc/pwrseq-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_PWRSEQ
+
 #include <common.h>
 #include <dm.h>
 #include <pwrseq.h>
diff --git a/drivers/mmc/mmc-uclass.c b/drivers/mmc/mmc-uclass.c
index d36aae367e..bfdb21af3e 100644
--- a/drivers/mmc/mmc-uclass.c
+++ b/drivers/mmc/mmc-uclass.c
@@ -5,6 +5,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_MMC
+
 #include <common.h>
 #include <log.h>
 #include <mmc.h>
diff --git a/drivers/mtd/mtd-uclass.c b/drivers/mtd/mtd-uclass.c
index 9f5f672ba3..81dba7750f 100644
--- a/drivers/mtd/mtd-uclass.c
+++ b/drivers/mtd/mtd-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2015 Thomas Chou <thomas@wytron.com.tw>
  */
 
+#define LOG_CATEGORY UCLASS_MTD
+
 #include <common.h>
 #include <dm.h>
 #include <dm/device-internal.h>
diff --git a/drivers/mtd/spi/sf-uclass.c b/drivers/mtd/spi/sf-uclass.c
index cfce00ef54..63d16291ff 100644
--- a/drivers/mtd/spi/sf-uclass.c
+++ b/drivers/mtd/spi/sf-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_SPI_FLASH
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/mux/mux-uclass.c b/drivers/mux/mux-uclass.c
index 6d28dbe4d1..91842c5539 100644
--- a/drivers/mux/mux-uclass.c
+++ b/drivers/mux/mux-uclass.c
@@ -11,6 +11,8 @@
  * Jean-Jacques Hiblot <jjhiblot@ti.com>
  */
 
+#define LOG_CATEGORY UCLASS_MUX
+
 #include <common.h>
 #include <dm.h>
 #include <mux-internal.h>
diff --git a/drivers/nvme/nvme-uclass.c b/drivers/nvme/nvme-uclass.c
index 277e31e1f3..65ceabf840 100644
--- a/drivers/nvme/nvme-uclass.c
+++ b/drivers/nvme/nvme-uclass.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2017 Bin Meng <bmeng.cn@gmail.com>
  */
 
+#define LOG_CATEGORY UCLASS_NVME
+
 #include <common.h>
 #include <blk.h>
 #include <errno.h>
diff --git a/drivers/pch/pch-uclass.c b/drivers/pch/pch-uclass.c
index ad4906aa58..7bc2372e96 100644
--- a/drivers/pch/pch-uclass.c
+++ b/drivers/pch/pch-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_PCH
+
 #include <common.h>
 #include <dm.h>
 #include <pch.h>
diff --git a/drivers/pci/pci-uclass.c b/drivers/pci/pci-uclass.c
index dfd54b339f..c46da72c03 100644
--- a/drivers/pci/pci-uclass.c
+++ b/drivers/pci/pci-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_PCI
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/pci_endpoint/pci_ep-uclass.c b/drivers/pci_endpoint/pci_ep-uclass.c
index 5555cf5a8c..6ee4cfbdb4 100644
--- a/drivers/pci_endpoint/pci_ep-uclass.c
+++ b/drivers/pci_endpoint/pci_ep-uclass.c
@@ -9,6 +9,8 @@
  * Written by Ramon Fried <ramon.fried@gmail.com>
  */
 
+#define LOG_CATEGORY UCLASS_PCI_EP
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/phy/phy-uclass.c b/drivers/phy/phy-uclass.c
index 43ffbcee0f..59683a080c 100644
--- a/drivers/phy/phy-uclass.c
+++ b/drivers/phy/phy-uclass.c
@@ -4,6 +4,8 @@
  * Written by Jean-Jacques Hiblot  <jjhiblot@ti.com>
  */
 
+#define LOG_CATEGORY UCLASS_PHY
+
 #include <common.h>
 #include <dm.h>
 #include <dm/device_compat.h>
diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 6e68e52c32..ea7275ca00 100644
--- a/drivers/pinctrl/pinctrl-uclass.c
+++ b/drivers/pinctrl/pinctrl-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2015  Masahiro Yamada <yamada.masahiro@socionext.com>
  */
 
+#define LOG_CATEGORY UCLASS_PINCTRL
+
 #include <common.h>
 #include <malloc.h>
 #include <asm/global_data.h>
diff --git a/drivers/power/domain/power-domain-uclass.c b/drivers/power/domain/power-domain-uclass.c
index af829db9da..00d1489ea2 100644
--- a/drivers/power/domain/power-domain-uclass.c
+++ b/drivers/power/domain/power-domain-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.
  */
 
+#define LOG_CATEGORY UCLASS_POWER_DOMAIN
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/power/pmic/pmic-uclass.c b/drivers/power/pmic/pmic-uclass.c
index 79166b8bbc..5dcf6d8079 100644
--- a/drivers/power/pmic/pmic-uclass.c
+++ b/drivers/power/pmic/pmic-uclass.c
@@ -4,6 +4,8 @@
  * Przemyslaw Marczak <p.marczak@samsung.com>
  */
 
+#define LOG_CATEGORY UCLASS_PMIC
+
 #include <common.h>
 #include <fdtdec.h>
 #include <errno.h>
diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 4d2e730271..3aef3b650e 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -4,6 +4,8 @@
  * Przemyslaw Marczak <p.marczak@samsung.com>
  */
 
+#define LOG_CATEGORY UCLASS_REGULATOR
+
 #include <common.h>
 #include <errno.h>
 #include <dm.h>
diff --git a/drivers/pwm/pwm-uclass.c b/drivers/pwm/pwm-uclass.c
index 027181c646..648d0757ba 100644
--- a/drivers/pwm/pwm-uclass.c
+++ b/drivers/pwm/pwm-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_PWM
+
 #include <common.h>
 #include <dm.h>
 #include <pwm.h>
diff --git a/drivers/ram/ram-uclass.c b/drivers/ram/ram-uclass.c
index f4d387fed1..4e21240fd4 100644
--- a/drivers/ram/ram-uclass.c
+++ b/drivers/ram/ram-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <ram.h>
 #include <dm.h>
diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
index 5919c8bb97..64c47c1e72 100644
--- a/drivers/remoteproc/rproc-uclass.c
+++ b/drivers/remoteproc/rproc-uclass.c
@@ -3,6 +3,9 @@
  * (C) Copyright 2015
  * Texas Instruments Incorporated - http://www.ti.com/
  */
+
+#define LOG_CATEGORY UCLASS_REMOTEPROC
+
 #define pr_fmt(fmt) "%s: " fmt, __func__
 #include <common.h>
 #include <errno.h>
diff --git a/drivers/reset/reset-uclass.c b/drivers/reset/reset-uclass.c
index 071c389ca0..78df4623b7 100644
--- a/drivers/reset/reset-uclass.c
+++ b/drivers/reset/reset-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, NVIDIA CORPORATION.
  */
 
+#define LOG_CATEGORY UCLASS_RESET
+
 #include <common.h>
 #include <dm.h>
 #include <fdtdec.h>
diff --git a/drivers/rng/rng-uclass.c b/drivers/rng/rng-uclass.c
index b6af3b8606..53108e1b31 100644
--- a/drivers/rng/rng-uclass.c
+++ b/drivers/rng/rng-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2019, Linaro Limited
  */
 
+#define LOG_CATEGORY UCLASS_RNG
+
 #include <common.h>
 #include <dm.h>
 #include <rng.h>
diff --git a/drivers/rtc/rtc-uclass.c b/drivers/rtc/rtc-uclass.c
index b406bab32d..be6a2ddb66 100644
--- a/drivers/rtc/rtc-uclass.c
+++ b/drivers/rtc/rtc-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_RTC
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/scsi/scsi-uclass.c b/drivers/scsi/scsi-uclass.c
index 90a0adda47..a7c1eaf0cf 100644
--- a/drivers/scsi/scsi-uclass.c
+++ b/drivers/scsi/scsi-uclass.c
@@ -8,6 +8,8 @@
  * Based on ahci-uclass.c
  */
 
+#define LOG_CATEGORY UCLASS_SCSI
+
 #include <common.h>
 #include <dm.h>
 #include <scsi.h>
diff --git a/drivers/serial/serial-uclass.c b/drivers/serial/serial-uclass.c
index 8a87eed683..2b4feace53 100644
--- a/drivers/serial/serial-uclass.c
+++ b/drivers/serial/serial-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 The Chromium OS Authors.
  */
 
+#define LOG_CATEGORY UCLASS_SERIAL
+
 #include <common.h>
 #include <dm.h>
 #include <env_internal.h>
diff --git a/drivers/smem/smem-uclass.c b/drivers/smem/smem-uclass.c
index ce7bf40656..8469076915 100644
--- a/drivers/smem/smem-uclass.c
+++ b/drivers/smem/smem-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2018 Ramon Fried <ramon.fried@gmail.com>
  */
 
+#define LOG_CATEGORY UCLASS_SMEM
+
 #include <common.h>
 #include <dm.h>
 #include <smem.h>
diff --git a/drivers/soc/soc-uclass.c b/drivers/soc/soc-uclass.c
index c32d647864..dfad32d80d 100644
--- a/drivers/soc/soc-uclass.c
+++ b/drivers/soc/soc-uclass.c
@@ -4,6 +4,8 @@
  *	Dave Gerlach <d-gerlach@ti.com>
  */
 
+#define LOG_CATEGORY UCLASS_SOC
+
 #include <common.h>
 #include <soc.h>
 #include <dm.h>
diff --git a/drivers/sound/codec-uclass.c b/drivers/sound/codec-uclass.c
index 1ec77acfc1..2cb233bd30 100644
--- a/drivers/sound/codec-uclass.c
+++ b/drivers/sound/codec-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_AUDIO_CODEC
+
 #include <common.h>
 #include <dm.h>
 #include <audio_codec.h>
diff --git a/drivers/sound/i2s-uclass.c b/drivers/sound/i2s-uclass.c
index 2639c86ea2..fc4f686b51 100644
--- a/drivers/sound/i2s-uclass.c
+++ b/drivers/sound/i2s-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_I2S
+
 #include <common.h>
 #include <dm.h>
 #include <i2s.h>
diff --git a/drivers/sound/sound-uclass.c b/drivers/sound/sound-uclass.c
index 0c71e01f33..2ffc4fc7c1 100644
--- a/drivers/sound/sound-uclass.c
+++ b/drivers/sound/sound-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_SOUND
+
 #include <common.h>
 #include <dm.h>
 #include <i2s.h>
diff --git a/drivers/spi/spi-emul-uclass.c b/drivers/spi/spi-emul-uclass.c
index 52f3f9a011..64bc19c001 100644
--- a/drivers/spi/spi-emul-uclass.c
+++ b/drivers/spi/spi-emul-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_SPI_EMUL
+
 #include <common.h>
 #include <dm.h>
 #include <spi.h>
diff --git a/drivers/spmi/spmi-uclass.c b/drivers/spmi/spmi-uclass.c
index ff098731bb..9d9f46a37d 100644
--- a/drivers/spmi/spmi-uclass.c
+++ b/drivers/spmi/spmi-uclass.c
@@ -5,6 +5,8 @@
  * (C) Copyright 2015 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
  */
 
+#define LOG_CATEGORY UCLASS_SPMI
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/sysinfo/sysinfo-uclass.c b/drivers/sysinfo/sysinfo-uclass.c
index 6df58fe160..0e87bb0e54 100644
--- a/drivers/sysinfo/sysinfo-uclass.c
+++ b/drivers/sysinfo/sysinfo-uclass.c
@@ -4,6 +4,8 @@
  * Mario Six,  Guntermann & Drunck GmbH, mario.six@gdsys.cc
  */
 
+#define LOG_CATEGORY UCLASS_SYSINFO
+
 #include <common.h>
 #include <dm.h>
 #include <sysinfo.h>
diff --git a/drivers/tee/tee-uclass.c b/drivers/tee/tee-uclass.c
index 2cc6b6c407..cb1b28e2f8 100644
--- a/drivers/tee/tee-uclass.c
+++ b/drivers/tee/tee-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2018 Linaro Limited
  */
 
+#define LOG_CATEGORY UCLASS_TEE
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/thermal/thermal-uclass.c b/drivers/thermal/thermal-uclass.c
index a4ea1e2914..700df8af25 100644
--- a/drivers/thermal/thermal-uclass.c
+++ b/drivers/thermal/thermal-uclass.c
@@ -3,6 +3,8 @@
  * (C) Copyright 2014 Freescale Semiconductor, Inc
  */
 
+#define LOG_CATEGORY UCLASS_THERMAL
+
 #include <common.h>
 #include <dm.h>
 #include <thermal.h>
diff --git a/drivers/timer/timer-uclass.c b/drivers/timer/timer-uclass.c
index 73b4a5cd27..c8e8419b22 100644
--- a/drivers/timer/timer-uclass.c
+++ b/drivers/timer/timer-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2015 Thomas Chou <thomas@wytron.com.tw>
  */
 
+#define LOG_CATEGORY UCLASS_TIMER
+
 #include <common.h>
 #include <clk.h>
 #include <cpu.h>
diff --git a/drivers/ufs/ufs-uclass.c b/drivers/ufs/ufs-uclass.c
index 034d14fd8d..ceea30c4a9 100644
--- a/drivers/ufs/ufs-uclass.c
+++ b/drivers/ufs/ufs-uclass.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com
  */
 
+#define LOG_CATEGORY UCLASS_UFS
+
 #include <common.h>
 #include "ufs.h"
 #include <dm.h>
diff --git a/drivers/usb/emul/usb-emul-uclass.c b/drivers/usb/emul/usb-emul-uclass.c
index f5d98b917d..05f6d3d9e2 100644
--- a/drivers/usb/emul/usb-emul-uclass.c
+++ b/drivers/usb/emul/usb-emul-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_USB_EMUL
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/usb/gadget/udc/udc-uclass.c b/drivers/usb/gadget/udc/udc-uclass.c
index dbc354e84f..de8861829c 100644
--- a/drivers/usb/gadget/udc/udc-uclass.c
+++ b/drivers/usb/gadget/udc/udc-uclass.c
@@ -4,6 +4,8 @@
  * Written by Jean-Jacques Hiblot <jjhiblot@ti.com>
  */
 
+#define LOG_CATEGORY UCLASS_USB_GADGET_GENERIC
+
 #include <common.h>
 #include <dm.h>
 #include <dm/device-internal.h>
diff --git a/drivers/usb/host/usb-uclass.c b/drivers/usb/host/usb-uclass.c
index e3b616c326..fd39c3345c 100644
--- a/drivers/usb/host/usb-uclass.c
+++ b/drivers/usb/host/usb-uclass.c
@@ -6,6 +6,8 @@
  * usb_match_device() modified from Linux kernel v4.0.
  */
 
+#define LOG_CATEGORY UCLASS_USB
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/video/backlight-uclass.c b/drivers/video/backlight-uclass.c
index 0aadf8a1f9..c14996d003 100644
--- a/drivers/video/backlight-uclass.c
+++ b/drivers/video/backlight-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_PANEL_BACKLIGHT
+
 #include <common.h>
 #include <dm.h>
 #include <backlight.h>
diff --git a/drivers/video/bridge/video-bridge-uclass.c b/drivers/video/bridge/video-bridge-uclass.c
index 08d38b244b..f389bc6b14 100644
--- a/drivers/video/bridge/video-bridge-uclass.c
+++ b/drivers/video/bridge/video-bridge-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO_BRIDGE
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/video/display-uclass.c b/drivers/video/display-uclass.c
index 068108e915..2da3d1d14e 100644
--- a/drivers/video/display-uclass.c
+++ b/drivers/video/display-uclass.c
@@ -3,6 +3,8 @@
  * Copyright 2014 Google Inc.
  */
 
+#define LOG_CATEGORY UCLASS_DISPLAY
+
 #include <common.h>
 #include <dm.h>
 #include <display.h>
diff --git a/drivers/video/dsi-host-uclass.c b/drivers/video/dsi-host-uclass.c
index 1db1f88a17..6e5256eb12 100644
--- a/drivers/video/dsi-host-uclass.c
+++ b/drivers/video/dsi-host-uclass.c
@@ -5,6 +5,8 @@
  *
  */
 
+#define LOG_CATEGORY UCLASS_DSI_HOST
+
 #include <common.h>
 #include <dm.h>
 #include <dsi_host.h>
diff --git a/drivers/video/panel-uclass.c b/drivers/video/panel-uclass.c
index 246d1b2836..bb2eaae2e9 100644
--- a/drivers/video/panel-uclass.c
+++ b/drivers/video/panel-uclass.c
@@ -4,6 +4,8 @@
  * Written by Simon Glass <sjg@chromium.org>
  */
 
+#define LOG_CATEGORY UCLASS_PANEL
+
 #include <common.h>
 #include <dm.h>
 #include <panel.h>
diff --git a/drivers/video/vidconsole-uclass.c b/drivers/video/vidconsole-uclass.c
index 81b65f5aae..8f7d987cdd 100644
--- a/drivers/video/vidconsole-uclass.c
+++ b/drivers/video/vidconsole-uclass.c
@@ -7,6 +7,8 @@
  * Bernecker & Rainer Industrieelektronik GmbH - http://www.br-automation.com
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO_CONSOLE
+
 #include <common.h>
 #include <command.h>
 #include <console.h>
diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 96ec6f80af..9f8cf6ef2a 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2015 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO
+
 #include <common.h>
 #include <console.h>
 #include <cpu_func.h>
diff --git a/drivers/video/video_osd-uclass.c b/drivers/video/video_osd-uclass.c
index 82136a292b..0d3aae4d82 100644
--- a/drivers/video/video_osd-uclass.c
+++ b/drivers/video/video_osd-uclass.c
@@ -4,6 +4,8 @@
  * Mario Six,  Guntermann & Drunck GmbH, mario.six@gdsys.cc
  */
 
+#define LOG_CATEGORY UCLASS_VIDEO_OSD
+
 #include <common.h>
 #include <dm.h>
 #include <video_osd.h>
diff --git a/drivers/virtio/virtio-uclass.c b/drivers/virtio/virtio-uclass.c
index 0379536c54..9e2d0e06a1 100644
--- a/drivers/virtio/virtio-uclass.c
+++ b/drivers/virtio/virtio-uclass.c
@@ -15,6 +15,8 @@
  * the VirtIO specification v1.0.
  */
 
+#define LOG_CATEGORY UCLASS_VIRTIO
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/w1-eeprom/w1-eeprom-uclass.c b/drivers/w1-eeprom/w1-eeprom-uclass.c
index 97a9d43b03..68681161a2 100644
--- a/drivers/w1-eeprom/w1-eeprom-uclass.c
+++ b/drivers/w1-eeprom/w1-eeprom-uclass.c
@@ -10,6 +10,8 @@
  *
  */
 
+#define LOG_CATEGORY UCLASS_W1_EEPROM
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/w1/w1-uclass.c b/drivers/w1/w1-uclass.c
index 8bc6cb13f4..2ee706cc87 100644
--- a/drivers/w1/w1-uclass.c
+++ b/drivers/w1/w1-uclass.c
@@ -10,6 +10,8 @@
  *
  */
 
+#define LOG_CATEGORY UCLASS_W1
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
index 0603ffbd36..bc448f2479 100644
--- a/drivers/watchdog/wdt-uclass.c
+++ b/drivers/watchdog/wdt-uclass.c
@@ -3,6 +3,8 @@
  * Copyright 2017 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_WDT
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/xen/pvblock.c b/drivers/xen/pvblock.c
index 1c5d039ef0..c25c3ea4ff 100644
--- a/drivers/xen/pvblock.c
+++ b/drivers/xen/pvblock.c
@@ -3,6 +3,9 @@
  * (C) 2007-2008 Samuel Thibault.
  * (C) Copyright 2020 EPAM Systems Inc.
  */
+
+#define LOG_CATEGORY UCLASS_PVBLOCK
+
 #include <blk.h>
 #include <common.h>
 #include <dm.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
