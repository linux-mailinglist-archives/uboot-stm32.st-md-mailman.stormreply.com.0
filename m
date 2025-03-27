Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B007FA734A2
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Mar 2025 15:39:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7597FC78F72;
	Thu, 27 Mar 2025 14:39:48 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 E834EC78F6D for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1743086361;
 bh=ryNOVqpTNu93VBGteovgRdMyZTJpLMjaxdzjFOAuSco=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=jv2GBS7iO4kw99RM+3DCx1FRpjGbUWV5LnzkBNrk+oJtXyZYvgNTF4Sofq0RsRXBp
 VLQWb2CfOtRZrjN4c7/QwDABPannBnfM3/AaAse9Wfgznv4gsKZoON8TgMVz8arSFZ
 5uGfCOf4mXwzGcGHPhQuJe43NCu4qdo/UNcxe5d5jx1N/SKXW7M4n2hKnGalFRTb3R
 IGsn/DASV6Ldl8XWC+zAlhL1lbV2Pw5YKclHMRxXLmfdSYFrQkPQPFcfz3zYciBbrn
 cGPlcrvT2icJQDLzzgrZY04Lr4Nn5QvP/m0wk6IXFcb2BsqCg2J9mwWkzntLP0XWx7
 EOuhWlVFm+alw==
From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Mar 2025 15:38:43 +0100
Message-ID: <20250327143843.19358-3-pzimmermann@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20250327143843.19358-1-pzimmermann@dh-electronics.com>
References: <20250327143843.19358-1-pzimmermann@dh-electronics.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [RESEND PATCH 2/2] ARM: stm32: env: Enable scan and
	start for AB schema on STM32MP15 DHSOM
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
index 7e5b5aa67ef..c84116482f6 100644
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
index c004a8cec82..267e3446779 100644
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
