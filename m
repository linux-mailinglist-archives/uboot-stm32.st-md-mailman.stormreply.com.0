Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929D876EC7
	for <lists+uboot-stm32@lfdr.de>; Sat,  9 Mar 2024 03:19:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F90C6DD94;
	Sat,  9 Mar 2024 02:19:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E23BC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Mar 2024 02:19:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6097C87DDD;
 Sat,  9 Mar 2024 03:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1709950740;
 bh=PAeI9NCzFDhe9XGHiw2jaLdV4s0b4fBGC43SKyY6pCM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKGi4pLVcOTGX50h6WUCqkRrJOfCx54y3AXmaavONaCAzbnKKh/TvOEezDANqiwbf
 mjdoT7ReBq+rZiAmeHcnsE/HMbomXK6jqHIlXkHbhxg/yumPyLqwzvFHFL5hXJqPRR
 tqR/9kFBE7SvInqShnF0K9vWH0yTRcXgifpdV//+6gbtbA8QTd61IADQzwlO0tunGN
 1n01tAMaZX8VTp4TeeOqWwTASGzkufX9EQCj0EHtFajSFNoeKTKarSJsQcczMD7TfD
 G/86uTw1ooNA8ljmxUMQClERjZGk/GkCCR7lNc3dEdZ1HcxW9fMmJCd+gSFKV6BZ7j
 Ew8IQgeXjdg5g==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  9 Mar 2024 03:11:30 +0100
Message-ID: <20240309021831.264018-10-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240309021831.264018-1-marex@denx.de>
References: <20240309021831.264018-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: [Uboot-stm32] [PATCH 09/11] net: dwc_eth_qos: Request clk-ck
	earlier in probe on STM32
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

Request the clk-ck earlier in probe in preparation for obtaining
the clock rate from these clk-ck in eqos_probe_syscfg_stm32() in
the follow up patch.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Cc: Christophe Roullier <christophe.roullier@st.com>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Ramon Fried <rfried.dev@gmail.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/net/dwc_eth_qos_stm32.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c
index 33477925ff1..4db18130765 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -201,6 +201,11 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		return -EINVAL;
 	}
 
+	/* Get ETH_CLK clocks (optional) */
+	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
+	if (ret)
+		dev_dbg(dev, "No phy clock provided %d", ret);
+
 	ret = eqos_probe_syscfg_stm32(dev, interface);
 	if (ret)
 		return -EINVAL;
@@ -223,11 +228,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
 		goto err_probe;
 	}
 
-	/*  Get ETH_CLK clocks (optional) */
-	ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
-	if (ret)
-		dev_warn(dev, "No phy clock provided %d\n", ret);
-
 	dev_dbg(dev, "%s: OK\n", __func__);
 
 	return 0;
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
