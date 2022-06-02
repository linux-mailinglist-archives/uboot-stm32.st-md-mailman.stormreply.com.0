Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E3053B94F
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jun 2022 15:05:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B55CC0D2C0;
	Thu,  2 Jun 2022 13:05:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9C59C03FFF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 13:05:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25284K9X018004;
 Thu, 2 Jun 2022 15:05:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=jJSYuRrOpbM1WlrrrG2bMh3GAUpSuGYUD75EeWDS7eI=;
 b=B6gZqp6xYQHV869HUH1/mMzmOkDtU8fclY8lU1arKfmNqSMGEF1H43EhXsogQtuDbDMl
 PDepok4+2uFyGM9IyLDCy6GOrTD9K64cvJKcEGYLS8UoxoKSgtgqNryhfDUtbmDpcyKn
 zrL9STwoMXMl0uj/0dBj2P7NfoflFMDL1Lx4Zg7/svhGZ9KSMEIkAVyeemXqbGjTBWkS
 SPgrKYQzF2vi3xn0tDi2z/UKoqto4S4lny7rt81sfL/2RX97CvvD53SqI0ZsG8KS0aWl
 MZZLbdocjeK96CMYLMHv8I+B2dn+BwzNvcu/B4Re0/fY8GBzihMdHsNceSEL2A0pl39B aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc2w01q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 15:05:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 439E710002A;
 Thu,  2 Jun 2022 15:05:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3356B226FB3;
 Thu,  2 Jun 2022 15:05:42 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 15:05:41 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jun 2022 15:05:32 +0200
Message-ID: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_03,2022-06-02_01,2022-02-23_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 0/3] stm32mp: prepare RCC support for
	STM32MP13
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


Prepare the support of STM32MP13 RCC, the reset and clock controller
- update of the RCC MISC driver to bind the correct clock and reset driver
- reset driver, same than STM32MP15x = drivers/reset/stm32-reset.c
- clock driver, add a stm32 sub directory to prepare the addition of
  stm32mp13 drivers named "stm32mp13_clk";
  the stm32mp1 driver is only required for STM32MP15x family
- Add RCC node in SOC device tree with the needed tag
  u-boot,dm-pre-reloc property

This serie is only a preliminary step for STM32MP13 clock and reset support
in U-Boot, based on Linux kernel binding [1];
It prepares the next device tree alignment with Linux kernel and simplify
the review of the serie with addition of STMP13 clock driver based on CCF
and on SCMI clocks provided by OP-TEE, with files
- drivers/clk/stm32/clk-stm32mp13.c
- drivers/clk/stm32/clk-stm32-core.c

In the V2, I remove the addition of a dummy stm32mp13 clock driver:
  [2/4] clk: stm32mp13: add a STM32MP13 RCC clock driver

[1] Introduction of STM32MP13 RCC driver (Reset Clock Controller)
    https://lore.kernel.org/linux-arm-kernel/20220316131000.9874-1-gabriel.fernandez@foss.st.com/


(no changes since v1)

Patrick Delaunay (3):
  clk: Add directory for STM32 clock drivers
  misc: stm32mp13: introduce STM32MP13 RCC driver
  ARM: dts: stm32: add rcc node for STM32MP13

 MAINTAINERS                                   |  2 +-
 arch/arm/dts/stm32mp13-u-boot.dtsi            |  4 ++++
 arch/arm/dts/stm32mp131.dtsi                  |  7 ++++++
 drivers/clk/Kconfig                           | 17 +-------------
 drivers/clk/Makefile                          |  5 ++--
 drivers/clk/stm32/Kconfig                     | 23 +++++++++++++++++++
 drivers/clk/stm32/Makefile                    |  7 ++++++
 .../clk/{clk_stm32f.c => stm32/clk-stm32f.c}  |  0
 .../{clk_stm32h7.c => stm32/clk-stm32h7.c}    |  0
 .../{clk_stm32mp1.c => stm32/clk-stm32mp1.c}  |  0
 drivers/misc/stm32_rcc.c                      |  6 +++++
 11 files changed, 51 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/stm32/Kconfig
 create mode 100644 drivers/clk/stm32/Makefile
 rename drivers/clk/{clk_stm32f.c => stm32/clk-stm32f.c} (100%)
 rename drivers/clk/{clk_stm32h7.c => stm32/clk-stm32h7.c} (100%)
 rename drivers/clk/{clk_stm32mp1.c => stm32/clk-stm32mp1.c} (100%)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
