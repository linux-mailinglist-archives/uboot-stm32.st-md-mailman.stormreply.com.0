Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BA7BCF26
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Oct 2023 17:46:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA6DFC6C840;
	Sun,  8 Oct 2023 15:46:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD52C6C83F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 15:46:03 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-9b27bc8b65eso621853866b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696779963; x=1697384763;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYfwL2WcYkTESMo8PhVd9vt5pMAPOrPuFkm0TeDsJ80=;
 b=SS3dCb23f/lo+Uj1Yb4DLH9Q6WsKvWHnoTPAaE4ld1PsY5xrb2oQLt4t6hSK9S5VpE
 sdLz4+UGllNhbtIjPn4kRdmZKSWPuNTyGJA+va8zzjJPrLFOL/1ue/DD5TYE5I72wlIr
 /SUxIsj5UfDQqXY/GBi0neHUF4Pa3pIBF6nQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696779963; x=1697384763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AYfwL2WcYkTESMo8PhVd9vt5pMAPOrPuFkm0TeDsJ80=;
 b=wuAQCA4/WQTgS12VHrbG06MRRcVTTUhbB6DHa0xn5qipXaXa29QXrN07Opj75oJfmI
 3Yw58+z8g3YDcEnmeTyGUvRK558R7OBoTZ6Imp3jYxCB4NvbF5nnSeTsrTKu+zjagPl0
 kTuYZ6RBOreim3jGKDdF2EZZEVyLkj96XQyToJ2M2nQ0xOXYLWLJOR9wf0p3jTJiUrjN
 iAzkvTeVBUiNsH/3nN5zZdt7J7D+9iiAuLY0E29vnRTFOn9AiV1PxnWDz7Cnmy7Fh2aS
 VevO5m64iaNNmXuhuxzC6hUb0E++H8g3A6d/PyCFhPyenvhjPCYiVsMnz1M1/ltDDBxV
 lNFA==
X-Gm-Message-State: AOJu0Yzc5TwsnLoA/xAFk5R/qavegGO7QNKajU/okIo4b2VO9AM+Dj0K
 rLplGsmRKJgcUzQoJg/F8L2rdg==
X-Google-Smtp-Source: AGHT+IEpCfHl7deKJXSoV1tFKc7TBJw1zOyM5juHX86rIcwpDT8vY2+H71lCmFDq1XRFe50Vz5fbjQ==
X-Received: by 2002:a17:907:77d0:b0:9a5:81cf:57b5 with SMTP id
 kz16-20020a17090777d000b009a581cf57b5mr10735961ejc.2.1696779963510; 
 Sun, 08 Oct 2023 08:46:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-50-102-159.retail.telecomitalia.it. [79.50.102.159])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm5623981ejb.131.2023.10.08.08.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 08:46:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Oct 2023 17:44:57 +0200
Message-ID: <20231008154538.1622772-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
References: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH v2 5/5] board: stm32f469-disco: add splash
	screen with stmicroelectronics logo
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

Display the STMicroelectronics logo with features VIDEO_LOGO and
SPLASH_SCREEN on stm32f469-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag to patches 1, 2 and 3 of the series.
- Fix frame buffer allocation for stm32f469 discovery board.

 configs/stm32f469-discovery_defconfig |   3 +++
 include/configs/stm32f469-discovery.h |   2 ++
 tools/logos/stm32f469-discovery.bmp   | Bin 0 -> 18532 bytes
 3 files changed, 5 insertions(+)
 create mode 100644 tools/logos/stm32f469-discovery.bmp

diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index 85e795e83e7d..b7e35aeae200 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -42,12 +42,15 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_VIDEO=y
+CONFIG_VIDEO_LOGO=y
 CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=480
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
 CONFIG_BMP_16BPP=y
 CONFIG_BMP_24BPP=y
 CONFIG_BMP_32BPP=y
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 62a7e9af0c56..75bb9cd8d06f 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -31,6 +31,8 @@
 			"scriptaddr=0x00418000\0"		\
 			"pxefile_addr_r=0x00428000\0" \
 			"ramdisk_addr_r=0x00438000\0"		\
+			"splashimage=0x00448000\0" \
+			"splashpos=m,m\0" \
 			BOOTENV
 
 #endif /* __CONFIG_H */
diff --git a/tools/logos/stm32f469-discovery.bmp b/tools/logos/stm32f469-discovery.bmp
new file mode 100644
index 0000000000000000000000000000000000000000..ecc8d984218fb13fddf0ba9cf68f2cfad829e289
GIT binary patch
literal 18532
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

literal 0
HcmV?d00001

-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
