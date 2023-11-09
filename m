Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 239437E6FDF
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 18:10:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD60FC6B47C;
	Thu,  9 Nov 2023 17:10:21 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2759C6B47B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 17:10:20 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 979A212004A;
 Thu,  9 Nov 2023 20:10:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 979A212004A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
 s=mail; t=1699549819;
 bh=0xHlqgHvskjCuT90liCKvxlVM0BSW5in6SvVJfh8d0k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=QCwZZ9LweFGh6jRBAgCEIIQWmdMUirhDlDA59Y12ZCpJZ168txnrVPatm5LcvE7Xs
 yuoUVZ+oPMRwstrTejGkUPfnNpng5DUezijeFdRiaOFv0+F1bxB8YwUm5Ll7w2txda
 l+jH+dLmhyi/rVPNOimRi2TTcYSDjEIRwfMPh9MXRCVnotR9Nx6nUXE1LA2ijhQOPy
 eBEWQ6suVpo2Kn9Ii1T7lE+OFgQNDBBYBbfTjK2C4CqSaHel4wrCt4VD0IfXRQSihI
 iGTwT0mdmnz94YcRGWhErhpG8fUYv66qi2nHW2LPi9exuBArUsKrY2Z5jtmv04PYVR
 pL+dxc7RHh0Fg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Thu,  9 Nov 2023 20:10:19 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 20:10:19 +0300
From: Igor Prusov <ivprusov@salutedevices.com>
To: <u-boot@lists.denx.de>
Date: Thu, 9 Nov 2023 20:10:01 +0300
Message-ID: <20231109171004.193521-1-ivprusov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181258 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 100.64.160.123:7.1.2; p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s,
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/09 11:05:00 #22436988
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: Baruch Siach <baruch@tkos.co.il>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, prusovigor@gmail.com,
 Marek Vasut <marex@denx.de>, Stefan Roese <sr@denx.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Joel Stanley <joel@jms.id.au>, Heiko Schocher <hs@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>, kernel@sberdevices.ru,
 Igor Prusov <ivprusov@salutedevices.com>,
 Bhupesh Sharma <bhupesh.linux@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Neha Malcom Francis <n-francis@ti.com>,
 Alexander Dahl <ada@thorsis.com>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Balaji Prakash J <bjagadee@codeaurora.org>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/3] Add time conversion defines from Linux.
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

This series imports time conversion defines from Linux, that are
currently located in include/vdso/time64.h file. Those defines are
almost always used by including linux/time.h so it seems the proper
place in U-Boot to place them.

Various places where same or similar defines were added on per-driver
basis are replaced with time.h include.



Igor Prusov (3):
  linux/time.h: Add Linux time conversion defines
  spi: meson_spifc_a1: Use define for time interval
  treewide: use linux/time.h for time conversion defines

 board/friendlyarm/nanopi2/onewire.c              |  5 +----
 drivers/clk/at91/clk-main.c                      |  2 +-
 drivers/i2c/stm32f7_i2c.c                        | 11 +++++------
 drivers/memory/stm32-fmc2-ebi.c                  |  5 ++---
 drivers/mmc/octeontx_hsmmc.h                     |  2 --
 drivers/mtd/nand/raw/atmel/nand-controller.c     |  3 +--
 drivers/mtd/nand/raw/mxs_nand.c                  |  3 +--
 drivers/mtd/nand/raw/octeontx_nand.c             |  2 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c           |  5 ++---
 drivers/phy/meson-axg-mipi-dphy.c                |  3 +--
 drivers/phy/phy-core-mipi-dphy.c                 |  3 +--
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 +--
 drivers/pwm/pwm-aspeed.c                         |  3 +--
 drivers/pwm/pwm-at91.c                           |  2 +-
 drivers/pwm/pwm-cadence-ttc.c                    |  3 +--
 drivers/pwm/pwm-meson.c                          |  3 +--
 drivers/pwm/pwm-mtk.c                            |  3 +--
 drivers/pwm/pwm-ti-ehrpwm.c                      |  3 +--
 drivers/serial/serial_msm_geni.c                 |  3 +--
 drivers/spi/cadence_qspi.c                       |  3 +--
 drivers/spi/fsl_dspi.c                           |  4 +---
 drivers/spi/meson_spifc_a1.c                     |  3 ++-
 drivers/ufs/cdns-platform.c                      |  3 +--
 drivers/usb/dwc3/core.c                          |  3 +--
 drivers/video/dw_mipi_dsi.c                      |  3 +--
 drivers/video/rockchip/dw_mipi_dsi_rockchip.c    |  3 +--
 drivers/video/tegra20/tegra-dsi.c                |  4 +---
 drivers/watchdog/sunxi_wdt.c                     |  3 +--
 fs/ubifs/ubifs.h                                 |  1 -
 include/linux/time.h                             |  9 +++++++++
 30 files changed, 43 insertions(+), 63 deletions(-)

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
