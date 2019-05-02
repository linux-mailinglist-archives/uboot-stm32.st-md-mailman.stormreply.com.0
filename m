Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38858114A1
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:57:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04E25C06B9E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:57:20 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0823BC06B9C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 07:57:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 10so733519pfo.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ihvl2A4V6oI9VrLdwzeWf4qmpWC0V9wae/yYZesb+Fc=;
 b=J93LlegVk921gRnquvMeh4lSISMdzD+/+mYR5ZgDlloW9quC41MNFwhQQFdgL2Mh2x
 EM9D4ceZMSPQiVHanveFWWErvtwe4dZawOMpzk04SVYnedWygNKkdqXnrLFxtUoo15Z8
 Ag8jSxbN2Bq8Dn7hB05hYsxpBJrLJlL1yTmKxDZG91gV+B6NuBzVutiWkYqrHQeDwNbu
 lg96eBOlWFJtIi1IkQjgkxJ+s7C3BWCW8LmkeuvjwWJ4z6UEP/J6OjmOLOFD00nA3eor
 dv+2zUu/FdCuJ+wIu/jG+3NwseiVqSWlAXGtYLdmY7V/WAxpGsh+x63a+GhSignnx2A+
 iV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ihvl2A4V6oI9VrLdwzeWf4qmpWC0V9wae/yYZesb+Fc=;
 b=YE2PMoMTtc0BEDEUGdC9MDihlnU24hbEMVkla7XQHJJ/e8X3mxOYQwm8Lum/U3NT7z
 pVv1JJcpGt563OdvQHuoOCPREYx6oGhsQVmY5hLcbrpkChJLfFKz/sAygnrB1VkrrFzx
 SqSm6J/F2vsH55zxgDXI7vb999fSOn7O78wSvgPINZdqP7/dQdERhzQJ2jWxnW2OjecV
 n8It5SXHyD0QWW75K9gfVNqvd3dUZw5qjtTa1GJiq/9hfJeDskbGpq98gshqR3Fy0is1
 T5ufG5iVyw4WU3XXbTYh4HOVJg2/HlIUkuP9GDkUU68Nci+wafycyJ17ql2VX+FyhKsZ
 hdTA==
X-Gm-Message-State: APjAAAW1I672ytO1kfpgRGpI0ibfm7m0RbFWQI8CIFEveDJkzVbl932b
 OxxHmTfsXHtKm5xQg7B07FI5
X-Google-Smtp-Source: APXvYqxFFjPOOMV7JJjmec+DpY+EIzUhFhm7E1R9alOMaU5pe86/sFkLVHc3w0LkuvOov84CDVeGiQ==
X-Received: by 2002:a63:2a8f:: with SMTP id q137mr2573820pgq.31.1556783836530; 
 Thu, 02 May 2019 00:57:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6284:a261:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id n18sm63780910pfi.48.2019.05.02.00.57.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 00:57:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Thu,  2 May 2019 13:26:45 +0530
Message-Id: <20190502075645.19901-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 3/3] arm: mach-stm32mp: Add newline to the
	MAC error message
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
