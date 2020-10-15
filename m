Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2D28F2E0
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 15:01:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C7DC424B2;
	Thu, 15 Oct 2020 13:01:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 604B0C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 13:01:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FCqMYY017554; Thu, 15 Oct 2020 15:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MiZ+pLJOplP0fOSwNQdXkzwkcNxvN2R1Hw5vlJBhZSc=;
 b=bG0zTZQCii6Nbe7mzCYiZW8UKxcI+SNEAXYwcCofZpyE8KddA1dBBy/hzCd4ciJ0jwnq
 1qKbBFQRnNZ8oa3mxTXUu70u4u829TaxBntWyy/cF5hvqfyRC4fyBaC6OFZII539sET/
 OAQLrz6Xqf9y7gJph21Mbwvj6/uOlyIZ67kAmvITxqNH86p5fEjoaKJ8y0NdQVVd6ari
 1AFL5UYMGlwBBWBxojITnLTwrAS2Ctiq5ckPmdk4051g68TD+Yks53T1V5UdJ5wE4nj7
 qG4YCsbofkvDFEO+9XTMLIHODdjqst8xeJBQpcD/CNSxhDXdaaVplTd1tDZgzWlguu1E HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wpbtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 15:01:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44964100034;
 Thu, 15 Oct 2020 15:01:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CC342A461A;
 Thu, 15 Oct 2020 15:01:17 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 15:01:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 15:01:13 +0200
Message-ID: <20201015150101.3.If11081706d310a6eb7ed2ba30291bdd20e74927b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] remoteproc: stm32: update error
	management in stm32_copro_start
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

The coprocessor is running as soon as the hold boot is de-asserted.

So indicate this running state and save the resource table even
if the protective assert, to avoid autonomous reboot, is failed.

This error case should never occurs.


Cc: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/remoteproc/stm32_copro.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index da678cb329..dc87cb794e 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -139,19 +139,18 @@ static int stm32_copro_start(struct udevice *dev)
 
 	/*
 	 * Once copro running, reset hold boot flag to avoid copro
-	 * rebooting autonomously
+	 * rebooting autonomously (error should never occur)
 	 */
 	ret = reset_assert(&priv->hold_boot);
 	if (ret)
 		dev_err(dev, "Unable to assert hold boot (ret=%d)\n", ret);
 
-	writel(ret ? TAMP_COPRO_STATE_OFF : TAMP_COPRO_STATE_CRUN,
-	       TAMP_COPRO_STATE);
-	if (!ret)
-		/* Store rsc_address in bkp register */
-		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
+	/* indicates that copro is running */
+	writel(TAMP_COPRO_STATE_CRUN, TAMP_COPRO_STATE);
+	/* Store rsc_address in bkp register */
+	writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
