Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6131891E
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Feb 2021 12:14:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E31B1C57B52;
	Thu, 11 Feb 2021 11:14:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 294BEC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 11:14:54 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lA9vx-0002Am-Hw; Thu, 11 Feb 2021 12:14:53 +0100
To: Tom Rini <trini@konsulko.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
 <20210210195926.GJ10169@bill-the-cat>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
Date: Thu, 11 Feb 2021 12:14:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210195926.GJ10169@bill-the-cat>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: uboot-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 10.02.21 20:59, Tom Rini wrote:
> On Tue, Feb 09, 2021 at 08:51:26PM +0100, Patrick DELAUNAY wrote:
>>
>> On 2/9/21 11:39 AM, Marek Vasut wrote:
>>> On 2/9/21 11:14 AM, Patrick Delaunay wrote:
>>> Hi,
>>>
>>> [...]
>>>
>>>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
>>>> b/drivers/usb/gadget/dwc2_udc_otg.c
>>>> index e3871e381e..ecac80fc11 100644
>>>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
>>>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
>>>> @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice
>>>> *dev)
>>>> =A0 static const struct udevice_id dwc2_udc_otg_ids[] =3D {
>>>> =A0=A0=A0=A0=A0 { .compatible =3D "snps,dwc2" },
>>>> =A0=A0=A0=A0=A0 { .compatible =3D "brcm,bcm2835-usb" },
>>>> -=A0=A0=A0 { .compatible =3D "st,stm32mp1-hsotg",
>>>> +=A0=A0=A0 { .compatible =3D "st,stm32mp15-hsotg",
>>>> =A0=A0=A0=A0=A0=A0=A0 .data =3D (ulong)dwc2_set_stm32mp1_hsotg_params =
},
>>>
>>> I have to point out the obvious, DT is ABI, this breaks ABI. However, do
>>> we care about out-of-tree DTs here ?
>>
>>
>> I know that the binding backward compatibility and "binary compatible" t=
he
>> is a key element of DT
>>
>> for the Linux kernel (for example the latest kernel image should work wi=
th a
>> old device tree).
> =

> The way we use DTs in U-Boot we don't enforce ABI because we allow for
> DTS and bindings to come in before they're fully stabilized in
> linux-next/similar and then it's required to re-sync them once they are
> final.

I think platforms like the STM32MP1 should be handled specially, because
they support having an external device tree passed from the FSBL at runtime.
See https://github.com/trini/u-boot/blob/master/arch/arm/mach-stm32mp/boot_=
params.c#L32

@Patrick, wouldn't this change break booting newer U-Boot with older TF-A in
some configurations? Or is this reusing-fsbl-fdt feature unused?

Cheers,
Ahmad

> =

> =

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
