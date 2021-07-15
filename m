Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 615EE3CA161
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Jul 2021 17:22:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F0A2C597B0;
	Thu, 15 Jul 2021 15:22:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19038C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 15:22:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FFCcQM008775; Thu, 15 Jul 2021 17:22:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=w+v9h5CNby9BBhFlKEGzjG8JM6QhUYQAQzUPCSG9pn8=;
 b=VSKraJpz8QV8VsCZkiIxN8h4SMq13g1QVz5rxBharh4c3TtkRUb6w3s2PeqYzxpZqXhi
 SjeWhauyJWzx8C/zMceqpQn2atyHxuPDilXzaGjWXOJdfmVp802V1/l0roPiSE8MVIxx
 OY++iFmcJ1C/KU0gHehfCEqkrXN/3MTMsgHZ4+RMs85rJHbbyw7XdJC2POCTK1OIQroP
 9vlnAU4ayps7sbJO+Ji4A1Dft3D7cAstqngTejv49QHmOs3xF1eCQ7GRtq9XBWXHrKej
 itbeUyGbm7/iOoC7k6c+qMDMy2B073o0W4cZ7jfbzrBDa9fq3oL1V1k5jgXdvQWI1akh 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ten736g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 17:22:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE4FC100034;
 Thu, 15 Jul 2021 17:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D29652309FF;
 Thu, 15 Jul 2021 17:22:12 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul 2021 17:22:12
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Jul 2021 17:22:06 +0200
Message-ID: <20210715172115.v2.4.I5b4dcc998de66f175510fed96f6930c7208b492c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715152207.46118-1-patrick.delaunay@foss.st.com>
References: <20210715152207.46118-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 4/5] doc: st: stm32mp1: Add FIP support for
	trusted boot
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

TF-A for STM32MP15 now supports the FIP: it is a packaging format which
includes the secure monitor, u-boot-nodtb.bin and u-boot.dtb

This FIP file is loaded by FSBL = TF-A BL2.

This patch updates the board documentation to use this FIP file and no
more u-boot.stm32 (with STM32 image header) which is no more generated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

Changes in v2:
- fix one typo: s/ enought / enough

 doc/board/st/stm32mp1.rst | 166 ++++++++++++++++++++++----------------
 1 file changed, 97 insertions(+), 69 deletions(-)

diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index f0c2b09b98..7440753788 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -60,7 +60,7 @@ Currently the following boards are supported:
 Boot Sequences
 --------------
 
-3 boot configurations are supported with:
+2 boot configurations are supported with:
 
 +----------+------------------------+-------------------------+--------------+
 | **ROM**  | **FSBL**               | **SSBL**                | **OS**       |
@@ -70,10 +70,12 @@ Boot Sequences
 |          | embedded RAM           | DDR                                    |
 +----------+------------------------+-------------------------+--------------+
 
-The **Trusted** boot chain
-``````````````````````````
+The **Trusted** boot chain with TF-A
+`````````````````````````````````````
 
-defconfig_file : stm32mp15_trusted_defconfig
+defconfig_file :
+   + **stm32mp15_defconfig** (for TF-A with FIP support)
+   + **stm32mp15_trusted_defconfig** (for TF-A without FIP support)
 
     +-------------+-------------------------+------------+-------+
     |  ROM code   | FSBL                    | SSBL       | OS    |
@@ -83,19 +85,16 @@ defconfig_file : stm32mp15_trusted_defconfig
     | TrustZone   |secure monitor                                |
     +-------------+-------------------------+------------+-------+
 
-TF-A performs a full initialization of Secure peripherals and installs a
-secure monitor, BL32:
+TF-A (BL2) initialize the DDR and loads the next stage binaries from a FIP file:
+   + BL32: a secure monitor BL32 = SPMin provided by TF-A or OP-TEE : performs a full initialization of Secure peripherals and provides service to normal world
+   + BL33: a non-trusted firmware = U-Boot, running in normal world and uses the secure monitor to access to secure resources.
+   + HW_CONFIG: The hardware configuration file = the U-Boot device tree
 
-  * SPMin provided by TF-A or
-  * OP-TEE from specific partitions (teeh, teed, teex).
+The **Basic** boot chain with SPL
+`````````````````````````````````
 
-U-Boot is running in normal world and uses the secure monitor to access
-to secure resources.
-
-The **Basic** boot chain
-````````````````````````
-
-defconfig_file : stm32mp15_basic_defconfig
+defconfig_file :
+   + **stm32mp15_basic_defconfig**
 
     +-------------+------------+------------+-------+
     |  ROM code   | FSBL       | SSBL       | OS    |
