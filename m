Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4C4031B2
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 656DCC5A4D5;
	Tue,  7 Sep 2021 23:59:48 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD36C5A4F9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:47 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id p4so707948qki.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HYgYfONsM1dFHKNHx2gHtuNxkXTvSPnRlEWRWJNRh8=;
 b=dhTn9kZCcXkC+teR8EMsEEXnUQDKkFJAmdhOz1ngCQvQiQgmVZSGuiqv6r+ZoWbEg0
 yP13plQfK43QjAA68sSmtP1XpeZBUVKWIxezXB3LIBFboeErnhd6DpclkHZUN6eAsXl5
 w0wdDKFdSoEXAQfiYTst97Rtb5ieZQEJ0ZMhnErDaclOPQ/s/O5tYFt12w3VUIMVVdXn
 AiVEdYXSAKeBKNd0FMMom4hCebkZfxLP0x6ccDXG2YsovA54vDb4RBKg4kXsHitV7Z3i
 LjX09wBGFCrI9c4QIDYjZzZpZIqRVsOFXKehUFW8iTH8W22PTQqHAJfjhnqX7GQObfAt
 VAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HYgYfONsM1dFHKNHx2gHtuNxkXTvSPnRlEWRWJNRh8=;
 b=pJ6eMBtFmhAXu/l8zqvDIoFDpNSlwKhodaGc+k/IUKrbMIcaqi2RbtgnoAYAz2WjXi
 4xrmOhuU6+5rlXPYQtjryvJ/qPXuKbwAkNwRSGDd4TmwDT6Z1lPctwuYs7rv9Dr3HFWc
 VX0YGav1ONySaf4gqkxAe9P2UMxRrNlSF2foXmjExnfoh+GnP9kkbwQxoP4FfmAgMDFM
 WUHOd/WQULcDwEDSRiLEIzjhKos8t0r6jybvneRugY5aCKdzoFP6zGXo5/isLcjsniYT
 IgGqIiUh8dKEafX9gh28FEVibvSBaV2aOSSxMoPWJePSqc6aotR5GsXVa4eweG+/tXTo
 e0uA==
X-Gm-Message-State: AOAM531yax4ut+REbwFFkKaRq0F4JnvC/a5apSeeZq98FNZwfPue+j/i
 2GgqLOzyhD+q3XM7ehI137r0MKvnD0A=
X-Google-Smtp-Source: ABdhPJxss80ICmKC1/jJjczmcSQyCxtt8OH/7aG9mPJec90pUEtmZtQz3KFSxNo6TFrzQ4b5nuDlCQ==
X-Received: by 2002:a05:620a:1485:: with SMTP id
 w5mr862156qkj.448.1631059186654; 
 Tue, 07 Sep 2021 16:59:46 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:46 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:31 -0500
Message-Id: <20210907235933.2798330-10-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 09/11] lib: Makefile: Make optee library
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
index 8ba745faa0..73dacbb01b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_FIT) += libfdt/
 obj-$(CONFIG_OF_LIVE) += of_live.o
 obj-$(CONFIG_CMD_DHRYSTONE) += dhry/
 obj-$(CONFIG_ARCH_AT91) += at91/
-obj-$(CONFIG_OPTEE) += optee/
 obj-$(CONFIG_ASN1_DECODER) += asn1_decoder.o
 obj-y += crypto/
 
@@ -74,6 +73,7 @@ obj-$(CONFIG_$(SPL_)GZIP) += gunzip.o
 obj-$(CONFIG_$(SPL_)LZO) += lzo/
 obj-$(CONFIG_$(SPL_)LZMA) += lzma/
 obj-$(CONFIG_$(SPL_)LZ4) += lz4_wrapper.o
+obj-$(CONFIG_OPTEE) += optee/
 
 obj-$(CONFIG_$(SPL_)LIB_RATIONAL) += rational.o
 
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
