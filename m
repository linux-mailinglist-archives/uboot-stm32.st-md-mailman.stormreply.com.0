Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1B7AAF1
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 16:28:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3419FC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 14:28:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C90C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UEPdht007876
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cL6QlHzK7VQ3IsCARe/A/mz2So2WVZbsXJQ1Kdyh6IA=;
 b=Vtq51XwLKsy2grUZ4rUk2GFTgy7vh/zSFuMVAxgPodpxAOQN6NqLqqtoRiQkP0doBzct
 kHhx7whc7xhH4EL4PGFO2irrU0HnK8/w6Mp96efq07YFXUqKTL8phm96qAnayPHvvuXL
 nWhcKmqrJFeJwTLbCrD9UdofNSlqVNQlCIH3sYBEADpH5e49zA/wpQk5xQxYa7kO095o
 zNgBBCsCAcWb4AhiAOzGcCScktWVwPIV8wr7YXDjtms1c1lqBGQ/934QuHcV9PXfLiq8
 XSOMFFDXUO2ldv8qfWaqGyMUsJPFXUmyXeIRiwLk01ERluCKzF02ItUj/41Ii0mI7TAs vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp49jm8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 30 Jul 2019 16:28:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E51D93A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 14:28:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6476B6918
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 16:28:44 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 16:28:44 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 16:28:44
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>
Date: Tue, 30 Jul 2019 16:28:38 +0200
Message-ID: <1564496921-15594-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH 0/3] usb: host: dwc2: use
	driver model for PHY, RESET and CLOCK configuration
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
information and the associated PHY, RESET and CLOCK driver
when they are available.

I test this serie on stm32mp157c-ev1 board;
The U-CLASS are provided by:
- PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
- CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
- RESET by RCC reset driver = drivers/reset/stm32-reset.c

I activate the configuration
+CONFIG_USB_DWC2=y

PS: it is not the default configuration to avoid conflict with device
    as OTG is not correctly handle by DWC2 driver (see DWC3 driver to
    dynamic OTG role support: device or host).

I also deactivate the gadget support (as the OTG/dual role is not
supported in DWC U-Boot driver): only one driver is bound to the
node usbotg_hs with "snps,dwc2" compatible, and today
it is the device one (the first in the driver list).

I also need to deactivate hnp-srp support with:

&usbotg_hs {
	/* need to disable ONLY for HOST support */
	hnp-srp-disable;
};

The test executed on the target:


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



Patrick Delaunay (3):
  usb: host: dwc2: add phy support
  usb: host: dwc2: add support for reset and clk
  usb: host: dwc2: add trace to have clean usb start

 drivers/usb/host/dwc2.c | 116 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
