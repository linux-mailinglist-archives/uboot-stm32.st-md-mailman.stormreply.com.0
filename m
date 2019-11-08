Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFAF4503
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 11:52:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D48CEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 10:52:37 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B271C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 10:52:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 478cYH42TTz1qqkP;
 Fri,  8 Nov 2019 11:52:35 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 478cYH3VHYz1qqkP;
 Fri,  8 Nov 2019 11:52:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jDWuaoWMmUkd; Fri,  8 Nov 2019 11:52:34 +0100 (CET)
X-Auth-Info: 0NBsZNhmkLujfmCAWZGwSg5dsNg2nVDLBjT/drC2/Ok=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  8 Nov 2019 11:52:34 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
 <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
 <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
 <5e90369b-c273-028e-ee27-bfd7249ae64e@denx.de>
 <da2174ce14a04120bc6fa5a425f0d90e@SFHDAG6NODE3.st.com>
 <39e7831d-7981-ded6-5b71-0b93ecd7f449@denx.de>
 <28ad7b0031e64ab6a1316ae887128783@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4f11877b-6a16-4818-ba26-ce87cac6f94f@denx.de>
Date: Fri, 8 Nov 2019 11:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <28ad7b0031e64ab6a1316ae887128783@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>, Michal Suchanek <msuchanek@suse.de>,
 Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/5] usb: host: dwc2: force reset
	assert
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

On 11/8/19 11:51 AM, Patrick DELAUNAY wrote:
[...]
>>>> Isn't there a way to poll the IP to determine whether the reset completed ?
>>>
>>> It is HW IP reset, the complete state is not available for stm32mp1 reset
>> controller (RCC).
>>> And the need reset duration of depends on each IP (can't be handle in reset u-
>> class).
>>
>> If it's a SoC specific delay, it should be in the reset driver.
>>
>>> I check with DWC2 OTG IP expert, and we found in
>>> DWC_otg_databook_3.30a.pdf
>>>
>>> t_rst: DWC_otg PHY clock domain reset and AHB hclk domain reset over lap
>> time
>>>         (a minimum of 12 cycles of the slowest clock is recommended.)
>>>
>>> In our board, we have 209MHz for AHB frequency... USB phy clock is
>>> 48MHz So freq12 cycles is MIN(57ns,  250ns) < 1us.
>>>
>>> The 2us value seens a over protection.
>>>
>>> I will reduce it to 1us in V2 and I will add comments for.
>>
>> Well, why don't you put this into the reset driver ? Seems to be a more fitting place
>> for this. I don't think every single SoC has the same clock settings.
> 
> Ok, I will remove the delay in driver.

Does it make sense to put it into the reset driver though ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
