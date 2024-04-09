Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE989DDBC
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Apr 2024 17:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92611C71292;
	Tue,  9 Apr 2024 15:04:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52090C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:04:49 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 439BunOv019548; Tue, 9 Apr 2024 17:04:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=PpFr1XgocOWsljKBwPgQpswxzzf2NUIQper8Z5Ch90w=; b=Fk
 UmPRlLQnaHed195oW6Dh0OfSj6upP+GBxaL5DK8LsYFnxQLkLk2ucRge+/TywksS
 CMuK3q7/BT5fyBlnluDfVxOs5rkBzRPJ1KIEMX9rXj1pMnS6r3mBDCO/GoJEkhYv
 SdFF4G98uu/4LXwtGvoaikDL2hudEzILEJG5SjptpBMjjsiabotv3s08j2mITzu8
 w2pO6BNQYaJL0a1Qk3Xp266ru9KB3oawKnzX9Dkh94STgQLj0siGU6/AInlD/UOl
 Oi7LFWSRCLrtUefPn9G24HsjnFJ5LlDzNm2d1wJrFm+1yzSmfxRyjPJUARV3Xhvo
 76fVm86CgDjcbVhoHqHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xawqxuu1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Apr 2024 17:04:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5AA5840044;
 Tue,  9 Apr 2024 17:04:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA8432207BD;
 Tue,  9 Apr 2024 17:04:29 +0200 (CEST)
Received: from localhost (10.48.86.98) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Apr
 2024 17:04:29 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Apr 2024 17:02:01 +0200
Message-ID: <20240409150215.2497778-12-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_10,2024-04-09_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v1 11/25] ARM: dts: stm32: Don't probe red led
	at boot for stm32mp157a-dk1-scmi-u-boot
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

red led and button dedicated to fastboot share the same gpio GPIOA13.
Led driver is probed early so the corresponding gpio is taken and
configured in output which forbid fastboot and stm32prog button usage.

To avoid this, remove the "default-state" property from red led node.

This will avoid to trigger the led driver probe() to configure the led
default state during startup.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
index 5d49b09c35d..8760d6c7d93 100644
--- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
@@ -39,7 +39,6 @@
 		red {
 			label = "error";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
-			default-state = "off";
 			status = "okay";
 		};
 	};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
