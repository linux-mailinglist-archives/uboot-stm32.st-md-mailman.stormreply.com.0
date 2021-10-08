Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1F4271A9
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429F5C5719E;
	Fri,  8 Oct 2021 19:57:17 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3C21C5C826
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:12 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so12968154otq.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XlUg7RO7kw4MoUmpYMCmlrfg8HxVGqffXkzZtrTrT/4=;
 b=jevKCOu08ANeWGrr+OkDOab5ffKT448fxrszUAmYsuCYyMG2xG8zKgcuvZ1aoiy2f1
 AfWmrXg9IU7GIPIXNa2azQi+PDq340439GDDl2dYZd09iK7DPQnOS1HjbuwGx5A2kNOZ
 FoCSKHb3y4G9NrG6VffycB/89dezW7s7Lx9UEstSy1Zq61Bw58NjWhgJbhNAII3Ybdrm
 DfTnTrJZYEko1DjZCFvB+9jRd711KanP0Fk4HbqWO3Ts2nBMOvgc7Gdl+horNnulKCg+
 XXj7aSrvbREDTcDGjAuWXSNJKW1IhYKMGFnrUMl8igpoioDM4jGMXefsiridxf3e2EhI
 DDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlUg7RO7kw4MoUmpYMCmlrfg8HxVGqffXkzZtrTrT/4=;
 b=qsEjte4vUqElh3iM9jgtCJHnrky4/5i7Bz6YfsM3dI5dTsUXWIUUreKOLsfxm0kvfM
 7blAWT7HLxfs4nOsNGSkrwVyouM4geY6/cIrgF0rCIQceeBQawsrD9lUsUJflVwbewV6
 MarkLutJlkjxvL39q2CeOBDI6x2sB5WAzRZTtUReb9UGZFDQqLHE0t4lRjyi1mAbrr6+
 qRqrK1dmbyJye1Dym7D28tIBb00Qm0QUGlWCTbjelsrpH/185ZZl/UdiBWzBDj3FQ+aD
 KuMhPde7Sh6RWyBBqv1zd678XnRFFCsWaqIdWnG7vq6BSd81JLxtIr/VExu+6eA7WP9n
 +fiQ==
X-Gm-Message-State: AOAM533bIue0zRRv1Aom6L5zvYzLMmGncHQAEuhw8mOU02sZygkU/3wZ
 pMfS+BhJr+t15YNOzqmTh0eIgueVjcE=
X-Google-Smtp-Source: ABdhPJxHChx9Yt47Fr789vkG/oFJGI+0HHP6QVbtgPrXvjObGOIgve+Y+tueSf9oQ/Iz/ZQjsiOhhg==
X-Received: by 2002:a9d:734f:: with SMTP id l15mr3799034otk.4.1633723031973;
 Fri, 08 Oct 2021 12:57:11 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:11 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:54 -0500
Message-Id: <20211008195655.46046-13-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 12/13] stm32mp1: spl: Copy optee nodes to
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
