Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 887AAD5C69
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5331FC36B10
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DA4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7Rpgq007209; Mon, 14 Oct 2019 09:28:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=pM0KIuwnd2dHZosPVxiwqXuhKZlapf8kYSnTy3tE0+E=;
 b=XlEnOc8/g77q6QGuMUBSfGwaxD0LR9CUyCmM9Q1eD7K2P3DpPmsaZ+ajZhoEXLQu6Fej
 hwWIKKZUgMLAyd8cG4bhXWlTIRSHPdlnQWPVGsS1b96q18bMocu0QgqCwkV55ZQqCsa/
 w87F+6sa0Fcqeuch7ZtcD3AzUD+Tt2CXX1BSN2viL+M9d4lnCSQXIaIcyV+heBMxBgWr
 QaojzFUvTX0uE76nO2l8Q/seyJjCIGNCrXwnj93Ig4sEA4LN7xwasmEG3aLlzg5+TBDA
 3AGw/WRhPSpirPl+FPhmMxGHZG+AI0BGEp7Yjg3EgEpkxpDRBQ+qantqd5Nr5GLfY+ZO Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9h5we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA73210002A;
 Mon, 14 Oct 2019 09:28:22 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D18592ADFFA;
 Mon, 14 Oct 2019 09:28:22 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:22 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:22
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:27:59 +0200
Message-ID: <20191014072812.21843-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 02/15] doc: dfu: Add dfu documentation
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

Add documentation for dfu stack and "dfu" command.

Reviewed-by: Lukasz Majewski <lukma@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- Add dfu documentation

 doc/README.dfu | 144 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 doc/README.dfu

