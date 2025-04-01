Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCCA77CD3
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:53:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF598C78F98;
	Tue,  1 Apr 2025 13:53:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8809C78F90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:53:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531A8m0N018903;
 Tue, 1 Apr 2025 15:53:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 MG2CVNRlPIEgUQzFQwfptZ1OOb2Xjoc7ODJA2VagNmc=; b=NnLXyq41d5nGaRxy
 h6pxmMRaLB+CVx6JyCfRebQ/Tqa+vURZTqAAJcx1Mdikx0K8tDQQjful4XJt2vSG
 y3s/Nlaf8oltYuWSbGkmDZtOs3ZzB8eh6ThdaKrYC+Pc8mMW0OfkGZRrYt4+jHO0
 fnboLeMrwLM0bkLMOzhDIxQQN5j5hRQs5HJWK3Cto/7qqqrXm5sHBQaWLnqXjvTO
 Xee1piKHAb7icsPr8T9ofWXy0Xm+znU2souf9X9ZW6xY+7OFLGowoTpOfBAkjqfZ
 cMgr++hkp910H83wM80GPOaaKbU366zbWJnUYAyMVcYo6M3QHckqGpJagKfRb88a
 WVdLrw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p75q60k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:53:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E1AB04004F;
 Tue,  1 Apr 2025 15:52:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43C348B22C2;
 Tue,  1 Apr 2025 15:51:44 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:51:44 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:51:30 +0200
Message-ID: <20250401135132.395518-5-patrice.chotard@foss.st.com>
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
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/6] configs: stm32f729-discovery: Fix console
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

 configs/stm32f429-discovery_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index 59416cb7e43..36e57edbb4d 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -15,7 +15,7 @@ CONFIG_ENV_ADDR=0x8040000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
-CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+CONFIG_BOOTARGS="console=ttySTM0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 CONFIG_SYS_PBSIZE=1050
 # CONFIG_DISPLAY_CPUINFO is not set
 # CONFIG_DISPLAY_BOARDINFO is not set
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
