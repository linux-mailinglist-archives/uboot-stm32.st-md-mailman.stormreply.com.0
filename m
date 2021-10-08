Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF084271A4
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1119BC5C823;
	Fri,  8 Oct 2021 19:57:12 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D09FDC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:07 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id s24so15125684oij.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8OpHEYlQb8Mu5hcRIaotjRf4RRob815sMXJYLVBAtjw=;
 b=YqQ7mr0TFBia75a+cg+WHgSYEreOHXuZCXYzjMwpoApfkBqWjdfnIz5Jru2pgCrkMe
 oovdOvyy2LPDs3Yekd8GaRqbpGq3H7xNjvldqunr5WsIIdXbuZYJV+kVdCXpekGNxej7
 wWQeMvFSPbk7cH3Vll5QZdYqvHKfhbfYx37as9LxqOpykYT09ItATjzSzZWPtvUZzxns
 R1vJl1tdlU9CFsjmutmTjYaySz8ISv1lljcfoSYEp0it2ceNA62LNISfMYdJVYEVYwBO
 gZkgyNHt+qVNb+huoLjfqQhNgo8/6hRB+Hilt6IIOBGZgzxeVb+o8Y9s6Y+1iYQ+xEl/
 vlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8OpHEYlQb8Mu5hcRIaotjRf4RRob815sMXJYLVBAtjw=;
 b=45Z80MeTFyIeUAn2rIxZn2V71f5rN5qE85SKgkCtQZnWtq/VeQZdM26FjDfbciIAVv
 +WJWVTt4ph8ha5QqprccoSZaklvJN8I0E8SsvNP19+kSOdS3m0aa0ofQOKF5iI4Z+0XD
 9USUsJjQBwDyOmj6NwhufAQ77n8BkEHWVBX+U2Xf1jmmnSf/Qdd3fZvmkCTaVBYvVFwB
 4zRaR3yl6aM0RIi6yEwkX46+fK6Vkp8JtB2kohCjkoy6biJ4GU4AxoDnr4wIW458LHzG
 NsQ1ZVuegcebWd2qsZ37JQtWKY8S+wKCYDYiH44P/CdFdFmiKNmFTCtUgQneJHPcgsG6
 cU/Q==
X-Gm-Message-State: AOAM530br7EjMpbpoYMXu28bswFTxnGF9HUvzr0bYzk+I1vXh3WuneL4
 uYVE++rn/wu3wOjYTrO8wHpbVbIB69A=
X-Google-Smtp-Source: ABdhPJx5LZenvi9nDjXeSCWg5gpD/8gr7nOmHDriWDD/YOdNe+LdHhxd4+iIu33t8P/GrxuN45b1fw==
X-Received: by 2002:aca:3c8a:: with SMTP id j132mr9623413oia.171.1633723026840; 
 Fri, 08 Oct 2021 12:57:06 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:06 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:49 -0500
Message-Id: <20211008195655.46046-8-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 07/13] arm: stm32mp: bsec: Update OTP
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
