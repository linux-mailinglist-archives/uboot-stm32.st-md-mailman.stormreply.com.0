Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF6A40A92
	for <lists+uboot-stm32@lfdr.de>; Sat, 22 Feb 2025 18:14:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69DF9C78F7B;
	Sat, 22 Feb 2025 17:14:56 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3ADDFC78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2025 17:14:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A73210382D37; Sat, 22 Feb 2025 18:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740244494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dUtw7+4n+V8VxmEBCs4q44p3ox8mAzn/wCXO0wMCs7U=;
 b=PjHFEdDCkzloQ9KK+x6b1HkQ9qtPpTc+MxD0Fgtl9ih6L+4BelvdTWwhZiv2jpVm+kEpqW
 gPZ4+O2Tg5S+Mpjrtfs/ebgz5O9bwoz46qkFdDRxWvovj2bHB90MU6EmC876/23cHAM2L8
 nO0OirCF1p6CokFCczndRvyAUEaG3/U8Hh2HNaR7CuG+iu7xyDRfwx4NjzDgG785K7yfVQ
 sEhGNDnWcLfIsgWBb3Qpcf8BMyngAWXvqwW1t6qaHn6cBzfSswHjweYja76Dqm1vxC2t7X
 On+F8P0+uxKrhxymQ0ys7vJFA3X+3ERVxDYwBnUbMqRqBi+RfmWjag5mTl2imw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat, 22 Feb 2025 18:13:44 +0100
Message-ID: <20250222171438.90953-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Introduce DH STM32MP15xx DHSOM
	board specific defconfigs
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

Move stm32mp15_dhcom_basic_defconfig into stm32mp15_dhcom_basic.config.
Retain legacy stm32mp15_dhcom_basic_defconfig as multi-config for all
DH STM32MP15xx DHCOM based boards. Move stm32mp15_dhsor_basic_defconfig
into stm32mp15_dhsor_basic.config. Retain stm32mp15_dhsor_basic_defconfig
as multi-config for all DH STM32MP15xx DHCOR based boards.

Introduce separate stm32mp15_dhcom_drc02_basic_defconfig,
stm32mp15_dhcom_pdk2_basic_defconfig, stm32mp15_dhcom_picoitx_basic_defconfig
for each STM32MP15xx DHCOM based board and separate
stm32mp15_dhcor_avenger96_basic_defconfig,
stm32mp15_dhcor_drc_compact_basic_defconfig,
stm32mp15_dhcor_testbench_basic_defconfig for each
STM32MP15xx DHCOR based board, to make build for those boards easier.
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhcom_basic.config                | 8 ++++++++
 configs/stm32mp15_dhcom_basic_defconfig             | 8 +-------
 configs/stm32mp15_dhcom_drc02_basic_defconfig       | 4 ++++
 configs/stm32mp15_dhcom_pdk2_basic_defconfig        | 4 ++++
 configs/stm32mp15_dhcom_picoitx_basic_defconfig     | 4 ++++
 configs/stm32mp15_dhcor_avenger96_basic_defconfig   | 4 ++++
 configs/stm32mp15_dhcor_basic.config                | 8 ++++++++
 configs/stm32mp15_dhcor_basic_defconfig             | 8 +-------
 configs/stm32mp15_dhcor_drc_compact_basic_defconfig | 4 ++++
 configs/stm32mp15_dhcor_testbench_basic_defconfig   | 4 ++++
 10 files changed, 42 insertions(+), 14 deletions(-)
 create mode 100644 configs/stm32mp15_dhcom_basic.config
 create mode 100644 configs/stm32mp15_dhcom_drc02_basic_defconfig
 create mode 100644 configs/stm32mp15_dhcom_pdk2_basic_defconfig
 create mode 100644 configs/stm32mp15_dhcom_picoitx_basic_defconfig
 create mode 100644 configs/stm32mp15_dhcor_avenger96_basic_defconfig
 create mode 100644 configs/stm32mp15_dhcor_basic.config
 create mode 100644 configs/stm32mp15_dhcor_drc_compact_basic_defconfig
 create mode 100644 configs/stm32mp15_dhcor_testbench_basic_defconfig

diff --git a/configs/stm32mp15_dhcom_basic.config b/configs/stm32mp15_dhcom_basic.config
new file mode 100644
index 00000000000..d78916bb5b2
--- /dev/null
+++ b/configs/stm32mp15_dhcom_basic.config
@@ -0,0 +1,8 @@
+#include <configs/stm32mp15_dhsom.config>
+
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_MEMTEST_START=0xc0000000
+CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_SYS_I2C_EEPROM_BUS=3
+CONFIG_SYS_I2C_EEPROM_ADDR=0x50
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index a28f2862048..297092bd746 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -1,10 +1,4 @@
-#include <configs/stm32mp15_dhsom.config>
+#include <configs/stm32mp15_dhcom_basic.config>
 
