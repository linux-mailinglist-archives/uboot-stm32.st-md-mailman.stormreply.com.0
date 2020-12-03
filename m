Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A3F2CD25D
	for <lists+uboot-stm32@lfdr.de>; Thu,  3 Dec 2020 10:20:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55FDEC56637;
	Thu,  3 Dec 2020 09:20:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA34C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Dec 2020 09:20:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B393GY0025837; Thu, 3 Dec 2020 10:20:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4JGAz/U3zbCyC9kXeYcfSVEG4qgPVoUOSihe0T2gVvA=;
 b=TjACAivkC7cwvlEUFfmiv3crX5moqn2Qlx/Y1HeDqcI4kssUA+dYMD+ncql4iaFLoXLt
 5Uheba7z5uOVYq5YRYsDIykyXZg+j+nKAvBZgbbCvE7E3GDhkxlKvthge2enJKie9sWf
 VTuh7vePbVyF5TB4uJOGj5xouH34ayd6Xd+M1oN7VGCTnP8j+S+rTkD+9Lfrym5YuZXx
 VqhgPtRvaJ7t2Bq0oIHO7/kYrC+Gn/oxO+qV9A3bjjY1E4wXyqXFuBOReMO2BrBQeYCy
 lkscCD/uHv+yD7zOxOPtQn3w1DCUgzFUDhdIa6a7c6rYVDdFrsZ7uNU5V/XTMGGudwI8 FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e7um3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:20:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B046710002A;
 Thu,  3 Dec 2020 10:20:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A46D023F6D5;
 Thu,  3 Dec 2020 10:20:36 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec 2020 10:20:36
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 3 Dec 2020 10:20:28 +0100
Message-ID: <20201203102027.1.Iaf4e6c8a8adfa754adbf7a27200c0bc9e9f9b363@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203092032.8124-1-patrick.delaunay@st.com>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_03:2020-12-03,
 2020-12-03 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 1/4] console: remove #ifdef CONFIG when it is
	possible
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

Remove #ifdef or #ifndef for CONFIG when it is possible to simplify
the console.c code and respect the U-Boot coding rules.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c | 149 +++++++++++++++++++----------------------------
 1 file changed, 61 insertions(+), 88 deletions(-)

diff --git a/common/console.c b/common/console.c
index c3d552bb3e..6fc3957024 100644
--- a/common/console.c
+++ b/common/console.c
@@ -44,14 +44,15 @@ static int on_console(const char *name, const char *value, enum env_op op,
 	case env_op_create:
 	case env_op_overwrite:
 
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
-		if (iomux_doenv(console, value))
-			return 1;
-#else
-		/* Try assigning specified device */
-		if (console_assign(console, value) < 0)
-			return 1;
-#endif
+		if (CONFIG_IS_ENABLED(CONSOLE_MUX)) {
+			if (iomux_doenv(console, value))
+				return 1;
+		} else {
+			/* Try assigning specified device */
+			if (console_assign(console, value) < 0)
+				return 1;
+		}
+
 		return 0;
 
 	case env_op_delete:
@@ -69,14 +70,13 @@ U_BOOT_ENV_CALLBACK(console, on_console);
 static int on_silent(const char *name, const char *value, enum env_op op,
 	int flags)
 {
-#if !CONFIG_IS_ENABLED(SILENT_CONSOLE_UPDATE_ON_SET)
-	if (flags & H_INTERACTIVE)
-		return 0;
-#endif
-#if !CONFIG_IS_ENABLED(SILENT_CONSOLE_UPDATE_ON_RELOC)
-	if ((flags & H_INTERACTIVE) == 0)
-		return 0;
-#endif
+	if (!CONFIG_IS_ENABLED(SILENT_CONSOLE_UPDATE_ON_SET))
+		if (flags & H_INTERACTIVE)
+			return 0;
+
+	if (!CONFIG_IS_ENABLED(SILENT_CONSOLE_UPDATE_ON_RELOC))
+		if ((flags & H_INTERACTIVE) == 0)
+			return 0;
 
 	if (value != NULL)
 		gd->flags |= GD_FLG_SILENT;
@@ -159,14 +159,13 @@ static bool console_dev_is_serial(struct stdio_dev *sdev)
 {
 	bool is_serial;
 
-#ifdef CONFIG_DM_SERIAL
-	if (sdev->flags & DEV_FLAGS_DM) {
+	if (IS_ENABLED(CONFIG_DM_SERIAL) && (sdev->flags & DEV_FLAGS_DM)) {
 		struct udevice *dev = sdev->priv;
 
 		is_serial = device_get_uclass_id(dev) == UCLASS_SERIAL;
-	} else
-#endif
-	is_serial = !strcmp(sdev->name, "serial");
+	} else {
+		is_serial = !strcmp(sdev->name, "serial");
+	}
 
 	return is_serial;
 }
@@ -350,13 +349,12 @@ int fgetc(int file)
 			if (console_tstc(file))
 				return console_getc(file);
 #endif
-#ifdef CONFIG_WATCHDOG
 			/*
 			 * If the watchdog must be rate-limited then it should
 			 * already be handled in board-specific code.
 			 */
-			 udelay(1);
-#endif
+			if (IS_ENABLED(CONFIG_WATCHDOG))
+				udelay(1);
 		}
 	}
 
