Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF6F78DE97
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 21:12:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BACDC6A61A;
	Wed, 30 Aug 2023 19:12:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46BE6C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:12:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-31ae6bf91a9so4995046f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693422767; x=1694027567;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M4qvSKBd+8qAzEGVd4+uEtjvUKHRFljUJI0HM1DprPg=;
 b=cuWGnCgKtp/cg7YgRUD/bTmxoZ6YgCgKT1io0bzWRvzkQYLHG4APlL4lj26L1viPty
 2JWfrs7kXWPgaoIUANkHxM2QYMDq6gffiR1dcVk44oeFT5D+UpwIJqtvPjyjlz5Lttbj
 dlq9/gqXD5l08VGQs97bjwytVr/Mtf0CMNmFirFM6nBhwzYEkskh1+6vQ2Ahn4s+dmey
 dVQ5s9rOL6RuTJALoU2YXcY6DzGyGg4dYy4GScYn62VmMxLb/gsvmWN+CctU9g69xJeL
 EabSP5ySXocTDoUMC0pMy60zutR8QYOOamm0LV24lI5+TsucH8avItLZb8qkQF7YUt/9
 kBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693422767; x=1694027567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4qvSKBd+8qAzEGVd4+uEtjvUKHRFljUJI0HM1DprPg=;
 b=Qp53/YE/x2t1hi2nwLt/HZ2F2NvUd9dzLudmhBwuq6coABcfebgJZVM/Q8IEnxdgaQ
 Ot6Z5WD61zKhYLCbvDiRVsSGGX0IugU+ruXrpM2IaOHzFYcDyPwOJ4jFTPujb5FNUJlt
 NQv+CzcG0ny6c9R1yoAujM+YOaWM0c5xJlK7I8X5xetFbat0tI4LDilu90aAGm83Xy9Q
 OMIZaQ8lMB7uR67nWivaA63BpJjoIzAPFplfa8GoccBUm20AAMtFANkyPvuHTCMmjVfk
 1ZYpMXFsuJGeG2G/W4T0YngtxuAPUTcqzOniDHFn6JoRRe4onTKYjxRBjnFuWoufG/Ch
 4i6g==
X-Gm-Message-State: AOJu0YxW77kcvoz6ruHfW9GNTuC3PVf9HA4vnWTehIsKI15Y+9R7Ghqh
 kfSIqtW6WWcozoPYMP2IZKo=
X-Google-Smtp-Source: AGHT+IElYKdUGnTaMoOgulCKXhwLtLm6+/pitlvsJlgrGPI77h24RKYtTmWQNVqu5l3+XjCoqGN/gg==
X-Received: by 2002:adf:fd85:0:b0:313:dee2:e052 with SMTP id
 d5-20020adffd85000000b00313dee2e052mr2228062wrr.26.1693422767339; 
 Wed, 30 Aug 2023 12:12:47 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b00317c742ca9asm17305581wru.43.2023.08.30.12.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 12:12:46 -0700 (PDT)
Message-ID: <2f283c6b-bf2c-4893-b286-25a44ff37dd1@gmail.com>
Date: Wed, 30 Aug 2023 22:12:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Simon Glass <sjg@chromium.org>, Alexander Graf <agraf@csgraf.de>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-11-alpernebiyasak@gmail.com>
 <CAPnjgZ2_9s_n9RWO_t_UUJWK1uvjDQSHikpMg7VbpmCn9uuk5g@mail.gmail.com>
 <e24d94b4-d519-4491-a38b-488510059a2a@csgraf.de>
 <CAPnjgZ2HqmyOPixmec8v9g2V9mvCQ2mnG4+jUL4-4=qXPOvsOw@mail.gmail.com>
 <1b8f64c7-deab-ae3a-3d22-a69fd74bdae9@csgraf.de>
 <CAPnjgZ2wivMkM407VxYfgOsgrZnLY7UXVMgZt1OfzJzjiKgKjg@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <CAPnjgZ2wivMkM407VxYfgOsgrZnLY7UXVMgZt1OfzJzjiKgKjg@mail.gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, u-boot-amlogic@groups.io,
 Matthias Brugger <mbrugger@suse.com>, Derald Woods <woods.technical@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Davis <afd@ti.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>, Da Xue <da@libre.computer>
Subject: Re: [Uboot-stm32] [PATCH v5 10/13] video: Only dcache flush damaged
	lines
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

