Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2765319FDB
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Feb 2021 14:29:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A649CC57B5A;
	Fri, 12 Feb 2021 13:29:59 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1563FC57B59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 13:29:57 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lAYWC-0008Tv-J3; Fri, 12 Feb 2021 14:29:56 +0100
To: Tom Rini <trini@konsulko.com>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
 <20210210195926.GJ10169@bill-the-cat>
 <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
 <20210211130236.GR10169@bill-the-cat>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <bc9e9253-be74-3958-ace0-365dec27d840@pengutronix.de>
Date: Fri, 12 Feb 2021 14:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211130236.GR10169@bill-the-cat>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: uboot-stm32@st-md-mailman.stormreply.com
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
 stm32mp1-hsotg to st, stm32mp15-hsotg
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

On 11.02.21 14:02, Tom Rini wrote:
> On Thu, Feb 11, 2021 at 12:14:51PM +0100, Ahmad Fatoum wrote:
>> I think platforms like the STM32MP1 should be handled specially, because
>> they support having an external device tree passed from the FSBL at runtime.
>> See https://github.com/trini/u-boot/blob/master/arch/arm/mach-stm32mp/boot_params.c#L32
>>
>> @Patrick, wouldn't this change break booting newer U-Boot with older TF-A in
>> some configurations? Or is this reusing-fsbl-fdt feature unused?
> 
> The long stated policy of U-Boot is to allow non-final bindings to be
> used until they're finalized in Linux in order to address the "chicken
> and egg" problem, since it's already a terrible idea to go to production
> with a Linux kernel that's using non-final bindings.  Any older TF-A
> that doesn't work with this newer binding should be on a developer board
> and they can just upgrade.  Linux says "DT is ABI" and allows the ABI to
> break when there's a bug in the DT.  We don't say "DT is ABI" we say "we
> use the Linux kernel binding".

I see. Thanks for the clarification.

I am still curious what configurations use the TF-A-provided device tree
for U-Boot. Patrick?

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
