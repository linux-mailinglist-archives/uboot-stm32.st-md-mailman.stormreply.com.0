Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5117B9F4
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:14:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6A80C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:14:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7041AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:14:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026ADrTM020408; Fri, 6 Mar 2020 11:14:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4faQ9Tm9Eefw88apvbWJhDde9eW8PYMJNkLX37jrPEE=;
 b=jBZYMFaOPlQSOdIvBH122ylb1bxULtjDVc2RMwsTuUiCf99kt1EmtvIJZtlcMPni/06C
 mD4wZGVeS37jTq6oS/Zo33YVkbTjeP9UYO2u/NwOFBCPnZQRxYOpC2cbvYbDxjEHVkxA
 0BURX2HJ8C0nJc272ZdtV0kS/mG7TavkKDPro60Ljk1Ge86L6mQYo4BCUiUpYQiAlfiW
 HwNbXRXK1ATB6yN2+9mpK5A9Wr9yEBcBWDIxwpNE8rbfJNnhjPz7wOswxs9YO6KaFlk8
 7Kb+krqD2GbfrBRIGYo+zU/UlbKtpTpOriHi3EDA41SxhqEwus8ANa54xV9ceHI5ngwJ pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdydex1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:14:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26A8610002A;
 Fri,  6 Mar 2020 11:14:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C9B82A718C;
 Fri,  6 Mar 2020 11:14:29 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:14:28 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:14:03 +0100
Message-ID: <20200306111355.1.Ifeb02af238a2e3d0407465a868761e5efd7f968b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306101412.15376-1-patrick.delaunay@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 1/9] ram: stm32mp1: increase vdd2_ddr: buck2
	for 32bits LPDDR
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

Need to increase the LPDDR2/LPDDR3 the voltage vdd2_ddr: buck2
form 1.2V to 1.25V for 32bits configuration.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/include/mach/ddr.h |  6 +++--
 board/st/stm32mp1/board.c                | 23 ++++++++++++++----
 drivers/ram/stm32mp1/stm32mp1_ddr.c      | 30 ++++++++++++++++++++----
 include/power/stpmic1.h                  |  1 +
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/ddr.h b/arch/arm/mach-stm32mp/include/mach/ddr.h
index b8a17cfbdd..bfc42a7c48 100644
--- a/arch/arm/mach-stm32mp/include/mach/ddr.h
+++ b/arch/arm/mach-stm32mp/include/mach/ddr.h
@@ -9,8 +9,10 @@
 /* DDR power initializations */
 enum ddr_type {
 	STM32MP_DDR3,
-	STM32MP_LPDDR2,
-	STM32MP_LPDDR3,
+	STM32MP_LPDDR2_16,
+	STM32MP_LPDDR2_32,
+	STM32MP_LPDDR3_16,
+	STM32MP_LPDDR3_32,
 };
 
 int board_ddr_power_init(enum ddr_type ddr_type);
diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
index c3d832f584..4e35d36c76 100644
--- a/board/st/stm32mp1/board.c
+++ b/board/st/stm32mp1/board.c
@@ -43,6 +43,7 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 	struct udevice *dev;
 	bool buck3_at_1800000v = false;
 	int ret;
+	u32 buck2;
 
 	ret = uclass_get_device_by_driver(UCLASS_PMIC,
 					  DM_GET_DRIVER(pmic_stpmic1), &dev);
@@ -102,8 +103,10 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 
 		break;
 
-	case STM32MP_LPDDR2:
-	case STM32MP_LPDDR3:
+	case STM32MP_LPDDR2_16:
+	case STM32MP_LPDDR2_32:
+	case STM32MP_LPDDR3_16:
+	case STM32MP_LPDDR3_32:
 		/*
 		 * configure VDD_DDR1 = LDO3
 		 * Set LDO3 to 1.8V
@@ -133,11 +136,23 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 		if (ret < 0)
 			return ret;
 
-		/* VDD_DDR2 : Set BUCK2 to 1.2V */
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
 		ret = pmic_clrsetbits(dev,
 				      STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK2),
 				      STPMIC1_BUCK_VOUT_MASK,
-				      STPMIC1_BUCK2_1200000V);
+				      buck2);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
index d765a46f7c..a87914f2d5 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
@@ -668,14 +668,34 @@ void stm32mp1_ddr_init(struct ddr_info *priv,
 {
 	u32 pir;
 	int ret = -EINVAL;
+	char bus_width;
+
+	switch (config->c_reg.mstr & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK) {
+	case DDRCTRL_MSTR_DATA_BUS_WIDTH_QUARTER:
+		bus_width = 8;
+		break;
+	case DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF:
+		bus_width = 16;
+		break;
+	default:
+		bus_width = 32;
+		break;
+	}
+
 
 	if (config->c_reg.mstr & DDRCTRL_MSTR_DDR3)
 		ret = board_ddr_power_init(STM32MP_DDR3);
-	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR2)
-		ret = board_ddr_power_init(STM32MP_LPDDR2);
-	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR3)
-		ret = board_ddr_power_init(STM32MP_LPDDR3);
-
+	else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR2) {
+		if (bus_width == 32)
+			ret = board_ddr_power_init(STM32MP_LPDDR2_32);
+		else
+			ret = board_ddr_power_init(STM32MP_LPDDR2_16);
+	} else if (config->c_reg.mstr & DDRCTRL_MSTR_LPDDR3) {
+		if (bus_width == 32)
+			ret = board_ddr_power_init(STM32MP_LPDDR3_32);
+		else
+			ret = board_ddr_power_init(STM32MP_LPDDR3_16);
+	}
 	if (ret)
 		panic("ddr power init failed\n");
 
diff --git a/include/power/stpmic1.h b/include/power/stpmic1.h
index dc8b5a7459..1493a677f0 100644
--- a/include/power/stpmic1.h
+++ b/include/power/stpmic1.h
@@ -37,6 +37,7 @@
 #define STPMIC1_BUCK_VOUT(sel)		(sel << STPMIC1_BUCK_VOUT_SHIFT)
 
 #define STPMIC1_BUCK2_1200000V		STPMIC1_BUCK_VOUT(24)
+#define STPMIC1_BUCK2_1250000V		STPMIC1_BUCK_VOUT(26)
 #define STPMIC1_BUCK2_1350000V		STPMIC1_BUCK_VOUT(30)
 
 #define STPMIC1_BUCK3_1800000V		STPMIC1_BUCK_VOUT(39)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
