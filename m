Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E95A77F4
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Aug 2022 09:46:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82035C640FB;
	Wed, 31 Aug 2022 07:46:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 043C6C03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 19:50:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so10541535wmk.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=A26s4rjud7WyT5e0KyOiwNtWfwSVEhhuyxr5uHxk7S0=;
 b=KbuikaWXV2R+H8mDVG0TguHNySGla9TM9rTWKsrvAHx6ZeMDAEM/gUaQGjtzHGkDh6
 ktLr1jRUuYyA9hHNZ2rMA0rYbWBUZil4TrYdmMTmmsxGt5c747mR4FVPIkV3/obwwWV7
 UeqWRKdHhUmHwjlZBDGmblNHznIFyhHROT9p2F2aVpCDIcb8k7zsSjjJweth6miafCfO
 J4X+gJP/VQ9fpUimL4hsl04Eoy/wrntBgClJCaHCVTSK1115EyASpS+lwtEq4pLqiP7e
 AOE+H2zxlXHzh78NDY3Gj2MpeF4fVUh0pg5zkGfBw3TWCUDj+0zWsmr9owPmDZOziSeO
 2cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=A26s4rjud7WyT5e0KyOiwNtWfwSVEhhuyxr5uHxk7S0=;
 b=adG+XB+GTFPMsaXep9C7WKm6vqulMaOj63w2Ya06kRdEv6DnpjK2Xff/4Wf9wuhzJY
 ALg/5oOeHeShig0RWurYyiPvuj90xV3CvtJcmWxBX3dpxUt9tWhWRW346+m+QfICuPP7
 MHWIqNsSp17QggWQ/0lbSKR/pUaro7232XYwu1JImxymyeDF8A3F8+T/nRH1BeMycu88
 m3wWB8pRn3aP/hdZutCl9AMI6m6Az8XZ9SFxF98IRTnq9xbK6yGshE6bp4OMBxLu9XVm
 PF/4D9AjMtwjpro1Wx4434GwO63EKk+zwayJfWx6VtlP3QUbccYNTG6rvXBZleSJzTTN
 zwmA==
X-Gm-Message-State: ACgBeo1j21iRhBJQctfI/gJdSvAADLxoGNef3EQ2eFdiWQfHh0LENmNf
 FbYaUCEwbOcQGtYo0NekrOpMF5I0NSod3A==
X-Google-Smtp-Source: AA6agR7CezvX+yNWSwwDd3EgHO8xqe1aNoM9hzxJ+9aLM5rjzbWB06T99vxPjrmd/b0Md+ZdCn6hrg==
X-Received: by 2002:a05:600c:1c0f:b0:3a5:4d6b:a883 with SMTP id
 j15-20020a05600c1c0f00b003a54d6ba883mr10763112wms.45.1661889054405; 
 Tue, 30 Aug 2022 12:50:54 -0700 (PDT)
Received: from localhost.localdomain (131.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.131]) by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b0021f131de6aesm10417258wrm.34.2022.08.30.12.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:50:53 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com
Date: Tue, 30 Aug 2022 21:50:49 +0200
Message-Id: <20220830195049.1068973-1-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Aug 2022 07:46:52 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 mike@foundries.io
Subject: [Uboot-stm32] [PATCH] configs: stm32mp*: reset via CONFIG_RESET_SCMI
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

Enabling CONFIG_SYSRESET_PSCI prevents CONFIG_RESET_SCMI
from executing.

The side effect observed are I2C devices no longer being
accessible from U-boot after a soft reset.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
---
 configs/stm32mp13_defconfig         | 1 -
 configs/stm32mp15_defconfig         | 1 -
 configs/stm32mp15_trusted_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 673b468d31..44cee2e656 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -69,7 +69,6 @@ CONFIG_RNG_OPTEE=y
 CONFIG_DM_RTC=y
 CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
-CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index e5a2996c2c..2ad02f3652 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -133,7 +133,6 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
-CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index e14668042f..9e24e82920 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -134,7 +134,6 @@ CONFIG_SPI=y
 CONFIG_DM_SPI=y
 CONFIG_STM32_QSPI=y
 CONFIG_STM32_SPI=y
-CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 # CONFIG_OPTEE_TA_AVB is not set
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