-CONFIG_ARM=y
-CONFIG_ARCH_STM32MP=y
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-pdk2"
-CONFIG_SYS_MEMTEST_START=0xc0000000
-CONFIG_SYS_MEMTEST_END=0xc4000000
-CONFIG_SYS_I2C_EEPROM_BUS=3
 CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
-CONFIG_SYS_I2C_EEPROM_ADDR=0x50
diff --git a/configs/stm32mp15_dhcom_drc02_basic_defconfig b/configs/stm32mp15_dhcom_drc02_basic_defconfig
new file mode 100644
index 00000000000..838c3db253d
--- /dev/null
+++ b/configs/stm32mp15_dhcom_drc02_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcom_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp153c-dhcom-drc02"
+CONFIG_OF_LIST="st/stm32mp153c-dhcom-drc02"
diff --git a/configs/stm32mp15_dhcom_pdk2_basic_defconfig b/configs/stm32mp15_dhcom_pdk2_basic_defconfig
new file mode 100644
index 00000000000..c6996233c9f
--- /dev/null
+++ b/configs/stm32mp15_dhcom_pdk2_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcom_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-pdk2"
+CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2"
diff --git a/configs/stm32mp15_dhcom_picoitx_basic_defconfig b/configs/stm32mp15_dhcom_picoitx_basic_defconfig
new file mode 100644
index 00000000000..5682edbfcbf
--- /dev/null
+++ b/configs/stm32mp15_dhcom_picoitx_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcom_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157c-dhcom-picoitx"
+CONFIG_OF_LIST="st/stm32mp157c-dhcom-picoitx"
diff --git a/configs/stm32mp15_dhcor_avenger96_basic_defconfig b/configs/stm32mp15_dhcor_avenger96_basic_defconfig
new file mode 100644
index 00000000000..5d27cd5ed7e
--- /dev/null
+++ b/configs/stm32mp15_dhcor_avenger96_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcor_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
+CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96"
diff --git a/configs/stm32mp15_dhcor_basic.config b/configs/stm32mp15_dhcor_basic.config
new file mode 100644
index 00000000000..e9c0cb9f95a
--- /dev/null
+++ b/configs/stm32mp15_dhcor_basic.config
@@ -0,0 +1,8 @@
+#include <configs/stm32mp15_dhsom.config>
+
+CONFIG_ARM=y
+CONFIG_ARCH_STM32MP=y
+CONFIG_SYS_I2C_EEPROM_BUS=2
+CONFIG_SYS_I2C_EEPROM_ADDR=0x53
+CONFIG_PHY_MICREL=y
+CONFIG_PHY_MICREL_KSZ90X1=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index f6f2af6e7a2..beb6d1d5a9a 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -1,10 +1,4 @@
-#include <configs/stm32mp15_dhsom.config>
+#include <configs/stm32mp15_dhcor_basic.config>
 
-CONFIG_ARM=y
-CONFIG_ARCH_STM32MP=y
 CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
-CONFIG_SYS_I2C_EEPROM_BUS=2
 CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
-CONFIG_SYS_I2C_EEPROM_ADDR=0x53
-CONFIG_PHY_MICREL=y
-CONFIG_PHY_MICREL_KSZ90X1=y
diff --git a/configs/stm32mp15_dhcor_drc_compact_basic_defconfig b/configs/stm32mp15_dhcor_drc_compact_basic_defconfig
new file mode 100644
index 00000000000..7b1d73a33b5
--- /dev/null
+++ b/configs/stm32mp15_dhcor_drc_compact_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcor_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp153c-dhcor-drc-compact"
+CONFIG_OF_LIST="st/stm32mp153c-dhcor-drc-compact"
diff --git a/configs/stm32mp15_dhcor_testbench_basic_defconfig b/configs/stm32mp15_dhcor_testbench_basic_defconfig
new file mode 100644
index 00000000000..7ba327cbd82
--- /dev/null
+++ b/configs/stm32mp15_dhcor_testbench_basic_defconfig
@@ -0,0 +1,4 @@
+#include <configs/stm32mp15_dhcor_basic.config>
+
+CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp151a-dhcor-testbench"
+CONFIG_OF_LIST="st/stm32mp151a-dhcor-testbench"
-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
