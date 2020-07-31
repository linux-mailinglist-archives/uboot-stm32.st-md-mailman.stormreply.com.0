Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0D2347D5
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF898C36B32
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D285C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VERgAx024641; Fri, 31 Jul 2020 16:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KQnnxCiBJL1Nz7mqrfQV9X1j+bxbdHafy+Z+wCrP5Ng=;
 b=obuwWNbsILUTzdRQRNoB53JuF0RdveGMITkQjzs87jq6xy4i/zTGdky/U8RbXWYTxirW
 hkf+66+JNuBzdNZRmXq8Pch8p4/CixXZpeUgjued3SqqVOo/QL6E10iUL52ld7Y+wu/s
 dAXdRml8cl7zgErnGCQgyM2J4im0tlz0LP/3WQtmBhMlhNWdlQOugv4drSjkUwp/pMT7
 K5AMie8Fcf5G1z3xan19SeBmo8G4yUsItbFhWmhb5dWzvmqS6uG6oI2TRIzRefzOVi4j
 NDTFHdbRbNcuLTRJKOztXpeAnvueIOrL8iPqitAWp2e1MamntkSXDCgWsORZ4VYZjtlE AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9y5we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3122C100034;
 Fri, 31 Jul 2020 16:32:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A7482B1899;
 Fri, 31 Jul 2020 16:32:01 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:00 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:47 +0200
Message-ID: <20200731143152.8812-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in dk2_i2c1_fix
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

Use IS_ENABLED to prevent ifdef in dk2_i2c1_fix.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index a0a2f9978f..985233f2b3 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -521,7 +521,6 @@ static void sysconf_init(void)
 	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
 }
 
-#ifdef CONFIG_DM_REGULATOR
 /* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
 static int dk2_i2c1_fix(void)
 {
@@ -529,6 +528,9 @@ static int dk2_i2c1_fix(void)
 	struct gpio_desc hdmi, audio;
 	int ret = 0;
 
+	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
+		return -ENODEV;
+
 	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
 	if (!ofnode_valid(node)) {
 		pr_debug("%s: no hdmi-transmitter@39 ?\n", __func__);
@@ -586,7 +588,6 @@ static bool board_is_dk2(void)
 
 	return false;
 }
-#endif
 
 static bool board_is_ev1(void)
 {
@@ -634,12 +635,11 @@ int board_init(void)
 	if (board_is_ev1())
 		board_ev1_init();
 
-#ifdef CONFIG_DM_REGULATOR
 	if (board_is_dk2())
 		dk2_i2c1_fix();
 
-	regulators_enable_boot_on(_DEBUG);
-#endif
+	if (IS_ENABLED(CONFIG_DM_REGULATOR))
+		regulators_enable_boot_on(_DEBUG);
 
 	if (!IS_ENABLED(CONFIG_TFABOOT))
 		sysconf_init();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
