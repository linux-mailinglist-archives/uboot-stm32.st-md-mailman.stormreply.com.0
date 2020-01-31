Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3214EEA1
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 15:40:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD9BC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 14:40:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5601AC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 14:40:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VEMjIq014201
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=deWBddOWRNgKQs0XXnZZGzKBTMPV+OWSa03v+gCZuHs=;
 b=Txn3Kjkq7U4mRF5otzQsI2usSlvkZ+EXHCB3QBJlZ4zzCXmx3uXSGaIcWDGDvIjY9z/6
 o8uKOsvWFUL//vzeOb8b7lj4pSMBjmUwGEcN93MuLJzD5AbcgjZtz+0xMltO1ExGur/6
 PUd30Gk3Xpefz3tjsgpqIUyt9j5lSoURkLWBSeSr7BOW175JtESvkpC7u3XyIJWKBT12
 0SItWn+4Gi1yiUqmWt15L5JSWACKf12h2xfL8mWXRkKYUTdNHNYqOFrVXaoJKO2KxqS1
 QiPsdPbMPMIPjlYlahpJ/JNv1XbEEoYdeO/F7/euQG+xiTe5VgkLsQJVD56NUQy1EqqR dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc13pdum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8472A10002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F6632BF9CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:08 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jan 2020 15:40:08 +0100
From: <patrice.chotard@st.com>
To: <patrice.chotard@st.com>, <alexandre.torgue@st.com>,
 <loic.pallardy@st.com>, <benjamin.gaignard@st.com>,
 <gerald.baeza@st.com>, <kamel.kholti@st.com>
Date: Fri, 31 Jan 2020 15:40:02 +0100
Message-ID: <20200131144004.3396-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131144004.3396-1-patrice.chotard@st.com>
References: <20200131144004.3396-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [U-BOOT INTERNAL REVIEW][PATCH 1/3] board:
	stih410-b2260: remove fdt_high and initrd_high
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

From: Patrice Chotard <patrice.chotard@st.com>

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
