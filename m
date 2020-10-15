Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0D28F7B3
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 19:38:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65CB1C3FADE;
	Thu, 15 Oct 2020 17:38:58 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 415E5C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 17:38:57 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CBxNH3Yybz1s6Cl;
 Thu, 15 Oct 2020 19:38:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CBxNH2wvRz1qqkh;
 Thu, 15 Oct 2020 19:38:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id shUgWglzRsRu; Thu, 15 Oct 2020 19:38:54 +0200 (CEST)
X-Auth-Info: TsC9txgL8/OvTP30LGkqSqc9owe9yyB06DqTbYpP4fY=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 15 Oct 2020 19:38:54 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
 <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
 <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <eeaec9e8-764f-8869-33c3-0b3d4d74348e@denx.de>
Date: Thu, 15 Oct 2020 19:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: add "u-boot,
	force-vbus-detection" for stm32
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

On 10/15/20 6:52 PM, Patrick DELAUNAY wrote:

Hi,

[...]

>> On 10/15/20 2:49 PM, Patrick Delaunay wrote:
>>> On some board, the ID pin is not connected so the B session must be
>>> overridden with "u-boot,force_b_session_valid" but the VBus sensing
>>> must continue to be handle.
>>>
>>> To managed it, this patch adds a new DT field
>>> "u-boot,force-vbus-detection" to use with "u-boot,force_b_session_valid"
>>
>> How is this solved in Linux ?
> 
> It is managed by Linux DWC2 driver: it is a real OTG driver, with dual mode
> support and by usb framework
> 
> Throught the properties
> &usbotg_hs {
> 	usb-role-switch;
> };
> 
> a glue treat the session and the sensing management
> see linux/drivers/usb/dwc2/drd.c in linux-next
> 
> PS: activate_stm_id_vb_detection is also used in driver = hsotg->params. 
> 
> As ID pin / vbus is completly managed by the USB TYPE driver C
> (STUSB1600 for STMicroelectronics board) and DWC2 driver with dual role
> stack (host/gadget).
> 
> I don't found a better solution than device tree property for this task in U-Boot as DWC2
> driver don't support dual role and U-Boot don't have framework for USB type C controller.
> 
>>
>> btw can you do something about that huge change in indent ? Is it necessary ?
> 
> I move all this code under activate_stm_id_vb_detection (linked to compatible "st,stm32mp1-hsotg")
> to avoid impact on other platform as this "sensing" properties are only support for STM32MP15X
> (it is linked to USB block detection integrated in SOC)
> 
> And after I need to check the 
> 1/ The usb33d-supply is required of vbus or IDPIN sensing
> 2/ manage Vbus sensing or override (according dt)
> 3/ manage IDPIN or override (according dt)
> 
> I add a new property to be backward compatible (even it the combinaison is less clear)
> I protect regulator function call to avoid compilation issue for other platform.
> 
> PS: after reading the refmanual, I also split VALOEN and VALOVAL bit update as it is required.
> 
> So yes I think it is needed but I can split the patch to simplify the review.

I presume you don't feel like implementing proper OTG support, right ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
