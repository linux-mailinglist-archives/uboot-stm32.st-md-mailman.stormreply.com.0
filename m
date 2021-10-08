Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6976F4271A7
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE87C5C82A;
	Fri,  8 Oct 2021 19:57:13 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD0C4C597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:10 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id g125so8418540oif.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdF8fM2ZU29BFWYjJGmtMwFUIi/QsCIsoyTFnM0bU4g=;
 b=LO/PlbmxoAW/zXO+emBOU7fniVq5+5nT6DUQC06FYxgH53IcCKyraadk4Qg/30wRTk
 cEKXaVF5MxMXkUdDSIlO4XBkrZphTwp2VPwmYx6jPbfhZiu7QDsQ3HNdJUlpPPUwqAue
 wErhvoTQ3gXJvbwZsJUhuTN9VF7htpHwoxjUbml50y8l30H6dftySoxrPxelI98yWeld
 leL4i5MbZoyMQR42Adur337+36EEIGZ3UF4Bkg/dHr7Ce4qmp6cIvkAOHVc2WE6L3eB1
 vywrddJJB0k8O0VYpnbJtHHKpc01Z+DFkfdGnVo5+7OWtSDDzjWX9G0XRW0PgurIOvmk
 6uDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdF8fM2ZU29BFWYjJGmtMwFUIi/QsCIsoyTFnM0bU4g=;
 b=IcCvkn6c8G4EAP4JaqKx3Z2xl7IIb29ecueQzj/lW1qhv0AjDhQrojjFN4B2eTtBye
 YZ/PFaC30nLwU6EZuHt8DwzImhQRlGngtD09QFdYUgqPIPt3aliPgfM81TSz92AhjBcE
 vT4GypZG4WJEGWaqS1uvAUqQKR05I7G7IXpAbiLBHuX9qiWnkHSgV0jT35Jpmj28I8Dj
 ++he95zhLwNRheH5HjdZq6s1rmkqS5DUfmFaXF7csRmFngl65vQuGHDdR3sJFQsng+9N
 AB9/GYv+pzJz2EtRlVEo853yuW0qHSo1d0+obuS5PnMXYvvtlGGINqFaj2QHWneBqFEg
 jy4g==
X-Gm-Message-State: AOAM532GYinUotvRzOB1yPpODeDBgJ3TARJ9Q56yFm/Iz313OivbMpua
 5sXoKfWGcx8+ZhA3/VF5L40=
X-Google-Smtp-Source: ABdhPJx79L0jj9GJBrVx9N2e+432elQr3kpsXiK1VcmYS1dEvTnB0Bst/gzrpI0TLvgD3Pg8Rfmbxw==
X-Received: by 2002:a05:6808:13c3:: with SMTP id
 d3mr9034118oiw.83.1633723029806; 
 Fri, 08 Oct 2021 12:57:09 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:09 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:52 -0500
Message-Id: <20211008195655.46046-11-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 10/13] lib: Makefile: Make optee library
	available in SPL
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

We want the optee_copy_fdt_nodes symbols in SPL. This is for cases
when booting an OPTEE payload directly.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Makefile b/lib/Makefile
index 962470f496..c7dc217e2b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_FIT) += libfdt/
 obj-$(CONFIG_OF_LIVE) += of_live.o
 obj-$(CONFIG_CMD_DHRYSTONE) += dhry/
 obj-$(CONFIG_ARCH_AT91) += at91/
-obj-$(CONFIG_OPTEE_LIB) += optee/
 obj-$(CONFIG_ASN1_DECODER) += asn1_decoder.o
 obj-y += crypto/
 
@@ -50,6 +49,7 @@ obj-$(CONFIG_BITREVERSE) += bitrev.o
 obj-y += list_sort.o
 endif
 
+obj-$(CONFIG_OPTEE_LIB) += optee/
 obj-$(CONFIG_$(SPL_TPL_)TPM) += tpm-common.o
 ifeq ($(CONFIG_$(SPL_TPL_)TPM),y)
 obj-y += crc8.o
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
