Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADB359F9B
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 15:13:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F82AC56639;
	Fri,  9 Apr 2021 13:13:15 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C2E6C36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 13:13:14 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id f12so4105140qtf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3M0UePONObMmAkXxLVWsPrieSLSqJO2EJ008Ax/y/0g=;
 b=a4+kP0X5un7CkdGZ5uB9eg5y6pYnKfrAv4yhjnn68tX+wI9zffSJUHJcS0w5GqTO2l
 hLQT1G+zU4H2d3nGV6XtlH2v7tMu8/44/W8rbMaUcOzDUqvdAh7QMOTWUew23aRMo18j
 oGKFd6XEyI/4nyq5JklutYbffKE1/iIkr7qr5VxTtJNWBixt759FmN+yK3/UCZE9UIMW
 sMewJsvnC1nPYD6MPWqx7nYbuYcl+5FYdR4dczH6jFsJXqSPJKwhU6idwrIXP4QfKBvH
 GPctUr/5ltUGXeCW1xO1RTyEbwMzHlRILFYS3Ihik3zYwyTswLQutnaQe2NcgxJGNVJT
 Yxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3M0UePONObMmAkXxLVWsPrieSLSqJO2EJ008Ax/y/0g=;
 b=nSMqFB1No+uU4vPpG20ruELqVHUV7gOBGR4SALaHSQCEViJTGfx+J5QSzbQyxEOvRO
 uivKLg7QDg6EeefhU8uwCq211RAFpPFbXP9w58nSs9LUNQLmmKvoMaUVH7iUS6Fy2Kh/
 VAL7DYI35Fpakxic072VEQpiaQSLxAFKMXy9GprnjF/+veeB234YZ8zBnMl4nu3ySkkc
 CAQgQKjeu78AzMuPoZBK4OPKmsbIfJffO41y7+yOzGcZB/4iAXLMOoBJaMJiT++vdM5a
 LUPD2YFxtgFYez341jW5kFgQwN+h1KIoz/dvXiHUo3AMJp9eX/ZH14d+fsTiysqcGds4
 4xRw==
X-Gm-Message-State: AOAM531nkH993Xf5m2lALyk7HDsCXoFFujEtsrTELfT/rPv1x/o08l7+
 8ATZFRnPvxV01foTEMlBtF0=
X-Google-Smtp-Source: ABdhPJyARsPHUcnrgtHnETTHaOr3B2RmvuTqky6jcBdq3O2zZDNpe3xSKDsNkhmceRGns4vDJTSTzQ==
X-Received: by 2002:ac8:6f48:: with SMTP id n8mr5445842qtv.22.1617973993451;
 Fri, 09 Apr 2021 06:13:13 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id z17sm1748775qtf.10.2021.04.09.06.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 06:13:13 -0700 (PDT)
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210409073617.16045-1-patrice.chotard@foss.st.com>
 <20210409073617.16045-2-patrice.chotard@foss.st.com>
 <CAHp75Vd+ROF4B7io5QM=SY8S8hfzYe4DJCkM1h9fHkSMWgF30w@mail.gmail.com>
 <2d124ca6-664d-08b8-909f-1bde35856529@foss.st.com>
 <CAHp75VeA_iT1D5Vyj0L3gaDAYeB1iMZLN+e11rLj39pBMxB9Ag@mail.gmail.com>
 <014a0559-aec0-6a65-77fd-141707a58d7c@foss.st.com>
 <CAHp75VeapNBfb=LbSdhyOt=CAd704khVAsc5wgFUs9-C9+dCuw@mail.gmail.com>
 <1b1695a5-dd8b-b6c9-e04d-910b90ad7257@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <d88c5c18-baa2-32cb-8baa-4a2021271ec8@gmail.com>
Date: Fri, 9 Apr 2021 09:13:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1b1695a5-dd8b-b6c9-e04d-910b90ad7257@foss.st.com>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Ye Li <ye.li@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Herbert Poetzl <herbert@13thfloor.at>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 4/9/21 8:05 AM, Patrice CHOTARD wrote:
> 
> 
> On 4/9/21 1:01 PM, Andy Shevchenko wrote:
>> On Fri, Apr 9, 2021 at 1:32 PM Patrice CHOTARD
>> <patrice.chotard@foss.st.com> wrote:
>>> On 4/9/21 11:48 AM, Andy Shevchenko wrote:
>>>> On Fri, Apr 9, 2021 at 12:28 PM Patrice CHOTARD
>>>> <patrice.chotard@foss.st.com> wrote:
>>>>> On 4/9/21 11:16 AM, Andy Shevchenko wrote:
>>>>>> On Fri, Apr 9, 2021 at 10:37 AM Patrice Chotard
>>>>>> <patrice.chotard@foss.st.com> wrote:
>>
>> ...
>>
>>>>>>> +                       if (drv) {
>>>>>>> +                               if (drv == entry)
>>>>>>> +                                       break;
>>>>>>
>>>>>>> +                       } else {
>>>>>>> +                               if (!ret)
>>>>>>> +                                       break;
>>>>>>> +                       }
>>>>>>
>>>>>> This can be simplified to
>>>>>> } else if (!ret)
>>>>>>    break;
>>>>>
>>>>> I know but checkpatch.pl requested it ;-)
>>>>
>>>> You mean it doesn't recognize 'else if' construction? Then it's a bug
>>>> there for sure.
>>>>
>>>
>>> No, i mean checkpath.pl request to put {} on all statements as shown below :
>>>
>>> ./scripts/checkpatch.pl 0001-cmd-bind-Fix-driver-binding-on-a-device.patch
>>> CHECK: braces {} should be used on all arms of this statement
>>> #83: FILE: drivers/core/lists.c:228:
>>> +                       if (drv) {
>>> [...]
>>> +                       } else if (!ret)
>>
>> So, you still can put else and if on one line, right?
>>
> 
> No, if i put else and if on one line as you suggested, checkpatch.pl is complaining as shown above.
> 
> Patrice
> 

} else if (!ret) {
	break;
}

?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