On 2023-08-22 02:03 +03:00, Simon Glass wrote:
> Hi Alex,
> 
> On Mon, 21 Aug 2023 at 16:44, Alexander Graf <agraf@csgraf.de> wrote:
>>
>>
>> On 22.08.23 00:10, Simon Glass wrote:
>>> Hi Alex,
>>>
>>> On Mon, 21 Aug 2023 at 13:59, Alexander Graf <agraf@csgraf.de> wrote:
>>>>
>>>> On 21.08.23 21:11, Simon Glass wrote:
>>>>> Hi Alper,
>>>>>
>>>>> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>>>>>> From: Alexander Graf <agraf@csgraf.de>
>>>>>>
>>>>>> Now that we have a damage area tells us which parts of the frame buffer
>>>>>> actually need updating, let's only dcache flush those on video_sync()
>>>>>> calls. With this optimization in place, frame buffer updates - especially
>>>>>> on large screen such as 4k displays - speed up significantly.
>>>>>>
>>>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>>>> Reported-by: Da Xue <da@libre.computer>
>>>>>> [Alper: Use damage.xstart/yend, IS_ENABLED()]
>>>>>> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>>>>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v5:
>>>>>> - Use xstart, ystart, xend, yend as names for damage region
>>>>>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Fix dcache range; we were flushing too much before
>>>>>> - Remove ifdefs
>>>>>>
>>>>>>    drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++-----
>>>>>>    1 file changed, 36 insertions(+), 5 deletions(-)
>>>>> This is a little strange, since flushing the whole cache will only
>>>>> actually write out data that was actually written (to the display). Is
>>>>> there a benefit to this patch, in terms of performance?
>>>>
>>>> I'm happy to see you go through the same thought process I went through
>>>> when writing these: "This surely can't be the problem, can it?". The
>>>> answer is "simple" in hindsight:
>>>>
>>>> Have a look at the ARMv8 cache flush function. It does the only "safe"
>>>> thing you can expect it to do: Clean+Invalidate to POC because we use it
>>>> for multiple things, clearing modified code among others:
>>>>
>>>> ENTRY(__asm_flush_dcache_range)
>>>>           mrs     x3, ctr_el0
>>>>           ubfx    x3, x3, #16, #4
>>>>           mov     x2, #4
>>>>           lsl     x2, x2, x3              /* cache line size */
>>>>
>>>>           /* x2 <- minimal cache line size in cache system */
>>>>           sub     x3, x2, #1
>>>>           bic     x0, x0, x3
>>>> 1:      dc      civac, x0       /* clean & invalidate data or unified
>>>> cache */
>>>>           add     x0, x0, x2
>>>>           cmp     x0, x1
>>>>           b.lo    1b
>>>>           dsb     sy
>>>>           ret
>>>> ENDPROC(__asm_flush_dcache_range)
>>>>
>>>>
>>>> Looking at the "dc civac" call, we find this documentation page from
>>>> ARM:
>>>> https://developer.arm.com/documentation/ddi0601/2022-03/AArch64-Instructions/DC-CIVAC--Data-or-unified-Cache-line-Clean-and-Invalidate-by-VA-to-PoC
>>>>
>>>> This says we're writing any dirtyness of this cache line up to the POC
>>>> and then invalidate (remove the cache line) also up to POC. That means
>>>> when you look at a typical SBC, this will either be L2 or system level
>>>> cache. Every read afterwards needs to go and pull it all the way back to
>>>> L1 to modify it (or not) on the next character write and then flush it
>>>> again.
>>>>
>>>> Even worse: Because of the invalidate, we may even evict it from caches
>>>> that the display controller uses to read the frame buffer. So depending
>>>> on the SoC's cache topology and implementation, we may force the display
>>>> controller to refetch the full FB content on its next screen refresh cycle.
>>>>
>>>> I faintly remember that I tried to experiment with CVAC instead to only
>>>> flush without invalidating. I don't fully remember the results anymore
>>>> though. I believe CVAC just behaved identical to CIVAC on the A53
>>>> platform I was working on. And then I looked at Cortex-A53 errata like
>>>> [1] and just accepted that doing anything but restricting the flushing
>>>> range is a waste of time :)
>>> Yuck I didn't know it was invalidating too. That is horrible. Is there
>>> no way to fix it?
>>
>>
>> Before building all of this damage logic, I tried, but failed. I'd
>> welcome anyone else to try again :). I'm not even convinced yet that it
>> is actually fixable: Depending on the SoC's internal cache logic, it may
>> opt to always invalidate I think.
> 
> Wow, that is crazy! How is anyone supposed to make the system run well
> with logic like that??!
> 
>>
>> That said, this patch set really also makes sense outside of the
>> particular invalidate problem. It creates a generic abstraction between
>> the copy and non-copy code path and allows us to reduce the amount of
>> work spent for both, generically for any video sync operation.
> 
> Sure...my question was really why it helps so much, given what I
> understood the caches to be doing. If they are invalidating, then it
> is amazing anything gets done...

I don't really know cache mechanisms and terminology, but AFAIU there's
nothing actionable for this patch regarding this discussion, right?

Meanwhile I noticed this patch only flushes priv->fb, and think it also
needs to flush priv->copy_fb if VIDEO_COPY.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
