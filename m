Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA584E9A4
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:41:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2625BCA75C2
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:41:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5444FCA75C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:41:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDal55017770; Fri, 21 Jun 2019 15:41:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=WiVBfwzUdN1bTstaCP30sdClt8aEOXroCz2luyExo0s=;
 b=UB6Un19Ps4O65wkIz7gz52FJnk+m9FRfO1uwlNHApZWxue+qVs2DgCciw+8EgvzelcfG
 uv6ZMmgojon3VBXMddQajVvgwZrHPI78VpsGvYtNVYBwE0sCjsznP/fwm0NYSaVSR+zU
 10S6ONk1154ZOFgGBgRSc7XvVdJFCBPhbpWXNzHICk8q1p2vW5eGEMu6jxeNnldvDynq
 /90LijDgttwvOaRt8+j3DcN38ngpNl9c3bqcJWHvKx4RSvz2mcCbvt5n8cbmVhuBIPPU
 MrA7g0C1prRLwN5z8XDmhLiHTlzl3z2u87Xtghh9N6C/MQDhTpJ9/M5AU1aa/oxiHUKO bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v7rbj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:41:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 801C361;
 Fri, 21 Jun 2019 13:40:46 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 65E302A85;
 Fri, 21 Jun 2019 13:40:46 +0000 (GMT)
Received: from [10.48.0.167] (10.75.127.44) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Jun
 2019 15:40:45 +0200
To: Patrick Delaunay <patrick.delaunay@st.com>, <u-boot@lists.denx.de>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
 <1561123618-2029-6-git-send-email-patrick.delaunay@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <15ce8065-a516-4cd4-ca10-ff215ac8a611@st.com>
Date: Fri, 21 Jun 2019 15:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561123618-2029-6-git-send-email-patrick.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 06/20] adc: stm32-adc: Fix warnings when
 compiling with W=1
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

On 6/21/19 3:26 PM, Patrick Delaunay wrote:
> This patch solves the following warnings:
> 
> drivers/adc/stm32-adc.c: In function 'stm32_adc_chan_of_init':
> warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
>   if (num_channels > adc->cfg->max_channels) {
>                    ^
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Hi Patrick,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> ---
> 
>  drivers/adc/stm32-adc.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/adc/stm32-adc.c b/drivers/adc/stm32-adc.c
> index e108062..029338e 100644
> --- a/drivers/adc/stm32-adc.c
> +++ b/drivers/adc/stm32-adc.c
> @@ -163,15 +163,16 @@ static int stm32_adc_chan_of_init(struct udevice *dev)
>  	struct adc_uclass_platdata *uc_pdata = dev_get_uclass_platdata(dev);
>  	struct stm32_adc *adc = dev_get_priv(dev);
>  	u32 chans[STM32_ADC_CH_MAX];
> -	int i, num_channels, ret;
> +	unsigned int i, num_channels;
> +	int ret;
>  
>  	/* Retrieve single ended channels listed in device tree */
> -	num_channels = dev_read_size(dev, "st,adc-channels");
> -	if (num_channels < 0) {
> -		dev_err(dev, "can't get st,adc-channels: %d\n", num_channels);
> -		return num_channels;
> +	ret = dev_read_size(dev, "st,adc-channels");
> +	if (ret < 0) {
> +		dev_err(dev, "can't get st,adc-channels: %d\n", ret);
> +		return ret;
>  	}
> -	num_channels /= sizeof(u32);
> +	num_channels = ret / sizeof(u32);
>  
>  	if (num_channels > adc->cfg->max_channels) {
>  		dev_err(dev, "too many st,adc-channels: %d\n", num_channels);
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
