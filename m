Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE920325F1D
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 09:34:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC1CDC57B59;
	Fri, 26 Feb 2021 08:34:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F662C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 19:37:58 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v15so6406933wrx.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 11:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7A//OH9OqL/s/ScbpjslRhxO+Z5uD3rFt+M6PDnUrPA=;
 b=EU1fnru59CWueCMHwaHGPiSmY4is3/2KSsmD6eDrB3/KGn47ncnY0EYTPIRbBAjGt/
 bpD8XUWyYUbvj5pZ+K4JWXOOvv7Zdt0TcMsjSZrPEdZG7QHMT92NkfzRBAqptMIRiNeS
 06aTjpSBCsy2uS6p+1Avrh0/ZipVJFx9nuzug5JEXotKOJ7I7NFipt4oUm/6/KZJB3Tk
 I9HwVwDgJJXLMcuQcVSwiWCexyEalS9+DvL9iSKOqz51EepoPYt0e8kc1yu8nL6FOQp4
 rZAQjYU2Z+lOGN7eMlUjMYIeT/NLu3qHf5kCSnoeug709HaetRFFmeGV0fVQ93qmN10Y
 dw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7A//OH9OqL/s/ScbpjslRhxO+Z5uD3rFt+M6PDnUrPA=;
 b=R/nEixAnYdGiOR+y77++yYzUG7iXx6xhagRpoiunuEObALb4Z8s7K0+ZYBXprcG2L5
 7wHOlKqPbJ4/BScDNzUPJJ51cVs580/Df/R0HhJJXdlW8uvtzsmI+V6qfGJmpywwI2x2
 PjIBpVKelc2BOjf0jOGV4uguVI5Ku5/9xxtpXidd2XlRLGIdBuKNF/S2ZBJ6/8+BMR5m
 cjTGNrBBP+1pzCP90dEGGoiRX0m07h+quwdk2qDEne+cGITAyR/tp3Q6W7RXXhBxoboN
 U0sw7elo1asojH2HNZqC6PBav0yD++HAsv8wJfVUoDPQJZvcC2EMEEN+JWfKSYgm6hE/
 wg6Q==
X-Gm-Message-State: AOAM532N3wjSHK/h1Al+twBpJTD1T/ah+On8QmrzybB7X6WSMEMjERSb
 cfjCa705KTF4AyLODtybe5RArQ==
X-Google-Smtp-Source: ABdhPJyXJcx8b0+0edMSu5ntouk0HhXnFd61dzeMfI4hzFLmcrKVkrpwXBevabJ1wPoKduudMGIQXw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr3991319wrt.168.1614281877674; 
 Thu, 25 Feb 2021 11:37:57 -0800 (PST)
Received: from apalos.home ([2a02:587:4647:e6c6:2e56:dcff:fe9a:8f06])
 by smtp.gmail.com with ESMTPSA id o20sm8276789wmq.30.2021.02.25.11.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 11:37:57 -0800 (PST)
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: patrick.delaunay@foss.st.com
Date: Thu, 25 Feb 2021 21:37:54 +0200
Message-Id: <20210225193754.1898064-1-ilias.apalodimas@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Feb 2021 08:34:01 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: enable uefi related
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
 configs/stm32mp15_trusted_defconfig | 3 +++
 1 file changed, 3 insertions(+)

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
