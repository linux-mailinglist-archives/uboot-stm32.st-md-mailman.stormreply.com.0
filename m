Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390F7AF8F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C83C35E04
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BBC3C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHFmSb001887; Tue, 30 Jul 2019 19:17:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uysAudFSRxEuceCiZ/U6ZBONd4zGlwM0aMTdk/QOrm0=;
 b=SXMCKdpBzv0MMsNTmmr025u6vJPExcvnS4JrLhOohhWiveODC0hyxqUl2ALr6MAoG40K
 r7nwVGgfEgZsXIKNsgIJMw8uhSnzzwtoCEl2MLCqbgOVL3qUNDSthVMJ0yRz483aYhWH
 iKhNQ9mbi7TdkWXsjvPiaj6z5D0IlzXb2PAAyJiViBwwyytN70W821sjoOrN+6ULNLQW
 abcNx6ugTI1khK8ITqvFkRFuHi78hcI6qndDcRvO4ex22d9svK8Yw4UPMQanXcnkIzWh
 ErRMSmNA5yppcYjlVn+qNK/RMYMiWHBdWjXXLFoi3hAkHQi/ZeE9x6SSyVBWPryXXzO1 OQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4actq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C93D431;
 Tue, 30 Jul 2019 17:17:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C16E3CEA01;
 Tue, 30 Jul 2019 19:17:32 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:33 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:32
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:36 +0200
Message-ID: <1564507016-16570-29-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 28/48] stm32mp1: configs: add spi load support
	in spl
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

Add the boot for NOR, SPL load U-Boot.img at offset
CONFIG_SYS_SPI_U_BOOT_OFFS = 0x80000.
It is the start address of mtd partition ssbl in nor.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig | 1 +
 include/configs/stm32mp1.h    | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 187be17..c9bc084 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -16,6 +16,7 @@ config SPL
 	select SPL_REGMAP
 	select SPL_DM_RESET
 	select SPL_SERIAL_SUPPORT
+	select SPL_SPI_LOAD
 	select SPL_SYSCON
 	select SPL_WATCHDOG_SUPPORT if WATCHDOG
 	imply BOOTSTAGE_STASH if SPL_BOOTSTAGE
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 92660fe..88f8254 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -70,6 +70,11 @@
 #define CONFIG_SYS_NAND_ONFI_DETECTION
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
+/* SPI FLASH support */
+#if defined(CONFIG_SPL_BUILD)
+#define CONFIG_SYS_SPI_U_BOOT_OFFS	0x80000
+#endif
+
 /* Ethernet need */
 #ifdef CONFIG_DWC_ETH_QOS
 #define CONFIG_SYS_NONCACHED_MEMORY	(1 * SZ_1M)	/* 1M */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
