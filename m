Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE84A5CBB
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Feb 2022 14:02:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52AB9C60460;
	Tue,  1 Feb 2022 13:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60FECC5F1EC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 13:02:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21194OVp005850;
 Tue, 1 Feb 2022 14:02:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=TasIMPcTEr8RE18JY9qzeyGe8rDC8DrNotFBZlGJQjU=;
 b=Y/BJBXoRDdSKV3mAhm+OkAWoKChfLuScndKc6qSdR4ixiYybSJgQPvlNmnzouv0dnHVD
 t4oFGFbt4Us893M1ryu/L2CV5OVT7qw7CDjwTnnK2+Rkn6aHJll0S44l2KuRqqKUZNsL
 V0lVANwhersGTaEvD5i/5EcxfhZ4mYeMEiiXd4DpLMl/cv3KhReItRM0RaMVkOwzrUyt
 VKmQQecNUTRg5LKR1u3jeGdRos6+cx+Seec08iUtNU0e5wm01ZdgthbViE6i7SWYlkLT
 QptkYopDMrBKBD/XXqTOnYL9Mf28aCBixSax1ybg38qu+b0CvuiMIkNj65m4d2LgZ94s Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dy1wn92s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 14:02:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15CA310002A;
 Tue,  1 Feb 2022 14:02:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E765B21B511;
 Tue,  1 Feb 2022 14:02:33 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 1 Feb 2022 14:02:33
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Feb 2022 14:02:14 +0100
Message-ID: <20220201140211.1.I6a1d7cbbdc7d1b209e4fa704fa7dd6524b4cec9f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_06,2022-02-01_01,2021-12-02_01
Cc: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@foss.st.com>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: fix the check of
	return value of clk_set_rate()
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

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

The clk_set_rate() function returns rate as an 'ulong' not
an 'int' and rate > 0 by default.

This patch avoids to display the associated warning when
the set rate function returns the new frequency.

Fixes: aeaf330649e8 ("video: stm32: stm32_ltdc: add bridge to display controller")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/stm32/stm32_ltdc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 87e5fd54d9..e741e74739 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -338,6 +338,7 @@ static int stm32_ltdc_probe(struct udevice *dev)
 	struct display_timing timings;
 	struct clk pclk;
 	struct reset_ctl rst;
+	ulong rate;
 	int ret;
 
 	priv->regs = (void *)dev_read_addr(dev);
@@ -375,13 +376,13 @@ static int stm32_ltdc_probe(struct udevice *dev)
 		}
 	}
 
-	ret = clk_set_rate(&pclk, timings.pixelclock.typ);
-	if (ret)
-		dev_warn(dev, "fail to set pixel clock %d hz\n",
-			 timings.pixelclock.typ);
+	rate = clk_set_rate(&pclk, timings.pixelclock.typ);
+	if (IS_ERR_VALUE(rate))
+		dev_warn(dev, "fail to set pixel clock %d hz, ret=%ld\n",
+			 timings.pixelclock.typ, rate);
 
 	dev_dbg(dev, "Set pixel clock req %d hz get %ld hz\n",
-		timings.pixelclock.typ, clk_get_rate(&pclk));
+		timings.pixelclock.typ, rate);
 
 	ret = reset_get_by_index(dev, 0, &rst);
 	if (ret) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
