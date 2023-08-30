Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68278DEBC
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 21:57:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059D0C6B442;
	Wed, 30 Aug 2023 19:57:12 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5DAAC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:57:11 +0000 (UTC)
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 2CDFC6080255;
 Wed, 30 Aug 2023 21:57:09 +0200 (CEST)
Message-ID: <17f7ca24-f961-41fd-a2e4-9f3dca7d75e4@csgraf.de>
Date: Wed, 30 Aug 2023 21:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Simon Glass <sjg@chromium.org>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <20230821135111.3558478-11-alpernebiyasak@gmail.com>
 <CAPnjgZ2_9s_n9RWO_t_UUJWK1uvjDQSHikpMg7VbpmCn9uuk5g@mail.gmail.com>
 <e24d94b4-d519-4491-a38b-488510059a2a@csgraf.de>
 <CAPnjgZ2HqmyOPixmec8v9g2V9mvCQ2mnG4+jUL4-4=qXPOvsOw@mail.gmail.com>
 <1b8f64c7-deab-ae3a-3d22-a69fd74bdae9@csgraf.de>
 <CAPnjgZ2wivMkM407VxYfgOsgrZnLY7UXVMgZt1OfzJzjiKgKjg@mail.gmail.com>
 <2f283c6b-bf2c-4893-b286-25a44ff37dd1@gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <2f283c6b-bf2c-4893-b286-25a44ff37dd1@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


On 30.08.23 21:12, Alper Nebi Yasak wrote:
> On 2023-08-22 02:03 +03:00, Simon Glass wrote:
>> Hi Alex,
>>
>> On Mon, 21 Aug 2023 at 16:44, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>> On 22.08.23 00:10, Simon Glass wrote:
>>>> Hi Alex,
>>>>
>>>> On Mon, 21 Aug 2023 at 13:59, Alexander Graf <agraf@csgraf.de> wrote:
>>>>> On 21.08.23 21:11, Simon Glass wrote:
>>>>>> Hi Alper,
>>>>>>
>>>>>> On Mon, 21 Aug 2023 at 07:51, Alper Nebi Yasak <alpernebiyasak@gmail.com> wrote:
>>>>>>> From: Alexander Graf <agraf@csgraf.de>
>>>>>>>
>>>>>>> Now that we have a damage area tells us which parts of the frame buffer
>>>>>>> actually need updating, let's only dcache flush those on video_sync()
>>>>>>> calls. With this optimization in place, frame buffer updates - especially
>>>>>>> on large screen such as 4k displays - speed up significantly.
>>>>>>>
>>>>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>>>>> Reported-by: Da Xue <da@libre.computer>
>>>>>>> [Alper: Use damage.xstart/yend, IS_ENABLED()]
>>>>>>> Co-developed-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>>>>>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in v5:
>>>>>>> - Use xstart, ystart, xend, yend as names for damage region
>>>>>>> - Use IS_ENABLED() instead of CONFIG_IS_ENABLED()
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Fix dcache range; we were flushing too much before
>>>>>>> - Remove ifdefs
>>>>>>>
>>>>>>>     drivers/video/video-uclass.c | 41 +++++++++++++++++++++++++++++++-----
>>>>>>>     1 file changed, 36 insertions(+), 5 deletions(-)
>>>>>> This is a little strange, since flushing the whole cache will only
>>>>>> actually write out data that was actually written (to the display). Is
>>>>>> there a benefit to this patch, in terms of performance?
>>>>> I'm happy to see you go through the same thought process I went through
>>>>> when writing these: "This surely can't be the problem, can it?". The
>>>>> answer is "simple" in hindsight:
>>>>>
>>>>> Have a look at the ARMv8 cache flush function. It does the only "safe"
>>>>> thing you can expect it to do: Clean+Invalidate to POC because we use it
>>>>> for multiple things, clearing modified code among others:
>>>>>
>>>>> ENTRY(__asm_flush_dcache_range)
>>>>>            mrs     x3, ctr_el0
>>>>>            ubfx    x3, x3, #16, #4
>>>>>            mov     x2, #4
>>>>>            lsl     x2, x2, x3              /* cache line size */
>>>>>
>>>>>            /* x2 <- minimal cache line size in cache system */
>>>>>            sub     x3, x2, #1
>>>>>            bic     x0, x0, x3
>>>>> 1:      dc      civac, x0       /* clean & invalidate data or unified
>>>>> cache */
>>>>>            add     x0, x0, x2
>>>>>            cmp     x0, x1
>>>>>            b.lo    1b
>>>>>            dsb     sy
>>>>>            ret
>>>>> ENDPROC(__asm_flush_dcache_range)
>>>>>
>>>>>
>>>>> Looking at the "dc civac" call, we find this documentation page from
>>>>> ARM:
>>>>> https://developer.arm.com/documentation/ddi0601/2022-03/AArch64-Instructions/DC-CIVAC--Data-or-unified-Cache-line-Clean-and-Invalidate-by-VA-to-PoC
>>>>>
>>>>> This says we're writing any dirtyness of this cache line up to the POC
>>>>> and then invalidate (remove the cache line) also up to POC. That means
>>>>> when you look at a typical SBC, this will either be L2 or system level
>>>>> cache. Every read afterwards needs to go and pull it all the way back to
>>>>> L1 to modify it (or not) on the next character write and then flush it
>>>>> again.
>>>>>
>>>>> Even worse: Because of the invalidate, we may even evict it from caches
>>>>> that the display controller uses to read the frame buffer. So depending
>>>>> on the SoC's cache topology and implementation, we may force the display
>>>>> controller to refetch the full FB content on its next screen refresh cycle.
>>>>>
>>>>> I faintly remember that I tried to experiment with CVAC instead to only
>>>>> flush without invalidating. I don't fully remember the results anymore
>>>>> though. I believe CVAC just behaved identical to CIVAC on the A53
>>>>> platform I was working on. And then I looked at Cortex-A53 errata like
>>>>> [1] and just accepted that doing anything but restricting the flushing
>>>>> range is a waste of time :)
>>>> Yuck I didn't know it was invalidating too. That is horrible. Is there
>>>> no way to fix it?
>>>
>>> Before building all of this damage logic, I tried, but failed. I'd
>>> welcome anyone else to try again :). I'm not even convinced yet that it
>>> is actually fixable: Depending on the SoC's internal cache logic, it may
>>> opt to always invalidate I think.
>> Wow, that is crazy! How is anyone supposed to make the system run well
>> with logic like that??!
>>
>>> That said, this patch set really also makes sense outside of the
>>> particular invalidate problem. It creates a generic abstraction between
>>> the copy and non-copy code path and allows us to reduce the amount of
>>> work spent for both, generically for any video sync operation.
>> Sure...my question was really why it helps so much, given what I
>> understood the caches to be doing. If they are invalidating, then it
>> is amazing anything gets done...
> I don't really know cache mechanisms and terminology, but AFAIU there's
> nothing actionable for this patch regarding this discussion, right?
>
> Meanwhile I noticed this patch only flushes priv->fb, and think it also
> needs to flush priv->copy_fb if VIDEO_COPY.


The reason was mostly that copy_fb is really only used on x86 where we 
don't have the cache flush problem/code :). So nobody bothered to add 
flushing to that code path.


Alex

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
