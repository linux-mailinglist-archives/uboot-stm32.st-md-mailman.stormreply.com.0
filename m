Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A985513FC
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 11:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B657EC5EC6B;
	Mon, 20 Jun 2022 09:17:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1BC5C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 09:17:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K9Doo7018610;
 Mon, 20 Jun 2022 11:17:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=+yx60/A2AabROgpKviV3okUWAx4a6n11oSwZ5kBz+Uw=;
 b=CUoK+cW4Wzfrme85m53EouGLJK9w9ZcNou53oouFZQ+kt1hGq6sGBoE86UtipyQ9oq9G
 U6hdwzi/a7I28UKEwxq2u+wsfHmNleDXspB7wbvEjfN4MGeePTTvXK9P19qJPluZ8b35
 q8O9oJDr9btnGL+3425LlihwXyc4UJrkLNeZrKW2h7zbvoHa8eCS0O+Y6HtJ7x2u/RkJ
 HcYOisqc+Y30eeaJ+vOkwjhvcyBx8jnzZrgsK03cA19Yw79PT3sLQ6Sr6dIVPMGeoTfO
 y/PQdD1F7EsIqr8FrEWXRNg/pgODIQuXRWzhGJcHZJpUQ/wKkCgBjeQuWoYvyx7xolH+ kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtp31r0rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 11:17:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55A66100034;
 Mon, 20 Jun 2022 11:17:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5176E2171F8;
 Mon, 20 Jun 2022 11:17:27 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 11:17:27 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 11:17:08 +0200
Message-ID: <20220620111707.5.Ia333feef96fc01ae8bf7d69c63581eca42559458@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220620111707.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 05/10] ARM: dts: stm32mp13: activate led on
	STM32MP13F-DK
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

Activate the led managed in stm32mp1 board for U-Boot indication
in STM32MP13F-DK device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp135f-dk-u-boot.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
index dfe5bbb2e34..cbe4eb56083 100644
--- a/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp135f-dk-u-boot.dtsi
@@ -11,8 +11,18 @@
 	};
 
 	config {
+		u-boot,boot-led = "led-blue";
+		u-boot,error-led = "led-red";
 		u-boot,mmc-env-partition = "u-boot-env";
 	};
+
+	leds {
+		led-red {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
 };
 
 &uart4 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
