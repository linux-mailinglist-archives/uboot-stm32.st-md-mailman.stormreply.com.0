Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9AD4031AF
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A312C5A4F8;
	Tue,  7 Sep 2021 23:59:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8642CC5A4D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:44 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 93so403172qva.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8OpHEYlQb8Mu5hcRIaotjRf4RRob815sMXJYLVBAtjw=;
 b=aZIWMtNYzJH0kN2N8QwuYU8L7qrkf4roYb++w0XgmkNsH8Jp2spdXLRxr0mT03zra9
 RZo7wZHV6O8a9gPVuJoqkd9GaWCrs5LwoUYWLTgd9PKI2G2AZKHDZU1IVPR1Dw3zDtCq
 49dlIPoIe1IZPXiUPPj3Bb1AZAX1DZB4q+3gq5RMSOfVVhrX2EQZ2TkdeV/UtZHtkU6e
 tTkNUEsmmEpzmEpxoieHbV7n1IEocodE1fngoyn+92stVxeRxnk03PBsabb72YRgkhTE
 KYtygx9F3SI0aBpYvENZthQ7gmnOIsH0OggGDBBqqIWx0e/wNDxyber/aGs4bt+VDJFC
 iHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8OpHEYlQb8Mu5hcRIaotjRf4RRob815sMXJYLVBAtjw=;
 b=ShHlTUFz02EJtmzs6IwmDKjfwpnjnl7oe0WSvoy2OtyO/ES0J64Ay+Yo9skC3ZjkGl
 5Bj4pBO37/GyxxqosaSMPh2747EfM/lFIXtDqpNoLfUgHpAB+3zh3iTusaHR/v9i5G4y
 2jqtzNQnG9CDqS8PaLDAveVL5fUOoNYch9lsInVIuKvJzpZxAmUmSh0QwQP0heaxZSab
 /dm2xmj8B2GkShYEtuGw92YHSEblk7J8pttUBuPyc+XLk7iROVxmzp1qhX/iiOLZSiix
 ESpUjr8iMXiAMWfAQyGEdQTFmE55DzBBvYzE44SH0tJkzoByhAmMwunKNFJg2Ne5oFbm
 0Zqg==
X-Gm-Message-State: AOAM533vRgMCHtCpjPBeZRfYBnf4J2lJlOyNmBX5OblSzFu/LscVEqBk
 3iLM13nMJ6h89SwIE4EvWRQ=
X-Google-Smtp-Source: ABdhPJzh7CtRvGDDYBlx/2zpufAF1nIlbQ8x/irGVXi68pR0IClvlSKf8D4OPQbxyLYFaFNq/DXTWw==
X-Received: by 2002:a05:6214:94c:: with SMTP id
 dn12mr811016qvb.60.1631059183474; 
 Tue, 07 Sep 2021 16:59:43 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:43 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:28 -0500
Message-Id: <20210907235933.2798330-7-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 06/11] arm: stm32mp: bsec: Update OTP
	shadow registers in SPL
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

For TFABOOT and SPL_BUILD, stm32mp_bsec_probe() skipped updating the
OTP shadow registers. The idea is that we can't access BSEC from the
normal world. This is true with TFABOOT. However, in SPL, we are in
the secure world, so skipping probe is incorrect. In fact, SPL is not
even built when TFABOOT is selected.

Thus, do not skip this step for SPL_BUILD. Note that because SPL is
now doing this step, we no longer need to do it in u-boot. The new
logic is "let the FSBL do it", which is simpler.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/mach-stm32mp/bsec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index fe39bd80cf..41ed5f3cf5 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -503,10 +503,10 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 
 	/*
 	 * update unlocked shadow for OTP cleared by the rom code
-	 * only executed in U-Boot proper when TF-A is not used
+	 * Executed only by FSBL (SPL or TF-A)
 	 */
 
-	if (!IS_ENABLED(CONFIG_TFABOOT) && !IS_ENABLED(CONFIG_SPL_BUILD)) {
+	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
 		plat = dev_get_plat(dev);
 
 		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
