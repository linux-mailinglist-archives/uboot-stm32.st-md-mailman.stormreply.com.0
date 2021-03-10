Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3933388C
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:17:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB91C57B77;
	Wed, 10 Mar 2021 09:17:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC0D5C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:17:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9Cp1w007598; Wed, 10 Mar 2021 10:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SXddZOHjs9yaGSdoyqDzEjlEqfXm7fjzqt8M5+/Visw=;
 b=X9SiOsAAbujBcujY0dpQUnrgUBa3YHPyzS9Hygk+5U0gAvv9Tsv0jYTwCCGZQ7k4lq70
 by/a2l3JHk0u9JWtD0e7wSsAK05uF2PtdSpCfI7GKQzVRKnab0sCJCNIyZDElJqSd4Az
 N+BFRy1V5SebY9Xd5ngV15SaacZc5QVJO1khSH5EJZKRZCMHo9W7jRG1mXP8YQLZZTK3
 68EhZmSS+Jku7v9WTHV4JwyiOV4TsWoRsYQddayEWn5rMscy/iomU/9jP32+So/87gRS
 4GKaJe81ZE8g/zlc6NF62711JdJXkB479eYXBCNgB1RNuBoNh7E1StzlSKDsvGbPswCk og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374036y30g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47C72100034;
 Wed, 10 Mar 2021 10:16:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C843228D9C;
 Wed, 10 Mar 2021 10:16:39 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:38
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:25 +0100
Message-ID: <20210310101622.v2.1.Ifa5a03d3733bf4f5245de4d0e07f433c4889b955@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Reuben Dowle <reubendowle0@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Atish Patra <atish.patra@wdc.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 1/8] lmb: move CONFIG_LMB in Kconfig
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

Migrate CONFIG_LMB in Kconfig.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 arch/arc/include/asm/config.h        | 2 --
 arch/arm/include/asm/config.h        | 1 -
 arch/m68k/include/asm/config.h       | 1 -
 arch/microblaze/include/asm/config.h | 2 --
 arch/mips/include/asm/config.h       | 1 -
 arch/nds32/include/asm/config.h      | 1 -
 arch/powerpc/include/asm/config.h    | 1 -
 arch/riscv/include/asm/config.h      | 1 -
 arch/sh/include/asm/config.h         | 2 --
 arch/x86/include/asm/config.h        | 1 -
 arch/xtensa/include/asm/config.h     | 2 --
 include/configs/10m50_devboard.h     | 5 -----
 include/configs/3c120_devboard.h     | 5 -----
 include/configs/sandbox.h            | 2 --
 include/configs/x86-common.h         | 2 --
 include/image.h                      | 2 +-
 lib/Kconfig                          | 7 +++++++
 scripts/config_whitelist.txt         | 1 -
 18 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/arch/arc/include/asm/config.h b/arch/arc/include/asm/config.h
index d88c361488..46e94be141 100644
--- a/arch/arc/include/asm/config.h
+++ b/arch/arc/include/asm/config.h
@@ -8,6 +8,4 @@
 
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
-#define CONFIG_LMB
-
 #endif /*__ASM_ARC_CONFIG_H_ */
diff --git a/arch/arm/include/asm/config.h b/arch/arm/include/asm/config.h
index bf692ce279..14860d89b6 100644
--- a/arch/arm/include/asm/config.h
+++ b/arch/arm/include/asm/config.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #if defined(CONFIG_ARCH_LS1021A) || \
diff --git a/arch/m68k/include/asm/config.h b/arch/m68k/include/asm/config.h
index 7ea443673a..221eb93d58 100644
--- a/arch/m68k/include/asm/config.h
+++ b/arch/m68k/include/asm/config.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #endif
diff --git a/arch/microblaze/include/asm/config.h b/arch/microblaze/include/asm/config.h
index 3ae71b3e01..221eb93d58 100644
--- a/arch/microblaze/include/asm/config.h
+++ b/arch/microblaze/include/asm/config.h
@@ -6,8 +6,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
-
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #endif
diff --git a/arch/mips/include/asm/config.h b/arch/mips/include/asm/config.h
index 7ea443673a..221eb93d58 100644
--- a/arch/mips/include/asm/config.h
+++ b/arch/mips/include/asm/config.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #endif
diff --git a/arch/nds32/include/asm/config.h b/arch/nds32/include/asm/config.h
index 8964a58f27..6c1cbce7ef 100644
--- a/arch/nds32/include/asm/config.h
+++ b/arch/nds32/include/asm/config.h
@@ -7,6 +7,5 @@
 
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
-#define CONFIG_LMB
 
 #endif
diff --git a/arch/powerpc/include/asm/config.h b/arch/powerpc/include/asm/config.h
index c9c9964630..99b410dc9b 100644
--- a/arch/powerpc/include/asm/config.h
+++ b/arch/powerpc/include/asm/config.h
@@ -18,7 +18,6 @@
   #define HWCONFIG_BUFFER_SIZE 256
 #endif
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #ifndef CONFIG_MAX_MEM_MAPPED
diff --git a/arch/riscv/include/asm/config.h b/arch/riscv/include/asm/config.h
index 156cb94dc0..d911007537 100644
--- a/arch/riscv/include/asm/config.h
+++ b/arch/riscv/include/asm/config.h
@@ -7,7 +7,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #endif
diff --git a/arch/sh/include/asm/config.h b/arch/sh/include/asm/config.h
index e1cd322152..406156dff5 100644
--- a/arch/sh/include/asm/config.h
+++ b/arch/sh/include/asm/config.h
@@ -8,8 +8,6 @@
 
 #include <asm/processor.h>
 
