Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4615731C
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 11:54:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A83C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 10:54:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A526C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 10:54:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AArlrR021120; Mon, 10 Feb 2020 11:54:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vbE6cBvdXwjmZvYmRzXS4EuGoTJq4Imkjp8fjiTETdg=;
 b=yQjVObaFcDfDBgHXMWL7Chv0xo0XG3f3BAfqF6o0x7XaAfHZESrHjdAxIMOilxNKQB0q
 hdFnl+3BkciR4rhy+SbqVDpijGu58QPxh6WmzNSC+pLktHNpFwG+OFj5CMku+O4MPMID
 AhnIrudd1CphlkdxA5hzUYRdzmZXD6pbsO52eHyXBl4DuRBzademw/XFlIShFxcxIyIg
 c7pARWz2B1t4Y2Y1+1ZaKuNfdx/tsJ+XTp+1FnKHM+9Izd7lyYlNyNLaeP+WjqaxLnb4
 HuDwY2/dHWDVzSwS8SZmorGyN+nW3vABCALDuQmo7O3IrmkrqgfeEg4MsWM0JHi7qvMl zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvd10jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 11:54:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AB6610002A;
 Mon, 10 Feb 2020 11:54:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D9162D3783;
 Mon, 10 Feb 2020 11:54:13 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Feb 2020 11:54:12 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Feb 2020 11:54:11 +0100
Message-ID: <20200210115346.1.I82bc82f60e739674bce1015b8a7906d3852f0b93@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_02:2020-02-10,
 2020-02-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: remove fdt_high and initrd_high in
	environment
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

Remove fdt_high and initrd_high (set to 0xffffffff) in stm32mp1 board
enviromnent, and U-Boot always relocate FDT and initrd in bootm command.

This relocation is limited by CONFIG_SYS_BOOTMAPSZ which indicates
the size of the memory region where it is safe to place data passed
to the Linux kernel (DTB, initrd), it is
a) Less than or equal to RAM size.
b) not within the kernel's highmem region

So 256M seems large enough in most circumstances and users
can override this value via environment variable "bootm_mapsize"
if needed.

This modification increases the boot time but avoid assumption
on aligned address for bootm command.

A user can still define this variables themselves if the FDT or
initrd is either left in-place or copied to a specific location.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/configs/stm32mp1.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index a66534e027..42717c167e 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -43,8 +43,14 @@
 #define CONFIG_SETUP_MEMORY_TAGS
 #define CONFIG_INITRD_TAG
 
+/*
+ * For booting Linux, use the first 256 MB of memory, since this is
+ * the maximum mapped by the Linux kernel during initialization.
+ */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_256M
+
 /* Extend size of kernel image for uncompression */
-#define CONFIG_SYS_BOOTM_LEN			SZ_32M
+#define CONFIG_SYS_BOOTM_LEN		SZ_32M
 
 /* SPL support */
 #ifdef CONFIG_SPL
@@ -215,8 +221,6 @@
 	"pxefile_addr_r=0xc4200000\0" \
 	"splashimage=0xc4300000\0"  \
 	"ramdisk_addr_r=0xc4400000\0" \
-	"fdt_high=0xffffffff\0" \
-	"initrd_high=0xffffffff\0" \
 	"altbootcmd=run bootcmd\0" \
 	"env_default=1\0" \
 	"env_check=if test $env_default -eq 1;"\
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
