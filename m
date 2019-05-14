Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD41C5EE
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 11:22:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8C3C35E04
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 May 2019 09:22:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8331C35E02
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 09:21:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E9BcPA002310; Tue, 14 May 2019 11:20:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IcKmhQZARGzHp4M7BbOfzqc1APyKoOfz7DaSGOi2Kgg=;
 b=cn0Cehif6HJZLeuQlobRWeYgkuc4//ujEeivhXYYPJjVgnqIVW5TsT7FT3nDsCEVGygi
 mpL7athzG8pygXSWOw8oGtLZzFzq0KATl15h//Z1M5RDxXhAUaB7yj1ajHMTJV5N4mkF
 KrmMyp2T4motHnOvh0PGMzGpDC8yPlGFT6T1PYHzh0sJnbFEttsxLV2rgvCRreENeJ6i
 55zMgArbKVPaYmSmB+vNqH4V+t6fSFQuIKb70QBiuMWe3onq2FufFeGbxV+TQZkuZIMP
 t+KHvmKIt0GJhNeQ4ro5ZKWvl9zveEBee4H/L+IsLGTVeeGetR9LFcYZHim8xof8VnOL pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkuyr1kk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 11:20:55 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5423934;
 Tue, 14 May 2019 09:20:54 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 288C81693;
 Tue, 14 May 2019 09:20:54 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May
 2019 11:20:53 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 14 May 2019 11:20:53
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Albert Aribaud
 <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Date: Tue, 14 May 2019 11:20:36 +0200
Message-ID: <1557825637-25153-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_05:, , signatures=0
X-Mailman-Approved-At: Tue, 14 May 2019 09:22:33 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] configs: stm32mp15: enable IPCC mailbox
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

Activate the ipcc mailbox for stm32mp15 configs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 configs/stm32mp15_basic_defconfig   | 2 ++
 configs/stm32mp15_trusted_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 0ea9dff..f03c72c 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -52,6 +52,8 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
 CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 3c2bb75..525f4c3 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -44,6 +44,8 @@ CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_STM32_IPCC=y
 CONFIG_DM_MMC=y
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_STM32_SDMMC2=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
