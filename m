Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B42A96C38
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 15:14:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99A01C78034;
	Tue, 22 Apr 2025 13:14:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3DBCC78F63
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 13:14:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MACb2a003021;
 Tue, 22 Apr 2025 15:13:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Uo9WI4HGAHEpsAfPjiBQIoMbTT6sfJODQZW9x6Ap9ps=; b=vCm+ZsJALVE6Gq9f
 c9EN1jgXwvW7G1U5RkngAj43mUOWFom30LNHBhpxRJPBGQcuDV78ysh+BI8BZ49Y
 YE51GJTo8zPiD7yRcBY4cF3haAnGR9wa00Vjt6QIMHGTeDDv0A6OId2Kv5PghGCj
 8fNULD2dTPXctZ607MXUaFosvFPiup1xpWJHN48PNKVc6ELqmQ5WWR43H/edVyeR
 Hsz3m1wfNJouBkoVEYqwOcGzHvFYtio7yMe8lqdm7OEG8wauvPZ/5m+QS7dAGK28
 8vo38TNulpAsz7O7NQoI8RJXcI/8WiCRuGz77RpyCKD3cnf4oZdDKnbwFGeTDPBe
 4jImRA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4642qga82c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 15:13:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7DCDE4004F;
 Tue, 22 Apr 2025 15:13:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 288E66F4702;
 Tue, 22 Apr 2025 15:12:43 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 15:12:42 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Apr 2025 15:12:26 +0200
Message-ID: <20250422131229.415020-11-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250422131229.415020-1-patrice.chotard@foss.st.com>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 10/13] ARM: dts: stm32: add ETZPC as a
	system bus for STM32MP1x boards
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
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

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
