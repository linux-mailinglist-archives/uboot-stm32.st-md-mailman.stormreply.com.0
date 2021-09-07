Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 760684031AD
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A6A0C5A4F5;
	Tue,  7 Sep 2021 23:59:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC81C59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:42 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id t4so450232qkb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZAQJMoasjYlXXMzi5SrC0kH6PXquC465hHW6vsg/tU=;
 b=krWHpz7zSdXuNjTAkpJbxT363KRuW7sm9+rgT8LQtquvqs0R8BYEPlxitA7GMw8iC6
 JVwcxC/0khtIa+JvSEL02IbJkk10CCsmhwLT+iSHQr4Rbs8EdOSjZWttk0Aj4v9R8CIV
 xsBrAj8fR19DTcVkPWAddQ5Q+Q8U9b49s2jwJhI+sk1cTlDlpOAhBgLYWDJuiPctmUM+
 i+7F6snlve685rs543vh9CMZb+Adz+xkNwuYbdyRp4OR1XtDesdhEdCqxjpsIhGG3Ln+
 E6zLploZnQbnvI8gRdugDHxDteyAwiZQuBP4xC23kFWlWwXyvHqy2Cy/rKNxBlwz76f0
 /1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZAQJMoasjYlXXMzi5SrC0kH6PXquC465hHW6vsg/tU=;
 b=njlzHVyGKYB4nPUgEINumb4hcQkiw/xQCIsUQi5KgPTTSkyevbkwBnZMN1l2zqI37R
 d8OhcHIR6H9O1uhhkoZVNwnFXdBUKW/zgNmmY8DkHMQeebKr3Mrc2PfawXpTFM2fIQzl
 3x18sJhFZhGCAMGUgc8waJs6XC0HT4P+CZ6UpNXcFsJ1X3cWT7nW4trbx/Bg1kPOxw19
 kW2+tR48FChKBPr0puChdN/B5fSwqfLCRB4VenmDVdoTKNQu2ke9x1bPFFHMxWVtPhkD
 mWDTafQiZPMEfC9kwxrwUCg5auKd/B+6/xGQt1861l/FuQZ2Ap7fS5XGTUKWtRd9s4EQ
 O/tQ==
X-Gm-Message-State: AOAM530jsSLU1f5A7BsEs+OHjv+uEfcdFuRFvd+3e+Gjt7I+btG1HB6C
 m+TBl8BeWE5OOnL5gZCe/jgaq54lmUw=
X-Google-Smtp-Source: ABdhPJyYGeoZ3dT/Zu+2lqf5fJGCbZsCG/VvxlBNQF7mcK1H2vteuoF1LAjBy/YzKkBZuqGxKvGRGg==
X-Received: by 2002:a37:a58b:: with SMTP id o133mr861141qke.120.1631059181097; 
 Tue, 07 Sep 2021 16:59:41 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:40 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:26 -0500
Message-Id: <20210907235933.2798330-5-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 04/11] board: stm32mp1: Implement
	board_fit_config_name_match() for SPL
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

This function is needed when loading a FIT image from SPL. It selects
the correct configuration node for the current board. Implement it.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 board/st/stm32mp1/spl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index 921d0190e0..7542ee52c9 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,6 +5,7 @@
 
 #include <config.h>
 #include <common.h>
+#include <dm/device.h>
 #include <init.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
@@ -92,3 +93,16 @@ void board_debug_uart_init(void)
 #endif
 }
 #endif
+
+int board_fit_config_name_match(const char *name)
+{
+	const void *compatible;
+
+	compatible = fdt_getprop(gd->fdt_blob, 0, "compatible", NULL);
+
+	/* only STM boards are supported (currently) */
+	if (strncmp(compatible, "st,", 3) != 0)
+		return 1;
+
+	return !strstr(name, compatible + 3);
+}
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
