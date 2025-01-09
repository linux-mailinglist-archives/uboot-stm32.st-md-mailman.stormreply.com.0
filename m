Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38208A072E0
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Jan 2025 11:23:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB074C78F67;
	Thu,  9 Jan 2025 10:23:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A5DC78011
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 10:23:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5099DCcK031652;
 Thu, 9 Jan 2025 11:23:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QIl8N2ZJtzF8keeF+5dxro/MsMsZi2DwztcQmrol9C4=; b=YdiepfY1VPVVlxA8
 exaYQvcb+rFxOxnphwXdbMfrF6RdQL8MDMd3ms6C+KOxZI7To9BBd5Z2Ohw/IoDx
 78WdDbb1lmRkddPLpxudL0ojjIxmL14q9HtCG4ItzMmgJuAUVb8JmgR897MkzL9I
 ail5ToCaSXez4OjQ0FTyFot2qCAEq8v6fyPVj9yPwRyxSdPMEuSXggU+2ZpSmWL1
 nV177tbZEJZWV8myR/T/zJcSXsuOYuJFNYq9uStDU0xZoZcrZ8IOJ1IvPwKncCXT
 fCFbJ1cqG5q0EGSEPM7UfgIJeaE3I4p7Z+xJ2JeqtSRUg7zfA2fp2ceNp1xAM8Zq
 Zh88rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4424hpa04a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 11:23:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3058D40059;
 Thu,  9 Jan 2025 11:22:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7013A22B16C;
 Thu,  9 Jan 2025 11:22:00 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 9 Jan
 2025 11:21:59 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Jan 2025 11:21:48 +0100
Message-ID: <20250109102148.1733810-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
References: <20250109102148.1733810-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32: Update ck_flexgen_08
	frequency.
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

Spurious characters are displayed on U-Boot console.
Usart2 clock is ck_flexgen_08 and its frequency is set
to an incorrect value.

Update ck_flexgen_08 frequency from 100MHz to 64MHz.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/dts/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp251.dtsi b/arch/arm/dts/stm32mp251.dtsi
index 44eb664fb51..e2d1c88a57f 100644
--- a/arch/arm/dts/stm32mp251.dtsi
+++ b/arch/arm/dts/stm32mp251.dtsi
@@ -38,7 +38,7 @@
 		ck_flexgen_08: ck-flexgen-08 {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
-			clock-frequency = <100000000>;
+			clock-frequency = <64000000>;
 		};
 
 		ck_flexgen_51: ck-flexgen-51 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