@@ -406,10 +404,8 @@ int fprintf(int file, const char *fmt, ...)
 
 int getchar(void)
 {
-#ifdef CONFIG_DISABLE_CONSOLE
-	if (gd->flags & GD_FLG_DISABLE_CONSOLE)
+	if (IS_ENABLED(CONFIG_DISABLE_CONSOLE) && (gd->flags & GD_FLG_DISABLE_CONSOLE))
 		return 0;
-#endif
 
 	if (!gd->have_console)
 		return 0;
@@ -434,10 +430,8 @@ int getchar(void)
 
 int tstc(void)
 {
-#ifdef CONFIG_DISABLE_CONSOLE
-	if (gd->flags & GD_FLG_DISABLE_CONSOLE)
+	if (IS_ENABLED(CONFIG_DISABLE_CONSOLE) && (gd->flags & GD_FLG_DISABLE_CONSOLE))
 		return 0;
-#endif
 
 	if (!gd->have_console)
 		return 0;
@@ -485,10 +479,8 @@ static void print_pre_console_buffer(int flushpoint)
 	char buf_out[CONFIG_PRE_CON_BUF_SZ + 1];
 	char *buf_in;
 
-#ifdef CONFIG_SILENT_CONSOLE
-	if (gd->flags & GD_FLG_SILENT)
+	if (IS_ENABLED(CONFIG_SILENT_CONSOLE) && (gd->flags & GD_FLG_SILENT))
 		return;
-#endif
 
 	buf_in = map_sysmem(CONFIG_PRE_CON_BUF_ADDR, CONFIG_PRE_CON_BUF_SZ);
 	if (gd->precon_buf_idx > CONFIG_PRE_CON_BUF_SZ)
@@ -530,25 +522,20 @@ void putc(const char c)
 		return;
 	}
 #endif
-#ifdef CONFIG_DEBUG_UART
 	/* if we don't have a console yet, use the debug UART */
-	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
+	if (IS_ENABLED(CONFIG_DEBUG_UART) && !(gd->flags & GD_FLG_SERIAL_READY)) {
 		printch(c);
 		return;
 	}
-#endif
-#ifdef CONFIG_SILENT_CONSOLE
-	if (gd->flags & GD_FLG_SILENT) {
+
+	if (IS_ENABLED(CONFIG_SILENT_CONSOLE) && (gd->flags & GD_FLG_SILENT)) {
 		if (!(gd->flags & GD_FLG_DEVINIT))
 			pre_console_putc(c);
 		return;
 	}
-#endif
 
-#ifdef CONFIG_DISABLE_CONSOLE
-	if (gd->flags & GD_FLG_DISABLE_CONSOLE)
+	if (IS_ENABLED(CONFIG_DISABLE_CONSOLE) && (gd->flags & GD_FLG_DISABLE_CONSOLE))
 		return;
-#endif
 
 	if (!gd->have_console)
 		return pre_console_putc(c);
@@ -578,8 +565,8 @@ void puts(const char *s)
 		return;
 	}
 #endif
-#ifdef CONFIG_DEBUG_UART
-	if (!(gd->flags & GD_FLG_SERIAL_READY)) {
+
+	if (IS_ENABLED(CONFIG_DEBUG_UART) && !(gd->flags & GD_FLG_SERIAL_READY)) {
 		while (*s) {
 			int ch = *s++;
 
@@ -587,19 +574,15 @@ void puts(const char *s)
 		}
 		return;
 	}
-#endif
-#ifdef CONFIG_SILENT_CONSOLE
-	if (gd->flags & GD_FLG_SILENT) {
+
+	if (IS_ENABLED(CONFIG_SILENT_CONSOLE) && (gd->flags & GD_FLG_SILENT)) {
 		if (!(gd->flags & GD_FLG_DEVINIT))
 			pre_console_puts(s);
 		return;
 	}
-#endif
 
-#ifdef CONFIG_DISABLE_CONSOLE
-	if (gd->flags & GD_FLG_DISABLE_CONSOLE)
+	if (IS_ENABLED(CONFIG_DISABLE_CONSOLE) && (gd->flags & GD_FLG_DISABLE_CONSOLE))
 		return;
-#endif
 
 	if (!gd->have_console)
 		return pre_console_puts(s);
@@ -772,19 +755,19 @@ int console_assign(int file, const char *devname)
 /* return true if the 'silent' flag is removed */
 static bool console_update_silent(void)
 {
-#ifdef CONFIG_SILENT_CONSOLE
-	if (env_get("silent")) {
-		gd->flags |= GD_FLG_SILENT;
-	} else {
-		unsigned long flags = gd->flags;
+	unsigned long flags = gd->flags;
 
-		gd->flags &= ~GD_FLG_SILENT;
+	if (!IS_ENABLED(CONFIG_SILENT_CONSOLE))
+		return false;
 
-		return !!(flags & GD_FLG_SILENT);
+	if (env_get("silent")) {
+		gd->flags |= GD_FLG_SILENT;
+		return false;
 	}
-#endif
 
-	return false;
+	gd->flags &= ~GD_FLG_SILENT;
+
+	return !!(flags & GD_FLG_SILENT);
 }
 
 int console_announce_r(void)
@@ -843,12 +826,8 @@ int console_init_r(void)
 {
 	char *stdinname, *stdoutname, *stderrname;
 	struct stdio_dev *inputdev = NULL, *outputdev = NULL, *errdev = NULL;
-#ifdef CONFIG_SYS_CONSOLE_ENV_OVERWRITE
 	int i;
-#endif /* CONFIG_SYS_CONSOLE_ENV_OVERWRITE */
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
 	int iomux_err = 0;
-#endif
 	int flushpoint;
 
 	/* update silent for env loaded from flash (initr_env) */
@@ -874,14 +853,14 @@ int console_init_r(void)
 		inputdev  = search_device(DEV_FLAGS_INPUT,  stdinname);
 		outputdev = search_device(DEV_FLAGS_OUTPUT, stdoutname);
 		errdev    = search_device(DEV_FLAGS_OUTPUT, stderrname);
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
-		iomux_err = iomux_doenv(stdin, stdinname);
-		iomux_err += iomux_doenv(stdout, stdoutname);
-		iomux_err += iomux_doenv(stderr, stderrname);
-		if (!iomux_err)
-			/* Successful, so skip all the code below. */
-			goto done;
-#endif
+		if (CONFIG_IS_ENABLED(CONSOLE_MUX)) {
+			iomux_err = iomux_doenv(stdin, stdinname);
+			iomux_err += iomux_doenv(stdout, stdoutname);
+			iomux_err += iomux_doenv(stderr, stderrname);
+			if (!iomux_err)
+				/* Successful, so skip all the code below. */
+				goto done;
+		}
 	}
 	/* if the devices are overwritten or not found, use default device */
 	if (inputdev == NULL) {
@@ -907,25 +886,22 @@ int console_init_r(void)
 		console_doenv(stdin, inputdev);
 	}
 
-#if CONFIG_IS_ENABLED(CONSOLE_MUX)
 done:
-#endif
 
-#ifndef CONFIG_SYS_CONSOLE_INFO_QUIET
-	stdio_print_current_devices();
-#endif /* CONFIG_SYS_CONSOLE_INFO_QUIET */
+	if (!IS_ENABLED(CONFIG_SYS_CONSOLE_INFO_QUIET))
+		stdio_print_current_devices();
+
 #ifdef CONFIG_VIDCONSOLE_AS_LCD
 	if (strstr(stdoutname, CONFIG_VIDCONSOLE_AS_NAME))
 		printf("Warning: Please change '%s' to 'vidconsole' in stdout/stderr environment vars\n",
 		       CONFIG_VIDCONSOLE_AS_NAME);
 #endif
 
-#ifdef CONFIG_SYS_CONSOLE_ENV_OVERWRITE
-	/* set the environment variables (will overwrite previous env settings) */
-	for (i = 0; i < MAX_FILES; i++) {
-		env_set(stdio_names[i], stdio_devices[i]->name);
+	if (IS_ENABLED(CONFIG_SYS_CONSOLE_ENV_OVERWRITE)) {
+		/* set the environment variables (will overwrite previous env settings) */
+		for (i = 0; i < MAX_FILES; i++)
+			env_set(stdio_names[i], stdio_devices[i]->name);
 	}
-#endif /* CONFIG_SYS_CONSOLE_ENV_OVERWRITE */
 
 	gd->flags |= GD_FLG_DEVINIT;	/* device initialization completed */
 
@@ -956,18 +932,16 @@ int console_init_r(void)
 	else
 		flushpoint = PRE_CONSOLE_FLUSHPOINT2_EVERYTHING_BUT_SERIAL;
 
-#ifdef CONFIG_SPLASH_SCREEN
 	/*
 	 * suppress all output if splash screen is enabled and we have
 	 * a bmp to display. We redirect the output from frame buffer
 	 * console to serial console in this case or suppress it if
 	 * "silent" mode was requested.
 	 */
-	if (env_get("splashimage") != NULL) {
+	if (IS_ENABLED(CONFIG_SPLASH_SCREEN) && env_get("splashimage")) {
 		if (!(gd->flags & GD_FLG_SILENT))
 			outputdev = search_device (DEV_FLAGS_OUTPUT, "serial");
 	}
-#endif
 
 	/* Scan devices looking for input and output devices */
 	list_for_each(pos, list) {
@@ -1001,9 +975,8 @@ int console_init_r(void)
 #endif
 	}
 
-#ifndef CONFIG_SYS_CONSOLE_INFO_QUIET
-	stdio_print_current_devices();
-#endif /* CONFIG_SYS_CONSOLE_INFO_QUIET */
+	if (!IS_ENABLED(CONFIG_SYS_CONSOLE_INFO_QUIET))
+		stdio_print_current_devices();
 
 	/* Setting environment variables */
 	for (i = 0; i < MAX_FILES; i++) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
