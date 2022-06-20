Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9BB5511CB
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 09:50:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4DB2C0D2BF;
	Mon, 20 Jun 2022 07:50:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 886B0C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 07:50:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K7LYPK025696;
 Mon, 20 Jun 2022 09:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=8SfvNCCDzkj3PqbnAXVKVeQbR0qPEcu4ij0Oy+lsg4Y=;
 b=c87yB/mcW/a6VkrAZdJ4OtTrvd5w3kt4PwwSUW67PN77ROjBqVpYSv5YOSfHYwRcS4qX
 hzcu2lZb+Jo5TMrpLAY9z824+SuNd7sHkeccPr8HbX52lNe53TpgaGAiN1+Kg32hqE0y
 vzn1P5wtxvYVg5FInOpZrCshNtDt5A6ORcdwfCAMIHWb2xHlxL7rDt86vsh3nZPoeaHN
 4QvtvKvE4AGJSJ3a6dAWQpwOYj0eWSOL3CONxw2xdufVYa9ES5Mi6bCc1ScMa0D25rZQ
 UjWJYU5eMrbTyus+D4GiVBm6HuICDGO05FrDe3Y9eRGMNpDksTgWnp72fqbJU8OFO6Qs Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gs6wc0u3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 09:50:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D856D10002A;
 Mon, 20 Jun 2022 09:50:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2E522138D4;
 Mon, 20 Jun 2022 09:50:05 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 09:50:05 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 09:50:01 +0200
Message-ID: <20220620094959.1.I4d177d06061a5973e5cd25d2b61e74fdb2861a2a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: simplify the STM32MP15x package
	parsing code
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

Simplify the package parsing code for STM32MP15X as package can be
affected with get_cpu_package() result.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/stm32mp15x.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp15x.c
index a093e6163e6..660c907a6ba 100644
--- a/arch/arm/mach-stm32mp/stm32mp15x.c
+++ b/arch/arm/mach-stm32mp/stm32mp15x.c
@@ -274,7 +274,6 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
 	u32 cpu_type = get_cpu_type();
 	u32 ct = cpu_type & ~(BIT(7) | BIT(0));
 	u32 cm = ((cpu_type & BIT(7)) >> 6) | (cpu_type & BIT(0));
-	u32 cp = get_cpu_package();
 
 	/* Bits 0 and 7 are the ACDF, 00:C 01:A 10:F 11:D */
 	switch (ct) {
@@ -293,17 +292,9 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
 	}
 
 	/* Package */
-	switch (cp) {
-	case STM32MP15_PKG_AA_LBGA448:
-	case STM32MP15_PKG_AB_LBGA354:
-	case STM32MP15_PKG_AC_TFBGA361:
-	case STM32MP15_PKG_AD_TFBGA257:
-		*pkg = cp;
-		break;
-	default:
-		*pkg = 0;
-		break;
-	}
+	*pkg = get_cpu_package();
+	if (*pkg > STM32MP15_PKG_AA_LBGA448)
+		*pkg = STM32MP15_PKG_UNKNOWN;
 
 	/* Revision */
 	switch (get_cpu_rev()) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
