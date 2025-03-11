Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE145A5C3E5
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Mar 2025 15:35:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0959C78F85;
	Tue, 11 Mar 2025 14:35:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F614CFAC4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 14:35:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BBP1Io032117;
 Tue, 11 Mar 2025 15:35:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=7qrObWKXJMeZ9YuLfCA7fz
 yVX5ktCjcsTNoyh+fy544=; b=ugJGvfLAUsru+MtEPUWjM1OuRVyC6fP1PXuMi5
 e5GGIGY/u911VEpWGyKD6fiR+mKL1VuoC0e6kWhafhKCS2F1ofmahTAoeCB0c6IX
 ZdK5vh7xh41odzfXsfuA1wRswaPzgd4VfMoptTtOV8ue3THWck79dqoMF0Q2YU5P
 h4znPNAsBFzEE5j5Lb1du69kEWwvQBEFJQiIJU7SqiMasYTUAkkvhDC4cN5QLRgH
 dfGto574W8Pj82YN9JzjqH0p9dJ1wH/P86LN6UJau8WSfOPZ826BQmMwFqZYiwoh
 8ufXAqKL8yV2q/526FQkjy0YRt0dxxwIjtxKRBHPkjyfeHHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458f57dk95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 15:35:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4D6AA400A3;
 Tue, 11 Mar 2025 15:33:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50B9F598413;
 Tue, 11 Mar 2025 15:31:27 +0100 (CET)
Received: from localhost (10.48.86.119) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:31:27 +0100
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Mar 2025 15:30:33 +0100
Message-ID: <20250311143037.818675-1-cheick.traore@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.119]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Simon Glass <sjg@chromium.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 0/4] Add support for STM32 TIMERS and STM32
	PWM
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
* drivers for MFD STM32 TIMERS and STM32 PWM, the driver split is
  inspired by kernel model
* enable these drivers on stm32mp13 for PWM backlight available on
  stm32mp135f-dk
* timer node, pwm subnode and pinctrl for PWM Backlight on
  stm32mp135f-dk

Changes in v2:
- remove pwm-uclass patch because some drivers already manage the config
  in case the duty_ns exceeds period_ns
- add the check of duty_ns and period_ns parameters in pwm-stm32 driver

Cheick Traore (4):
  mach-stm32: add multifunction timer driver support
  pwm: stm32: add driver to support pwm with timer
  configs: stm32mp13: Enable MFD timer and PWM for stm32mp13_defconfig
  ARM: dts: stm32: Add TIMERS inverted PWM channel 3 on STM32MP135F-DK

 arch/arm/dts/stm32mp13-pinctrl.dtsi         |  15 ++
 arch/arm/dts/stm32mp135f-dk.dts             |  14 ++
 arch/arm/mach-stm32mp/Kconfig               |   6 +
 arch/arm/mach-stm32mp/Makefile              |   1 +
 arch/arm/mach-stm32mp/include/mach/timers.h |  55 ++++++
 arch/arm/mach-stm32mp/timers.c              |  82 ++++++++
 configs/stm32mp13_defconfig                 |   4 +
 drivers/pwm/Kconfig                         |   8 +
 drivers/pwm/Makefile                        |   1 +
 drivers/pwm/pwm-stm32.c                     | 205 ++++++++++++++++++++
 10 files changed, 391 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/include/mach/timers.h
 create mode 100644 arch/arm/mach-stm32mp/timers.c
 create mode 100644 drivers/pwm/pwm-stm32.c

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
