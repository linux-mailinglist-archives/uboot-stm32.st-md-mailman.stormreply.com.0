Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D753B94E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jun 2022 15:05:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45B04C0D2C2;
	Thu,  2 Jun 2022 13:05:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F312EC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 13:05:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25280vTx004990;
 Thu, 2 Jun 2022 15:05:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zRZanwXht4rVVUuzzTNYV40kiKzfRCYQz4t57M6px80=;
 b=ua+VS+jjvtuJefBXgvUXo21v5I+0hDsugEEzi+390RjDX+WbyU/7xVAxOfHuYxxqnDAI
 B0fiZEJKsPat3bqF1yBbMHO4ot0287QPl3ycJeyEDy3dLzeC4VB1hhPJaUN0ZkUktH9X
 +QcgMSFROw6Dk4RRPlK+KN1RcXR7GnbaaaSOI333tx7C2x6k65CM0lbovEVgRKyFo4Hq
 3bG/ENF+CkDfnzTQNQufwPwZx+F8LqJTmT7DdgN7rm5AI5wHP9zJWt79j2ZVvAYv0kJi
 KvAVP/WMRphGhzllgeRt1TV4szXyK77FJnIEA+o1isPdbrRi1LQ5tBIieWMWGO+RbN4D Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc50yrsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 15:05:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5027D10002A;
 Thu,  2 Jun 2022 15:05:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A5DF226FB6;
 Thu,  2 Jun 2022 15:05:44 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 15:05:44 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jun 2022 15:05:34 +0200
Message-ID: <20220602150254.v3.2.I98b0b23318f39ef6411b8f96c05f5b11b4cf5de7@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
References: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_03,2022-06-02_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 2/3] misc: stm32mp13: introduce STM32MP13
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
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
