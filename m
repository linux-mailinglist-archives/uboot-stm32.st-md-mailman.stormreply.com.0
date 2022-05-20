Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071752F085
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:25:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 140DFC03FD1;
	Fri, 20 May 2022 16:25:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F09C2C5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:25:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KEYouc025996;
 Fri, 20 May 2022 18:25:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=muoHavkQkycXUP59Tt8aMD1ku9UKLdYjQzqi7uGndNg=;
 b=pZETyexGqPB89CRxTuYfoth9+a+WhMr5kHNLjB8RnpJz41455cB3A0h+/FYo454Qm8zz
 nX4Uyv1k6OoPjOk7cpcm2cG25PtQ5rjXbrwxtpqJ2UuvVY5g0gcEP9ZTerI5DS1htb/j
 0a0nYjtcrKUxw7g0C1E6tVjPOEVdJZSAqO89zmLdhU0LYfDgeWe84SuDDL3iAV3rUHTC
 CA6f8/i5eud3lIULZHXUZRXsR/PucNnSOrhs3M26ftSGDMs3bP3P/zG0Tilf0dWqGMnp
 /WKGDr2MFBvY/aZNEBpwN0YTGgIVYggn8NoWJfe4+4Rxa7Ye5hyagzTdZMbZHpwbzb7D 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9hnax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:25:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41F4D10002A;
 Fri, 20 May 2022 18:25:27 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3BE7C260268;
 Fri, 20 May 2022 18:25:27 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:25:11 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:40 +0200
Message-ID: <20220520182444.v2.2.Iea6a315c629bbbb6cbc18889a2207a465acb9bcc@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 02/16] configs: stm32mp1: move SUPPORT_SPL
	in STM32MP15x
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

The SPL is only supported by STM32MP15x not by all the
SOC with STM32MP arch.
Only TFABOOT is supported in next products.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arm/Kconfig              | 1 -
 arch/arm/mach-stm32mp/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9898c7d68e..5f24ffc0f3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1951,7 +1951,6 @@ config ARCH_STM32MP
 	select OF_SYSTEM_SETUP
 	select PINCTRL
 	select REGMAP
-	select SUPPORT_SPL
 	select SYSCON
 	select SYSRESET
 	select SYS_THUMB_BUILD
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index e48f98ba29..be0d74b4ac 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -46,6 +46,7 @@ config STM32MP15x
 	select STM32_RCC
 	select STM32_RESET
 	select STM32_SERIAL
+	select SUPPORT_SPL
 	select SYS_ARCH_TIMER
 	imply CMD_NVEDIT_INFO
 	help
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
