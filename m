Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACB66599C
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Jan 2023 12:01:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EDB5C65048;
	Wed, 11 Jan 2023 11:01:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8726C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jan 2023 11:01:51 +0000 (UTC)
Received: from [192.168.1.107] (fibhost-66-247-38.fibernet.hu [85.66.247.38])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 80EEB8539D;
 Wed, 11 Jan 2023 12:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673434911;
 bh=VRhH3f/ONiLdd5Drj+Fd2z81q9V1rhsO/Sfq+CHW/nY=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VN6WuSdSyai18JNDYGxKBoax/feDDw8zhGFevQ3xrM5HVu5zEKQv2dECz9N6exP0s
 /TG0Sb/A5XY3ypbBj0qIBPRENmAW55jamM5DQXYOlDQrVMFf+lZRPX6CiaimznemZH
 myS2afggg9mP34tqd1o/i04fprDnp+3tKXeHInXYsMLFUw1CNP6kXzIiCemV8jOzHR
 4clGvJBO7XCFjEtq1kTiy8tZKGUO9XNdJF14ywYlWP+wcDNhhe5pJXx2Vu2FpYbxPf
 xHOKD7x7QyzxSk8kC5KJKINsi/h418NbHcNi9wuITtwZlNYR3yyn4DHt7ITpFg/rhS
 o+4kb56ch+B0A==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
From: Heiko Schocher <hs@denx.de>
Message-ID: <25f0f075-be68-f20e-3622-555cc0af0f3c@denx.de>
Date: Wed, 11 Jan 2023 12:01:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Patrick,

On 14.12.22 16:51, Patrick Delaunay wrote:
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

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
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
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
