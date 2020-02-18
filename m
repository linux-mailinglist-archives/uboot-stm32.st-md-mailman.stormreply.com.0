Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A87162273
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 09:35:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13254C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Feb 2020 08:35:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9EE2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 08:35:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I8Xa2H020981; Tue, 18 Feb 2020 09:35:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BVG83/p6IkuojsAavFSQ/gm2hWKy72dSxMz5xpjk+oY=;
 b=XlhRTaMeSzAq7f+QTFdgeVkKvkbc7NDBG0XJWk3ZwiIvhFXEs2UrIa3OvZP4NREKri6o
 g/sYFxRdZsS9xt/d18Au3sczyfe5UmA/W5PQfUnbWLQGXpUBi/RcEWy8/qT3JBZ4s2Qx
 6JWq+WRTh6j5yR/i/AgUdnCa+fiT2gbcVKlSeur8wbPGjH0QlcFDZbbXMzz1d9TdqUTn
 CQUX+RWQPGefDELb37CDoFqdvNKmdAKVr8Hb5rM5pK+pBB4AglKfeIkvG7Oh7mXs5Dh+
 plxitrbhoTcEarH3riBYuUzADkXft0e1aGQO+DPlMz/0D8+PBWS2LKTubT5lZPTa2i0j iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y67a1rt88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 09:35:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42EB4100039;
 Tue, 18 Feb 2020 09:35:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A0C921F67B;
 Tue, 18 Feb 2020 09:35:09 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 18 Feb 2020 09:35:08 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Feb 2020 09:34:58 +0100
Message-ID: <20200218083503.5468-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_01:2020-02-17,
 2020-02-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 ley.foon.tan@intel.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH v4 0/5] usb: host: dwc2: use driver model for
	PHY and CLOCK
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


In this serie I update the DWC2 host driver to use the device tree
information and the associated PHY and CLOCK drivers when they are
availables.

The V4 is rebased on latest master (v2020.04-rc2).
CI-Tavis build is OK:
    https://travis-ci.org/patrickdelaunay/u-boot/builds/651479714

NB: CI-Travis build was OK for all target after V3:
    https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187
    As in V2, I cause the warnings for some boards:
    drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
    drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'

I test this serie on stm32mp157c-ev1 board, with PHY and CLK
support

The U-CLASS are provided by:
- PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
- CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
- RESET by RCC reset driver = drivers/reset/stm32-reset.c

And I activate the configuration
+CONFIG_USB_DWC2=y

PS: it is not the default configuration to avoid conflict with gadget
    driver

To solve a binding issue, I also deactivate the gadget support:
by default only one driver is bound to the usbotg_hs node with "snps,dwc2"
compatible, and today it is the device one (the first in the driver list).

I also need to deactivate hnp-srp support with:

&usbotg_hs {
	/* need to disable ONLY for HOST support */
	hnp-srp-disable;
};

WARNING: OTG with device or host support is not correctly handle by DWC2
         driver (see example for dynamic OTG role in DWC3 driver).

The tests executed on the stm32mp157c-ev1 target:

STM32MP> usb start
starting USB...
Bus usb-otg@49000000: USB DWC2
Bus usbh-ehci@5800d000: USB EHCI 1.00
scanning bus usb-otg@49000000 for devices... 2 USB Device(s) found
scanning bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
       scanning usb for storage devices... 2 Storage Device(s) found
STM32MP> usb tree
USB device tree:
  1  Hub (480 Mb/s, 0mA)
  |   U-Boot Root Hub
  |
  +-2  Mass Storage (480 Mb/s, 300mA)
       Verbatim STORE N GO 070731C8ACD7EE97

  1  Hub (480 Mb/s, 0mA)
  |  u-boot EHCI Host Controller
  |
  +-2  Hub (480 Mb/s, 2mA)

STM32MP> ls usb 0
<DIR>       4096 .
<DIR>       4096 ..
<DIR>      16384 lost+found
<DIR>       4096 record
         1490212 xipImage
        21058006 vmlinux

STM32MP> load usb 0 0xC0000000 vmlinux
21058006 bytes read in 10851 ms (1.9 MiB/s)


Changes in v4:
- Add stub for all functions using 'struct clk' or 'struct clk_bulk'
  after remarks on v3

Changes in v3:
- Add stub for clk_disable_bulk

Changes in v2:
- update dev_err
- update commit message
- change dev_err to dev_dbg for PHY function call
- treat dwc2_shutdown_phy error
- add clk_disable_bulk in dwc2_usb_remove

Patrick Delaunay (5):
  dm: clk: add stub when CONFIG_CLK is desactivated
  usb: host: dwc2: add phy support
  usb: host: dwc2: add clk support
  usb: host: dwc2: force reset assert
  usb: host: dwc2: add trace to have clean usb start

 drivers/usb/host/dwc2.c | 100 ++++++++++++++++++++++++++++++++++++++-
 include/clk.h           | 101 ++++++++++++++++++++++++++++++++++------
 2 files changed, 187 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
