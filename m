Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C92A54E17
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Mar 2025 15:45:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14BEBC78F87;
	Thu,  6 Mar 2025 14:45:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24AEBC78002
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 10:58:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526Aejig011586;
 Thu, 6 Mar 2025 11:58:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 i/snMCnJixAHXdzDlHEEMGgsJ6i6LzF7oq2DLQKFhRM=; b=cZ53B4PFTBsOg9bF
 Lvn/nOeobKyqx6TFeMw66oN1EwgarT7ShqDA4hr8ECv2HVrfpWBUuQ4BegY02M97
 Z+0RHrMqAKchaEGcRF65MzExFYM5PD/kqyWOkjfm7xyoS3A6emPltsiG2RS7+cpO
 8eBbMXcPh4olx0jPa6g9uC9a0Kp9jU/a4StMfX5G4MVWasX/ecURkexHb+PadCE8
 swANwEGfx7zWGyeGl4AFiTY4cZDKBh7KNP/+qs6CWezc3WwbdiH8rlLxl3/Hv84W
 IyjCCW7nkSgnW1gQKsTIovaHDmhkj7wFGyF/mDvdOc7hDq+0ZQLIAM3189zBEl6b
 izxfLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 457a5pg4k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 11:58:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3EB0940075;
 Thu,  6 Mar 2025 11:57:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D357A5027C1;
 Thu,  6 Mar 2025 11:57:01 +0100 (CET)
Received: from localhost (10.48.86.119) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:57:01 +0100
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 6 Mar 2025 11:56:19 +0100
Message-ID: <20250306115558.4.Ia1fceae36361c33b1ad9e8b92f55e74aafa4078b@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306105620.624760-1-cheick.traore@foss.st.com>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.119]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Mailman-Approved-At: Thu, 06 Mar 2025 14:45:13 +0000
Cc: Tom Rini <trini@konsulko.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/5] configs: stm32mp13: Enable MFD timer and
	PWM for stm32mp13_defconfig
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

Enable the following configs:

* CONFIG_MFD_STM32_TIMERS: enables support for the STM32 multifunction
                           timer
* CONFIG_DM_PWM: enables support for pulse-width modulation devices
* CONFIG_CMD_PWM: enables 'pwm' command to control PWM channels
* CONFIG_PWM_STM32: enables support for the STM32 PWM devices

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
---

 configs/stm32mp13_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 0acd1487c9a..4c6a7f82fe5 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -10,6 +10,7 @@ CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_STM32MP13X=y
 CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
+CONFIG_MFD_STM32_TIMERS=y
 CONFIG_TARGET_ST_STM32MP13X=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
 CONFIG_CMD_STM32PROG=y
@@ -31,6 +32,7 @@ CONFIG_CMD_UNZIP=y
 CONFIG_CMD_CLK=y
 CONFIG_CMD_FUSE=y
 CONFIG_CMD_GPIO=y
+CONFIG_CMD_PWM=y
 CONFIG_CMD_I2C=y
 CONFIG_CMD_LSBLK=y
 CONFIG_CMD_MMC=y
@@ -80,6 +82,8 @@ CONFIG_DM_REGULATOR=y
 CONFIG_DM_REGULATOR_FIXED=y
 CONFIG_DM_REGULATOR_GPIO=y
 CONFIG_DM_REGULATOR_SCMI=y
+CONFIG_DM_PWM=y
+CONFIG_PWM_STM32=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_STM32=y
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
