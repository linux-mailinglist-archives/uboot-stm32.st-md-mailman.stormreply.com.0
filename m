Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C003818063B
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 19:27:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED99C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 18:27:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB94C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 18:27:19 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48cNq92C3qz1qw97;
 Tue, 10 Mar 2020 19:27:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48cNq86tKsz1qqkq;
 Tue, 10 Mar 2020 19:27:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2Q9ihJ5pyXT7; Tue, 10 Mar 2020 19:27:14 +0100 (CET)
X-Auth-Info: gX1DwUoCzyXMuW4xepFpZk67uxzvuyXI0uNVEUhdzRo=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 10 Mar 2020 19:27:14 +0100 (CET)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <0679888c-4fa3-f759-6107-87eac3750755@denx.de>
 <6e2e15a588d742a8b9367807ba01d941@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f5bcdb37-d7ed-c190-bb21-62f8ec71b27c@denx.de>
Date: Tue, 10 Mar 2020 19:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6e2e15a588d742a8b9367807ba01d941@SFHDAG6NODE3.st.com>
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

On 3/10/20 6:01 PM, Patrick DELAUNAY wrote:
> Hi Marek,
> 
>> From: Marek Vasut <marex@denx.de>
>> Sent: mardi 10 mars 2020 16:20
>> Subject: Re: [PATCH v6 0/5] usb: host: dwc2: use driver model for PHY and
>> CLOCK
>> Importance: High
>>
>> On 3/10/20 11:09 AM, Patrick Delaunay wrote:
>>>
>>> In this serie I update the DWC2 host driver to use the device tree
>>> information and the associated PHY and CLOCK drivers when they are
>>> availables.
>>>
>>> V6 is minor update of the first patch of the serie; I update some clk
>>> stub to return success after Simon Goldschmidt remarks on V5:
>>> http://patchwork.ozlabs.org/project/uboot/list/?series=162791
>>
>> Once Simon reviews them, I'll put them in usb/next . btw I'm not CCed on 1/5,
>> would be helpful if you could keep the CC consistent, thanks
> 
> Ok and thanks
> 
> I used patman for the serie with default maintainers list + 3 reviewers in Serie-CC 
>     Series-cc: simon.k.r.goldschmidt@gmail.com
>     Series-cc: b.galvani@gmail.com
>     Series-cc: ley.foon.tan@intel.com
> 
> But I forgot you. Sorry.

I'd expect get-maintainer script should tell you to add me, maybe patman
needs fixing.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
