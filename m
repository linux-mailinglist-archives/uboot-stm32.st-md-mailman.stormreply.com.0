Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 654BA3FFBDB
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 10:25:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B00C58D58;
	Fri,  3 Sep 2021 08:25:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18520C06B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 08:25:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18377KiG029781;
 Fri, 3 Sep 2021 10:24:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9JeaeHv19ys2TCmAfs4mADgSvX7fh2CzdHR+vJhW8NI=;
 b=LfT+ADC+1FIc51ZcVftAvJ0BR79hx3Xj9YDGqWSd5FOmHZx6nDIpA/61dgYFW2C83uVp
 fLptcq0Ns0kDvMBI+noGDGreHViUxyBP/CSheYabJdLF9S98xfb5Mv0syVltafrCQ66t
 b3tIgON1aLfdLgdSqygSwmUNlFk+teEWcegcq84Sk9HRSvzjXoUFe4HOOW+dEoQAH+o8
 7lAujHSN3dzgwyYwJfc15+0onXUtJUT0gusyVkbUKAjshXBE9pAmWP8Dcx2P3WnFD9es
 y6PPfpsdIIJmKpdv3gmw79Jxc8orRXchw36rw2NDt2KBMqGoGXCwQtptee8PgXxlijk7 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3auf1r0g57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:24:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27DC710002A;
 Fri,  3 Sep 2021 10:24:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3D82216ECE;
 Fri,  3 Sep 2021 10:24:45 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep 2021 10:24:45
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Sep 2021 10:24:39 +0200
Message-ID: <20210903102331.1.If60c46be1f9a6ba3b7ad548fda51ef631f3a33b2@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] arm: use CONFIG_SUPPORT_PASSING_ATAGS
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

Simplify the bootm and the spl code by using the new config
CONFIG_SUPPORT_PASSING_ATAGS.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch depends of Tom Rini patch [1] for CONFIG_SUPPORT_PASSING_ATAGS
addition.

[1] "arm: Disable ATAGs support"
https://patchwork.ozlabs.org/project/uboot/patch/20210830131632.18780-3-trini@konsulko.com/
     sent in the patch-set
https://patchwork.ozlabs.org/project/uboot/list/?series=260161&state=*

Patrick

 arch/arm/include/asm/bootm.h   |  6 +-----
 arch/nds32/include/asm/bootm.h |  6 +-----
 arch/nds32/lib/bootm.c         | 22 +++++-----------------
 cmd/spl.c                      |  6 +-----
 4 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/arch/arm/include/asm/bootm.h b/arch/arm/include/asm/bootm.h
index 27f183b93d..439e43c2d0 100644
--- a/arch/arm/include/asm/bootm.h
+++ b/arch/arm/include/asm/bootm.h
@@ -10,11 +10,7 @@
 
 extern void udc_disconnect(void);
 
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-		defined(CONFIG_CMDLINE_TAG) || \
-		defined(CONFIG_INITRD_TAG) || \
-		defined(CONFIG_SERIAL_TAG) || \
-		defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 # define BOOTM_ENABLE_TAGS		1
 #else
 # define BOOTM_ENABLE_TAGS		0
diff --git a/arch/nds32/include/asm/bootm.h b/arch/nds32/include/asm/bootm.h
index 804f8581b6..c956fdd49c 100644
--- a/arch/nds32/include/asm/bootm.h
+++ b/arch/nds32/include/asm/bootm.h
@@ -12,11 +12,7 @@
 
 extern void udc_disconnect(void);
 
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-		defined(CONFIG_CMDLINE_TAG) || \
-		defined(CONFIG_INITRD_TAG) || \
-		defined(CONFIG_SERIAL_TAG) || \
-		defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 # define BOOTM_ENABLE_TAGS		1
 #else
 # define BOOTM_ENABLE_TAGS		0
diff --git a/arch/nds32/lib/bootm.c b/arch/nds32/lib/bootm.c
index 4cb0f530ae..ee0c2bc1a3 100644
--- a/arch/nds32/lib/bootm.c
+++ b/arch/nds32/lib/bootm.c
@@ -19,11 +19,7 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-	defined(CONFIG_CMDLINE_TAG) || \
-	defined(CONFIG_INITRD_TAG) || \
-	defined(CONFIG_SERIAL_TAG) || \
-	defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 static void setup_start_tag(struct bd_info *bd);
 
 # ifdef CONFIG_SETUP_MEMORY_TAGS
@@ -38,7 +34,7 @@ static void setup_initrd_tag(struct bd_info *bd, ulong initrd_start,
 static void setup_end_tag(struct bd_info *bd);
 
 static struct tag *params;
-#endif /* CONFIG_SETUP_MEMORY_TAGS || CONFIG_CMDLINE_TAG || CONFIG_INITRD_TAG */
+#endif /* CONFIG_SUPPORT_PASSING_ATAGS */
 
 int do_bootm_linux(int flag, int argc, char *argv[], bootm_headers_t *images)
 {
@@ -82,11 +78,7 @@ int do_bootm_linux(int flag, int argc, char *argv[], bootm_headers_t *images)
 		}
 #endif
 	} else if (BOOTM_ENABLE_TAGS) {
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-	defined(CONFIG_CMDLINE_TAG) || \
-	defined(CONFIG_INITRD_TAG) || \
-	defined(CONFIG_SERIAL_TAG) || \
-	defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 	setup_start_tag(bd);
 #ifdef CONFIG_SERIAL_TAG
 	setup_serial_tag(&params);
@@ -127,11 +119,7 @@ int do_bootm_linux(int flag, int argc, char *argv[], bootm_headers_t *images)
 	return 1;
 }
 
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-	defined(CONFIG_CMDLINE_TAG) || \
-	defined(CONFIG_INITRD_TAG) || \
-	defined(CONFIG_SERIAL_TAG) || \
-	defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 static void setup_start_tag(struct bd_info *bd)
 {
 	params = (struct tag *)bd->bi_boot_params;
@@ -244,4 +232,4 @@ static void setup_end_tag(struct bd_info *bd)
 	params->hdr.size = 0;
 }
 
-#endif /* CONFIG_SETUP_MEMORY_TAGS || CONFIG_CMDLINE_TAG || CONFIG_INITRD_TAG */
+#endif /* CONFIG_SUPPORT_PASSING_ATAGS */
diff --git a/cmd/spl.c b/cmd/spl.c
index 472703f8fe..8a2ded72be 100644
--- a/cmd/spl.c
+++ b/cmd/spl.c
@@ -32,11 +32,7 @@ static const char **subcmd_list[] = {
 		NULL,
 	},
 	[SPL_EXPORT_ATAGS] = (const char * []) {
-#if defined(CONFIG_SETUP_MEMORY_TAGS) || \
-	defined(CONFIG_CMDLINE_TAG) || \
-	defined(CONFIG_INITRD_TAG) || \
-	defined(CONFIG_SERIAL_TAG) || \
-	defined(CONFIG_REVISION_TAG)
+#ifdef CONFIG_SUPPORT_PASSING_ATAGS
 		"start",
 		"loados",
 #ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
