Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B513D667C
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:50:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC2CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 15:50:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40E01C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 15:50:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EFki8t022051; Mon, 14 Oct 2019 17:50:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jtAV/AdyZ61FGfRb1IiMuMbTyctMD57CBPeW1FnX+RU=;
 b=nxl1zCfQsk5u3RWpwzEHkl7HfgOgFRU95orhfXE9JGebhd0CP70Ni5TZEGdXBuoR8A+4
 wCohkAMcXlQ6A8+zVgBcr7ehmEWh+QKzEBE39he/FGdEclrqFFsWFdNPRPcVsh8QAw3x
 yr+Y3VDSKp6Ie/+Y7VSriMyI/q+FkjFOxv5IeGrnkp9X4CpCEP8RDjjKrSNUUw8JUbDk
 RRkZ6qyFC+qOaBInUVKbLMGCIOkKSylxGrnKN/jVt0orTNVy1q7Jyt+ETzJSFvWN44Lm
 QCLrzttDgk80SR1KshvLAeevpD513T8sOELh99pAgQmeQnUxWUbuOftjel2CRqWuv3KO 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9kkqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 17:50:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DE5510002A;
 Mon, 14 Oct 2019 17:50:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F8F12CDC29;
 Mon, 14 Oct 2019 17:50:17 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Oct
 2019 17:50:16 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 14 Oct 2019 17:50:16 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Suman Anna <s-anna@ti.com>, Simon Glass <sjg@chromium.org>, "Patrick
 DELAUNAY" <patrick.delaunay@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
Thread-Topic: [U-Boot] [PATCH 4/5] stm32mp1: Fixup the Linux DeviceTree with
 coprocessor information
Thread-Index: AQHVfrdbS89m33EraUmmZN16OpQFOqdVvTCAgARx/wA=
Date: Mon, 14 Oct 2019 15:50:16 +0000
Message-ID: <ad8bdfd8-8302-21f5-61d7-a2e066360eae@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-5-git-send-email-fabien.dessenne@st.com>
 <b8dc293b-8b72-71a0-3468-da89e920a345@ti.com>
In-Reply-To: <b8dc293b-8b72-71a0-3468-da89e920a345@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <912B0125538EBA498FDEFFE028810F59@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_08:2019-10-11,2019-10-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 4/5] stm32mp1: Fixup the Linux
 DeviceTree with coprocessor information
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

Hi Suman,


Thank you for your comments.


On 11/10/2019 9:57 PM, Suman Anna wrote:
> Hi Fabien,
>
> On 10/9/19 10:36 AM, Fabien Dessenne wrote:
>> When the coprocessor has been started, provide the context to Linux
>> kernel so it can handle it:
>> - update the coprocessor node of kernel DeviceTree with the
>>    "early-booted" property.
> Has this property been acked by DT maintainers at the kernel-level?
> We have used something similar but moving away from it and instead just
> relying on reading the hardware reset status in the kernel remoteproc
> driver, and configuring the driver accordingly.

Good point, that "early-booted" property has not been reviewed by the 
kernel DT maintainers.
This property shall be read by some kernel remoteproc drivers, together 
with the kernel "remoteproc: add support for preloaded firmware" 
patchset [1] which is still under review/rework (I expect Loic to send 
an update version (very) soon).

I will nevertheless rework this u-boot patchset in order to get rid of 
that property. Instead of, I plan to use some additional HW register to 
track the processor state.

[1] https://lkml.org/lkml/2018/11/30/157


>
>> - write the resource table address in a dedicated backup register.
> Is this an actual register on the SoC or some block of memory dedicated
> for sharing information from U-Boot to kernel?
>
> We have the same problem and I am currently going with a
> design-by-contract approach for early-booted usecases where I am
> expecting the resource table to be placed at a specific location in
> memory regions given to remoteproc.

I am interested in having the resource table placed in a specific 
remoteproc memory region.
For the time being I write the RscTable in a backup register which is an 
actual SoC register. When the "specific memory region" dev is available, 
I may consider moving to that alternate implementation.


BR


Fabien

>
> regards
> Suman
>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>>   board/st/stm32mp1/stm32mp1.c | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 18f9b84..8c669d0 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -891,6 +891,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>>   #if defined(CONFIG_OF_BOARD_SETUP)
>>   int ft_board_setup(void *blob, bd_t *bd)
>>   {
>> +	int off, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
>>   #ifdef CONFIG_FDT_FIXUP_PARTITIONS
>>   	struct node_info nodes[] = {
>>   		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
>> @@ -899,6 +900,17 @@ int ft_board_setup(void *blob, bd_t *bd)
>>   	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>>   #endif
>>   
>> +	/* Update DT if coprocessor started */
>> +	off = fdt_path_offset(blob, "/mlahb/m4@10000000");
>> +	if (off > 0) {
>> +		if (!rproc_is_running(id)) {
>> +			fdt_setprop_empty(blob, off, "early-booted");
>> +		} else {
>> +			fdt_delprop(blob, off, "early-booted");
>> +			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
>> +		}
>> +	}
>> +
>>   	return 0;
>>   }
>>   #endif
>> @@ -918,10 +930,8 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
>>   	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
>>   	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
>>   
>> -	if (!ret) {
>> +	if (!ret)
>>   		rproc_start(id);
>> -		env_set("copro_state", "booted");
>> -	}
>>   }
>>   
>>   U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
