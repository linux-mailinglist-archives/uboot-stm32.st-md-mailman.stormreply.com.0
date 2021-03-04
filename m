Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED532D2B1
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Mar 2021 13:14:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0F25C57B78;
	Thu,  4 Mar 2021 12:14:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 433EEC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 12:14:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124CB92E006321; Thu, 4 Mar 2021 13:14:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pq73NkVlR1+QaaWXKTwWXhqONjiHmiJAIyT9utZwxXc=;
 b=15Bc3c5K8roY99TioSkVfXU7YP4LcmvOZRWFQ+GzEEVidygGXhPQ1+Ry2uCfmIIb6qhC
 mu+DzIaP/Z+Qgy9S+Cq1e+ksN1wqxFFY5pG0wUhDyfHkgEhhFhjIiunUYLRoC7vJj9Gt
 CVRYWBTCdsgaDFYU0iqKdw0GG6ADPsOSA09wZwW8PqAn/klYmQp0qIHfaVXrH+TmpOjj
 Gsd4oQF2MaJVRTNqTihOu+Wi+CNsgr95SNT5yCechWBAhbrQsKzv5ZvyObVPc7im1j9j
 RNxMpEeovMsswOYlz/F82MdaWVAMHTZFaSxmWo05wK8b0bBZLSyAA2IWAp5b5anJsDTa yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 370xej40yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:14:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1175A10002A;
 Thu,  4 Mar 2021 13:14:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0935723E7BA;
 Thu,  4 Mar 2021 13:14:39 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 13:14:38
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Mar 2021 13:14:36 +0100
Message-ID: <20210304131413.2.I6bd3d4c022837f70b36d4fc91b31ae6e9f367c05@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_03:2021-03-03,
 2021-03-04 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] video: dw_mipi_dsi: update log of
	dphy_enable
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

The DSI phy can be turned on from the DSI digital interface in
the dphy_enable() function or from a dedicated DSI phy "wrapper"
in phy_ops->init() function. If the STM32MP1 case, the wrapper
is used then the dphy_enable() "warning" traces are not relevant.

This patch moves these "warning" traces to "debug" traces so
they are still available for DSI phy based on the digital
interface in debug logging mode, but not there in normal mode
for both cases.
Note: The related Linux kernel driver uses a "debug"
message too.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/dw_mipi_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/dw_mipi_dsi.c b/drivers/video/dw_mipi_dsi.c
index a5beed3514..9ae09eec12 100644
--- a/drivers/video/dw_mipi_dsi.c
+++ b/drivers/video/dw_mipi_dsi.c
@@ -721,15 +721,15 @@ static void dw_mipi_dsi_dphy_enable(struct dw_mipi_dsi *dsi)
 	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS, val,
 				 val & PHY_LOCK, PHY_STATUS_TIMEOUT_US);
 	if (ret)
-		dev_warn(dsi->dsi_host.dev,
-			 "failed to wait phy lock state\n");
+		dev_dbg(dsi->dsi_host.dev,
+			"failed to wait phy lock state\n");
 
 	ret = readl_poll_timeout(dsi->base + DSI_PHY_STATUS,
 				 val, val & PHY_STOP_STATE_CLK_LANE,
 				 PHY_STATUS_TIMEOUT_US);
 	if (ret)
-		dev_warn(dsi->dsi_host.dev,
-			 "failed to wait phy clk lane stop state\n");
+		dev_dbg(dsi->dsi_host.dev,
+			"failed to wait phy clk lane stop state\n");
 }
 
 static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
