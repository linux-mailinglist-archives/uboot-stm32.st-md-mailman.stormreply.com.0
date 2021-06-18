Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2723AC586
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:57:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8367EC597AF;
	Fri, 18 Jun 2021 07:57:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6B78C597AE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:57:42 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7vPUu016530; Fri, 18 Jun 2021 09:57:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qdcYsDVVgTHXq6KrqWvq+oyzeVcqdlS9M+LrRtFSkqg=;
 b=8XJUHqVmxgzr4Sz48Kty5VuPrt3SmK62sE1g2GHNijz7Fd1qq5pTIHr4MHMK1CR9OUYF
 toWJOSOJSm+7Gx5FYwhYrH22a2LDgcJ0zMgsYrqxAWcwhskFE58rd5YpjZnx3A4Zd0np
 EXYNTYxQm2YM5IKc1O91RwCXBt54QBudmMwY29/R660fs/y1OUexlouvrdRDOegIyQ0c
 wXZT0/9IF8v4zVBHtYC2PLilihdSBClr0imwT7SO9S9FfDvD+ktIWBzZTrbjeOWpfa3K
 khLP7c+w4yxPOb1/tyosfVppVAEr1Q20ylOgvLlLFkvbrMo2pgS7aecqzAG327C6Dyxz Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b756yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:57:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EFF0F10002A;
 Fri, 18 Jun 2021 09:57:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E57CA21A205;
 Fri, 18 Jun 2021 09:57:40 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:57:40 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.3.I6f9c5a83cfe16a49ab3f724cc0be3b59f4bcd05c@changeid>
 <e8c0db2e-ff62-5f5d-7c26-4bae755560ca@foss.st.com>
Message-ID: <7f53f737-09c7-3f4f-06a9-97b2602ac1e7@foss.st.com>
Date: Fri, 18 Jun 2021 09:57:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e8c0db2e-ff62-5f5d-7c26-4bae755560ca@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] stm32mp: stm32prog: add support of
 initrd in flashlayout
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



