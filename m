Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 607944A4BC6
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 17:21:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B688C5EC43;
	Mon, 31 Jan 2022 16:21:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFFE9C5EC43
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 16:21:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VEpXnp010822;
 Mon, 31 Jan 2022 17:21:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wZ9KsyEBnLsI1K3Sl9QmYI4psooUY1j7iYECFrT2k4w=;
 b=jmXtbmfNymdQV7X3DLK3Vg+rSy/yci0/ndTHyjtvt77wsWCukAnNb53H3HG2Axr3J+Th
 deqHxU0MaLs7dDkl3XBED9t5RUAJwVi5xmwaLpyasORT2JDaqGTgMLX8N5Mnz3F8QOPL
 E9BfvpCWx/kfKnHSjJAQEbOyR2Gu7e/trjLpEXMsfro1vHL8AOW4p0wZnHdMB7Z4lW9L
 BPso6hrD5VCTlErvpO7Qq3L9hmQQ+wWI9tjh0MnUCvPpxuoAYvWS38DEAgTee4+3WH1q
 mpaFU7qaFqkEXpkkqNb+YTC7WO3Uaimj8QG+pvO2ccgHKwGST3EkHpM/s+sB58/W4nLw AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dx0pyc0mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:21:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3786010002A;
 Mon, 31 Jan 2022 17:21:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD78B222CA0;
 Mon, 31 Jan 2022 17:21:46 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan 2022 17:21:46
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 31 Jan 2022 17:21:38 +0100
Message-ID: <20220131172131.2.I7bc7762eff1e31ab7ff5b34c416ee03b8fe52200@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
References: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/4] cmd: clk: replace clk_lookup by
	uclass_get_device_by_name
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

The function clk_lookup can be replaced by a direct call
to uclass_get_device_by_name for UCLASS_CLK.

This patch removes duplicated codes by the generic DM API and avoids
issue in clk_lookup because result of uclass_get_device wasn't tested;
when ret < 0, dev = NULL and dev->name is invalid, the next function
call strcmp(name, dev->name) causes a crash.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/clk.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index 52237791cf..d615f14a84 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -99,20 +99,6 @@ static int do_clk_dump(struct cmd_tbl *cmdtp, int flag, int argc,
 }
 
 #if CONFIG_IS_ENABLED(DM) && CONFIG_IS_ENABLED(CLK)
-struct udevice *clk_lookup(const char *name)
-{
-	int i = 0;
-	struct udevice *dev;
-
-	do {
-		uclass_get_device(UCLASS_CLK, i++, &dev);
-		if (!strcmp(name, dev->name))
-			return dev;
-	} while (dev);
-
-	return NULL;
-}
-
 static int do_clk_setfreq(struct cmd_tbl *cmdtp, int flag, int argc,
 			  char *const argv[])
 {
@@ -125,9 +111,7 @@ static int do_clk_setfreq(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	freq = dectoul(argv[2], NULL);
 
-	dev = clk_lookup(argv[1]);
-
-	if (dev)
+	if (!uclass_get_device_by_name(UCLASS_CLK, argv[1], &dev))
 		clk = dev_get_clk_ptr(dev);
 
 	if (!clk) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
