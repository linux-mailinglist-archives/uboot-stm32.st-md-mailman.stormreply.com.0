Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9108156A9
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Dec 2023 04:15:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D84CFC6DD6D;
	Sat, 16 Dec 2023 03:15:26 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C58CBC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Dec 2023 03:15:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7b6fa79b547so81197239f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 19:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702696523; x=1703301323;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJVWtRT9ZrlY1O4g/GbYbgPQ6m5bJcTqEgw567On5rM=;
 b=EVQtLer51i4waEjQxvMsuVRd2Tof/hlTj5tp5px5kpeLuq/X1U4qzSE7dB7osvS8nt
 5E7l41paDSvmBWi04YgnUwHjsbWse/A49B8JcRlPlhp7PrYFeoZ/kKknTuFQihnefqIi
 IYPTajGCdBdzdYO90TZRZx5W68ITiJ9geFxp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702696523; x=1703301323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJVWtRT9ZrlY1O4g/GbYbgPQ6m5bJcTqEgw567On5rM=;
 b=HX4P+aPxfmfvTK5Co4h5UOCx+pk2yNRg9Y1HIh0o3UJgWEnU+VXHyULf5ezdopP9Ev
 BE/RecrELHG9JSrmsQk5v8n0JjJR5uMBjzfefuZ60jY91L45ivKnT8Y9237KsdyBi+6y
 MMJ3bAlZKmBPIRfiQa+Wktp7vuTO3FJWE2yqlPcanqXyTAnyE/q3EV7pv9jdYeKFjo/O
 a45i0o/mJfJjsnZ0dI3sBumyXuTn5iqMRPtlsuVa5Wd9nnGNH20YU1WcYIyo98mOhnS3
 MEz2dbGenerHHqt/VVS7RZYKYX0NUQGfF0AqsQQkdgw02mAPE180jsIM5BaSMmip5Rxg
 zing==
X-Gm-Message-State: AOJu0YygzffUVjFAg4LICfdIny1Q7OJMqtIN5fA9fNsDtcYkU+63oKdq
 edkmzjLzOoqEhpArneTQTDC8AdvXNpEqnBnW+kBTtg==
X-Google-Smtp-Source: AGHT+IFIJ0c5Y6e8rbvzxM618i+7s/BaEpZSPZWXdtLf9KebSi4BqUrgy5BzzIwrRHQNNfvj0erTIg==
X-Received: by 2002:a05:6e02:339a:b0:35f:7f58:4f3b with SMTP id
 bn26-20020a056e02339a00b0035f7f584f3bmr5868297ilb.131.1702696523699; 
 Fri, 15 Dec 2023 19:15:23 -0800 (PST)
Received: from sjg1.lan (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a92ceca000000b0035f75e80d1esm542163ilq.52.2023.12.15.19.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 19:15:23 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Dec 2023 20:14:22 -0700
Message-ID: <20231216031446.2222362-14-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231216031446.2222362-1-sjg@chromium.org>
References: <20231216031446.2222362-1-sjg@chromium.org>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 18/22] stm32: Use local vars in stm32prog
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
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
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
