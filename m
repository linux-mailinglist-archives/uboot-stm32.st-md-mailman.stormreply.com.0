Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ACA4271A5
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E4BDC5C825;
	Fri,  8 Oct 2021 19:57:12 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C11CC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:09 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so12946395otb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/A42Glvy8cNQ5MTm16d7kUpOtUkMPsOCwK1Js6GhOdk=;
 b=OZ53lHBrdwRVj8+9PFLgkqYA/OibU56g9l2QYMSQi/fGou026kW8JQ5TzC0VUah7W1
 dRf4IUgMFzSMlSOFf40V/oMbhDGb6Y3DQSPzw28zN+Nf2noy/pqronwEhWLY7Jo2CjCa
 BlhIQE9vn/K9zP2i0RPJcM+QojLnC9/ub2eke0IIW50bj+hGxu+vhrSBIOnTYTROvbsP
 znpuvLdX6DEJsTH6AemYh4eoh2wSUWR/JM07kVk4Tc92MX0TpLhLKel4bOztDKFAa+yb
 YZDScXQl2+1gr6ywvF7viwSmbIGbzakSpTXbrB2kWZqigNm94tQJaPAU2kcdPL4XrkJf
 jVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/A42Glvy8cNQ5MTm16d7kUpOtUkMPsOCwK1Js6GhOdk=;
 b=WYsK4HWAy9MjfcQv9OjgKvuvL9w82LJl+LSU+PFtlKNQkStYVfiYI942US4w/quatX
 8Tb1kL3anddFU00A1iDS1uBJnIThXuYLvR1wsJKFMcgmEDth1ZTFG195a7no4+bIz4DI
 EkcXMm0PAYwY+pi7ecti/vWWsRln40iCUnIHb+5jrV/ySFZirUpikX43DTZMdSqtecpH
 4mUWU9+BsuM17TPwSY3paySxCUG8t+Rx56Obl8RcEKjHlWztfADg/t5OTskB7v3WpB87
 jpTFVyiqHOonDVcI3yn0aKAUi/8lxHLjM5/4a4hx7AVY9hgTPzl51t7foa2rQkL8OkCZ
 +vlg==
X-Gm-Message-State: AOAM531uUC8sm+Bbgmh5lSXtfMCPZJkwOEcZLiAnsMc6spoq0VsxgCPf
 9OmS8Pumhnrzzt5woIwRscQ=
X-Google-Smtp-Source: ABdhPJy22te1hrZZ6hHCTIyu5J8l4MjigfSvqFY6yOsxAOmuCUDolc3JdJQisaWjH4bE/Wc11fI41A==
X-Received: by 2002:a9d:71d8:: with SMTP id z24mr10555950otj.245.1633723027835; 
 Fri, 08 Oct 2021 12:57:07 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:07 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:50 -0500
Message-Id: <20211008195655.46046-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 08/13] arm: stm32mp: Factor out reading MAC
	address from OTP
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

Move the reading the OTP into a separate function. This is
required for a subsequent change which sets the MAC in SPL.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/mach-stm32mp/cpu.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index eb79f3ffd2..8727de513c 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -593,6 +593,28 @@ static void setup_boot_mode(void)
 	clrsetbits_le32(TAMP_BOOT_CONTEXT, TAMP_BOOT_FORCED_MASK, BOOT_NORMAL);
 }
 
+static int stm32_read_otp_mac(uint8_t enetaddr[ARP_HLEN])
+{
+	struct udevice *dev;
+	int ret, i;
+	u32 otp[2];
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_DRIVER_GET(stm32mp_bsec),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, sizeof(otp));
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ARP_HLEN; i++)
+		enetaddr[i] = ((uint8_t *)&otp)[i];
+
+	return 0;
+}
+
 /*
  * If there is no MAC address in the environment, then it will be initialized
  * (silently) from the value in the OTP.
@@ -601,29 +623,16 @@ __weak int setup_mac_address(void)
 {
 #if defined(CONFIG_NET)
 	int ret;
-	int i;
-	u32 otp[2];
 	uchar enetaddr[6];
-	struct udevice *dev;
 
 	/* MAC already in environment */
 	if (eth_env_get_enetaddr("ethaddr", enetaddr))
 		return 0;
 
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_DRIVER_GET(stm32mp_bsec),
-					  &dev);
-	if (ret)
-		return ret;
-
-	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC),
-			otp, sizeof(otp));
+	ret = stm32_read_otp_mac(enetaddr);
 	if (ret < 0)
 		return ret;
 
-	for (i = 0; i < 6; i++)
-		enetaddr[i] = ((uint8_t *)&otp)[i];
-
 	if (!is_valid_ethaddr(enetaddr)) {
 		log_err("invalid MAC address in OTP %pM\n", enetaddr);
 		return -EINVAL;
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
