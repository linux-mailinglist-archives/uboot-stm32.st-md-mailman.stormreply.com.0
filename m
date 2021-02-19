Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C431F9E9
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Feb 2021 14:30:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD50C57B59
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Feb 2021 13:30:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26527C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 13:30:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11JDIFmR016812; Fri, 19 Feb 2021 14:30:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=P9ydz7xM1/70YsuKPorFy/L9mQvMwzcFJfMgXCbkBG8=;
 b=zeX57Nh8mtzqYYiGRnEHPJOXav5iWdp5lh3TqaGwXHfFU+3XPIwfXSnnvR/VSgvtknD0
 FtayH2CxrxI6UpiEQT1xqoesPCZ1hfRl2GFNVouSPdZP7EYQNlwb3Ny5tx0Zv0/bC/TP
 j/iyA2Igug0DzIxDzq/MTwY1VQ2GvDMQhFZ41BRjuzfoFX0BEAztnLf+YYSWXYQnbUOg
 /vCshMLsL88OavlenD6iEBSiPDXUflFfJsZMar49P0Dfu0I2iGyD1Gg13OuL3VfBuReR
 8/hDVP32EPMK89nm04dGgCBTNwBurb9VMXOWp/oTMaL/lzgSYOCJWdtzXZcmMq1NC6iV hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36sqadfr7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 14:30:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B6AF10002A;
 Fri, 19 Feb 2021 14:30:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 766D822FE87;
 Fri, 19 Feb 2021 14:30:10 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb
 2021 14:30:09 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Tom Rini <trini@konsulko.com>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
 <20210210195926.GJ10169@bill-the-cat>
 <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <9b34272f-0e54-0fa6-0432-126d63a6b538@foss.st.com>
Date: Fri, 19 Feb 2021 14:30:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_05:2021-02-18,
 2021-02-19 signatures=0
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Ahmad,

On 2/11/21 12:14 PM, Ahmad Fatoum wrote:
> Hi,
>
> On 10.02.21 20:59, Tom Rini wrote:
>> On Tue, Feb 09, 2021 at 08:51:26PM +0100, Patrick DELAUNAY wrote:
>>> On 2/9/21 11:39 AM, Marek Vasut wrote:
>>>> On 2/9/21 11:14 AM, Patrick Delaunay wrote:
>>>> Hi,
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
>>>>> b/drivers/usb/gadget/dwc2_udc_otg.c
>>>>> index e3871e381e..ecac80fc11 100644
>>>>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
>>>>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
>>>>> @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice
>>>>> *dev)
>>>>>  =A0 static const struct udevice_id dwc2_udc_otg_ids[] =3D {
>>>>>  =A0=A0=A0=A0=A0 { .compatible =3D "snps,dwc2" },
>>>>>  =A0=A0=A0=A0=A0 { .compatible =3D "brcm,bcm2835-usb" },
>>>>> -=A0=A0=A0 { .compatible =3D "st,stm32mp1-hsotg",
>>>>> +=A0=A0=A0 { .compatible =3D "st,stm32mp15-hsotg",
>>>>>  =A0=A0=A0=A0=A0=A0=A0 .data =3D (ulong)dwc2_set_stm32mp1_hsotg_param=
s },
>>>> I have to point out the obvious, DT is ABI, this breaks ABI. However, =
do
>>>> we care about out-of-tree DTs here ?
>>>
>>> I know that the binding backward compatibility and "binary compatible" =
the
>>> is a key element of DT
>>>
>>> for the Linux kernel (for example the latest kernel image should work w=
ith a
>>> old device tree).
>> The way we use DTs in U-Boot we don't enforce ABI because we allow for
>> DTS and bindings to come in before they're fully stabilized in
>> linux-next/similar and then it's required to re-sync them once they are
>> final.
> I think platforms like the STM32MP1 should be handled specially, because
> they support having an external device tree passed from the FSBL at runti=
me.
> See https://github.com/trini/u-boot/blob/master/arch/arm/mach-stm32mp/boo=
t_params.c#L32
>
> @Patrick, wouldn't this change break booting newer U-Boot with older TF-A=
 in
> some configurations? Or is this reusing-fsbl-fdt feature unused?

> Cheers,
> Ahmad

I introduce this patch to prepare the FIP support in STM32MP15x TF-A

but it is not yet ready today in downstream or in upstream (STOpenLinux =

v2.1).


In this FIP use-case, the DT provided by TF-A to U-Boot is the "u-boot.dtb"

generated by U-Boot compilation (including the required =

"u-boot,dm-pre-reloc"

add-on).


The files "u-boot-nodtb.bin" and "u-boot.dtb" are provided to TF-A makefile

when the FIP is create; I hope these files are aligned as resulting of the

U-Boot compilation.


And update of existing FIP is possible with command:

 =A0PC $> fiptool update --nt-fw u-boot-nodtb.bin --hw-config u-boot.dtb =

fip.bin


Here I hope the DT and U-Boot binary are updated at the same time

to avoid any dependency issue=A0 (even if it is not mandatory).


But as this FIP feature is not yet used, I don't break the current or =

the FIP STM32MP1

configurations, except if I miss something,=A0 as the 2 U-Boot files in FIP

are updated at the same time.


Regards,

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
