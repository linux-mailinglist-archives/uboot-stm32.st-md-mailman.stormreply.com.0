Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD3A306AF
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2025 10:13:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C2B8C78F9C;
	Tue, 11 Feb 2025 09:13:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87803C78F7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 09:12:54 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso54218781fa.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739265174; x=1739869974;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+APdhyFyvohnN2imFhR5NCJMXLtW1K7Rrfu9fwyJdck=;
 b=h412D76/BAn0BHucF6kxwAnrYkp9UcySjGPTBaguNM8UoFrzMDFp6DzJBwmJijaXWe
 hlf009r16xHPP42sZXwK3c7GSYQ6UUl5h5GkLz+W376dN29tsAgSmEBcHiLFfPPGymVp
 zlaVrr9TV+oSe0AQv/xl3r5wMPZt6lISVjcTEvhIGxN66cRbAp399jnDCcJyOimV/sae
 p3YAdCJsGua5i/2qthvDptSpNl7gzYXGpxFdI2wuSSa2mPo9/b1NVaq7neiC7iozXJ11
 y3Zx5g4k2wIY8yz0r15SYCYeb0aAbBS2fLtxRKv0EL5jMuk/NYU57xRHK7XNcZ9FG34y
 fwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739265174; x=1739869974;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+APdhyFyvohnN2imFhR5NCJMXLtW1K7Rrfu9fwyJdck=;
 b=NIlXJoIy/uPpcFP+GFyCbmtmI0oDDGl5UHDslEpuCHdMU+npL0h2esZ9e7JAtBPItt
 u6lxrIh56QmDocVa4NgzsM2eQa92/NyZgasJ1RLc9IcNN4eE+EZbsohcUtK3vdt8CgB2
 sdUs16CPDX7hKPaNpHmTtMupGtdWcd7PH3MoWL6DVUNQDTrh7B/LsQ22ryYXYQwAspOt
 ohhUL5GA3hqkOnBPSG92r2ngH3HnnxLLT/oVzw57wXNYn32buB8OM4MIVmLpjuBiyNme
 1EO22tC/fAnxs5GBVl4Y8wOwiKu5ElTIA4sgJlQ9SxOeD02RAz4B+II70+mI2PSbFdoX
 zhbg==
X-Gm-Message-State: AOJu0YwikN07rD+u7HmcIt1qpv+tuZ52bB1JHARdv6Z/6VGS58vkvu0l
 airzxJjwdUMV76CvRlclx6vEBGBKkSf1+T2qUXjkcpqLpuo06UkfXwLYbbz/s4Y=
X-Gm-Gg: ASbGnctIhZm0xoTWLeIokXQRCrFimn+4hYOpCE/N9NpRHeVnEpDMHztI7kr0+9/zNEX
 uOGs3zx6dNvJpmJYlYzvmXT8DnkvUB+RgBG0tzP3+qW7n9mXoLOnTeR6KRbhj4wSWwSzmjBDtYW
 U0ahrnZigYZl2y9VZrAk4oG5bIUCwiz61OEsWJd+g5K5pjbyMPSXHv29yBp6TDYOwUc/rtqUwlf
 Fa4YIBj1eU8NIlwFVa+zympVrphGXpncO+zfTQIm3Sc+PX7O7hUiUv9FnrjOR7hUZPZvVmv+1Uf
 Ec0s9jbuEhjJmNYR7pGuWarC2uDnOvTqeCiz1p63N54Jv+qzGnsThjKEloM=
X-Google-Smtp-Source: AGHT+IHKbKrYSYYXTYkqjfhXWT10DcnyGhf5fOXXFV2zijdUM/IBGIHBbxS4wU8l/vTEmSAYFp8wIw==
X-Received: by 2002:a05:6512:45c:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-54504cbbb46mr2944260e87.13.1739265173615; 
 Tue, 11 Feb 2025 01:12:53 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-202-163.bbcust.telenor.se.
 [92.34.202.163]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308f645fdb3sm3018691fa.30.2025.02.11.01.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 01:12:53 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Feb 2025 10:12:51 +0100
MIME-Version: 1.0
Message-Id: <20250211-stm32f769-uart-fix-v1-1-8d0eaf0b193a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJIUq2cC/x2MywqAIBAAfyX23IIa2eNXooPoWnvIQiuC8N+Tj
 jMw80KiyJRgrF6IdHPiPRSQdQV2NWEhZFcYlFCtUFJiOrdG+U4PeJl4oucHtdatcM4PthdQwiN
 S0f90mnP+AMPqg2dkAAAA
X-Change-ID: 20250211-stm32f769-uart-fix-66650ddf9c80
To: Vikas Manocha <vikas.manocha@st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Tom Rini <trini@konsulko.com>
X-Mailer: b4 0.14.2
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [Uboot-stm32] [PATCH] configs: stm32f769-disco: Fix console cmdline
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

The Linux cmdline encoded in the defconfig is wrong, the
STM32 USART driver registers as ttySTM0 not ttyS0.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 configs/stm32f769-disco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 5be221afd2facb0af4a3a3f8df0f24fb34eaf10d..9edda0e36b2e92c3dbe3298a3da04bd731dac452 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -18,7 +18,7 @@ CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_BOOTARGS="console=ttySTM0,115200n8 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_CYCLIC_MAX_CPU_TIME_US=8000

---
base-commit: cb3612dfe3fd9a702dc3657aae15b07974f9aa0b
change-id: 20250211-stm32f769-uart-fix-66650ddf9c80

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
