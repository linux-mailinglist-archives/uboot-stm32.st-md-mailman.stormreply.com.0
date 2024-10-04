Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406D9912CD
	for <lists+uboot-stm32@lfdr.de>; Sat,  5 Oct 2024 01:08:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A483CC7802B;
	Fri,  4 Oct 2024 23:08:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 318B7C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 23:08:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E885888AFF;
 Sat,  5 Oct 2024 01:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728083295;
 bh=MhBih4bXllueugx3TpysBeGPSBKKJQu5tTWDW0EJMF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ofPDfaqB6cK/mnyJtoWrvhm110jHUxilT+buRzd6Sy2aNJV17eYWeBzUkXwuXR+sC
 LISkQNsh/LGEEUKEZNtg5FOsAKU/EmWjGBsijUjW8tQPeRUx/2ge7IYKlyUCCzV6v3
 5hmySIt/KdB/YifIcbpy9SyyDGll0uMqz9W0N1o+b5MT3orfCFP37xRj5hQVyz07Uv
 ER/ryf4PZOsN7rZ7qdAysEZb6xsdko7q3EGN6TT5LCI8/CCDth1uUoU85JLMKLm60U
 S03XVx3Vpg2T9jyjCJ0d3ym/e7EZPBL2EiWmRZ27LyuQ1hAuK0M1kc1W0DmigjIxdJ
 xfWElpEguP5DA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  5 Oct 2024 01:07:14 +0200
Message-ID: <20241004230756.371153-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004230756.371153-1-marex@denx.de>
References: <20241004230756.371153-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Sumit Garg <sumit.garg@linaro.org>,
 u-boot@dh-electronics.com, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>, Tom Rini <trini@konsulko.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/2] Makefile: Drop SPL_FIT_GENERATOR support
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

The SPL_FIT_GENERATOR is long superseded by binman, drop SPL_FIT_GENERATOR
support as there are no more users.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
NOTE: Depends on https://lore.kernel.org/u-boot/20241004225916.361000-1-marex@denx.de/
---
 Makefile                | 18 ------------------
 boot/Kconfig            | 15 ---------------
 doc/usage/fit/howto.rst |  4 ----
 3 files changed, 37 deletions(-)

diff --git a/Makefile b/Makefile
index a70926ec2fa..45592eb2bac 100644
--- a/Makefile
+++ b/Makefile
@@ -1139,13 +1139,6 @@ ifeq ($(CONFIG_OF_EMBED)$(CONFIG_EFI_APP),y)
 	@echo >&2 "CONFIG_OF_SEPARATE for boards in mainline."
 	@echo >&2 "See doc/develop/devicetree/control.rst for more info."
 	@echo >&2 "===================================================="
-endif
-ifneq ($(CONFIG_SPL_FIT_GENERATOR),)
-	@echo >&2 "===================== WARNING ======================"
-	@echo >&2 "This board uses CONFIG_SPL_FIT_GENERATOR. Please migrate"
-	@echo >&2 "to binman instead, to avoid the proliferation of"
-	@echo >&2 "arch-specific scripts with no tests."
-	@echo >&2 "===================================================="
 endif
 	$(call deprecated,CONFIG_WDT,DM watchdog,v2019.10,\
 		$(CONFIG_WATCHDOG)$(CONFIG_HW_WATCHDOG))
@@ -1413,17 +1406,6 @@ OBJCOPYFLAGS_u-boot.ldr.srec := -I binary -O srec
 u-boot.ldr.hex u-boot.ldr.srec: u-boot.ldr FORCE
 	$(call if_changed,objcopy)
 
-# Boards with more complex image requirements can provide an .its source file
-# or a generator script
-# NOTE: Please do not use this. We are migrating away from Makefile rules to use
-# binman instead.
-ifneq ($(CONFIG_USE_SPL_FIT_GENERATOR),)
-U_BOOT_ITS := u-boot.its
-$(U_BOOT_ITS): $(U_BOOT_ITS_DEPS) FORCE
-	$(srctree)/$(CONFIG_SPL_FIT_GENERATOR) \
-	$(patsubst %,$(dt_dir)/%.dtb,$(subst ",,$(CONFIG_OF_LIST))) > $@
-endif
-
 ifdef CONFIG_SPL_LOAD_FIT
 MKIMAGEFLAGS_u-boot.img = -f auto -A $(ARCH) -T firmware -C none -O u-boot \
 	-a $(CONFIG_TEXT_BASE) -e $(CONFIG_SYS_UBOOT_START) \
diff --git a/boot/Kconfig b/boot/Kconfig
index 51e6cd6cb1d..4314227d5f8 100644
--- a/boot/Kconfig
+++ b/boot/Kconfig
@@ -282,21 +282,6 @@ config SPL_FIT_IMAGE_POST_PROCESS
 	  injected into the FIT creation (i.e. the blobs would have been pre-
 	  processed before being added to the FIT image).
 
-config USE_SPL_FIT_GENERATOR
-	bool "Use a script to generate the .its script"
-	depends on SPL_FIT
-	default y if SPL_FIT && ARCH_ZYNQMP
-
-config SPL_FIT_GENERATOR
-	string ".its file generator script for U-Boot FIT image"
-	depends on USE_SPL_FIT_GENERATOR
-	default "arch/arm/mach-zynqmp/mkimage_fit_atf.sh" if SPL_LOAD_FIT && ARCH_ZYNQMP
-	help
-	  Specifies a (platform specific) script file to generate the FIT
-	  source file used to build the U-Boot FIT image file. This gets
-	  passed a list of supported device tree file stub names to
-	  include in the generated image.
-
 if VPL
 
 config VPL_FIT
diff --git a/doc/usage/fit/howto.rst b/doc/usage/fit/howto.rst
index 280eff724f6..675c9aa5bb0 100644
--- a/doc/usage/fit/howto.rst
+++ b/doc/usage/fit/howto.rst
@@ -57,10 +57,6 @@ own subnode under the /images node, which should then be referenced from one or
 multiple /configurations subnodes. The required images must be enumerated in
 the "loadables" property as a list of strings.
 
-CONFIG_SPL_FIT_GENERATOR can point to a script which generates this image source
-file during the build process. It gets passed a list of device tree files (taken
-from the CONFIG_OF_LIST symbol).
-
 The SPL also records to a DT all additional images (called loadables) which are
 loaded. The information about loadables locations is passed via the DT node with
 fit-images name.
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
