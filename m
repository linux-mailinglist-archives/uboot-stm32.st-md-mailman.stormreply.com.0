Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A28241E6
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jan 2024 13:38:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85905C6B452;
	Thu,  4 Jan 2024 12:38:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFB03C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 12:37:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 404BpB0K009352; Thu, 4 Jan 2024 13:37:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=Id2Zkt8
 Q5FpG5aqVtmkPGE9sivf537oYJZipinRD4vM=; b=jEOFZC5abkACrDfnTRU8ZyL
 q+sQAJF0Rhjn1vGQvN2fFa1Xu9P0kSC2Jsois5ByStv0HKqsVLJ58Vh7NW855IG/
 rSOdLSNojZDCPxBKtgLjDY1AdYmxPy/ikvyt2BDk2M2wAyN6c5tGMHZqNKmYkuHK
 nz5WKa9xlTeDFHR/jv1mdEWnOPeDhYL3cFL0F925moJpQhfA/OxFIqZgss+CYtlO
 jNIwFYqiyG2r376eS2SGlIZtQPVyy0BxrJsG5gm/HR811xRvitN3tKfU6M7CcfOU
 82nhTO91Bq/3ua4yHkF1BXV4VuXqwh1WSA12A0XvkUN4cNasIEDV8BC9xdtmOaA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vd9q1m17f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 13:37:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5806110002A;
 Thu,  4 Jan 2024 13:37:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B911B2291C7;
 Thu,  4 Jan 2024 13:37:53 +0100 (CET)
Received: from localhost (10.201.20.205) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 13:37:53 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jan 2024 13:37:50 +0100
Message-ID: <20240104123750.232991-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: Fix reset for usart1 in scmi
	configuration
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

In SCMI configuration, usart1 is secure, so all its resources are secured
(clock and reset) and can't be set/unset by non-secure world but by OP-TEE.

Fixes: 6cccc8d396bf ("ARM: dts: stm32: add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
index 7c8fec6cbfb..79494ecad90 100644
--- a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
@@ -135,7 +135,7 @@
 };
 
 &usart1 {
-	resets = <&rcc USART1_R>;
+	resets = <&scmi_reset RST_SCMI_USART1>;
 };
 
 &usart2 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
