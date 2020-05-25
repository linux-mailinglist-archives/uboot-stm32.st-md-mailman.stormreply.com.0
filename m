Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19A1E0B99
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0081AC36B23
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165BCC36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:20:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHlAh026084; Mon, 25 May 2020 12:20:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wbBZnwM5sR/tKvPexiChBkJuxbPM2JQmhxyWmVpb9Dg=;
 b=w+61mzXyqCiQYEhWRASrv/Ccgf1xyW/JIWwyOk6/aPeB9aMqC+jk9OsCTNAhFx2+Wemw
 JLD9GKulhb/yR49Oofs40+P3EvhSS1Z3VfGFZ5x0PR3JC+JzY1rEXxT2U6J1R9sc53Ob
 0iyi/PGE2rV8qxoHAI8ukqOv1jECgcC8ip6OFFtFSeXva6HchXmE2VYVtyfTAcFxXPgV
 gyXifqUGQrXtBDbKB2hys7btMum6vGTDLmTsYes8hQ0atUCz310DfYSLkl1ZoTIqp5kq
 vR6T7IHGKFLaq6ImIdj5r56Sx7kB0PnYkw/RJzXvBHkEdFV+LKQx/8BC4KNwUHK062la SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1stex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:20:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8F6F10002A;
 Mon, 25 May 2020 12:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEBC820B84D;
 Mon, 25 May 2020 12:19:59 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:59 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:47 +0200
Message-ID: <20200525101949.15944-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 7/9] board: stm32mp1: update vddcore in SPL
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

For board using STPMIC1, the vddcore is provided by BUCK1 of STPMIC1
and need to be updated for 800MHz support and only after the clock
tree initialization.

The VDDCORE voltage value is provided by clock driver, saved in global
variable opp_voltage_mv and udpated in SPL board_early_init_f(),
just after clock tree initialization.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- stmpic_buck1_set is a static function called in stpmic1_init
  (with new parameter for vddcore value)
- update also dh_stm32mp1 board

 board/dhelectronics/dh_stm32mp1/board.c |  9 ++++++++-
 board/st/common/stpmic1.c               | 23 ++++++++++++++++++++++-
 board/st/common/stpmic1.h               |  2 +-
 board/st/stm32mp1/spl.c                 | 11 ++++++++++-
 4 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index df0810dbda..2ae97f677b 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -136,6 +136,7 @@ int checkboard(void)
 static u8 brdcode __section("data");
 static u8 ddr3code __section("data");
 static u8 somcode __section("data");
+static u32 opp_voltage_mv __section(".data");
 
 static void board_get_coding_straps(void)
 {
@@ -193,10 +194,16 @@ int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
 	return -EINVAL;
 }
 
+void board_vddcore_init(u32 voltage_mv)
+{
+	if (IS_ENABLED(CONFIG_SPL_BUILD))
+		opp_voltage_mv = voltage_mv;
+}
+
 int board_early_init_f(void)
 {
 	if (IS_ENABLED(CONFIG_SPL_BUILD))
-		stpmic1_init();
+		stpmic1_init(opp_voltage_mv);
 	board_get_coding_straps();
 
 	return 0;
diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index 64f24f1f6f..47f9d95c29 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -162,8 +162,25 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 	return 0;
 }
 
+static int stmpic_buck1_set(struct udevice *dev, u32 voltage_mv)
+{
+	u32 value;
+
+	/* VDDCORE= STMPCI1 BUCK1 ramp=+25mV, 5 => 725mV, 36 => 1500mV */
+	value = ((voltage_mv - 725) / 25) + 5;
+	if (value < 5)
+		value = 5;
+	if (value > 36)
+		value = 36;
+
+	return pmic_clrsetbits(dev,
+			       STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK1),
+			       STPMIC1_BUCK_VOUT_MASK,
+			       STPMIC1_BUCK_VOUT(value));
+}
+
 /* early init of PMIC */
-void stpmic1_init(void)
+void stpmic1_init(u32 voltage_mv)
 {
 	struct udevice *dev;
 
@@ -171,6 +188,10 @@ void stpmic1_init(void)
 					DM_GET_DRIVER(pmic_stpmic1), &dev))
 		return;
 
+	/* update VDDCORE = BUCK1 */
+	if (voltage_mv)
+		stmpic_buck1_set(dev, voltage_mv);
+
 	/* Keep vdd on during the reset cycle */
 	pmic_clrsetbits(dev,
 			STPMIC1_BUCKS_MRST_CR,
diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
index ecc3276697..b17d6f1633 100644
--- a/board/st/common/stpmic1.h
+++ b/board/st/common/stpmic1.h
@@ -3,4 +3,4 @@
  * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
  */
 
-void stpmic1_init(void);
+void stpmic1_init(u32 voltage_mv);
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 28efc5c0ae..96ab671169 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -7,10 +7,19 @@
 #include <common.h>
 #include "../common/stpmic1.h"
 
+/* board early initialisation in board_f: need to use global variable */
+static u32 opp_voltage_mv __section(".data");
+
+void board_vddcore_init(u32 voltage_mv)
+{
+	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER_SUPPORT))
+		opp_voltage_mv = voltage_mv;
+}
+
 int board_early_init_f(void)
 {
 	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER_SUPPORT))
-		stpmic1_init();
+		stpmic1_init(opp_voltage_mv);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
