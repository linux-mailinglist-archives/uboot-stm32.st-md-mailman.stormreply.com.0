Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931A7F7A5
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:58:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A6CC35E05
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:58:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C275CC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:58:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72CucUK006938; Fri, 2 Aug 2019 14:58:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eoNinLtLaoW5oa+LCGL5ah0+8BY6XetCWLL11bhcweE=;
 b=0+9EsdMIWUf2xomwv1lLEkV9ytVfCNss+PrL9JSBp3myOk+WekntWlZXQNO6C8JtreyN
 cYFaZRpEkuxY0WfdnWdqfYMvH/NNuzvLpcT0ZFeP1RMKuZeWP67AP9pUqcUCnWUMPl6c
 7YhHdtBC4kmORzU7eCKtxtRm1m26s9Xu4uO77M7g0MsyEto/9790MEgMclc90MCefmJ/
 V6qqeMlcsXKbkSwRyjnMksyJkbSWt1dngCRIrP++AifUPXZOcXLvGxqC29Vh1sTaxUJz
 NTYYGYZngRGYFLFGAL5r5KvtdGJqjnlgPp5ymWWoYxqDkQHeqaDgbrRpez4y2kjzYTzH Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0brag8q9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:58:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F134431;
 Fri,  2 Aug 2019 12:58:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E932D2C3272;
 Fri,  2 Aug 2019 14:58:15 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:58:15 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:58:15
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:58:10 +0200
Message-ID: <20190802125810.9808-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802125810.9808-1-patrice.chotard@st.com>
References: <20190802125810.9808-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] console: execute flush on uart when
	silent is removed
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Avoid to flush buffer when silent console is activated as the
console can be reactivate later, after relocation, when the env will
be updated with the saved one.

Solve issue (missing beginning of U-Boot trace) when:
- CONFIG_SILENT_CONSOLE is activated
- silent=1 is defined in default environment (CONFIG_EXTRA_ENV_SETTINGS)
- silent is removed in saved environment with:
      > env delete silent; env save

Only functional when PRE_CONSOLE_BUFFER is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 common/console.c | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/common/console.c b/common/console.c
index 7b45403bb3..d086feabb1 100644
--- a/common/console.c
+++ b/common/console.c
@@ -463,6 +463,11 @@ static void print_pre_console_buffer(int flushpoint)
 	char buf_out[CONFIG_PRE_CON_BUF_SZ + 1];
 	char *buf_in;
 
+#ifdef CONFIG_SILENT_CONSOLE
+	if (gd->flags & GD_FLG_SILENT)
+		return;
+#endif
+
 	buf_in = map_sysmem(CONFIG_PRE_CON_BUF_ADDR, CONFIG_PRE_CON_BUF_SZ);
 	if (gd->precon_buf_idx > CONFIG_PRE_CON_BUF_SZ)
 		in = gd->precon_buf_idx - CONFIG_PRE_CON_BUF_SZ;
@@ -511,8 +516,11 @@ void putc(const char c)
 		membuff_putbyte(&gd->console_out, c);
 #endif
 #ifdef CONFIG_SILENT_CONSOLE
-	if (gd->flags & GD_FLG_SILENT)
+	if (gd->flags & GD_FLG_SILENT) {
+		if (!(gd->flags & GD_FLG_DEVINIT))
+			pre_console_putc(c);
 		return;
+	}
 #endif
 
 #ifdef CONFIG_DISABLE_CONSOLE
@@ -559,8 +567,11 @@ void puts(const char *s)
 		membuff_put(&gd->console_out, s, strlen(s));
 #endif
 #ifdef CONFIG_SILENT_CONSOLE
-	if (gd->flags & GD_FLG_SILENT)
+	if (gd->flags & GD_FLG_SILENT) {
+		if (!(gd->flags & GD_FLG_DEVINIT))
+			pre_console_puts(s);
 		return;
+	}
 #endif
 
 #ifdef CONFIG_DISABLE_CONSOLE
@@ -720,14 +731,22 @@ int console_assign(int file, const char *devname)
 	return -1;
 }
 
-static void console_update_silent(void)
+/* return true if the 'silent' flag is removed */
+static bool console_update_silent(void)
 {
 #ifdef CONFIG_SILENT_CONSOLE
-	if (env_get("silent") != NULL)
+	if (env_get("silent")) {
 		gd->flags |= GD_FLG_SILENT;
-	else
+	} else {
+		unsigned long flags = gd->flags;
+
 		gd->flags &= ~GD_FLG_SILENT;
+
+		return !!(flags & GD_FLG_SILENT);
+	}
 #endif
+
+	return false;
 }
 
 int console_announce_r(void)
@@ -792,9 +811,13 @@ int console_init_r(void)
 #if CONFIG_IS_ENABLED(CONSOLE_MUX)
 	int iomux_err = 0;
 #endif
+	int flushpoint;
 
 	/* update silent for env loaded from flash (initr_env) */
-	console_update_silent();
+	if (console_update_silent())
+		flushpoint = PRE_CONSOLE_FLUSHPOINT1_SERIAL;
+	else
+		flushpoint = PRE_CONSOLE_FLUSHPOINT2_EVERYTHING_BUT_SERIAL;
 
 	/* set default handlers at first */
 	gd->jt->getc  = serial_getc;
@@ -872,7 +895,7 @@ done:
 	if ((stdio_devices[stdin] == NULL) && (stdio_devices[stdout] == NULL))
 		return 0;
 #endif
-	print_pre_console_buffer(PRE_CONSOLE_FLUSHPOINT2_EVERYTHING_BUT_SERIAL);
+	print_pre_console_buffer(flushpoint);
 	return 0;
 }
 
@@ -886,9 +909,13 @@ int console_init_r(void)
 	struct list_head *list = stdio_get_list();
 	struct list_head *pos;
 	struct stdio_dev *dev;
+	int flushpoint;
 
 	/* update silent for env loaded from flash (initr_env) */
-	console_update_silent();
+	if (console_update_silent())
+		flushpoint = PRE_CONSOLE_FLUSHPOINT1_SERIAL;
+	else
+		flushpoint = PRE_CONSOLE_FLUSHPOINT2_EVERYTHING_BUT_SERIAL;
 
 #ifdef CONFIG_SPLASH_SCREEN
 	/*
@@ -951,7 +978,7 @@ int console_init_r(void)
 	if ((stdio_devices[stdin] == NULL) && (stdio_devices[stdout] == NULL))
 		return 0;
 #endif
-	print_pre_console_buffer(PRE_CONSOLE_FLUSHPOINT2_EVERYTHING_BUT_SERIAL);
+	print_pre_console_buffer(flushpoint);
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
