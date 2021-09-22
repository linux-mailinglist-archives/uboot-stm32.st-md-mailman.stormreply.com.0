Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A3E415091
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:39:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1EABC5A4CD;
	Wed, 22 Sep 2021 19:39:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89CE1C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:39:25 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 091878332C;
 Wed, 22 Sep 2021 21:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632339565;
 bh=65Iyl98ZMw+bGGGyuiYCvVunJnQh+L1B1hwDiDX4MDA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=e2rLROJ5Uw+pCXjm0YtRCXqK0lfuiPO2t0dalA/HAg0zhngznDuI3ta7i/woXlktF
 teHZKbvRcwV6pqf7KLdSc4VUbMKdQEiTcQ581EG4PaC7R9efN6PnyYc9l+doFjHNw/
 wW87P1Ix7P6096EaSnVDEJgilSNzHPXCOXBagejihaB82meP3qxd3qtzM3/9m9X5of
 XYZWOMjS/Iz0WqMtsq4yueNrchZUcNngP2/himGoUXa6I0K9xmS/YaNARGZfuZsvqc
 DNtv/lPbMlbJ9OUMim8Yu+9O9QLJvgLpqYvyFUYltiSXiZqdgULJl4p3ld4Sm16Sz7
 /Y7CmYMALfX8w==
To: Tom Rini <trini@konsulko.com>, =?UTF-8?Q?Marek_Beh=c3=ban?=
 <marek.behun@nic.cz>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad> <20210922192337.GA31748@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <60258ab6-d5ef-4ecd-0dd3-ff8c5b355c14@denx.de>
Date: Wed, 22 Sep 2021 21:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922192337.GA31748@bill-the-cat>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 9/22/21 9:23 PM, Tom Rini wrote:
> On Wed, Sep 22, 2021 at 09:05:36PM +0200, Marek Beh=FAn wrote:
>> On Wed, 22 Sep 2021 20:24:18 +0200
>> Marek Vasut <marex@denx.de> wrote:
>>
>>> On 9/22/21 7:29 PM, Marek Beh=FAn wrote:
>>>> (Adding also Tom.)
>>>>
>>>> Hi Patrick, Marek,
>>>>
>>>> I find this either not complete or not needed:
>>>>
>>>> - either you need mtd names to be of this format so that old MTDPARTS
>>>>     config definitions do not need to be changed, i.e. something like
>>>>       CONFIG_MTDPARTS_DEFAULT=3D"nor0:1M(u-boot),0x1000@0xfff000(env)"
>>>>     does not work currently, and you want to make it work.
>>>>
>>>>     I find your solution here incomplete because MTDPARTS can also be
>>>>     used to be passed to Linux as mtdparts parameter, but there is no
>>>>     guarantee that the "norN" numbering you are creating in U-Boot will
>>>>     be the same as the one in kernel.
>>>>
>>>> - or it is not needed, because you can remove MTDPARTS definition from
>>>>     the board config entirely and move the information into device tre=
e.
>>>>     In fact this was the main idea behind making the series
>>>>       Support SPI NORs and OF partitions in `mtd list`
>>>>     The SPI-NOR MTDs after this series can have conflicting names,
>>>>     because you can still choose between them via OF path with the `mt=
d`
>>>>     command.
>>>>
>>>>     Tom and I were of the opinion that MTDPARTS should be deprecated a=
nd
>>>>     removed in favor of OF. Marek Vasut says that this is not possible
>>>>     for every board, and so needs to stay.
>>>>
>>>> BTW, I find it a little weird for Marek to defend old API which should
>>>> be converted to DT, when in discussion about DM USB / Nokia N900
>>>> USB TTY console [1] he was defending the opinion that we should be
>>>> heading to DT in U-Boot.
>>>>
>>>> [1]
>>>> https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.2558-1=
-pali@kernel.org/
>>>
>>> That USB discussion is completely unrelated to the problem here, the USB
>>> discussion is about internal (i.e. not user facing) conversion to DM/DT.
>>> The user-facing ABI does not change there. Also, that discussion was
>>> about patching USB stack to permit new non-DM/DT operation, not fixing
>>> existing one.
>>
>> This is not only about the user ABI (altough now I agree that you are
>> correct there, see below). What I meant is this:
>>    Should we push for converting to device-tree even if for some boards
>>    it is not possible, and would mean removing them?
>>
>>    Because you are saying that MTDPARTS cannot be converted to DT for
>>    some boards.
>>
>>    But N900 also cannot be reasonably converted because of space
>>    issues, as far as I understood. Yes, it has gigabytes of eMMC storage,
>>    and it was proposed to put SPL in MTD and U-Boot proper into eMMC on
>>    VFAT/ext4, but this simply cannot be done reasonably, because:
>>    - it would break Linux userspace (existing OS upgrade system would
>>      have to be rewritten and backwords compatibility would be broken)
>>    - it would make bootstrapping (booting newer version of U-Boot) while
>>      developing U-Boot a pain in the ass or maybe even impossible
>>    - I beleive there was some other reason Pali mentioned, but I cannot
>>      remember anymore
>>
>>> This problem here is user facing ABI, the mtdparts/mtdids. That user
>>> facing ABI got broken. Boards which do depend on it, even those
>>> currently in tree, are broken. Not all boards can update their
>>> environment, so some backward compatibility of the user facing ABI
>>> should be in place, even though it might not be to the degree Linux
>>> kernel does so. So far, it seems most of the U-Boot command line
>>> interface has managed to retain backward compatibility, I don't see why
>>> this here should be handled any differently.
>>
>> OK, I get that the if `mtd nor0` was working before, it should work also
>> now. But the conversion from MTDPARTS to device tree could be probably
>> done for lots of these, see below.
>>
>>> Note that there are not just a few boards that are broken, but hundreds.
>>> I believe that itself justifies a fix, instead of just throwing all
>>> those hundreds of boards overboard.
>>>
>>> u-boot$ git grep -l CONFIG_MTDIDS configs | wc -l
>>> 203
>>
>> Only 96 of those also grep the substring "nor". But okay, that is still
>> a lot. The question is how many of them could be rewritten to DT:
>>
>>    for cfg in $(git grep -l 'CONFIG_MTDIDS.*nor[0-9]' configs); do
>>      fgrep CONFIG_DEFAULT_DEVICE_TREE "$cfg"
>>    done | wc -l
>>
>> 92 of those 96 have CONFIG_DEFAULT_DEVICE_TREE defined.
>>
>> Of these, 65 contain CONFIG_DM_SPI_FLASH=3Dy, so at least these 65 could
>> be converted. Of the rest 27, how many could also be converted to DM?
>> How may use non-DM drivers?
> =

> I was thinking maybe we have problems with the platforms that "mtdparts
> default", of which we have a handful and most of that handful also do it
> to then make use of the partition table within U-Boot (dfu, or update
> the on-flash U-Boot).  Of those, it might make most sense to poke the
> maintainer directly on how to proceed.

I have a feeling you are talking about a different problem here.

What is broken is U-Boot only look up of MTD device from which to attach =

e.g. UBI or jffs2. That's MTDIDS. There you have that nor0 stuff, see:
cmd/jffs2.c: * mtdids=3Dnor0=3Dedb7312-nor,nand0=3Dedb7312-nand
That is what currently does not work in U-Boot, it has nothing to do =

with Linux.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
