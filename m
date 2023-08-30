Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D720D78D7FD
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 20:28:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8415FC6A61A;
	Wed, 30 Aug 2023 18:28:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED893C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 18:28:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3fee5ddc23eso55670305e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693420084; x=1694024884;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZTcsI22h31MU4Be6ZisQvBazBVrmiKPyOMVuqk8rm4=;
 b=Y54AnbtEUHl1WdwZ38Thoi4qHeexUlOGp0FVvvOUzob0rTnh9cr2xs//WsQzrgHvxg
 0DCA2vGZIfAhdi3PcI4mLSPCImV2eYhfr2lwKCthRCvZ9YOE8799ngo3CmggS/GtdHPV
 yU+x6YWLlZFmNpw+XGNgtuwMUeYXuOKLGgqdqurGDD3sTtyq1npuDsVao2XpbYc1PcuQ
 EXdvcFQK6c/RPCZLZL/70L8dRMP4NVwg/fkz0/nOmpboD9dPWq5bDh8t20BXjEXK7IBj
 5ip2uAiBF9w9bernwOhDLOBoUwpCLLDTWz8aS9kmHpTAv+6UkCWeCBlVFIdkdRZulljn
 eUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693420084; x=1694024884;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KZTcsI22h31MU4Be6ZisQvBazBVrmiKPyOMVuqk8rm4=;
 b=kEL7P0nhZIkJQND9ptQnZrEbglXsiqCaBA9RNxMJDictiFTfJTnavXG7azch5QBx/w
 QeHR9bxrKKekSCtwkXwZtdfIdNFHqoD/QqmBdLFoiEu4b55SzrplBQ1JaPcKk9vYnrH9
 1BTcGEHnVLlbndxEoIpGYwYG/yB0gwtUe2RzH2k32pXUJ6tdcdkmO5DGM39hXBN6ZWxy
 PUtSmX22JHv3dUCiJIAkx++g+0lKQh96sapyl0tVjzTySOC1pgIrxAXXOw8w85sCRZtZ
 ysGXNfBWvcJbPuIoXE6KWk1oNcJLtQFjXYWy2//MzoAcOU5c0cuwqZXkVLDAGByIEb+y
 d1cg==
X-Gm-Message-State: AOJu0YyJUFxLAa7x+DMGFiu5yqaSWstSmQjIhwRAgR9XVcmUXaHVfcSw
 TFnBCZ5S4ZWrVqOV1ufDnUc=
X-Google-Smtp-Source: AGHT+IFSuYOST5iUJbUs81rvYByANomKsaA6gAV/J9BlsESmcbx+nBgc+BVjt1eLZ8ZJVWsibB2uZg==
X-Received: by 2002:adf:f691:0:b0:311:3fdc:109d with SMTP id
 v17-20020adff691000000b003113fdc109dmr2079082wrp.1.1693420083839; 
 Wed, 30 Aug 2023 11:28:03 -0700 (PDT)
Received: from [192.168.0.84] ([178.233.24.1])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b00317a29af4b2sm17360907wrx.68.2023.08.30.11.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 11:28:02 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------epCYzJM0WBvQc5wEX2Y6I00a"
Message-ID: <1703083d-b229-4f41-8e61-1fe0d4618202@gmail.com>
Date: Wed, 30 Aug 2023 21:27:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, tr, en-GB
To: Alexander Graf <agraf@csgraf.de>, Simon Glass <sjg@chromium.org>
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
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <1470fab1-3bc9-4dba-9345-1498d3387202@csgraf.de>
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
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--------------epCYzJM0WBvQc5wEX2Y6I00a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 2023-08-29 09:27 +03:00, Alexander Graf wrote:
> On 29.08.23 00:08, Simon Glass wrote:
>> On Mon, 28 Aug 2023 at 14:24, Alexander Graf <agraf@csgraf.de> wrote:
>>> On 28.08.23 19:54, Simon Glass wrote:
>>>> U-Boot does have video_sync() but it doesn't know when to call it. If
>>>> it does not call it, then any amount of single-threaded code can run
>>>> after that, which may update the framebuffer. In other words, U-Boot
>>>> is in exactly the same boat as UEFI. It has to decide whether to call
>>>> video_sync() based on some sort of heuristic.
>>>>
>>>> That is the only point I am trying to make here. Does that make sense?
>>>
>>> Oh, I thought you mentioned above that U-Boot is in a better spot or
>>> "has it solved already". I agree - it's in the same boat and the only
>>> safe thing it can really do today that is fully cross-platform
>>> compatible is to call video_sync() after every character.
>>>
>>> I don't understand what you mean by "any amount of single-threaded code
>>> can run after that, which may update the framebuffer". Any framebuffer
>>> modification is U-Boot internal code which then again can apply
>>> video_sync() to tell the system "I want what I wrote to screen actually
>>> be on screen now". I don't think that's necessarily bad design. A bit
>>> clunky, but we're in a pre-boot environment after all.
>>>
>>> Since we're aligned now: What exactly did you refer to with "but we have
>>> managed to work out something"?
>>>> So now we are on the same page about that point. The next step is my
>> heuristic point:
>>
>> vidconsole_putc_xy() - does not call video_sync()
>> vidconsole_newline() - does
>>
>> I am simply suggesting that UEFI should do the same thing.
> 
> 
> I think the better analogy is with
> 
> vidconsole_puts() - does
> 
> and that's exactly the function that the UEFI code calls. The UEFI 
> interface is "write this long string to screen". All the UEFI code does 
> is call vidconsole_puts() to do that which then (rightfully) calls 
> video_sync().
> 
> The reason we flush after every character with grub is grub: Grub abuses 
> the "write long string to screen" function and instead only writes a 
> single character on each call, which then means we flush on every 
> character write.

