Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2B9DB820
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Nov 2024 13:59:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BA25C78F6E;
	Thu, 28 Nov 2024 12:59:00 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 0456FC78F83 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1732703419;
 bh=cA1cXJf53G81knR0v8ym1GNSSox9EhDy449dxZ7Z938=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=MsiF+zkjfQhCMe93+H8M9ueT+3kAxrhOgnGa/6+H3NGpDG/VvGpIearoZC9b+VAFo
 YOXly/OjsEjcT2TNZwc3tZ9VNehwaMp7qZoqlKuHvKM1QdPQ60fUSvHK8WW8WDQ5YP
 olEDTG9fGV5wYEyv5Kh/JGuu5y0j2Y3jBvz4WVsz6yEkkJ+aRN68/kuPaF4PyArBOG
 yw4EqKFAPx7gKCLOWPZDZl057bPZ3ESnhw6DFuQsm23JsgHbIkNFIG3+40d2fbwBs4
 c4GR9Q6rlX/nhEZZiDNyiuq0loHRGz96Y4kwIXmdRRduAtXOtezPBv6TrfNyfTP+Z6
 oHSozwQiIet+w==
From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Nov 2024 11:29:24 +0100
Message-ID: <20241127102924.7652-3-pzimmermann@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20241127102924.7652-1-pzimmermann@dh-electronics.com>
References: <20241127102924.7652-1-pzimmermann@dh-electronics.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Nov 2024 12:59:00 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: stm32: env: Enable scan and start
	for AB schema on STM32MP15 DHSOM
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

For the STM32MP15 DHSOM, change the default environment so an AB schema
on a device can be detected.

For this the define "SCAN_DEV_FOR_BOOT_PARTS" is overwritten and
appended.

The detection works by looking for the partitions with specific lables.
The name of those partitions are in the variables and its defaults:
* dh_ab_partname_primary=rootfs-a
* dh_ab_partname_secondary=rootfs-b

To prevent being hanging at bootcmd, enable "CONFIG_BOOT_RETRY" and
"CONFIG_RESET_TO_RETRY", but the timer will only be activated, if the AB
partitions are detected.

Signed-off-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
---
Cc: Marek Vasut <marex@denx.de>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
Cc: u-boot@lists.denx.de
---
 configs/stm32mp15_dhsom.config       |  3 +++
 include/configs/stm32mp15_dh_dhsom.h | 33 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index efc149577e..22d8bd3241 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -10,6 +10,9 @@ CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 CONFIG_BOOTDELAY=1
+CONFIG_BOOTRETRY=y
+CONFIG_RESET_TO_RETRY=y
+CONFIG_BOOT_RETRY_TIME=-1
 CONFIG_CMD_ADC=y
 CONFIG_CMD_REMOTEPROC=y
 CONFIG_CMD_STBOARD=y
diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index c004a8cec8..267e344677 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -17,7 +17,40 @@
 			" 0x800000\0"
 #endif
 
+/* Add the search for AB partitons */
+#define SCAN_DEV_FOR_BOOT_PARTS						\
+	"run dh_check_if_ab; "						\
+	"if test -z \"${devplist}\"; "					\
+		"then "							\
+		"part list ${devtype} ${devnum} -bootable devplist; "	\
+	"fi; "
+
 #define STM32MP_BOARD_EXTRA_ENV						\
+	"altbootcmd= "							\
+	"setenv dh_ab_get_partnames "					\
+		"'setenv dh_ab_partnames ${dh_ab_partname_secondary} "	\
+			"${dh_ab_partname_primary}' && "		\
+		"run bootcmd\0"						\
+	"dh_check_if_ab= " /* Sets devplist if AB partitions*/		\
+		"echo test for AB on ${devtype} ${devnum} && "		\
+		"run dh_ab_get_partnames && "				\
+		"setenv devplist && "					\
+		"for partname in ${dh_ab_partnames}; do "		\
+			"setenv partnum && "				\
+			"if part number ${devtype} ${devnum} ${partname} partnum; "\
+				"then "					\
+				"setenv devplist \"${devplist} ${partnum}\" && "\
+				"setenv bootretry 60 ;"			\
+			"fi; "						\
+		"done ; "						\
+		"if test -n \"${devplist}\"; "				\
+			"then echo AB partitions found! ; "		\
+		"fi\0"							\
+	"dh_ab_get_partnames= " /* Sets dh_ab_partnames */		\
+		"setenv dh_ab_partnames ${dh_ab_partname_primary} "	\
+			"${dh_ab_partname_secondary}\0"			\
+	"dh_ab_partname_primary=rootfs-a\0" /* Names of AB partitions */\
+	"dh_ab_partname_secondary=rootfs-b\0"				\
 	"dh_preboot="							\
 		"run dh_testbench_backward_compat\0"			\
 	"dh_update_sd_to_emmc=" /* Install U-Boot from SD to eMMC */	\
-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
