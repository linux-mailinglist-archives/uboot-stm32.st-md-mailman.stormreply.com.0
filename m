Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0745029F
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 11:39:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FB72C5EC57;
	Mon, 15 Nov 2021 10:39:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 722CCC5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 10:39:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF7lRF5014045;
 Mon, 15 Nov 2021 11:39:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=A6XJ3lkk8x/EGEdpNMKxY1UQmjMAUqhK95M+BEGulzI=;
 b=j7bICJXskqY1ThGkZSRGpcJU47ikH8sHM6X5fKjEGfGSCBpPzw3mvU+zUQky3xhwRmPB
 8nV71SHqFl6jRLthkBuTd8b7t5yj9vD6egeCdWC/1sEi3qJaK9AuQhSxbdgWIcjwXV/9
 hwBSTkxo29oRs/LjyDi5v8J4invl5PQCuvha0SC+Q6IXx+erlRDYHm/DAc4Dubq5jn79
 6Iy5/n5CG/xZnT/U270DGIIRpgCMx2PuKTelqOC4VLrPi06OxG/cg+of0EjO6aKPX6+Y
 FG58Nw6bKjYz5rhCreHaV6Vs7zdSjuJvvXybpq0/hiiCEzYJHBDVnGuQP+zI7/0okWSx fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben334ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 11:39:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 379D1100038;
 Mon, 15 Nov 2021 11:39:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CDEC229A80;
 Mon, 15 Nov 2021 11:39:23 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 11:39:22
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 11:39:13 +0100
Message-ID: <20211115103920.30149-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115103920.30149-1-patrice.chotard@foss.st.com>
References: <20211115103920.30149-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-12_01,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 1/8] ARM: dts: stm32: Use lower-case hex for
	address for stm32mp15-u-boot.dtsi
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

Replace upper-case hex with lower-case hex for address.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index db23d80eef..e23d6c7d7e 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -50,8 +50,8 @@
 
 			compatible = "st,stm32mp1-ddr";
 
-			reg = <0x5A003000 0x550
-			       0x5A004000 0x234>;
+			reg = <0x5a003000 0x550
+			       0x5a004000 0x234>;
 
 			clocks = <&rcc AXIDCG>,
 				 <&rcc DDRC1>,
@@ -237,7 +237,7 @@
 	u-boot-stm32 {
 		filename = "u-boot.stm32";
 		mkimage {
-			args = "-T stm32image -a 0xC0100000 -e 0xC0100000";
+			args = "-T stm32image -a 0xc0100000 -e 0xc0100000";
 			u-boot {
 			};
 		};
@@ -250,7 +250,7 @@
 	spl-stm32 {
 		filename = "u-boot-spl.stm32";
 		mkimage {
-			args = "-T stm32image -a 0x2FFC2500 -e 0x2FFC2500";
+			args = "-T stm32image -a 0x2ffc2500 -e 0x2ffc2500";
 			u-boot-spl {
 			};
 		};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
