Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2F8C6BF87
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Nov 2025 00:19:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5838BC62D20;
	Tue, 18 Nov 2025 23:19:59 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9CCC628DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 23:19:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dB0vL2hXMz9spJ;
 Wed, 19 Nov 2025 00:19:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763507998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LxcjLa0P3FMJD7luuVTXeKF2VfVieieDE/gw9xYLDXE=;
 b=VJjhh3GOwkuBWbiEH1fwGIlNEZZbnllzixVtWMIj0WfaIKVflUyjyRyo77wnc+LHYrIMOV
 EznAWl77pLyhrIW1NSWg2LfFlBGI1KtRUeaJF5h+XNM+TqsaRr8qgjtWz9U08joU9jwGtS
 Mv06vYB1RfY2NCtqQWw11g8jIejAIyIG7TZZ6G+7gusBsRQWuIjwTFLHMUxDBQJ+IKvfnC
 crL0sUdE1B8gS0aPfHe4YDKAFPybbIF1n98hQ3VBfBLgdUrSEb5vdbW3SjUqTWyRh4evlW
 wlxUPxYssjXf0cSlbyqrDxrRqPsEFYdSEMcWjXSll9Vl9qrtFC5TbQDCMArILw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763507996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LxcjLa0P3FMJD7luuVTXeKF2VfVieieDE/gw9xYLDXE=;
 b=yrQnU2ZcDvlslpq+mxiYECyRFn0AHMlV+ciszKWm/Z/BKumPhTAE7aC9xAsXFwqAGVI08G
 afFiT4/ueJDVk1zYFnFx7CWa9dj/Y0prdfAckYgQkRTUMuq0NOZliODWOrLwtBsVxHu5WD
 zJQfDWbxL3wwerDqdWdClJV5NLJFNby8F8bIrds86qYNvfcI7pugyVa8Ka8ttwPg7/g6OA
 6xCslv0sqpIevyesFWs/tepJiX7PlpVJNLxvq4j4TbeaiBfEEhNLRmvF7cUwRhoRus//M2
 nxR+5XDqK+JktmLoM8nGAYU0GnOzL9z7NWdV6Cv7NzigLd5yMZOf/ysBqeJyfQ==
To: u-boot@lists.denx.de
Date: Wed, 19 Nov 2025 00:19:36 +0100
Message-ID: <20251118231953.578007-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2d27199e270a5a3fa78
X-MBO-RS-META: ptpc7ts6ggqxtasrngu93okcotq5moqu
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add 1 GiB DRAM settings for
	DH STM32MP13xx DHCOR SoM
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

Add DRAM settings for 1 GiB variant of DH STM32MP13xx DHCOR SoM
and support for SoM DRAM coding HW straps decoding and automatic
DRAM configuration selection. Enable CONFIG_BOARD_EARLY_INIT_F on
all STM32MP1 DHSOM, as it is required for the HW straps decoding.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 .../stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi | 100 ++++++++++++++++++
 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    |   1 +
 board/dhelectronics/dh_stm32mp1/board.c       |  30 ++++--
 configs/stm32mp15_dhsom.config                |   1 -
 configs/stm32mp_dhsom.config                  |   1 +
 5 files changed, 123 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi

