Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9B8136ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Dec 2023 17:52:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90ACC6DD6A;
	Thu, 14 Dec 2023 16:52:01 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 503CBC6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 16:52:00 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-35d82fb7e86so25047895ab.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 08:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702572719; x=1703177519;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM637a7/+74UxIJkS29Afb2Qul2T5Es438+DTSq1oH4=;
 b=jq7ebTaC5VIrGx1RwNszBd2EwbGpMdBKugTv41TEemVynxaQLAKFG8G3C8yFckI7Ju
 DJK8plJFvvwT4yjy9XVl4KV68WmWswj+yQBMbNUNWmnQdaZT2a+0qsU0zTfgFriOihEM
 /NlU6cE8ZNZqHNFs995QOxGvNVx9J3/wbcwnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572719; x=1703177519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM637a7/+74UxIJkS29Afb2Qul2T5Es438+DTSq1oH4=;
 b=U+ogQ0L1zkQz4dvQ0LwXQMR+6yQDjau+xQ+QCVtOQCs5VmQfaeUYBz4EFxwABR6O1a
 47Kk2NqeI5m8QWsozdUMaqWyxGsV7QCad3mo5l6yw93WkIjBGRHZvB9nLjNi/H+U9ULc
 8ELx2mNnI06P681AhHeCSwmTXaCXaAz6IgrjIMR4eMVclUCpBPCIhBZZ4olrjROXdRNH
 jXoc8o8IaNM0z61BQCh4vnlMvAiEZASr5GJuwFcnf/gGvJ77vs9N3FUYu6szpN7fBGcd
 wajx/L8Tq3A1no3LqWDAVCAVwWwddc2r8r5XY7pNu4DYWCU4ZP75PYfaybNPXMCM1UbH
 UbLA==
X-Gm-Message-State: AOJu0Yx01wuYw5je2io76Kktp00x5aZ/amLg10Jh944SV7pO3Rylnqej
 Uod0JwwmrmhDIWHSZsSsa7pwjQ==
X-Google-Smtp-Source: AGHT+IFzNmHrq+4O6kqvxUp9Ec1fPtvE0fquphffCtdNDGWIeFR1D4jiAz1o6jRu8Hi3zqaghnBpXg==
X-Received: by 2002:a92:ca89:0:b0:35f:772b:b89d with SMTP id
 t9-20020a92ca89000000b0035f772bb89dmr2448179ilo.62.1702572719268; 
 Thu, 14 Dec 2023 08:51:59 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a056e02338e00b00357ca1ed25esm1228347ilb.80.2023.12.14.08.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:51:58 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 14 Dec 2023 09:50:27 -0700
Message-ID: <20231214165112.2182274-14-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214165112.2182274-1-sjg@chromium.org>
References: <20231214165112.2182274-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 18/21] stm32: Use local vars in stm32prog
	for initrd and fdt
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

(no changes since v1)

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
2.43.0.472.g3155946c3a-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
