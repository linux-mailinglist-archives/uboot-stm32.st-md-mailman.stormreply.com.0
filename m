Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E422578DEAE
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 21:52:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98EB2C6B442;
	Wed, 30 Aug 2023 19:52:50 +0000 (UTC)
Received: from zulu616.server4you.de (mail.csgraf.de [85.25.223.15])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2AEC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 19:52:49 +0000 (UTC)
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id C60496080490;
 Wed, 30 Aug 2023 21:52:46 +0200 (CEST)
Message-ID: <12ff5d7b-6d99-4a1f-b798-17d3fbbb7f46@csgraf.de>
Date: Wed, 30 Aug 2023 21:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Simon Glass <sjg@chromium.org>
References: <20230821135111.3558478-1-alpernebiyasak@gmail.com>
 <CAPnjgZ0FrwViFv8xLFSkTtztZQw=hnNprCcHfp39s_jfMHRCgA@mail.gmail.com>
 <eda9f0f0-fc4d-42b6-abbd-749f67ef6b10@csgraf.de>
 <CAPnjgZ376PEfX75eGL6QvmehZ9Kp+5_orhcsKOpr=8rpRKutFA@mail.gmail.com>
 <62403d10-946d-489a-b225-1b1c180b9349@csgraf.de>
 <CAPnjgZ3WCmtw_Gdpf=E8Ed5faH4T7-=yPf6RwcktukQEG-7J8g@mail.gmail.com>
 <c1ddb2af-8f3d-1e6c-cc67-76d16fe6aff5@csgraf.de>
 <CAPnjgZ1Y6aahxRRnY5Tb8N6Uk2TuZViXyBXG_MgMSn7QKt8EXw@mail.gmail.com>
 <3edfc316-bdf4-4d11-b592-2e584f1aabb3@csgraf.de>
 <CAPnjgZ1jMhuw2iqkiy6uEWABSF_4fHiet=-=-9LOMKb7-RGziw@mail.gmail.com>
 <b470fd4e-dab9-4edc-bfe4-1a6591a900f9@csgraf.de>
 <CAPnjgZ2+-ka9hbNnLFVvY6Gv=0TLuxT2fiDE0=WHF=E5Wci0wg@mail.gmail.com>
 <11296797-3d37-413b-9517-2890ae26a9bd@csgraf.de>
 <CAPnjgZ1a=+5bcX-ku+_wEMWpAESHnzCFT9SWbdwoVxYcZ04VZg@mail.gmail.com>
 <1470fab1-3bc9-4dba-9345-1498d3387202@csgraf.de>
 <1703083d-b229-4f41-8e61-1fe0d4618202@gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <1703083d-b229-4f41-8e61-1fe0d4618202@gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 00/13] Add video damage tracking
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


