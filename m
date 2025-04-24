Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87618A9A0FF
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:09:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C6C1C78F83;
	Thu, 24 Apr 2025 06:09:20 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DF43C78F68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:09:19 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NGuNtS019309;
 Thu, 24 Apr 2025 08:09:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=xa/NcWVCLRqNYffIISI8Fw
 9y3L8h8e0QHJvGD1eR4Co=; b=lGgtlNoBja59Frk++xfea5iCjKE8AV/PPjAgoU
 2ANlHk4cH4koUQa2SrqJkobLmtNxvUa0fqMFI+YRGdZIII/MgGeDSn99eTtEMbyN
 pEGhsgS5Ejh9aTosQLvfod9/bi66Iwzcp0onSgNf9rISMyW/ztj8jVARNgLgAUdu
 nGr8C7TPQX/g9w4sJk3qyYPDCAu2TB6bKxsUO2mGyuQXUPquWMNcAwdBjPMkctya
 61MTrrsfABhz/OxRnHKkgRH4rxwzAK/NQiW6kOhx2lIaa8X8dt0WG072cA+qxqgb
 7Vl6OKl8DOy9Wt2lJqPuCG9aqVNhjGNYKIibxD83eafQtCDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvdw8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:09:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 387464005E;
 Thu, 24 Apr 2025 08:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 720B4A43FFE;
 Thu, 24 Apr 2025 08:07:38 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:02 +0200
Message-ID: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 00/21] arm: stm32mp: STM32MP25 machine update
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


This series is updating STM32MP25 machine/board support:
  _ update cmd_stm32key.
  _ update cmd_stm32prog.
  _ update STM32MP25 configs.
  _ add leds and buttons support.
  _ add boot_mode support (USB/PXE/MMC/NOR/NAND).
  _ add bootcmd support.
  _ enable MMC support.

Currently, it misses clock,reset and regulator support for STM32MP25
which will be added in a next step due to dependencies with OP-TEE.
For example, due to OP-TEE dependencies, all MMC support is ready
but not functional.



Patrice Chotard (13):
  configs: stm32mp25: add MMC support
  configs: stm32mp25: add bootcmd for stm32mp25 platform
  board: st: stm32mp2: add env_get_location()
  board: st: stm32mp2: add mmc_get_env_dev()
  ARM: dts: stm32: add "u-boot,mmc-env-partition" for
    stm32mp257f-ev1-u-boot
  configs: stm32mp25: add support of NAND and NOR boot
  configs: stm32mp25: add USB host boot support
  configs: stm32mp25: add PXE boot support
  ARM: dts: stm32: add sdmmc1 fixed clock for stm32mp257f-ev1-u-boot
  arm: stm32mp: increase EARLY_TLB_SIZE to 0x10000
  arm: stm32mp: disable console for UART serial boot
  arm: stm32mp: fix package IDs for stm32mp25
  arm: stm32mp: cmd_stm32key: update command for stm32mp25x

Patrick Delaunay (8):
  arm: stm32mp: add boot_mode support for STM32MP25
  board: st: stm32mp2: add led support
  board: st: stm32mp2: add user button support
  board: st: stm32mp2: change bootcmd for ST boards
  arm: stm32mp: implement new STM32MP25 revision ID system
  arm: stm32mp: add helper function stm32mp_is_closed()
  arm: stm32mp: stm32prog: PTA BSEC is not supported on closed device
  arm: stm32mp: stm32prog: add support rootfs-a for OTA

 arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |  16 +
 arch/arm/mach-stm32mp/cmd_stm32key.c          | 286 +++++++++++++++---
 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |   2 +
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |   6 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  16 +
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  24 +-
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          | 170 ++++++++++-
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   |  31 +-
 board/st/stm32mp2/Kconfig                     |   2 +-
 board/st/stm32mp2/MAINTAINERS                 |   1 +
 board/st/stm32mp2/stm32mp2.c                  | 140 ++++++++-
 configs/stm32mp25_defconfig                   |  30 +-
 include/configs/stm32mp25_common.h            | 102 +++++++
 include/configs/stm32mp25_st_common.h         |  51 ++++
 14 files changed, 809 insertions(+), 68 deletions(-)
 create mode 100644 include/configs/stm32mp25_st_common.h

-- 
2.25.1

base-commit: 9f0aa284eb916cec4d5ea93bade537c5c32c74cd
branch: upstream_STM32MP25_machine_update_v1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