@@ -163,12 +162,13 @@ Build Procedure
 
    for example: use one output directory for each configuration::
 
+   # export KBUILD_OUTPUT=stm32mp15
    # export KBUILD_OUTPUT=stm32mp15_trusted
    # export KBUILD_OUTPUT=stm32mp15_basic
 
    you can build outside of code directory::
 
-   # export KBUILD_OUTPUT=../build/stm32mp15_trusted
+   # export KBUILD_OUTPUT=../build/stm32mp15
 
 4. Configure U-Boot::
 
@@ -176,7 +176,7 @@ Build Procedure
 
    with <defconfig_file>:
 
-   - For **trusted** boot mode : **stm32mp15_trusted_defconfig**
+   - For **trusted** boot mode : **stm32mp15_defconfig** or stm32mp15_trusted_defconfig
    - For basic boot mode: stm32mp15_basic_defconfig
 
 5. Configure the device-tree and build the U-Boot image::
@@ -185,13 +185,13 @@ Build Procedure
 
    Examples:
 
-  a) trusted boot on ev1::
+  a) trusted boot with FIP on ev1::
 
-     # export KBUILD_OUTPUT=stm32mp15_trusted
-     # make stm32mp15_trusted_defconfig
+     # export KBUILD_OUTPUT=stm32mp15
+     # make stm32mp15_defconfig
      # make DEVICE_TREE=stm32mp157c-ev1 all
 
-  b) trusted with OP-TEE boot on dk2::
+  b) trusted boot without FIP on dk2::
 
       # export KBUILD_OUTPUT=stm32mp15_trusted
       # make stm32mp15_trusted_defconfig
@@ -223,16 +223,32 @@ Build Procedure
 
 6. Output files
 
-   BootRom and TF-A expect binaries with STM32 image header
-   SPL expects file with U-Boot uImage header
+   The ROM code expects FSBL binaries with STM32 image header.
+   TF-A expects:
+   -   a FIP binary, including the OS monitor (SPmin or OP-TEE) and the U-Boot
+       binary + device tree
+   -  binaries with STM32 image header: U-Boot and OP-TEE
+   SPL expects file with U-Boot uImage header.
 
    So in the output directory (selected by KBUILD_OUTPUT),
    you can found the needed files:
 
   - For **Trusted** boot (with or without OP-TEE)
 
-     - FSBL = **tf-a.stm32** (provided by TF-A compilation)
-     - SSBL = **u-boot.stm32**
+     - with FIP:
+        - FSBL = **tf-a.stm32** and **fip.bin** (provided by TF-A compilation)
+        - SSBL = **u-boot-nodtb.bin** and **u-boot.dtb**
+
+     The file fip.bin includes the 2 U-Boot files, u-boot-nodtb.bin and u-boot.dtb;
+     they are needed during the TF-A compilation(BL33=u-boot-nodtb.bin BL33_CFG=u-boot.dtb).
+
+     You can also update a existing it with the tools provided by TF-A:
+
+     # fiptool update --nt-fw u-boot-nodtb.bin --hw-config u-boot.dtb fip-stm32mp157c-ev1.bin
+
+      - without FIP support:
+         - FSBL = **tf-a.stm32** (provided by TF-A compilation)
+         - SSBL = **u-boot.stm32**
 
   - For Basic boot
 
@@ -299,22 +315,27 @@ Prepare an SD card
 The minimal requirements for STMP32MP15x boot up to U-Boot are:
 
 - GPT partitioning (with gdisk or with sgdisk)
-- 2 fsbl partitions, named fsbl1 and fsbl2, size at least 256KiB
-- one ssbl partition for U-Boot
+- 2 fsbl partitions, named "fsbl1" and "fsbl2", size at least 256KiB
+- one partition named "fip" for FIP or U-Boot (TF-A search the "fip"
+  partition and SPL search the 3th partition, because
+  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3)
+
+Without FIP support in TF-A, the 3rd partition "fip" for u-boot.stm32 must
+be named "ssbl".
 
 Then the minimal GPT partition is:
 
