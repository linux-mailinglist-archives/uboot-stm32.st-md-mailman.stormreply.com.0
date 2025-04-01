Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F4A77BDA
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:17:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A7A3C78F90;
	Tue,  1 Apr 2025 13:17:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FFB1C78F8C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:17:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531B8cRc008240;
 Tue, 1 Apr 2025 15:16:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 w4Moeg65oMHkQfgkScRyBOlA/44ylQgwYoX2/cqDf0k=; b=GDWT22gC55YHPE31
 M8R2thixVgLwvW86yVtj134eNMeG7qg0EGTpOrAclQyZLUCjAOtzByHf6R4yRYzC
 Hfaq1QJqRKB8tS3ReemgPVGDTsEK1cH3j7Loe67g29KviBCt396i0ikLhENP0MDZ
 tFHGNaF0gk+Ym+KBIHz3Dne0aYELcawvH9o3mMqkolG3xNycW/ikatx7MjqkUQYJ
 2b4U68fjLZDQy4Kj6u7EhOlaHYIFwWsje3sYf3UFvmlritTdps3o7D+Qjmb8Hqdk
 g94nn6nR0+LZU8lENXHheG7aj8qxWw8M0i+1ko6n3xwguSNinx9xm0JFB+NH+m/i
 E2H7jQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p935whmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:16:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 804B44004D;
 Tue,  1 Apr 2025 15:15:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63B438A18B8;
 Tue,  1 Apr 2025 15:14:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:14:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:14:10 +0200
Message-ID: <20250401131413.387139-11-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401131413.387139-1-patrice.chotard@foss.st.com>
References: <20250401131413.387139-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 10/13] ARM: dts: stm32: add ETZPC as a system
	bus for STM32MP1x boards
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

From: Lionel Debieve <lionel.debieve@foss.st.com>

The STM32 System Bus is an internal bus on which devices are connected.
ETZPC is a peripheral overseeing the firewall bus that configures
and control access to the peripherals connected on it.

For more information on which peripheral is securable, please read
the STM32MP13 or STM32MP15 reference manual.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp13-u-boot.dtsi | 4 ++++
 arch/arm/dts/stm32mp15-u-boot.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp13-u-boot.dtsi b/arch/arm/dts/stm32mp13-u-boot.dtsi
index af7edc7e2b2..1fe6966781c 100644
--- a/arch/arm/dts/stm32mp13-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp13-u-boot.dtsi
@@ -48,6 +48,10 @@
 	bootph-all;
 };
 
+&etzpc {
+	bootph-all;
+};
+
 &gpioa {
 	bootph-all;
 };
diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 3f57bd5fe0f..327d7760436 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -106,6 +106,10 @@
 	operating-points-v2 = <&cpu0_opp_table>;
 };
 
+&etzpc {
+	bootph-all;
+};
+
 &gpioa {
 	bootph-all;
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
