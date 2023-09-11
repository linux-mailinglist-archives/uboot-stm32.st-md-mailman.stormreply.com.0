Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE679A9D9
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 17:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D411EC6B472;
	Mon, 11 Sep 2023 15:38:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 107D4C6B46F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:38:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38BEe2pZ015377; Mon, 11 Sep 2023 17:38:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=wC1nPaRjljoGDFHnhcegLHLdmKMnrrtgOGFQHXHLM/Y=; b=3K
 4lINVvTScZ+hJNvizyPSgFnx+NQGZe3m3AaBahhswUfV8q8cLDq7jDwRnnHQK/Zj
 mCakml6EXeCdq+PGdSshLlqUzhNrBANUFmoj/yDi176YnlZkcv24W9SbsG22maGW
 dU+cVWW3+9ffc60wgrGfvfBcRCBDuWlt65M3+u+MQ1mwp7pTSgnt8h63ipwEPiv/
 P2/xQv/2FGsMDKBBuh9vslEtKgX8P1ruid9wcW9Xt+MrPCln7vYiVUXNODHubPT7
 nWaLxzuezUVwwnECgdD406ueKZU4r2hVZi+g21MNnyv1Aa6kmfU4yoIDdTJspC2p
 Q7PuCC/qEge7ERZR/alw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0fkchkxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 17:38:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 989AE100063;
 Mon, 11 Sep 2023 17:38:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 911AE2085B6;
 Mon, 11 Sep 2023 17:38:12 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 17:38:12 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Sep 2023 17:37:18 +0200
Message-ID: <20230911153724.799535-2-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911153724.799535-1-gatien.chevallier@foss.st.com>
References: <20230911153724.799535-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_10,2023-09-05_01,2023-05-22_02
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 1/7] rng: stm32: rename STM32 RNG driver
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

Rename the RNG driver as it is usable by other STM32 platforms
than the STM32MP1x ones. Rename CONFIG_RNG_STM32MP1 to
CONFIG_RNG_STM32

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---

Changes in V2:
	- Added ARCH_STM32 in the "depends on" section of the
	  RNG_STM32 configuration field.
	- Added Grzegorz's tag and discarded Patrick's and
	  Heinrich's as there's a modification

 MAINTAINERS                                 | 2 +-
 configs/stm32mp15_basic_defconfig           | 2 +-
 configs/stm32mp15_defconfig                 | 2 +-
 configs/stm32mp15_trusted_defconfig         | 2 +-
 drivers/rng/Kconfig                         | 8 ++++----
 drivers/rng/Makefile                        | 2 +-
 drivers/rng/{stm32mp1_rng.c => stm32_rng.c} | 0
 7 files changed, 9 insertions(+), 9 deletions(-)
 rename drivers/rng/{stm32mp1_rng.c => stm32_rng.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a10a436bc..a3bffa63d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -621,7 +621,7 @@ F:	drivers/ram/stm32mp1/
 F:	drivers/remoteproc/stm32_copro.c
 F:	drivers/reset/stm32-reset.c
 F:	drivers/rng/optee_rng.c
-F:	drivers/rng/stm32mp1_rng.c
+F:	drivers/rng/stm32_rng.c
 F:	drivers/rtc/stm32_rtc.c
 F:	drivers/serial/serial_stm32.*
 F:	drivers/spi/stm32_qspi.c
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 9ea5aaa714..29b869cf34 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -150,7 +150,7 @@ CONFIG_DM_REGULATOR_STM32_VREFBUF=y
 CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_DM_RNG=y
-CONFIG_RNG_STM32MP1=y
+CONFIG_RNG_STM32=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 4d0a81f8a8..b061a83f9d 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -123,7 +123,7 @@ CONFIG_DM_REGULATOR_SCMI=y
 CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
-CONFIG_RNG_STM32MP1=y
+CONFIG_RNG_STM32=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 0a7d862485..b51eefe652 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -123,7 +123,7 @@ CONFIG_DM_REGULATOR_STPMIC1=y
 CONFIG_REMOTEPROC_STM32_COPRO=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
-CONFIG_RNG_STM32MP1=y
+CONFIG_RNG_STM32=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
diff --git a/drivers/rng/Kconfig b/drivers/rng/Kconfig
index 5deb5db5b7..24666bff98 100644
--- a/drivers/rng/Kconfig
+++ b/drivers/rng/Kconfig
@@ -48,11 +48,11 @@ config RNG_OPTEE
 	  accessible to normal world but reserved and used by the OP-TEE
 	  to avoid the weakness of a software PRNG.
 
-config RNG_STM32MP1
-	bool "Enable random number generator for STM32MP1"
-	depends on ARCH_STM32MP
+config RNG_STM32
+	bool "Enable random number generator for STM32"
+	depends on ARCH_STM32 || ARCH_STM32MP
 	help
-	  Enable STM32MP1 rng driver.
+	  Enable STM32 rng driver.
 
 config RNG_ROCKCHIP
 	bool "Enable random number generator for rockchip crypto rng"
diff --git a/drivers/rng/Makefile b/drivers/rng/Makefile
index 78f61051ac..192f911e15 100644
--- a/drivers/rng/Makefile
+++ b/drivers/rng/Makefile
@@ -9,7 +9,7 @@ obj-$(CONFIG_RNG_SANDBOX) += sandbox_rng.o
 obj-$(CONFIG_RNG_MSM) += msm_rng.o
 obj-$(CONFIG_RNG_NPCM) += npcm_rng.o
 obj-$(CONFIG_RNG_OPTEE) += optee_rng.o
-obj-$(CONFIG_RNG_STM32MP1) += stm32mp1_rng.o
+obj-$(CONFIG_RNG_STM32) += stm32_rng.o
 obj-$(CONFIG_RNG_ROCKCHIP) += rockchip_rng.o
 obj-$(CONFIG_RNG_IPROC200) += iproc_rng200.o
 obj-$(CONFIG_RNG_SMCCC_TRNG) += smccc_trng.o
diff --git a/drivers/rng/stm32mp1_rng.c b/drivers/rng/stm32_rng.c
similarity index 100%
rename from drivers/rng/stm32mp1_rng.c
rename to drivers/rng/stm32_rng.c
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
