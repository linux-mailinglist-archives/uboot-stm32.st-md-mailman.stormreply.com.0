Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E551B2ABA
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 568D8C36B0F
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABAE7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF80gT010682; Tue, 21 Apr 2020 17:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gz7TsTpNwX64we6vb5zXUqOZv9cKsSMkh0cWhYwd8BU=;
 b=phmXYdJwOwBSU/anyeqCGtSHQkQpnwUDFTTn57ef90qwPfGL42HXd/Dnlr57YSOHXHj1
 zegfb+bnyQi1nk7yefssnS9w+MD2HU5dICHqziaiP3h6yQuB7XNviHsk+eyPH9FA4+vp
 8ahA5wPOGZGbKbGa7djLXmts9cXNQ5ETJaFyj/CNdADop8aMpIE90NoeR2Z2A6LkmvqQ
 rDAQOCYhNH/L365hXHR+khGzFlySe4mjbhxrylZey7Q3zWZaJi7le/qxxM1/YynW3O35
 gg5sg9DxZEAwKxtdDTw8xjv14AlkCqgI3h+IOfmDO5lq2eS3rwu6G0U47RlDA3SQUNg2 HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11gwku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADE60100034;
 Tue, 21 Apr 2020 17:11:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A41B22BE249;
 Tue, 21 Apr 2020 17:11:47 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:47 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:22 +0200
Message-ID: <20200421171123.3.I68223ba559c92c10a234c74b5589a38df45603c1@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/9] board: st: create common file stpmic1.c
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

Move function board_ddr_power_init() in a new file stpmic1 in
board/st/common to avoid duplicated code in each board using
stpmic1

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/Makefile |   2 +-
 board/st/common/Makefile                 |   1 +
 board/st/common/stpmic1.c                | 162 +++++++++++++++++++++++
 board/st/stm32mp1/board.c                | 158 ----------------------
 4 files changed, 164 insertions(+), 159 deletions(-)
 create mode 100644 board/st/common/stpmic1.c

diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index b42c4e4c04..04586c0a28 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -7,4 +7,4 @@ ifdef CONFIG_SPL_BUILD
 obj-y += ../../st/stm32mp1/spl.o
 endif
 
-obj-y += ../../st/stm32mp1/board.o board.o
+obj-y += ../../st/common/stpmic1.o board.o
diff --git a/board/st/common/Makefile b/board/st/common/Makefile
index 8553606b90..78bc0307f7 100644
--- a/board/st/common/Makefile
+++ b/board/st/common/Makefile
@@ -4,3 +4,4 @@
 #
 
 obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
+obj-$(CONFIG_PMIC_STPMIC1) += stpmic1.o
diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
new file mode 100644
index 0000000000..ca10a2246b
--- /dev/null
+++ b/board/st/common/stpmic1.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <asm/arch/ddr.h>
+#include <power/pmic.h>
+#include <power/stpmic1.h>
+
+int board_ddr_power_init(enum ddr_type ddr_type)
+{
+	struct udevice *dev;
+	bool buck3_at_1800000v = false;
+	int ret;
+	u32 buck2;
+
+	ret = uclass_get_device_by_driver(UCLASS_PMIC,
+					  DM_GET_DRIVER(pmic_stpmic1), &dev);
+	if (ret)
+		/* No PMIC on board */
+		return 0;
+
+	switch (ddr_type) {
+	case STM32MP_DDR3:
+		/* VTT = Set LDO3 to sync mode */
+		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
+		if (ret < 0)
+			return ret;
+
+		ret &= ~STPMIC1_LDO3_MODE;
+		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
+		ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
+
+		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+				     ret);
+		if (ret < 0)
+			return ret;
+
+		/* VDD_DDR = Set BUCK2 to 1.35V */
+		ret = pmic_clrsetbits(dev,
+				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
+				      STPMIC1_BUCK_VOUT_MASK,
+				      STPMIC1_BUCK2_1350000V);
+		if (ret < 0)
+			return ret;
+
+		/* Enable VDD_DDR = BUCK2 */
+		ret = pmic_clrsetbits(dev,
+				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
+				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		/* Enable VREF */
+		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
+				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		/* Enable VTT = LDO3 */
+		ret = pmic_clrsetbits(dev,
+				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		break;
+
+	case STM32MP_LPDDR2_16:
+	case STM32MP_LPDDR2_32:
+	case STM32MP_LPDDR3_16:
+	case STM32MP_LPDDR3_32:
+		/*
+		 * configure VDD_DDR1 = LDO3
+		 * Set LDO3 to 1.8V
+		 * + bypass mode if BUCK3 = 1.8V
+		 * + normal mode if BUCK3 != 1.8V
+		 */
+		ret = pmic_reg_read(dev,
+				    STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK3));
+		if (ret < 0)
+			return ret;
+
+		if ((ret & STPMIC1_BUCK3_1800000V) == STPMIC1_BUCK3_1800000V)
+			buck3_at_1800000v = true;
+
+		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
+		if (ret < 0)
+			return ret;
+
+		ret &= ~STPMIC1_LDO3_MODE;
+		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
+		ret |= STPMIC1_LDO3_1800000;
+		if (buck3_at_1800000v)
+			ret |= STPMIC1_LDO3_MODE;
+
+		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+				     ret);
+		if (ret < 0)
+			return ret;
+
+		/* VDD_DDR2 : Set BUCK2 to 1.2V (16bits) or 1.25V (32 bits)*/
+		switch (ddr_type) {
+		case STM32MP_LPDDR2_32:
+		case STM32MP_LPDDR3_32:
+			buck2 = STPMIC1_BUCK2_1250000V;
+			break;
+		default:
+		case STM32MP_LPDDR2_16:
+		case STM32MP_LPDDR3_16:
+			buck2 = STPMIC1_BUCK2_1200000V;
+			break;
+		}
+
+		ret = pmic_clrsetbits(dev,
+				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
+				      STPMIC1_BUCK_VOUT_MASK,
+				      buck2);
+		if (ret < 0)
+			return ret;
+
+		/* Enable VDD_DDR1 = LDO3 */
+		ret = pmic_clrsetbits(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
+				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		/* Enable VDD_DDR2 =BUCK2 */
+		ret = pmic_clrsetbits(dev,
+				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
+				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		/* Enable VREF */
+		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
+				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
+		if (ret < 0)
+			return ret;
+
+		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
+
+		break;
+
+	default:
+		break;
+	};
+
+	return 0;
+}
diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
index 4e35d36c76..1887941e57 100644
--- a/board/st/stm32mp1/board.c
+++ b/board/st/stm32mp1/board.c
@@ -4,11 +4,7 @@
  */
 
 #include <common.h>
-#include <dm.h>
 #include <asm/io.h>
-#include <asm/arch/ddr.h>
-#include <power/pmic.h>
-#include <power/stpmic1.h>
 
 #ifdef CONFIG_DEBUG_UART_BOARD_INIT
 void board_debug_uart_init(void)
@@ -36,157 +32,3 @@ void board_debug_uart_init(void)
 #endif
 }
 #endif