-  +-------+--------+---------+-------------+
-  | *Num* | *Name* | *Size*  | *Content*   |
-  +=======+========+=========+=============+
-  | 1     | fsbl1  | 256 KiB | TF-A or SPL |
-  +-------+--------+---------+-------------+
-  | 2     | fsbl2  | 256 KiB | TF-A or SPL |
-  +-------+--------+---------+-------------+
-  | 3     | ssbl   | enought | U-Boot      |
-  +-------+--------+---------+-------------+
-  | 4     | <any>  | <any>   | Rootfs      |
-  +-------+--------+---------+-------------+
+  +-------+--------+---------+------------------------------+
+  | *Num* | *Name* | *Size*  | *Content*                    |
+  +=======+========+=========+==============================+
+  | 1     | fsbl1  | 256 KiB | TF-A BL2 (tf-a.stm32) or SPL |
+  +-------+--------+---------+------------------------------+
+  | 2     | fsbl2  | 256 KiB | TF-A BL2 (tf-a.stm32) or SPL |
+  +-------+--------+---------+------------------------------+
+  | 3     | fip    | enough  | fip.bin or u-boot.img        |
+  +-------+--------+---------+------------------------------+
+  | 4     | <any>  | <any>   | Rootfs                       |
+  +-------+--------+---------+------------------------------+
 
 Add a 4th partition (Rootfs) marked bootable with a file extlinux.conf
 following the Generic Distribution feature (doc/README.distro for use).
@@ -324,22 +345,22 @@ According the used card reader select the correct block device
 
 In the next example, it is /dev/mmcblk0
 
-For example: with gpt table with 128 entries
+For example: with gpt table with 128 entries and 4MB fip partition
 
 a) remove previous formatting::
 
      # sgdisk -o /dev/<SD card dev>
 
-b) create minimal image::
+b) create minimal image for FIP::
 
     # sgdisk --resize-table=128 -a 1 \
     -n 1:34:545		-c 1:fsbl1 \
     -n 2:546:1057		-c 2:fsbl2 \
-    -n 3:1058:5153		-c 3:ssbl \
-    -n 4:5154:		    -c 4:rootfs \
+    -n 3:1058:9249		-c 3:fip \
+    -n 4:9250:			-c 4:rootfs -A 4:set:2 \
     -p /dev/<SD card dev>
 
-  With other partition for kernel one partition rootfs for kernel.
+   With partition 4 marked bootable (bit 2).
 
 c) copy the FSBL (2 times) and SSBL file on the correct partition.
    in this example in partition 1 to 3
@@ -356,7 +377,7 @@ c) copy the FSBL (2 times) and SSBL file on the correct partition.
 
     # dd if=tf-a.stm32 of=/dev/mmcblk0p1
     # dd if=tf-a.stm32 of=/dev/mmcblk0p2
-    # dd if=u-boot.stm32 of=/dev/mmcblk0p3
+    # dd if=fip.bin of=/dev/mmcblk0p3
 
 To boot from SD card, select BootPinMode = 1 0 1 and reset.
 
@@ -366,34 +387,41 @@ Prepare eMMC
 You can use U-Boot to copy binary in eMMC.
 
 In the next example, you need to boot from SD card and the images
-(u-boot-spl.stm32, u-boot.img for systems without CONFIG_SPL_LOAD_FIT
-or u-boot.itb for systems with CONFIG_SPL_LOAD_FIT=y) are presents on
-SD card (mmc 0) in ext4 partition 4 (bootfs).
+(tf-a.stm32, fip.bin / u-boot-spl.stm32, u-boot.img for systems without CONFIG_SPL_LOAD_FIT
+or u-boot.itb for systems with CONFIG_SPL_LOAD_FIT=y) are presents
+on SD card (mmc 0) in ext4 partition 4 (bootfs)
 
 To boot from SD card, select BootPinMode = 1 0 1 and reset.
 
 Then you update the eMMC with the next U-Boot command :
 
 a) prepare GPT on eMMC,
-   example with 2 partitions, bootfs and roots::
+   example with 3 partitions, fip, bootfs and roots::
 
-    # setenv emmc_part "name=ssbl,size=2MiB;name=bootfs,type=linux,bootable,size=64MiB;name=rootfs,type=linux,size=512"
+    # setenv emmc_part "name=fip,size=4MiB;name=bootfs,type=linux,bootable,size=64MiB;name=rootfs,type=linux,size=512"
     # gpt write mmc 1 ${emmc_part}
 
-b) copy SPL on eMMC on firts boot partition
+b) copy FSBL, TF-A or SPL, on first eMMC boot partition
    (SPL max size is 256kB, with LBA 512, 0x200)::
 
+    # ext4load mmc 0:4 0xC0000000 tf-a.stm32
+    or
     # ext4load mmc 0:4 0xC0000000 u-boot-spl.stm32
+
     # mmc dev 1
     # mmc partconf 1 1 1 1
     # mmc write ${fileaddr} 0 200
     # mmc partconf 1 1 1 0
 
-c) copy U-Boot in first GPT partition of eMMC::
+c) copy SSBL, FIP or U-Boot binary, in first GPT partition of eMMC::
 
