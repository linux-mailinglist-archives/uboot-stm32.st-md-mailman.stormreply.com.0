Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807D52F0AB
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:29:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1C70C0D2BB;
	Fri, 20 May 2022 16:29:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AEB3C0D2B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:29:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KFdl2X030396;
 Fri, 20 May 2022 18:29:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=9tHWg56IN8V84HQ66kxrHogO/FG1B9ab6zlUy3GJ6yk=;
 b=M7D6WNcinu0gslqvKS2bXxzzT/7s1Q9VdoGHCfSpEDqhZxIUeurQNp+sbewO320XVZ/g
 mfAaf6dj2KwQ9ycOV8xXo6uiR+hgGtXSb1NsEMwzMCKC/i+fWP/ly0F42UHg/a3XwQF/
 Pqnabkdr5Vig70zWWj9/g7PU2dGYywziHhLiW/4D6Nzqumbec3o6H7Wl17yD11/tZf+N
 0qIMRJsoXq7BMb2Rlystltz6/27Ddc/yp9ZRojO9kEf/WxoMsI7jxHthdjjTtAcIQ8i0
 AIozOxAj3lCRVYD0a/BGcjO/K6VjQN6UWOyWuA3OwtvF2Fj9oA1qoY27csMFX1BYbUol qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s2587q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:29:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B6DD10002A;
 Fri, 20 May 2022 18:29:00 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E68C24C42B;
 Fri, 20 May 2022 18:29:00 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:28:25 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:54 +0200
Message-ID: <20220520182444.v2.16.Ia54d641fbe9119451443b79f0db8cb80453ab3f3@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v2 16/16] doc: st: stm32mp1: add STM32MP13x
	support
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

Add in U-Boot documentation the quick instruction to
setup the STMicroelectronics STM32MP13x boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- fix typo error in commit message and in rst file

 doc/board/st/stm32mp1.rst | 183 ++++++++++++++++++++++++++------------
 1 file changed, 126 insertions(+), 57 deletions(-)

diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 0c5d3a90f0..00f9b45442 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -1,41 +1,31 @@
 .. SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
 .. sectionauthor:: Patrick Delaunay <patrick.delaunay@foss.st.com>
 
-STM32MP15x boards
+STM32MP1xx boards
 =================
 
-This is a quick instruction for setup STM32MP15x boards.
+This is a quick instruction for setup STMicroelectronics STM32MP1xx boards.
 
-Futher information can be found in STMicrolectronics STM32 WIKI_.
+Further information can be found in STMicroelectronics STM32 WIKI_.
 
 Supported devices
 -----------------
 
-U-Boot supports STMP32MP15x SoCs:
+U-Boot supports all the STMicroelectronics MPU with the associated boards
 
- - STM32MP157
- - STM32MP153
- - STM32MP151
+ - STMP32MP15x SoCs:
 
-The STM32MP15x is a Cortex-A MPU aimed at various applications.
+  - STM32MP157
+  - STM32MP153
+  - STM32MP151
 
-It features:
-
- - Dual core Cortex-A7 application core (Single on STM32MP151)
- - 2D/3D image composition with GPU (only on STM32MP157)
- - Standard memories interface support
- - Standard connectivity, widely inherited from the STM32 MCU family
- - Comprehensive security support
+ - STMP32MP13x SoCs:
 
-Each line comes with a security option (cryptography & secure boot) and
-a Cortex-A frequency option:
-
- - A : Cortex-A7 @ 650 MHz
- - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
- - D : Cortex-A7 @ 800 MHz
- - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
+  - STM32MP135
+  - STM32MP133
+  - STM32MP131
 
-Everything is supported in Linux but U-Boot is limited to:
+Everything is supported in Linux but U-Boot is limited to the boot device:
 
  1. UART
  2. SD card/MMC controller (SDMMC)
@@ -49,7 +39,35 @@ And the necessary drivers
  1. I2C
  2. STPMIC1 (PMIC and regulator)
  3. Clock, Reset, Sysreset
- 4. Fuse
+ 4. Fuse (BSEC)
+ 5. OP-TEE
+ 6. ETH
+ 7. USB host
+ 8. WATCHDOG
+ 9. RNG
+ 10. RTC
+
+STM32MP15x
+``````````
+
+The STM32MP15x is a Cortex-A7 MPU aimed at various applications.
+
+It features:
+
+ - Dual core Cortex-A7 application core (Single on STM32MP151)
+ - 2D/3D image composition with GPU (only on STM32MP157)
+ - Standard memories interface support
+ - Standard connectivity, widely inherited from the STM32 MCU family
+ - Comprehensive security support
+ - Cortex M4 coprocessor
+
+Each line comes with a security option (cryptography & secure boot) and
+a Cortex-A frequency option:
+
+ - A : Cortex-A7 @ 650 MHz
+ - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
+ - D : Cortex-A7 @ 800 MHz
+ - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
 
 Currently the following boards are supported:
 
@@ -59,6 +77,16 @@ Currently the following boards are supported:
  + stm32mp157c-ev1.dts
  + stm32mp15xx-dhcor-avenger96.dts
 