On 5/28/21 2:53 PM, Patrice CHOTARD wrote:
> HI Patrick
> 
> On 5/18/21 3:12 PM, Patrick Delaunay wrote:
>> Add the support in command stm32prog of kernel load and start
>> with initrd file, identify by the partition Type "Binary" in
>> the flashlayout.tsv, for example:
>>
>> - 0x01 fsbl	Binary none 0x0 tfa.stm32
>> - 0x03 fip	Binary none 0x0 fip.bin
>> P 0x10 kernel System ram0 0xC2000000 uImage.bin
>> P 0x11 dtb FileSystem ram0 0xC4000000 board.dtb
>> P 0x12 initrd Binary ram0 0xC4400000 <initrd>
>>
>> The <initrd> file can be a legacy image "uInitrd", generated
>> with mkimage, or a RAW initrd image "initrd.gz".
>>
>> After a DFU detach the bootm command with be executed
>> with the associated address, for example:
>>
>> $> bootm 0xC2000000 0xC4400000:<size> 0xC4000000
>>
>> When the "Binary" partition type is absent, the 'bootm'
>> command starts the kernel without ramdisk, for example:
>>
>> $> bootm 0xC2000000 - 0xC4000000
>>
>> With this paths, it is no more mandatory to generate FIT
>> including the kernel, DT and initrd:
>>
>> - 0x01 fsbl Binary none 0x0 tfa.stm32
>> - 0x03 fip Binary none 0x0 fip.bin
>> P 0x10 fit System ram0 0xC2000000 fit.bin
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  .../cmd_stm32prog/cmd_stm32prog.c             | 22 +++++++++++++------
>>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 10 ++++++---
>>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  2 ++
>>  3 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
>> index e36501a86b..e584bb52bd 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
>> @@ -45,7 +45,6 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>>  	bool reset = false;
>>  	struct image_header_s header;
>>  	struct stm32prog_data *data;
>> -	u32 uimage, dtb;
>>  
>>  	if (argc < 3 ||  argc > 5)
>>  		return CMD_RET_USAGE;
>> @@ -119,21 +118,23 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>>  		goto cleanup;
>>  	}
>>  
>> -	uimage = data->uimage;
>> -	dtb = data->dtb;
>> -
>>  	stm32prog_clean(data);
>>  	free(stm32prog_data);
>>  	stm32prog_data = NULL;
>>  
>>  	puts("Download done\n");
>>  
>> -	if (uimage) {
>> +	if (data->uimage) {
>>  		char boot_addr_start[20];
>>  		char dtb_addr[20];
>> +		char initrd_addr[40];
>>  		char *bootm_argv[5] = {
>>  			"bootm", boot_addr_start, "-", dtb_addr, NULL
>>  		};
>> +		u32 uimage = data->uimage;
>> +		u32 dtb = data->dtb;
>> +		u32 initrd = data->initrd;
>> +
>>  		if (!dtb)
>>  			bootm_argv[3] = env_get("fdtcontroladdr");
>>  		else
>> @@ -142,8 +143,15 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>>  
>>  		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
>>  			 "0x%x", uimage);
>> -		printf("Booting kernel at %s - %s...\n\n\n",
>> -		       boot_addr_start, bootm_argv[3]);
>> +
>> +		if (initrd) {
>> +			snprintf(initrd_addr, sizeof(initrd_addr) - 1, "0x%x:0x%x",
>> +				 initrd, data->initrd_size);
>> +			bootm_argv[2] = initrd_addr;
>> +		}
>> +
>> +		printf("Booting kernel at %s %s %s...\n\n\n",
>> +		       boot_addr_start, bootm_argv[2], bootm_argv[3]);
>>  		/* Try bootm for legacy and FIT format image */
>>  		if (genimg_get_format((void *)uimage) != IMAGE_FORMAT_INVALID)
>>  			do_bootm(cmdtp, 0, 4, bootm_argv);
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index 84b880261a..ea69d5dd16 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -1473,7 +1473,7 @@ error:
>>  	return ret;
>>  }
>>  
>> -static void stm32prog_end_phase(struct stm32prog_data *data)
>> +static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
>>  {
>>  	if (data->phase == PHASE_FLASHLAYOUT) {
>>  		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
>> @@ -1489,6 +1489,10 @@ static void stm32prog_end_phase(struct stm32prog_data *data)
>>  			data->uimage = data->cur_part->addr;
>>  		if (data->cur_part->part_type == PART_FILESYSTEM)
>>  			data->dtb = data->cur_part->addr;
>> +		if (data->cur_part->part_type == PART_BINARY) {
>> +			data->initrd = data->cur_part->addr;
>> +			data->initrd_size = offset;
>> +		}
>>  	}
>>  
>>  	if (CONFIG_IS_ENABLED(MMC) &&
>> @@ -1747,7 +1751,7 @@ void dfu_flush_callback(struct dfu_entity *dfu)
>>  	if (dfu->dev_type == DFU_DEV_RAM) {
>>  		if (dfu->alt == 0 &&
>>  		    stm32prog_data->phase == PHASE_FLASHLAYOUT) {
>> -			stm32prog_end_phase(stm32prog_data);
>> +			stm32prog_end_phase(stm32prog_data, dfu->offset);
>>  			/* waiting DFU DETACH for reenumeration */
>>  		}
>>  	}
>> @@ -1756,7 +1760,7 @@ void dfu_flush_callback(struct dfu_entity *dfu)
>>  		return;
>>  
>>  	if (dfu->alt == stm32prog_data->cur_part->alt_id) {
>> -		stm32prog_end_phase(stm32prog_data);
>> +		stm32prog_end_phase(stm32prog_data, dfu->offset);
>>  		stm32prog_next_phase(stm32prog_data);
>>  	}
>>  }
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> index ad404879a7..efb51a3022 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> @@ -142,6 +142,8 @@ struct stm32prog_data {
>>  	/* bootm information */
>>  	u32	uimage;
>>  	u32	dtb;
>> +	u32	initrd;
>> +	u32	initrd_size;
>>  };
>>  
>>  extern struct stm32prog_data *stm32prog_data;
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied on u-boot-stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
