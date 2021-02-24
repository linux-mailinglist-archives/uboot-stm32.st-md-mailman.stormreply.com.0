Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51097323A5F
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:20:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1257BC57B55;
	Wed, 24 Feb 2021 10:20:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50799C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:20:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAINKT032158; Wed, 24 Feb 2021 11:20:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=muf15Ne1hG2OBVuSuYMx0qTzqJ9GKAO/XdEmKkUL8Fw=;
 b=jA3ud1qBZp5+UOPLkFY2vPggzSkoi6DEBjReHHboDsAZdbcoBfe17iSENpewtYaX6FE0
 V7Ihw1HSlm1jEJVjxv4l/cblnDDwNMqT1OCTOt2UKnnj+NVz/uPqW1n3R96CLmY+Y8I6
 RQ0DHngjcPMRn6dM1YLm+ak18T46h2zMwBCDsfftwfQps+EDNzsf9QS/CVTN8YVERgqy
 uxhMLGwltF9sXn04fQragAR1M8em/++nnlB2NRO3VsVmiKysX6xPAKVz3lLRT8bZvAYt
 Us+tZAp6qvCQHE52bVf8vgrrT2PErQ46i5zXE5qodD9U0FkheoX/N6jT9Ign6ZYpJV6s hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vd78v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:20:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AE2E10002A;
 Wed, 24 Feb 2021 11:20:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CB51225296;
 Wed, 24 Feb 2021 11:20:11 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:20:10
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:19:41 +0100
Message-ID: <20210224111907.1.I9565e66593bf785bf3616f10c76b168a87acaf77@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Etienne Carriere <etienne.carriere@st.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/6] ARM: dts: stm32mp1: explicit clock
	reference needed by RCC clock driver
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

From: Etienne Carriere <etienne.carriere@st.com>

Define in the RCC clock provider node which root clocks the driver
depends on. These are root oscillators, which may be present or
not, upon FDT content.

This update binding is introduced in Linux kernel device tree by patch
"ARM: dts: stm32: move clocks/resets to SCMI resources for stm32mp15"

This patch is a preliminary step for SCMI support of stm32mp15
boards with trusted boot chain, based on TF-A or OP-TEE.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Reference:

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210126090120.19900-13-gabriel.fernandez@foss.st.com/


 arch/arm/dts/stm32mp151.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32mp151.dtsi b/arch/arm/dts/stm32mp151.dtsi
index eedea6f4b8..b564fc6269 100644
--- a/arch/arm/dts/stm32mp151.dtsi
+++ b/arch/arm/dts/stm32mp151.dtsi
@@ -1136,6 +1136,10 @@
 			reg = <0x50000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+
+			clock-names = "hse", "hsi", "csi", "lse", "lsi";
+			clocks = <&clk_hse>, <&clk_hsi>, <&clk_csi>,
+				 <&clk_lse>, <&clk_lsi>;
 		};
 
 		pwr_regulators: pwr@50001000 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