+STM32MP13x
+``````````
+
+The STM32MP13x is a single Cortex-A7 MPU aimed at various applications.
+
+Currently the following boards are supported:
+
+ + stm32mp135f-dk.dts
+
+
 Boot Sequences
 --------------
 
@@ -71,12 +99,22 @@ Boot Sequences
 +          +------------------------+-------------------------+--------------+
 |          | embedded RAM           | DDR                                    |
 +----------+------------------------+-------------------------+--------------+
+| TrustZone|                         secure monitor                          |
++----------+------------------------+-------------------------+--------------+
+
+The trusted boot chain is recommended with:
+
+- FSBL = **TF-A BL2**
+- Secure monitor = **OP-TEE**
+- SSBL = **U-Boot**
+
+It is the only supported boot chain for STM32MP13x family.
 
 The **Trusted** boot chain with TF-A_
 `````````````````````````````````````
 
 defconfig_file :
-   + **stm32mp15_defconfig** (for TF-A_ with FIP support)
+   + **stm32mp15_defconfig**  and **stm32mp13_defconfig** (for TF-A_ with FIP support)
    + **stm32mp15_trusted_defconfig** (for TF-A_ without FIP support)
 
     +-------------+--------------------------+------------+-------+
@@ -98,8 +136,8 @@ TF-A_ (BL2) initialize the DDR and loads the next stage binaries from a FIP file
      the secure monitor to access to secure resources.
    + HW_CONFIG: The hardware configuration file = the U-Boot device tree
 
-The **Basic** boot chain with SPL
-`````````````````````````````````
+The **Basic** boot chain with SPL (for STM32MP15x)
+``````````````````````````````````````````````````
 
 defconfig_file :
    + **stm32mp15_basic_defconfig**
@@ -117,16 +155,19 @@ SPL has limited security initialization.
 U-Boot is running in secure mode and provide a secure monitor to the kernel
 with only PSCI support (Power State Coordination Interface defined by ARM).
 
-All the STM32MP15x boards supported by U-Boot use the same generic board
-stm32mp1 which support all the bootable devices.
+.. warning:: This alternate **basic** boot chain with SPL is not supported/promoted by STMicroelectronics to make product.
+
+Device Tree
+-----------
 
-Each board is configured only with the associated device tree.
+All the STM32MP15x and STM32MP13x boards supported by U-Boot use the same generic board
+stm32mp1 which supports all the bootable devices.
 
-Device Tree Selection
----------------------
+Each STMicroelectronics board is only configured with the associated device tree.
 
-You need to select the appropriate device tree for your board,
-the supported device trees for STM32MP15x are:
+STM32MP15x device Tree Selection
+````````````````````````````````
+The supported device trees for STM32MP15x (stm32mp15_trusted_defconfig and stm32mp15_basic_defconfig) are:
 
 + ev1: eval board with pmic stpmic1 (ev1 = mother board + daughter ed1)
 
@@ -148,6 +189,15 @@ the supported device trees for STM32MP15x are:
 
    + stm32mp15xx-dhcor-avenger96
 
+STM32MP13x device Tree Selection
+````````````````````````````````
+The supported device trees for STM32MP13x (stm32mp13_defconfig) are:
+
++ dk: Discovery board
+
+   + stm32mp135f-dk
+
+
 Build Procedure
 ---------------
 
@@ -170,6 +220,7 @@ Build Procedure
 
    for example: use one output directory for each configuration::
 
+   # export KBUILD_OUTPUT=stm32mp13
    # export KBUILD_OUTPUT=stm32mp15
    # export KBUILD_OUTPUT=stm32mp15_trusted
    # export KBUILD_OUTPUT=stm32mp15_basic
@@ -184,9 +235,10 @@ Build Procedure
 
    with <defconfig_file>:
 
-   - For **trusted** boot mode : **stm32mp15_defconfig** or
-     stm32mp15_trusted_defconfig
-   - For basic boot mode: stm32mp15_basic_defconfig
+   - For **trusted** boot mode :
+     - For STM32MP13x: **stm32mp13_defconfig**
+     - For STM32MP15x: **stm32mp15_defconfig** or stm32mp15_trusted_defconfig
+   - For STM32MP15x basic boot mode: stm32mp15_basic_defconfig
 
 5. Configure the device-tree and build the U-Boot image::
 
@@ -194,37 +246,42 @@ Build Procedure
 
    Examples:
 
-  a) trusted boot with FIP on ev1::
+  a) trusted boot with FIP on STM32MP15x ev1::
 
      # export KBUILD_OUTPUT=stm32mp15
      # make stm32mp15_defconfig
      # make DEVICE_TREE=stm32mp157c-ev1 all
 
-  b) trusted boot without FIP on dk2::
+  b) trusted boot on STM32MP13x discovery board::
 
-      # export KBUILD_OUTPUT=stm32mp15_trusted
-      # make stm32mp15_trusted_defconfig
-      # make DEVICE_TREE=stm32mp157c-dk2 all
+     # export KBUILD_OUTPUT=stm32mp13
+     # make stm32mp13_defconfig
+     # make DEVICE_TREE=stm32mp135f-dk all
 