-
-#ifdef CONFIG_PMIC_STPMIC1
-int board_ddr_power_init(enum ddr_type ddr_type)
-{
-	struct udevice *dev;
-	bool buck3_at_1800000v = false;
-	int ret;
-	u32 buck2;
-
-	ret = uclass_get_device_by_driver(UCLASS_PMIC,
-					  DM_GET_DRIVER(pmic_stpmic1), &dev);
-	if (ret)
-		/* No PMIC on board */
-		return 0;
-
-	switch (ddr_type) {
-	case STM32MP_DDR3:
-		/* VTT = Set LDO3 to sync mode */
-		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
-		if (ret < 0)
-			return ret;
-
-		ret &= ~STPMIC1_LDO3_MODE;
-		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
-		ret |= STPMIC1_LDO_VOUT(STPMIC1_LDO3_DDR_SEL);
-
-		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				     ret);
-		if (ret < 0)
-			return ret;
-
-		/* VDD_DDR = Set BUCK2 to 1.35V */
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
-				      STPMIC1_BUCK_VOUT_MASK,
-				      STPMIC1_BUCK2_1350000V);
-		if (ret < 0)
-			return ret;
-
-		/* Enable VDD_DDR = BUCK2 */
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
-				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		/* Enable VREF */
-		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
-				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		/* Enable VTT = LDO3 */
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		break;
-
-	case STM32MP_LPDDR2_16:
-	case STM32MP_LPDDR2_32:
-	case STM32MP_LPDDR3_16:
-	case STM32MP_LPDDR3_32:
-		/*
-		 * configure VDD_DDR1 = LDO3
-		 * Set LDO3 to 1.8V
-		 * + bypass mode if BUCK3 = 1.8V
-		 * + normal mode if BUCK3 != 1.8V
-		 */
-		ret = pmic_reg_read(dev,
-				    STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK3));
-		if (ret < 0)
-			return ret;
-
-		if ((ret & STPMIC1_BUCK3_1800000V) == STPMIC1_BUCK3_1800000V)
-			buck3_at_1800000v = true;
-
-		ret = pmic_reg_read(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3));
-		if (ret < 0)
-			return ret;
-
-		ret &= ~STPMIC1_LDO3_MODE;
-		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
-		ret |= STPMIC1_LDO3_1800000;
-		if (buck3_at_1800000v)
-			ret |= STPMIC1_LDO3_MODE;
-
-		ret = pmic_reg_write(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				     ret);
-		if (ret < 0)
-			return ret;
-
-		/* VDD_DDR2 : Set BUCK2 to 1.2V (16bits) or 1.25V (32 bits)*/
-		switch (ddr_type) {
-		case STM32MP_LPDDR2_32:
-		case STM32MP_LPDDR3_32:
-			buck2 = STPMIC1_BUCK2_1250000V;
-			break;
-		default:
-		case STM32MP_LPDDR2_16:
-		case STM32MP_LPDDR3_16:
-			buck2 = STPMIC1_BUCK2_1200000V;
-			break;
-		}
-
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
-				      STPMIC1_BUCK_VOUT_MASK,
-				      buck2);
-		if (ret < 0)
-			return ret;
-
-		/* Enable VDD_DDR1 = LDO3 */
-		ret = pmic_clrsetbits(dev, STPMIC1_LDOX_MAIN_CR(STPMIC1_LDO3),
-				      STPMIC1_LDO_ENA, STPMIC1_LDO_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		/* Enable VDD_DDR2 =BUCK2 */
-		ret = pmic_clrsetbits(dev,
-				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
-				      STPMIC1_BUCK_ENA, STPMIC1_BUCK_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		/* Enable VREF */
-		ret = pmic_clrsetbits(dev, STPMIC1_REFDDR_MAIN_CR,
-				      STPMIC1_VREF_ENA, STPMIC1_VREF_ENA);
-		if (ret < 0)
-			return ret;
-
-		mdelay(STPMIC1_DEFAULT_START_UP_DELAY_MS);
-
-		break;
-
-	default:
-		break;
-	};
-
-	return 0;
-}
-#endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
