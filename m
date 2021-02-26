Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4D3262F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 13:52:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA641C57B59;
	Fri, 26 Feb 2021 12:52:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1F6CC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 12:52:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k66so7716377wmf.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 04:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9AIEoAJZqhU52eDGqxn9PqpyDjXaBOg3qdkwZr/Lxk=;
 b=FsaaVnjvecmyDGsLhf6CLUmlK3LJ+eVWl1b7wuE/ukX05oiSUus6GV0spXnAHqOOea
 yanObVtMstLJmdRfat8DumZfapRlLm3YsvlQom7cvaSgccc8sMgwwFfaenc93YIRY5Kg
 SecIzOcYfdqFK+Xi4cctcrqUwmZ6CTfTrC4bYRRzongN7i22MPJ9NgYcdY9MdKc9Y3/a
 6xXcBnVwo5VgTagH0eOnWnxOQaWBnPj3ELgtF+WGu2NSylB5z0jkYHY4SVoaYsasCTvK
 QunMIPtSrNJHoHp4HCCNcFD/4FSYqyvmAy9I82lepgzmbHkFoei8+u7b9RYySkMhjI6B
 5OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9AIEoAJZqhU52eDGqxn9PqpyDjXaBOg3qdkwZr/Lxk=;
 b=iN10McUC8pEeQR0uh5OG6F9uYDAVTplEZgBOlhUPqE4Co/Izp+9kwyRAuWJF2G/YU3
 P3yVMqG4l0Pm3EKOslrxVAmbuW9hRSTf2ThlURL8m02G7M7KtIW1VpTiAUmMlBNCfy1V
 pt1blBpINRUaZHpMBZJfPwhV5AagEGWu32TTCQQCw8Ei23nHmOdOsaXLhXTJj/RKv5Y/
 sveERDLEazeSO+XMfOErT/9H3pn3+PRQTStmxz7baqJcPJNcDnpyvs4PDHqBqJtXwCru
 ZMpvrmwK8FhaaljQb2TgTu/4kg3yqBWlOnLBpDFWDp7nbXL3dZ46APJ9iXnPIelXN12E
 t99Q==
X-Gm-Message-State: AOAM532KCMrIvfX9U3eCpQEeJjy5+tiOdcBul3V8G3fHCmLcr6fNK+JQ
 IFCKl2dICoyks0BpYXh41MfaJA==
X-Google-Smtp-Source: ABdhPJy/S1fMs7VxsW5OY5Rw7+hFQx38cxUQci1DXVDear89kZDgbt3sJUKYmHvqtO7FXe7UqFjKmw==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr2773508wmg.65.1614343974405;
 Fri, 26 Feb 2021 04:52:54 -0800 (PST)
Received: from apalos.home ([2a02:587:4647:e6c6:2e56:dcff:fe9a:8f06])
 by smtp.gmail.com with ESMTPSA id u142sm12015778wmu.3.2021.02.26.04.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 04:52:54 -0800 (PST)
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: patrick.delaunay@foss.st.com
Date: Fri, 26 Feb 2021 14:52:51 +0200
Message-Id: <20210226125251.2150584-1-ilias.apalodimas@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PATCH v2] configs: stm32mp1: enable uefi related
	commands
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

The board can boot with UEFI. With the latest changes in U-Boot's
EFI subsystem we also have support for EFI runtime variables, without
SetVariable support.  We can also store the EFI variables in a file on the
ESP partition and preserve them across reboots.
The env and efidebug commands are missing in order to configure
EFI variables and the efibootmgr though.  Since U-Boot's default config
enables other EFI related commands (e.g bootefi), let's add the env related
and efidebug commands and allow users to do that

Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
Changes since v1:
- Apply identical changes on stm32mp15_basic_defconfig
 configs/stm32mp15_basic_defconfig   | 3 +++
 configs/stm32mp15_trusted_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index def6a51b4031..1c680984b876 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -34,6 +34,7 @@ CONFIG_SPL_SPI_FLASH_MTD=y
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_ADC=y
@@ -49,6 +50,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_BMP=y
 CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
@@ -164,4 +166,5 @@ CONFIG_BMP_32BPP=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
+# CONFIG_HEXDUMP is not set
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index da31b74cdeb6..107041119f1d 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -17,6 +17,7 @@ CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 CONFIG_CMD_ERASEENV=y
+CONFIG_CMD_NVEDIT_EFI=y
 CONFIG_CMD_MEMINFO=y
 CONFIG_CMD_MEMTEST=y
 CONFIG_CMD_ADC=y
@@ -32,6 +33,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_BMP=y
 CONFIG_CMD_CACHE=y
+CONFIG_CMD_EFIDEBUG=y
 CONFIG_CMD_TIME=y
 CONFIG_CMD_TIMER=y
 CONFIG_CMD_PMIC=y
@@ -144,4 +146,5 @@ CONFIG_BMP_32BPP=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
+# CONFIG_HEXDUMP is not set
 CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.30.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
