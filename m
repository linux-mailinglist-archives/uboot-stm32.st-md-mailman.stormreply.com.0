Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9B876658
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 15:26:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0169C6C83D;
	Fri,  8 Mar 2024 14:26:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDAA5C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 14:26:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428A1WRx004218; Fri, 8 Mar 2024 15:26:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=dmCJnihMFTn0UmO/pPySV4MPwDicvZmFjP+x/9qUp1E=; b=Gf
 C5sw4R/QiDA9ga9KUsFyCkQ4ReyL64HJ6BqKY2B1/Ud1RKBJmmRs6hhsTqnDvo3M
 M8BJX6ImKMgyPZ2lsT3X1ZamHtlk7cjjqid+YbW8w0l8ejzsT+/6CmpyzWDWHTYP
 qCgWpvA93VwI/Ki9B3XEZp8y32c6V7rFU1zjzzbN2eaMP40qXNVjifCeObKFtX/3
 EkjRD6SaC6etWcIG0bDyYAz5pBCe0k2LMhlot+vLiQAzhnTwMS7UI0iA4tLffxGU
 HKjGBUCGs3Bb3hpWrGR4hLY7VIAYBltiNNeALmvqaVDQIrXyieZIZBAMuW7dSxQY
 q4CYLp+CW+s8QP//Smug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wmej5kbss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 15:26:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5912740044;
 Fri,  8 Mar 2024 15:26:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B813B275653;
 Fri,  8 Mar 2024 15:26:17 +0100 (CET)
Received: from localhost (10.252.7.115) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 15:26:17 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Mar 2024 15:26:14 +0100
Message-ID: <20240308142614.2700185-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308142614.2700185-1-patrice.chotard@foss.st.com>
References: <20240308142614.2700185-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] mmc: stm32_sdmmc2: Fix AARCH64
	compilation warnings
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

When building with AARCH64 defconfig, we got warnings, fix them.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index d4982a14281..39ae79ba129 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -220,9 +220,9 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
 
 	if (data->flags & MMC_DATA_READ) {
 		data_ctrl |= SDMMC_DCTRL_DTDIR;
-		idmabase0 = (u32)data->dest;
+		idmabase0 = (u32)(long)data->dest;
 	} else {
-		idmabase0 = (u32)data->src;
+		idmabase0 = (u32)(long)data->src;
 	}
 
 	/* Set the SDMMC DataLength value */
@@ -463,8 +463,8 @@ retry_cmd:
 
 	stm32_sdmmc2_start_cmd(dev, cmd, cmdat, &ctx);
 
-	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%x\n",
-		cmd->cmdidx, data ? ctx.data_length : 0, (unsigned int)data);
+	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%p\n",
+		cmd->cmdidx, data ? ctx.data_length : 0, data);
 
 	ret = stm32_sdmmc2_end_cmd(dev, cmd, &ctx);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
