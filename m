Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1085E21F
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 14:21:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A0FC35E0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 12:21:22 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 119FAC35E07
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 12:04:31 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id t21so5221459pfh.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ihvl2A4V6oI9VrLdwzeWf4qmpWC0V9wae/yYZesb+Fc=;
 b=bCQlXs/a6fZJoTp3gIuT5dsCnXp683/jsjNX197qdNssExJpYTGFC69V8vn1L3HSjl
 1Ph44KM31WFXmHgpJeTDXx9d+ybMfRSaqFaGksNz309FlK2waecZ+DbZVvYpDI88Kgaq
 Uh2pYlx7CeFqpb/ofVpIRiXAB3Buz7/i2HnOOEissFk/3fOl8VCMAVAJic46+F3WjBVI
 tY/ZDitZ4nB+NeGyg5R0v6cuBD03I4SvDqQkjfVvZTMrRUtK5LG2K0O2ZHbz3xjn9xYJ
 /AYJf6Ke6JdCotm/hZfjPoZd7qPBEhxfJc9bACubZMzOhZkDluKaygaQBQ/ZShGhKqvv
 f8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ihvl2A4V6oI9VrLdwzeWf4qmpWC0V9wae/yYZesb+Fc=;
 b=CfYpMxAagJ+5L3ULMFR1hfvpaYSmR8h8WdpFzGZhgsfu53AGAEGHN3KIsrEqEuuDsg
 AehUBbZyVqorWWEImrtRuTI3Q7qZGASVcUIm9mNYPtmmgWmpG7PpwlBkSKY/RrbTKQ2X
 YP8LYwUfkTQL+EM0bgj7/k7w5tzkeEBjBPrMwXlAiTNI4MHBHGhOOBSB/9fd7gU5EObL
 erZhF9E6yabT294qERPiunPe0ANXWkkv04Vt2BurYn5w1J+UxkbVvL5N/H0P5t4Y9b4l
 AmO0njFOhKpwPb+Xv67hozH5OmpvCG7FXPX+qRw/zd8VVk+EYo5SiEAffopDPXn6QGCK
 Qa4w==
X-Gm-Message-State: APjAAAUpZQTY4UfLFgrruuIXsDlh7dvVuV0jyGlGjdrIV2z+LTsvYaMq
 DoiMe5MeDggsMZjASfa0xA72
X-Google-Smtp-Source: APXvYqzSiJmgr66Fw/noLj9LJZm8pzHC/pBuJPwYx9jPCzySu9t2e0NWk0NMLkcS20VKGPOM7cioxQ==
X-Received: by 2002:aa7:8694:: with SMTP id d20mr61574116pfo.81.1556539470232; 
 Mon, 29 Apr 2019 05:04:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7241:e9f8:e0e7:64d9:38a4:57a4])
 by smtp.gmail.com with ESMTPSA id u66sm3098277pfb.76.2019.04.29.05.04.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:04:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Mon, 29 Apr 2019 17:33:59 +0530
Message-Id: <20190429120359.23332-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
References: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
X-Mailman-Approved-At: Mon, 29 Apr 2019 12:21:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH 3/3] arm: mach-stm32mp: Add newline to the MAC
	error message
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Without newline, the error message appears for non prgrammed OTP boards
looks messsy. Hence add it to look more clean.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/mach-stm32mp/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 7b4431c9c75..e1a0a136809 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -481,7 +481,7 @@ static int setup_mac_address(void)
 		enetaddr[i] = ((uint8_t *)&otp)[i];
 
 	if (!is_valid_ethaddr(enetaddr)) {
-		pr_err("invalid MAC address in OTP %pM", enetaddr);
+		pr_err("invalid MAC address in OTP %pM\n", enetaddr);
 		return -EINVAL;
 	}
 	pr_debug("OTP MAC address = %pM\n", enetaddr);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