There's another reason I discovered empirically as I tried to implement
cyclic video_sync()s instead of calling it whenever. The writes will go
through eventually (as the cache is filled by other work?) even if *we*
don't explicitly flush it. That means partial data gets pushed to the
display in an uncontrolled way, resulting in bad graphical artifacts.

And I mean very noticeable things like a blocky waterfall effect when
filling a blue rectangle background in GRUB menu, or half-rendered
letters in U-Boot console (very obvious if I get it to panic-and-hang).

I think that locks it down, and there's two reasonable things we can do:

- Write and immediately flush to fb (hardware) every time
- Batch writes in fb, periodically write-and-flush to copy_fb (hardware)

Both can utilize a damage tracking feature to minimize the amount of
copy/flush done. And maybe we can implement the two simultaneously if we
skip flushing when damaged region is zero-sized already-flushed.

There's a flaw with the second approach though, EFI can have direct
access to the hardware copy_fb. When it has directly written to the
framebuffer, we would need to at least stop overwriting that, and
ideally copy backwards to the non-hardware fb. Is there some kind of a
locking API that EFI apps use to get/release the framebuffer? We could
hook that into something like that.

Note that I've been using "flush" and not "sync" to avoid talking about
when a driver ops->video_sync() should be called. Is that fundamentally
incompatible with EFI, can we even call that after e.g. ExitBootServices
where the OS wants to use it as efifb? Maybe we should always call that
periodically at 60Hz (16666us) or so?

(I'm testing on rk3399-gru-kevin with a 2400x1600 eDP screen by the way,
and attaching some WIP patches if you want to test. Debian arm64 netinst
iso uses text-mode GRUB by default, in case you need a payload to test.)

>>>>>> Also I notice that EFI calls notify? all the time, so U-Boot probably
>>>>>> does have the ability to sync the video every 10ms if we wanted to.

BTW, with attached cyclic patch on chromebook_kevin, I immediately get a
warning that it takes too long, at 2-8ms without/with VIDEO_COPY. It's
about 11ms for both on sandbox on my PC.

>>>>> I fail to see how invalidating the frame buffer for the screen every
>>>>> 10ms is any better than doing flush+invalidate operations only on screen
>>>>> areas that changed? It's more fragile, more difficult to understand and
>>>>> also significantly more expensive given that most of the time very
>>>>> little on the screen actually changes.
>>>>>>>> I am not suggesting it is better, at all. I am just trying to explain
>>>> that the U-Boot EFI implementation should not be calling video_sync()
>>>> after every character, before or after this series.
>>>
>>> Ah, it doesn't :). It just calls the normal U-Boot "write character on
>>> screen" function. What that does is up to U-Boot internals - and those
>>> basically today dictate that something needs to call video_sync() to
>>> make FB modifications actually pop up on screen.
>>>
>> Hmmm, so what function is it calling, then?  I think we are getting
>> closer to the 'fix' I am trying to tease out.
> 
> It literally calls vidconsole_puts():
> 
> https://github.com/u-boot/u-boot/blob/master/lib/efi_loader/efi_console.c#L185

I'd think "sync after a whole string is printed" is an OK heuristic, and
GRUB is abusing it... But maybe GRUB is doing these things as an ad-hoc
double buffering implementation with forced syncs at the expense of
performance to avoid buggy firmware causing graphical artifacts.

In any case, apologies but I'll be unable to work on U-Boot things until
late September, may also be unable to respond. (Going to DebConf soon)
--------------epCYzJM0WBvQc5wEX2Y6I00a
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-video-Replace-all-video_sync-calls-with-a-cyclic.patch"
Content-Disposition: attachment;
 filename*0="0001-video-Replace-all-video_sync-calls-with-a-cyclic.patch"
