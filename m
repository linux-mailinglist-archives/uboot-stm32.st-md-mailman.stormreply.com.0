Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C938156AA
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Dec 2023 04:15:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1B65C6DD6E;
	Sat, 16 Dec 2023 03:15:27 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D389C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 03:15:26 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7b71b10391aso69903939f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 19:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702696525; x=1703301325;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYgKeQH2CXVAEdnRudWChj+hNqi+mNBzAH3qs4VLq7o=;
 b=bqfRZ4dkcEuAOirBPCp0SmEFjFNVLkQ8Fw8RHKVHX5csFThRAzTCDXs5OW9Bp4uy+2
 3PnDT03Rn+Q1AS+1D09aghRojTi1+PX6NWWV1MX/IVbfi7IyjgiaNDutw1Ovx+WgH6gr
 6nXAe9kUcQ9hBJA6bjyjpGzL4c0b+/eVlIH8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702696525; x=1703301325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DYgKeQH2CXVAEdnRudWChj+hNqi+mNBzAH3qs4VLq7o=;
 b=iXEKHEVy5HBcYdRGshFS+hQQ2q74buV+iAvPp2sb40AUHyma2bjJC5z1EL3sspvWJv
 JQyX17LVjekJiVxn1VixpEkCF2Nwuc3Hx5rFX+hq674k+LqVtuiYSAP5Bw22UDhKun/M
 OZXP7wj/WCZurchsMV59q1DEQsy+Vq8os2Kdvf6CuA+NT3ZBS75I7x7dW3PbQT+d5nCx
 xp5JgGOduYVNU2Z4NWsFATc3NHPNs36FMfRrVf4jQAUfviMH4pvp+yDPmPOzUdgUMnvW
 OJsmmWt6PkPvlB6vwcEPxMkGPWkTX58zf5rdVR1VuufocFMWtGQsdUYrAb3tRITXO2PA
 oPIg==
X-Gm-Message-State: AOJu0Yy5QmPgVLPG1Z7oDLhRYthspuo7yhszJINX0iH21D5EAVqGmi6l
 mtTgGRVPl/9upvtQJJQkA2LWENwm/g8/Op0wbsPJrA==
X-Google-Smtp-Source: AGHT+IHKUrZRcXz3/pFmEuH9f1JAKKnwnzvRm4vbwEJzWZOCnmjsn/lO9FICPBiqSMvync7kDwy8KQ==
X-Received: by 2002:a05:6e02:174a:b0:35d:695a:d318 with SMTP id
 y10-20020a056e02174a00b0035d695ad318mr13469487ill.77.1702696525657; 
 Fri, 15 Dec 2023 19:15:25 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a92ceca000000b0035f75e80d1esm542163ilq.52.2023.12.15.19.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 19:15:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Dec 2023 20:14:24 -0700
Message-ID: <20231216031446.2222362-16-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231216031446.2222362-1-sjg@chromium.org>
References: <20231216031446.2222362-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 20/22] stm32: Use bootm_run() and
	bootz_run()
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
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v3:
- Rename addr_fit to addr_img in struct bootm_info

 .../cmd_stm32prog/cmd_stm32prog.c             | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 8670535844d3..adee6e05b636 100644
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
@@ -149,15 +148,18 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		}
 
 		printf("Booting kernel at %s %s %s...\n\n\n", boot_addr_start,
-		       initrd_arg, fdt_arg);
-		bootm_argv[2] = initrd_arg;
-		bootm_argv[3] = fdt_arg;
+		       initrd_arg ?: "-", fdt_arg);
+
+		bootm_init(&bmi);
+		bmi.addr_img = boot_addr_start;
+		bmi.conf_ramdisk = initrd_arg;
+		bmi.conf_fdt = fdt_arg;
 
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
2.43.0.472.g3155946c3a-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
