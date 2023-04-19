Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E236E7668
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 11:36:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18DD2C6B460;
	Wed, 19 Apr 2023 09:36:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C916C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 09:36:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J8W271024768; Wed, 19 Apr 2023 11:35:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=A4e3OSbG5oaaM7zFSrUtPWjXTzJa/A0U1Jx93INPJJ4=;
 b=BzXZKcJ/F3CZx7kyTjgbz0L2MoAWCk31Xsgj8lhEuLzsCqqtV/Lv/sU2vX6a2qNt1Xtx
 iWkW5LE0044s/hETltf3uVB1GSYmPQu633XzLvIqdKllHZxDbwowGMQ0ddQTaeL/FuPH
 Bvos5N5B0IfYh5snMrEUPOGofPr5OhnIqkT/iY6WOThUN7GNdyevEcuiA+9B9wyXdlvz
 u8XRI+WESgP7J0dB72zmffsT6wLrWlN3mgOAyOXmb1MdiVY/ojnpkE3DY3bQpi52eT/b
 0BaJ6++5g3pmvAH1xxk5XoAe8ZcZrM7HYcfup0IrpVsClIYPvRDKO6T2F3t6aC8frQyl kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q10ve8cq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 11:35:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 273E710002A;
 Wed, 19 Apr 2023 11:35:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15B972138F8;
 Wed, 19 Apr 2023 11:35:59 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 11:35:58 +0200
Message-ID: <e77f91bd-5743-7509-a9ba-0dafe29ed999@foss.st.com>
Date: Wed, 19 Apr 2023 11:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_05,2023-04-18_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [Uboot-stm32] =?utf-8?q?=5BPULL=5D_Pull_request_for_u-boot_master?=
 =?utf-8?q?_/_v2023=2E07_=3D_u-boot-stm32=5F20230409=E2=80=8B?=
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

Please pull the STM32 related fixes for u-boot/master, v2023.07: u-boot-stm32-20230419

CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/16033

The following changes since commit 5db4972a5bbdbf9e3af48ffc9bc4fec73b7b6a79:

  Merge tag 'u-boot-nand-20230417' of https://source.denx.de/u-boot/custodians/u-boot-nand-flash (2023-04-17 10:47:33 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20230419

for you to fetch changes up to 0d5bd362f61dd3dc54f9a32fd38541b8d5c5d869:

  configs: stm32mp15: set CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s (2023-04-19 10:10:17 +0200)

----------------------------------------------------------------
configs:
_ Add usb_pgood_delay for ST boards
_ increase malloc size for pre-reloc for stm32mp15
_ Set CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s for stm32mp15

dts:
_ Add QSPI support on STM32MP13x SoC family
_ Add FMC support on STM32MP13x SoC family

drivers/machine:
_ pinctrl_stm32: Add slew rate support for stm32_pinctrl_get_pin_muxing()
_ spi: stm32_qspi: Remove useless struct stm32_qspi_flash
_ rawnand: stm32_fmc2: remove unsupported EDO mode
_ stm32mp: fix various array bounds checks

----------------------------------------------------------------
Christophe Kerello (2):
      ARM: dts: stm32: add FMC support on STM32MP13x SoC family
      mtd: rawnand: stm32_fmc2: remove unsupported EDO mode

Patrice Chotard (5):
      configs: stm32mp15: Add usb_pgood_delay for ST boards
      configs: stm32mp13: Increase usb_pgood_delay for ST boards
      pinctrl: pinctrl_stm32: Add slew rate support for stm32_pinctrl_get_pin_muxing()
      ARM: dts: stm32: Add QSPI support on STM32MP13x SoC family
      spi: stm32_qspi: Remove useless struct stm32_qspi_flash

Patrick Delaunay (2):
      configs: stm32mp15: increase malloc size for pre-reloc
      configs: stm32mp15: set CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s

Rasmus Villemoes (1):
      stm32mp: fix various array bounds checks

 arch/arm/dts/stm32mp131.dtsi                | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c                 |  4 ++--
 board/st/stm32mp1/stm32mp1.c                |  2 +-
 configs/stm32mp15_basic_defconfig           |  1 +
 configs/stm32mp15_defconfig                 |  3 ++-
 configs/stm32mp15_trusted_defconfig         |  1 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c      |  3 +++
 drivers/pinctrl/pinctrl_stm32.c             | 19 +++++++++++++++----
 drivers/ram/stm32mp1/stm32mp1_interactive.c |  2 +-
 drivers/spi/stm32_qspi.c                    | 27 +++------------------------
 include/configs/stm32mp13_st_common.h       |  2 +-
 include/configs/stm32mp15_st_common.h       |  1 +
 12 files changed, 79 insertions(+), 34 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
