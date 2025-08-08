Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B0B1EB61
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Aug 2025 17:15:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52A3FC3F952;
	Fri,  8 Aug 2025 15:15:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841F0C349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 15:15:54 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EUQr6010731;
 Fri, 8 Aug 2025 17:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=18X4nER+qhwtSHEeDPiwUt
 2aJe0bLKFRAlAwj+tD7Mw=; b=NPzOvmwG0VKk5rrdSWzzW0exgVMjmMS5/Lokjs
 2co2KA+Ds5RAsG+ejjJ1pnGw5UFL/0p1KWBa+KOTjclQLC4ajoUniV4sWmdaVrLe
 YtwskfQjKNaUDVI6AofAQWmkI1wNL6gkB1dcpvrP1SqV44G8jZIoKILiv5jUMM/A
 x+N6F7t6jgG5lo1HzZnamXZJX8WUEbdVe+8L1YSzZSJbQZeN9RM7TJ6M7ZuBjAeU
 HbdLWn1vywH8f1lRH4cJ3NEj67xdOorfm3VcIa4neUbAzvlO5yk8waUMoADwAlOm
 5eXx2Wt4SNZkLPID4+/FeDQMI8soY8f8h1hTbvR/O6Doj1IQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx0crhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 17:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C27174004B;
 Fri,  8 Aug 2025 17:13:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 365DD718A8F;
 Fri,  8 Aug 2025 17:11:58 +0200 (CEST)
Received: from localhost (10.252.12.105) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 17:11:57 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Aug 2025 17:11:49 +0200
Message-ID: <20250808151154.472860-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.12.105]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Stefan Roese <sr@denx.de>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Alexander Dahl <ada@thorsis.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 John Watts <contact@jookia.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: [Uboot-stm32] [PATCH 0/5] stm32mp2: Add SPI flashes support
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

This series introduces 2 new drivers:
  _ STM32 Octo Memory Manager driver
  _ STM32 OSPI driver

It adds resource check helpers which are used by OMM driver.
It adds and enables OMM and OSPI driver support for stm32mp257f-ev1 board

Patrice Chotard (5):
  ioport: Add resource check helpers
  memory: Add STM32 Octo Memory Manager driver
  spi: Add STM32MP2 Octo-SPI driver support
  configs: stm32mp25: Enable configs flags related to SPI flashes.
  ARM: dts: Add flash0 partitions for stm32mp257f-ev1-u-boot

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi |  41 ++
 configs/stm32mp25_defconfig              |  15 +-
 drivers/memory/Kconfig                   |  17 +
 drivers/memory/Makefile                  |   1 +
 drivers/memory/stm32_omm.c               | 421 +++++++++++++++
 drivers/spi/Kconfig                      |   8 +
 drivers/spi/Makefile                     |   1 +
 drivers/spi/stm32_ospi.c                 | 623 +++++++++++++++++++++++
 include/linux/ioport.h                   |  16 +
 9 files changed, 1142 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/stm32_omm.c
 create mode 100644 drivers/spi/stm32_ospi.c

-- 
2.25.1

base-commit: b01f49c61b9401b5fa089d39808a4dc8f83bf05a
branch: upstream_OSPI
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
