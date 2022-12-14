Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A3864CD03
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Dec 2022 16:25:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EEE7C65047;
	Wed, 14 Dec 2022 15:25:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE5BC6411C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 15:25:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEFH1iT021273; Wed, 14 Dec 2022 16:25:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=dSR9rf2vqnZ8PM9WapC/dIGsB2cStA2i89H9YLaj+wU=;
 b=VpYOxo7CMbKmNuy3h+ZHNgJhvrDUDeurk4ajRimvwnPU/qFrFAT6N1LhR89WE9RiXAN6
 SnXj/tthoxWPQxbcoI6WaheyVMItOoEH/drUn2czUjuwdskRZ/OFPcIpkZNJwoJ3rRi4
 3AiGqNJznpddgbXbJ+UbUnEGnHw0z8WLyA+/9t2gKYBL6oJ68rSOjRamEwNDKpwd9z0y
 KS66IJOcJMi+oqRYOcFOVknP1pobMUxglVax9X7aMfY4ti16/n8RwLfAowGqxbB/7L4b
 pQFIggfyYwzTIm00uFWdWjL49vdsXymW4AWt7y6AHVZTcH0ZEv30z0EFYIAaq5PfkG0v Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6uwmkp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 16:25:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D3E6100045;
 Wed, 14 Dec 2022 16:25:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F37822D179;
 Wed, 14 Dec 2022 16:25:03 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 14 Dec
 2022 16:25:03 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Dec 2022 16:24:59 +0100
Message-ID: <20221214162434.1.Ib96329f23b27691d7a9c091a6a88be2658143ddc@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32mp15: remove clksrc
	include in SCMI dtsi file
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

The include file stm32mp1-clksrc.h is not necessary for the SCMI STM32MP15
dtsi files as the clock tree is not defined in the U-Boot SCMI device tree;
these SCMI device tree only support TFABOOT with stm32mp15_defconfig,
SPL with the basic boot defconfig is not supported.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 1 -
 arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
index 1209dfe009c9..92fdf0987200 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
@@ -3,7 +3,6 @@
  * Copyright : STMicroelectronics 2022
  */
 
-#include <dt-bindings/clock/stm32mp1-clksrc.h>
 #include "stm32mp15-scmi-u-boot.dtsi"
 
 / {
diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
index c265745ff107..63948ef4930e 100644
--- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
@@ -3,7 +3,6 @@
  * Copyright : STMicroelectronics 2022
  */
 
-#include <dt-bindings/clock/stm32mp1-clksrc.h>
 #include "stm32mp15-scmi-u-boot.dtsi"
 
 / {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
