Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD3283263
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 10:44:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBE1BC32EA6;
	Mon,  5 Oct 2020 08:44:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C83EC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 08:44:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0958hGHF001393; Mon, 5 Oct 2020 10:44:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=hb5SZ5rg3I0lSlJRFmuhwDGPfBIk2HtLI+qBCDnM0F8=;
 b=PMUxN8n3lpxH6/faGfFKhrPFJOhyHRX1GewsNi9jZ1GwMsmVigrLKueeXEPWMVTNfUCB
 0YPt7fFcCx77QPAjpIKkmRU8ZdtxxAkBqhBFcbQS+MuaXeABn7ieKwqjxkjjiDkZHDm2
 bRzE+z71qiqFTvUrhcLKL8LV8wJ0MVsBnFLXU0699xXw6uEtBwPSzrXMByU8QioWziHf
 FNChQEQThvltPurz8YqjmxSDmE8XZRlvowhFXav6rPrbM6toYu8MtGw7N4wUB70Cphb8
 dvq2+9DkznEZFR6XGzRb6Erp4aqP6k/Om50oow7oeVFMhNAK4HlC3Du3gCxYNyp+7v2X qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33xee8sd6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Oct 2020 10:44:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DEA78100034;
 Mon,  5 Oct 2020 10:44:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9FC721D3B8;
 Mon,  5 Oct 2020 10:44:45 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Oct
 2020 10:44:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 5 Oct 2020 10:44:45 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PULL] Pull request for u-boot-stm/next = u-boot-stm32-20201003
Thread-Index: Adaa87TKgTWrw03rTVSW20R1OnNajg==
Date: Mon, 5 Oct 2020 08:44:45 +0000
Message-ID: <bf117b87ae7e491ea725c59f70280410@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-05_06:2020-10-02,
 2020-10-05 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot-stm/next =
	u-boot-stm32-20201003
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

Hi Tom,

Please pull the STM32 related patches for u-boot/next: u-boot-stm32-20201003

With STM32 updates for v2021.01-rc1:
- stm32mp: DT alignment with Linux 5.9-rc4
- stm32mp: convert drivers to APIs which support live DT
- stm32mp: gpio: minor fixes

CI status:
    https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4880

Thanks,
Patrick

git request-pull origin/next https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git u-boot-stm32-20201003


The following changes since commit 7e373a1a6ac27492ffebba146d70c4d39a9b9f36:

  Merge branch 'next' of git://git.denx.de/u-boot-usb into next (2020-10-01 14:52:56 -0400)

are available in the Git repository at:

  https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20201003

for you to fetch changes up to 04e29ca5bbb82f15d7a32d4130214c6a15db69aa:

  mailbox: stm32_ipcc: Convert to use APIs which support live DT (2020-10-02 15:05:14 +0200)

----------------------------------------------------------------
- stm32mp: DT alignment with Linux 5.9-rc4
- stm32mp: convert drivers to APIs which support live DT
- stm32mp: gpio: minor fixes

----------------------------------------------------------------
Patrick Delaunay (8):
      ARM: dts: stm32mp1: DT alignment with Linux kernel v5.9-rc4
      gpio: stm32: cosmetic: cleanup gpio_stm32_probe
      gpio: stm32: check result of ofnode_phandle_args
      pinctrl: stm32: Convert to use APIs which support live DT
      pinctrl: stm32: Add header with SPDX licence
      video: stm32_ltdc: Convert to use APIs which support live DT
      video: stm32_dsi: Convert to use APIs which support live DT
      mailbox: stm32_ipcc: Convert to use APIs which support live DT

 arch/arm/dts/stm32mp15-pinctrl.dtsi | 263 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm/dts/stm32mp151.dtsi        |   4 +-
 arch/arm/dts/stm32mp157a-dk1.dts    |   2 +
 arch/arm/dts/stm32mp157c-dk2.dts    |  11 ++++
 arch/arm/dts/stm32mp157c-ed1.dts    |   4 +-
 arch/arm/dts/stm32mp157c-ev1.dts    |  15 +++++
 arch/arm/dts/stm32mp15xx-dkx.dtsi   |  38 ++++++++++++-
 drivers/gpio/stm32_gpio.c           |  15 +++--
 drivers/mailbox/stm32-ipcc.c        |   9 +--
 drivers/pinctrl/pinctrl_stm32.c     |  48 +++++++++-------
 drivers/video/stm32/stm32_dsi.c     |   3 +-
 drivers/video/stm32/stm32_ltdc.c    |   3 +-
 12 files changed, 360 insertions(+), 55 deletions(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
