Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025A181850
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 13:42:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5450C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Mar 2020 12:42:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1E36C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2020 12:42:39 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48cs7161prz1rrjv;
 Wed, 11 Mar 2020 13:42:37 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48cs713gxjz1qyFF;
 Wed, 11 Mar 2020 13:42:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dIMtVmHQM6gU; Wed, 11 Mar 2020 13:42:35 +0100 (CET)
X-Auth-Info: 9kaOx/Ht/QJjqrYDEO+a0GQTKVXcUqtWG1m5qSIFlBU=
Received: from [127.0.0.1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 11 Mar 2020 13:42:35 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <0679888c-4fa3-f759-6107-87eac3750755@denx.de>
 <6e2e15a588d742a8b9367807ba01d941@SFHDAG6NODE3.st.com>
 <f5bcdb37-d7ed-c190-bb21-62f8ec71b27c@denx.de>
 <485752ee00e2480781494cedc33ec43e@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <bba35d77-2f56-aa1c-890b-3acaf964accf@denx.de>
Date: Wed, 11 Mar 2020 13:42:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <485752ee00e2480781494cedc33ec43e@SFHDAG6NODE3.st.com>
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

On 3/11/20 1:30 PM, Patrick DELAUNAY wrote:
> Hi Marek,

Hi,

>> From: Marek Vasut <marex@denx.de>
>> Sent: mardi 10 mars 2020 19:27
>>
>> On 3/10/20 6:01 PM, Patrick DELAUNAY wrote:
>>> Hi Marek,
>>>
>>>> From: Marek Vasut <marex@denx.de>
>>>> Sent: mardi 10 mars 2020 16:20
>>>> Subject: Re: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY
>>>> and CLOCK
>>>> Importance: High
>>>>
>>>> On 3/10/20 11:09 AM, Patrick Delaunay wrote:
>>>>>
>>>>> In this serie I update the DWC2 host driver to use the device tree
>>>>> information and the associated PHY and CLOCK drivers when they are
>>>>> availables.
>>>>>
>>>>> V6 is minor update of the first patch of the serie; I update some
>>>>> clk stub to return success after Simon Goldschmidt remarks on V5:
>>>>> http://patchwork.ozlabs.org/project/uboot/list/?series=162791
>>>>
>>>> Once Simon reviews them, I'll put them in usb/next . btw I'm not CCed
>>>> on 1/5, would be helpful if you could keep the CC consistent, thanks
>>>
>>> Ok and thanks
>>>
>>> I used patman for the serie with default maintainers list + 3 reviewers in Serie-CC
>>>     Series-cc: simon.k.r.goldschmidt@gmail.com
>>>     Series-cc: b.galvani@gmail.com
>>>     Series-cc: ley.foon.tan@intel.com
>>>
>>> But I forgot you. Sorry.
>>
>> I'd expect get-maintainer script should tell you to add me, maybe patman needs
>> fixing.
> 
> I will try to avoid this issue for my next serie...
> 
> FYI: I check and the CC list is build with (series.py::MakeCcFile)
> 
> 1/ Get maitainer script
> 
> It give me for this patch
> 
> ./scripts/get_maintainer.pl 0001-dm-clk-add-stub-when-CONFIG_CLK-is-deactivated.patch 

Because it's a clock patch, I see.
[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
