Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A215652D991
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 May 2022 17:57:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 602E5C5F1D5;
	Thu, 19 May 2022 15:57:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC54AC5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 15:57:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JC5I81024847;
 Thu, 19 May 2022 17:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qkA5v5q8XaYOPSok/X/Z+IFYbtJUKhqs0LInT6vrChM=;
 b=xpe5elB1TFF0/gjSMMnn88AyJB7GmSFu5uSfV7wv2LbN4d4nO98EVuYcldVtcxD2PJnk
 bHbZE0XlDbcarAbyYQsWmWRCyv85rP0Tj6Ooq8zzQL9mCZ3iFatZ3zFPpXESGT1pz4jV
 yn9c5rJxCDmyf/3610/1h/bPG1YnzWJk9g/v1XEkEDWqmhiwc/z4iPFs2ANZuofZ9Y7v
 6FGOHCMrGi2X95WfzCxz/GS1EeJsgWtOKIP+QyY08xC3nta0jbiTU1u07ukf7TvLgQeN
 aCd6EmWlbmBc7LUbD2d3pDTXcxvJ8GmsNo5ld+PuDgcfYW1La/OxuDsnnm7zIdXn3ktE Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9apba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 17:57:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 54F2E100039;
 Thu, 19 May 2022 17:57:10 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 39AFB22D173;
 Thu, 19 May 2022 17:57:10 +0200 (CEST)
Received: from localhost (10.75.127.51) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 19 May
 2022 17:56:54 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 May 2022 17:56:46 +0200
Message-ID: <20220519175614.v2.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
References: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_05,2022-05-19_03,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/3] misc: stm32mp13: introduce STM32MP13
	RCC driver
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

Add the MISC RCC driver for STM32MP13, and bind it to the RCC reset
driver, required for initial support.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/misc/stm32_rcc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index f14d6e26d9..b816503bfa 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -39,6 +39,11 @@ struct stm32_rcc_clk stm32_rcc_clk_mp1 = {
 	.soc = STM32MP1,
 };
 
+struct stm32_rcc_clk stm32_rcc_clk_mp13 = {
+	.drv_name = "stm32mp13_clk",
+	.soc = STM32MP1,
+};
+
 static int stm32_rcc_bind(struct udevice *dev)
 {
 	struct udevice *child;
@@ -79,6 +84,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
 	{.compatible = "st,stm32f746-rcc", .data = (ulong)&stm32_rcc_clk_f7 },
 	{.compatible = "st,stm32h743-rcc", .data = (ulong)&stm32_rcc_clk_h7 },
 	{.compatible = "st,stm32mp1-rcc", .data = (ulong)&stm32_rcc_clk_mp1 },
+	{.compatible = "st,stm32mp13-rcc", .data = (ulong)&stm32_rcc_clk_mp13 },
 	{ }
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
