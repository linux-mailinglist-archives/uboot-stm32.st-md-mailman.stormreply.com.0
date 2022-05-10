Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D305E520F16
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:51:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ED78C0D2BB;
	Tue, 10 May 2022 07:51:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92050C0D2BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:51:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A6qm9a008107;
 Tue, 10 May 2022 09:51:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1+hJi7xTXv4Vf0BCEc7nS+pznD5eTSpWDrSil4HVsYc=;
 b=T+vE1WufCeY/iXaGIyuAXA1+7Z9UpZDkK1XT33bjcEonZ7rCRvjJkVXPH1djHRCjp4cB
 3nTYL14S0OMOwIg2KQdBeEhzZpXkitztWSc54/AeWvWFiPuJVr4H/haltPCIyRUwIMF1
 kjjEk8pqprCO8lebIgX2mOrilO13RoTG8Hem5sRGlYMxg/YjysfitGXKxVn3KLvNahPe
 +RZNq3lSkJpRX0Gu1SdS7du6IBk6pijvQCYWjPMU1va8FG+pSOpqdwBKKvSBgwK8OTFJ
 CM7v50E3sC3hFBD5KRxWWQiRM0tkHH/XziyHqDviPkW5yK+uDBaOs0NM5663f0reNc4R 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngg87t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:51:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24B26100034;
 Tue, 10 May 2022 09:51:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E3BE20FA28;
 Tue, 10 May 2022 09:51:19 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 09:51:18
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 May 2022 09:51:12 +0200
Message-ID: <20220510095041.3.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/4] misc: stm32mp13: introduce STM32MP13 RCC
	driver
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