diff --git a/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
new file mode 100644
index 00000000000..1d268d58b54
--- /dev/null
+++ b/arch/arm/dts/stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2025, DH electronics - All Rights Reserved
+ *
+ * STM32MP13xx DHSOM configuration
+ * 1x DDR3L 8Gb, 16-bit, 533MHz, Single Die Package in flyby topology.
+ * Reference used W638GU6QB11I from Winbond
+ *
+ * DDR type / Platform	DDR3/3L
+ * freq		533MHz
+ * width	16
+ * datasheet	0  = W638GU6QB11I / DDR3-1866
+ * DDR density	4
+ * timing mode	optimized
+ * address mapping : RBC
+ * Tc > + 85C : J
+ */
+#define DDR_MEM_COMPATIBLE ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz
+#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000kHz"
+#define DDR_MEM_SPEED	533000
+#define DDR_MEM_SIZE	0x40000000
+
+#define DDR_MSTR 0x00040401
+#define DDR_MRCTRL0 0x00000010
+#define DDR_MRCTRL1 0x00000000
+#define DDR_DERATEEN 0x00000000
+#define DDR_DERATEINT 0x00800000
+#define DDR_PWRCTL 0x00000000
+#define DDR_PWRTMG 0x00400010
+#define DDR_HWLPCTL 0x00000000
+#define DDR_RFSHCTL0 0x00210000
+#define DDR_RFSHCTL3 0x00000000
+#define DDR_RFSHTMG 0x0081008B
+#define DDR_CRCPARCTL0 0x00000000
+#define DDR_DRAMTMG0 0x121B2414
+#define DDR_DRAMTMG1 0x000A041B
+#define DDR_DRAMTMG2 0x0607080F
+#define DDR_DRAMTMG3 0x0050400C
+#define DDR_DRAMTMG4 0x07040607
+#define DDR_DRAMTMG5 0x06060403
+#define DDR_DRAMTMG6 0x02020002
+#define DDR_DRAMTMG7 0x00000202
+#define DDR_DRAMTMG8 0x00001005
+#define DDR_DRAMTMG14 0x000000A0
+#define DDR_ZQCTL0 0xC2000040
+#define DDR_DFITMG0 0x02050105
+#define DDR_DFITMG1 0x00000202
+#define DDR_DFILPCFG0 0x07000000
+#define DDR_DFIUPD0 0xC0400003
+#define DDR_DFIUPD1 0x00000000
+#define DDR_DFIUPD2 0x00000000
+#define DDR_DFIPHYMSTR 0x00000000
+#define DDR_ADDRMAP1 0x00080808
+#define DDR_ADDRMAP2 0x00000000
+#define DDR_ADDRMAP3 0x00000000
+#define DDR_ADDRMAP4 0x00001F1F
+#define DDR_ADDRMAP5 0x07070707
+#define DDR_ADDRMAP6 0x07070707
+#define DDR_ADDRMAP9 0x00000000
+#define DDR_ADDRMAP10 0x00000000
+#define DDR_ADDRMAP11 0x00000000
+#define DDR_ODTCFG 0x06000600
+#define DDR_ODTMAP 0x00000001
+#define DDR_SCHED 0x00000F01
+#define DDR_SCHED1 0x00000000
+#define DDR_PERFHPR1 0x00000001
+#define DDR_PERFLPR1 0x04000200
+#define DDR_PERFWR1 0x08000400
+#define DDR_DBG0 0x00000000
+#define DDR_DBG1 0x00000000
+#define DDR_DBGCMD 0x00000000
+#define DDR_POISONCFG 0x00000000
+#define DDR_PCCFG 0x00000010
+#define DDR_PCFGR_0 0x00000000
+#define DDR_PCFGW_0 0x00000000
+#define DDR_PCFGQOS0_0 0x00100009
+#define DDR_PCFGQOS1_0 0x00000020
+#define DDR_PCFGWQOS0_0 0x01100B03
+#define DDR_PCFGWQOS1_0 0x01000200
+#define DDR_PGCR 0x01442E02
+#define DDR_PTR0 0x0022AA5B
+#define DDR_PTR1 0x04841104
+#define DDR_PTR2 0x042DA068
+#define DDR_ACIOCR 0x10400812
+#define DDR_DXCCR 0x00000C40
+#define DDR_DSGCR 0xF200011F
+#define DDR_DCR 0x0000000B
+#define DDR_DTPR0 0x36D477D0
+#define DDR_DTPR1 0x098B00D8
+#define DDR_DTPR2 0x10023600
+#define DDR_MR0 0x00000830
+#define DDR_MR1 0x00000000
+#define DDR_MR2 0x00000208
+#define DDR_MR3 0x00000000
+#define DDR_ODTCR 0x00010000
+#define DDR_ZQ0CR1 0x00000038
+#define DDR_DX0GCR 0x0000CE81
+#define DDR_DX1GCR 0x0000CE81
+
+#include "stm32mp13-ddr.dtsi"
diff --git a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
index bedb7c600d5..39ac5692e08 100644
--- a/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/stm32mp13-clksrc.h>
 #include "stm32mp13-u-boot.dtsi"
 #include "stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi"
+#include "stm32mp13-ddr3-dhsom-1x4Gb-1066-binG.dtsi"
 
 / {
 	aliases {
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index c18f1911fe4..55526189d5a 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -304,17 +304,29 @@ static void board_get_coding_straps(void)
 int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
 					 const char *name)
 {
-	if (ddr3code == 1 &&
-	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
-		return 0;
+	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP13X)) {
+		if (ddr3code == 1 &&
+		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x2gb-533mhz"))
+			return 0;
+
+		if (ddr3code == 2 &&
+		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-1x4gb-533mhz"))
+			return 0;
+	}
 
-	if (ddr3code == 2 &&
-	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
-		return 0;
+	if (IS_ENABLED(CONFIG_TARGET_DH_STM32MP15X)) {
+		if (ddr3code == 1 &&
+		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x1gb-533mhz"))
+			return 0;
 
-	if (ddr3code == 3 &&
-	    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
-		return 0;
+		if (ddr3code == 2 &&
+		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x2gb-533mhz"))
+			return 0;
+
+		if (ddr3code == 3 &&
+		    !strcmp(name, "st,ddr3l-dhsom-1066-888-bin-g-2x4gb-533mhz"))
+			return 0;
+	}
 
 	return -EINVAL;
 }
diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index 210ec201bf5..d5ecbac29e0 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -2,7 +2,6 @@
 
 # CONFIG_ARMV7_VIRT is not set
 # CONFIG_BINMAN_FDT is not set
-CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 CONFIG_BOOTDELAY=1
diff --git a/configs/stm32mp_dhsom.config b/configs/stm32mp_dhsom.config
index 56a40839d28..31fae2de19d 100644
--- a/configs/stm32mp_dhsom.config
+++ b/configs/stm32mp_dhsom.config
@@ -6,6 +6,7 @@
 # CONFIG_SPL_PARTITION_UUIDS is not set
 # CONFIG_SPL_PINCTRL_FULL is not set
 # CONFIG_SPL_SHARES_INIT_SP_ADDR is not set
+CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_CMD_BOOTCOUNT=y
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
