Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1F3AC578
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:56:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6272C3FADC;
	Fri, 18 Jun 2021 07:56:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79720C58D7A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:56:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7rLpi006628; Fri, 18 Jun 2021 09:56:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2lHTBDfrMqAUhdDGPHJctMZ2+8hnB/y627O+cKR5PnU=;
 b=JXx3YTO051f7XER/R7znlWiDn6WLlC2tTmBvUz7xEQ7YfzXf8kiy+9tbdiE6mMV8GAEW
 wWJA4EcUgGC4K8nLbO8Sb8JPVnb97DgMXVbV1a9yXRy4M6LPYU+nixZ9Eylmy4q/nzXc
 ia1D3u01kr3KCO97CgRiymyKhUl70O02OkLoUuxxpuHBlljasMQjmYjpnaHT+YrYuHop
 Sf1RvRdU8R3REIA1wutZ5erhzolYYQErY6rRgn+dFoEM6BZvYhqejQOmb8rTgRPytDPC
 fXVb426xdZGpQeOViSpUSX+po0PUy+hCPC2Ldsp/2yN519aSNZoSbjSXwXT7yC3MuSg3 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3985b756rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:56:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E07D10002A;
 Fri, 18 Jun 2021 09:56:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E9432199B9;
 Fri, 18 Jun 2021 09:56:43 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:56:42 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.9.I36ae186249a121969b9ab6d3a7f62752091cf472@changeid>
 <74fc52e5-33f3-7256-6efe-b8160a1532fd@foss.st.com>
Message-ID: <f4e5e206-cdae-a9b6-1b0e-ccf995018169@foss.st.com>
Date: Fri, 18 Jun 2021 09:56:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <74fc52e5-33f3-7256-6efe-b8160a1532fd@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 09/10] dfu: add error callback
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



On 5/28/21 2:54 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 5/18/21 3:12 PM, Patrick Delaunay wrote:
>> Add error callback in dfu stack to manage some board specific
>> behavior on DFU targets.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/dfu/dfu.c | 12 ++++++++++++
>>  include/dfu.h     | 11 +++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
>> index 213a20e7bc..ff1859d946 100644
>> --- a/drivers/dfu/dfu.c
>> +++ b/drivers/dfu/dfu.c
>> @@ -44,6 +44,14 @@ __weak void dfu_initiated_callback(struct dfu_entity *dfu)
>>  {
>>  }
>>  
>> +/*
>> + * The purpose of the dfu_error_callback() function is to
>> + * provide callback for dfu user
>> + */
>> +__weak void dfu_error_callback(struct dfu_entity *dfu, const char *msg)
>> +{
>> +}
>> +
>>  /*
>>   * The purpose of the dfu_usb_get_reset() function is to
>>   * provide information if after USB_DETACH request
>> @@ -342,6 +350,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
>>  		printf("%s: Wrong sequence number! [%d] [%d]\n",
>>  		       __func__, dfu->i_blk_seq_num, blk_seq_num);
>>  		dfu_transaction_cleanup(dfu);
>> +		dfu_error_callback(dfu, "Wrong sequence number");
>>  		return -1;
>>  	}
>>  
>> @@ -366,6 +375,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
>>  		ret = dfu_write_buffer_drain(dfu);
>>  		if (ret) {
>>  			dfu_transaction_cleanup(dfu);
>> +			dfu_error_callback(dfu, "DFU write error");
>>  			return ret;
>>  		}
>>  	}
>> @@ -375,6 +385,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
>>  		pr_err("Buffer overflow! (0x%p + 0x%x > 0x%p)\n", dfu->i_buf,
>>  		      size, dfu->i_buf_end);
>>  		dfu_transaction_cleanup(dfu);
>> +		dfu_error_callback(dfu, "Buffer overflow");
>>  		return -1;
>>  	}
>>  
>> @@ -386,6 +397,7 @@ int dfu_write(struct dfu_entity *dfu, void *buf, int size, int blk_seq_num)
>>  		ret = dfu_write_buffer_drain(dfu);
>>  		if (ret) {
>>  			dfu_transaction_cleanup(dfu);
>> +			dfu_error_callback(dfu, "DFU write error");
>>  			return ret;
>>  		}
>>  	}
>> diff --git a/include/dfu.h b/include/dfu.h
>> index d18b701728..1963e9ffb9 100644
>> --- a/include/dfu.h
>> +++ b/include/dfu.h
>> @@ -383,6 +383,17 @@ void dfu_initiated_callback(struct dfu_entity *dfu);
>>   */
>>  void dfu_flush_callback(struct dfu_entity *dfu);
>>  
>> +/**
>> + * dfu_error_callback() - weak callback called at the DFU write error
>> + *
>> + * It is a callback function called by DFU stack after DFU write error.
>> + * This function allows to manage some board specific behavior on DFU targets
>> + *
>> + * @dfu:	pointer to the dfu_entity which cause the error
>> + * @msg:	the message of the error
>> + */
>> +void dfu_error_callback(struct dfu_entity *dfu, const char *msg);
>> +
>>  int dfu_transaction_initiate(struct dfu_entity *dfu, bool read);
>>  void dfu_transaction_cleanup(struct dfu_entity *dfu);
>>  
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
