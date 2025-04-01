Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33645A774E5
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8D2CC78034;
	Tue,  1 Apr 2025 07:01:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B991CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:40 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso48591445e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490900; x=1744095700;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTQ+TNjN0ZkbXi6gStEVEIBZZSMT6jM2ofTUWWx3Nss=;
 b=aQgv9JB/dw3y6qAUDggPE01l3P4gfaHYXncZDsZu6nvePYnBGoq7U4aeKeroFeeEMs
 VLiXIIR/JQJd5qzm9dsTNVClfDDE7pi8EndPHcrvN9OJSQj2637Umlwn9cypePaY9OaL
 MqgZyQFdSdYF7vrzesPVQHPEmAdiGoCcCd11A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490900; x=1744095700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTQ+TNjN0ZkbXi6gStEVEIBZZSMT6jM2ofTUWWx3Nss=;
 b=wz7Sb0B+7xvuE49Ov7faZbXgNqtkNXW3U7OwdCdPv22Ra43/K1uhu1bNMu4ZpiWD5q
 cy7JCJ6fq7qdmdEUwfZFlGH6qT/sSdGp4EUPehEXUiXelFmz6/wPVLb/ZgcglZ+uoIze
 YLIv4saV1AGdGU4Vjopx92CXsHt6ae7QyXHA+s5rPvX4hSwqtKxfF8Lf2AhOclDkMN2x
 uf1HwPx+BICnwtzJUP4istMBV2yi4BpT4cnxgkyDePCBzI1SbqGaw42iOwfzpPAVLdUc
 Fg0YbybokYzi9hMK/fxKWjPXugJvoitd56MxLK6BwjXsifbaIp7fTZSre6RKSyG8ifx/
 dYwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtx5FV0Y4CLZt47HBgTmEx+Ut6V0fwWMt14RScmKA6/FXA2d9RbvzQuxTPIOK+jL304XfphiwJPxyDGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxklhBeWLhOMXVYPAdpjpEZPtn2Zi5kNIC3MflGkBOimTZ7m1QE
 9RUTZCMXDxv3KUgSuc1I0M51NN5SiipaWdXq+pT+zA8kdQSCl3NPxfcJ8UZaO6U=
X-Gm-Gg: ASbGncvTAFSda7GgfgX+wYVmRWv9DeEfo8lgGxCSX/m0bLmeZLYnzGKi8bn3oOSu+lZ
 0/COzvva9WMiSpvn1i7MrzDe2zs9rxQdcGKvPhUdoutZs6mO/jAizXGu6giJN7k1+7rkrA0oPPD
 /YyryRNxCKZS3D1o4GNbgskFinoYRKQJ62hEGHR//i70o4vs4jCmDSffs2vBPPUMV3TSchfipFL
 DnFTTHU54S/WBWgauQRWhnsDsnvT9fUwh++RWtoCYLMBf21ANtpBk7T8WxXL52tuoG0wSMVW6hF
 EGYZD0zJEj78F8i6ke4hP7jD2kZxuj2XcOAMdURGpjCyN48TzUudTVVMkF5RTpT4YxEc6Syt6lp
 JzolO8j4Qhg==
X-Google-Smtp-Source: AGHT+IHMD1aP/Wpogv7IoutMlL8YlXO6P2Hu8HIWE2cSle7SIQHie/5zCiL4Xx8axF87UD18PdgO8Q==
X-Received: by 2002:a5d:5982:0:b0:390:e9b5:d69c with SMTP id
 ffacd0b85a97d-39c120e3873mr9871980f8f.25.1743490898168; 
 Tue, 01 Apr 2025 00:01:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:57 +0200
Message-ID: <20250401070125.3705126-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Vikas Manocha <vikas.manocha@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 6/6] configs: stm32f769-disco: support
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Replace board with configs in the commit title
- Add Reviewed-by tag of Patrice Chotard

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
