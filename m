Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEAC5EABD4
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:59:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BA6AC5F1ED;
	Mon, 26 Sep 2022 15:59:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F31F7C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:59:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFSYYD032222;
 Mon, 26 Sep 2022 17:59:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=a7jN2nYEUjJpNRu1BYMpcTQto4S9uoAlg9sfQ7sE8cQ=;
 b=WNn/EzAg9pXRDS8ufN3xr9pFxC00e27bTZj6aCbBerWURm52nOXIHeBW4NQOP0abEr7d
 MrR9qR12GK9CfUUgQblxnwn4uMKXvm/SPTBx6T0ffIgOKtfJG4O4UeFN1Yk2IkPWN/SB
 Cd3/4RV1XWsQiA2UsXTLtrD/nt5Sqjpo3/xd80e5qXovLnulFemZ3deowTiWewhp+d62
 Rbrrtbfg/M4xUXfnKIj18Y2vh3qg7x15758eGv32j3XvpQnwH13zk+A1tqnwUTDfqoNK
 mw4YZTZOEMhMDfMVokm4dXzwebChkk3WGk5SveaKpWjqyqO7YsvWke56CKtDOLWMwULc oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1avvtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:59:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CD47100034;
 Mon, 26 Sep 2022 17:59:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4181623BE02;
 Mon, 26 Sep 2022 17:59:40 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:59:39 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Sep 2022 17:59:36 +0200
Message-ID: <20220926155936.550320-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] configs: increase SYS_MALLOC_F_LEN for STM32
	MCU's board
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

Some STM32 MCU's board need their SYS_MALLOC_F_LEN value enlarged
to avoid the "alloc space exhausted" error message during their boot
process.
Use the default SYS_MALLOC_F_LEN value which is set to 0x2000 in
Kconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32746g-eval_defconfig       | 1 -
 configs/stm32746g-eval_spl_defconfig   | 1 -
 configs/stm32f429-discovery_defconfig  | 1 -
 configs/stm32f429-evaluation_defconfig | 1 -
 configs/stm32f469-discovery_defconfig  | 1 -
 configs/stm32f746-disco_defconfig      | 1 -
 configs/stm32f746-disco_spl_defconfig  | 1 -
 configs/stm32f769-disco_defconfig      | 1 -
 configs/stm32f769-disco_spl_defconfig  | 1 -
 configs/stm32h743-disco_defconfig      | 1 -
 configs/stm32h743-eval_defconfig       | 1 -
 configs/stm32h750-art-pi_defconfig     | 1 -
 12 files changed, 12 deletions(-)

diff --git a/configs/stm32746g-eval_defconfig b/configs/stm32746g-eval_defconfig
index 58232a7114..7200446d28 100644
--- a/configs/stm32746g-eval_defconfig
+++ b/configs/stm32746g-eval_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32746g-eval"
diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
index 28f522b15e..ff42952a76 100644
--- a/configs/stm32746g-eval_spl_defconfig
+++ b/configs/stm32746g-eval_spl_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08009000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_SPL_GPIO=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index e6e595d495..914ac14641 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x0200000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_ENV_SECT_SIZE=0x20000
diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
index 073f27168a..af7a8bf076 100644
--- a/configs/stm32f429-evaluation_defconfig
+++ b/configs/stm32f429-evaluation_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32429i-eval"
diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index bd3693275e..90680fdb05 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32f469-disco"
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index ed537b0578..a8edf11b40 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
index d4a65bde24..0e358e86ff 100644
--- a/configs/stm32f746-disco_spl_defconfig
+++ b/configs/stm32f746-disco_spl_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08009000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_SPL_GPIO=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 5b5307ca1d..3e7b5bd06e 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index b5d54b48ec..f0a1b667b8 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08009000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_SPL_GPIO=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
index d33da43065..8c62c70a57 100644
--- a/configs/stm32h743-disco_defconfig
+++ b/configs/stm32h743-disco_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-disco"
diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
index a72de48690..1ff6b50819 100644
--- a/configs/stm32h743-eval_defconfig
+++ b/configs/stm32h743-eval_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-eval"
diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
index b8296a98b4..a5fce5e866 100644
--- a/configs/stm32h750-art-pi_defconfig
+++ b/configs/stm32h750-art-pi_defconfig
@@ -2,7 +2,6 @@ CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
 CONFIG_SYS_TEXT_BASE=0x90000000
 CONFIG_SYS_MALLOC_LEN=0x100000
-CONFIG_SYS_MALLOC_F_LEN=0xF00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SIZE=0x2000
 CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
