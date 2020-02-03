Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF11507E0
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 15:01:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E03AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Feb 2020 14:01:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3768CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 14:01:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013DvPC5019463; Mon, 3 Feb 2020 15:01:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vny6Cwqx/P2rVRrShDWOH48fGpuAYMLFxJSMaoz6vlg=;
 b=Q8spo8xtLCmuyfDhETOR1q2Wv1bCUQpF9WcPwkj43NEuesMYT1a0lTKtsYxtAHZNvEZg
 pB3QBl073l1+TGSYe0wZ1bLd+Wa+EYlV9AS5q8c7C5Gm2zSCKfcE8z8NFXUKL5IpePLa
 Flh/kn3upQrNd5Pye0Ivx/ddXlYE9zQrm0NMBU+w6l703gxR3k1If5kufYulfEq3oe3i
 risaaX0/MJ9dUc4iEHSYA76ZwdQQpzZAZll8EHqPFyA8ipY5yAgVy6GJ2oKQd9bRTpkD
 pR/YEsMCAwEn/nPNIONtzbiYApGnLeRtqIRBUEwV7XFYJP7K6PL2fwUQvNTTiMggPBQK hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13nhar8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 15:01:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 162FB10002A;
 Mon,  3 Feb 2020 15:01:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEB1021FEBC;
 Mon,  3 Feb 2020 15:01:04 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 3 Feb 2020 15:01:04 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 3 Feb 2020 15:00:59 +0100
Message-ID: <20200203140059.2111-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_04:2020-02-02,
 2020-02-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: stih410-b2260: remove fdt_high and
	initrd_high
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

Remove fdt_high and initrd_high as they shouldn't be used,
this allows the fdt and initrd relocation.
This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the
amount of memory available to contain kernel, device tree
and initrd for relocation.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 include/configs/stih410-b2260.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index a8a58f3950..f393aa0264 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -19,6 +19,12 @@
 
 /* Environment */
 
+/*
+ * For booting Linux, use the first 256 MB of memory, since this is
+ * the maximum mapped by the Linux kernel during initialization.
+ */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_256M
+
 #define CONFIG_LOADADDR			CONFIG_SYS_LOAD_ADDR
 #define CONFIG_SYS_BOOTM_LEN		SZ_16M
 
@@ -34,8 +40,6 @@
 			"fdt_addr_r=0x47000000\0"		\
 			"scriptaddr=0x50000000\0"		\
 			"pxefile_addr_r=0x50100000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			"ramdisk_addr_r=0x48000000\0"		\
 			BOOTENV
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
