Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B21D3085
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 15:00:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00016C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 13:00:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13BD1C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 13:00:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04ECwL7s029070; Thu, 14 May 2020 15:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hPn/E9v01HpeWmPqb2upeJbISQUPMffjlYeo6T/uTYo=;
 b=QDtq618YN600chXM37FTMmxEUukmKCyFgp+paV1yavbnaRbypYe3NLj/2gVZgsfnr5gK
 s2vtw3+0J6vhHOc2vQLYHkTLDn5+ekE5Dqsk35st2/ReoVbYk330uhafajHhH81BLakC
 x1ZXE7IV1KHMIz2DctqOkSpi+RUQq1HgK/K/5/gShsJ6eH0bre3r9dbKX89pRgj1wyep
 XQ/3dhzPjnD63kqA0XiDFHZ4FwqYMxHNyAZKu2Vs5OxkQehvKL6M9d/5Gn2Q6W90tfl+
 m31CDq7klii7zLXmBO1XewPymLeCzIZLENkl6Fb5DmuNUv8ySxjSyq3A0Jt2lWy2z10n 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vnb7qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 15:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9E61D100034;
 Thu, 14 May 2020 15:00:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91EED2BAE67;
 Thu, 14 May 2020 15:00:29 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 May 2020 15:00:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 14 May 2020 15:00:23 +0200
Message-ID: <20200514130023.15030-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_03:2020-05-14,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe ROULLIER <christophe.roullier@st.com>
Subject: [Uboot-stm32] [RESEND PATCH] net: dwc_eth_qos: update the
	compatible supported for STM32
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

Update the compatible associated with the STM32 MPU glue
in the DWC ethernet driver.

The supported compatible is the specific "st,stm32mp1-dwmac"
as indicated in Linux binding
Documentation/devicetree/bindings/net/stm32-dwmac.txt
and not the "snps,dwmac-4.20a" only used to the select IP
version.

This glue is implemented in Linux kernel in:
drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c

For information in stm32mp151.dtsi, the 2 compatibles are
supported:

ethernet0: ethernet@5800a000 {
	compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
	...
};

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
RESEND with fix patman on Series-cc

 drivers/net/dwc_eth_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index f67c5f4570..5e7ad6c658 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -2166,7 +2166,7 @@ static const struct udevice_id eqos_ids[] = {
 		.data = (ulong)&eqos_tegra186_config
 	},
 	{
-		.compatible = "snps,dwmac-4.20a",
+		.compatible = "st,stm32mp1-dwmac",
 		.data = (ulong)&eqos_stm32_config
 	},
 	{
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
