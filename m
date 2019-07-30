Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C730A7AFA3
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94BA6C35E05
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A43BC35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG2pZ001949; Tue, 30 Jul 2019 19:17:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B6pqxc1IO5CmAXrDRAtraEUZF6i8lfE3gffGyo6W1LM=;
 b=bkQ9Enq00ROF9Xp/wAfntMaxsf0MbuhaXir6w7KAnV4X2nTE57VjYYyTHoyk1/yByA5t
 QwHWVhKyc0fek2uZgogQQwNAwoFRIHZCZ5sd/sIejRH0EnawUhCvZPkoal1uaGgRAeXO
 O/Pk+foMqmF0ZM3P/OrRVAtVHvy+dfWV7ZTGdvObLOTz2CWYAZ4082qceaTjavGTf0Yj
 DrkFdDeBocuKxk51hvV/8OwyIKUyNlvQLK+35NLxlEb2eb47H0qELcp9ug6s5lTHwpNP
 sFeQV+2FZWIAXtGXaHNlRlAMNKz+HqgMiGIhhZNg3FWz6HuypmNSIJUsVtj7QVOTJaxe Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acwe-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3B4331;
 Tue, 30 Jul 2019 17:17:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E4E929B3;
 Tue, 30 Jul 2019 17:17:54 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:54 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:54
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:55 +0200
Message-ID: <1564507016-16570-48-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 47/48] stm32mp1: clk: use gd to store
	frequency information
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

Use existing gd structure to store frequency information
which can be used in drivers or arch without new request.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/clk/clk_stm32mp1.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 359c2b9..e87307f 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -15,6 +15,8 @@
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
 
+DECLARE_GLOBAL_DATA_PTR;
+
 #ifndef CONFIG_STM32MP1_TRUSTED
 #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
 /* activate clock tree initialization in the driver */
@@ -2042,22 +2044,22 @@ static int stm32mp1_clk_probe(struct udevice *dev)
 		stm32mp1_clk_dump(priv);
 #endif
 
+	gd->cpu_clk = stm32mp1_clk_get(priv, _CK_MPU);
+	gd->bus_clk = stm32mp1_clk_get(priv, _ACLK);
+	/* DDRPHYC father */
+	gd->mem_clk = stm32mp1_clk_get(priv, _PLL2_R);
 #if defined(CONFIG_DISPLAY_CPUINFO)
 	if (gd->flags & GD_FLG_RELOC) {
 		char buf[32];
 
 		printf("Clocks:\n");
-		printf("- MPU : %s MHz\n",
-		       strmhz(buf, stm32mp1_clk_get(priv, _CK_MPU)));
+		printf("- MPU : %s MHz\n", strmhz(buf, gd->cpu_clk));
 		printf("- MCU : %s MHz\n",
 		       strmhz(buf, stm32mp1_clk_get(priv, _CK_MCU)));
-		printf("- AXI : %s MHz\n",
-		       strmhz(buf, stm32mp1_clk_get(priv, _ACLK)));
+		printf("- AXI : %s MHz\n", strmhz(buf, gd->bus_clk));
 		printf("- PER : %s MHz\n",
 		       strmhz(buf, stm32mp1_clk_get(priv, _CK_PER)));
-		/* DDRPHYC father */
-		printf("- DDR : %s MHz\n",
-		       strmhz(buf, stm32mp1_clk_get(priv, _PLL2_R)));
+		printf("- DDR : %s MHz\n", strmhz(buf, gd->mem_clk));
 	}
 #endif /* CONFIG_DISPLAY_CPUINFO */
 #endif
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
