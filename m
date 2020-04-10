Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608B1A44D6
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 11:58:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6DFEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 09:58:30 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DDC2C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 09:58:28 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zD3l5qJtz1qs03;
 Fri, 10 Apr 2020 11:58:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zD3l5XK0z1r0bb;
 Fri, 10 Apr 2020 11:58:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ng6HI63NLaMi; Fri, 10 Apr 2020 11:58:26 +0200 (CEST)
X-Auth-Info: vP6T+GBj1QY1/jf6PYW4RPrOaSplPZzFa702ZcI8UdA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 11:58:26 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403092537.19961-1-patrick.delaunay@st.com>
 <20200403105644.v2.2.Ib571c64a8c50fcbe386e728e38bbd320427e4efb@changeid>
 <2b133f06-e111-e709-8bdb-b01e791df284@denx.de>
 <a74ea1c21fa448f4b98bbb1089ae9b9a@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c47bdb06-4a99-d2b1-a957-71e54f9e9a5b@denx.de>
Date: Fri, 10 Apr 2020 10:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a74ea1c21fa448f4b98bbb1089ae9b9a@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] arm: stm32mp: activate data cache
	on DDR in SPL
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

On 4/9/20 8:10 PM, Patrick DELAUNAY wrote:
> Dear Marek,
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: vendredi 3 avril 2020 23:33
>>
>> On 4/3/20 11:25 AM, Patrick Delaunay wrote:
>>> Activate cache on DDR to improves the accesses to DDR used by SPL:
>>> - CONFIG_SPL_BSS_START_ADDR
>>> - CONFIG_SYS_SPL_MALLOC_START
>>>
>>> Cache is configured only when DDR is fully initialized, to avoid
>>> speculative access and issue in get_ram_size().
>>> Data cache is deactivated at the end of SPL, to flush the data cache
>>> and the TLB.
>>>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>> ---
>>>
>>> Changes in v2:
>>> - new
>>>
> 
> [...]
> 
>>> +void spl_board_prepare_for_boot(void) {
>>> +	dcache_disable();
>>> +	debug("SPL bye\n");
>>> +}
>>> +
>>> +void spl_board_prepare_for_boot_linux(void)
>>> +{
>>> +	dcache_disable();
>>> +	debug("SPL bye\n");
>>
>> Is the debug() statement really needed ? I think the common SPL code already
>> has some.
> 
> Not needed, I will drop them in V3.

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