-#define CONFIG_LMB
-
 /* Timer */
 #define CONFIG_SYS_TIMER_COUNTS_DOWN
 #define CONFIG_SYS_TIMER_COUNTER	(TMU_BASE + 0xc)	/* TCNT0 */
diff --git a/arch/x86/include/asm/config.h b/arch/x86/include/asm/config.h
index 7ea443673a..221eb93d58 100644
--- a/arch/x86/include/asm/config.h
+++ b/arch/x86/include/asm/config.h
@@ -6,7 +6,6 @@
 #ifndef _ASM_CONFIG_H_
 #define _ASM_CONFIG_H_
 
-#define CONFIG_LMB
 #define CONFIG_SYS_BOOT_RAMDISK_HIGH
 
 #endif
diff --git a/arch/xtensa/include/asm/config.h b/arch/xtensa/include/asm/config.h
index 5a95fc93f7..a1096ab196 100644
--- a/arch/xtensa/include/asm/config.h
+++ b/arch/xtensa/include/asm/config.h
@@ -9,8 +9,6 @@
 
 #include <asm/arch/core.h>
 
-#define CONFIG_LMB
-
 /*
  * Make boot parameters available in the MMUv2 virtual memory layout by
  * restricting used physical memory to the first 128MB.
diff --git a/include/configs/10m50_devboard.h b/include/configs/10m50_devboard.h
index 768b4a6dfc..3ffc744928 100644
--- a/include/configs/10m50_devboard.h
+++ b/include/configs/10m50_devboard.h
@@ -34,11 +34,6 @@
  */
 #define CONFIG_BOOTP_BOOTFILESIZE
 
-/*
- * FDT options
- */
-#define CONFIG_LMB
-
 /*
  * MEMORY ORGANIZATION
  * -Monitor at top of sdram.
diff --git a/include/configs/3c120_devboard.h b/include/configs/3c120_devboard.h
index 30bbd716b2..3f065ff315 100644
--- a/include/configs/3c120_devboard.h
+++ b/include/configs/3c120_devboard.h
@@ -34,11 +34,6 @@
  */
 #define CONFIG_BOOTP_BOOTFILESIZE
 
-/*
- * FDT options
- */
-#define CONFIG_LMB
-
 /*
  * MEMORY ORGANIZATION
  * -Monitor at top of sdram.
diff --git a/include/configs/sandbox.h b/include/configs/sandbox.h
index e0708fe573..6abb78611a 100644
--- a/include/configs/sandbox.h
+++ b/include/configs/sandbox.h
@@ -22,8 +22,6 @@
 #define CONFIG_SYS_TIMER_RATE		1000000
 #endif
 
-#define CONFIG_LMB
-
 #define CONFIG_HOST_MAX_DEVICES 4
 
 /*
diff --git a/include/configs/x86-common.h b/include/configs/x86-common.h
index 641ed2c5ec..f186dd6b82 100644
--- a/include/configs/x86-common.h
+++ b/include/configs/x86-common.h
@@ -16,8 +16,6 @@
  */
 #define CONFIG_PHYSMEM
 
-#define CONFIG_LMB
-
 #define CONFIG_SYS_BOOTM_LEN		(16 << 20)
 
 /* SATA AHCI storage */
diff --git a/include/image.h b/include/image.h
index 138c83dd28..a8ca76b21f 100644
--- a/include/image.h
+++ b/include/image.h
@@ -434,7 +434,7 @@ typedef struct bootm_headers {
 #define	BOOTM_STATE_OS_GO	(0x00000400)
 	int		state;
 
-#ifdef CONFIG_LMB
+#if defined(CONFIG_LMB) && !defined(USE_HOSTCC)
 	struct lmb	lmb;		/* for memory mgmt */
 #endif
 } bootm_headers_t;
diff --git a/lib/Kconfig b/lib/Kconfig
index b35a71ac36..43bd7190b9 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -699,6 +699,13 @@ config LIB_ELF
 	  Support basic elf loading/validating functions.
 	  This supports for 32 bit and 64 bit versions.
 
+config LMB
+	bool "Enable the logical memory blocks library (lmb)"
+	default y if ARC || ARM || M68K || MICROBLAZE || MIPS || NDS32 || \
+		     NIOS2 || PPC || RISCV || SANDBOX || SH || X86 || XTENSA
+	help
+	  Support the library logical memory blocks.
+
 endmenu
 
 config PHANDLE_CHECK_SEQ
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 7340e95bd4..d464f04b6b 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -954,7 +954,6 @@ CONFIG_LEGACY_BOOTCMD_ENV
 CONFIG_LINUX
 CONFIG_LINUX_RESET_VEC
 CONFIG_LITTLETON_LCD
-CONFIG_LMB
 CONFIG_LMS283GF05
 CONFIG_LOADADDR
 CONFIG_LOADCMD
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
