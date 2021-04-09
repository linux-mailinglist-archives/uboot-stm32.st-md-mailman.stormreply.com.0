Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E833F359C29
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 12:32:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5555C56639;
	Fri,  9 Apr 2021 10:32:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86FCFC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 10:32:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139AMkXb030849; Fri, 9 Apr 2021 12:32:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=di9/uWWgzpwHpMsdg6ahwPaqI/2Dqjfy2OfHbHVoq7o=;
 b=gVKYeDtvVxZjr2NLeVzbLo6+tv02kyc0E+1aRUMnkNCMXBeIT/ohNHqkOr2WTktSo127
 7kRp2+Ycqx4irl9AKsUchD7+jbeeFYVjDjPsRrXeOqT0CJFqVhtZD72FqQwi0oN7ZLjN
 fbSO/r7NW0CDwfY+zsW3Q2d9T5wgFQkEaNvQpfuGiNGw6Xsw86wkG9MnSQiVxoKzgWIh
 MO3N5uVQZUSO6f0Y786M67mEMAHyPcYmgArYlWl4fLF5XpvVkELMSTMxc8dBafYHhDlW
 Fuqv1X3Iylyczgctzps2MOyTk44S/szwTUbhfcg2zIv0IyTpjiP9Ht1zfFuA20PElrBu lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d9bb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 12:32:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 704F910002A;
 Fri,  9 Apr 2021 12:32:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D24D22A31E;
 Fri,  9 Apr 2021 12:32:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 12:32:11 +0200
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
 <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
Date: Fri, 9 Apr 2021 12:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] cmd: bind: Fix driver binding on a
	device
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



On 4/9/21 11:48 AM, Andy Shevchenko wrote:
> On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
>> On 4/9/21 11:16 AM, Andy Shevchenko wrote:
>>> On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
>>> <patrice.chotard@foss.st.com> wrote:
> 
> ...
> 
>>>> +                       if (drv) {
>>>> +                               if (drv == entry)
>>>> +                                       break;
>>>
>>>> +                       } else {
>>>> +                               if (!ret)
>>>> +                                       break;
>>>> +                       }
>>>
>>> This can be simplified to
>>> } else if (!ret)
>>>   break;
>>
>> I know but checkpatch.pl requested it ;-)
> 
> You mean it doesn't recognize 'else if' construction? Then it's a bug
> there for sure.
> 

No, i mean checkpath.pl request to put {} on all statements as shown below :

./scripts/checkpatch.pl 0001-cmd-bind-Fix-driver-binding-on-a-device.patch 
CHECK: braces {} should be used on all arms of this statement
#83: FILE: drivers/core/lists.c:228:
+			if (drv) {
[...]
+			} else if (!ret)
[...]

total: 0 errors, 0 warnings, 1 checks, 100 lines checked


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
