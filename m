Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6884271AA
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C678C5C825;
	Fri,  8 Oct 2021 19:57:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB219C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:13 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so12987602otv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UWwb6TK5ZBGUNJllPEhVGvn32f8p2DeoKrN5rNHt4I=;
 b=YrQsKFchPJiBoWr0muZxXCCAvChzhyBsRTs1a+LmIe3dMh0KTmb9sHQ3NAMmUVk73m
 oZ02CE4qe3a7V9xXmUDZC1uKshBLwkz+dJMCqI6mVxz+a3TAyTYIAFPuMDzlQ/7kSCKh
 wjy+qsHB4zB1tOvpxVHuwqzz/S3Zohp6dgu9idTWzOe1esK5Dzd9EY9kWZ35+bDXKL0r
 7+r85mqAnjAYUDd8C02gpqe8MsYb4RzWcp/YWdsFQk5Pwdi3BG2AyQJymg5wD5tkJ1U9
 K7sJiioTq7MNeT2Am/IqGp+X8ZU5In4dT63kUbAHnHbyglbmW/2GF/DmkHl6iVVRsxmu
 8cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UWwb6TK5ZBGUNJllPEhVGvn32f8p2DeoKrN5rNHt4I=;
 b=zu9cpAk8pU34tD3PgTOjUhN9XmQij4mhOPNeCJvn7/DoO8ToJoJP9sZM1OmTg0YEnc
 omDqQlXtDZLpkI0UroeW+bhIg4mEIXQlD3nw3UT8dk0HRsvTaYdNEIggpEQDVbnTwE/j
 omWbo5k7XuxYlmYW8BPsoTwK2JKaAnSHy9oyh/juem43ah+S+v7VPM1OBcWPEoOu8ZBM
 N48gOcQ996TlyFgZmD++qHUjwg6a5bqLBSh5W0hWYYzsMnnlNtA0rgQbGr9SBapirpU+
 CUfVx0t0aoWIgku5hTT/bHcSlsW0lX3of3NNgRCwCFSKPvjgNMmSNdBgqJTeXeinCy1Z
 hLkA==
X-Gm-Message-State: AOAM531Bb5OvYTaIqdAp6KmHfC0SSuNdiV6gCn2N7DNDh/rBtkaAkEMO
 bku3i+FjHXl/adoG627BWvY=
X-Google-Smtp-Source: ABdhPJw3LCYvRiqwEncO2dyfOOdMHXszOId13VNJez3qor5fVXR3Ug6f3AyLlXXI5HW9pYOdl8T1hw==
X-Received: by 2002:a05:6830:112:: with SMTP id
 i18mr10265221otp.186.1633723032949; 
 Fri, 08 Oct 2021 12:57:12 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:12 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:55 -0500
Message-Id: <20211008195655.46046-14-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 13/13] ARM: dts: stm32mp: dts: Don't remove
	OPTEE nodes for DK2 boards
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

To prepare for an OP-TEE payload, the spl_board_prepare_for_optee()
handler of STM32MP calls. stm32_init_tzc_for_optee(), which will
panic(). The reason for the panic is a failure to locate a valid
"/reserved-memory/optee" node in the devicetree.

This all occurs in SPL, so to re-add the OP-TEE memory nodes to the
SPL devicetree.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index fb60549f4d..fe347377ba 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -27,10 +27,7 @@
 	config {
 		u-boot,mmc-env-partition = "ssbl";
 	};
-#endif
 
-#ifdef CONFIG_STM32MP15x_STM32IMAGE
-	/* only needed for boot with TF-A, witout FIP support */
 	firmware {
 		optee {
 			compatible = "linaro,optee-tz";
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
