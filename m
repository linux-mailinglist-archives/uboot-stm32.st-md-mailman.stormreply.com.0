Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22915AE1F81
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Jun 2025 17:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB1D5C3F933;
	Fri, 20 Jun 2025 15:55:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A40DC3F932
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jun 2025 15:55:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEIxbq032109;
 Fri, 20 Jun 2025 17:55:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=31SYFPA17URB6ekTWuOsxm
 49ROPCf+fIMa15yXPx+xE=; b=PFr59Bc2vbpe8uspOzXrWdOhD485zvJAM6khFi
 +zHVtSMoU3a7Au+2ALszdDk+RlxexYOfZDLCLdtXVnJUdfcBMiBS54VLXNk6ioni
 WvCGoKKv46Hd20YCGRjq9JbYFPlAM2xagAyD1AGH3+UWbumfkg16pRPrpk1mkSIU
 kltefN7uBHys6FyzAJ4PnjRdvQjay0xrwKSEHiVm9uIGhA/VX2m9PEQj8WTBh0V0
 uy8W0KPgkHPu8TsW6+UyjNm96cM3hjtZbji1jag4plhX/LOv4EDrmzzowH46EdGP
 plhlCRihgooT5Fw/XqFySlgppD53rueENp5VXqbmoryF/SMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x7af659-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jun 2025 17:55:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84B844007B;
 Fri, 20 Jun 2025 17:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E65FB29719;
 Fri, 20 Jun 2025 17:51:14 +0200 (CEST)
Received: from localhost (10.48.86.135) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 17:51:14 +0200
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 Jun 2025 17:49:57 +0200
Message-ID: <20250620155000.1258718-1-cheick.traore@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.135]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Sughosh Ganu <sughosh.ganu@linaro.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 0/3] Add support for STM32 TIMERS and STM32
	PWM on STM32MP25
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


This serie adds:
* drivers support on stm32mp25 for MFD STM32 TIMERS and STM32 PWM
* enable these drivers on stm32mp25


Cheick Traore (3):
  arm: stm32mp2: add multifunction timer support for stm32mp25
  pwm: stm32: add support for stm32mp25
  configs: stm32mp25: Enable MFD timer and PWM for stm32mp25_defconfig

 arch/arm/mach-stm32mp/include/mach/timers.h |  9 ++++++
 arch/arm/mach-stm32mp/timers.c              | 34 ++++++++++++++++++++-
 configs/stm32mp25_defconfig                 |  4 +++
 drivers/pwm/pwm-stm32.c                     | 11 ++++++-
 4 files changed, 56 insertions(+), 2 deletions(-)

-- 
2.34.1

base-commit: 0c6c8065a27804705c324f06998fea219e62f028
branch: upstream
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
