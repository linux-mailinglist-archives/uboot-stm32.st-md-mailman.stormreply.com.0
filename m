Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB977E4AC
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 17:07:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 255BEC6B45E;
	Wed, 16 Aug 2023 15:07:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66BEDC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 15:07:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37GEHqLT020809; Wed, 16 Aug 2023 17:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:to:cc:from:subject:content-type
 :content-transfer-encoding; s=selector1; bh=KNXNOdZz3ihQKpkpMIbS
 PiDmoqWWutnb+aeYqAhZ+DI=; b=qZpri2dbN034ob4VUUrRnQn1L3GuGXvzyyRv
 s0TZf2UDAfsUO1EIgNmicG7HeK5UrGQV03oWGWAvV7dYWVaqVkPGYHxZ4PefDbn4
 ycn3/f/ZpTrqlJV6VZVI+tkpI7JBBd2CnF8MVqaVvqCP04kONCHUNzE89P+EEf6D
 l9zafPRZ/pC6XqBfcx+qcxNsnzDyr1BDTaKpO/2tM84REkcZ4kfCqvdZiqYvqZ9X
 Xdu7mUuoEmSkr/wlTWn58VEzdAERCL3WmBf41kQAyk3ykg70Jrrsr+I4c6LF6UxE
 y14ewBPS+xKqWGubEZ11kc5XB4ETNkgSq22ZInRJxPR8j8DLVA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sh03cr82y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Aug 2023 17:07:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 389E410005D;
 Wed, 16 Aug 2023 17:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AAC9260282;
 Wed, 16 Aug 2023 17:07:33 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 16 Aug
 2023 17:07:32 +0200
Message-ID: <2eff3bb2-ebbd-b71e-3707-c3ae29419bfa@foss.st.com>
Date: Wed, 16 Aug 2023 17:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_15,2023-08-15_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Valentin Caron <valentin.caron@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2023.10 =
 u-boot-stm32_20230816
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

Hi Tom

Please pull the STM32 related fixes for u-boot/master, v2023.10: u-boot-stm32-20230816

CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/17388

The following changes since commit 9b54b0e37b72aa9bfff09cbbe13465abfa143f84:

  Merge tag 'efi-2023-10-rc3' of https://source.denx.de/u-boot/custodians/u-boot-efi (2023-08-15 13:08:17 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20230816

for you to fetch changes up to 9e8cbea1a74516235820ccd50d513c961e43cb70:

  serial: stm32: extend TC timeout (2023-08-16 15:38:23 +0200)

----------------------------------------------------------------
DHSOM: Power cycle Buck3 in reset
DHCOM: Switch DWMAC RMII clock to MCO2
stm32f746: fix display pinmux
stm32mp: psci: Inhibit PDDS because CSTBYDIS is set
stm32mp1: DT alignment with v6.4
stm32mp1: add splashscreen with STMicroelectronics logo
stm32mp1: clk: remove error for disabled clock in stm32mp1_clk_get_parent
serial: stm32: Extend TC timeout

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: dts: stm32: fix display pinmux for stm32f746-disco

Marek Vasut (3):
      ARM: stm32: Power cycle Buck3 in reset on DHSOM
      ARM: stm32: Inhibit PDDS because CSTBYDIS is set
      ARM: dts: stm32: Switch DWMAC RMII clock to MCO2 on DHCOM

Patrick Delaunay (3):
      clk: stm32mp1: remove error for disabled clock in stm32mp1_clk_get_parent
      ARM: dts: stm32mp: alignment with v6.4
      board: stm32mp1: add splash screen with stmicroelectronics logo

Valentin Caron (1):
      serial: stm32: extend TC timeout

 MAINTAINERS                                |   1 +
 arch/arm/dts/stm32f746-disco-u-boot.dtsi   |   2 +-
 arch/arm/dts/stm32mp13-pinctrl.dtsi        | 129 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/dts/stm32mp131.dtsi               |  99 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 arch/arm/dts/stm32mp135f-dk.dts            |  42 +++++++++++++++++++++++++++++++++++++++++-
 arch/arm/dts/stm32mp15-pinctrl.dtsi        |  34 +++++++++++++++++-----------------
 arch/arm/dts/stm32mp151.dtsi               |   4 ++--
 arch/arm/dts/stm32mp157a-dk1.dts           |   3 ---
 arch/arm/dts/stm32mp157c-dk2.dts           |   3 ---
 arch/arm/dts/stm32mp157c-ed1.dts           |  17 ++++-------------
 arch/arm/dts/stm32mp157c-ev1.dts           |   9 ++++-----
 arch/arm/dts/stm32mp15xx-dhcom-som.dtsi    |  22 ++++++++++++++++++----
 arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi |  14 ++++++++++++++
 arch/arm/dts/stm32mp15xx-dkx.dtsi          |  15 ++++++---------
 arch/arm/mach-stm32mp/psci.c               |   2 +-
 board/st/common/stpmic1.c                  |  10 +++-------
 board/st/common/stpmic1.h                  |   2 +-
 board/st/stm32mp1/spl.c                    |  13 +++++++++++--
 configs/stm32mp15_basic_defconfig          |   3 +++
 configs/stm32mp15_defconfig                |   3 +++
 configs/stm32mp15_trusted_defconfig        |   3 +++
 drivers/clk/stm32/clk-stm32mp1.c           |   3 ++-
 drivers/serial/serial_stm32.c              |  18 ++++++++++++------
 include/configs/stm32mp15_st_common.h      |   4 +++-
 tools/logos/st.bmp                         | Bin 0 -> 18244 bytes
 25 files changed, 375 insertions(+), 80 deletions(-)
 create mode 100644 tools/logos/st.bmp
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