-  c) basic boot on ev1::
+    DEVICE_TEE selection is optional as stm32mp135f-dk is the default board of the defconfig::
+
+     # make stm32mp13_defconfig
+     # make all
+
+  c) basic boot on STM32MP15x ev1::
 
       # export KBUILD_OUTPUT=stm32mp15_basic
       # make stm32mp15_basic_defconfig
       # make DEVICE_TREE=stm32mp157c-ev1 all
 
-  d) basic boot on ed1::
+  d) basic boot on STM32MP15x ed1::
 
       # export KBUILD_OUTPUT=stm32mp15_basic
       # make stm32mp15_basic_defconfig
       # make DEVICE_TREE=stm32mp157c-ed1 all
 
-  e) basic boot on dk1::
+  e) basic boot on STM32MP15x dk1::
 
      # export KBUILD_OUTPUT=stm32mp15_basic
      # make stm32mp15_basic_defconfig
      # make DEVICE_TREE=stm32mp157a-dk1 all
 
-  f) basic boot on avenger96::
+  f) basic boot on STM32MP15x avenger96::
 
      # export KBUILD_OUTPUT=stm32mp15_basic
      # make stm32mp15_basic_defconfig
@@ -235,6 +292,7 @@ Build Procedure
    So in the output directory (selected by KBUILD_OUTPUT),
    you can found the needed U-Boot files:
 
+     - stm32mp13_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
      - stm32mp15_defconfig = **u-boot-nodtb.bin** and **u-boot.dtb**
 
      - stm32mp15_trusted_defconfig = u-boot.stm32
@@ -325,9 +383,9 @@ the boot pin values = BOOT0, BOOT1, BOOT2
   | SPI-NAND    |  1      |  1      |  1      |
   +-------------+---------+---------+---------+
 
-- on the **daugther board ed1 = MB1263** with the switch SW1
-- on **Avenger96** with switch S3 (NOR and SPI-NAND are not applicable)
-- on board **DK1/DK2** with the switch SW1 = BOOT0, BOOT2
+- on the STM32MP15x **daughter board ed1 = MB1263** with the switch SW1
+- on STM32MP15x **Avenger96** with switch S3 (NOR and SPI-NAND are not applicable)
+- on board STM32MP15x **DK1/DK2** with the switch SW1 = BOOT0, BOOT2
   with only 2 pins available (BOOT1 is forced to 0 and NOR not supported),
   the possible value becomes:
 
@@ -355,7 +413,7 @@ The communication between HOST and board is based on
 Prepare an SD card
 ------------------
 
-The minimal requirements for STMP32MP15x boot up to U-Boot are:
+The minimal requirements for STMP32MP15x and STM32MP13x boot up to U-Boot are:
 
 - GPT partitioning (with gdisk or with sgdisk)
 - 2 fsbl partitions, named "fsbl1" and "fsbl2", size at least 256KiB
@@ -511,14 +569,25 @@ MAC Address
 Please read doc/README.enetaddr for the implementation guidelines for mac id
 usage. Basically, environment has precedence over board specific storage.
 
-For STMicroelectonics board, it is retrieved in STM32MP15x OTP :
+For STMicroelectronics board, it is retrieved in:
+
+ - STM32MP15x OTP:
 
- - OTP_57[31:0] = MAC_ADDR[31:0]
- - OTP_58[15:0] = MAC_ADDR[47:32]
+   - OTP_57[31:0] = MAC_ADDR[31:0]
+   - OTP_58[15:0] = MAC_ADDR[47:32]
 
-To program a MAC address on virgin OTP words above, you can use the fuse command
+ - STM32MP13x OTP:
+
+  - OTP_57[31:0]  = MAC_ADDR0[31:0]
+  - OTP_58[15:0]  = MAC_ADDR0[47:32]
+  - OTP_58[31:16] = MAC_ADDR1[15:0]
+  - OTP_59[31:0]  = MAC_ADDR1[47:16]
+
+To program a MAC address on virgin STM32MP15x OTP words above, you can use the fuse command
 on bank 0 to access to internal OTP and lock them:
 
+In the next example we are using the 2 OTPs used on STM32MP15x.
+
 Prerequisite: check if a MAC address isn't yet programmed in OTP
 
 1) check OTP: their value must be equal to 0::
@@ -571,8 +640,8 @@ Example to set mac address "12:34:56:78:9a:bc"
              OTP are protected. It is already done for the board
              provided by STMicroelectronics.
 
-Coprocessor firmware
---------------------
+Coprocessor firmware on STM32MP15x
+----------------------------------
 
 U-Boot can boot the coprocessor before the kernel (coprocessor early boot).
 
@@ -678,7 +747,7 @@ All the supported device are exported for dfu-util tool::
 
 You can update the boot device:
 
-- SD card (mmc0) ::
+- SD card (mmc0)::
 
   $> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1.stm32
   $> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1.stm32
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
