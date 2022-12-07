Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6983645E44
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 17:01:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60BF4C65067;
	Wed,  7 Dec 2022 16:01:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D81C01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 16:01:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7DUo6B003992; Wed, 7 Dec 2022 17:01:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F5SiqZdTHFa5jRWCIAHORQz2Wd3FqFufqu3GODozpBs=;
 b=dccYZeDRdoG/rGmPjz2VKZiZnvLQPBWLWQ2QNkTZKJiphSGkRS865F0klHL+2oYWHH//
 zMTCrc+lwClhBbbklGatW3JCceVZUTxZBgNfpKTvHcvFD15n7TS5teKejAaIrzIP/M5p
 PzP8XUdCL/p9654a1t2U7HbK4ZL1S2R6L28/MgsrXfURo4IB8DjxxbbA5HAvu8Cw7DT5
 Oi65xaA1DU6VBYydYtJ9UtFyJNw3n8BocWiBjk0AXbdrgc8huDlw36gKE5+IJT681+Zv
 /YiXdqZ/4NB+NZQIvwU9MbGGSV5XyV2Hsq9z4RunefZFn0wyviAcJbZj8Yyf3ajnwpfd hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrr9902-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 17:01:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8C98100039;
 Wed,  7 Dec 2022 17:01:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2A3023D3EF;
 Wed,  7 Dec 2022 17:01:06 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 17:01:06 +0100
Message-ID: <05c161fa-6b13-b603-cffd-cd89b10465b4@foss.st.com>
Date: Wed, 7 Dec 2022 17:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, <u-boot@lists.denx.de>
References: <20221123152016.27936-1-olivier.moysan@foss.st.com>
 <20221123162012.1.Ifdbb454600c4e2d48e6dde70ff5354e4aaff9c17@changeid>
 <5d8bbc84-a45f-17de-412e-ac83a22b458f@foss.st.com>
In-Reply-To: <5d8bbc84-a45f-17de-412e-ac83a22b458f@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] adc: stm32mp15: split channel init
 into several routines
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



On 12/7/22 16:54, Patrice CHOTARD wrote:
> 
> 
> On 11/23/22 16:20, Olivier Moysan wrote:
>> Split stm32_adc_chan_of_init channel initialization function into
>> several routines to increase readability and prepare channel
>> generic binding handling.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> ---
>>
>>  drivers/adc/stm32-adc.c | 44 +++++++++++++++++++++++++++++++----------
>>  1 file changed, 34 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
>> index ad8d1a32cdba..1250385fbb92 100644
>> --- a/drivers/adc/stm32-adc.c
>> +++ b/drivers/adc/stm32-adc.c
>> @@ -162,12 +162,8 @@ static int stm32_adc_channel_data(struct udevice *dev, int channel,
>>  	return 0;
>>  }
>>  
>> -static int stm32_adc_chan_of_init(struct udevice *dev)
>> +static int stm32_adc_get_legacy_chan_count(struct udevice *dev)
>>  {
>> -	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>> -	struct stm32_adc *adc = dev_get_priv(dev);
>> -	u32 chans[STM32_ADC_CH_MAX];
>> -	unsigned int i, num_channels;
>>  	int ret;
>>  
>>  	/* Retrieve single ended channels listed in device tree */
>> @@ -176,12 +172,16 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
>>  		dev_err(dev, "can't get st,adc-channels: %d\n", ret);
>>  		return ret;
>>  	}
>> -	num_channels = ret / sizeof(u32);
>>  
>> -	if (num_channels > adc->cfg->max_channels) {
>> -		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
>> -		return -EINVAL;
>> -	}
>> +	return (ret / sizeof(u32));
>> +}
>> +
>> +static int stm32_adc_legacy_chan_init(struct udevice *dev, unsigned int num_channels)
>> +{
>> +	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>> +	struct stm32_adc *adc = dev_get_priv(dev);
>> +	u32 chans[STM32_ADC_CH_MAX];
>> +	int i, ret;
>>  
>>  	ret = dev_read_u32_array(dev, "st,adc-channels", chans, num_channels);
>>  	if (ret < 0) {
>> @@ -197,6 +197,30 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
>>  		uc_pdata->channel_mask |= 1 << chans[i];
>>  	}
>>  
>> +	return ret;
>> +}
>> +
>> +static int stm32_adc_chan_of_init(struct udevice *dev)
>> +{
>> +	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>> +	struct stm32_adc *adc = dev_get_priv(dev);
>> +	unsigned int num_channels;
>> +	int ret;
>> +
>> +	ret = stm32_adc_get_legacy_chan_count(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +	num_channels = ret;
>> +
>> +	if (num_channels > adc->cfg->max_channels) {
>> +		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = stm32_adc_legacy_chan_init(dev, num_channels);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>  	uc_pdata->data_mask = (1 << adc->cfg->num_bits) - 1;
>>  	uc_pdata->data_format = ADC_DATA_FORMAT_BIN;
>>  	uc_pdata->data_timeout_us = 100000;
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32


Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
