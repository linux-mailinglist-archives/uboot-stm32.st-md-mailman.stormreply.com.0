Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275115D896
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 14:35:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6793C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 13:35:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8CB5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 13:35:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EDZ6x7024516; Fri, 14 Feb 2020 14:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IMN4bKCTFDxVXy9MIllOsB5Dm2BEUuXhqvGltQJ+cR8=;
 b=ZjsHhScbRRB4YAgPGGdyj4IXToKBQ9V+h/m8zho1H0NtlZdw8eWlLmRQ45A6poSx+hCv
 Npv/UE8w/zoyJsOjWduFAS4NNr7NSjm4YmpMqXu1MxN9vpw86wmJsj3uhbKCE/YJpBvc
 wotOkekUpeI8CMhOwWKtjsUrMpy9Ruk/jALMrr7oEtT5RFu7Ol8KNnBmUUicyu3wQ6pg
 peEJtB8KNHFha7L7EZ7giydqPp0yCUbmFn0ZW9A2vYQnfvra7mWfZk35SabdXrsaXLoJ
 uQUmPFZny6LtqyxpqFW9Ym0NrRn11QQTOmreuDjirePaPivn4LeQAmxUr09U/rBrS7f5 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1udac02y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 14:35:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98D4D100039;
 Fri, 14 Feb 2020 14:34:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A6A72B586B;
 Fri, 14 Feb 2020 14:34:53 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 14:34:52 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 14:34:52 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, "Ley
 Foon Tan" <ley.foon.tan@intel.com>
Thread-Topic: [PATCH v3 0/5] usb: host: dwc2: use driver model for PHY and
 CLOCK
Thread-Index: AQHVmT14QMzM+4WLgUyjLbEq2txhDKgbNVgA
Date: Fri, 14 Feb 2020 13:34:52 +0000
Message-ID: <72f2e4d1e8f84cf481ec285c5101b6b8@SFHDAG6NODE3.st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
In-Reply-To: <20191112094214.12686-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_03:2020-02-12,
 2020-02-14 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 Sekhar Nori <nsekhar@ti.com>, Lukasz Majewski <lukma@denx.de>,
 "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v3 0/5] usb: host: dwc2: use driver model
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 12 novembre 2019 10:42
> To: u-boot@lists.denx.de
> Cc: ley.foon.tan@intel.com; b.galvani@gmail.com;
> simon.k.r.goldschmidt@gmail.com; Patrick DELAUNAY
> <patrick.delaunay@st.com>; Jagan Teki <jagan@amarulasolutions.com>; Jean-
> Jacques Hiblot <jjhiblot@ti.com>; Lokesh Vutla <lokeshvutla@ti.com>; Lukasz
> Majewski <lukma@denx.de>; Marek Vasut <marex@denx.de>; Michal Suchanek
> <msuchanek@suse.de>; Peng Fan <peng.fan@nxp.com>; Sekhar Nori
> <nsekhar@ti.com>; Simon Glass <sjg@chromium.org>; Sven Schwermer
> <sven@svenschwermer.de>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>
> Subject: [PATCH v3 0/5] usb: host: dwc2: use driver model for PHY and CLOCK
> Importance: High
> 
> 
> In this serie I update the DWC2 host driver to use the device tree information and
> the associated PHY and CLOCK drivers when they are available.
> 
> CI-Travis build is OK for all target after V3:
> https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187
> 
> In V2, I cause the warnings for some boards:
> drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
> drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'
> 
> I test this serie on stm32mp157c-ev1 board, with PHY and CLK support
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
> by default only one driver is bound to theusbotg_hs node with "snps,dwc2"
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
>     |
>     +-3  Mass Storage (480 Mb/s, 500mA)
>          Generic  USB Storage
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
>   dm: clk: add stub for clk_disable_bulk when CONFIG_CLK is desactivated
>   usb: host: dwc2: add phy support
>   usb: host: dwc2: add clk support
>   usb: host: dwc2: force reset assert
>   usb: host: dwc2: add trace to have clean usb start
> 
>  drivers/usb/host/dwc2.c | 100
> +++++++++++++++++++++++++++++++++++++++-
>  include/clk.h           |   4 ++
>  2 files changed, 103 insertions(+), 1 deletion(-)
> 
> --
> 2.17.1

Any comments on this serie or I need to rebase it and resend the serie ?

http://patchwork.ozlabs.org/project/uboot/list/?series=142257

Sorry for the delay...
I miss the previous merge windows for v2020.01 and now I think it also the case for v2020.04 !

The previous version v2 was almost ready
http://patchwork.ozlabs.org/project/uboot/list/?series=141678&state=*

In v3 I only solve the compilation issue on some board with patch 1/5
(= http://patchwork.ozlabs.org/patch/1193397/)

PS: for other remarks I create a separate serie:
       http://patchwork.ozlabs.org/project/uboot/list/?series=142260

Regards

Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
