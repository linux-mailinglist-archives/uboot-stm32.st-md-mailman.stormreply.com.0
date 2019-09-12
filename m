Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD56B0B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 11:16:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FB1AC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 09:16:43 +0000 (UTC)
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70CA5C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2019 09:16:41 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 53BF1641771;
 Thu, 12 Sep 2019 11:16:38 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 12 Sep
 2019 11:16:37 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 12 Sep 2019 11:16:37 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI* to
 CONFIG_{SPL_TPL}DM_SPI*
Thread-Index: AQHVZBUYRxTl92hEQkyjZMEzXHVzD6cjFQ8AgAANjQCAAXblAIADAzyAgAALWQCAAAPGAA==
Date: Thu, 12 Sep 2019 09:16:37 +0000
Message-ID: <5ccbd9b4-2973-a324-79bb-d28bc29906c7@kontron.de>
References: <20190904221639.26469-1-lukma@denx.de>
 <20190905180904.GA26850@bill-the-cat>
 <e5d7e314-3cf9-687a-d638-19ebaef6279b@kontron.de>
 <20190909140020.5099a79f@jawa> <20190910122208.6565be76@jawa>
 <91c1e945-1c66-9349-5b2c-253ea0dd8144@kontron.de>
 <20190912110306.2fa14a94@jawa>
In-Reply-To: <20190912110306.2fa14a94@jawa>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <B12E42978FF77743874ABAF21B47678F@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 53BF1641771.A1059
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: alison.wang@nxp.com, feng.li_2@nxp.com,
 joe.hershberger@ni.com, lukma@denx.de, pankit.garg@nxp.com,
 sr@denx.de, sumit.garg@nxp.com, tien.fong.chee@intel.com,
 trini@konsulko.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, vinitha.pillai@nxp.com,
 xypron.glpk@gmx.de, yinbo.zhu@nxp.com, york.sun@nxp.com
X-Spam-Status: No
Cc: Feng Li <feng.li_2@nxp.com>, Tom Rini <trini@konsulko.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Sumit
 Garg <sumit.garg@nxp.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, Alison
 Wang <alison.wang@nxp.com>, Pankit Garg <pankit.garg@nxp.com>, Vinitha V
 Pillai <vinitha.pillai@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Stefan Roese <sr@denx.de>, York Sun <york.sun@nxp.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI*
 to CONFIG_{SPL_TPL}DM_SPI*
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

On 12.09.19 11:03, Lukasz Majewski wrote:
> Hi Frieder,
> 
>> Hi Lukasz,
>>
>> On 10.09.19 12:22, Lukasz Majewski wrote:
>>> Hi Frieder,
>>>    
>>>> On Mon, 9 Sep 2019 11:11:50 +0000
>>>> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
>>>>   
>>>>> Hi Lukasz,
>>>>>
>>>>> On 05.09.19 20:09, Tom Rini wrote:
>>>>>> On Thu, Sep 05, 2019 at 12:16:36AM +0200, Lukasz Majewski wrote:
>>>>>>       
>>>>>>> This patch series introduces new SPL and TPL specific Kconfig
>>>>>>> entries for DM_SPI* options. Such change allows using the spi
>>>>>>> driver in SPL/TPL or U-Boot proper.
>>>>>>>
>>>>>>> First two patches - related to ls10{42}* NXP soc fix some issues
>>>>>>> with defining the DM_SPI* defines in <board>.h file instead of
>>>>>>> Kconfig.
>>>>>>>
>>>>>>> This series doesn't introduce build breaks, but board
>>>>>>> maintainers are kindly asked to check if their boards still
>>>>>>> boots.
>>>>>>>
>>>>>>> Buildman setup for binary size regression checking:
>>>>>>>
>>>>>>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043
>>>>>>> --output-dir=../BUILD/ --force-build -CveE
>>>>>>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043
>>>>>>> --output-dir=../BUILD/ -Ssdel
>>>>>>
>>>>>> So you did fix the ls1043 problems but ls1046 is still a problem.
>>>>>>        
>>>>>
>>>>> I was trying to clean up this config mess some weeks ago. I
>>>>> stumbled over the same issues (size deltas below) when I tested
>>>>> with buildman and finally gave up on it. This was my testing
>>>>> branch for reference: [1].
>>>>>
>>>>> Thanks for your work and I hope you/we can get this sorted out
>>>>> somehow...
>>>>
>>>> For now I've only posted the patch to introduce SPL_DM_SPI in
>>>> Kconig: https://patchwork.ozlabs.org/patch/1159655/
>>>
>>> However, I've looked on your patchset and IMHO this work could be
>>> divided (as doing it at once is not feasible).
>>>
>>> For example the CONFIG_SPI_FLASH_MTD could be converted to
>>> (SPL_TPL_)SPI_FLASH_MTD and then one could use
>>>
>>> #if CONFIG_IS_ENABLED(SPI_FLASH_MTD) in drivers/mtd/spi/sf_probe.c
>>> (as it is only used there).
>>>
>>> Then we could avoid situations where code is added as you remove it
>>> here [1]:
>>> https://github.com/fschrempf/u-boot/commit/b6489fb5928c2b41d7e4cb39933f078659b4f10e#diff-9d3e174d033b8b9c9d380a22a81600aaL136
>>>
>>> What I'm afraid though, is that split of SPI_FLASH_MTD will require
>>> adding unwillingly SPL_(TPL_)SPI_FLASH_MTD to all boards which
>>> already define it (and only drop ones, which use in <config>.h file
>>> pattern as [1]).
>>
>> Yes, this looks like what I've tried to do separately in this branch
>> [1].
>>
>> The problem with some socfpga boards is, that they enable
>> CONFIG_SPI_FLASH_MTD in socfpga_common.h, without enabling
>> CONFIG_SPI_FLASH, which is probably wrong.
> 
> It looks to me like the code in:
> https://github.com/fschrempf/u-boot/commit/059d67efa34da92aaf738758e596f436203c84c2#diff-9d3e174d033b8b9c9d380a22a81600aaL136
> 
> is to prevent ALL socfpgas from compiling in FLASH MTD support to SPL,
> as it causes build breaks (as I do have such situation in one of my
> boards - it uses tiny SPI in SPL to read data from SPI-NOR, without the
> need to enable MTD there) .
> 
> In other words those boards only use FLASH MTD driver in U-Boot proper.
> (and probably there shall not be any deltas in buildman build binaries
> [*])

