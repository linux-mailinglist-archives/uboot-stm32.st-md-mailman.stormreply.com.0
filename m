Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80368D5CF6
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 10:00:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2794BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:00:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E1B7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 08:00:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7uAbO005573; Mon, 14 Oct 2019 10:00:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=XHBWo1A7XoB3n6qLLh9KeYaPEZ7bZyfGKNjkEVER35g=;
 b=SJbuA1LDRfExKeuxj5r3lhQ18jBiWPCLYy2YacKMgZsiNNVdUroJqqEjkeNmXQ8tsj8B
 dkl3efO9sTOYqQsiycZdjIZ7fxI0u6d8AOfyEdfgdXNvRV51YsMkzslYFnoN2SvJ9Ogd
 C4S1oq8ETeV4BLLmldVdSyRAEMLp58xqOuhwlVbjA6rGnMSysRpTpbdYlVrwFuOzggFt
 sq0k+3Ah9ahCgzs/0ccLzj76tl9EW/pB8Y8PNi5oiRC8fC4/wh/cCG1/am7k82c1B/VN
 xlGEHz/QkiC2/fAN1oKEGmmeWoYM82tRTVa9GM6fFjcy8F41COO+qBskc3JX6sT/NPvc qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk5qj0xh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 10:00:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75003100040;
 Mon, 14 Oct 2019 10:00:31 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C0332B186B;
 Mon, 14 Oct 2019 10:00:31 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 10:00:31 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 10:00:28
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 10:00:20 +0200
Message-ID: <20191014080025.11245-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 0/5] usb: host: dwc2: use driver model
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


In this serie I update the DWC2 host driver to use the device tree
information and the associated PHY and CLOCK drivers when they are
available.

I test this serie on stm32mp157c-ev1 board;
The U-CLASS are provided by:
- PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
- CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
- RESET by RCC reset driver = drivers/reset/stm32-reset.c

And I activate the configuration
+CONFIG_USB_DWC2=y

PS: it is not the default configuration to avoid conflict with gadget
    driver

To solve a binding issue, I also deactivate the gadget support:
by default only one driver is bound to theusbotg_hs node with "snps,dwc2"
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
    |
    +-3  Mass Storage (480 Mb/s, 500mA)
         Generic  USB Storage

STM32MP> ls usb 0
<DIR>       4096 .
<DIR>       4096 ..
<DIR>      16384 lost+found
<DIR>       4096 record
         1490212 xipImage
        21058006 vmlinux

STM32MP> load usb 0 0xC0000000 vmlinux
21058006 bytes read in 10851 ms (1.9 MiB/s)



Patrick Delaunay (5):
  usb: host: dwc2: add phy support
  usb: host: dwc2: add support for clk
  usb: host: dwc2: force reset assert
  usb: host: dwc2: add usb33d supply support for stm32mp1
  usb: host: dwc2: add trace to have clean usb start

 drivers/usb/host/dwc2.c | 112 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
