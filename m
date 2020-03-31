Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3968E199ACB
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEAF4C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB6FCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:03 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG2oiN026763; Tue, 31 Mar 2020 18:04:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Bne+aBYixwqYdoX+Kw85phHI2AnKh/khAS2TI+OPxmk=;
 b=vnkP250qLMtsZaZWNyfdOW52Bh15ndwcPewhS4udwAWz1hli0oXvyL0kpEuqTdJx9PHL
 lSDR+0IdpAaQCpA3T+PC+PoOV/WbU1+QIO3PlavbePhTmdOjN1YwuumHwPOVGi6lNJFN
 duvXcVs7hzwPg7+OHkcwvVp8szl/usPhhGACP3pq6tkye0Q4GMCxPBX3hXDMPsoFOw8N
 RDc7Hu+TD4PLUUfZ4n1O7Q5yz1UxYnbNKKrUBR/dSUOhSfXxGNbKRM33PizU5ZcFVEvg
 3yiU5t0i4sRaMtgF7Tghp8I/Qt6NUF2dNLvDlG9EAqwSeySi+v7ZdRUt96/LcTCf7FR1 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53t5q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:04:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B29C100034;
 Tue, 31 Mar 2020 18:04:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4503A2BEC6D;
 Tue, 31 Mar 2020 18:04:55 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:04:54 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:18 +0200
Message-ID: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/16] arm: stm32mp: update dependency for
	STM32_ETZPC
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

Correct the dependency for STM32 ETZPC protection, linked to SOC
STM32MP identified by CONFIG_STM32MP15x and not linked to
CONFIG_TARGET_STM32MP1 (no more existing).

This patch fix an issue introduced by commit 846254888e2e ("stm32mp1:
split board and SOC support for STM32MP15x family").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Acked-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index e4d621dee8..96153693a7 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -119,7 +119,7 @@ config SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION_MMC2
 
 config STM32_ETZPC
 	bool "STM32 Extended TrustZone Protection"
-	depends on TARGET_STM32MP1
+	depends on STM32MP15x
 	default y
 	help
 	  Say y to enable STM32 Extended TrustZone Protection
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
