Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 909704264D1
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:44:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59246C597B3;
	Fri,  8 Oct 2021 06:44:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DA2FC597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:44:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZPtO020890; 
 Fri, 8 Oct 2021 08:44:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CYE60RypRGOi1n54dvbiN11FnhVt4tzsdeduzlpCYcY=;
 b=h5PXb1yPga7gFfT02XojsX6vffTVu2/F3aFWw8Eaxw9esVufKVKA7mgIcgqW4F50BPun
 3q8feTIWfRSEf73IPFcGH5oPu+zvYIToBSQTZnppWNcqfgM5AtMV4qSYlR+H2LmjB5uq
 bFepe3DvpBj+lGOjyLAE7DVE2xxT7j5F9TD36D+vIK6mX7Lyd0AFPOft2Coj1iFBEz9i
 CmKH1YzvtoD+zBAgGB+moz5w/C/f7RCPRCaCwCmyQV8KUUsfP6Y1YsqKfLxtT+Lx76gP
 ccYCye5JiawQ5rF0uvIKU27xjkuzI9OmsGbZdFt3n9eYXjdmozkDxOCYwsFhX3TWIK7S eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbjshq9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:44:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BA3110002A;
 Fri,  8 Oct 2021 08:44:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 622432052C7;
 Fri,  8 Oct 2021 08:44:18 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:44:17 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-7-patrice.chotard@foss.st.com>
 <f32055ac-0734-22aa-6dda-ef7a79c1db6a@foss.st.com>
Message-ID: <0919273e-ad77-aabf-bad3-14cc276162d3@foss.st.com>
Date: Fri, 8 Oct 2021 08:44:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f32055ac-0734-22aa-6dda-ef7a79c1db6a@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 6/7] i2c: stm32f7: add support for DNF
 i2c-digital-filter binding
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

HI

On 10/8/21 8:44 AM, Patrice CHOTARD wrote:
> Hi
> 
> On 8/3/21 12:05 PM, Patrice Chotard wrote:
>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> Add the support for the i2c-digital-filter binding, allowing to enable
>> the digital filter via the device-tree and indicate its value in the DT
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>
>>  drivers/i2c/stm32f7_i2c.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
>> index 7e6c65fadc..2b2dae67a3 100644
>> --- a/drivers/i2c/stm32f7_i2c.c
>> +++ b/drivers/i2c/stm32f7_i2c.c
>> @@ -107,7 +107,6 @@ struct stm32_i2c_regs {
>>  
>>  #define STM32_I2C_MAX_LEN			0xff
>>  
>> -#define STM32_I2C_DNF_DEFAULT			0
>>  #define STM32_I2C_DNF_MAX			15
>>  
>>  #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
>> @@ -204,6 +203,7 @@ struct stm32_i2c_timings {
>>   * @regmap_sreg: register address for setting Fast Mode Plus bits
>>   * @regmap_creg: register address for clearing Fast Mode Plus bits
>>   * @regmap_mask: mask for Fast Mode Plus bits
>> + * @dnf_dt: value of digital filter requested via dt
>>   */
>>  struct stm32_i2c_priv {
>>  	struct stm32_i2c_regs *regs;
>> @@ -214,6 +214,7 @@ struct stm32_i2c_priv {
>>  	u32 regmap_sreg;
>>  	u32 regmap_creg;
>>  	u32 regmap_mask;
>> +	u32 dnf_dt;
>>  };
>>  
>>  static const struct stm32_i2c_spec i2c_specs[] = {
>> @@ -684,6 +685,7 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
>>  	const struct stm32_i2c_spec *specs;
>>  	struct stm32_i2c_timings *v, *_v;
>>  	struct list_head solutions;
>> +	u32 i2cclk = DIV_ROUND_CLOSEST(STM32_NSEC_PER_SEC, setup->clock_src);
>>  	int ret;
>>  
>>  	specs = get_specs(setup->speed_freq);
>> @@ -701,6 +703,8 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
>>  		return -EINVAL;
>>  	}
>>  
>> +	/*  Analog and Digital Filters */
>> +	setup->dnf = DIV_ROUND_CLOSEST(i2c_priv->dnf_dt, i2cclk);
>>  	if (setup->dnf > STM32_I2C_DNF_MAX) {
>>  		log_err("DNF out of bound %d/%d\n",
>>  			setup->dnf, STM32_I2C_DNF_MAX);
>> @@ -923,7 +927,10 @@ static int stm32_of_to_plat(struct udevice *dev)
>>  	fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
>>  					 STM32_I2C_FALL_TIME_DEFAULT);
>>  
>> -	i2c_priv->setup.dnf = STM32_I2C_DNF_DEFAULT;
>> +	i2c_priv->dnf_dt = dev_read_u32_default(dev, "i2c-digital-filter-width-ns", 0);
>> +	if (!dev_read_bool(dev, "i2c-digital-filter"))
>> +		i2c_priv->dnf_dt = 0;
>> +
>>  	i2c_priv->setup.analog_filter = dev_read_bool(dev, "i2c-analog-filter");
>>  
>>  	/* Optional */
>>
> Applied on u-boot-stm32 for next
> Thanks
> Patrice
> 
Applied on u-boot-stm32 for next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
