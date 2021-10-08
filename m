Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD584271A2
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E027AC597B5;
	Fri,  8 Oct 2021 19:57:11 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A27BC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:05 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 k11-20020a4abd8b000000b002b5c622a4ddso3233246oop.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JdfSbgr9U20G5C5Z+VGkGDDdIeG6Do3l95a2qSROEc=;
 b=i9HqvgREKHMgsWGMafmf8+z3PJe8LAoD+E0PeDknxT97ie2ZM5vLRGeTk0xnv0CXV/
 QVLkTR8WG5Scxx6R5tj4DwDnWzPNAKu+xnJRhvvKNiqv48xAgnq5XHL76ce/88iwwUmy
 Y8rrL23N5woy52X8l+78AhQ0jcjI7j6wAQEucBg//TqijjL/hillQ+8d2CfYq1RDxIzV
 +zPUxu597lomOP2JV47QiLl/69DEtcXw2i42lRuYrp9NAe2HqP9vasCuEsFl0FBOEp7O
 Tdtni5l8fWFURlwKTJ62Mu8weRFDpKqzgidsOvdrnvCct/IvFhf40JieyrYD68JW0TR8
 mnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JdfSbgr9U20G5C5Z+VGkGDDdIeG6Do3l95a2qSROEc=;
 b=vFNwwvpwBrV8lG6n0BYa6D77YL56Bikwgp7OC+O/pB3Qpw4pHYX6wOrgOX4TjMnONh
 ytyfAvods9tGaCe2lJhGBkPNLwpam/OhfsIAhk2Ikg6JM3QPnhdutbhDjxE76FsKLSBp
 Q3w72MdcLu0kTlEgeImG9HlSBEZng7a1eeDyUs8tolGiPXQ5+u1yjL4vZt3TyQnme1mk
 Jow67+v/fhBajrvieCIm8K2ztA8yiqh+cVMZLe0U9LV2YNjNGiMqtVdQi6fDuU4gMuEk
 +VYScAa9R1FBaIXJ6L1XSWHyR5Owo3sHerZD9RPPY9axTT46kkiPmYVzTkFgCX+M1bL9
 JuCA==
X-Gm-Message-State: AOAM530WKycaNdIouAD0pJINtCq3cgYyGzTIOFyfBQXb0XLf8FWG8z+Z
 S9hE7ZOkyhcV9WWpp9PtKJ1DAXnfP0o=
X-Google-Smtp-Source: ABdhPJxr9mZG9PIyF1KfA5CVa1Dt5waJrQ803Uu5mylabfcU9aupOv7cSEzHYQpeFx+IATrlmSDInA==
X-Received: by 2002:a05:6820:44f:: with SMTP id
 p15mr9372478oou.51.1633723024429; 
 Fri, 08 Oct 2021 12:57:04 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:03 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:47 -0500
Message-Id: <20211008195655.46046-6-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 05/13] board: stm32mp1: Implement
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
index ea2f809245..01aa5e51c5 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,6 +5,7 @@
 
 #include <config.h>
 #include <common.h>
+#include <dm/device.h>
 #include <init.h>
 #include <asm/io.h>
 #include <asm/arch/sys_proto.h>
@@ -82,3 +83,16 @@ void board_debug_uart_init(void)
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
