Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7B1ADD6B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 14:38:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B72C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 12:38:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F8DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 12:38:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HCbKV4032507; Fri, 17 Apr 2020 14:38:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Oinkp/xH0xeAtsxcE8Xyn3Vewr2mqF+pzRkEkH6KPeE=;
 b=h7J0JPeaQl9RXvU05tVSBAAR2aFgtXlOs36Ul5dJbDSZzCB8ro1ModcwSUnRp0Y4U+G8
 R0oZDLwoT1/Iz1k0pYuv2CGAIKrxol9IJc9wmPfk565srz1Zl5dFcOpMycgITQdKoeBj
 mBpbQBCUGg27Uz5tjdnHv3pfVrx7HEz/vGkGITl9HCA3bBJCsXdEXOsMI7PBiqrXR1R8
 Lvl4jgOwcTwNDWJvIooJloAI8DKwymthXf5Z+nFJglPsQMeQ1s6aN0O+zCYmh59CFGOD
 LkgphFmetYQXhDthFdm3FWaXI+7ZjH+dj9Yv7THjUVcbfLA28YUVgYjTxW4owUeiqnym fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6t9h26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 14:38:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7320910002A;
 Fri, 17 Apr 2020 14:38:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 669E92B1893;
 Fri, 17 Apr 2020 14:38:02 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Apr
 2020 14:38:02 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Apr 2020 14:38:01 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 3/3] env: mmc: add redundancy support in
 mmc_offset_try_partition
Thread-Index: AQHWFLUIiHG6hadFLEa4bmngJkNR1Q==
Date: Fri, 17 Apr 2020 12:38:01 +0000
Message-ID: <84043920-998b-b786-d536-d32c599f1968@st.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
 <20200319105917.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
In-Reply-To: <20200319105917.3.I3f39ef337e2318d7c857e0458d5bc66e374dfaba@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9A0068A9500A8645970440D902901909@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_03:2020-04-17,
 2020-04-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/3] env: mmc: add redundancy support in
 mmc_offset_try_partition
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

Hi

On 3/19/20 10:59 AM, Patrick Delaunay wrote:
> Manage 2 copy at the end of the partition selected by config
> "u-boot,mmc-env-partition" to save the U-Boot environment,
> with CONFIG_ENV_SIZE and 2*CONFIG_ENV_SIZE offset.
>
> This patch allows to support redundancy (CONFIG_ENV_OFFSET_REDUND).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  env/mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/env/mmc.c b/env/mmc.c
> index c24b169f3e..677a3d4668 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -34,7 +34,7 @@ __weak int mmc_get_env_dev(void)
>  }
>  
>  #if CONFIG_IS_ENABLED(OF_CONTROL)
> -static inline int mmc_offset_try_partition(const char *str, s64 *val)
> +static inline int mmc_offset_try_partition(const char *str, int copy, s64 *val)
>  {
>  	disk_partition_t info;
>  	struct blk_desc *desc;
> @@ -59,7 +59,7 @@ static inline int mmc_offset_try_partition(const char *str, s64 *val)
>  	len = DIV_ROUND_UP(CONFIG_ENV_SIZE, info.blksz);
>  
>  	/* use the top of the partion for the environment */
> -	*val = (info.start + info.size - len) * info.blksz;
> +	*val = (info.start + info.size - (1 + copy) * len) * info.blksz;
>  
>  	return 0;
>  }
> @@ -84,7 +84,7 @@ static inline s64 mmc_offset(int copy)
>  	str = fdtdec_get_config_string(gd->fdt_blob, dt_prop.partition);
>  	if (str) {
>  		/* try to place the environment at end of the partition */
> -		err = mmc_offset_try_partition(str, &val);
> +		err = mmc_offset_try_partition(str, copy, &val);
>  		if (!err)
>  			return val;
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
