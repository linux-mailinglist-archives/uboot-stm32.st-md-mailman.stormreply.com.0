Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFC32B65F
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 10:57:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62671C57B53;
	Wed,  3 Mar 2021 09:57:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBEAAC56634
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 09:57:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1239mIO6006975; Wed, 3 Mar 2021 10:57:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FxylewaLsL0C2VGf5KgXiAZGHZELlPoi+YR2Rt3OFTs=;
 b=NiFd71rilCjLEsuppjdL7hgvNFYntoh4lZSjlDDY4Yb1Ii1GVdXnQjiVXJ87Gusu9u3A
 /XEPDaYJ/HNIWN/ZbDvMPa8CyLJxqyVTKpFrN+rbASw3NQfRxfx633yUkpKSCND5DAAT
 vLv2+qr3UEFifeVKBGDXO/bDTZPvxk9BMmRUcVP6hhBdRoo7Llkub5hX1gcybzSoDCZE
 tCjdZb2+o4blpWicKjzSJCn3vsJIfp8QcrIkJR7GUmN9bFUjaarxqFqpY7ftyKqvGn9O
 R35Xef59CoCkCCGffOe9czSxaY6eUpCS3cseI4nCmWnImJGpJZw3RPISJ1BOZdMegOwA CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfdy7xxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 10:57:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E04F10002A;
 Wed,  3 Mar 2021 10:57:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84E05221F9E;
 Wed,  3 Mar 2021 10:57:06 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 10:57:04 +0100
To: Tom Rini <trini@konsulko.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>
References: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
 <20210302205053.GF10169@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <18550712-c32d-e08b-c38e-6c63bad09009@foss.st.com>
Date: Wed, 3 Mar 2021 10:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302205053.GF10169@bill-the-cat>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
Cc: Reuben Dowle <reubendowle0@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Atish Patra <atish.patra@wdc.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Masahiro Yamada <masahiroy@kernel.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Thomas Chou <thomas@wytron.com.tw>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Andre Przywara <andre.przywara@arm.com>, Huan Wang <alison.wang@nxp.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>, Simon Glass <sjg@chromium.org>,
 Tero Kristo <t-kristo@ti.com>, Mario Six <mario.six@gdsys.cc>,
 Sam Protsenko <joe.skb7@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] lmb: Add config for the number of
 memory and reserved regions
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

Hi Tom,

On 3/2/21 9:50 PM, Tom Rini wrote:
> On Tue, Feb 02, 2021 at 01:59:07PM +0100, Patrick Delaunay wrote:
>
>> Hi,
>>
>> I propose a update of the lmb library to allow the configuration
>> with Kconfig of the number of memory and reserved regions in lmb
>> libary:
>> - CONFIG_LMB_RESERVED_REGIONS
>> - CONFIG_LMB_MEMORY_REGIONS
>>
>> By default, I keep the default value of 8 regions.
>>
>> This serie avoids issue on stm32mp15 platform,
>> as the kernel device tree defines many and non contiguous reserved
>> regions.
>>
>>
>>
>> Patrick Delaunay (5):
>>    lmb: move CONFIG_LMB in Kconfig
>>    lmb: remove lmb_region.size
>>    lmb: Move lmb property arrays in struct lmb
>>    lmb: Add 2 config to define the max number of regions
>>    configs: stm32mp15: increase the number of reserved memory region in
>>      lmb
>>
>>   arch/arc/include/asm/config.h        |  2 --
>>   arch/arm/include/asm/config.h        |  1 -
>>   arch/m68k/include/asm/config.h       |  1 -
>>   arch/microblaze/include/asm/config.h |  2 --
>>   arch/mips/include/asm/config.h       |  1 -
>>   arch/nds32/include/asm/config.h      |  1 -
>>   arch/powerpc/include/asm/config.h    |  1 -
>>   arch/riscv/include/asm/config.h      |  1 -
>>   arch/sh/include/asm/config.h         |  2 --
>>   arch/x86/include/asm/config.h        |  1 -
>>   arch/xtensa/include/asm/config.h     |  2 --
>>   configs/stm32mp15_basic_defconfig    |  1 +
>>   configs/stm32mp15_trusted_defconfig  |  1 +
>>   include/configs/10m50_devboard.h     |  5 ----
>>   include/configs/3c120_devboard.h     |  5 ----
>>   include/configs/sandbox.h            |  2 --
>>   include/configs/x86-common.h         |  2 --
>>   include/image.h                      |  2 +-
>>   include/lmb.h                        | 34 ++++++++++++++++++++++++----
>>   lib/Kconfig                          | 23 +++++++++++++++++++
>>   lib/lmb.c                            | 14 ++++++------
>>   scripts/config_whitelist.txt         |  1 -
>>   22 files changed, 63 insertions(+), 42 deletions(-)
> This series causes a little bit of size growth everywhere.  It's fatal
> on nokia_rx51 (and caught via the test script).  We can bring nokia_rx51
> back under size by disabling the optimized memcpy/memset functions, but
> that's not ideal.  Can we do your changes here in a more size-concious
> way?  Thanks!
>

Sure, I will check and correct this issue.


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
