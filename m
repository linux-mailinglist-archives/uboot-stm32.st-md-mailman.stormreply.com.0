Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891D63A557
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Nov 2022 10:46:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF2FC65E59;
	Mon, 28 Nov 2022 09:46:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ED24C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 09:46:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AS8tSGQ006048; Mon, 28 Nov 2022 10:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=efdBS8GVeTnT/4dL/vMGgTPwN+Lq+HyLaZ2hBoni5ys=;
 b=7q08HwRXnV08Uh8oC0CMOHMJW0I0C7B8mJ9ExYxsYrgASw+Q/fR7TOzCuVgvkU/LhZ3m
 qs1HyrNIbjGubdDvrQ7nxZhPReQPBhU55KevM7W+I24yzhIgW0KBxFU4//7qWAvWuLLS
 LJyr2rAHtUR9nWrQtvseeLZzqJUgJP4QO/oEb4Jr9CJ9zDR0zNyGkoQKPPQH1tibDxZW
 X/VRfK3Fwv9bWK2SV/WWQRF8BiIe+ixzeDyYb7ekB+EgD/djkZUhjXI9JzTalMsvAfs2
 KfHTkWDUjunuMo30acam6eefzm80Krv/y6FRqm6wjCw2dRSDzF4vAr8IjfgIG/A8OyDt qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m3ajq9wkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Nov 2022 10:46:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A0B6100039;
 Mon, 28 Nov 2022 10:46:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31FCA216EF5;
 Mon, 28 Nov 2022 10:46:17 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 28 Nov
 2022 10:46:16 +0100
Message-ID: <0a8a6908-c7f2-52a2-45f9-1d71c2646ef5@foss.st.com>
Date: Mon, 28 Nov 2022 10:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, <u-boot@lists.denx.de>
References: <20221123152016.27936-1-olivier.moysan@foss.st.com>
 <20221123162012.2.Ifb433baf31af3661271d98b7c155958aa5f7afdb@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221123162012.2.Ifb433baf31af3661271d98b7c155958aa5f7afdb@changeid>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_07,2022-11-25_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] adc: stm32mp15: add support of
 generic channels binding
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

Hi,

On 11/23/22 16:20, Olivier Moysan wrote:
> Add support of generic IIO channels binding:
> ./devicetree/bindings/iio/adc/adc.yaml
> Keep support of st,adc-channels for backward compatibility.
>
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>
>   drivers/adc/stm32-adc.c | 51 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
> index 1250385fbb92..85efc119dbf1 100644
> --- a/drivers/adc/stm32-adc.c
> +++ b/drivers/adc/stm32-adc.c
> @@ -200,24 +200,63 @@ static int stm32_adc_legacy_chan_init(struct udevice *dev, unsigned int num_chan
>   	return ret;
>   }
>   
> +static int stm32_adc_generic_chan_init(struct udevice *dev, unsigned int num_channels)
> +{
> +	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
> +	struct stm32_adc *adc = dev_get_priv(dev);
> +	ofnode child;
> +	int val, ret;
> +
> +	ofnode_for_each_subnode(child, dev_ofnode(dev)) {
> +		ret = ofnode_read_u32(child, "reg", &val);
> +		if (ret) {
> +			dev_err(dev, "Missing channel index %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (val >= adc->cfg->max_channels) {
> +			dev_err(dev, "Invalid channel %d\n", val);
> +			return -EINVAL;
> +		}
> +
> +		uc_pdata->channel_mask |= 1 << val;
> +	}
> +
> +	return 0;
> +}
> +
>   static int stm32_adc_chan_of_init(struct udevice *dev)
>   {
>   	struct adc_uclass_plat *uc_pdata = dev_get_uclass_plat(dev);
>   	struct stm32_adc *adc = dev_get_priv(dev);
>   	unsigned int num_channels;
>   	int ret;
> -
> -	ret = stm32_adc_get_legacy_chan_count(dev);
> -	if (ret < 0)
> -		return ret;
> -	num_channels = ret;
> +	bool legacy = false;
> +
> +	num_channels = dev_get_child_count(dev);
> +	/* If no channels have been found, fallback to channels legacy properties. */
> +	if (!num_channels) {
> +		legacy = true;
> +
> +		ret = stm32_adc_get_legacy_chan_count(dev);
> +		if (!ret) {
> +			dev_err(dev, "No channel found\n");
> +			return -ENODATA;
> +		} else if (ret < 0) {
> +			return ret;
> +		}
> +		num_channels = ret;
> +	}
>   
>   	if (num_channels > adc->cfg->max_channels) {
>   		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
>   		return -EINVAL;
>   	}
>   
> -	ret = stm32_adc_legacy_chan_init(dev, num_channels);
> +	if (legacy)
> +		ret = stm32_adc_legacy_chan_init(dev, num_channels);
> +	else
> +		ret = stm32_adc_generic_chan_init(dev, num_channels);
>   	if (ret < 0)
>   		return ret;
>   



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
