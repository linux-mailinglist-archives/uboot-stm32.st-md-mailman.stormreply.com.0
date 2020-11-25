Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA57C2C3F15
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 12:28:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB413C424AF;
	Wed, 25 Nov 2020 11:28:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6629AC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 11:28:49 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APBSC1r025531; Wed, 25 Nov 2020 12:28:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=czT8YO7R4vjuOcr11MZjBRaP+FJP0Nwz/A30jcFU90s=;
 b=ycj7qVPZJxR6ehgMLGyuSRz+azopOPWcZp3jjau7IMxqz1WnQ4UVSPr+nXgYDpaKAGLT
 Qvfr8OID8rVHp8TA/h7q4tcFg6uS2Tc5TsJal4wPpavAw5J3F45ey+faAE9/6UqIPuB/
 tPiKRYwz5+R1Nm7T3nFTo4poTiKnvdXl4NicqATjRgd/pNkdmJH53P2OHmLqeoaseyQm
 YDZhvFlIrDsU2vi+VXslYXr9QGdf/4+pclbAoAjtHaGQZ6WiVWC3EnivUtAL0VC5Lvu7
 9uoM1gqO5UEI7yW+uL1ZOzYTgWh0boq4KWEnkBVqFHK5p6VYmg9g3MCGAxRsHB+kGK5o vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hdpgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 12:28:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD7C3100034;
 Wed, 25 Nov 2020 12:28:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3A9B238E06;
 Wed, 25 Nov 2020 12:28:47 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov 2020 12:28:47
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 25 Nov 2020 12:28:10 +0100
Message-ID: <20201125122806.1.I077eed496ea5fded723418afa845e759df8e6c9b@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_06:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: st: stm32mp1: update load address for
	FIT examples
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

Update kernel load address for FIT examples to avoid relocation:
- Kernel example uses Image.gz with U-Boot gzip decompression
  at final kernel location 0x0xC0008000.
- Copro example loads zImage at a correct location (0xC4000000),
  to avoid zImage relocation before decompression by kernel code.

An other solution to avoid zImage relocation is to align
the kernel load and entry address with the real location in FIT
(the relocation of zImage is skipped in U-Boot bootm command for
identical address) but it is less flexible because this offset
depends on FIT content:

For example:

## Loading kernel from FIT Image at c2000000 ...
   Using 'ev1' configuration
   Trying 'kernel' kernel subimage
     Description:  Linux kernel
     Created:      2020-10-22   9:08:32 UTC
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0xc20000cc

The kernel offset in FIT is 0xCC in FIT and zImage is decompressed at
0xC0008000 by kernel code:

kernel {
	description = "Linux kernel";
	data = /incbin/("zImage");
	type = "kernel";
	arch = "arm";
	os = "linux";
	compression = "none";
	load = <0xC20000cc>;
	entry = <0xC20000cc>;
	hash-1 {
		algo = "sha1";
	};
};

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/fit_copro_kernel_dtb.its | 18 ++++++++++++++++--
 board/st/stm32mp1/fit_kernel_dtb.its       |  6 +++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/board/st/stm32mp1/fit_copro_kernel_dtb.its b/board/st/stm32mp1/fit_copro_kernel_dtb.its
index 3e08fd943e..dc43639af4 100644
--- a/board/st/stm32mp1/fit_copro_kernel_dtb.its
+++ b/board/st/stm32mp1/fit_copro_kernel_dtb.its
@@ -1,6 +1,20 @@
 /*
  * Compilation:
  * mkimage -f fit_copro_kernel_dtb.its fit_copro_kernel_dtb.itb
+ *
+ * M4 firmware to load with remoteproc: rproc-m4-fw.elf
+ *
+ * Files in linux build dir:
+ * - arch/arm/boot/zImage
+ * - arch/arm/boot/dts/stm32mp157c-dk2.dtb
+ * - arch/arm/boot/dts/stm32mp157c-ev1.dtb
+ *
+ * load mmc 0:4 $kernel_addr_r fit_copro_kernel_dtb.itb
+ * bootm $kernel_addr_r
+ * bootm $kernel_addr_r#dk2
+ * bootm $kernel_addr_r#ev1
+ * bootm $kernel_addr_r#dk2-m4
+ * bootm $kernel_addr_r#ev1-m4
  */
 
 /dts-v1/;
@@ -29,8 +43,8 @@
 			arch = "arm";
 			os = "linux";
 			compression = "none";
-			load = <0xC0008000>;
-			entry = <0xC0008000>;
+			load = <0xC4000000>;
+			entry = <0xC4000000>;
 			hash-1 {
 				algo = "sha1";
 			};
diff --git a/board/st/stm32mp1/fit_kernel_dtb.its b/board/st/stm32mp1/fit_kernel_dtb.its
index 18d03ebf3c..8456a3c460 100644
--- a/board/st/stm32mp1/fit_kernel_dtb.its
+++ b/board/st/stm32mp1/fit_kernel_dtb.its
@@ -3,7 +3,7 @@
  * mkimage -f fit_kernel_dtb.its fit_kernel_dtb.itb
  *
  * Files in linux build dir:
- * - arch/arm/boot/zImage
+ * - arch/arm/boot/Image (gzipped in Image.gz)
  * - arch/arm/boot/dts/stm32mp157c-dk2.dtb
  * - arch/arm/boot/dts/stm32mp157c-ev1.dtb
  *
@@ -23,11 +23,11 @@
 	images {
 		kernel {
 			description = "Linux kernel";
-			data = /incbin/("zImage");
+			data = /incbin/("Image.gz");
 			type = "kernel";
 			arch = "arm";
 			os = "linux";
-			compression = "none";
+			compression = "gzip";
 			load = <0xC0008000>;
 			entry = <0xC0008000>;
 			hash-1 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
