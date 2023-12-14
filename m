Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F48136EE
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Dec 2023 17:52:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E30FBC6B45B;
	Thu, 14 Dec 2023 16:52:03 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9026C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 16:52:01 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-35f72db10f7so8484295ab.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702572720; x=1703177520;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/uX2ryKAEZBjHGs+wGhtzHYEyOmV4i0u0CTu3FfRPJE=;
 b=nraG2diTTc00mo6l6p6cQgKEL1h4zUXQM/95h1cheWLWpsqqPqG335GLsmvxuiHqp7
 hojstG5yGbVy+x9h43QID0d+8ovpFh80pPsHaQz9ct/OjS7C4zBlyubq6ZfjM11v7Igh
 59pP9O4ZocizeEGbdNCqQjuoZpGk1RQqs6pYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572720; x=1703177520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/uX2ryKAEZBjHGs+wGhtzHYEyOmV4i0u0CTu3FfRPJE=;
 b=tH3gg5U+WMBN5Ggm4pbrPSvfIDiCGNmFioWA9gvgZuBYRdO6LRu1e5N3i6KErn85Bp
 pXUkD2JupYvqDtgX3LeJCeOVhCsuej1kGDX9w7hWU4QTNJlZAzsYbXw1AdHJ+1x9p9vO
 GIegmOHHt5MZixe1CL49YR3d13AIjyBB7I83dvaAk7NIifrDVI/MUfXHWgB3KAV7jTpA
 puYgsp9Y6GkShfGIzEkcrpbAvYDIKcmlPpEASfnS2b6pVynn0L3mN/FLaSvNICzzSd3g
 JVFvaw4z1EVRfHaMOBYLpRBiNh6b3tCkbGTohDPMCKeKCV4GJfZ5yn+SgBvgNJhLesZB
 tmLA==
X-Gm-Message-State: AOJu0YxQSIrcTUa+b/uPPBtBRoV54giQgf4XjAmIpxFzmtl8H0vsIlRS
 EF9UZvY4fKP6vd3EFWDAeJ+Eng==
X-Google-Smtp-Source: AGHT+IHzb/7bmjPNYEYVVxtjXMngl3krPz1PJlxxNS5QKE+nNBlMhhc7Hpg81VfsrMPNt1u1Un4n3Q==
X-Received: by 2002:a92:c565:0:b0:35d:6997:9cb3 with SMTP id
 b5-20020a92c565000000b0035d69979cb3mr13537239ilj.52.1702572720766; 
 Thu, 14 Dec 2023 08:52:00 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a056e02338e00b00357ca1ed25esm1228347ilb.80.2023.12.14.08.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:52:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 14 Dec 2023 09:50:29 -0700
Message-ID: <20231214165112.2182274-16-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214165112.2182274-1-sjg@chromium.org>
References: <20231214165112.2182274-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 20/21] stm32: Use bootm_run() and
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
---

(no changes since v1)

 .../cmd_stm32prog/cmd_stm32prog.c             | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 8670535844d3..3ed393b7199f 100644
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
+		bmi.addr_fit = boot_addr_start;
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
