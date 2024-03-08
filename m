Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E534C87659F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 14:50:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5292C6DD72;
	Fri,  8 Mar 2024 13:50:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA64BC6DD6E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 13:50:36 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428AIeZu012206; Fri, 8 Mar 2024 14:50:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=WK6kR5i
 7P7H0IVqickEnR8SemgzoRQIbA+X7DsLMY8w=; b=zZ/lkXdSRbDyQvyhE2yFOkd
 nJzRTkJ8tLOQmf5I54TZIBKUuMEt1iUqhMOlJpEFb3YSGCmDDmsHHaQQC5ss4QhM
 UMwQdGStOf6A1us7TixpJI4WnSdDw+uEYQyVk38yIcUdUh6uFj1vo8ZMjUYURolU
 hy0trIp4IifauFB/+Nnf7yeD5gxRZX7uDcRw+m6kVbBSoIW4O7f9gKYidtjhTUuO
 qWNlqXhi9gR+SnJOnWoLYXXUYTm49M5nPPCdTtQ4pczGf4V6iUa+zBVlRHT7A4+x
 7LJkuahLQaa3c7VUJq6U+ULPJgPyxQpv5zZikQ2VXVkMp5rOfhEIWq04EZUDfOA=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wmej5k75v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 14:50:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1081640044;
 Fri,  8 Mar 2024 14:50:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 91EA0278F44;
 Fri,  8 Mar 2024 14:50:13 +0100 (CET)
Received: from localhost (10.252.7.115) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 14:50:13 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Mar 2024 14:50:07 +0100
Message-ID: <20240308135009.2621719-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] ARM: dts: stm32: Fix partition node name
	for stm32mp157c-ev1-u-boot
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

Fix flash@0 and nand@0 partition node name with correct offset.

Fixes: e91d3c61767b ("arm: dts: stm32: Add partitions in flash0 and nand
node for stm32mp15xx-ev1")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index 139940bd5d4..3515347e91d 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -33,11 +33,11 @@
 			label = "fsbl1";
 			reg = <0x00000000 0x00040000>;
 		};
-		partition@80000 {
+		partition@40000 {
 			label = "fsbl2";
 			reg = <0x00040000 0x00040000>;
 		};
-		partition@100000 {
+		partition@80000 {
 			label = "ssbl";
 			reg = <0x00080000 0x00200000>;
 		};
@@ -58,7 +58,7 @@
 			label = "fsbl2";
 			reg = <0x00040000 0x00040000>;
 		};
-		partition@100000 {
+		partition@80000 {
 			label = "fip";
 			reg = <0x00080000 0x00400000>;
 		};
@@ -112,7 +112,7 @@
 					label = "fip2";
 					reg = <0x00600000 0x00400000>;
 				};
-				partition@1200000 {
+				partition@a00000 {
 					label = "UBI";
 					reg = <0x00a00000 0x3f600000>;
 				};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
