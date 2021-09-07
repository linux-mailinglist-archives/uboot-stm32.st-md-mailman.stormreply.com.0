Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77B4031B0
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 562CBC5A4F4;
	Tue,  7 Sep 2021 23:59:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9050DC5A4F4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:45 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id y144so694304qkb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/A42Glvy8cNQ5MTm16d7kUpOtUkMPsOCwK1Js6GhOdk=;
 b=Ct5xiTqJTROOQDaBK29cJ1uv0TpuuI8uueh+dqhsbwcBEVEuPljTIT1ZoU0VWhed9P
 N+6A9PjNOSjpVluZg7JRxB5JUydgLiD5AYz1BkDR0h+zItREMaONPdoNvS0n01kGB1PS
 pyalZ95F4cIrPwkqjWqcVtISWvFoia9/o0sm2uVrc+VHvrSF6kkk8Lu+KnFs+RubInlf
 NfABhosnlTtcTgC94KBswlRY+JUL6PBaqHBo0Z7mrwZkkVoZ0vlzSPtx4hqOrun75ml0
 +tC6j8RlEhshROd6fG2W8qAuMZDWjtWwe6gI2nsLKQgI+7UF7nzgmH3XOE8kzfxpP1RV
 yCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/A42Glvy8cNQ5MTm16d7kUpOtUkMPsOCwK1Js6GhOdk=;
 b=VL0U+dm46v03hJa4DSfWpKDKvRLayf8d4J1aIqVBryLINPgk4I+WaJEG0e2fzPuSJ0
 GL0CLQnKNl3/2pW/Etb2vwuV7DZPzr+GPzuf20vXnZ8DjuFRTQK3dy2sWRmsJxAP1uVh
 slx28X0qaq3Pn4NiJweigWFIvmeGRbZxpSBhvaFzvBTJZiEEJ8NMc+dangUs6w7DGhVH
 BO9iMLHidakZZ3mrMxBGp7LaY7K/NVACvcz7l72zzKs4Z/7PA3SWxTvqptywhkt9ylfi
 fJxDvx4NVBzdXs+3zefVBGARjf9bnec9h04w0Nph+Oij+Oe8VCdOouezvc+QKIe/AbtD
 tNHQ==
X-Gm-Message-State: AOAM530wxWBa96bPyySaqayZP981pCjx/XPLLmx/YB7slJNt3+npi8G0
 CKfQ+QXYQRBGn65XnXkRoPA=
X-Google-Smtp-Source: ABdhPJzkawoeW33LpbPCgEXqNFBGJj2FmSWJV+kHp8ZL8NWIDV5Q61vC59yGVyqZ9sHchev7FryDHg==
X-Received: by 2002:a05:620a:444d:: with SMTP id
 w13mr845956qkp.315.1631059184667; 
 Tue, 07 Sep 2021 16:59:44 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:44 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:29 -0500
Message-Id: <20210907235933.2798330-8-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 07/11] arm: stm32mp: Factor out reading MAC
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
