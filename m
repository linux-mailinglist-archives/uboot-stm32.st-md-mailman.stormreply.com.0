Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B49E87AF82
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85738C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60E59C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG4uZ012688; Tue, 30 Jul 2019 19:17:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3vKeCtn90iIIMyrbEibeKrH3GRrhbc2u8p9U3v9jetU=;
 b=lWgZkjlu1gd1y/SIRSfXvs8GWAsP0LHU0UBWHf7197v8d0Iw2YjJcakFmSXLZLw+ae6d
 Z+w/JWcxF2eFMkzXRnAm4QwNjinaAs4+jnGs37kkeqMBeHNroiZsDar45TKKYEUyPrwC
 tLhcqP0vvv+CMyPXDYZAiKneRHu1jRsQ1U9EP4tGWclhiXkgrXAm/Egb4HioLbOLtpq5
 3f4Tde7iZW8SaUxjrshIe6+kwMgTPnw2pIYDnXe+O+4wm3RR16hP0jxZKeylXWx54C7R
 npnYxuGokYaZWZRQwjIFwIK7hsKBYKcZl3lUdKDnpRs6BW+UKuipX/LH0opz5JiM1YOP hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj2j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2EFC31;
 Tue, 30 Jul 2019 17:17:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBE24CEA01;
 Tue, 30 Jul 2019 19:17:19 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:20 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:25 +0200
Message-ID: <1564507016-16570-18-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 17/48] stm32mp1: configs: select
	CONFIG_STM32_SERIAL
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

Select the serial driver mandatory for the console.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig       | 1 +
 configs/stm32mp15_basic_defconfig   | 1 -
 configs/stm32mp15_optee_defconfig   | 1 -
 configs/stm32mp15_trusted_defconfig | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 7efe464..0de9b3e 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -42,6 +42,7 @@ config TARGET_STM32MP1
 	select PINCTRL_STM32
 	select STM32_RCC
 	select STM32_RESET
+	select STM32_SERIAL
 	select SYS_ARCH_TIMER
 	imply BOOTCOUNT_LIMIT
 	imply BOOTSTAGE
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index a4c2027..1edea79 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -106,7 +106,6 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
-CONFIG_STM32_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 0565e5e..11f8359 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -92,7 +92,6 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
-CONFIG_STM32_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 844cbcd..bc76c08 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -91,7 +91,6 @@ CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
-CONFIG_STM32_SERIAL=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
