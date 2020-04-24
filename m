Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407141B7C7C
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 19:13:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010B9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Apr 2020 17:13:34 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC7C1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 17:13:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49813B0fbpz1ryp5;
 Fri, 24 Apr 2020 19:13:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4981395dzkz1qrWC;
 Fri, 24 Apr 2020 19:13:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zrjzvoD3RI9K; Fri, 24 Apr 2020 19:13:23 +0200 (CEST)
X-Auth-Info: Le2DU2fpHfiDTmryCE006YmVQ0GDuKpgbr/iTH2u4T8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 24 Apr 2020 19:13:22 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <b76882c028c24939acd6d4bd5d3a6f10@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <92948130-62f9-d7c8-4ecd-88f501f660df@denx.de>
Date: Fri, 24 Apr 2020 15:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b76882c028c24939acd6d4bd5d3a6f10@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 "simon.k.r.goldschmidt@gmail.com" <simon.k.r.goldschmidt@gmail.com>,
 Lukasz Majewski <lukma@denx.de>,
 "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
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

On 4/24/20 3:42 PM, Patrick DELAUNAY wrote:
> Dear Marek,
> 
>> From: Patrick DELAUNAY <patrick.delaunay@st.com>
>> Sent: mardi 10 mars 2020 11:09
>>
>>
>> In this serie I update the DWC2 host driver to use the device tree information and
>> the associated PHY and CLOCK drivers when they are availables.
>>
>> V6 is minor update of the first patch of the serie; I update some clk stub to return
>> success after Simon Goldschmidt remarks on V5:
>> http://patchwork.ozlabs.org/project/uboot/list/?series=162791
>>
>> I test the V4 of this serie on stm32mp157c-ev1 board, with PHY and CLK support
>> (V5 was a minor update).
>>
>> The U-CLASS are provided by:
>> - PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
>> - CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
>> - RESET by RCC reset driver = drivers/reset/stm32-reset.c
>>
>> And I activate the configuration
>> +CONFIG_USB_DWC2=y
>>
>> PS: it is not the default configuration to avoid conflict with gadget
>>     driver
>>
>> To solve a binding issue, I also deactivate the gadget support:
>> by default only one driver is bound to the usbotg_hs node with "snps,dwc2"
>> compatible, and today it is the device one (the first in the driver list).
>>
>> I also need to deactivate hnp-srp support with:
>>
>> &usbotg_hs {
>> 	/* need to disable ONLY for HOST support */
>> 	hnp-srp-disable;
>> };
>>
>> WARNING: OTG with device or host support is not correctly handle by DWC2
>>          driver (see example for dynamic OTG role in DWC3 driver).
>>
>> The tests executed on the stm32mp157c-ev1 target:
>>
>> STM32MP> usb start
>> starting USB...
>> Bus usb-otg@49000000: USB DWC2
>> Bus usbh-ehci@5800d000: USB EHCI 1.00
>> scanning bus usb-otg@49000000 for devices... 2 USB Device(s) found scanning
>> bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
>>        scanning usb for storage devices... 2 Storage Device(s) found
>> STM32MP> usb tree
>> USB device tree:
>>   1  Hub (480 Mb/s, 0mA)
>>   |   U-Boot Root Hub
>>   |
>>   +-2  Mass Storage (480 Mb/s, 300mA)
>>        Verbatim STORE N GO 070731C8ACD7EE97
>>
>>   1  Hub (480 Mb/s, 0mA)
>>   |  u-boot EHCI Host Controller
>>   |
>>   +-2  Hub (480 Mb/s, 2mA)
>>
>> STM32MP> ls usb 0
>> <DIR>       4096 .
>> <DIR>       4096 ..
>> <DIR>      16384 lost+found
>> <DIR>       4096 record
>>          1490212 xipImage
>>         21058006 vmlinux
>>
>> STM32MP> load usb 0 0xC0000000 vmlinux
>> 21058006 bytes read in 10851 ms (1.9 MiB/s)
>>
>>
>> Changes in v6:
>> - return success in stub for clk_free/clk_enable/clk_disable/
>>   clk_enable_bulk/clk_disable_bulk
>>
>> Changes in v5:
>> - use ERR_PTR in clk_get_parent()
>> - force bulk->count = 0 in clk_get_bulk to avoid issue
>>   for next call of clk_enable_bulk / clk_enable_bulk
>> - update commit message
>> - inverse logic for -ENOENT test on generic_phy_get_by_index result
>> - Add some comments
>>
>> Changes in v4:
>> - Add stub for all functions using 'struct clk' or 'struct clk_bulk'
>>   after remarks on v3
>>
>> Changes in v3:
>> - Add stub for clk_disable_bulk
>>
>> Changes in v2:
>> - update dev_err
>> - update commit message
>> - change dev_err to dev_dbg for PHY function call
>> - treat dwc2_shutdown_phy error
>> - add clk_disable_bulk in dwc2_usb_remove
>>
>> Patrick Delaunay (5):
>>   dm: clk: add stub when CONFIG_CLK is deactivated
>>   usb: host: dwc2: add phy support
>>   usb: host: dwc2: add clk support
>>   usb: host: dwc2: force reset assert
>>   usb: host: dwc2: add trace to have clean usb start
>>
>>  drivers/usb/host/dwc2.c | 100 ++++++++++++++++++++++++++++++++++++++-
>>  include/clk.h           | 102 +++++++++++++++++++++++++++++++++++-----
>>  2 files changed, 188 insertions(+), 14 deletions(-)
>>
>> --
>> 2.17.1
> 
> Gentle reminder.

Rebase and resend please.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
