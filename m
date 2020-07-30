Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E1233199
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 14:04:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B2CAC36B36
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jul 2020 12:04:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25DE3C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jul 2020 12:04:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UBwcke000949; Thu, 30 Jul 2020 14:04:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BNzwyQu9YPnssLFrACqWQNAB14Kyw9pcU1AoQEPZ87M=;
 b=toJnhQYhYPolqd5xNvNvOZCAzS2H6zxtU6D/PSARL9Pst3Zci+knFuxpe9mUoIutF2Ql
 TfKBg8EUEFfMPypalN2tEGsKhR5Xf8q3ztGakm7nmbljM2C0hjTaZsijag5tWKcU3BcQ
 RxTZVq1J+YUhsWRWY5MoZLwqN46Lxig3o5v3GBuzEWUuPGhI2Oa057tTrXNBkMfN0Qsg
 Gg2OuyKno72tUM8C0TW3kGgtr0XvFXkSOHkGlCwLru0uBmL6/mLDmPtvGjuH112Z6GyO
 FvV0yRw4mcfC0RSMZyhiNNXNrbfmp23cfRvzny+mUvlvaImmBHKIwS71RHqH2z1KGmh+ bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga728bh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 14:04:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEBBA100034;
 Thu, 30 Jul 2020 14:04:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1F4F2AF82D;
 Thu, 30 Jul 2020 14:04:16 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Jul 2020 14:04:16 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jul 2020 14:04:10 +0200
Message-ID: <20200730140347.2.I49a10ddbcc4100fd5d62b55f760128a7ecef2cb8@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
References: <20200730140347.1.I0977b8abc51b9854d9e8f7822a7b28f3f219b99e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_09:2020-07-30,
 2020-07-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] cmd: clk: correctly handle depth for clk
	dump
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

Update depth only when clock uclass is found to have correct display
of command "clk dump".

Without this patch, the displayed depth is the binding depth for
all the uclass and that can be strange as only clock uclass nodes
are displayed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cmd/clk.c b/cmd/clk.c
index ba4540334a..e3c3d2f9bb 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -23,6 +23,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 
 	clkp = dev_get_clk_ptr(dev);
 	if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
+		depth++;
 		rate = clk_get_rate(clkp);
 
 		printf(" %-12u  %8d        ", rate, clkp->enable_count);
@@ -47,7 +48,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
 
 	list_for_each_entry(child, &dev->child_head, sibling_node) {
 		is_last = list_is_last(&child->sibling_node, &dev->child_head);
-		show_clks(child, depth + 1, (last_flag << 1) | is_last);
+		show_clks(child, depth, (last_flag << 1) | is_last);
 	}
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
