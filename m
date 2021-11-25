Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD0D45D87B
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Nov 2021 11:54:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D365C597BB;
	Thu, 25 Nov 2021 10:54:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C59CC58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 10:54:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AP8YrQ4029139;
 Thu, 25 Nov 2021 11:54:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=l2BWmLFqw7YCK11GvTkHy4OVI+emnhgGK2gHlWnqOfA=;
 b=IjXxDoKYktKPQUp3Vib9RjWcp5rmY4QQf1lrLRsZVPxmfnuLbzUneoTOrRwh4dLITJVt
 0qAlz9xrUjGOJ+OSh16PGTwCjwKtuQpDSBokfEEWQQSzg0PuLZZOMgyP1Att0LJ9lArv
 LsGuZy4FCb3ZkHFpLkSiGOF89YgPEGg+mIxIa478Dps9v7QopnUn7aMXvZ6b1WIzRs32
 fOemqzbb8npscQuRSnMIwA6BnZlhO3dKlPlBYwEgS9kCduvbgBT2arR1wX1eOTehcUev
 LxaDKn5FkpukbQ3M4mZsXaBIR3WK9JCuCbaVfw+df1VRYRIJ1gy9yFOVuEPwiIl3BIcn BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cj24vb0ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 11:54:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14C7A10002A;
 Thu, 25 Nov 2021 11:54:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD28B21FEA1;
 Thu, 25 Nov 2021 11:54:56 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 25 Nov 2021 11:54:56
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Nov 2021 11:54:53 +0100
Message-ID: <20211125115446.1.Ic1fdd2e3e93f46712542022a2e40d0321f27bf04@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_04,2021-11-25_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: add support of nor1 device
	in dfu command
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

Add support of mtd backend for nor1 when this device is present on the
board, on STM32MP157C-EV1 for example, as the support of several MTD
spi-nor instance are now supported with commit b7f060565e31 ("mtd:
spi-nor: allow registering multiple MTDs when DM is enabled").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/common/stm32mp_dfu.c |  4 ++++
 doc/board/st/stm32mp1.rst     | 18 ++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 00d1fb8f59..a3f0da5b5b 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -132,6 +132,10 @@ void set_dfu_alt_info(char *interface, char *devstr)
 			mtd = get_mtd_device_nm("nor0");
 			if (!IS_ERR_OR_NULL(mtd))
 				board_get_alt_info_mtd(mtd, buf);
+
+			mtd = get_mtd_device_nm("nor1");
+			if (!IS_ERR_OR_NULL(mtd))
+				board_get_alt_info_mtd(mtd, buf);
 		}
 
 		mtd = get_mtd_device_nm("nand0");
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 42bb94148d..0c5d3a90f0 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -645,16 +645,18 @@ On EV1 board, booting from SD card, without OP-TEE_::
   dev: eMMC alt: 15 name: mmc1_rootfs layout: RAW_ADDR
   dev: eMMC alt: 16 name: mmc1_userfs layout: RAW_ADDR
   dev: MTD alt: 17 name: nor0 layout: RAW_ADDR
-  dev: MTD alt: 18 name: nand0 layout: RAW_ADDR
-  dev: VIRT alt: 19 name: OTP layout: RAW_ADDR
-  dev: VIRT alt: 20 name: PMIC layout: RAW_ADDR
+  dev: MTD alt: 18 name: nor1 layout: RAW_ADDR
+  dev: MTD alt: 19 name: nand0 layout: RAW_ADDR
+  dev: VIRT alt: 20 name: OTP layout: RAW_ADDR
+  dev: VIRT alt: 21 name: PMIC layout: RAW_ADDR
 
 All the supported device are exported for dfu-util tool::
 
   $> dfu-util -l
-  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="PMIC", serial="002700333338511934383330"
-  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="OTP", serial="002700333338511934383330"
-  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nand0", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=21, name="PMIC", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=20, name="OTP", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=19, name="nand0", serial="002700333338511934383330"
+  Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=18, name="nor1", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=17, name="nor0", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=16, name="mmc1_userfs", serial="002700333338511934383330"
   Found DFU: [0483:df11] ver=9999, devnum=99, cfg=1, intf=0, alt=15, name="mmc1_rootfs", serial="002700333338511934383330"
@@ -705,12 +707,12 @@ You can update the boot device:
 When the board is booting for nor0 or nand0,
 only the MTD partition on the boot devices are available, for example:
 
-- NOR (nor0 = alt 20) & NAND (nand0 = alt 26) ::
+- NOR (nor0 = alt 20, nor1 = alt 26) & NAND (nand0 = alt 27) :
 
   $> dfu-util -d 0483:5720 -a 21 -D tf-a-stm32mp157c-ev1.stm32
   $> dfu-util -d 0483:5720 -a 22 -D tf-a-stm32mp157c-ev1.stm32
   $> dfu-util -d 0483:5720 -a 23 -D fip-stm32mp157c-ev1.bin
-  $> dfu-util -d 0483:5720 -a 27 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
+  $> dfu-util -d 0483:5720 -a 28 -D st-image-weston-openstlinux-weston-stm32mp1_nand_4_256_multivolume.ubi
 
 - NAND (nand0 = alt 21)::
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
