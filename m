Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B83881B7737
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 15:42:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A6FCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 13:42:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 047CDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:42:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ODgXqW008042; Fri, 24 Apr 2020 15:42:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=P5CmRYREy81iLm+P33jlpAtVuycjGV0PTtWvNi5cRUc=;
 b=1sKxkROXw/m0QvhThJ5o+nMhAO/FCIydufVdKAl2iw3ofw7eltCrzIxGP2dbpi9V6BQr
 /cC2Ci0iNgXGaeqtSwizyzsJr10JSPCgDZdEqyS3cu46HKk9g5p98xeVVQ1Z+DPAcd0v
 11JIm5HZoIkRf665WFqY9Z36TEMgaJojkuTNEAsqHFBVzJb+qZjaaegqt+/Q/IQTIA74
 kHdzGbKJwHOmFjxlMY1zsx1Vt7tePbAAodI9iQSgRNB/C0EW2Du54l2c+DraNQo8PwdI
 z62qbQKFXql95anYRvj6nicWriQf611DaoYZQ3ZZTFojOmb/sTIcjXRuimdlUyU0QcU4 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq123dwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 15:42:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC0C4100034;
 Fri, 24 Apr 2020 15:42:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 809AF2C38A6;
 Fri, 24 Apr 2020 15:42:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Apr
 2020 15:42:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 24 Apr 2020 15:42:22 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY and
 CLOCK
Thread-Index: AQHV9sP0L9yL6EBFTUiIs8rwgW9mm6iIjeIw
Date: Fri, 24 Apr 2020 13:42:22 +0000
Message-ID: <b76882c028c24939acd6d4bd5d3a6f10@SFHDAG6NODE3.st.com>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
In-Reply-To: <20200310100912.28129-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_06:2020-04-24,
 2020-04-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>, Lukasz
 Majewski <lukma@denx.de>, "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v6 0/5] usb: host: dwc2: use driver model
 for PHY and CLOCK
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

Dear Marek,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 10 mars 2020 11:09
> 
> 
> In this serie I update the DWC2 host driver to use the device tree information and
> the associated PHY and CLOCK drivers when they are availables.
> 
> V6 is minor update of the first patch of the serie; I update some clk stub to return
> success after Simon Goldschmidt remarks on V5:
> http://patchwork.ozlabs.org/project/uboot/list/?series=162791
> 
> I test the V4 of this serie on stm32mp157c-ev1 board, with PHY and CLK support
> (V5 was a minor update).
> 
> The U-CLASS are provided by:
> - PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
> - CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
> - RESET by RCC reset driver = drivers/reset/stm32-reset.c
> 
> And I activate the configuration
> +CONFIG_USB_DWC2=y
> 
> PS: it is not the default configuration to avoid conflict with gadget
>     driver
> 
> To solve a binding issue, I also deactivate the gadget support:
> by default only one driver is bound to the usbotg_hs node with "snps,dwc2"
> compatible, and today it is the device one (the first in the driver list).
> 
> I also need to deactivate hnp-srp support with:
> 
> &usbotg_hs {
> 	/* need to disable ONLY for HOST support */
> 	hnp-srp-disable;
> };
> 
> WARNING: OTG with device or host support is not correctly handle by DWC2
>          driver (see example for dynamic OTG role in DWC3 driver).
> 
> The tests executed on the stm32mp157c-ev1 target:
> 
> STM32MP> usb start
> starting USB...
> Bus usb-otg@49000000: USB DWC2
> Bus usbh-ehci@5800d000: USB EHCI 1.00
> scanning bus usb-otg@49000000 for devices... 2 USB Device(s) found scanning
> bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
>        scanning usb for storage devices... 2 Storage Device(s) found
> STM32MP> usb tree
> USB device tree:
>   1  Hub (480 Mb/s, 0mA)
>   |   U-Boot Root Hub
>   |
>   +-2  Mass Storage (480 Mb/s, 300mA)
>        Verbatim STORE N GO 070731C8ACD7EE97
> 
>   1  Hub (480 Mb/s, 0mA)
>   |  u-boot EHCI Host Controller
>   |
>   +-2  Hub (480 Mb/s, 2mA)
> 
> STM32MP> ls usb 0
> <DIR>       4096 .
> <DIR>       4096 ..
> <DIR>      16384 lost+found
> <DIR>       4096 record
>          1490212 xipImage
>         21058006 vmlinux
> 
> STM32MP> load usb 0 0xC0000000 vmlinux
> 21058006 bytes read in 10851 ms (1.9 MiB/s)
> 
> 
> Changes in v6:
> - return success in stub for clk_free/clk_enable/clk_disable/
>   clk_enable_bulk/clk_disable_bulk
> 
> Changes in v5:
> - use ERR_PTR in clk_get_parent()
> - force bulk->count = 0 in clk_get_bulk to avoid issue
>   for next call of clk_enable_bulk / clk_enable_bulk
> - update commit message
> - inverse logic for -ENOENT test on generic_phy_get_by_index result
> - Add some comments
> 
> Changes in v4:
> - Add stub for all functions using 'struct clk' or 'struct clk_bulk'
>   after remarks on v3
> 
> Changes in v3:
> - Add stub for clk_disable_bulk
> 
> Changes in v2:
> - update dev_err
> - update commit message
> - change dev_err to dev_dbg for PHY function call
> - treat dwc2_shutdown_phy error
> - add clk_disable_bulk in dwc2_usb_remove
> 
> Patrick Delaunay (5):
>   dm: clk: add stub when CONFIG_CLK is deactivated
>   usb: host: dwc2: add phy support
>   usb: host: dwc2: add clk support
>   usb: host: dwc2: force reset assert
>   usb: host: dwc2: add trace to have clean usb start
> 
>  drivers/usb/host/dwc2.c | 100 ++++++++++++++++++++++++++++++++++++++-
>  include/clk.h           | 102 +++++++++++++++++++++++++++++++++++-----
>  2 files changed, 188 insertions(+), 14 deletions(-)
> 
> --
> 2.17.1

Gentle reminder.

It is ok for v2020.07 or I need to rebase the serie ?

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
