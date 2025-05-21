Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC06ABF679
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 15:44:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 646C5C7A826;
	Wed, 21 May 2025 13:44:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87256C7A827
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 13:44:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LB4Kog002761;
 Wed, 21 May 2025 15:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BvudZuNNyeU1fvjyHA7eKbSYYsGHdK2PZmrvQ9qzQtY=; b=y665T9mz229KMr/9
 ejDa6cUgYY6BnyKpZvdTul69lUJAfJTIavl9KyrF//OJmsaPzdNYOJu3IsAIfUDy
 fZjwzs3a9lN4fqTE4wqe9xHdYONHk4KhlHupoa/5Q4+ieroqUH/73S2i1aAHRDdt
 EIJTn/fzFoiDGA6mwtXoVPrOSQSYw3Lvr3OXrHWqbNf4wGqORePHdJpl7n+wF2r7
 gcJeHPPW7h/LskeJctxtgBbsPYVniLO9Y42272CukIKWFrhISq2L5kC26KPLvwa3
 ymvgEhIfZVDAD4WgvQAFxy9FlUSwJFEMSn8WCuGkbBR9Uxve15ktyW1JxaFa7qVX
 pNG5Xw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf44ev6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 15:44:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2CD1B4005A;
 Wed, 21 May 2025 15:42:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D88ABB2CB67;
 Wed, 21 May 2025 15:41:36 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 15:41:36 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 21 May 2025 15:41:12 +0200
Message-ID: <20250521134117.2828335-9-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
References: <20250521134117.2828335-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Kongyang Liu <seashell11234455@gmail.com>, Alice Guo <alice.guo@nxp.com>,
 Casey Connolly <casey.connolly@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Ye Li <ye.li@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 08/13] clk: scmi: manage properly the clk
	identifier with CCF
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Each clock identifier needs to be unique when CCF is activated,
and it is not respected today by SCMI clock driver.

This patch supports a unique clk id by using the uclass API
clk_get_id() / dev_clk_dm() and by activating by default
CONFIG_CLK_AUTO_ID with CCF which adds an offset to the SCMI
clock identifiers.

After this patch, the SCMI clock driver can coexist with other
clock provider without conflict, they can share internal identifier
[0..N] defined in their binding and the clock ID = 0
(reserved for dummy clock) is no more used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Lukasz Majewski <lukma@denx.de>
Cc: Sean Anderson <seanga2@gmail.com>
---

 drivers/clk/Kconfig    | 1 +
 drivers/clk/clk_scmi.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2e53fe325e..c848b4984f8 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -192,6 +192,7 @@ config CLK_SCMI
 	bool "Enable SCMI clock driver"
 	depends on CLK
 	depends on SCMI_FIRMWARE
+	select CLK_AUTO_ID if CLK_CCF
 	help
 	  Enable this option if you want to support clock devices exposed
 	  by a SCMI agent based on SCMI clock protocol communication
diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index e323a948780..cfb372e6190 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -132,7 +132,7 @@ static int scmi_clk_get_attibute(struct udevice *dev, int clkid, char **name,
 static int scmi_clk_gate(struct clk *clk, int enable)
 {
 	struct scmi_clk_state_in in = {
-		.clock_id = clk->id,
+		.clock_id = clk_get_id(clk),
 		.attributes = enable,
 	};
 	struct scmi_clk_state_out out;
@@ -197,7 +197,7 @@ static int scmi_clk_disable(struct clk *clk)
 static ulong scmi_clk_get_rate(struct clk *clk)
 {
 	struct scmi_clk_rate_get_in in = {
-		.clock_id = clk->id,
+		.clock_id = clk_get_id(clk),
 	};
 	struct scmi_clk_rate_get_out out;
 	struct scmi_msg msg = SCMI_MSG_IN(SCMI_PROTOCOL_ID_CLOCK,
@@ -219,7 +219,7 @@ static ulong scmi_clk_get_rate(struct clk *clk)
 static ulong __scmi_clk_set_rate(struct clk *clk, ulong rate)
 {
 	struct scmi_clk_rate_set_in in = {
-		.clock_id = clk->id,
+		.clock_id = clk_get_id(clk),
 		.flags = SCMI_CLK_RATE_ROUND_CLOSEST,
 		.rate_lsb = (u32)rate,
 		.rate_msb = (u32)((u64)rate >> 32),
@@ -313,7 +313,7 @@ static int scmi_clk_probe(struct udevice *dev)
 				return ret;
 			}
 
-			clk_dm(i, &clk_scmi->clk);
+			dev_clk_dm(dev, i, &clk_scmi->clk);
 
 			if (CLK_HAS_RESTRICTIONS(attributes)) {
 				u32 perm;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
