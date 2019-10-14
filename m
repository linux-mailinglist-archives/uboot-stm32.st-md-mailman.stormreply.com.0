Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7527D6696
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 17:53:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E349C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 15:53:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 250D3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 15:53:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9EFki9Q022051; Mon, 14 Oct 2019 17:53:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aXqerRtCY8sBwhI0Dy00B8X+6tl5NxUih/+72BchRQQ=;
 b=1YSIdK52Lruc755MGDgjYGBWXBWgD6LBl2N83Kg0wbaQngKSTwikeeejDCyVZP+lsaDz
 cP8f5BnE4TqZ/LHfr2asxK2M6QIgrIATcmmT2M9oAX0AcPf0KwZo8zwqvnyJNYuSQHml
 k22STplFCKHKyArTZQpwEtHsLUGdcDncedasFM0P38FUF+IHfzIpbUQK+en/AhYpoJ53
 rUygqWsLE3LjX5NLS8aDikxzoNJgtD5AvS3SxwKluqrpJyAwrqfr+CO3BQNB7oBPFvRj
 lo/YOp9S3bMPtdgu/gvwc5tdDx090A5XlWuMi+McjFT2/wDxhP7hQeBrWu1tPcoMBrYa CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9km6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 17:53:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 618D9100034;
 Mon, 14 Oct 2019 17:53:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node3.st.com [10.75.127.21])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5445B2AF5B8;
 Mon, 14 Oct 2019 17:53:45 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG7NODE3.st.com
 (10.75.127.21) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Oct
 2019 17:53:44 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 14 Oct 2019 17:53:44 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Suman Anna <s-anna@ti.com>, Simon Glass <sjg@chromium.org>, "Patrick
 DELAUNAY" <patrick.delaunay@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
Thread-Topic: [U-Boot] [PATCH 3/5] remoteproc: stm32: load resource table from
 firmware
Thread-Index: AQHVfrdaGeZJIf4tM0y75LqL4oixp6dVwHoAgARvrQA=
Date: Mon, 14 Oct 2019 15:53:44 +0000
Message-ID: <9792c4b6-6361-b5b8-9112-26b750d4266d@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-4-git-send-email-fabien.dessenne@st.com>
 <3e24fcf9-05df-12da-3eee-619dd9e86d69@ti.com>
In-Reply-To: <3e24fcf9-05df-12da-3eee-619dd9e86d69@ti.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <A5CDA34C1CC67E4BBB889D6A0B1AB8E2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_08:2019-10-11,2019-10-14 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 3/5] remoteproc: stm32: load
 resource table from firmware
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


On 11/10/2019 10:09 PM, Suman Anna wrote:
> Hi Fabien,
>
> On 10/9/19 10:36 AM, Fabien Dessenne wrote:
>> Load the optional resource table from the firmware, and write its
>> address in the dedicated backup register.
> What processor is this? Reason I ask is that you are using 0 as a no
> resource table address, and if it is a valid address for that processor?


Since on system reset, the vector table of the STM32MP Cortex-M4 
co-processor is fixed at address 0, the ResourceTable can't be located here.

ResourceTable address = 0 can be safely interpreted as "No resource table".

BR

Fabien


>
> regards
> Suman
>
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>>   drivers/remoteproc/stm32_copro.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
>> index 40bba37..eef3416 100644
>> --- a/drivers/remoteproc/stm32_copro.c
>> +++ b/drivers/remoteproc/stm32_copro.c
>> @@ -23,6 +23,7 @@
>>    * @hold_boot_offset:	offset of the register controlling the hold boot setting
>>    * @hold_boot_mask:	bitmask of the register for the hold boot field
>>    * @is_running:		is the remote processor running
>> + * @rsc_table_addr:	resource table address
>>    */
>>   struct stm32_copro_privdata {
>>   	struct reset_ctl reset_ctl;
>> @@ -30,6 +31,7 @@ struct stm32_copro_privdata {
>>   	uint hold_boot_offset;
>>   	uint hold_boot_mask;
>>   	bool is_running;
>> +	ulong rsc_table_addr;
>>   };
>>   
>>   /**
>> @@ -141,6 +143,7 @@ static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
>>   static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
>>   {
>>   	struct stm32_copro_privdata *priv;
>> +	ulong rsc_table_size;
>>   	int ret;
>>   
>>   	priv = dev_get_priv(dev);
>> @@ -155,6 +158,12 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
>>   		return ret;
>>   	}
>>   
>> +	if (rproc_elf32_load_rsc_table(dev, addr, size, &priv->rsc_table_addr,
>> +				       &rsc_table_size)) {
>> +		priv->rsc_table_addr = 0;
>> +		dev_warn(dev, "No valid resource table for this firmware\n");
>> +	}
>> +
>>   	return rproc_elf32_load_image(dev, addr, size);
>>   }
>>   
>> @@ -180,6 +189,10 @@ static int stm32_copro_start(struct udevice *dev)
>>   	 * rebooting autonomously
>>   	 */
>>   	ret = stm32_copro_set_hold_boot(dev, true);
>> +	if (!ret)
>> +		/* Store rsc_address in bkp register */
>> +		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
>> +
>>   	priv->is_running = !ret;
>>   	return ret;
>>   }
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
