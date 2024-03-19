Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736787F58C
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Mar 2024 03:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3217EC6DD73;
	Tue, 19 Mar 2024 02:45:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ACDDC6DD60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Mar 2024 02:45:58 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DBBC288053;
 Tue, 19 Mar 2024 03:45:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1710816358;
 bh=jX5Gml8B/B9uX+VTigVLGUFiHvD4YhApFr1wC5DSrww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k//jprEG/ubX8wf8FjinSxgdKJyZvvGVyHkr9bG4J6pQHWW4Lb1RzUqnmAby5NN+K
 t/mNbYVsAWQH2pSY4fd/nl/aqaumkExR3R5scFpaPy3F1mgfUpKit7ehRxM6N92Yj4
 UftR7aX6kjJmsAGPBtewO+64PqF0DUyPOkC00JToDfJzwQ9Pl7Tx5e6nrXLr0vDn3J
 dBIvbVi9CDYLdrz/WX52Jkw3SHbdkWP+fepKMbyXfgCjcu0Hcic2Ane9XdLb7YxmQd
 g28WB1rw08m6+kv5nrhRhpPW94z+7O7nahBkG8ScgLvyJriMWsX8O1ZYVik4Y56dCE
 zG5gz0L9FnhGw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 19 Mar 2024 03:45:08 +0100
Message-ID: <20240319024534.103299-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240319024534.103299-1-marex@denx.de>
References: <20240319024534.103299-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/2] ARM: stm32: Make PWR regulator driver
	available on STM32MP13xx
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

This patch makes STM32 PWR regulators available on stm32mp13xx.
This requires TFA to clear RCC_SECCFGR, is disabled by default
on stm32mp13xx and can only be enabled on board config level.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/Kconfig     | 17 +++++++++++++++++
 arch/arm/mach-stm32mp/Kconfig.15x | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index b9af03d57e3..d5934a92771 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -155,4 +155,21 @@ source "arch/arm/mach-stm32mp/Kconfig.13x"
 source "arch/arm/mach-stm32mp/Kconfig.15x"
 source "arch/arm/mach-stm32mp/Kconfig.25x"
 source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
+
+config STM32MP15_PWR
+	bool "Enable driver for STM32MP15x PWR"
+	depends on DM_REGULATOR && DM_PMIC && (STM32MP13X || STM32MP15X)
+	default y if STM32MP15X
+	help
+		This config enables implementation of driver-model pmic and
+		regulator uclass features for access to STM32MP15x PWR.
+
+config SPL_STM32MP15_PWR
+	bool "Enable driver for STM32MP15x PWR in SPL"
+	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC && (STM32MP13X || STM32MP15X)
+	default y if STM32MP15X
+	help
+		This config enables implementation of driver-model pmic and
+		regulator uclass features for access to STM32MP15x PWR in SPL.
+
 endif
diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
index 71c14eb4955..d99aa9fd694 100644
--- a/arch/arm/mach-stm32mp/Kconfig.15x
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -77,22 +77,6 @@ config TARGET_ICORE_STM32MP1
 
 endchoice
 
-config STM32MP15_PWR
-	bool "Enable driver for STM32MP15x PWR"
-	depends on DM_REGULATOR && DM_PMIC
-	default y
-	help
-		This config enables implementation of driver-model pmic and
-		regulator uclass features for access to STM32MP15x PWR.
-
-config SPL_STM32MP15_PWR
-	bool "Enable driver for STM32MP15x PWR in SPL"
-	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC
-	default y
-	help
-		This config enables implementation of driver-model pmic and
-		regulator uclass features for access to STM32MP15x PWR in SPL.
-
 config TEXT_BASE
 	default 0xC0100000
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
