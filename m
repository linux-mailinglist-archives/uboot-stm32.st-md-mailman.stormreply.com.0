Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 853EC5E8EC5
	for <lists+uboot-stm32@lfdr.de>; Sat, 24 Sep 2022 19:04:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2783CC5F1D3;
	Sat, 24 Sep 2022 17:04:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89827C03FD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Sep 2022 17:04:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A47D1849CD;
 Sat, 24 Sep 2022 19:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664039093;
 bh=C4+RkS//aO/Kbk/S4ia5q6VHfvcwWryLxNYtQvAfjDc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PmlzbeOZcgoNBeKcAR8XZu0rBsC8+e4ZI90jC1K+WSg7S5bqmNZI/HaXbv/ZG2zxR
 E9CJNtRqLuxy0CJz9iAPKi8Mc0wTyBOM2lhpkQtyOHkf/lqyYjdFrLsS6dnnvzmB67
 kmBKsPT5aEbRRNq/VUf38QY1sp02QjGHeA3fWbG9vTrZ2CMrA9utV64FV/Bi55OSCx
 8VxAqcX9YJJHhuZjIAYljM7JTST/4wf5jHOt37240Z+XU2DmNaymOE7muSVWoxO3xE
 MQfUn+n4fBtP1WepSL9OOdvFhG92pQCqSUnL7+gLp2qfmJn1lyHP8xj5JE8+cu5CHJ
 IbnRSAmwWU3UQ==
Message-ID: <23426234-56e0-f5d7-c09c-f2ffa63258bd@denx.de>
Date: Sat, 24 Sep 2022 19:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
 <49a948fd-a392-6f30-f110-747ad3f3173b@denx.de>
 <29cf32ad-9e0c-c11b-abf5-e0d7f26126a6@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <29cf32ad-9e0c-c11b-abf5-e0d7f26126a6@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] usb: hub: allow to increase
	HUB_DEBOUNCE_TIMEOUT
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

On 9/12/22 15:37, Patrick DELAUNAY wrote:
> Hi,

Hi,

> On 9/9/22 14:24, Marek Vasut wrote:
>> On 9/9/22 11:45, Patrick Delaunay wrote:
>>> Add a new CONFIG_USB_HUB_DEBOUNCE_TIMEOUT to increase the
>>> HUB_DEBOUNCE_TIMEOUT value, for example to 2s because some usb device
>>> needs around 1.5s or more to make the hub port status to be
>>> connected steadily after being powered off and powered on.
>>>
>>> This 2s value is aligned with Linux driver and avoids to configure
>>> "usb_pgood_delay" as a workaround for connection timeout on
>>> some USB device; normally the env variable "usb_pgood_delay" is used
>>> to delay the first query after power ON and thus the device answer,
>>> but this variable not used to increase the connection timeout delay.
>>
>> I realized this has one problem -- what happens if you have multiple 
>> USB controllers in your system ? The answer is, all of them are 
>> affected by the increased delay, possibly even those which do not 
>> require the extra delay.
>>
>> Would it be possible to configure this per-controller (or should this 
>> even be per-device?) in DT ? In fact, I wonder whether this is not 
>> becoming a Vbus regulator ramp-up time kind of delay here ?
> 
> 
> Yes, but I don't think, it is blocking.
> 
> This timeout will be common for all the USB HUB in the system, as it is 
> done in Linux kernel.

I just realized this is not the same delay as the usb_pgood_delay, right ?

This is actually the maximum wait for a device to start communicating, 
i.e. even if this timeout is set to a very high value, most devices will 
not take that long and will start communicating in shorter time anyway, 
so the time of completion for e.g. '=> usb reset' is not affected by 
this change on very much all systems, correct ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
