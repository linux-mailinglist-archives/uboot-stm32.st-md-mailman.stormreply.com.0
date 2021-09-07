Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7332F4031B4
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2157C5A4F5;
	Tue,  7 Sep 2021 23:59:51 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6A5BC5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:49 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id 2so391885qtw.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XlUg7RO7kw4MoUmpYMCmlrfg8HxVGqffXkzZtrTrT/4=;
 b=ETYKq/k10vkE2oa1PuiNFN5/ZtbA+qHS+D/OTOLsTnLPUjV6ocKUW6DO3tbQS3/Q4s
 EpSPURsYKgyQiifjpEYCGFC05eOQeZNkbBsxV9nO39C2vp2AjQLl50Ix3YqCLtdlO3fS
 x+F56F4gh09NzqOOEWFzCMwovakQIfizNtF9kFbvyIpIaVDzpvEC40szb1uygBHSpN6j
 5nXJD0WP8imXR00EPIC+VZ27DHs+xDfnaj9qDvUvZcO2zoIZcrs10+nA9G2Qx1nF/VwH
 WMZwlBnQAKlCEHWSChZYv8kcc7X2uMZG877nAIJUnPAyM2l4I+7obwYpdYJB38xB2FSp
 BTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlUg7RO7kw4MoUmpYMCmlrfg8HxVGqffXkzZtrTrT/4=;
 b=qGplm7flhcjSZOYR63x16Aqe+jloin4xoXL/d4fqMweOlIy84xc88+nBVVmKPMwELT
 BQnh+a6fpiT03CQue/JPRBmqMmWAUi1GODtAiUDyHanrahC8KtEm/dpIoXQtHMEBf5wJ
 79vRXK3oZrJrssSKXg+Sp+qNvOgMCAeTdF0Q0NoGj6RMw8oYnyew+XUiQcXYsrOFD+Ix
 iHitKD1IDgyeJZlbLrllbkCpkLN9JoWFeWZSDpHfAPCSnGxu+RrvY1tXxTM7MNqB6ays
 ftDm5TzMTmktAKU3gr6uzXc77dcQG4swpqIm54P4pTilQxfxKnW3/t1MIPXouhMQw88G
 dDmg==
X-Gm-Message-State: AOAM531p36RxLeVBxHdT9BR10ZVEJ79jZYExjqgqj7KJrZGjIyySqoB9
 j0xFePt5Ugid5+qVggwWLKg=
X-Google-Smtp-Source: ABdhPJzM9+ErToH7UbJFIZL/Gc4q2Ehju+EkEEKxhgEzGtlp8ZzcOdiaQeRYam6rCJxv6y4yNi9SuQ==
X-Received: by 2002:ac8:5f52:: with SMTP id y18mr1012976qta.379.1631059188756; 
 Tue, 07 Sep 2021 16:59:48 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:48 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:33 -0500
Message-Id: <20210907235933.2798330-12-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 11/11] stm32mp1: spl: Copy optee nodes to
	target FDT for OP-TEE payloads
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

OP-TEE does not take a devicetree for its own use. However, it does
pass the devicetree to the normal world OS. In most cases that will
be some other devicetree-bearing platform, such as linux.

OP-TEE is capable of patching the devicetree and adding the required
"/firmware" and "/reserved-memory" nodes. Not all OP-TEE
configurations do so, and it would need to be explicitly enabled
(CFG_DT=y). There is a measurable boot time penalty to enabling this
feature, and sometimes it is preferrable to do it in SPL for this
exact reason.

As such, there are cases where it is required to copy the optee nodes
to he target's FDT. Do this as part of spl_board_prepare_for_optee().

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/mach-stm32mp/spl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index d9fdc5926c..94fbb45cf9 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -19,6 +19,7 @@
 #include <asm/arch/sys_proto.h>
 #include <mach/tzc.h>
 #include <linux/libfdt.h>
+#include <tee/optee.h>
 
 u32 spl_boot_device(void)
 {
@@ -182,6 +183,7 @@ void stm32_init_tzc_for_optee(void)
 void spl_board_prepare_for_optee(void *fdt)
 {
 	stm32_fdt_setup_mac_addr(fdt);
+	optee_copy_fdt_nodes(fdt);
 	stm32_init_tzc_for_optee();
 }
 
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
