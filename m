Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13D5AEEAD
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 17:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABC0C63328;
	Tue,  6 Sep 2022 15:26:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C50C03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 17:34:00 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id az27so12201013wrb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=KdeUDmsFJfFscHXb8uLXiXF67J41mi/+x31N971sSB4=;
 b=G1FX66yRbREikSBM7hhP0KNtszFZvcOizdfciP6FSqYNqoOhpKVHgMkhoiKZg+ELkY
 HB0FUFyBrerDUCV4IL/0DJAeQ1YJctwtXMACVktZVxvdB4FfHtIkQNsVFge9ql2GFc+G
 iRE8LDZu/yu+8qlznyu7iH+0vz8LRJnZBP0JkWKQYC19R2MdQs+QselkzIodOhkzTNft
 9HW3X1xyI1GuWzhhZ8BCD6PSXOVt2s3Pxubo4No09OXApMibCU0j0suwZiXgespVHK14
 58cXC6uP5oq8llu4nu+39a0gDqtsog/432NopIXP35Thn10NffaF+711WHrTttYFefAu
 U8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=KdeUDmsFJfFscHXb8uLXiXF67J41mi/+x31N971sSB4=;
 b=Oyfl865tB4EAl6UHTQw8j/2gKdrbZwxIkutNnD/J34u2QhATjk2tXvjkzthGyVR0lC
 Ql6d+VI4lkXO2VgJx/ITG+hpx0GCxdIdWnY0Gf4twNEcsd9KO+XsqJEv2mYO9huMW4jd
 YnrO526Jrm+5rR1+7hznFV0bYoNB33oiXoEZCaM+zdMIjZPLY47JGDqzdWQylRm+vqin
 SJ0O2RlX6w+VmdbiAMz9rdWbt7IRzfbK2qKsX44Mi+t44aYncPRqDF82RKulBTm9N59D
 s6MYP45/gJrMVzdZSM4SPmunnpRZ3KqhNbEgjFjB4me3mm2Gm3G94/7gAQGNSc1Ktox7
 z3/w==
X-Gm-Message-State: ACgBeo3aElBLazmfGFqB00GrzT7KaZxCLE9fXa1Eba1HTAiQy9X3XBAc
 nVecPulkpR4NYDfYYwLb5yYJnw==
X-Google-Smtp-Source: AA6agR5GvSWzP8pSmnyskqkd5tmSu4B2Ltm1jxbaHNrLIXxRyCDCTXdtJv11biD1JvWLveWccYJQJg==
X-Received: by 2002:a5d:468a:0:b0:226:d78a:6af with SMTP id
 u10-20020a5d468a000000b00226d78a06afmr23528512wrq.339.1662399240548; 
 Mon, 05 Sep 2022 10:34:00 -0700 (PDT)
Received: from localhost.localdomain (131.red-83-60-92.dynamicip.rima-tde.net.
 [83.60.92.131]) by smtp.gmail.com with ESMTPSA id
 t8-20020adfe108000000b00225213fd4a9sm9583448wrz.33.2022.09.05.10.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 10:34:00 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge@foundries.io>
To: jorge@foundries.io, patrick.delaunay@foss.st.com,
 patrice.chotard@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@lists.denx.de, cryosay@gmail.com
Date: Mon,  5 Sep 2022 19:33:57 +0200
Message-Id: <20220905173357.2231466-1-jorge@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Sep 2022 15:26:29 +0000
Subject: [Uboot-stm32] [PATCH] configs: stm32mp*: fix system reset
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

Fixes: 11517ccc8c52 ("configs: add stm32mp13 defconfig")
Fixes: 17aeb589fa9d ("stm32mp15: remove configs dependency on
                      CONFIG_TFABOOT")

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
