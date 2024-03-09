Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C698876EC0
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:18:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D838EC6DD9A;
	Sat,  9 Mar 2024 02:18:57 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F5EC6DD9A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:18:56 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9BC6C87D45;
 Sat,  9 Mar 2024 03:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950735;
 bh=+t6gy/FRN25w/SUr6D3KEJ9PPmeszlEDMrh0Obre4Wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dzJSBZ0+fqBB1MsCVdCgxOfnZr9iQ/xqtDGLqQhYRpmW3X4CPsR4KFG2eIsk4/esE
 szcNvskuKyO4ZIl3xWL7Ht1FKIF0BzBy9wGvyBkadcrkBUnU3rmNj/rHJxfVN2gXqp
 Zsqj1XC8YPMMXxgbzzgEAAPNw+hxQk5D9ii+QWYYhiq3ks+sil03qbNEtqGXcNpjz6
 bn9Br+Q/2uXVjNPgXfQTpVCBbL+KUJ5jnd8K3G4giBLdkPQGIlkABEy9B847k2U/Ip
 /rW+I1iFpXJ9rXw38HFJ3xajIfgEzmvQif1m5911NpZ/8UPIs2TAssdjZfagVkWLFM
 x6MSdrbjyd6Bg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:23 +0100
Message-ID: <20240309021831.264018-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240309021831.264018-1-marex@denx.de>
References: <20240309021831.264018-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH 02/11] net: dwc_eth_qos: Rename
	eqos_stm32_config to eqos_stm32mp15_config
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

The current glue code is specific to STM32MP15xx, the upcoming STM32MP13xx
will introduce another entry specific to the STM32MP13xx. Rename the current
entry to eqos_stm32mp15_config in preparation for STM32MP13xx addition. No
functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/net/dwc_eth_qos.c       | 2 +-
 drivers/net/dwc_eth_qos.h       | 2 +-
 drivers/net/dwc_eth_qos_stm32.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 533c2bf070b..203bfc0848c 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] = {
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
 	{
 		.compatible = "st,stm32mp1-dwmac",
-		.data = (ulong)&eqos_stm32_config
+		.data = (ulong)&eqos_stm32mp15_config
 	},
 #endif
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h
index a6087f191ab..bafd0d339fb 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);
 extern struct eqos_config eqos_imx_config;
 extern struct eqos_config eqos_rockchip_config;
 extern struct eqos_config eqos_qcom_config;
-extern struct eqos_config eqos_stm32_config;
+extern struct eqos_config eqos_stm32mp15_config;
 extern struct eqos_config eqos_jh7110_config;
diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index cfda757133e..fd29a604987 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops = {
 	.eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32
 };
 
-struct eqos_config __maybe_unused eqos_stm32_config = {
+struct eqos_config __maybe_unused eqos_stm32mp15_config = {
 	.reg_access_always_ok = false,
 	.mdio_wait = 10000,
 	.swr_wait = 50,
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
