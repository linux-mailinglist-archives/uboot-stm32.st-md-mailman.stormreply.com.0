Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF94B6B92
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 12:56:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2717C5F1F2;
	Tue, 15 Feb 2022 11:56:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B0DAC5F1D7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 11:56:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FACL6O024409;
 Tue, 15 Feb 2022 12:56:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7rhUZHgRribMcxMUCTOqzmGxyavhoAMxQo2ld0nAtXk=;
 b=wxGTja3ZFVP9MUnwONDkkRpVlyfXX+H/UIO0+XJYcnAB48Crh10Z4L6jlE4VPGhBywDi
 LfIYF8U4FcW4C/1db66jfiOgSC19H4DhD1ZS4BpoaGl81ejAOnZHEqscvjY0zB1fbcBx
 e+rT0hweggyUOPtw4DIKxMl4Z2HaDwIKbKgml1Za6sE3RVK5WNnFgt5NFNk8GWQev9hu
 Zgep7H30e8ZOAlnx4Xm0jTrHWSR2dEdx4BxT73s+tkC71mHzne9h76VQbPOaFg/FozGq
 cPBC0zxWb6gRTX787fAOwaqt6pnwmngYC7TiFtOvGxqtVlH91NqrsbJqHQsbobFoIzuz wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e84wwjd8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:56:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6220210002A;
 Tue, 15 Feb 2022 12:56:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5987221FEA0;
 Tue, 15 Feb 2022 12:56:11 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb
 2022 12:56:10 +0100
Message-ID: <5e8dcbef-2f40-a1b0-b750-ec82eac244fc@foss.st.com>
Date: Tue, 15 Feb 2022 12:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, <u-boot@lists.denx.de>, Simon Glass
 <sjg@chromium.org>, Nishanth Menon <nm@ti.com>
References: <20220104074248.25015-1-patrice.chotard@foss.st.com>
 <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a0c92956-a235-622c-ca0f-9b5d6eef3e67@siemens.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

Hi Jan

On 2/14/22 16:21, Jan Kiszka wrote:
> On 04.01.22 08:42, Patrice Chotard wrote:
>> When OF_LIVE flag is enabled on a 64 bits platform, there is an
>> issue when dev_read_addr() is called and need to perform an address
>> translation using __of_translate_address().
>>
>> In case of error, __of_translate_address() return's value is OF_BAD_ADDR
>> (wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
>> The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
>> which is defined as (-1U) = 0xffffffff.
>> In this case the comparison is always false.
>>
>> To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
>> AARCH64. Update accordingly related tests.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> ---
>>
>> Changes in v2:
>>  - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged
>>
>>  include/fdtdec.h   | 5 ++++-
>>  test/dm/ofnode.c   | 2 +-
>>  test/dm/pci.c      | 4 ++--
>>  test/dm/test-fdt.c | 2 +-
>>  4 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/fdtdec.h b/include/fdtdec.h
>> index 6c7ab887b2..e9e2916d6e 100644
>> --- a/include/fdtdec.h
>> +++ b/include/fdtdec.h
>> @@ -24,16 +24,19 @@
>>  typedef phys_addr_t fdt_addr_t;
>>  typedef phys_size_t fdt_size_t;
>>  
>> -#define FDT_ADDR_T_NONE (-1U)
>>  #define FDT_SIZE_T_NONE (-1U)
>>  
>>  #ifdef CONFIG_PHYS_64BIT
>> +#define FDT_ADDR_T_NONE ((ulong)(-1))
>> +
>>  #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
>>  #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
>>  #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
>>  #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
>>  typedef fdt64_t fdt_val_t;
>>  #else
>> +#define FDT_ADDR_T_NONE (-1U)
>> +
>>  #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
>>  #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
>>  #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
>> diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
>> index cea0746bb3..e6c925eba6 100644
>> --- a/test/dm/ofnode.c
>> +++ b/test/dm/ofnode.c
>> @@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
>>  	ut_assert(ofnode_valid(node));
>>  	addr = ofnode_get_addr(node);
>>  	size = ofnode_get_size(node);
>> -	ut_asserteq(FDT_ADDR_T_NONE, addr);
>> +	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
>>  	ut_asserteq(FDT_SIZE_T_NONE, size);
>>  
>>  	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
>> diff --git a/test/dm/pci.c b/test/dm/pci.c
>> index fa2e4a8559..00e4440a9d 100644
>> --- a/test/dm/pci.c
>> +++ b/test/dm/pci.c
>> @@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
>>  	struct udevice *swap1f, *swap1;
>>  
>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
>>  
>>  	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
>>  
>>  	return 0;
>>  }
>> diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
>> index 8866d4d959..e1de066226 100644
>> --- a/test/dm/test-fdt.c
>> +++ b/test/dm/test-fdt.c
>> @@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
>>  	/* Test setting generic properties */
>>  
>>  	/* Non-existent in DTB */
>> -	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
>> +	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
>>  	/* reg = 0x42, size = 0x100 */
>>  	ut_assertok(ofnode_write_prop(node, "reg", 8,
>>  				      "\x00\x00\x00\x42\x00\x00\x01\x00"));
> 
> Since this commit, I'm getting this dev_get_priv warning:
> 
> [...]
> U-Boot 2022.01-00766-g9876ae7db6d-dirty (Feb 14 2022 - 16:15:21 +0100)
> 
> Model: SIMATIC IOT2050 Basic
> DRAM:  1 GiB
> Core:  94 devices, 28 uclasses, devicetree: separate
> WDT:   Not starting watchdog@40610000
> MMC:   mmc@4fa0000: 0
> Loading Environment from SPIFlash... SF: Detected w25q128 with page size
> 256 Bytes, erase size 64 KiB, total 16 MiB
> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
> drivers/dma/ti/k3-udma.c:1744 __dev_get_priv: null device
> OK
> In:    serial
> Out:   serial
> Err:   serial
> Net:   No ethernet found.
> Hit any key to stop autoboot:  0
> 
> (I've instrumented dev_get_priv to tell me file:line)
> 
> Is that a sleeping problem surfaced by the commit or a real regression?
> I can boot, though.
> 
> Jan
> 

It should be interesting to understand why uclass_get_device_by_phandle() return tmp = NULL.
What's the return value of uclass_get_device_by_phandle() ?


Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
