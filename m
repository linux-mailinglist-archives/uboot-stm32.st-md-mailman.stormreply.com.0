Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A39F276E
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Dec 2024 00:30:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48C61C78002;
	Sun, 15 Dec 2024 23:30:50 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC58FC6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Dec 2024 23:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE03B1049AF75; Mon, 16 Dec 2024 00:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1734305443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ItvedxVomU3cBEwoxbDlTXeBipLix66jfwi9jyRb32E=;
 b=d6qPHr/QQIwibEe+STAgjfSZYx0CdVxOwWyhFh7/PT1YM5ZVvkvSgsN5CMNRI75gOv/2x2
 9b/uQehtXnLRDOyq8BG8LgL6PmTmkPMNYv0uIt2xpzgK7bHANaxsP72PxHTqWM7jlruGjm
 UbmqZfhDkStFdtowZuEKkLUhRkX9WBaDwjLOe7q5u8OKHncfAz1GkOhjN0iR3ti6oT4RK2
 xVCkv8lJOodiSTswP1P17GFvCEwe+KYIqQYh+QSJCcXWymsri6RLE1nOwvbQnrHDmuIPAm
 OFiPIrZOof5v19oyp7C6bNLFIHWXgQ23Bzc/9mz7nfjSjGu8JWc9BJEQZWBjjA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 16 Dec 2024 00:29:14 +0100
Message-ID: <20241215233011.569287-3-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241215233011.569287-1-marex@denx.de>
References: <20241215233011.569287-1-marex@denx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/4] ARM: dts: stm32: Drop access-controllers
	from SPL DT on DH STM32MP15xx DHSOM
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

The access-controllers DT property is not useful in STM32MP15xx SPL,
remove it to reduce SPL control DT size. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: For 2025.01
---
Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhcom_basic_defconfig | 2 +-
 configs/stm32mp15_dhcor_basic_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index b730bf76dca..5add66fb2f4 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -7,5 +7,5 @@ CONFIG_SYS_MEMTEST_START=0xc0000000
 CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_SYS_I2C_EEPROM_BUS=3
 CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
-CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
 CONFIG_SYS_I2C_EEPROM_ADDR=0x50
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index 42a596505ca..dd14db3b4c5 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -5,7 +5,7 @@ CONFIG_ARCH_STM32MP=y
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
 CONFIG_SYS_I2C_EEPROM_BUS=2
 CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
-CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
+CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
 CONFIG_SYS_I2C_EEPROM_ADDR=0x53
 CONFIG_PHY_MICREL=y
 CONFIG_PHY_MICREL_KSZ90X1=y
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
