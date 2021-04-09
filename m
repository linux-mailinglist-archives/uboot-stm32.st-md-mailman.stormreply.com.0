Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97635A120
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 16:34:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB779C56639;
	Fri,  9 Apr 2021 14:34:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30244C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 14:34:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139EVeUl027624; Fri, 9 Apr 2021 16:34:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8xP2L3sd5NIjkDDS4ASFx88UCL8qb29qYX/b/lrST14=;
 b=gonxBfUhVnU6cqiG5TP6yYHwJebfFuBjvMvIZ/Vv5RE1LNj74yPUjXN0L+qa5NguxIey
 brCd8vSvdOSRpE/15ilVrzipdmHmVXYOiYPBzRGR2dkngSbxv7qFhIZHirgjDGO+d8B8
 fW5JQpYJhosvwE1yDCiClKTcJZtbDXBiEEUyVLMpQW/El1ZlGo1uxCYrptRz4RJg5zh+
 rZ3WMMwWa3gghbQ4Qk2UjaJ3UDddOPqVND6b3157zCGP7fZx9Mw6UcNF5Eg3G4mKjfR5
 U8YayI491jA/fHpiOntuVVSHlkdllfIw9O8922NqMftltp5fn4QOeRpF6kGXtehvNokE HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj16jndj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 16:34:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CA7D100034;
 Fri,  9 Apr 2021 16:34:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D198248870;
 Fri,  9 Apr 2021 16:34:18 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 16:34:17 +0200
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Sean Anderson
 <seanga2@gmail.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
 <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
 <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
 <CAHp75VeapNBfb=LbSdhyOt=CAd704khVAsc5wgFUs9-C9+dCuw@mail.gmail.com>
 <1b1695a5-dd8b-b6c9-e04d-910b90ad7257@foss.st.com>
 <d88c5c18-baa2-32cb-8baa-4a2021271ec8@gmail.com>
 <YHBZjtTb+Pmd3J4a@smile.fi.intel.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ecdc2e42-c92f-94b3-745d-8aab9b179322@foss.st.com>
Date: Fri, 9 Apr 2021 16:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YHBZjtTb+Pmd3J4a@smile.fi.intel.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_06:2021-04-09,
 2021-04-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
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



On 4/9/21 3:41 PM, Andy Shevchenko wrote:
> On Fri, Apr 09, 2021 at 09:13:12AM -0400, Sean Anderson wrote:
>> On 4/9/21 8:05 AM, Patrice CHOTARD wrote:
>>> On 4/9/21 1:01 PM, Andy Shevchenko wrote:
>>>> On Fri, Apr 9, 2021 at 1:32 PM Patrice CHOTARD
>>>> <patrice.chotard@foss.st.com> wrote:
>>>>> On 4/9/21 11:48 AM, Andy Shevchenko wrote:
>>>>>> On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
>>>>>> <patrice.chotard@foss.st.com> wrote:
>>>>>>> On 4/9/21 11:16 AM, Andy Shevchenko wrote:
>>>>>>>> On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
>>>>>>>> <patrice.chotard@foss.st.com> wrote:
> 
> ...
> 
>>>>>>>>> +                       if (drv) {
>>>>>>>>> +                               if (drv == entry)
>>>>>>>>> +                                       break;
>>>>>>>>
>>>>>>>>> +                       } else {
>>>>>>>>> +                               if (!ret)
>>>>>>>>> +                                       break;
>>>>>>>>> +                       }
>>>>>>>>
>>>>>>>> This can be simplified to
>>>>>>>> } else if (!ret)
>>>>>>>>    break;
>>>>>>>
>>>>>>> I know but checkpatch.pl requested it ;-)
>>>>>>
>>>>>> You mean it doesn't recognize 'else if' construction? Then it's a bug
>>>>>> there for sure.
>>>>>>
>>>>>
>>>>> No, i mean checkpath.pl request to put {} on all statements as shown below :
>>>>>
>>>>> ./scripts/checkpatch.pl 0001-cmd-bind-Fix-driver-binding-on-a-device.patch
>>>>> CHECK: braces {} should be used on all arms of this statement
>>>>> #83: FILE: drivers/core/lists.c:228:
>>>>> +                       if (drv) {
>>>>> [...]
>>>>> +                       } else if (!ret)
>>>>
>>>> So, you still can put else and if on one line, right?
>>>>
>>>
>>> No, if i put else and if on one line as you suggested, checkpatch.pl is complaining as shown above.
>>>
>>> Patrice
>>>
>>
>> } else if (!ret) {
>> 	break;
>> }
>>
>> ?
> 
> Thanks, that's fine for me. Does checkpatch.pl complain on this?
> 

This implementation is OK too, checkpatch is happy with it.

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