+    # ext4load mmc 0:4 0xC0000000 fip.bin
+    or
     # ext4load mmc 0:4 0xC0000000 u-boot.img # Without CONFIG_SPL_LOAD_FIT
-      OR
-      ext4load mmc 0:4 0xC0000000 u-boot.itb # With CONFIG_SPL_LOAD_FIT=y
+    or
+    # ext4load mmc 0:4 0xC0000000 u-boot.itb # With CONFIG_SPL_LOAD_FIT=y
+
+
     # mmc dev 1
     # part start mmc 1 1 partstart
     # mmc write ${fileaddr} ${partstart} ${filesize}
@@ -526,14 +554,14 @@ On EV1 board, booting from SD card, without OP-TEE::
   dev: RAM alt: 2 name: uramdisk.image.gz layout: RAM_ADDR
   dev: eMMC alt: 3 name: mmc0_fsbl1 layout: RAW_ADDR
   dev: eMMC alt: 4 name: mmc0_fsbl2 layout: RAW_ADDR
-  dev: eMMC alt: 5 name: mmc0_ssbl layout: RAW_ADDR
+  dev: eMMC alt: 5 name: mmc0_fip layout: RAW_ADDR
   dev: eMMC alt: 6 name: mmc0_bootfs layout: RAW_ADDR
   dev: eMMC alt: 7 name: mmc0_vendorfs layout: RAW_ADDR
   dev: eMMC alt: 8 name: mmc0_rootfs layout: RAW_ADDR
   dev: eMMC alt: 9 name: mmc0_userfs layout: RAW_ADDR
   dev: eMMC alt: 10 name: mmc1_boot1 layout: RAW_ADDR
   dev: eMMC alt: 11 name: mmc1_boot2 layout: RAW_ADDR
-  dev: eMMC alt: 12 name: mmc1_ssbl layout: RAW_ADDR
+  dev: eMMC alt: 12 name: mmc1_fip layout: RAW_ADDR
   dev: eMMC alt: 13 name: mmc1_bootfs layout: RAW_ADDR
   dev: eMMC alt: 14 name: mmc1_vendorfs layout: RAW_ADDR
   dev: eMMC alt: 15 name: mmc1_rootfs layout: RAW_ADDR
@@ -554,14 +582,14 @@ All the supported device are exported for dfu-util tool::
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="mmc1_rootfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="mmc1_vendorfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="mmc1_bootfs", serial="002700333338511934383330"
-  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="mmc1_ssbl", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="mmc1_fip", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="mmc1_boot2", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="mmc1_boot1", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="mmc0_userfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="mmc0_rootfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="mmc0_vendorfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="mmc0_bootfs", serial="002700333338511934383330"
-  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="mmc0_ssbl", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="mmc0_fip", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="mmc0_fsbl2", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="mmc0_fsbl1", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
@@ -572,9 +600,9 @@ You can update the boot device:
 
 - SD card (mmc0) ::
 
-  $> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 5 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 3 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 4 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 5 -D fip-stm32mp157c-ev1.bin
   $> dfu-util -d 0483:5720 -a 6 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
   $> dfu-util -d 0483:5720 -a 7 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
   $> dfu-util -d 0483:5720 -a 8 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
@@ -582,9 +610,9 @@ You can update the boot device:
 
 - EMMC (mmc1)::
 
-  $> dfu-util -d 0483:5720 -a 10 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 11 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 12 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 10 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 11 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 12 -D fip-stm32mp157c-ev1.bin
   $> dfu-util -d 0483:5720 -a 13 -D st-image-bootfs-openstlinux-weston-stm32mp1.ext4
   $> dfu-util -d 0483:5720 -a 14 -D st-image-vendorfs-openstlinux-weston-stm32mp1.ext4
   $> dfu-util -d 0483:5720 -a 15 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
@@ -601,14 +629,14 @@ only the MTD partition on the boot devices are available, for example:
 
 - NOR (nor0 = alt 20) & NAND (nand0 = alt 26) ::
 
-  $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 23 -D fip-stm32mp157c-ev1.bin
   $> dfu-util -d 0483:5720 -a 27 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
 
 - NAND (nand0 = alt 21)::
 
-  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
-  $> dfu-util -d 0483:5720 -a 24 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1.stm32
+  $> dfu-util -d 0483:5720 -a 23 -D fip-stm32mp157c-ev1.bin
+  $> dfu-util -d 0483:5720 -a 24 -D fip-stm32mp157c-ev1.bin
   $> dfu-util -d 0483:5720 -a 25 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
