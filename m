Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37D415089
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:36:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA9F2C5A4CD;
	Wed, 22 Sep 2021 19:36:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 855B6C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:36:45 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 835418326F;
 Wed, 22 Sep 2021 21:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632339404;
 bh=SyZqTBGfBo/DO/juVdK4ubZu3fkT7KpIX8CyfH8Qdpo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TZZ0lvIl29ufBtzANEk+QgaM2bMFwnPix2nnJ9hGsM1lCFZiDy9BPdHCJybR30UaN
 BwNO4GdR+IzUP2sVrPttM1meAHWHaY788IHFJcbUiF3/zYdUxJ90aG0uFYZQ2Dj1o+
 j2P+wwVmNRo2W9yMlSE1mPRFgRxtVi8WbMR5wXlzj4OTbMgin+kXtDFSPJwbQk1dRu
 wLH7yTcges1PrUYO54taflus7YM9o/frURft806FVyMbRsSS56w/yFaAarptU1oY2F
 HX1eZolKCtNZ8jq08liyDxLTau5vhbZ9JbQ0oSPFbXZ0F67xiIurpqFU1FwWIlJggW
 YByJFVJCoiamw==
To: Tom Rini <trini@konsulko.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922184230.GN8579@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <9ba7c762-c889-bf63-8b13-45c37c7bcbd8@denx.de>
Date: Wed, 22 Sep 2021 21:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210922184230.GN8579@bill-the-cat>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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

On 9/22/21 8:42 PM, Tom Rini wrote:
> On Wed, Sep 22, 2021 at 08:24:18PM +0200, Marek Vasut wrote:
>> On 9/22/21 7:29 PM, Marek Beh=FAn wrote:
>>> (Adding also Tom.)
>>>
>>> Hi Patrick, Marek,
>>>
>>> I find this either not complete or not needed:
>>>
>>> - either you need mtd names to be of this format so that old MTDPARTS
>>>     config definitions do not need to be changed, i.e. something like
>>>       CONFIG_MTDPARTS_DEFAULT=3D"nor0:1M(u-boot),0x1000@0xfff000(env)"
>>>     does not work currently, and you want to make it work.
>>>
>>>     I find your solution here incomplete because MTDPARTS can also be
>>>     used to be passed to Linux as mtdparts parameter, but there is no
>>>     guarantee that the "norN" numbering you are creating in U-Boot will
>>>     be the same as the one in kernel.
>>>
>>> - or it is not needed, because you can remove MTDPARTS definition from
>>>     the board config entirely and move the information into device tree.
>>>     In fact this was the main idea behind making the series
>>>       Support SPI NORs and OF partitions in `mtd list`
>>>     The SPI-NOR MTDs after this series can have conflicting names,
>>>     because you can still choose between them via OF path with the `mtd`
>>>     command.
>>>
>>>     Tom and I were of the opinion that MTDPARTS should be deprecated and
>>>     removed in favor of OF. Marek Vasut says that this is not possible
>>>     for every board, and so needs to stay.
>>>
>>> BTW, I find it a little weird for Marek to defend old API which should
>>> be converted to DT, when in discussion about DM USB / Nokia N900
>>> USB TTY console [1] he was defending the opinion that we should be
>>> heading to DT in U-Boot.
>>>
>>> [1]
>>> https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.2558-1-=
pali@kernel.org/
>>
>> That USB discussion is completely unrelated to the problem here, the USB
>> discussion is about internal (i.e. not user facing) conversion to DM/DT.=
 The
>> user-facing ABI does not change there. Also, that discussion was about
>> patching USB stack to permit new non-DM/DT operation, not fixing existing
>> one.
>>
>> This problem here is user facing ABI, the mtdparts/mtdids. That user fac=
ing
>> ABI got broken. Boards which do depend on it, even those currently in tr=
ee,
>> are broken. Not all boards can update their environment, so some backward
>> compatibility of the user facing ABI should be in place, even though it
>> might not be to the degree Linux kernel does so. So far, it seems most of
>> the U-Boot command line interface has managed to retain backward
>> compatibility, I don't see why this here should be handled any different=
ly.
>>
>> Note that there are not just a few boards that are broken, but hundreds.=
 I
>> believe that itself justifies a fix, instead of just throwing all those
>> hundreds of boards overboard.
>>
>> u-boot$ git grep -l CONFIG_MTDIDS configs | wc -l
>> 203
>>
>> Hopefully that clarifies the difference.
> =

> It doesn't quite, sorry.  If you have "mtdparts=3D... mtdids=3D..." in yo=
ur
> cmdline that you pass to Linux, U-Boot doesn't care.

The MTDIDS is used by UBI code in U-Boot to locate from which MTD device =

to attach UBI. That is currently broken at least for UBI on SPI NOR or =

parallel NOR. This has nothing to do with passing mtdparts/mtdids to Linux.

> That's one of the
> main users of CONFIG_MTDIDS/MTDPARTS today, which could in some good
> number of cases be removed (take am335x_evm_defconfig for example, the
> table has been defined in the upstream DT for forever).  Taking a look
> at:
> commit 938db6fe5da3581ed2c17d64c7e016a7a8df5237
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
> Date:   Sat Sep 29 12:58:30 2018 +0200
> =

>      cmd: mtdparts: describe as legacy
>      =

>      The 'mtdparts' command is not needed anymore. While the environment
>      variable is still valid (and useful, along with the 'mtdids' one), t=
he
>      command has been replaced by 'mtd' which is much more close to the M=
TD
>      stack and do not add its own specific glue.
>      =

>      Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>      Reviewed-by: Stefan Roese <sr@denx.de>
>      Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> =

> Is when "mtdparts" in U-Boot was noted as legacy.  So what exactly are
> we fixing with this series?  Nothing changed about hard-coded values
> being passed along.  What may have broken was some progmatic way to set
> those, but I think that's both fragile and deprecated in favor of the
> table being in the DT.

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
