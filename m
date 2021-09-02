Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C23FEBCE
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 12:02:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B1C6C597AC;
	Thu,  2 Sep 2021 10:02:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3D18C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 10:02:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1828wQqO032494;
 Thu, 2 Sep 2021 12:02:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JzKf5f6A6zdglz5UCtc81eiIqwDoJacJW/bCFblk4pE=;
 b=AYuCz4DfJUO+FTqlggRVV61ziXzJ9swc/qa1T72Ns1SNpNtBgW4Rldkm5VyevkBbul5N
 6UgNIIsEE2WBrES2P3gsKkAh45YPpwpnmSIcMl9hSwnRGqzZhLtVU+2Mhe1KNSIr7HZG
 w3RwfWeuxqqzllhsyqpf4ITWssH4mBiW/NiZ9lRHSzsqljIyS3N6zXI3SnezFxTVqtHQ
 iiMWni8wHKvJoLFLiZpVdFAJCPyPU/QHV6mB1jgH8uISSNaJZTgfFb6fOSClwWwoQyeF
 g1zCvIMCq6if2wnilA2otmZMfPJXiot72rJIcKomPwZpXdNoc3SNDFNi2PDSw7DI2hIt Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atujr0etp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 12:02:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15E02100038;
 Thu,  2 Sep 2021 12:02:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 071642309ED;
 Thu,  2 Sep 2021 12:02:09 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021 12:02:08
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Sep 2021 12:02:06 +0200
Message-ID: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_03,2021-09-01_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/2] arm: stm32: Disable ATAGs support
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

These platforms never had to support an ATAGs-based Linux Kernel, so
remove the options.

Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

this patch is a rebased version of the STM32 part [1] of Tom's patchset [2].

I also update the new file include/configs/stm32h750-art-pi.h

[1] [13/13] arm: stm32: Disable ATAGs support
https://patchwork.ozlabs.org/project/uboot/patch/20210204022415.20589-13-trini@konsulko.com/

[2] arm: nanopi2: Remove unused code
    https://patchwork.ozlabs.org/project/uboot/list/?series=227910&state=*

Patrick


 include/configs/stm32f429-discovery.h  | 5 -----
 include/configs/stm32f429-evaluation.h | 5 -----
 include/configs/stm32f469-discovery.h  | 5 -----
 include/configs/stm32f746-disco.h      | 5 -----
 include/configs/stm32h743-disco.h      | 5 -----
 include/configs/stm32h743-eval.h       | 5 -----
 include/configs/stm32h750-art-pi.h     | 5 -----
 include/configs/stm32mp1.h             | 5 -----
 8 files changed, 40 deletions(-)

diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
index 9d029fbcc6..dbbce49475 100644
--- a/include/configs/stm32f429-discovery.h
+++ b/include/configs/stm32f429-discovery.h
@@ -27,11 +27,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_CBSIZE		1024
 
 #define CONFIG_SYS_MALLOC_LEN		(2 << 20)
diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index fefdb2dd15..29a41e8067 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -29,11 +29,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_CBSIZE		1024
 
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index ba9f05a61b..b9b932c651 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -29,11 +29,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_CBSIZE		1024
 
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 08d050adfa..b72b989c2c 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -36,11 +36,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_CBSIZE		1024
 
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
index 6e10dbdfe9..e5bb08eec7 100644
--- a/include/configs/stm32h743-disco.h
+++ b/include/configs/stm32h743-disco.h
@@ -24,11 +24,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_MAXARGS		16
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
 
diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
index 268d39c7ad..89169f85d5 100644
--- a/include/configs/stm32h743-eval.h
+++ b/include/configs/stm32h743-eval.h
@@ -24,11 +24,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_MAXARGS		16
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
 
diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
index 3fd5461167..a9006e224a 100644
--- a/include/configs/stm32h750-art-pi.h
+++ b/include/configs/stm32h750-art-pi.h
@@ -24,11 +24,6 @@
 
 #define CONFIG_SYS_HZ_CLOCK		1000000
 
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-#define CONFIG_REVISION_TAG
-
 #define CONFIG_SYS_MAXARGS		16
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
 
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index b372838be8..fb4e4fb0bc 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -33,11 +33,6 @@
 #define CONFIG_LOADADDR			0xc2000000
 #define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
 
-/* ATAGs */
-#define CONFIG_CMDLINE_TAG
-#define CONFIG_SETUP_MEMORY_TAGS
-#define CONFIG_INITRD_TAG
-
 /*
  * For booting Linux, use the first 256 MB of memory, since this is
  * the maximum mapped by the Linux kernel during initialization.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
