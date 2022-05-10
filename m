Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD4520EF1
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:45:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1A08C035BD;
	Tue, 10 May 2022 07:45:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8F00C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:45:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A7J9I9015065;
 Tue, 10 May 2022 09:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=A4JQMDpzcxtlu1LH459tTqG28Z+k7VMO+ug6fLDg5PI=;
 b=na+LKlI54F4keBrv8mBrYYVpN6xmfMrnkVlzWyJgbO7PAPifKXygiPW8FPh9qvfqpXbU
 IC1BQ4BOHJbPy3Y94jkAs2mo11R0nv7Y1VBfwn67ummhl1lPtm03Y8OZ0cRQymH+UmvQ
 AupLRtuWYxL0857S5/8W166KiAmEfMIbVaZ4sJmLhX9fwh6VDW62+IVzX22VWn8rHoYI
 YC6yyDjnicnc3GfLTTEP7cejixxBmUAW6how0hAdLW/L08SriW/v6D9DtPXPKqzITJzo
 aU1f6tgXvBkpPNSwyrVvqJoYSVBbc3FWNGnK2WxKO1lPa0c1aqbHenTPgLYQaWIKMyPJ wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40x8ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:45:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24DBA10002A;
 Tue, 10 May 2022 09:45:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 135072128D4;
 Tue, 10 May 2022 09:45:10 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:45:09 +0200
Message-ID: <4b8ad7c2-06f4-8d70-3a94-ae801188ecae@foss.st.com>
Date: Tue, 10 May 2022 09:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.3.Idf10564d4e488df57f60640bbe1f8a43e200b56f@changeid>
 <a212a76a-3042-7f55-c7e6-0c2e6ca74319@foss.st.com>
In-Reply-To: <a212a76a-3042-7f55-c7e6-0c2e6ca74319@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] clk: stm32mp: handle ck_usbo_48m
 clock provided by USBPHYC
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



On 5/6/22 16:26, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 4/26/22 14:37, Patrick Delaunay wrote:
>> Handle the input clock of RCC USB_PHY_48, provided by USBPHYC
>> and named "ck_usbo_48m".
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/clk/clk_stm32mp1.c | 35 ++++++++++++++++++++---------------
>>  1 file changed, 20 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
>> index 83ab6b728e..a02921c43a 100644
>> --- a/drivers/clk/clk_stm32mp1.c
>> +++ b/drivers/clk/clk_stm32mp1.c
>> @@ -962,6 +962,24 @@ static ulong stm32mp1_read_pll_freq(struct stm32mp1_clk_priv *priv,
>>  	return dfout;
>>  }
>>  
>> +static ulong stm32mp1_clk_get_by_name(const char *name)
>> +{
>> +	struct clk clk;
>> +	struct udevice *dev = NULL;
>> +	ulong clock = 0;
>> +
>> +	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
>> +		if (clk_request(dev, &clk)) {
>> +			log_err("%s request", name);
>> +		} else {
>> +			clk.id = 0;
>> +			clock = clk_get_rate(&clk);
>> +		}
>> +	}
>> +
>> +	return clock;
>> +}
>> +
>>  static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>>  {
>>  	u32 reg;
>> @@ -1127,24 +1145,11 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>>  		break;
>>  	/* other */
>>  	case _USB_PHY_48:
>> -		clock = 48000000;
>> +		clock = stm32mp1_clk_get_by_name("ck_usbo_48m");
>>  		break;
>>  	case _DSI_PHY:
>> -	{
>> -		struct clk clk;
>> -		struct udevice *dev = NULL;
>> -
>> -		if (!uclass_get_device_by_name(UCLASS_CLK, "ck_dsi_phy",
>> -					       &dev)) {
>> -			if (clk_request(dev, &clk)) {
>> -				log_err("ck_dsi_phy request");
>> -			} else {
>> -				clk.id = 0;
>> -				clock = clk_get_rate(&clk);
>> -			}
>> -		}
>> +		clock = stm32mp1_clk_get_by_name("ck_dsi_phy");
>>  		break;
>> -	}
>>  	default:
>>  		break;
>>  	}
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
