Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4464F1896D0
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D306C36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C173AC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8InR1024213; Wed, 18 Mar 2020 09:23:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wTRW7Uy7e6OsPrUbQKOGSzdUNvL5ib1bcQibccONRks=;
 b=nN1gL5uB/tNAn8AJqzMt8O8Ru5DKyrUVUv8USbbt/ou3eH2+kLy1xawuF874D8cTXoGZ
 dA9U+au2YLNDKq9GSxdMYL1+/z4YvRQ41gJSQlQhaGV70Rc6obZ3QW0wmo9PLN9wUWH/
 5wPSRFltspbcQ9W7Bd3QGYdcTp8RMRYLoQbpNJCSR8DNN//aiLYYyKJsA3uLKITKFNqS
 WEFvu8ceqnr+GxpFerIjJlCHgy81aU3zt1Fgx6925ejGNOvhGYttdgh6643aAhJFKW6l
 xcDEayrDEylKWSLOO3u3mX5KZvswZIS3B3E9FqshdobrO1JJS5cN2j2AUxvKDr295wEt qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4w9su3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BB6610003A;
 Wed, 18 Mar 2020 09:23:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7851D21CA90;
 Wed, 18 Mar 2020 09:23:08 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:08 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:54 +0100
Message-ID: <20200318082254.7522-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 11/11] doc: stm32mp1: update DFU support
	example
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

Update stm32mp1 board documentation with new management of MMC and
MTD partitions and new PID df11.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/board/st/stm32mp1.rst | 115 ++++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 61 deletions(-)

diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 7fccdfbb94..41d0206d34 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -518,61 +518,49 @@ On EV1 board, booting from SD card, without OP-TEE::
   dev: RAM alt: 0 name: uImage layout: RAM_ADDR
   dev: RAM alt: 1 name: devicetree.dtb layout: RAM_ADDR
   dev: RAM alt: 2 name: uramdisk.image.gz layout: RAM_ADDR