Content-Transfer-Encoding: base64

RnJvbSA1MTQ0ZTk0NzljNmIzMWNhYzMzZTk4YjVhZTAwYTZkMTAzZjE5NDYyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbHBlciBOZWJpIFlhc2FrIDxhbHBlcm5lYml5YXNh
a0BnbWFpbC5jb20+CkRhdGU6IFR1ZSwgMjIgQXVnIDIwMjMgMTg6MDU6MjkgKzAzMDAKU3Vi
amVjdDogW1BBVENIXSBXSVA6IHZpZGVvOiBSZXBsYWNlIGFsbCB2aWRlb19zeW5jIGNhbGxz
IHdpdGggYSBjeWNsaWMKIGZ1bmN0aW9uCgotLS0KIGJvb3QvZXhwby5jICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyIC0tCiBjbWQvdmlkZW8uYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiAtLQogZHJpdmVycy9zZXJpYWwvc2FuZGJveC5jICAgICAgICAgIHwgIDIgLS0KIGRy
aXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvdmlkZW8v
dmlkY29uc29sZS11Y2xhc3MuYyB8IDM1ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIGRyaXZlcnMvdmlkZW8vdmlkZW8tdWNsYXNzLmMgICAgICB8IDI4ICsrKysrKysrKysr
KysrKysrKysrKysrKy0KIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgICAgICAgICB8ICAy
ICstCiBpbmNsdWRlL3ZpZGVvLmggICAgICAgICAgICAgICAgICAgfCAgMiArKwogbGliL2Vm
aV9sb2FkZXIvZWZpX2dvcC5jICAgICAgICAgIHwgIDIgLS0KIDkgZmlsZXMgY2hhbmdlZCwg
MzQgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9l
eHBvLmMgYi9ib290L2V4cG8uYwppbmRleCAxMzlkNjg0ZjhlNmUuLjAzZTg1OGMwM2M4MCAx
MDA2NDQKLS0tIGEvYm9vdC9leHBvLmMKKysrIGIvYm9vdC9leHBvLmMKQEAgLTIwOCw4ICsy
MDgsNiBAQCBpbnQgZXhwb19yZW5kZXIoc3RydWN0IGV4cG8gKmV4cCkKIAkJCXJldHVybiBs
b2dfbXNnX3JldCgicmVuIiwgcmV0KTsKIAl9CiAKLQl2aWRlb19zeW5jKGRldiwgdHJ1ZSk7
Ci0KIAlyZXR1cm4gc2NuID8gMCA6IC1FQ0hJTEQ7CiB9CiAKZGlmZiAtLWdpdCBhL2NtZC92
aWRlby5jIGIvY21kL3ZpZGVvLmMKaW5kZXggOTQyZjgxYzE2MzM2Li45OGRlMmM5ZjFiOGQg
MTAwNjQ0Ci0tLSBhL2NtZC92aWRlby5jCisrKyBiL2NtZC92aWRlby5jCkBAIC00Miw4ICs0
Miw2IEBAIHN0YXRpYyBpbnQgZG9fdmlkZW9fcHV0cyhzdHJ1Y3QgY21kX3RibCAqY21kdHAs
IGludCBmbGFnLCBpbnQgYXJnYywKIAlpZiAodWNsYXNzX2ZpcnN0X2RldmljZV9lcnIoVUNM
QVNTX1ZJREVPX0NPTlNPTEUsICZkZXYpKQogCQlyZXR1cm4gQ01EX1JFVF9GQUlMVVJFOwog
CXJldCA9IHZpZGNvbnNvbGVfcHV0X3N0cmluZyhkZXYsIGFyZ3ZbMV0pOwotCWlmICghcmV0
KQotCQlyZXQgPSB2aWRlb19zeW5jKGRldi0+cGFyZW50LCBmYWxzZSk7CiAKIAlyZXR1cm4g
cmV0ID8gQ01EX1JFVF9GQUlMVVJFIDogMDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2Vy
aWFsL3NhbmRib3guYyBiL2RyaXZlcnMvc2VyaWFsL3NhbmRib3guYwppbmRleCBmNDAwMzgx
MWVlNzUuLjU4NmUxMTU0YTMyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zZXJpYWwvc2FuZGJv
eC5jCisrKyBiL2RyaXZlcnMvc2VyaWFsL3NhbmRib3guYwpAQCAtMTM5LDggKzEzOSw2IEBA
IHN0YXRpYyBpbnQgc2FuZGJveF9zZXJpYWxfcGVuZGluZyhzdHJ1Y3QgdWRldmljZSAqZGV2
LCBib29sIGlucHV0KQogCQlyZXR1cm4gMDsKIAogCW9zX3VzbGVlcCgxMDApOwotCWlmIChJ
U19FTkFCTEVEKENPTkZJR19WSURFTykgJiYgIUlTX0VOQUJMRUQoQ09ORklHX1NQTF9CVUlM
RCkpCi0JCXZpZGVvX3N5bmNfYWxsKCk7CiAJYXZhaWwgPSBtZW1idWZmX3B1dHJhdygmcHJp
di0+YnVmLCAxMDAsIGZhbHNlLCAmZGF0YSk7CiAJaWYgKCFhdmFpbCkKIAkJcmV0dXJuIDE7
CS8qIGJ1ZmZlciBmdWxsICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL0tjb25maWcg
Yi9kcml2ZXJzL3ZpZGVvL0tjb25maWcKaW5kZXggMDlmMmNiMWE3MzIxLi41MzA0ODUxMDJj
NzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vS2NvbmZpZworKysgYi9kcml2ZXJzL3Zp
ZGVvL0tjb25maWcKQEAgLTcsNiArNyw3IEBAIG1lbnUgIkdyYXBoaWNzIHN1cHBvcnQiCiBj
b25maWcgVklERU8KIAlib29sICJFbmFibGUgZHJpdmVyIG1vZGVsIHN1cHBvcnQgZm9yIExD
RC92aWRlbyIKIAlkZXBlbmRzIG9uIERNCisJc2VsZWN0IENZQ0xJQwogCWhlbHAKIAkgIFRo
aXMgZW5hYmxlcyBkcml2ZXIgbW9kZWwgZm9yIExDRCBhbmQgdmlkZW8gZGV2aWNlcy4gVGhl
c2Ugc3VwcG9ydAogCSAgYSBiaXRtYXAgZGlzcGxheSBvZiB2YXJpb3VzIHNpemVzIGFuZCBk
ZXB0aHMgd2hpY2ggY2FuIGJlIGRyYXduIG9uCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L3ZpZGNvbnNvbGUtdWNsYXNzLmMgYi9kcml2ZXJzL3ZpZGVvL3ZpZGNvbnNvbGUtdWNsYXNz
LmMKaW5kZXggYjViM2I2NjI1OTAyLi44NzZlODBmOWViZTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vdmlkY29uc29sZS11Y2xhc3MuYworKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGNv
bnNvbGUtdWNsYXNzLmMKQEAgLTc3LDcgKzc3LDcgQEAgc3RhdGljIGludCB2aWRjb25zb2xl
X2JhY2soc3RydWN0IHVkZXZpY2UgKmRldikKIAkJaWYgKHByaXYtPnljdXIgPCAwKQogCQkJ
cHJpdi0+eWN1ciA9IDA7CiAJfQotCXJldHVybiB2aWRlb19zeW5jKGRldi0+cGFyZW50LCBm
YWxzZSk7CisJcmV0dXJuIDA7CiB9CiAKIC8qIE1vdmUgdG8gYSBuZXdsaW5lLCBzY3JvbGxp
bmcgdGhlIGRpc3BsYXkgaWYgbmVjZXNzYXJ5ICovCkBAIC04Nyw3ICs4Nyw3IEBAIHN0YXRp
YyB2b2lkIHZpZGNvbnNvbGVfbmV3bGluZShzdHJ1Y3QgdWRldmljZSAqZGV2KQogCXN0cnVj
dCB1ZGV2aWNlICp2aWRfZGV2ID0gZGV2LT5wYXJlbnQ7CiAJc3RydWN0IHZpZGVvX3ByaXYg
KnZpZF9wcml2ID0gZGV2X2dldF91Y2xhc3NfcHJpdih2aWRfZGV2KTsKIAljb25zdCBpbnQg
cm93cyA9IENPTkZJR19WQUwoQ09OU09MRV9TQ1JPTExfTElORVMpOwotCWludCBpLCByZXQ7
CisJaW50IGk7CiAKIAlwcml2LT54Y3VyX2ZyYWMgPSBwcml2LT54c3RhcnRfZnJhYzsKIAlw
cml2LT55Y3VyICs9IHByaXYtPnlfY2hhcnNpemU7CkBAIC0xMDEsMTMgKzEwMSw2IEBAIHN0
YXRpYyB2b2lkIHZpZGNvbnNvbGVfbmV3bGluZShzdHJ1Y3QgdWRldmljZSAqZGV2KQogCQlw
cml2LT55Y3VyIC09IHJvd3MgKiBwcml2LT55X2NoYXJzaXplOwogCX0KIAlwcml2LT5sYXN0
X2NoID0gMDsKLQotCXJldCA9IHZpZGVvX3N5bmMoZGV2LT5wYXJlbnQsIGZhbHNlKTsKLQlp
ZiAocmV0KSB7Ci0jaWZkZWYgREVCVUcKLQkJY29uc29sZV9wdXRzX3NlbGVjdF9zdGRlcnIo
dHJ1ZSwgIlt2YyBlcnI6IHZpZGVvX3N5bmNdIik7Ci0jZW5kaWYKLQl9CiB9CiAKIHN0YXRp
YyBjaGFyICpwYXJzZW51bShjaGFyICpzLCBpbnQgKm51bSkKQEAgLTI5OCwxNSArMjkxLDcg
QEAgc3RhdGljIHZvaWQgdmlkY29uc29sZV9lc2NhcGVfY2hhcihzdHJ1Y3QgdWRldmljZSAq
ZGV2LCBjaGFyIGNoKQogCQlwYXJzZW51bShwcml2LT5lc2NhcGVfYnVmICsgMSwgJm1vZGUp
OwogCiAJCWlmIChtb2RlID09IDIpIHsKLQkJCWludCByZXQ7Ci0KIAkJCXZpZGVvX2NsZWFy
KGRldi0+cGFyZW50KTsKLQkJCXJldCA9IHZpZGVvX3N5bmMoZGV2LT5wYXJlbnQsIGZhbHNl
KTsKLQkJCWlmIChyZXQpIHsKLSNpZmRlZiBERUJVRwotCQkJCWNvbnNvbGVfcHV0c19zZWxl
Y3Rfc3RkZXJyKHRydWUsICJbdmMgZXJyOiB2aWRlb19zeW5jXSIpOwotI2VuZGlmCi0JCQl9
CiAJCQlwcml2LT55Y3VyID0gMDsKIAkJCXByaXYtPnhjdXJfZnJhYyA9IHByaXYtPnhzdGFy
dF9mcmFjOwogCQl9IGVsc2UgewpAQCAtNTIwLDEyICs1MDUsNiBAQCBzdGF0aWMgdm9pZCB2
aWRjb25zb2xlX3B1dGMoc3RydWN0IHN0ZGlvX2RldiAqc2RldiwgY29uc3QgY2hhciBjaCkK
IAlpZiAocmV0KSB7CiAjaWZkZWYgREVCVUcKIAkJY29uc29sZV9wdXRzX3NlbGVjdF9zdGRl
cnIodHJ1ZSwgIlt2YyBlcnI6IHB1dGNdIik7Ci0jZW5kaWYKLQl9Ci0JcmV0ID0gdmlkZW9f
c3luYyhkZXYtPnBhcmVudCwgZmFsc2UpOwotCWlmIChyZXQpIHsKLSNpZmRlZiBERUJVRwot
CQljb25zb2xlX3B1dHNfc2VsZWN0X3N0ZGVycih0cnVlLCAiW3ZjIGVycjogdmlkZW9fc3lu
Y10iKTsKICNlbmRpZgogCX0KIH0KQEAgLTU0MiwxMiArNTIxLDYgQEAgc3RhdGljIHZvaWQg
dmlkY29uc29sZV9wdXRzKHN0cnVjdCBzdGRpb19kZXYgKnNkZXYsIGNvbnN0IGNoYXIgKnMp
CiAKIAkJc25wcmludGYoc3RyLCBzaXplb2Yoc3RyKSwgIlt2YyBlcnI6IHB1dHMgJWRdIiwg
cmV0KTsKIAkJY29uc29sZV9wdXRzX3NlbGVjdF9zdGRlcnIodHJ1ZSwgc3RyKTsKLSNlbmRp
ZgotCX0KLQlyZXQgPSB2aWRlb19zeW5jKGRldi0+cGFyZW50LCBmYWxzZSk7Ci0JaWYgKHJl
dCkgewotI2lmZGVmIERFQlVHCi0JCWNvbnNvbGVfcHV0c19zZWxlY3Rfc3RkZXJyKHRydWUs
ICJbdmMgZXJyOiB2aWRlb19zeW5jXSIpOwogI2VuZGlmCiAJfQogfQpAQCAtNjg1LDkgKzY1
OCw3IEBAIFVDTEFTU19EUklWRVIodmlkY29uc29sZSkgPSB7CiAjaWZkZWYgQ09ORklHX1ZJ
REVPX0NPUFkKIGludCB2aWRjb25zb2xlX3N5bmNfY29weShzdHJ1Y3QgdWRldmljZSAqZGV2
LCB2b2lkICpmcm9tLCB2b2lkICp0bykKIHsKLQlzdHJ1Y3QgdWRldmljZSAqdmlkID0gZGV2
X2dldF9wYXJlbnQoZGV2KTsKLQotCXJldHVybiB2aWRlb19zeW5jX2NvcHkodmlkLCBmcm9t
LCB0byk7CisJcmV0dXJuIDA7CiB9CiAKIGludCB2aWRjb25zb2xlX21lbW1vdmUoc3RydWN0
IHVkZXZpY2UgKmRldiwgdm9pZCAqZHN0LCBjb25zdCB2b2lkICpzcmMsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL3ZpZGVvLXVjbGFzcy5jIGIvZHJpdmVycy92aWRlby92aWRlby11
Y2xhc3MuYwppbmRleCBmNzQzZWQ3NGM4MTguLjA5OWJhNWFjYWE5YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aWRlby92aWRlby11Y2xhc3MuYworKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVv
LXVjbGFzcy5jCkBAIC02LDYgKzYsNyBAQAogI2RlZmluZSBMT0dfQ0FURUdPUlkgVUNMQVNT
X1ZJREVPCiAKICNpbmNsdWRlIDxjb21tb24uaD4KKyNpbmNsdWRlIDxjeWNsaWMuaD4KICNp
bmNsdWRlIDxibG9ibGlzdC5oPgogI2luY2x1ZGUgPGNvbnNvbGUuaD4KICNpbmNsdWRlIDxj
cHVfZnVuYy5oPgpAQCAtMjQ5LDcgKzI1MCw3IEBAIGludCB2aWRlb19maWxsKHN0cnVjdCB1
ZGV2aWNlICpkZXYsIHUzMiBjb2xvdXIpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
CXJldHVybiB2aWRlb19zeW5jKGRldiwgZmFsc2UpOworCXJldHVybiAwOwogfQogCiBpbnQg
dmlkZW9fY2xlYXIoc3RydWN0IHVkZXZpY2UgKmRldikKQEAgLTM1MSw2ICszNTIsMjQgQEAg
dm9pZCB2aWRlb19zZXRfZGVmYXVsdF9jb2xvcnMoc3RydWN0IHVkZXZpY2UgKmRldiwgYm9v
bCBpbnZlcnQpCiAJcHJpdi0+Y29sb3VyX2JnID0gdmlkZW9faW5kZXhfdG9fY29sb3VyKHBy
aXYsIGJhY2spOwogfQogCitzdGF0aWMgdm9pZCB2aWRlb19jeWNsaWModm9pZCAqY3R4KQor
eworCXN0cnVjdCB1ZGV2aWNlICpkZXYgPSBjdHg7CisJaW50IHJldDsKKworCWlmICghZGV2
aWNlX2FjdGl2ZShkZXYpKQorCQlyZXR1cm47CisKKwl2aWRlb19zeW5jX2NvcHlfYWxsKGRl
dik7CisKKwlyZXQgPSB2aWRlb19zeW5jKGRldiwgdHJ1ZSk7CisJaWYgKHJldCkgeworI2lm
ZGVmIERFQlVHCisJCWNvbnNvbGVfcHV0c19zZWxlY3Rfc3RkZXJyKHRydWUsICJbdmMgZXJy
OiB2aWRlb19zeW5jXSIpOworI2VuZGlmCisJfQorfQorCiAvKiBGbHVzaCB2aWRlbyBhY3Rp
dml0eSB0byB0aGUgY2FjaGVzICovCiBpbnQgdmlkZW9fc3luYyhzdHJ1Y3QgdWRldmljZSAq
dmlkLCBib29sIGZvcmNlKQogewpAQCAtNjAzLDYgKzYyMiwxMyBAQCBzdGF0aWMgaW50IHZp
ZGVvX3Bvc3RfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKIAkJfQogCX0KIAorCS8qIFJl
Z2lzdGVyIHZpZGVvIHN5bmMgYXMgYSBjeWNsaWMgZnVuY3Rpb24gYXQgNjBIeiAqLworCXBy
aXYtPmN5Y2xpYyA9IGN5Y2xpY19yZWdpc3Rlcih2aWRlb19jeWNsaWMsIDE2NjY2LCBkZXYt
Pm5hbWUsIGRldik7CisJaWYgKCFwcml2LT5jeWNsaWMpIHsKKwkJbG9nX2VycigiY3ljbGlj
X3JlZ2lzdGVyIGZvciAlcyB2aWRlbyBzeW5jIGZhaWxlZFxuIiwgZGV2LT5uYW1lKTsKKwkJ
cmV0dXJuIC1FTk9ERVY7CisJfQorCiAJcmV0dXJuIDA7CiB9OwogCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYwpp
bmRleCA0NWYwMDNjODI1MWEuLjkwYTBlNGU5OGIxMSAxMDA2NDQKLS0tIGEvZHJpdmVycy92
aWRlby92aWRlb19ibXAuYworKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCkBAIC00
NjYsNSArNDY2LDUgQEAgaW50IHZpZGVvX2JtcF9kaXNwbGF5KHN0cnVjdCB1ZGV2aWNlICpk
ZXYsIHVsb25nIGJtcF9pbWFnZSwgaW50IHgsIGludCB5LAogCWlmIChyZXQpCiAJCXJldHVy
biBsb2dfcmV0KHJldCk7CiAKLQlyZXR1cm4gdmlkZW9fc3luYyhkZXYsIGZhbHNlKTsKKwly
ZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdmlkZW8uaCBiL2luY2x1ZGUvdmlk
ZW8uaAppbmRleCA2NmQxMDljYTVkYTYuLjMxYWE4ZGYxNzFmYSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS92aWRlby5oCisrKyBiL2luY2x1ZGUvdmlkZW8uaApAQCAtOCw2ICs4LDcgQEAKICNk
ZWZpbmUgX1ZJREVPX0hfCiAKICNpbmNsdWRlIDxzdGRpb19kZXYuaD4KKyNpbmNsdWRlIDxj
eWNsaWMuaD4KIAogc3RydWN0IHVkZXZpY2U7CiAKQEAgLTExOCw2ICsxMTksNyBAQCBzdHJ1
Y3QgdmlkZW9fcHJpdiB7CiAJYm9vbCBmbHVzaF9kY2FjaGU7CiAJdTggZmdfY29sX2lkeDsK
IAl1OCBiZ19jb2xfaWR4OworCXN0cnVjdCBjeWNsaWNfaW5mbyAqY3ljbGljOwogfTsKIAog
LyoqCmRpZmYgLS1naXQgYS9saWIvZWZpX2xvYWRlci9lZmlfZ29wLmMgYi9saWIvZWZpX2xv
YWRlci9lZmlfZ29wLmMKaW5kZXggNzc4YjY5M2Y5ODNhLi41NmNhMDQ4MmQ4NzEgMTAwNjQ0
Ci0tLSBhL2xpYi9lZmlfbG9hZGVyL2VmaV9nb3AuYworKysgYi9saWIvZWZpX2xvYWRlci9l
ZmlfZ29wLmMKQEAgLTQ1MSw4ICs0NTEsNiBAQCBzdGF0aWMgZWZpX3N0YXR1c190IEVGSUFQ
SSBnb3BfYmx0KHN0cnVjdCBlZmlfZ29wICp0aGlzLAogCWlmIChyZXQgIT0gRUZJX1NVQ0NF
U1MpCiAJCXJldHVybiBFRklfRVhJVChyZXQpOwogCi0JdmlkZW9fc3luY19hbGwoKTsKLQog
CXJldHVybiBFRklfRVhJVChFRklfU1VDQ0VTUyk7CiB9CiAKLS0gCjIuNDAuMQoK
--------------epCYzJM0WBvQc5wEX2Y6I00a
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-video-rockchip-Implement-copy-framebuffer-suppor.patch"
Content-Disposition: attachment;
 filename*0="0002-video-rockchip-Implement-copy-framebuffer-suppor.patch"
