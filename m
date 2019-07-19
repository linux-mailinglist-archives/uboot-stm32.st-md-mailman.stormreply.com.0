Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FAB6E38F
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9381C61F97
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B41C61F8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9adTu004483; Fri, 19 Jul 2019 11:39:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=V3z6Pi7v2ZLGXMNlAcb0fYmpjTmDFkEWUd3gm2cjZhw=;
 b=HAxmxRmROIZYMwiaaxea4jwygVM7xajBovNHg8dFwu5Si15kQ6+OD4ohtsQwj4NXgAy0
 DVY0NNIUGs9RYEFtScl3Sf8+av8LsPnM94G7bzrmivhE+yxOaYAtE8xSftU1gI4WlwsM
 By4Uu3Z5eQO2gyweXQfuCotimK+ZDDrS1B2KtxG3+t1B643Lc3xH4rPLVTEBcX1TXhEZ
 nILd8Wp//crZJ7JcdZcmlrltOBhYxaQrkNTSa6PRRXz8ZFt1xPAUGPLLm7xsbGcSGn8R
 KJvc4HBwBgFz2WD2zRYcYEivM7ixDU+nC9orzNHJ9Zt3m2QWAOaaD9/JSFRTBidiC/gD CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s27hew-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:48 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 159373D;
 Fri, 19 Jul 2019 09:39:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3CD827EB;
 Fri, 19 Jul 2019 09:39:46 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:46 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:46
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:31 +0200
Message-ID: <1563529171-16796-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 5/5] misc: change RCC form MISC to NOP uclass
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

The RCC driver have no operation so the new NOP uclass
is more appropriate. It only used as parent for clock and reset driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/misc/stm32_rcc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index 13d7069..e7efcde 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -68,8 +68,6 @@ static int stm32_rcc_bind(struct udevice *dev)
 					    dev_ofnode(dev), &child);
 }
 
-static const struct misc_ops stm32_rcc_ops = {
-};
 
 static const struct udevice_id stm32_rcc_ids[] = {
 	{.compatible = "st,stm32f42xx-rcc", .data = (ulong)&stm32_rcc_clk_f42x },
@@ -82,8 +80,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
 
 U_BOOT_DRIVER(stm32_rcc) = {
 	.name		= "stm32-rcc",
-	.id		= UCLASS_MISC,
+	.id		= UCLASS_NOP,
 	.of_match	= stm32_rcc_ids,
 	.bind		= stm32_rcc_bind,
-	.ops		= &stm32_rcc_ops,
 };
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
