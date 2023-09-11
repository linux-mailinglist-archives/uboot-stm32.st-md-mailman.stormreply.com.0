Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455379A9D6
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 17:38:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B76ACC6B46F;
	Mon, 11 Sep 2023 15:38:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05B52C6B46E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 15:38:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38BEdNru015527; Mon, 11 Sep 2023 17:38:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=kgW/+sz
 jYsV2Oka/z2iYw0Yynrh7Okt6EcGtCnD/ifg=; b=kZW5sBJiJureQAawfuSbx3Y
 +8JFUYp8PPBH3yqiP0P3Zd21Y2DzsL2BolwjrbnbtIaHuz1/FCQ0nSXLyufepBhx
 k96uDJiMtieuk+zB0EMdXzi1Lchzju472AFOAyvSEQXcpMzjcNLv9Y9fsmYCF2YD
 hr6h+ckxEOYpNMsNBYKWqGWKdJpy+DSp0p2gpzGR5ZHuOuuT6cjkhbdad1yUngYl
 BD1u4W0WEsfkFIoRoB74fUpcAh5sg3JNuQMpFtWxS7maIXiOwNG8wezdlhOG6AzN
 e9rj7Io6WRnDUwXonuhRgnW8ei/s2gpuLrXGMnXzlEYZFC0BKPvmcw5xB9XHXlQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0fkchkxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 17:38:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C98FF100061;
 Mon, 11 Sep 2023 17:38:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCC442085B6;
 Mon, 11 Sep 2023 17:38:11 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 17:38:11 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Sep 2023 17:37:17 +0200
Message-ID: <20230911153724.799535-1-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_10,2023-09-05_01,2023-05-22_02
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 0/7] rng: stm32: support STM32MP13x
	platforms
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

This is the cover letter for patchset [1].
First, do not restrain the STM32 RNG driver to the MPU series.

The STM32MP13x platforms have a RNG hardware block that supports
customization, a conditional reset sequences that allows to
recover from certain situations and a configuration locking
mechanism.

This series adds support for the mentionned features. Note that
the hardware RNG can and should be managed in the secure world
for this platform, hence the rng not being default enabled on
the STM32MP135F-DK board.

[1] http://patchwork.ozlabs.org/project/uboot/list/?series=372119&state=*

Changes in V2:
	- Added this cover letter
	- Added ARCH_STM32 as a dependency for RNG_STM32
	- Added review tags

Gatien Chevallier (7):
  rng: stm32: rename STM32 RNG driver
  configs: default activate CONFIG_RNG_STM32 for STM32MP13x platforms
  rng: stm32: Implement configurable RNG clock error detection
  rng: stm32: add RNG clock frequency restraint
  rng: stm32: add error concealment sequence
  rng: stm32: Implement custom RNG configuration support
  ARM: dts: stm32: add RNG node for STM32MP13x platforms

 MAINTAINERS                         |   2 +-
 arch/arm/dts/stm32mp131.dtsi        |   8 +
 configs/stm32mp13_defconfig         |   1 +
 configs/stm32mp15_basic_defconfig   |   2 +-
 configs/stm32mp15_defconfig         |   2 +-
 configs/stm32mp15_trusted_defconfig |   2 +-
 drivers/rng/Kconfig                 |   8 +-
 drivers/rng/Makefile                |   2 +-
 drivers/rng/stm32_rng.c             | 408 ++++++++++++++++++++++++++++
 drivers/rng/stm32mp1_rng.c          | 198 --------------
 10 files changed, 426 insertions(+), 207 deletions(-)
 create mode 100644 drivers/rng/stm32_rng.c
 delete mode 100644 drivers/rng/stm32mp1_rng.c

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
