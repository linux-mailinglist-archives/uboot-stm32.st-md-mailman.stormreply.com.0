Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8C36D6B0
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Apr 2021 13:43:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0275C57B75;
	Wed, 28 Apr 2021 11:43:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01DE3C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Apr 2021 11:42:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SBghYr016601; Wed, 28 Apr 2021 13:42:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=3UcYpVK3IbJ225WxDPWaMSvc1rak4N/G9KsIpvSpkkM=;
 b=B3wiOB51bzjhzV65qzUqcTrHk+tyUvHkDBsuyg84ASc8fYk0xHlv9zSpyLvj14eCM8ZQ
 OVxUVkAJkWTx16cSvJJU302dfuZHhsK6llQgvJOxTzSy0MbKJvWen0Gm2F/4Tooj68dU
 8XjDTBGhurBcrXb+RWtGI+LqIXXFIS9ahVIMFOc4PhMNyR/wl4TUmfajwk3Rk9qzVE+/
 /zPGUVz32pp9wKZCkcAjptoM5vsNKz8L27iUR0elyVC+UjQaPMZ9urC/i2G1zADq97yZ
 eSLa67ooRqVX8I+JtaagtplclsNRGN5dm2w/3PglygiNBOZrul1zLK8n5a/Px3Ilb1Vt kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 386ea8g2pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 13:42:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E62C710002A;
 Wed, 28 Apr 2021 13:42:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDD7921812A;
 Wed, 28 Apr 2021 13:42:57 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 13:42:57
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Apr 2021 13:42:45 +0200
Message-ID: <20210428114245.21229-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_05:2021-04-27,
 2021-04-28 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Pankaj Dev <pankaj.dev@st.com>
Subject: [Uboot-stm32] [PATCH] reset: stm32: Fix bank and offset computation
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

BITS_PER_LONG is used to represent register's size which is 32.
But when compiled on arch64, BITS_PER_LONG is then equal to 64.

Fix bank and offset computation to make it work on arch32 and
arch64 and ensure that register's size is always equal to 32.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
---

 drivers/reset/stm32-reset.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
index daa2e47ebb..bbc6b135a9 100644
--- a/drivers/reset/stm32-reset.c
+++ b/drivers/reset/stm32-reset.c
@@ -40,8 +40,8 @@ static int stm32_reset_free(struct reset_ctl *reset_ctl)
 static int stm32_reset_assert(struct reset_ctl *reset_ctl)
 {
 	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
-	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
-	int offset = reset_ctl->id % BITS_PER_LONG;
+	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
+	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
 
 	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
 		reset_ctl->id, bank, offset);
@@ -61,8 +61,8 @@ static int stm32_reset_assert(struct reset_ctl *reset_ctl)
 static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
 {
 	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
-	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
-	int offset = reset_ctl->id % BITS_PER_LONG;
+	int bank = (reset_ctl->id / (sizeof(u32) * BITS_PER_BYTE)) * 4;
+	int offset = reset_ctl->id % (sizeof(u32) * BITS_PER_BYTE);
 
 	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
 		reset_ctl->id, bank, offset);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
