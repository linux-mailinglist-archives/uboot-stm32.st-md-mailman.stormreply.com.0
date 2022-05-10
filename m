Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19FF520F13
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:51:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB97C0D2BB;
	Tue, 10 May 2022 07:51:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C21C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:51:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A2S6gm028201;
 Tue, 10 May 2022 09:51:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=gS1ERYHsyTxEzoU7VfOAv6v3L5i2W5JVDHJJleG5UGk=;
 b=3HcuKJZnc/txnuv6g3T9dWCL8RnHBg/054tdvFP7b+pHho5BqvGHnLdzuMF3gck2D24x
 y4uSzsyibNYu3eXr1aaF47ExU/5iNA0K91305iKFetEB49tw1R2Zw2nfLrKUZNdzm79B
 skhDu1jb2FH3BhZhAgYqwvxiJJlQ4Sz1YnfybjFwOJBr7l2nHiGBeOmPuKDWOEcInAxO
 vHktnsavF7Tu0Rbch012Yi8PXHPJdxjG2gfmPhxluJeMBCamy4tQrQJA2CHb46Y/Av44
 KJPcbRTXE/syh//EwckKVt+RUZFgfKbCMX0sJke5YJxLUiq4C4RJCQHrKm8K7LkoPXpw Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40x9hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:51:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A53210002A;
 Tue, 10 May 2022 09:51:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32C1320F6D7;
 Tue, 10 May 2022 09:51:16 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May 2022 09:51:15
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 10 May 2022 09:51:09 +0200
Message-ID: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/4] stm32mp: add minimal RCC support for
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


Add a minimal support for STM32MP13 RCC, the reset and clock controller
- update of the RCC MISC driver to bind the correct clock and reset driver
- reset driver, same than STM32MP15x = drivers/reset/stm32-reset.c
- clock driver, add a empty driver for STM32MP13x =
  drivers/clk/stm32/clk-stm32mp13.c
- Add RCC node in SOC device tree with u-boot,dm-pre-reloc property

This serie is only a preliminary step for STM32MP13 clock and reset support
in U-Boot, based on Linux kernel binding introduced by [1] and it prepares
the next device tree alignment with Linux kernel.

The functional STMP13 clock driver based on CCF and on SCMI clocks
provided by OP-TEE and the clock and reset references in SOC device tree
will be pushed when the associated patches in [1] will be accepted.

[1] Introduction of STM32MP13 RCC driver (Reset Clock Controller)
    https://lore.kernel.org/linux-arm-kernel/20220316131000.9874-1-gabriel.fernandez@foss.st.com/



Patrick Delaunay (4):
  clk: Add directory for STM32 clock drivers
  clk: stm32mp13: add a STM32MP13 RCC clock driver
  misc: stm32mp13: introduce STM32MP13 RCC driver
  ARM: dts: stm32: add rcc node for STM32MP13

 MAINTAINERS                            |  2 +-
 arch/arm/dts/stm32mp13-u-boot.dtsi     |  4 ++++
 arch/arm/dts/stm32mp131.dtsi           |  7 ++++++
 drivers/clk/Kconfig                    | 17 +-------------
 drivers/clk/Makefile                   |  5 ++---
 drivers/clk/stm32/Kconfig              | 31 ++++++++++++++++++++++++++
 drivers/clk/stm32/Makefile             |  8 +++++++
 drivers/clk/stm32/clk-stm32mp13.c      | 21 +++++++++++++++++
 drivers/clk/{ => stm32}/clk_stm32f.c   |  0
 drivers/clk/{ => stm32}/clk_stm32h7.c  |  0
 drivers/clk/{ => stm32}/clk_stm32mp1.c |  0
 drivers/misc/stm32_rcc.c               |  6 +++++
 12 files changed, 81 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/stm32/Kconfig
 create mode 100644 drivers/clk/stm32/Makefile
 create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
 rename drivers/clk/{ => stm32}/clk_stm32f.c (100%)
 rename drivers/clk/{ => stm32}/clk_stm32h7.c (100%)
 rename drivers/clk/{ => stm32}/clk_stm32mp1.c (100%)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