On 30.08.23 20:27, Alper Nebi Yasak wrote:
> Hi all,
>
> On 2023-08-29 09:27 +03:00, Alexander Graf wrote:
>> On 29.08.23 00:08, Simon Glass wrote:
>>> On Mon, 28 Aug 2023 at 14:24, Alexander Graf <agraf@csgraf.de> wrote:
>>>> On 28.08.23 19:54, Simon Glass wrote:
>>>>> U-Boot does have video_sync() but it doesn't know when to call it. If
>>>>> it does not call it, then any amount of single-threaded code can run
>>>>> after that, which may update the framebuffer. In other words, U-Boot
>>>>> is in exactly the same boat as UEFI. It has to decide whether to call
>>>>> video_sync() based on some sort of heuristic.
>>>>>
>>>>> That is the only point I am trying to make here. Does that make sense?
>>>> Oh, I thought you mentioned above that U-Boot is in a better spot or
>>>> "has it solved already". I agree - it's in the same boat and the only
>>>> safe thing it can really do today that is fully cross-platform
>>>> compatible is to call video_sync() after every character.
>>>>
>>>> I don't understand what you mean by "any amount of single-threaded code
>>>> can run after that, which may update the framebuffer". Any framebuffer
>>>> modification is U-Boot internal code which then again can apply
>>>> video_sync() to tell the system "I want what I wrote to screen actually
>>>> be on screen now". I don't think that's necessarily bad design. A bit
>>>> clunky, but we're in a pre-boot environment after all.
>>>>
>>>> Since we're aligned now: What exactly did you refer to with "but we have
>>>> managed to work out something"?
>>>>> So now we are on the same page about that point. The next step is my
>>> heuristic point:
>>>
>>> vidconsole_putc_xy() - does not call video_sync()
>>> vidconsole_newline() - does
>>>
>>> I am simply suggesting that UEFI should do the same thing.
>>
>> I think the better analogy is with
>>
>> vidconsole_puts() - does
>>
>> and that's exactly the function that the UEFI code calls. The UEFI
>> interface is "write this long string to screen". All the UEFI code does
>> is call vidconsole_puts() to do that which then (rightfully) calls
>> video_sync().
>>
>> The reason we flush after every character with grub is grub: Grub abuses
>> the "write long string to screen" function and instead only writes a
>> single character on each call, which then means we flush on every
>> character write.
> There's another reason I discovered empirically as I tried to implement
> cyclic video_sync()s instead of calling it whenever. The writes will go
> through eventually (as the cache is filled by other work?) even if *we*
> don't explicitly flush it. That means partial data gets pushed to the
> display in an uncontrolled way, resulting in bad graphical artifacts.
>
> And I mean very noticeable things like a blocky waterfall effect when
> filling a blue rectangle background in GRUB menu, or half-rendered
> letters in U-Boot console (very obvious if I get it to panic-and-hang).
>
> I think that locks it down, and there's two reasonable things we can do:
>
> - Write and immediately flush to fb (hardware) every time
> - Batch writes in fb, periodically write-and-flush to copy_fb (hardware)
>
> Both can utilize a damage tracking feature to minimize the amount of
> copy/flush done. And maybe we can implement the two simultaneously if we
> skip flushing when damaged region is zero-sized already-flushed.
>
> There's a flaw with the second approach though, EFI can have direct
> access to the hardware copy_fb. When it has directly written to the
> framebuffer, we would need to at least stop overwriting that, and
> ideally copy backwards to the non-hardware fb. Is there some kind of a
> locking API that EFI apps use to get/release the framebuffer? We could
> hook that into something like that.


Edk2 also has a shadow frame buffer that it uses for VGA because 
otherwise the NC read accesses from VRAM would be too expensive. I don't 
believe there's any UEFI locking mechanism, but clear understanding that 
if you want to access the frame buffer while anything else but you could 
potentially access it too, you better use the UEFI APIs instead of 
scribbling on it yourself.


> Note that I've been using "flush" and not "sync" to avoid talking about
> when a driver ops->video_sync() should be called. Is that fundamentally
> incompatible with EFI, can we even call that after e.g. ExitBootServices
> where the OS wants to use it as efifb? Maybe we should always call that
> periodically at 60Hz (16666us) or so?


If you actually need to do something actively frequently, then that 
won't work anymore after ExitBootServices. At that point, all "normal" 
U-Boot code is gone.


> (I'm testing on rk3399-gru-kevin with a 2400x1600 eDP screen by the way,
> and attaching some WIP patches if you want to test. Debian arm64 netinst
> iso uses text-mode GRUB by default, in case you need a payload to test.)
>
>>>>>>> Also I notice that EFI calls notify? all the time, so U-Boot probably
>>>>>>> does have the ability to sync the video every 10ms if we wanted to.
> BTW, with attached cyclic patch on chromebook_kevin, I immediately get a
> warning that it takes too long, at 2-8ms without/with VIDEO_COPY. It's
> about 11ms for both on sandbox on my PC.


I would expect explicit damage flushes like the patch set originally 
does to be a lot more performant than anything dumber, but timer based.


Alex

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
