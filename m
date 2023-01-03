Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5A65C07E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 14:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B9A7C64110;
	Tue,  3 Jan 2023 13:13:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F35F3C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 13:13:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303AaKYL020960; Tue, 3 Jan 2023 14:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Pw6sgsUF2iy6qc7/Zj00fGoGg0d3BLx700gQ1ifOpuU=;
 b=py4kSH4erDsxdQHT8mUENiooEKsLgABlJYRaMLzSLOg1LsUzHD/+ghhJWxRj9+EemaSI
 iIPCsu0MyYG1eSdb1QdbCVPj644dxbbg2kpzyryN7gP006eT8n5jbShspDSA7l8EA4zy
 7QKrKqJEA7OgeGx7P2qi1hQNEEQruXH4yHwPkMyZtTfC+/3HnFoT0wDWkBfJ4AYEDSsz
 rI78GPLlowQaUIEJ4eqDOy2u1vY+SIItg9Xxckt0XlkVMo/qjF5xkYPkYa0K0bjnBObC
 zPa26Zcvj0qLCA7bKVT30Eff7wnmgkzGPbYOzPkdK2ds8UoFNdd0psr0TYVKstOhv4VI AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e59ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 14:13:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F38CA10002A;
 Tue,  3 Jan 2023 14:13:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7B4321ED33;
 Tue,  3 Jan 2023 14:13:18 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 14:13:18 +0100
Message-ID: <f85bb786-8f8f-e6a5-6348-0886853d8b65@foss.st.com>
Date: Tue, 3 Jan 2023 14:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_04,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Heiko Schocher <hs@denx.de>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] env: ubi: add support of command env
 erase
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

Hi Patrick

On 12/14/22 16:51, Patrick Delaunay wrote:
> Add support of opts erase for ubi env backend, this opts is used by
> command 'env erase'.
> 
> This command only zero-fill the env UBI volume CONFIG_ENV_UBI_VOLUME
> and CONFIG_ENV_UBI_VOLUME_REDUND, so the saved environment becomes
> invalid.
> 
> This patch introduces a local define ENV_UBI_VOLUME_REDUND
> only to avoid #if in the code, as CONFIG_ENV_UBI_VOLUME_REDUND
> is only defined when CONFIG_SYS_REDUNDAND_ENVIRONMENT is defined.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/ubi.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/env/ubi.c b/env/ubi.c
> index eb21c4f38b49..445d34fedb89 100644
> --- a/env/ubi.c
> +++ b/env/ubi.c
> @@ -28,6 +28,12 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +#if CONFIG_SYS_REDUNDAND_ENVIRONMENT
> +#define ENV_UBI_VOLUME_REDUND CONFIG_ENV_UBI_VOLUME_REDUND
> +#else
> +#define ENV_UBI_VOLUME_REDUND "invalid"
> +#endif
> +
>  #ifdef CONFIG_CMD_SAVEENV
>  #ifdef CONFIG_SYS_REDUNDAND_ENVIRONMENT
>  static int env_ubi_save(void)
> @@ -177,9 +183,43 @@ static int env_ubi_load(void)
>  }
>  #endif /* CONFIG_SYS_REDUNDAND_ENVIRONMENT */
>  
> +static int env_ubi_erase(void)
> +{
> +	ALLOC_CACHE_ALIGN_BUFFER(char, env_buf, CONFIG_ENV_SIZE);
> +	int ret = 0;
> +
> +	if (ubi_part(CONFIG_ENV_UBI_PART, UBI_VID_OFFSET)) {
> +		printf("\n** Cannot find mtd partition \"%s\"\n",
> +		       CONFIG_ENV_UBI_PART);
> +		return 1;
> +	}
> +
> +	memset(env_buf, 0x0, CONFIG_ENV_SIZE);
> +
> +	if (ubi_volume_write(CONFIG_ENV_UBI_VOLUME,
> +			     (void *)env_buf, CONFIG_ENV_SIZE)) {
> +		printf("\n** Unable to erase env to %s:%s **\n",
> +		       CONFIG_ENV_UBI_PART,
> +		       CONFIG_ENV_UBI_VOLUME);
> +		ret = 1;
> +	}
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT)) {
> +		if (ubi_volume_write(ENV_UBI_VOLUME_REDUND,
> +				     (void *)env_buf, CONFIG_ENV_SIZE)) {
> +			printf("\n** Unable to erase env to %s:%s **\n",
> +			       CONFIG_ENV_UBI_PART,
> +			       ENV_UBI_VOLUME_REDUND);
> +			ret = 1;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  U_BOOT_ENV_LOCATION(ubi) = {
>  	.location	= ENVL_UBI,
>  	ENV_NAME("UBI")
>  	.load		= env_ubi_load,
>  	.save		= env_save_ptr(env_ubi_save),
> +	.erase		= ENV_ERASE_PTR(env_ubi_erase),
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
