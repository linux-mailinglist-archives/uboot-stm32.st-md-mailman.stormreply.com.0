Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77C7D12E8
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 17:36:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5191C36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 15:36:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04B07C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:36:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99FM0oO026764; Wed, 9 Oct 2019 17:36:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KsdX5KZSIT8Bp+MR/JKk6a9po7Vi0bhiWbspbzVmsYY=;
 b=jnFhy8oEDW8mEUXfXMaQwMsCJ91xKpU0s/24hb3JpxU6pgpho/xlxEfnmmZ3yI78C84G
 +tSqI6v5z4ALErAWGTDHYUxYrypxeyKvkFrMsp8C5Nt+oVxE5fYApbuOdxM2o3t8gi2p
 MoRs7uhACFF2zgGh6ej4P7DI1Q/LFXJUjyZE8cJhVmhMVM+eXJ0lfmdGq0HyDl+7tKY2
 kknSe9ZkD2cqgdAQDhej3bjNcBPf51u1h2JoRXNTWxgDikZ2cKAi8LtZphXSOdmVxUpL
 DCEWYX1vVWXF/7pKFDThFKClNv7FmAV9AP5epqgmgO7EzZKo+pLtQIQgQGUNx7IWO33Z rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxvxrv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 17:36:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26AB410003B;
 Wed,  9 Oct 2019 17:36:46 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B7D82A56A6;
 Wed,  9 Oct 2019 17:36:46 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 17:36:46 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 17:36:45
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>
Date: Wed, 9 Oct 2019 17:36:29 +0200
Message-ID: <1570635389-8445-6-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 5/5] remoteproc: stm32: invert the
	is_running() return value
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

The .is_running() ops expects a return value of 0 if the processor is
running, 1 if not running : align to this.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/stm32_copro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index eef3416..fce9653 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -237,14 +237,14 @@ static int stm32_copro_stop(struct udevice *dev)
 /**
  * stm32_copro_is_running() - Is the STM32 remote processor running
  * @dev:	corresponding STM32 remote processor device
- * @return 1 if the remote processor is running, 0 otherwise
+ * @return 0 if the remote processor is running, 1 otherwise
  */
 static int stm32_copro_is_running(struct udevice *dev)
 {
 	struct stm32_copro_privdata *priv;
 
 	priv = dev_get_priv(dev);
-	return priv->is_running;
+	return !priv->is_running;
 }
 
 static const struct dm_rproc_ops stm32_copro_ops = {
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
