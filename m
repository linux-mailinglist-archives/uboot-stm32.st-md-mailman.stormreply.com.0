Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3814059C8
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Sep 2021 16:55:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A06FCC5A4D8;
	Thu,  9 Sep 2021 14:55:48 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E329C5A4D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 14:55:46 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id bd1so2819471oib.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Sep 2021 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qxif+yOtaPPwCaTReKIk2k7HnPl5MDfeNwPYdRxUOLk=;
 b=ntEEw9uFRWkDTPR/lqHAF5PdEAlbSBr9tE7iQ3KEkyY+OZ1N/sUZWWYdK5gs9cQSz5
 Hy6hpzHRgNFPmp37657meUxjdc6zcP1hGrZDCImpZvNTy55YLnLR6SJmuLyKNzMqabNq
 FK279YXaZv00SXOvRES+O8SVmu30OssBS/0rLbmYwUwZn9tqFBNppGcuNYKRBrFV/93J
 49c3nR+JOcGc9VeGew5iDDYfKH3MFbrJ4OLLf1uUqYsgmUrf96jJ4FmVWLcWGNxgrXZl
 GFApkx7ml3Bw9Dep03Pz+fQDzptriSHXVrPXuHG/mmIoTBxRr29LAzf4chxVfhRXlYUb
 wCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qxif+yOtaPPwCaTReKIk2k7HnPl5MDfeNwPYdRxUOLk=;
 b=w8sy6vOIfNX1apmm+/tDVrQOn59FmF+rlE/umGV840sYHdCooEvOMfKLoGqp9c0T0+
 6yvGLe/ur5NaeQQqsanjAozGk4JLHgT734+o1TccqNSBDKLxitLPy4br/Lbl3olwENqF
 CR8D+odW246f+ht7WyFmfcdbekd6gcjtFmdY0cSUEctcEd+GYZ7IFmI/XycnhLWNu0kc
 VSxUA0Fw9BLU7LOQlW76pmMOoom6jkuJzXj9/+qGllqXXOZEc/OqQh4EsTMBmvicq6rY
 1sod4SJE95AuKVveKhBc5nI3e4JSRZycHwb6I59Wk4fD+xxmCFYJCSAYLBvsn8A4Kb19
 knJg==
X-Gm-Message-State: AOAM532jkOtOQGKHPmOFwPsApJuzgfG74ri+2ah3ZNe0YWywtxS4RXYZ
 T4zm2J0ZMQTbutYndqQ0BNo=
X-Google-Smtp-Source: ABdhPJxttaDAx96X6vnFV6uClc1Psi6tOUv9mOCjZhoh9Beb5cobqJhbt7NgcCVickrwcJaAUPFjDQ==
X-Received: by 2002:aca:df07:: with SMTP id w7mr135566oig.110.1631199345463;
 Thu, 09 Sep 2021 07:55:45 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id l21sm447898oop.22.2021.09.09.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 07:55:44 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de,
	patrick.delaunay@foss.st.com
Date: Thu,  9 Sep 2021 09:55:35 -0500
Message-Id: <20210909145536.2979951-3-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/3] arm: Kconfig: Introduce a
	TFABOOT_FIP_CONTAINER option
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

This option is intended to tell u-boot platform code that this u-boot
build is expected to be used in a FIP container, as part of a TF-A
boot flow.

It is introduced because STM32MP1 platform code needs special
considerations on a FIP boot, such as a different partition layout,
and decisions about who should patch the FDT optee nodes.

This Kconfig can be justified as a natural extension of TFABOOT.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2d59562665..0bfdc2adc4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1907,6 +1907,21 @@ config TFABOOT
 	  Enabling this option will make a U-Boot binary that is relying
 	  on other firmware layers to provide secure functionality.
 
+config TFABOOT_FIP_CONTAINER
+	bool "Support for booting from TF-A inside a FIP container"
+	depends on TFABOOT
+	help
+	  TF-A has its own container format, named FIP (not to be confused with
+	  FIT). The assumptions u-boot makes about the platform in a non-FIP
+	  boot are not always true with FIP.
+	  These differences could in theory be resolved with dynamic devicetree
+	  patching. However TF-A either can't patch devicetrees, or is
+	  unwilling to do so. Even then, passing such devicetree to u-boot
+	  might require custom mechanisms.
+	  Enabling this option will tell u-boot platform code that it is okay
+	  to assume U-Boot will be started from a FIP container, even if such
+	  assumptions would break things in a more normal setting.
+
 config TI_SECURE_DEVICE
 	bool "HS Device Type Support"
 	depends on ARCH_KEYSTONE || ARCH_OMAP2PLUS || ARCH_K3
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
