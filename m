Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950A28DC9A
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31532C424BD;
	Wed, 14 Oct 2020 09:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50DCC424B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CpjR010617; Wed, 14 Oct 2020 11:17:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DnABjSV3zHqewDhrfAlPJyTZ7QDQlERJQS9qWjOedIQ=;
 b=mv/KFe7MyCVkkS6f48u9zXNq56gbtAPRizDUyQan34gEjLMNtZmW18o4YQZrblhgKOV8
 HjgB8VUHA5dk4WHDVzhNpKEWKDlcUZa/1DRufMiTPlPfHaOPXtQ0mmY50BVPhvFL02JJ
 gF1TbYRudmmYAiZd3B+5sSZEDjIrkZ+SWtBgGKuoD20IqT99wsv9207HQiQ7P8yMGLHE
 Gjr2OwLHui7pUpUYtHoSCHqdB+IFIXuWcP/Qb5ByPJPEa69Lq95+50Jxl+0CqYlYJCBm
 LB6Uai7NR+Kc0esfvZ6vyeom6d5iVneAcPbCW1FSj9z5+MLlFKbjglmW25oMq+9IwHvD 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8gca0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B95BE100034;
 Wed, 14 Oct 2020 11:17:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF8D12ABA3E;
 Wed, 14 Oct 2020 11:17:09 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:09
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:34 +0200
Message-ID: <20201014091646.4233-22-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 21/33] mailbox: stm32-ipcc: migrate trace to
	dev and log macro
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

Change debug to dev_dbg macro and define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/mailbox/stm32-ipcc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 81a4115986..990b853d34 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -3,6 +3,8 @@
  * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_MAILBOX
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -44,11 +46,11 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
 {
 	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
 
-	debug("%s(chan=%p)\n", __func__, chan);
+	dev_dbg(chan->dev, "chan=%p\n", chan);
 
 	if (chan->id >= ipcc->n_chans) {
-		debug("%s failed to request channel: %ld\n",
-		      __func__, chan->id);
+		dev_dbg(chan->dev, "failed to request channel: %ld\n",
+			chan->id);
 		return -EINVAL;
 	}
 
@@ -57,7 +59,7 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
 
 static int stm32_ipcc_free(struct mbox_chan *chan)
 {
-	debug("%s(chan=%p)\n", __func__, chan);
+	dev_dbg(chan->dev, "chan=%p\n", chan);
 
 	return 0;
 }
@@ -66,7 +68,7 @@ static int stm32_ipcc_send(struct mbox_chan *chan, const void *data)
 {
 	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
 
-	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
+	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
 
 	if (readl(ipcc->reg_proc + IPCC_XTOYSR) & BIT(chan->id))
 		return -EBUSY;
@@ -83,7 +85,7 @@ static int stm32_ipcc_recv(struct mbox_chan *chan, void *data)
 	u32 val;
 	int proc_offset;
 
-	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
+	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
 
 	/* read 'channel occupied' status from other proc */
 	proc_offset = ipcc->proc_id ? -IPCC_PROC_OFFST : IPCC_PROC_OFFST;
@@ -104,7 +106,7 @@ static int stm32_ipcc_probe(struct udevice *dev)
 	struct clk clk;
 	int ret;
 
-	debug("%s(dev=%p)\n", __func__, dev);
+	dev_dbg(dev, "\n");
 
 	addr = dev_read_addr(dev);
 	if (addr == FDT_ADDR_T_NONE)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
