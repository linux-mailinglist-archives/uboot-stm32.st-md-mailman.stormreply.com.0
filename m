Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63558A3FCE5
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Feb 2025 18:09:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F098AC7A839;
	Fri, 21 Feb 2025 17:09:07 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B456AC7A838
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Feb 2025 17:09:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9633410382D37; Fri, 21 Feb 2025 18:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740157745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6fZ7OahInrxXuEQvgDUBjlaOxhvyXELO1igRb3OAtPs=;
 b=G+JLVDpRv68ZgYODc4luutZ3bOHnWyeHoeEM3UGOlFY7YG+mT3PP4plD2+sO827NilR1lo
 VCAxKJqt8juO/QF8BE96X+blTlhWBjInb1oW3fLHBvTjVc/xMWALljAHZe3QDOj/sw3VtU
 96cdpwIsdbBwh4kLRHPhZPj+Jvkplrevq6XcqpuuqtlyZNCt0Gcqp5vMLy17QE3DbNTIz/
 aCT8B0Ur75AexRYJ7DArBftx6UVQ1LVveRQ8rx/ATIgCx/ah9zSSXmDqGvA1hYcOkoLECX
 PJOgVZkQjo+8ZGxEK6ADr1OTnz7tQQLQNiMnkyJP/A6xuDXGhT19ZRZFolegJQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Fri, 21 Feb 2025 18:08:38 +0100
Message-ID: <20250221170851.184893-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Fix CONFIG_BOOTCOUNT_ALTBOOTCMD
	update on DH STM32MP1 DHSOM
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

The environment is missing closing quotes for string variable, but the
variable is empty on this system, remove the CONFIG_BOOTCOUNT_ALTBOOTCMD
assignment entirely.

Fixes: 940135eea5df ("Kconfig: Move CONFIG_BOOTCOUNT_ALTBOOTCMD to Kconfig")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp13_dhcor_defconfig       | 1 -
 configs/stm32mp15_dhcom_basic_defconfig | 1 -
 configs/stm32mp15_dhcor_basic_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
index 4dc3954128d..ff948b904be 100644
--- a/configs/stm32mp13_dhcor_defconfig
+++ b/configs/stm32mp13_dhcor_defconfig
@@ -44,4 +44,3 @@ CONFIG_OPTEE=y
 CONFIG_USB_ONBOARD_HUB=y
 CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
 CONFIG_ERRNO_STR=y
-CONFIG_BOOTCOUNT_ALTBOOTCMD="
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index f89c921925d..a28f2862048 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -8,4 +8,3 @@ CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_SYS_I2C_EEPROM_BUS=3
 CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
 CONFIG_SYS_I2C_EEPROM_ADDR=0x50
-CONFIG_BOOTCOUNT_ALTBOOTCMD="
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index bde668761b3..f6f2af6e7a2 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -8,4 +8,3 @@ CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st
 CONFIG_SYS_I2C_EEPROM_ADDR=0x53
 CONFIG_PHY_MICREL=y
 CONFIG_PHY_MICREL_KSZ90X1=y
-CONFIG_BOOTCOUNT_ALTBOOTCMD="
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
