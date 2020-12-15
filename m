Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E572DAF01
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Dec 2020 15:35:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 820DEC3087A;
	Tue, 15 Dec 2020 14:35:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D3EC36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 14:35:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BFERVNb016760; Tue, 15 Dec 2020 15:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZRl4LNStkalAl6xp3bfjqRrRpSXvjNUDLsmTRFWsnbI=;
 b=vg0XvzF1M+zHsyqRgo4oesJ+E3n83rrn5TC8f8lhLNqmhYNFZAsWHwUQZnqtalMUTFQx
 yYt4NRJX/yoULNKr6uOeBvOs+HZwZJmGyRaQ4Q8CX9n88L403JNqYmTVGdXTKJYfJGWj
 WJ9uFqFElyNP8g0bcVLu8Pug2pwmbrL0NWeyfineGuYZycj9kWgoFXtKBUPTh5Eeoi80
 Z5iypvoG0UfmVsE6I0J63OKq/34pCZHb+yUoZHmhE/MxyZivA4MIjOy8uffIoVK4v5bn
 iy6ZvDwqyjrAQNhoSBHItczq6VmGyPBDgdpSTkh22+R8TBHh7lxIFeizANRa/znezTRS Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpwe3agy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 15:35:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2A7D410002A;
 Tue, 15 Dec 2020 15:35:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC114215907;
 Tue, 15 Dec 2020 15:35:06 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Dec
 2020 15:35:06 +0100
To: Simon Glass <sjg@chromium.org>
References: <20201127104930.32692-1-patrick.delaunay@st.com>
 <20201127114927.2.Ida70f4fb1524187703e9240d63e436f8ae5adaab@changeid>
 <CAPnjgZ10epegATj3mBvjh0uLchyt9jGzAPt0KaF=NJ2FVNQHBQ@mail.gmail.com>
 <1606917178506.76711@st.com>
 <CAPnjgZ0O_jY2K5XsU+i3sgwn_P0NM41HfTbv6jLF3JBOeQTW_Q@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f9e23010-0ea4-f236-3b65-54eb59eb9738@foss.st.com>
Date: Tue, 15 Dec 2020 15:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ0O_jY2K5XsU+i3sgwn_P0NM41HfTbv6jLF3JBOeQTW_Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_12:2020-12-15,
 2020-12-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] console: sandbox: remove unnecessary
 sandbox code
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Simon,

On 12/12/20 4:39 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Wed, 2 Dec 2020 at 07:08, Patrick DELAUNAY <patrick.delaunay@st.com> wrote:
>> Hi Simon,
>>
>>> From: Simon Glass <sjg@chromium.org>
>>> Sent: lundi 30 novembre 2020 21:12
>>>
>>> Hi Patrick,
>>>
>>> On Fri, 27 Nov 2020 at 03:49, Patrick Delaunay <patrick.delaunay@st.com>
>>> wrote:
>>>> Remove the specific sandbox code in console.c, as the config
>>>> CONFIG_DEBUG_UART is already supported in drivers/serial/sandbox.c and
>>>> activated by default in all sandbox defconfig
>>>> (CONFIG_DEBUG_UART_SANDBOX=y and CONFIG_DEBUG_UART=y).
>>>>
>>>> This patch allows to test the console code under DEBUG_UART in sandbox
>>>> and avoids to include the file <os.h> in this u-boot generic code.
>>>>
>>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>>> ---
>>>>
>>>>   common/console.c | 15 ---------------
>>>>   1 file changed, 15 deletions(-)
>>> Please see this commit as to why I put that code back, after removing it myself.
>>>
>>> 64e9b4f346f Revert "sandbox: Drop special case console code for sandbox"
>>>
>>> Regards,
>>> Simon
>> Thanks to point it, I miss this old commit.
>>
>> I don't understood the issue in the commit message:
>>
>>      Revert "sandbox: Drop special case console code for sandbox"
>>
>>      While sandbox works OK without the special-case code, it does result in
>>      console output being stored in the pre-console buffer while sandbox starts
>>      up. If there is a crash or a problem then there is no indication of what
>>      is going on.
>>
>>      For ease of debugging it seems better to revert this change also.
>>
>> the existing code (here for putc, but it is the same for puts)  is:
>>
>> #ifdef CONFIG_SANDBOX
>>          /* sandbox can send characters to stdout before it has a console */
>>          if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>>                  os_putc(c);
>>                  return;
>>          }
>> #endif
>> #ifdef CONFIG_DEBUG_UART
>>          /* if we don't have a console yet, use the debug UART */
>>          if (!(gd->flags & GD_FLG_SERIAL_READY)) {
>>                  printch(c);
>>                  return;
>>          }
>> #endif
>>
>> For sandbox, when CONFIG_DEBUG_UART is activated
>>      printch => _printch => _debug_uart_putc => os_putc
>>
>> For me these 2 code block are identical for sandbox when CONFIG_DEBUG_UART
>>
>> And the  issue described is also solved by CONFIG_DEBUG_UART=y
>> (consle no use preconsole buffer when serial driver s not ready).
>>
>> Your concern  is when sandbox is compiled without CONFIG_DEBUG_UART ?
>>
>> Because it is no more the case with my previous patch (I activate it in sandbox*defconfig)
>>
>> but to avoid issue in futur (new sandbox*defconfig) it should be better to select (or imply)
>> his feature for sandbox  arch in Kconfig and not more activate it in sandbox*defconfig ?
>>
>> PS: with this sandox code, I don't see how to test the pre console buffer in sandbox...
>>         I think that the pre console buffer is alway empty for sandbox
>>
> OK maybe things have changed. Previously I noticed that the banner did
> not output until later. I will take another look.
>
> But I don't want to rely on the debug UART for sandbox to work.

Ok, it is not problem for me (avoid assumption on CONFIG_DEBUG_UART for 
sandbox)

you can consider that I abandon this change.

I will only replace

	#ifdef CONFIG_SANDBOX

by

	if (IS_ACTIVATED(CONFIG_SANDBOX))

in the other console the cleanup serie "console: remove #ifdef CONFIG when it is possible"

	http://patchwork.ozlabs.org/project/uboot/list/?series=218309

Regards,

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
