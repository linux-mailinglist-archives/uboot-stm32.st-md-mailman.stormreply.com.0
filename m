Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85225BCF43
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 16:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CC6CC640F1;
	Mon, 19 Sep 2022 14:39:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33215C640F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 14:39:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JEFdGW003560;
 Mon, 19 Sep 2022 16:39:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=MUlabHh1I54jRu8aqahQ+hR/uo/n34pz+yUkTP7tdhk=;
 b=YbIgwtQ/Hwg2tullQZsECNNO/qHWQAvNYPjN1Mym3SwUFLXAXNqVlCNbgRzTBsiM9ZBZ
 LhE3wdh5w+MKUfV5cXkzw7GANAmyRlAM2cyM3ShVI0uN8YXG2JIYY3IIUPEs1Hztk5Uz
 XNh81i06g/dMbgRU53rPu1LUAc5gvWwxkTJsqgT6ADuJCqm8x4JsHwDQDP+pGnbkO3/q
 Bgw/ET2Ym0CPOoPfLhFIkqugDkSQFqp76WuwvwMj/ESVRUYEjkH227JJAwGfP/UVxZ8O
 2j2bvDHWTaSdrnF5GJhGRxstknWJBnm4fvifiHLzFZBZFN3U+7Mq1OeGbIwIyC97MlGN yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6a0mnb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 16:39:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12D02100034;
 Mon, 19 Sep 2022 16:39:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EF59236936;
 Mon, 19 Sep 2022 16:39:39 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:39:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Sep 2022 16:38:30 +0200
Message-ID: <20220919143830.1165894-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
References: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 6/6] config: stm32f769-disco: Fix internal
	flash size
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

arch-stm32f7/stm32.h file is shared between STM32F746 and STM32F769
MCUs. But STM32F769 embeds 2MB of internal flash instead of 1MB for
STM32F746. The flash layout is quite similar between the 2 SoCs :

	STM32F746 			STM32F769
4 *  32KB sectors 			4 *  32KB sectors
1 * 128KB sector 			1 * 128KB sector
3 * 256KB sectors			7 * 256KB sectors

Update sect_sz_kb[] structure and SYS_MAX_FLASH_SECT accordingly.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 arch/arm/include/asm/arch-stm32f7/stm32.h | 6 +++---
 configs/stm32f769-disco_defconfig         | 2 +-
 configs/stm32f769-disco_spl_defconfig     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/arch-stm32f7/stm32.h b/arch/arm/include/asm/arch-stm32f7/stm32.h
index 3451e74a3d..57db839e8d 100644
--- a/arch/arm/include/asm/arch-stm32f7/stm32.h
+++ b/arch/arm/include/asm/arch-stm32f7/stm32.h
@@ -10,9 +10,9 @@
 #include <asm/arch-stm32/stm32f.h>
 
 static const u32 sect_sz_kb[CONFIG_SYS_MAX_FLASH_SECT] = {
-	[0 ... 3] =	32 * 1024,
-	[4] =		128 * 1024,
-	[5 ... 7] =	256 * 1024
+	[0 ... 3] =				32 * 1024,
+	[4] =					128 * 1024,
+	[5 ... CONFIG_SYS_MAX_FLASH_SECT - 1] =	256 * 1024
 };
 
 #endif /* _ASM_ARCH_HARDWARE_H */
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 423af7446a..5b5307ca1d 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -41,7 +41,7 @@ CONFIG_MTD=y
 CONFIG_DM_MTD=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_STM32_FLASH=y
-CONFIG_SYS_MAX_FLASH_SECT=8
+CONFIG_SYS_MAX_FLASH_SECT=12
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_STMICRO=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 22fca53821..054eb4c920 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -63,7 +63,7 @@ CONFIG_MTD=y
 CONFIG_DM_MTD=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_STM32_FLASH=y
-CONFIG_SYS_MAX_FLASH_SECT=8
+CONFIG_SYS_MAX_FLASH_SECT=12
 CONFIG_DM_SPI_FLASH=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_STMICRO=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
