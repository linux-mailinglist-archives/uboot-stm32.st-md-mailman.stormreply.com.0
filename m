Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2583C643E23
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:11:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD8E9C65E6E;
	Tue,  6 Dec 2022 08:11:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E1C9C65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:11:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63I0jZ006513; Tue, 6 Dec 2022 09:11:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=URQYDhFUzAoM7ToeTiQg03YefAluHB75D/NjmO4RC9M=;
 b=7Ur+3xsRfSOV4gbLWDSOSbGCRZMbew5HtbZAf300gzQZGgdGyFmWfyOBz3tIfmgBv9Ds
 D+67/S1u182+JY4IU96WsebAVRbwsZ73+KZ1/xaBbfZNdcJ12ac0EYdJLvWRrELwXX76
 xqDzI6dh4oX/mXy38c3AMNeIBn/WfRIrbbiloHC/nbD3MtPH8zYyzQCLMsY8sTXwD7pG
 FosEAz50PunFGw7uGuA7g4k9v8kazoIGt4opBl5/jkiyRtTYXBY5BN6ZzUUUa5HQl1vl
 iLwb4XpCf06Lob7tvCT1vOEBZk8nWinRSK0b/n2kwUXG3OhL/CXyYQIqPqYdQiC+RnjB 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vfeqm57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:11:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2772C10002A;
 Tue,  6 Dec 2022 09:11:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FFCA2132F6;
 Tue,  6 Dec 2022 09:11:37 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:11:36 +0100
Message-ID: <29ef3526-d156-08b6-a57f-a88ccfff7d76@foss.st.com>
Date: Tue, 6 Dec 2022 09:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.6.I6580e1953c9b27a410bc6e6223aa71b118b11672@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.6.I6580e1953c9b27a410bc6e6223aa71b118b11672@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/8] env: mmc: select GPT env partition by
 type guid
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



On 11/10/22 11:49, Patrick Delaunay wrote:
> Since commit c0364ce1c695 ("doc/README.gpt: define partition type GUID for
> U-Boot environment"), a specific type GUID can be used to indicate
> the U-Boot environment partition on the device with GPT partition table.
> 
> This patch uses this type GUID to found the env partition as fallback
> when the partition name property "u-boot,mmc-env-partition" is not present
> in config node or if the indicated partition name is not found.
> 
> The mmc_offset_try_partition() function is reused, it selects the first
> partition with the correct type GUID when the parameter 'str' is NULL.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index 1894b6483220..bd7d51e6b633 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -74,8 +74,18 @@ static inline int mmc_offset_try_partition(const char *str, int copy, s64 *val)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!strncmp((const char *)info.name, str, sizeof(info.name)))
> +		if (str && !strncmp((const char *)info.name, str, sizeof(info.name)))
>  			break;
> +#ifdef CONFIG_PARTITION_TYPE_GUID
> +		if (!str) {
> +			const efi_guid_t env_guid = PARTITION_U_BOOT_ENVIRONMENT;
> +			efi_guid_t type_guid;
> +
> +			uuid_str_to_bin(info.type_guid, type_guid.b, UUID_STR_FORMAT_GUID);
> +			if (!memcmp(&env_guid, &type_guid, sizeof(efi_guid_t)))
> +				break;
> +		}
> +#endif
>  	}
>  
>  	/* round up to info.blksz */
> @@ -112,6 +122,13 @@ static inline s64 mmc_offset(int copy)
>  			return val;
>  	}
>  
> +	/* try the GPT partition with "U-Boot ENV" TYPE GUID */
> +	if (IS_ENABLED(CONFIG_PARTITION_TYPE_GUID)) {
> +		err = mmc_offset_try_partition(NULL, copy, &val);
> +		if (!err)
> +			return val;
> +	}
> +
>  	defvalue = ENV_MMC_OFFSET;
>  	propname = dt_prop.offset;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
