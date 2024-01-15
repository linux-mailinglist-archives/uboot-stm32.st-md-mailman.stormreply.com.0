Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146982D903
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jan 2024 13:47:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD3F6C6A613;
	Mon, 15 Jan 2024 12:47:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66487C6DD75
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 12:47:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40F8W3uP019899; Mon, 15 Jan 2024 13:47:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=2g+2XA8
 4c701jBn5FkTSyH9j1BPD4V4FbCpukzdQAkY=; b=WUozz28qdaHH4fv73RSz5Ck
 jQqFqNCQf0FlKz0mnCPmlSsmS0TvUWtR9zg0qwhGRtx3rnhwwAHvU4K6ojvn7Oqu
 mXrQjDI8x5Gc1zUj+I17l3dDMMi+3PksknsHc/N0OjC3WzgS1kWzdv01r7+64UVf
 OXMCcOsGgvWemEKf0rJ52EoCG64yJrA9zpsrbSEtS4KdViY1aEytH6s6EC4kdpkw
 gwAZTK8sJclBf5vsO3IJd3ORtZfWMEseL5sqMbiRdzXz2Qqu+Ds4nZXbnJgVAzzo
 MHbXA2xGMWX0FKk9WDOLX6BYJU+JRUEdgyjek/GfaEll85+O1DYoPvGB1+y7n8w=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmbh0fnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 13:47:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C1E410002A;
 Mon, 15 Jan 2024 13:47:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4E5326DDD6;
 Mon, 15 Jan 2024 13:47:07 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 13:47:07 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jan 2024 13:46:45 +0100
Message-ID: <20240115124657.39109-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 00/12] stm32: add bsec and OTP support to
	stm32mp25
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


Add BSEC support to STM32MP25 SoC family with SoC information:
- SERIAL number with UUID (BSEC_OTP_DATA5)
- RPN = Device part number (BSEC_OTP_DATA9)
- PKG = package data register (Bits 2:0 of BSEC_OTP_DATA122)

and with board information for STMicroelectronics boards
- BOARD identifier:  OTP246
- MAC address: OTP247 and after



Patrice Chotard (1):
  stm32mp: add setup_serial_number for stm32mp25

Patrick Delaunay (10):
  arm64: dts: st: add bsec support to stm32mp25
  stm32mp: bsec: add driver data
  stm32mp: bsec: add support of stm32mp25
  configs: stm32mp25: add support of fuse command
  stm32mp: add soc.c file
  smt32mp: add setup_mac_address for stm32mp25
  stm32mp: stm32prog: add support of stm32mp25
  stm32mp: activate the command stboard for stm32mp25 boards
  board: st: stm32mp2: add checkboard
  board: st: stm32mp2: display the board identification

Yann Gautier (1):
  arm: stm32mp: add Rev.B support for STM32MP25

 arch/arm/dts/stm32mp25-u-boot.dtsi            |   4 +
 arch/arm/dts/stm32mp251.dtsi                  |  16 +++
 arch/arm/mach-stm32mp/Makefile                |   1 +
 arch/arm/mach-stm32mp/bsec.c                  |  45 +++++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  10 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |   4 +-
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   1 +
 arch/arm/mach-stm32mp/soc.c                   | 118 ++++++++++++++++++
 arch/arm/mach-stm32mp/stm32mp1/cpu.c          |  96 +-------------
 arch/arm/mach-stm32mp/stm32mp2/cpu.c          |  14 +--
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   |   3 +
 board/st/common/Kconfig                       |   2 +-
 board/st/common/cmd_stboard.c                 |   2 +
 board/st/stm32mp2/stm32mp2.c                  |  37 ++++++
 configs/stm32mp25_defconfig                   |   1 +
 15 files changed, 237 insertions(+), 117 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/soc.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
