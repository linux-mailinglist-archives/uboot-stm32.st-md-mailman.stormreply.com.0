Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F4802958
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Dec 2023 01:28:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A9FBC6C855;
	Mon,  4 Dec 2023 00:28:05 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B076C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 00:28:03 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1cff3a03dfaso10276115ad.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Dec 2023 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701649682; x=1702254482;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eK35CQalW7MnpKH6mPPnTIV7JJHS3ueLB43Cx4cqA28=;
 b=kgAxf1CS7TXana8EZlPbey4YAoxMze/9KrZzTl68TpVUlBbe14JgygkGeJgC00hb0L
 DV9B+JX8LEwemHSP+AG/BTqirA723WqvZA9R75oUp2n/+7DNOclOem0Svbuqg73a8mx2
 MzmdqAyHrry2vg+E2K+HU6LarV1t4+TtyfDt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649682; x=1702254482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eK35CQalW7MnpKH6mPPnTIV7JJHS3ueLB43Cx4cqA28=;
 b=AyR264Xd6zlhqC2QzPgO4pJcxWBIIJIipP1pXKUbXAks4ixJDaK+n8LtCfSIHXyRuV
 K1VBZ8FigDl6UPuEAujjQRRkWKguU+ZdTtN/LFSK3gkg9oZ6kUPxGfON+RyYfAPO0KPi
 /4eUFVVEAi4zB/jvZvkv8l2dLhKWWw9oxCG8+kUYfTh56TLfMxqOL/j01M9r/atIKCWj
 TDCZMGB5W868KeNKu5ErJ8jqN4Y44DK88Q21dsbQWm+PC4mKMREm2t8jvJ6ydzOSDE/L
 IdGIfboF5IUcZuYncPIhYa7bFscceri+K8J5/p1xW6pxNC3Ow0fvr/o0Zqo+KdLPQOTm
 a1tA==
X-Gm-Message-State: AOJu0Yyb37aRb6+3/XXXTl6OY8EamJDNi05CPaTM8sRKKphZqNG81BIX
 2q/uWpVeLmzpIpjgoTAHDES1O3DQPmdiA18VgsC8gw==
X-Google-Smtp-Source: AGHT+IG7xy5xCf5TDpw3+AAPTbsWLsDcfncZlh8LyR0uteGHLEcDe3++KBg7xk8fVM4JraLM2pohdA==
X-Received: by 2002:a17:903:2308:b0:1ce:6312:5373 with SMTP id
 d8-20020a170903230800b001ce63125373mr837085plh.0.1701649682145; 
 Sun, 03 Dec 2023 16:28:02 -0800 (PST)
Received: from sjg1.roam.corp.google.com ([202.144.206.254])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902904500b001cfb971edfasm7097227plz.205.2023.12.03.16.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:28:01 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  3 Dec 2023 17:26:31 -0700
Message-ID: <20231204002642.895926-9-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204002642.895926-1-sjg@chromium.org>
References: <20231204002642.895926-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 15/18] stm32: Use local vars in stm32prog for
	initrd and fdt
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

Rather than assigning to the bootm_argv[] array multiple times, use
local variables for the two things that can change and assign them at
the end.

This makes it easier to drop the array eventually.

Tidu up an overly short line while we are here.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 .../cmd_stm32prog/cmd_stm32prog.c             | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 2411bcf06d8f..8670535844d3 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -124,30 +124,35 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 		char boot_addr_start[20];
 		char dtb_addr[20];
 		char initrd_addr[40];
+		char *fdt_arg, *initrd_arg;
 		char *bootm_argv[5] = {
-			"bootm", boot_addr_start, "-", dtb_addr, NULL
+			"bootm", boot_addr_start,
 		};
 		const void *uimage = (void *)data->uimage;
 		const void *dtb = (void *)data->dtb;
 		const void *initrd = (void *)data->initrd;
 
+		fdt_arg = dtb_addr;
 		if (!dtb)
-			bootm_argv[3] = env_get("fdtcontroladdr");
+			fdt_arg = env_get("fdtcontroladdr");
 		else
-			snprintf(dtb_addr, sizeof(dtb_addr) - 1,
-				 "0x%p", dtb);
+			snprintf(dtb_addr, sizeof(dtb_addr) - 1, "0x%p", dtb);
 
 		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
 			 "0x%p", uimage);
 
+		initrd_arg = "-";
 		if (initrd) {
-			snprintf(initrd_addr, sizeof(initrd_addr) - 1, "0x%p:0x%zx",
-				 initrd, data->initrd_size);
-			bootm_argv[2] = initrd_addr;
+			snprintf(initrd_addr, sizeof(initrd_addr) - 1,
+				 "0x%p:0x%zx", initrd, data->initrd_size);
+			initrd_arg = initrd_addr;
 		}
 
-		printf("Booting kernel at %s %s %s...\n\n\n",
-		       boot_addr_start, bootm_argv[2], bootm_argv[3]);
+		printf("Booting kernel at %s %s %s...\n\n\n", boot_addr_start,
+		       initrd_arg, fdt_arg);
+		bootm_argv[2] = initrd_arg;
+		bootm_argv[3] = fdt_arg;
+
 		/* Try bootm for legacy and FIT format image */
 		if (genimg_get_format(uimage) != IMAGE_FORMAT_INVALID)
 			do_bootm(cmdtp, 0, 4, bootm_argv);
-- 
2.43.0.rc2.451.g8631bc7472-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
