Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A48A77CD2
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:53:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A55C78F98;
	Tue,  1 Apr 2025 13:53:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EC9EC78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:53:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531AWBE0018089;
 Tue, 1 Apr 2025 15:53:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A9mnyV8uzSLWNU2L9o59CDrZrHilOidkab4s8SCGILM=; b=2ZYKWhhieOsQnsUv
 9g37DgLwUkEi4UbD39+1q64ioyxI3TIfNx0bL+6TNhWZxSEUB665BcNBWN2M7jMJ
 XCCyqsO+uyZ7duvpO6ulxhYdfgnjnGGhdmzO5Q5RZXXG2Eh28gAkmdIyD0tg8rRP
 0noug1gqGGzO5zn5oLN9jrM9+KN4kNTdE6h7IwwFGeYPXxLaOLCrYAoEYCgY9B/X
 TfiQnwYfG0jc2HEN2xbeWt4Sr7154akqLYnXAlFL521JEs99ABdxvnJA7yGwmaJ6
 0waLwSKkHuqzMgTwkQKnHBunlwhHGonh35u3gjr6FG56H2GPQQ9Ok6hemk7bS7zW
 5TsXNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75q60k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:53:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14AE040049;
 Tue,  1 Apr 2025 15:52:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51C7C8A5401;
 Tue,  1 Apr 2025 15:51:43 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:51:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:51:29 +0200
Message-ID: <20250401135132.395518-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401135132.395518-1-patrice.chotard@foss.st.com>
References: <20250401135132.395518-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 3/6] configs: stm32f769-disco: Fix console
	cmdline
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

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f746-disco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 2d18d777a00..24bf6e6a086 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -18,7 +18,7 @@ CONFIG_AUTOBOOT_KEYED=y
 CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
 CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_BOOTARGS="console=ttySTM0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_DEFAULT_FDT_FILE="stm32f746-disco"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
