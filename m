Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15337B0A25
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 10:22:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96FACC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 08:22:34 +0000 (UTC)
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D793C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2019 08:22:32 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 1263863EC6D;
 Thu, 12 Sep 2019 10:22:31 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 12 Sep
 2019 10:22:30 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 12 Sep 2019 10:22:30 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Lukasz Majewski <lukma@denx.de>
Thread-Topic: [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI* to
 CONFIG_{SPL_TPL}DM_SPI*
Thread-Index: AQHVZBUYRxTl92hEQkyjZMEzXHVzD6cjFQ8AgAANjQCAAXblAIADAzyA
Date: Thu, 12 Sep 2019 08:22:30 +0000
Message-ID: <91c1e945-1c66-9349-5b2c-253ea0dd8144@kontron.de>
References: <20190904221639.26469-1-lukma@denx.de>
 <20190905180904.GA26850@bill-the-cat>
 <e5d7e314-3cf9-687a-d638-19ebaef6279b@kontron.de>
 <20190909140020.5099a79f@jawa> <20190910122208.6565be76@jawa>
In-Reply-To: <20190910122208.6565be76@jawa>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <E0106028186C164D8F7B8B8C412BE89D@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 1263863EC6D.A35E0
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

Hi Lukasz,

On 10.09.19 12:22, Lukasz Majewski wrote:
> Hi Frieder,
> 
>> On Mon, 9 Sep 2019 11:11:50 +0000
>> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
>>
>>> Hi Lukasz,
>>>
>>> On 05.09.19 20:09, Tom Rini wrote:
>>>> On Thu, Sep 05, 2019 at 12:16:36AM +0200, Lukasz Majewski wrote:
>>>>    
>>>>> This patch series introduces new SPL and TPL specific Kconfig
>>>>> entries for DM_SPI* options. Such change allows using the spi
>>>>> driver in SPL/TPL or U-Boot proper.
>>>>>
>>>>> First two patches - related to ls10{42}* NXP soc fix some issues
>>>>> with defining the DM_SPI* defines in <board>.h file instead of
>>>>> Kconfig.
>>>>>
>>>>> This series doesn't introduce build breaks, but board maintainers
>>>>> are kindly asked to check if their boards still boots.
>>>>>
>>>>> Buildman setup for binary size regression checking:
>>>>>
>>>>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043
>>>>> --output-dir=../BUILD/ --force-build -CveE
>>>>> ./tools/buildman/buildman.py -b HEAD --count=4 ls1043
>>>>> --output-dir=../BUILD/ -Ssdel
>>>>
>>>> So you did fix the ls1043 problems but ls1046 is still a problem.
>>>>     
>>>
>>> I was trying to clean up this config mess some weeks ago. I
>>> stumbled over the same issues (size deltas below) when I tested
>>> with buildman and finally gave up on it. This was my testing branch
>>> for reference: [1].
>>>
>>> Thanks for your work and I hope you/we can get this sorted out
>>> somehow...
>>
>> For now I've only posted the patch to introduce SPL_DM_SPI in Kconig:
>> https://patchwork.ozlabs.org/patch/1159655/
> 
> However, I've looked on your patchset and IMHO this work could be
> divided (as doing it at once is not feasible).
> 
> For example the CONFIG_SPI_FLASH_MTD could be converted to
> (SPL_TPL_)SPI_FLASH_MTD and then one could use
> 
> #if CONFIG_IS_ENABLED(SPI_FLASH_MTD) in drivers/mtd/spi/sf_probe.c (as
> it is only used there).
> 
> Then we could avoid situations where code is added as you remove it
> here [1]:
> https://github.com/fschrempf/u-boot/commit/b6489fb5928c2b41d7e4cb39933f078659b4f10e#diff-9d3e174d033b8b9c9d380a22a81600aaL136
> 
> What I'm afraid though, is that split of SPI_FLASH_MTD will require
> adding unwillingly SPL_(TPL_)SPI_FLASH_MTD to all boards which already
> define it (and only drop ones, which use in <config>.h file pattern as
> [1]).

Yes, this looks like what I've tried to do separately in this branch [1].

The problem with some socfpga boards is, that they enable 
CONFIG_SPI_FLASH_MTD in socfpga_common.h, without enabling 
CONFIG_SPI_FLASH, which is probably wrong. So I tried to correct this, 
but looking at it again, this should be done separately.

So if I remove the added "CONFIG_SPI_FLASH=y" from my patches and 
rebase, this should be ok.

For this set I have still one question: Should I split the patches as 
currently done in [1]? This would mean after the first patch some boards 
miss SPI_FLASH_MTD code and the subsequent board config patches correct 
it afterwards. Or should I merge all the changes to a single patch, to 
not break the boards in between.
Unfortunately I can't do it the other way round and apply the board 
config changes first, as this breaks the build.

> Frieder, would you be able to work on this topic any time soon?

I can try to find some time this weekend and try to get [1] ready. But I 
probably won't be able to spend serious amounts of time anytime soon on 
the remaining tasks.

Thanks,
Frieder

[1]: https://github.com/fschrempf/u-boot/commits/spi_flash_mtd_cleanup
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
