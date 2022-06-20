Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DED345513F9
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4DDC57183;
	Mon, 20 Jun 2022 09:17:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 239B3C03FDF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:17:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8uFvh025790;
 Mon, 20 Jun 2022 11:17:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=isMa0vB0jNvjDW7i/pmwn98nFjZEsSxW1rPP09etp9k=;
 b=1jRT9FnARmFBkR054FUeHlYpnBSG09uh2rxTXK6WNTPuAAHsxdngUhByGZnCJdbj13+b
 PESxt6LgpQjX8UU2Qnxx/WxkJcRiokRKkz/KP+4Q/rNfgYA0hbixDrwAS3UoJnFLL1NQ
 YB0n1FJ1cOaUclzjS7qQmtugK8Lz8rjeRj53G0YbHa7FsAxHbhpJYwiXxNxuUDusFsWY
 ZjJRu7AxON0muqRBiI57wqAcUhZZvKkxPKKc7meYxtmSD+066MGTgnJ7ozL+fTX/vLKQ
 HxOkv54b2d3PmEXv/T41Gm8j0AgneRTQnkxb/3vHGwX7uSlmbf86SgMA6BmHSC2u8hx2 Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtntu04df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:17:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96B6F10002A;
 Mon, 20 Jun 2022 11:17:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBA772171F8;
 Mon, 20 Jun 2022 11:17:23 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:17:23 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:04 +0200
Message-ID: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH 01/10] i2c: stm32: add support for the st,
	stm32mp13 SOC
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

The stm32mp13 soc differs from the stm32mp15 in terms of
clear register offset for controlling the FMP (Fast Mode Plus).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/i2c/stm32f7_i2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index c6ae65badb7..bf2a6c9b4bd 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -267,6 +267,10 @@ static const struct stm32_i2c_data stm32mp15_data = {
 	.fmp_clr_offset = 0x40,
 };
 
+static const struct stm32_i2c_data stm32mp13_data = {
+	.fmp_clr_offset = 0x4,
+};
+
 static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
 {
 	struct stm32_i2c_regs *regs = i2c_priv->regs;
@@ -957,6 +961,7 @@ static const struct dm_i2c_ops stm32_i2c_ops = {
 static const struct udevice_id stm32_i2c_of_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_data },
 	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32mp15_data },
+	{ .compatible = "st,stm32mp13-i2c", .data = (ulong)&stm32mp13_data },
 	{}
 };
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