Right.

> 
>> So I tried to correct
>> this, but looking at it again, this should be done separately.
>>
>> So if I remove the added "CONFIG_SPI_FLASH=y" from my patches and
>> rebase, this should be ok.
> 
> I think yes. I guess that ALL socfpgas shall have added
> CONFIG_SPI_FLASH_MTD=y to their _defconfigs

Right.

> 
> 
> It may also happen that boards, which define CONFIG_SPI_FLASH_MTD would
> require both CONFIG_SPI_FLASH_MTD and CONFIG_SPL_SPI_FLASH_MTD defined
> (if they don't use socfpga style <config>.h code) to have the same
> binaries build.

Last time I looked such boards didn't exist, but I'll check again.

> 
>>
>> For this set I have still one question: Should I split the patches as
>> currently done in [1]? This would mean after the first patch some
>> boards miss SPI_FLASH_MTD code and the subsequent board config
>> patches correct it afterwards. Or should I merge all the changes to a
>> single patch, to not break the boards in between.
> 
> I would opt for preparing one single patch with conversion (to avoid
> build breaks). This would also allow easy buildman testing [*] to see
> if there is any difference in sizes of binaries (elf sections to be
> precise).
> 
> I would also add the patch to define CONFIG_SPL_SPI_FLASH_MTD in
> Kconfig to show that such option is available for use after the
> conversion (IMHO it shall be added before the conversion patch).

Ok. Last time I worked on this, there was no board using SPI_FLASH_MTD 
in SPL. But this might not be true anymore. Anyway, I'll add the option.

> 
>> Unfortunately I can't do it the other way round and apply the board
>> config changes first, as this breaks the build.
> 
> The volume of changes is rather small - so single patch would be
> optimal here.

Ok.

> 
>>
>>> Frieder, would you be able to work on this topic any time soon?
>>
>> I can try to find some time this weekend and try to get [1] ready.
> 
> Great, thanks :-)
> 
>> But I probably won't be able to spend serious amounts of time anytime
>> soon on the remaining tasks.
> 
> I think that we shall do it step by step. As we both learned from the
> experience - doing it at once is not feasible.

Definitely!

> 
> My comments to the patch set [1]:
> 
> 1.
> https://github.com/fschrempf/u-boot/commit/059d67efa34da92aaf738758e596f436203c84c2#diff-94a725bbe2cb8781105dab5153da9209R44
> 
> Is the CONFIG_SPI_FLASH = y necessary?

For the boards to work properly, it probably is necessary, but it builds 
fine without, so as said above I will leave this fix for someone who 
knows about socfpga.

> 
> 
> 
> [*] - Buildman setup for testing (shared with me by Tom):
> 
> Set date:
> export SOURCE_DATE_EPOCH=`date +%s`
> 
> Build the code:
> 
> ./tools/buildman/buildman.py -b HEAD --count=1 socfpga dh_imx6 <other>
> --output-dir=../BUILD/ --force-build -CveE
> 
> Check build results (including binary deltas):
> 
> ./tools/buildman/buildman.py -b HEAD --count=1 socfpga dh_imx6 <other>
> --output-dir=../BUILD/ -SsdelB
> 
> 
> And you shall see the build results (with binary deltas).

Thanks, I already use such buildman setup to test the binary deltas.

> 
>>
>> Thanks,
>> Frieder
>>
>> [1]: https://github.com/fschrempf/u-boot/commits/spi_flash_mtd_cleanup
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