Content-Transfer-Encoding: base64

RnJvbSA4Nzc3MWNmNzY1ZTZjYjEwOTZkNjQ4N2U0ZGNjM2M2OTcyZGYwYzhlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbHBlciBOZWJpIFlhc2FrIDxhbHBlcm5lYml5YXNh
a0BnbWFpbC5jb20+CkRhdGU6IEZyaSwgMjUgQXVnIDIwMjMgMjE6Mjk6NTIgKzAzMDAKU3Vi
amVjdDogW1BBVENIXSBXSVA6IHZpZGVvOiByb2NrY2hpcDogSW1wbGVtZW50IGNvcHkgZnJh
bWVidWZmZXIgc3VwcG9ydAoKLS0tCiBjb25maWdzL2Nocm9tZWJvb2tfa2V2aW5fZGVmY29u
ZmlnIHwgIDMgKy0tCiBkcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL3JrX3ZvcC5jICAgIHwgMTEg
KysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9jb25maWdzL2Nocm9tZWJvb2tfa2V2aW5fZGVmY29u
ZmlnIGIvY29uZmlncy9jaHJvbWVib29rX2tldmluX2RlZmNvbmZpZwppbmRleCA2Y2U2OWY0
MTllMTcuLjBiYWE3M2NjNjJkYiAxMDA2NDQKLS0tIGEvY29uZmlncy9jaHJvbWVib29rX2tl
dmluX2RlZmNvbmZpZworKysgYi9jb25maWdzL2Nocm9tZWJvb2tfa2V2aW5fZGVmY29uZmln
CkBAIC01LDggKzUsNiBAQCBDT05GSUdfQVJDSF9ST0NLQ0hJUD15CiBDT05GSUdfVEVYVF9C
QVNFPTB4MDAyMDAwMDAKIENPTkZJR19TUExfR1BJTz15CiBDT05GSUdfTlJfRFJBTV9CQU5L
Uz0xCi1DT05GSUdfSEFTX0NVU1RPTV9TWVNfSU5JVF9TUF9BRERSPXkKLUNPTkZJR19DVVNU
T01fU1lTX0lOSVRfU1BfQUREUj0weDMwMDAwMAogQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQ9
MjAwMDAwMDAKIENPTkZJR19FTlZfU0laRT0weDgwMDAKIENPTkZJR19ERUZBVUxUX0RFVklD
RV9UUkVFPSJyazMzOTktZ3J1LWtldmluIgpAQCAtMTI5LDYgKzEyNyw3IEBAIENPTkZJR19V
U0JfRVRIRVJfU01TQzk1WFg9eQogQ09ORklHX1ZJREVPPXkKICMgQ09ORklHX1ZJREVPX0ZP
TlRfOFgxNiBpcyBub3Qgc2V0CiBDT05GSUdfVklERU9fRk9OVF8xNlgzMj15CitDT05GSUdf
VklERU9fQ09QWT15CiBDT05GSUdfRElTUExBWT15CiBDT05GSUdfVklERU9fUk9DS0NISVA9
eQogQ09ORklHX1ZJREVPX1JPQ0tDSElQX01BWF9YUkVTPTI0MDAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vcm9ja2NoaXAvcmtfdm9wLmMgYi9kcml2ZXJzL3ZpZGVvL3JvY2tjaGlw
L3JrX3ZvcC5jCmluZGV4IGM1MTRlMmEwZTQ0OS4uZTcwNjg5ODUxYTYxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL3JrX3ZvcC5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
cm9ja2NoaXAvcmtfdm9wLmMKQEAgLTQ2NCwxMCArNDY0LDE2IEBAIGludCBya192b3BfcHJv
YmUoc3RydWN0IHVkZXZpY2UgKmRldikKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJaWYg
KElTX0VOQUJMRUQoQ09ORklHX1ZJREVPX0NPUFkpKQorCQlwbGF0LT5jb3B5X2Jhc2UgPSBw
bGF0LT5iYXNlICsgcGxhdC0+c2l6ZSAvIDI7CisKIAlmb3IgKG5vZGUgPSBvZm5vZGVfZmly
c3Rfc3Vibm9kZShwb3J0KTsKIAkgICAgIG9mbm9kZV92YWxpZChub2RlKTsKIAkgICAgIG5v
ZGUgPSBkZXZfcmVhZF9uZXh0X3N1Ym5vZGUobm9kZSkpIHsKLQkJcmV0ID0gcmtfZGlzcGxh
eV9pbml0KGRldiwgcGxhdC0+YmFzZSwgbm9kZSk7CisJCWlmIChJU19FTkFCTEVEKENPTkZJ
R19WSURFT19DT1BZKSkKKwkJCXJldCA9IHJrX2Rpc3BsYXlfaW5pdChkZXYsIHBsYXQtPmNv
cHlfYmFzZSwgbm9kZSk7CisJCWVsc2UKKwkJCXJldCA9IHJrX2Rpc3BsYXlfaW5pdChkZXYs
IHBsYXQtPmJhc2UsIG5vZGUpOwogCQlpZiAocmV0KQogCQkJZGVidWcoIkRldmljZSBmYWls
ZWQ6IHJldD0lZFxuIiwgcmV0KTsKIAkJaWYgKCFyZXQpCkBAIC00ODUsNSArNDkxLDggQEAg
aW50IHJrX3ZvcF9iaW5kKHN0cnVjdCB1ZGV2aWNlICpkZXYpCiAJcGxhdC0+c2l6ZSA9IDQg
KiAoQ09ORklHX1ZJREVPX1JPQ0tDSElQX01BWF9YUkVTICoKIAkJCSAgQ09ORklHX1ZJREVP
X1JPQ0tDSElQX01BWF9ZUkVTKTsKIAorCWlmIChJU19FTkFCTEVEKENPTkZJR19WSURFT19D
T1BZKSkKKwkJcGxhdC0+c2l6ZSAqPSAyOworCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjQwLjEK
Cg==

--------------epCYzJM0WBvQc5wEX2Y6I00a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--------------epCYzJM0WBvQc5wEX2Y6I00a--
