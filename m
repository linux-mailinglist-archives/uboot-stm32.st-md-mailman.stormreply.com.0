Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFA5F9B77
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Oct 2022 10:56:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F30FC6410D;
	Mon, 10 Oct 2022 08:56:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6D01C03FE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 08:56:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A6AC73017907;
 Mon, 10 Oct 2022 10:56:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=v66Zhlx+p9SBOC4K+Z2TXsFG+3X3WbwZu23mRvspyv8=;
 b=Kyndsr+D0fvQh09XNxVlQCHC/LLhgOABklXIU5NjpePc1nCAT1Us8zhfw/vyb7fdNz8H
 n4wmNAFvt8JZdt6XfRK/PNPJVZGnvaMFlvOGmwypsPnbRXfXJNNptrX45kC280PvtkS6
 6rjDJGnjDRbBvF/eGagv7tJnMyAzsecozo8TBSuxlk3cy1/NFWLHl6X6eaJaSEaHYyCE
 fylyc42JQyUllOy4h3wLF2uCZuDdAwxBPFKYksrMUJmhEC6ezkYvgT4L3zCK9VZBBCqj
 S8RF1/fViW7HyDW7fxN2zceugIyz4B2toCAUlgZ0g6Gt9og6TUOPV7OB8os5sfdIS4bV 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31gpjk1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Oct 2022 10:56:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07AE410003A;
 Mon, 10 Oct 2022 10:56:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB0702171E0;
 Mon, 10 Oct 2022 10:56:16 +0200 (CEST)
Received: from localhost (10.75.127.121) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 10:56:16 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Oct 2022 10:56:14 +0200
Message-ID: <20221010105612.1.Iba72bf97918ac926814c68f50c2246f4744f2ab9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: update SCMI dedicated file
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

The PWR regulators don't need be removed as they are already deactivated.
This patches is a alignment with the accepted patch in Linux device tree
in commit a34b42f8690c ("ARM: dts: stm32: fix pwr regulators references
to use scmi").

Fixes: 69ef98b209e7 ("ARM: dts: stm32mp15: alignment with v5.19")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-scmi.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-scmi.dtsi b/arch/arm/dts/stm32mp15-scmi.dtsi
index 37d4547b3e8..543f24c2f4f 100644
--- a/arch/arm/dts/stm32mp15-scmi.dtsi
+++ b/arch/arm/dts/stm32mp15-scmi.dtsi
@@ -103,7 +103,3 @@
 /delete-node/ &clk_lse;
 /delete-node/ &clk_lsi;
 /delete-node/ &clk_csi;
-/delete-node/ &reg11;
-/delete-node/ &reg18;
-/delete-node/ &usb33;
-/delete-node/ &pwr_regulators;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
