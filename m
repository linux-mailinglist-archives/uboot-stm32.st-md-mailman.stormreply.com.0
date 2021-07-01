Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDB3B8E3B
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:35:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB5FFC597AA;
	Thu,  1 Jul 2021 07:35:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F12BC59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:35:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617QoPg026223; Thu, 1 Jul 2021 09:35:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JhfIZvZPJ1u4mzQeUkrPRZZ6kvGPlAELevgxQAYVUiQ=;
 b=u3cDCaRfVmS6j282l7GAGspZd6D7SB44Az9xr872ruRJt8jsCMhsLvI1muZ5QhWOrH6P
 9k9nkfVpjgOz7OjsD1d9IgyHOtvGMs64iY6/AsigvuftwvwME9WP0ivSgwHBFj+dr1dr
 /DNIwVxpH+16MUJnx4p5w7Nia0C1MyfQWhDHOkQQQuDBoHfSHy4jk4Oge9O/SwWOoAET
 cqf59hrH+DCXlVW2Ef6UkrHQ8OwMpZm2chM+C3+x4HpU0VfiouSLALDMBFavqCUl5e9H
 LnP/sJQMFGR6SoidPsISlfNbd5jPnG5VfBybb99K/KZa1gKmnG8t7F3c64rhOpFT3T4Q Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj18ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:35:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E467B10002A;
 Thu,  1 Jul 2021 09:35:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAF352138CD;
 Thu,  1 Jul 2021 09:35:42 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:35:42 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.3.Id13cccdd894c43f0df0833fc71e3ff084eb4cc1d@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <ce8699f9-a251-deb5-c9bc-91bebe96e77d@foss.st.com>
Date: Thu, 1 Jul 2021 09:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.3.Id13cccdd894c43f0df0833fc71e3ff084eb4cc1d@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/7] stm32mp: cmd_stm32key: handle error
 in fuse_hash_value
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

On 6/28/21 2:55 PM, Patrick Delaunay wrote:
> Handle errors in fuse_hash_value function.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index d2045a5983..2529139ebc 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -25,7 +25,7 @@ static void read_hash_value(u32 addr)
>  	}
>  }
>  
> -static void fuse_hash_value(u32 addr, bool print)
> +static int fuse_hash_value(u32 addr, bool print)
>  {
>  	struct udevice *dev;
>  	u32 word, val;
> @@ -36,21 +36,25 @@ static void fuse_hash_value(u32 addr, bool print)
>  					  &dev);
>  	if (ret) {
>  		log_err("Can't find stm32mp_bsec driver\n");
> -		return;
> +		return ret;
>  	}
>  
>  	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
> -		if (print)
> -			printf("Fuse OTP %i : %x\n",
> -			       STM32_OTP_HASH_KEY_START + i,
> -			       __be32_to_cpu(*(u32 *)addr));
> -
>  		word = STM32_OTP_HASH_KEY_START + i;
>  		val = __be32_to_cpu(*(u32 *)addr);
> -		misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
> +		if (print)
> +			printf("Fuse OTP %i : %x\n", word, val);
> +
> +		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
> +		if (ret != 4) {
> +			log_err("Fuse OTP %i failed\n", word);
> +			return ret;
> +		}
>  
>  		addr += 4;
>  	}
> +
> +	return 0;
>  }
>  
>  static int confirm_prog(void)
> @@ -104,7 +108,9 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  	if (!yes && !confirm_prog())
>  		return CMD_RET_FAILURE;
>  
> -	fuse_hash_value(addr, !yes);
> +	if (fuse_hash_value(addr, !yes))
> +		return CMD_RET_FAILURE;
> +
>  	printf("Hash key updated !\n");
>  
>  	return CMD_RET_SUCCESS;
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
