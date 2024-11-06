Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0D9BF604
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2024 20:05:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D144AC6C855;
	Wed,  6 Nov 2024 19:05:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48695C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 19:05:32 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5FE3D88E26;
 Wed,  6 Nov 2024 20:05:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730919931;
 bh=R4j0hGWTcRY/XzCSUrQNEPUCXXi8ckhyCaHhaGwejvE=;
 h=From:To:Cc:Subject:Date:From;
 b=OrSY5IS+4HWtNpWgauKzQEhrd+vdDSwjTaL+9SAbf4ssT8ul9zg+fWWVO/XR0y3Gk
 h54OFtgiJMJo4P4Bw6+6GMLy3iSJskVO1yYedFT0OPeYGqOI99fErIxBTVNxw9o5Ok
 +AQdYsafHA5Je+s/DlV8vf0m6VV9ElyH7Qr0MxJ978eY0DFNMysz+PCUoWwGPByJMj
 L4JmH4USqLA6VuuTkQj1HMteaAONQedWLyeS9JiKl8w1UCEVzbXGsyczlPU3We3Yk5
 Ujl0PoEu0ndShPc/62pDSz3h2iA3/BGsGrcESrVFHBl9vWEatAdC+AomCldmHf3V3R
 MnOs+AT5sdjyg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Wed,  6 Nov 2024 20:04:14 +0100
Message-ID: <20241106190516.224197-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Add optional manufacturing
	environment to DH STM32MP15xx DHSOM
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

Add manufacturing environment into STM32MP15xx DH electronics DHSOM
configuration. This environment is part of every board build, but only
takes effect on systems booted with the dh,stm32mp15xx-dhcor-testbench
device tree, i.e. systems populated with factory build of U-Boot.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhsom.config       |  1 +
 include/configs/stm32mp15_dh_dhsom.h | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp15_dhsom.config b/configs/stm32mp15_dhsom.config
index 4f8e98beec6..efc149577ea 100644
--- a/configs/stm32mp15_dhsom.config
+++ b/configs/stm32mp15_dhsom.config
@@ -64,6 +64,7 @@ CONFIG_SYSRESET_SYSCON=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x5C00A14C
 CONFIG_SYS_MALLOC_F_LEN=0x3000
 CONFIG_SYS_PBSIZE=1050
+CONFIG_PREBOOT="run dh_preboot"
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
 CONFIG_TARGET_DH_STM32MP1_PDK2=y
 CONFIG_USE_SERVERIP=y
diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index 2797fc61d17..c004a8cec82 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -18,6 +18,8 @@
 #endif
 
 #define STM32MP_BOARD_EXTRA_ENV						\
+	"dh_preboot="							\
+		"run dh_testbench_backward_compat\0"			\
 	"dh_update_sd_to_emmc=" /* Install U-Boot from SD to eMMC */	\
 		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
 		"load mmc 0:4 ${loadaddr1} boot/u-boot-spl.stm32 && "	\
@@ -61,7 +63,20 @@
 	"stdout=serial\0"						\
 	"stderr=serial\0"						\
 	"update_sf=run dh_update_sd_to_sf\0"				\
-	"usb_pgood_delay=1000\0"
+	"usb_pgood_delay=1000\0"					\
+	/* Old testbench-only backward compatibility environment */	\
+	"dh_testbench_backward_compat="					\
+		"test ${board_name} = \"dh,stm32mp15xx-dhcor-testbench\" && " \
+		"run load_bootenv importbootenv\0"			\
+	"importbootenv="						\
+		"echo Importing environment from DHupdate.ini...;"	\
+		"env import -t ${loadaddr} ${filesize}\0"		\
+	"load_bootenv="							\
+		"usb reset && "						\
+		"load usb ${usbdev}:${usbpart} ${loadaddr} DHupdate.ini && " \
+		"echo \"--> Update: found DHupdate.ini (${filesize} bytes)\"\0" \
+	"usbdev=0\0"							\
+	"usbpart=1\0"
 
 #include <configs/stm32mp15_common.h>
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
