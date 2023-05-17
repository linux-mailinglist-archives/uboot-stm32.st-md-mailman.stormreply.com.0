Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA33707502
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 May 2023 00:02:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 626A5C6B442;
	Wed, 17 May 2023 22:02:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEAEBC65E5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 22:02:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EC7F085830;
 Thu, 18 May 2023 00:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684360969;
 bh=WCVNco+dIg/5gMIWGU8L1A7iJd7eN2y0tCZhhby1NpM=;
 h=From:To:Cc:Subject:Date:From;
 b=RTcHaUD28xWbuk9z4Aq48zZmRA+sk5CXGZMtmULfhM+hKndHS0J+t5v4S3NzV+93T
 0r7hgCwyJTaNbskIXvw24btq8upuLqv6Bsmcu8uDO+xuud8o8HyK4EHWjPdEv/g94W
 U0ExrwH+5PLFrjZ+m3uRCvAraaptm1lD33+/kYeXjlBcQsJDcEXqptgl5V79MAyCOY
 JGflml9FSzGhx71EH5lufBedFB7SZ5Gh7y1a0b3ydLXSGExcWOmaHUJleWB7qA6AZr
 LaKL2hO1vAg5ynuZxVdfB4Ii+S63mxQepYGDxfLDl8OSmKiQlvEQz8WoL2gyuZlkDU
 R1t6XYQrmnN8w==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu, 18 May 2023 00:02:39 +0200
Message-Id: <20230517220239.329807-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

In case the DHSOM is in suspend state and either reset button is pushed
or IWDG2 triggers a watchdog reset, then DRAM initialization could fail
as follows:

  "
  RAM: DDR3L 32bits 2x4Gb 533MHz
  DDR invalid size : 0x4, expected 0x40000000
  DRAM init failed: -22
  ### ERROR ### Please RESET the board ###
  "

Avoid this failure by not keeping any Buck regulators enabled during reset,
let the SoC and DRAMs power cycle fully. Since the change which keeps Buck3
VDD enabled during reset is ST specific, move this addition to ST specific
SPL board initialization so that it wouldn't affect the DHSOM .

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: This is 2023.07 material
NOTE: d1a4b09de64 ("board: st: stpmic1: add function stpmic1_init")
      mentions 'keep vdd on during the reset cycle (to avoid issue
      when backup battery is absent)', but there is no further
      description of the 'issue'. Can you please elaborate ?
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/st/common/stpmic1.c | 10 +++-------
 board/st/common/stpmic1.h |  2 +-
 board/st/stm32mp1/spl.c   | 13 +++++++++++--
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index d52dce4f657..969ad484864 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -185,21 +185,17 @@ static int stmpic_buck1_set(struct udevice *dev, u32 voltage_mv)
 }
 
 /* early init of PMIC */
-void stpmic1_init(u32 voltage_mv)
+struct udevice *stpmic1_init(u32 voltage_mv)
 {
 	struct udevice *dev;
 
 	if (uclass_get_device_by_driver(UCLASS_PMIC,
 					DM_DRIVER_GET(pmic_stpmic1), &dev))
-		return;
+		return NULL;
 
 	/* update VDDCORE = BUCK1 */
 	if (voltage_mv)
 		stmpic_buck1_set(dev, voltage_mv);
 
-	/* Keep vdd on during the reset cycle */
-	pmic_clrsetbits(dev,
-			STPMIC1_BUCKS_MRST_CR,
-			STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
-			STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
+	return dev;
 }
diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
index b17d6f16338..7a7169d7cea 100644
--- a/board/st/common/stpmic1.h
+++ b/board/st/common/stpmic1.h
@@ -3,4 +3,4 @@
  * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
  */
 
-void stpmic1_init(u32 voltage_mv);
+struct udevice *stpmic1_init(u32 voltage_mv);
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 747ec7e445a..8b4a529f759 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,6 +5,8 @@
 
 #include <config.h>
 #include <common.h>
+#include <power/pmic.h>
+#include <power/stpmic1.h>
 #include <asm/arch/sys_proto.h>
 #include "../common/stpmic1.h"
 
@@ -19,8 +21,15 @@ void board_vddcore_init(u32 voltage_mv)
 
 int board_early_init_f(void)
 {
-	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
-		stpmic1_init(opp_voltage_mv);
+	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER)) {
+		struct udevice *dev = stpmic1_init(opp_voltage_mv);
+
+		/* Keep vdd on during the reset cycle */
+		pmic_clrsetbits(dev,
+				STPMIC1_BUCKS_MRST_CR,
+				STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
+				STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
+	}
 
 	return 0;
 }
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
