Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89045149F73
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 09:07:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D56F2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jan 2020 08:07:02 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4271C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 17:42:56 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48461D2mrzz1rHDF;
 Fri, 24 Jan 2020 18:42:56 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48461D2JZzz1qrZ3;
 Fri, 24 Jan 2020 18:42:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Z90gwm6YkdSJ; Fri, 24 Jan 2020 18:42:55 +0100 (CET)
X-Auth-Info: +tkvPTV1MHS9qRLxSNCp9AsHgBv2ZyUyLeSrkz4mRbE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 24 Jan 2020 18:42:54 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200121213843.96709-1-marex@denx.de>
 <09fea5052c6a48f7bc5353b5ce5ad884@SFHDAG6NODE3.st.com>
 <bda00092-eee5-9175-0c5c-f666d0797c5b@denx.de>
 <fabceed13a8642a8b3c87c37c0cdc46c@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <83700fb6-f487-76cb-2fe8-0e8493651099@denx.de>
Date: Fri, 24 Jan 2020 18:40:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fabceed13a8642a8b3c87c37c0cdc46c@SFHDAG6NODE3.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:07:02 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH V2] ARM: dts: stm32: Add DH Electronics
 DHCOM SoM and PDK2 board
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

On 1/24/20 1:38 PM, Patrick DELAUNAY wrote:
> Hi Marek

Hi,

>> From: Marek Vasut <marex@denx.de>
>> Sent: jeudi 23 janvier 2020 23:45
>>
>> On 1/23/20 10:57 AM, Patrick DELAUNAY wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>>> From: Marek Vasut <marex@denx.de>
>>>> Sent: mardi 21 janvier 2020 22:39
>>>>
>>>> Add support for DH Electronics DHCOM SoM and PDK2 rev. 400 carrier board.
>>>> This is an SoM with STM32MP157C and an evaluation kit. The baseboard
>>>> provides Ethernet, UART, USB, CAN and optional display.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>>>> Cc: Patrice Chotard <patrice.chotard@st.com>
>>>
>>> Few remarks (see after) about
>>> 1/ name of dts file (I prefer to don't add a file "-u-boot.dts") 2/
>>> stusb1600 support (it seens that the PDK2 board hav no this USB type C
>>> controller, so part of code can be dropped) 3/ ST board specific part
>>> are not needed : OTP_BOARD / command stboard
>>>
>>> But anayway:
>>>
>>> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
>>>
>>> I propose something for the first point on the custodians git, branch "dh"
>>> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>>>
>>> see " fixup! ARM: dts: stm32: Add DH Electronics DHCOM SoM and PDK2
>>> board" on dh branch
>>
>> Did you verify that the generated DT is identical for U-Boot and SPL before and
>> after this change ?
> 
> Yes => same dtb after the patch.
> 
> (I use "dtc -I dtb -O dts" on the generated files and I compare the dts file)

OK, then that's good.

>>> Are you are ok with this proposal ?
>>>
>>> In the same branch I propose 2 other modifications to reduce the size
>>> of board.c (remove feature note needed).
>>>
>>> - remove stusb1600 support
>>> - remove OTP_BOARD support and cmd_stboard
>>
>> These two are OK, thanks.
> 
> You send a V3 ?
> 
> I can squash the 3 commit on the branch And I merge it like that....
> Regards

I also renamed the DTs to indicate that you can insert any arbitrary
stm32mp15xx SoC into the board.

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