-  dev: eMMC alt: 3 name: sdcard_fsbl1 layout: RAW_ADDR
-  dev: eMMC alt: 4 name: sdcard_fsbl2 layout: RAW_ADDR
-  dev: eMMC alt: 5 name: sdcard_ssbl layout: RAW_ADDR
-  dev: eMMC alt: 6 name: sdcard_bootfs layout: RAW_ADDR
-  dev: eMMC alt: 7 name: sdcard_vendorfs layout: RAW_ADDR
-  dev: eMMC alt: 8 name: sdcard_rootfs layout: RAW_ADDR
-  dev: eMMC alt: 9 name: sdcard_userfs layout: RAW_ADDR
-  dev: eMMC alt: 10 name: emmc_fsbl1 layout: RAW_ADDR
-  dev: eMMC alt: 11 name: emmc_fsbl2 layout: RAW_ADDR
-  dev: eMMC alt: 12 name: emmc_ssbl layout: RAW_ADDR
-  dev: eMMC alt: 13 name: emmc_bootfs layout: RAW_ADDR
-  dev: eMMC alt: 14 name: emmc_vendorfs layout: RAW_ADDR
-  dev: eMMC alt: 15 name: emmc_rootfs layout: RAW_ADDR
-  dev: eMMC alt: 16 name: emmc_userfs layout: RAW_ADDR
-  dev: MTD alt: 17 name: nor_fsbl1 layout: RAW_ADDR
-  dev: MTD alt: 18 name: nor_fsbl2 layout: RAW_ADDR
-  dev: MTD alt: 19 name: nor_ssbl layout: RAW_ADDR
-  dev: MTD alt: 20 name: nor_env layout: RAW_ADDR
-  dev: MTD alt: 21 name: nand_fsbl layout: RAW_ADDR
-  dev: MTD alt: 22 name: nand_ssbl1 layout: RAW_ADDR
-  dev: MTD alt: 23 name: nand_ssbl2 layout: RAW_ADDR
-  dev: MTD alt: 24 name: nand_UBI layout: RAW_ADDR
-  dev: VIRT alt: 25 name: OTP layout: RAW_ADDR
-  dev: VIRT alt: 26 name: PMIC layout: RAW_ADDR
+  dev: eMMC alt: 3 name: mmc0_fsbl1 layout: RAW_ADDR
+  dev: eMMC alt: 4 name: mmc0_fsbl2 layout: RAW_ADDR
+  dev: eMMC alt: 5 name: mmc0_ssbl layout: RAW_ADDR
+  dev: eMMC alt: 6 name: mmc0_bootfs layout: RAW_ADDR
+  dev: eMMC alt: 7 name: mmc0_vendorfs layout: RAW_ADDR
+  dev: eMMC alt: 8 name: mmc0_rootfs layout: RAW_ADDR
+  dev: eMMC alt: 9 name: mmc0_userfs layout: RAW_ADDR
+  dev: eMMC alt: 10 name: mmc1_boot1 layout: RAW_ADDR
+  dev: eMMC alt: 11 name: mmc1_boot2 layout: RAW_ADDR
+  dev: eMMC alt: 12 name: mmc1_ssbl layout: RAW_ADDR
+  dev: eMMC alt: 13 name: mmc1_bootfs layout: RAW_ADDR
+  dev: eMMC alt: 14 name: mmc1_vendorfs layout: RAW_ADDR
+  dev: eMMC alt: 15 name: mmc1_rootfs layout: RAW_ADDR
+  dev: eMMC alt: 16 name: mmc1_userfs layout: RAW_ADDR
+  dev: MTD alt: 17 name: nor0 layout: RAW_ADDR
+  dev: MTD alt: 18 name: nand0 layout: RAW_ADDR
+  dev: VIRT alt: 19 name: OTP layout: RAW_ADDR
+  dev: VIRT alt: 20 name: PMIC layout: RAW_ADDR
 
 All the supported device are exported for dfu-util tool::
 
   $> dfu-util -l
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=26, name="PMIC", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=25, name="OTP", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=24, name="nand_UBI", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=23, name="nand_ssbl2", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=22, name="nand_ssbl1", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="nand_fsbl", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="nor_env", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nor_ssbl", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor_fsbl2", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor_fsbl1", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="emmc_userfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="emmc_rootfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="emmc_vendorfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="emmc_bootfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="emmc_ssbl", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="emmc_fsbl2", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="emmc_fsbl1", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="sdcard_userfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="sdcard_rootfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="sdcard_vendorfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="sdcard_bootfs", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="sdcard_ssbl", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="sdcard_fsbl2", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="sdcard_fsbl1", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
-  Found DFU: [0483:5720] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="PMIC", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="OTP", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nand0", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor0", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="mmc1_userfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="mmc1_rootfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=14, name="mmc1_vendorfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=13, name="mmc1_bootfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=12, name="mmc1_ssbl", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=11, name="mmc1_boot2", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=10, name="mmc1_boot1", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=9, name="mmc0_userfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=8, name="mmc0_rootfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=7, name="mmc0_vendorfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=6, name="mmc0_bootfs", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=5, name="mmc0_ssbl", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=4, name="mmc0_fsbl2", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=3, name="mmc0_fsbl1", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=2, name="uramdisk.image.gz", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=1, name="devicetree.dtb", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=0, name="uImage", serial="002700333338511934383330"
 
 You can update the boot device:
 
@@ -596,20 +584,25 @@ You can update the boot device:
   $> dfu-util -d 0483:5720 -a 15 -D st-image-weston-openstlinux-weston-stm32mp1.ext4
   $> dfu-util -d 0483:5720 -a 16 -D st-image-userfs-openstlinux-weston-stm32mp1.ext4
 
-- NOR::
+- you can also dump the OTP and the PMIC NVM with::
+
+  $> dfu-util -d 0483:5720 -a 19 -U otp.bin
+  $> dfu-util -d 0483:5720 -a 20 -U pmic.bin
+
 
-  $> dfu-util -d 0483:5720 -a 17 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 18 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 19 -D u-boot-stm32mp157c-ev1-trusted.img
+When the board is booting for nor0 or nand0,
+only the MTD partition on the boot devices are available, for example:
 
-- NAND (UBI partition used for NAND only boot or NOR + NAND boot)::
+- NOR (nor0 = alt 20) & NAND (nand0 = alt 26) ::
 
   $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1-trusted.stm32
-  $> dfu-util -d 0483:5720 -a 22 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
   $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
-  $> dfu-util -d 0483:5720 -a 24 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
+  $> dfu-util -d 0483:5720 -a 27 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
 
-- you can also dump the OTP and the PMIC NVM with::
+- NAND (nand0 = alt 21)::
 
-  $> dfu-util -d 0483:5720 -a 25 -U otp.bin
-  $> dfu-util -d 0483:5720 -a 26 -U pmic.bin
+  $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1-trusted.stm32
+  $> dfu-util -d 0483:5720 -a 23 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 24 -D u-boot-stm32mp157c-ev1-trusted.img
+  $> dfu-util -d 0483:5720 -a 25 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
