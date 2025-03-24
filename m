Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70FA6E1F0
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:01:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA563C7802F;
	Mon, 24 Mar 2025 18:01:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFEB8C7801E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so2507623f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839259; x=1743444059;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lWtLUy443OQX99OX0MPkxNLbUAbVdnOztC7Pi97r7KI=;
 b=SGOWm1HT3uOYrjoBdMw2DjF1fPMnWlltvpkSfyueNzi4Z+861h4zc4MOQu9BUzRyQU
 aK42Pt6ENhRqyKUfIpux3MbJt9ybG9nIOaetQeP9xRhLoOCaCp4HLRI/r21j+j0Ub/vR
 sDhPM1b30sPFKZNq12BBy9Us90JaoPH4wz6RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839259; x=1743444059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWtLUy443OQX99OX0MPkxNLbUAbVdnOztC7Pi97r7KI=;
 b=QuMAob2no4J9RMa84X8w0rmEPjz6Y/Ec8Oyxk2bvK4qn6pixSy0lFSg5NZGYMD6vkK
 NYcVwYBKMEusxEalkrU5g52zr/9TnGjdRSc5aih4hWg4wRBcyZRlobdhuHnGMZtXmafC
 iKdcxhBqF1bX/riSsoiYfpTndySt15j9rOu8PEqE+d+sYfW284Cbpxk+6Tne3qH1zRaL
 13mEA0/1k8tJMxV1j8xJ3tjOeZrkrmd4SdeJJvpf7TlNKkDxxIetnPixvtkNWwLtM3d2
 O8a4XMJzOsEqVdElxc9/XkGxyFDIp6VG4CJNZuUk7YdjSiwr0iK1vMKs2vjtucTliHpU
 VzMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIIvZdKuydC9yyqUs8TSIx7zffSw0u13tF6Ujsq3yHSxzbhcmgK22nZNJQb2lhD7cIX5wfAPR+44vBxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznnDD8bekshHcRcu3GUTUBHpmzMgVA4K49BuLX3L1YMkoc0Ip2
 D+M9gCrYCdReL11CC0hooZm7gseUNkPmcm1gw+Fpf4+RiAvai8ndErZHaHQ6iow=
X-Gm-Gg: ASbGncvXc8QLFDie6JfAUA/5riEfMQ1/Q9zLFLqkv7ulT/bJnpUH158nKE2keU2atio
 2mqBO/4pu1e5qCnGtFjveOAgXbZSuAJdyxNYjt3KZHBUiAS+8cFib62f7byUVS/f9qZUtyUkLDP
 DMPsF+qrsDP2bdaOJk2U1EJjXMGzh8tvr0vfTC+rOzilS1xs3vDLmcrrussKDFfvsKtcHbGTEvK
 dZyA2DQstVTKujp2/+EXwaNx1ip9iJMO2kUQl0uUWkC2hq2pWvOGNet2Vd7dafwALoikUOrSjEa
 51MKXe77on2xgejW6D2MKLfmIkYaOPiN6ySzUOUP7/9wdUDaU7RrP99Y61fLXF8CK0NFW14q/uu
 6HLZx94S6jMX88BN5KbJ8EPDlgFwdb1CGCWY=
X-Google-Smtp-Source: AGHT+IEFVtVe790JWBHXZER/NW42FPFw49GvCR7j8sSJ5aIdmNau5TagXhm9zFwKEa0q0XLm6MGq4g==
X-Received: by 2002:a05:6000:4012:b0:391:4674:b10f with SMTP id
 ffacd0b85a97d-3997f92d312mr11452577f8f.36.1742839259024; 
 Mon, 24 Mar 2025 11:00:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:30 +0100
Message-ID: <20250324180047.1571378-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Vikas Manocha <vikas.manocha@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 6/6] board: stm32f769-disco: support
	FRD400B25025-A-CTK display
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

Support FRIDA FRD400B25025-A-CTK display on stm32f769-disco board.

As reported in the section 8.3 (i. e. Board revision history) of document
UM2033 (i. e. Discovery kit with STM32F769NI MCU) these are the changes
related to the board revision addressed by the patch:
- Board MB1166 revision A-09:
- LCD FRIDA FRD397B25009-D-CTK replaced by FRIDA FRD400B25025-A-CTK

This means that the MB1166-A09 is using an NT35510 panel controller,
unlike the previous versions which use an OTM8009A controller.
Therefore, let's add support for NT35510 panel handling to the
stm32f769-disco board configurations.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 configs/stm32f769-disco_defconfig     | 2 ++
 configs/stm32f769-disco_spl_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 5be221afd2fa..e50d62e93bd6 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -52,12 +52,14 @@ CONFIG_DW_ALTDESCRIPTOR=y
 CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
 CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_NOVATEK_NT35510=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 7d4bda440685..6229ee5089f5 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -75,6 +75,7 @@ CONFIG_MII=y
 # CONFIG_PINCTRL_FULL is not set
 CONFIG_SPL_PINCTRL=y
 CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_SPL_RAM=y
 CONFIG_SPECIFY_CONSOLE_INDEX=y
 CONFIG_SPI=y
@@ -84,6 +85,7 @@ CONFIG_SPL_TIMER=y
 CONFIG_VIDEO=y
 CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
+CONFIG_VIDEO_LCD_NOVATEK_NT35510=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
