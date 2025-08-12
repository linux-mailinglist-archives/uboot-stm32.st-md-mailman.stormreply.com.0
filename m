Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C522B2295F
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Aug 2025 15:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72FFBC3F931;
	Tue, 12 Aug 2025 13:57:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2547DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 13:57:03 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDjM6f014773;
 Tue, 12 Aug 2025 15:56:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=mPn7csvi5NJImZ2F0j2HDy
 Xo0kBRjq8kOg22l6hbHW4=; b=wjTptqlCyP2hyEG+F6MWWope3Ki2eBWrTSbEpd
 0hTYsGiMrtG8Papm5ahlsaYDkHOA8Hc03Mq7cReq3eER7uaEqWgqIpF7b2Oo3AOX
 xtYNK6L1aZ2jLlPjZjixbVa9thBeE/Nx0dvrLIJuMKI5pHv/fxpYxdn7OQKeIFXz
 pnBIwDAHojroNAP/apswP5DjiWP5BjYfnRyoVY2h545HCcDkKMzxzC+m43PSao25
 uExconrgK8yxuhASFADTdmyHEdYRXxaOyYIhS7gkwEgIll/ZZiX36KvAmsBhJ/lD
 6ai6/u6WV4OY7OgWV2L9O8efropYWbB/QnMhWyrKNURDdRXg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48efw4rr00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Aug 2025 15:56:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D034040051;
 Tue, 12 Aug 2025 15:56:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A18CC78C476;
 Tue, 12 Aug 2025 15:55:40 +0200 (CEST)
Received: from localhost (10.48.87.65) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 15:55:40 +0200
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Aug 2025 15:55:26 +0200
Message-ID: <20250812135526.268574-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.65]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: avoid infinite while loop
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

Avoid unlimited while loop by adding a timeout. The timeout is
calculated based on a minimal throughput of 256 KB/s.
The timeout is set at least to 2 seconds.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 9483fb57daf..122690aef3e 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -385,15 +385,29 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
 	u32 mask = SDMMC_STA_DCRCFAIL | SDMMC_STA_DTIMEOUT |
 		   SDMMC_STA_IDMATE | SDMMC_STA_DATAEND;
 	u32 status;
+	unsigned long timeout_msecs = ctx->data_length >> 8;
+	unsigned long start_timeout;
+
+	/* At least, a timeout of 2 seconds is set */
+	if (timeout_msecs < 2000)
+		timeout_msecs = 2000;
 
 	if (data->flags & MMC_DATA_READ)
 		mask |= SDMMC_STA_RXOVERR;
 	else
 		mask |= SDMMC_STA_TXUNDERR;
 
+	start_timeout = get_timer(0);
 	status = readl(plat->base + SDMMC_STA);
-	while (!(status & mask))
+	while (!(status & mask)) {
+		if (get_timer(start_timeout) > timeout_msecs) {
+			ctx->dpsm_abort = true;
+			return -ETIMEDOUT;
+		}
+
+		schedule();
 		status = readl(plat->base + SDMMC_STA);
+	}
 
 	/*
 	 * Need invalidate the dcache again to avoid any
-- 
2.25.1

base-commit: d1d54857dc618f8c080dbb87de5218e6c330b0d4
branch: SDMMC-avoid-infinite-loop
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