diff --git a/doc/README.dfu b/doc/README.dfu
new file mode 100644
index 0000000000..f5344e236c
--- /dev/null
+++ b/doc/README.dfu
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+Device Firmware Upgrade (DFU)
+
+Overview:
+
+  The Device Firmware Upgrade (DFU) allows to download and upload firmware
+  to/from U-Boot connected over USB.
+
+  U-boot follows the Universal Serial Bus Device Class Specification for
+  Device Firmware Upgrade Version 1.1 the USB forum (DFU v1.1 in www.usb.org).
+
+  U-Boot implements this DFU capability (CONFIG_DFU) with the command dfu
+  (cmd/dfu.c / CONFIG_CMD_DFU) based on:
+  - the DFU stack (common/dfu.c and common/spl/spl_dfu.c), based on the
+    USB DFU download gadget (drivers/usb/gadget/f_dfu.c)
+  - The access to mediums is done in DFU backends (driver/dfu)
+
+  Today the supported DFU backends are:
+  - MMC (RAW or FAT / EXT2 / EXT3 / EXT4 file system)
+  - NAND
+  - RAM
+  - SF (serial flash)
+
+  These DFU backends are also used by
+  - the dfutftp (see README.dfutftp)
+  - the thordown command (cmd/thordown.c and gadget/f_thor.c)
+
+Configuration Options:
+  CONFIG_DFU
+  CONFIG_DFU_OVER_USB
+  CONFIG_DFU_MMC
+  CONFIG_DFU_NAND
+  CONFIG_DFU_RAM
+  CONFIG_DFU_SF
+  CONFIG_CMD_DFU
+
+Environment variables:
+  the dfu command use 3 environments variables:
+  "dfu_alt_info" : the DFU setting for the USB download gadget with a comma
+                   separated string of information on each alternate:
+                   dfu_alt_info="<alt1>;<alt2>;....;<altN>"
+
+  "dfu_bufsiz" : size of the DFU buffer, when absent, use
+                 CONFIG_SYS_DFU_DATA_BUF_SIZE (8MiB by default)
+
+  "dfu_hash_algo" : name of the hash algorithm to use
+
+Commands:
+  dfu <USB_controller> <interface> <dev> list
+    list the alternate device defined in "dfu_alt_info"
+
+  dfu <USB_controller> <interface> <dev>
+    start the dfu stack on the USB instance with the selected medium
+    backend and use the "dfu_alt_info" variable to configure the
+    alternate setting and link each one with the medium
+    The dfu command continue until receive a ^C in console or
+    a DFU detach transaction from HOST.
+
+  The possible values of <interface> are :
+  (with <USB controller> = 0 in the dfu command example)
+
+  "mmc" (for eMMC and SD card)
+    cmd: dfu 0 mmc <dev>
+    each element in "dfu_alt_info" =
+      <name> raw <offset> <size>   raw access to mmc device
+      <name> part <dev> <part_id>  raw acces to partition
+      <name> fat <dev> <part_id>   file in FAT partition
+      <name> ext4 <dev> <part_id>  file in EXT4 partition
+
+      with <partid> is the GPT or DOS partition index
+
+  "nand" (raw slc nand device)
+    cmd: dfu 0 nand <dev>
+    each element in "dfu_alt_info" =
+      <name> raw <offset> <size>   raw access to mmc device
+      <name> part <dev> <part_id>  raw acces to partition
+      <name> partubi <dev> <part_id>  raw acces to ubi partition
+
+      with <partid> is the MTD partition index
+
+  "ram"
+    cmd: dfu 0 ram <dev>
+    (<dev> is not used for RAM target)
+    each element in "dfu_alt_info" =
+      <name> ram <offset> <size>  raw access to ram
+
+  "sf" (serial flash : NOR)
+    cmd: dfu 0 sf <dev>
+    each element in "dfu_alt_info" =
+      <name> ram <offset> <size>  raw access to sf device
+
+Host tools:
+  When U-Boot runs the dfu stack, the DFU host tools can be used
+  to send/receive firmwares on each configurated alternate.
+
+  For example dfu-util is a host side implementation of the DFU 1.1
+  specifications(http://dfu-util.sourceforge.net/) which works with U-Boot.
+
+Usage:
+  Example for firmware located in eMMC or SD card, with:
+  - alternate 1 (alt=1) for SPL partition (GPT partition 1)
+  - alternate 2 (alt=2) for U-Boot partition (GPT partition 2)
+
+  The U-Boot configuration is:
+
+  U-Boot> env set dfu_alt_info "spl part 0 1;u-boot part 0 2"
+
+  U-Boot> dfu 0 mmc 0 list
+  DFU alt settings list:
+  dev: eMMC alt: 0 name: spl layout: RAW_ADDR
+  dev: eMMC alt: 1 name: u-boot layout: RAW_ADDR
+
+  Boot> dfu 0 mmc 0
+
+  On the Host side:
+
+  list the available alternate setting:
+
+  $> dfu-util -l
+  dfu-util 0.9
+
+  Copyright 2005-2009 Weston Schmidt, Harald Welte and OpenMoko Inc.
+  Copyright 2010-2016 Tormod Volden and Stefan Schmidt
+  This program is Free Software and has ABSOLUTELY NO WARRANTY
+  Please report bugs to http://sourceforge.net/p/dfu-util/tickets/
+
+  Found DFU: [0483:5720] ver=0200, devnum=45, cfg=1, intf=0, path="3-1.3.1", \
+     alt=1, name="u-boot", serial="003A00203438510D36383238"
+  Found DFU: [0483:5720] ver=0200, devnum=45, cfg=1, intf=0, path="3-1.3.1", \
+     alt=0, name="spl", serial="003A00203438510D36383238"
+
+  To download to U-Boot, use -D option
+
+  $> dfu-util -a 0 -D u-boot-spl.bin
+  $> dfu-util -a 1 -D u-boot.bin
+
+  To upload from U-Boot, use -U option
+
+  $> dfu-util -a 0 -U u-boot-spl.bin
+  $> dfu-util -a 1 -U u-boot.bin
+
+  To request a DFU detach and reset the USB connection:
+  $> dfu-util -a 0 -e  -R
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
