Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C852CC7D
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 09:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4E39C03FCC;
	Thu, 19 May 2022 07:07:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62F6AC03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 07:07:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J4ZAMp021908;
 Thu, 19 May 2022 09:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=D1MXTarB9LTM0x9tpFDsU4iqFB5eA5g8ERqa86decxk=;
 b=EgqBu1hEUd/IzR9KsT/yc3C7B8gjzObfePMPJYEKSGdileEmxBByRCjTRrEKIS1TAKMe
 F/nX3nc+MMnaP5Vy98zNFQpOQZoiebEXG98N1b8sx3dRao0Ay7cnfNaT1dog8iFTgeHS
 wEXBu9DcH/5jn3P0u6r9xzrIAsATw3cPU0Vc03spnJCT1bdJA6HYSaDi6AC+OEu9iIk0
 SJtxwUh2c2fL6f0t2DDWPbUdvybRvH/SuV5DYfa6mVdHf0SjSoZzaJgCOs440J4oH2mx
 dgbEwvuKGYw46gJXe3hz/2AL7fy41/zPNUC5kV27ce75b+btiMjE9Y2aGtQra0XYl9Jz Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21um3yd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 09:07:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A30F100034;
 Thu, 19 May 2022 09:07:34 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 115392122F0;
 Thu, 19 May 2022 09:07:34 +0200 (CEST)
Received: from localhost (10.75.127.49) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 09:07:33 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 May 2022 09:07:29 +0200
Message-ID: <20220519090726.1.I90e5b703cfebfe4c411fc13420155b9f9cfb0380@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_01,2022-05-17_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] board: stm32mp1: convert to livetree
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

Replace gd->fdt_blob access with fdt_getprop() function to the
function ofnode_get_property() to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 07b1a63db7..700ff9ca07 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -82,11 +82,6 @@
 #define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
 #define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
 
-/*
- * Get a global data pointer
- */
-DECLARE_GLOBAL_DATA_PTR;
-
 #define USB_LOW_THRESHOLD_UV		200000
 #define USB_WARNING_LOW_THRESHOLD_UV	660000
 #define USB_START_LOW_THRESHOLD_UV	1230000
@@ -116,8 +111,8 @@ int checkboard(void)
 		mode = "basic";
 	}
 
-	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-				 &fdt_compat_len);
+	fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
+					 &fdt_compat_len);
 
 	log_info("Board: stm32mp1 in %s mode (%s)\n", mode,
 		 fdt_compat && fdt_compat_len ? fdt_compat : "");
@@ -690,8 +685,8 @@ int board_late_init(void)
 	int buf_len;
 
 	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
-		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-					 &fdt_compat_len);
+		fdt_compat = ofnode_get_property(ofnode_root(), "compatible",
+						 &fdt_compat_len);
 		if (fdt_compat && fdt_compat_len) {
 			if (strncmp(fdt_compat, "st,", 3) != 0) {
 				env_set("board_name", fdt_compat);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
