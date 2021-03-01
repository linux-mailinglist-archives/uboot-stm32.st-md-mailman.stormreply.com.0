Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97774327DBE
	for <lists+uboot-stm32@lfdr.de>; Mon,  1 Mar 2021 12:59:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55757C56634;
	Mon,  1 Mar 2021 11:59:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AE34C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Mar 2021 11:59:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lGhDB-0007M1-GG; Mon, 01 Mar 2021 12:59:41 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
 <20210210195926.GJ10169@bill-the-cat>
 <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
 <9b34272f-0e54-0fa6-0432-126d63a6b538@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <9d690011-5ba1-5349-96f7-47c672ed6cfe@pengutronix.de>
Date: Mon, 1 Mar 2021 12:59:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9b34272f-0e54-0fa6-0432-126d63a6b538@foss.st.com>
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

Hello Patrick,

On 19.02.21 14:30, Patrick DELAUNAY wrote:
> Hi Ahmad,
> =

> On 2/11/21 12:14 PM, Ahmad Fatoum wrote:
>> Hi,
>>
>> On 10.02.21 20:59, Tom Rini wrote:
>>> On Tue, Feb 09, 2021 at 08:51:26PM +0100, Patrick DELAUNAY wrote:
>>>> On 2/9/21 11:39 AM, Marek Vasut wrote:
>>>>> On 2/9/21 11:14 AM, Patrick Delaunay wrote:
>>>>> Hi,
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
>>>>>> b/drivers/usb/gadget/dwc2_udc_otg.c
>>>>>> index e3871e381e..ecac80fc11 100644
>>>>>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
>>>>>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
>>>>>> @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice
>>>>>> *dev)
>>>>>> =A0=A0 static const struct udevice_id dwc2_udc_otg_ids[] =3D {
>>>>>> =A0=A0=A0=A0=A0=A0 { .compatible =3D "snps,dwc2" },
>>>>>> =A0=A0=A0=A0=A0=A0 { .compatible =3D "brcm,bcm2835-usb" },
>>>>>> -=A0=A0=A0 { .compatible =3D "st,stm32mp1-hsotg",
>>>>>> +=A0=A0=A0 { .compatible =3D "st,stm32mp15-hsotg",
>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 .data =3D (ulong)dwc2_set_stm32mp1_hsotg_pa=
rams },
>>>>> I have to point out the obvious, DT is ABI, this breaks ABI. However,=
 do
>>>>> we care about out-of-tree DTs here ?
>>>>
>>>> I know that the binding backward compatibility and "binary compatible"=
 the
>>>> is a key element of DT
>>>>
>>>> for the Linux kernel (for example the latest kernel image should work =
with a
>>>> old device tree).
>>> The way we use DTs in U-Boot we don't enforce ABI because we allow for
>>> DTS and bindings to come in before they're fully stabilized in
>>> linux-next/similar and then it's required to re-sync them once they are
>>> final.
>> I think platforms like the STM32MP1 should be handled specially, because
>> they support having an external device tree passed from the FSBL at runt=
ime.
>> See https://github.com/trini/u-boot/blob/master/arch/arm/mach-stm32mp/bo=
ot_params.c#L32
>>
>> @Patrick, wouldn't this change break booting newer U-Boot with older TF-=
A in
>> some configurations? Or is this reusing-fsbl-fdt feature unused?
> =

>> Cheers,
>> Ahmad
> =

> I introduce this patch to prepare the FIP support in STM32MP15x TF-A
> =

> but it is not yet ready today in downstream or in upstream (STOpenLinux v=
2.1).
> =

> =

> In this FIP use-case, the DT provided by TF-A to U-Boot is the "u-boot.dt=
b"
> =

> generated by U-Boot compilation (including the required "u-boot,dm-pre-re=
loc"
> =

> add-on).
> =

> =

> The files "u-boot-nodtb.bin" and "u-boot.dtb" are provided to TF-A makefi=
le
> =

> when the FIP is create; I hope these files are aligned as resulting of the
> =

> U-Boot compilation.
> =

> =

> And update of existing FIP is possible with command:
> =

> =A0PC $> fiptool update --nt-fw u-boot-nodtb.bin --hw-config u-boot.dtb f=
ip.bin
> =

> =

> Here I hope the DT and U-Boot binary are updated at the same time
> =

> to avoid any dependency issue=A0 (even if it is not mandatory).
> =

> =

> But as this FIP feature is not yet used, I don't break the current or the=
 FIP STM32MP1
> =

> configurations, except if I miss something,=A0 as the 2 U-Boot files in F=
IP
> =

> are updated at the same time.

I think too it should cause no problem then. Thanks for the explanation!

Cheers,
Ahmad

> =

> =

> Regards,
> =

> Patrick
> =

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
