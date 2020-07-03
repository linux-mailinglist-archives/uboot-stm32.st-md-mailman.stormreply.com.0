Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F43213CB4
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 17:37:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90F97C36B27
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 15:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41C3DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 15:37:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 063FZd1p017148; Fri, 3 Jul 2020 17:37:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0yiwjy2iBqQaZyObcGaxND/wd2pRuBbUwDIYk5pFWrI=;
 b=U2SVJVLYJohnBXHeEiwLdKaNrEVWYv0SUSa5hcivPAzVFH4HOCeHBGp8FBr3xPWjOAN8
 3gfIQC+teuKdWIACXO2IuNH1HQWkYdJWQZlySLfZ7V8Qi8AR3SZ0IExApDVtQpCIpN4x
 /cyXW6h9OZ3OrHjdKl3nSPFWbZpmpyWF3jloL1H+BFh/ezV3yCEB1Nx2XD2VLWTT9GFO
 4oAby7Q6B5LwDMR7cx/1ML8r+HM3M8XaSk+gcYLgqrswwJ4CcK81HRsg61/YUdKYuCjM
 Ih4ylXIg5RYdD9saU4Yaw4e7W+NL2LwMjvl/GPWxevdOmLhDaDAzhBmGOo6O3mXObfN8 IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu8a7ybc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 17:37:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95F9D10002A;
 Fri,  3 Jul 2020 17:37:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B5062AA270;
 Fri,  3 Jul 2020 17:37:04 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Jul 2020 17:37:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Jul 2020 17:36:46 +0200
Message-ID: <20200703153646.28533-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703153646.28533-1-patrick.delaunay@st.com>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_10:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot-amlogic@groups.io,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 7/7] arm: meson: change trace level for phy
	errors managed by uclass
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

As the error message is now displayed by generic phy functions,
the pr_err can be change to pr_debug.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- add update for mach-meson board-gx: new generic_phy API usage

 arch/arm/mach-meson/board-gx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
index c4cc11f1de..b4fde46fcb 100644
--- a/arch/arm/mach-meson/board-gx.c
+++ b/arch/arm/mach-meson/board-gx.c
@@ -196,8 +196,8 @@ int board_usb_init(int index, enum usb_init_type init)
 	for (i = 0; i < 2; i++) {
 		ret = generic_phy_init(&usb_phys[i]);
 		if (ret) {
-			pr_err("Can't init USB PHY%d for %s\n",
-			       i, ofnode_get_name(dwc2_node));
+			pr_debug("Can't init USB PHY%d for %s\n",
+				 i, ofnode_get_name(dwc2_node));
 			return ret;
 		}
 	}
@@ -205,8 +205,8 @@ int board_usb_init(int index, enum usb_init_type init)
 	for (i = 0; i < 2; i++) {
 		ret = generic_phy_power_on(&usb_phys[i]);
 		if (ret) {
-			pr_err("Can't power USB PHY%d for %s\n",
-			       i, ofnode_get_name(dwc2_node));
+			pr_debug("Can't power USB PHY%d for %s\n",
+				 i, ofnode_get_name(dwc2_node));
 			return ret;
 		}
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
