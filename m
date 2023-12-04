Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D45802959
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Dec 2023 01:28:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64D57C6C855;
	Mon,  4 Dec 2023 00:28:12 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9EBFC6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 00:28:10 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3580b94ac2eso25398655ab.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Dec 2023 16:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701649689; x=1702254489;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gLWADOrfHXcAzYEtRQwlAeLOyma+RyeNI3tmAGyRmI=;
 b=DaGjTUusch/opNWSxGf6IeMXjXbzCbEP6lWvjUehQfjXq5dU5BbNaSlYVn8CsuVbOc
 ej5dFSxlceg0z+7AaNQDhoBMSSsNaj7r4uud3Ywls91NLWC52VDXwoE7ZybBTm1Wo8vm
 WRNfqJ204mm6b1eiigprRruGtlK8x3LSi4bKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649689; x=1702254489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gLWADOrfHXcAzYEtRQwlAeLOyma+RyeNI3tmAGyRmI=;
 b=XYIoYCYA9E+Z/1qnQlnfCN/KBBewcWRFApjAXAqju9dpvbNWji4u5ypKNGxQmrV3fw
 QQf0/8fNoMLqzEVt3A8fEn6v7e2TUn1xCt0IOorcfsKBAyZeYYY++mR8/wES1TZJVlBG
 998mgkh9O8IFwH1vVzkR8F1ZLmkGJZmFq8eWx6n1Mdrt3gt3BRBO/Bx5fJVFHuXIPn0l
 aS4SxbqfOQCanQW0Kc/oucoyfQjvXsMz4BsLaRCLg4lzCcY3Iw5iaC3zNebzofDtIkHE
 Mt7Pr2YzfwzneChXnC27KleOSBe+iVEIAHpYNSs9bI/76saQfTsuOJVbUMzMxQhpJYib
 tn+Q==
X-Gm-Message-State: AOJu0YwYXjwcf06LZFmH8sdybxAh7sczRNlPbtXoIrLR0crzobAv8WBI
 wqep7I5ybs1LxGS7jrXlFStO7A==
X-Google-Smtp-Source: AGHT+IGCWdKj5fFSAM964PgqQjU395ovvczHlYeuuT2k4NrA5Mps/FmxeCJQl+wPhBlGgdu7O0X4Qw==
X-Received: by 2002:a92:c103:0:b0:35d:59a2:2da with SMTP id
 p3-20020a92c103000000b0035d59a202damr4154533ile.122.1701649689660; 
 Sun, 03 Dec 2023 16:28:09 -0800 (PST)
Received: from sjg1.roam.corp.google.com ([202.144.206.254])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902904500b001cfb971edfasm7097227plz.205.2023.12.03.16.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:28:09 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  3 Dec 2023 17:26:33 -0700
Message-ID: <20231204002642.895926-11-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204002642.895926-1-sjg@chromium.org>
References: <20231204002642.895926-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 17/18] stm32: Use bootm_run() and bootz_run()
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

Use the new bootm/z_run() functions to avoid having to create an
argument list for the stm32prog code.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../cmd_stm32prog/cmd_stm32prog.c             | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 8670535844d3..5e1dc7a03810 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <bootm.h>
 #include <command.h>
 #include <dfu.h>
 #include <image.h>
@@ -125,12 +126,10 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		char dtb_addr[20];
 		char initrd_addr[40];
 		char *fdt_arg, *initrd_arg;
-		char *bootm_argv[5] = {
-			"bootm", boot_addr_start,
-		};
 		const void *uimage = (void *)data->uimage;
 		const void *dtb = (void *)data->dtb;
 		const void *initrd = (void *)data->initrd;
+		struct bootm_info bmi;
 
 		fdt_arg = dtb_addr;
 		if (!dtb)
@@ -141,7 +140,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
 			 "0x%p", uimage);
 
-		initrd_arg = "-";
+		initrd_arg = NULL;
 		if (initrd) {
 			snprintf(initrd_addr, sizeof(initrd_addr) - 1,
 				 "0x%p:0x%zx", initrd, data->initrd_size);
@@ -149,15 +148,20 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		}
 
 		printf("Booting kernel at %s %s %s...\n\n\n", boot_addr_start,
-		       initrd_arg, fdt_arg);
-		bootm_argv[2] = initrd_arg;
-		bootm_argv[3] = fdt_arg;
+		       initrd_arg ?: "-", fdt_arg);
+
+		memset(&bmi, '\0', sizeof(bmi));
+		bmi.addr_fit = boot_addr_start;
+		bmi.conf_ramdisk = initrd_arg;
+		bmi.conf_fdt = fdt_arg;
+		bmi.boot_progress = true;
+		bmi.images = &images;
 
 		/* Try bootm for legacy and FIT format image */
 		if (genimg_get_format(uimage) != IMAGE_FORMAT_INVALID)
-			do_bootm(cmdtp, 0, 4, bootm_argv);
+			bootm_run(&bmi);
 		else if (IS_ENABLED(CONFIG_CMD_BOOTZ))
-			do_bootz(cmdtp, 0, 4, bootm_argv);
+			bootz_run(&bmi);
 	}
 	if (data->script)
 		cmd_source_script(data->script, NULL, NULL);
-- 
2.43.0.rc2.451.g8631bc7472-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
