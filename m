Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8D28DC91
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2E4AC424BB;
	Wed, 14 Oct 2020 09:17:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77A06C424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DJFc020409; Wed, 14 Oct 2020 11:17:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=GMymlp/JF+wPEkumPRQSKR1wtK45nwiU8K1pNbRZmjA=;
 b=Vp2bXGAfBHm6kKOpb1mAi7jV4Myn61lLOnkUndDEuLBumWfwFILD1tqi3V/8BjOXzbkF
 Jn++QQ7rKaZaUrRDvf4m4CmOMnGvd3naCYJ4C1nMiKSkbpQJRaKn4MGtopwBpAiT2Az4
 4WWJkS2x/kkICk8+OIIQPIVV86LKHqFLguH9BhIvRqzmVqcIaDOvwolB0aU6LuBrX9g4
 Q98P7Lpm6UZX4PLz4AamxfL56i6cTDMWpd4WzSeteT9h/mClWxLxhPD0hDE8mBkyzqhZ
 rKgZkQXzEbOrLls+vpNO1phKXk08r/Tqk4Vkl71Lkwf3YZw0zkzyA9P3HvjauPlo//W8 NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3435874hu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2E91C100034;
 Wed, 14 Oct 2020 11:17:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 267902ABA3E;
 Wed, 14 Oct 2020 11:17:03 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:02
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:28 +0200
Message-ID: <20201014091646.4233-16-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 15/33] misc: rcc: migrate trace to dev macro
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

Change debug and pr_err to dev macro and define LOG_CATEGORY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/misc/stm32_rcc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index b82fe54c60..c1a99d78e2 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -4,6 +4,8 @@
  * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_NOP
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
@@ -45,10 +47,10 @@ static int stm32_rcc_bind(struct udevice *dev)
 		(struct stm32_rcc_clk *)dev_get_driver_data(dev);
 	int ret;
 
-	debug("%s(dev=%p)\n", __func__, dev);
+	dev_dbg(dev, "RCC bind\n");
 	drv = lists_driver_lookup_name(rcc_clk->drv_name);
 	if (!drv) {
-		debug("Cannot find driver '%s'\n", rcc_clk->drv_name);
+		dev_err(dev, "Cannot find driver '%s'\n", rcc_clk->drv_name);
 		return -ENOENT;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
