Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D63B8E3C
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:35:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02209C597AA;
	Thu,  1 Jul 2021 07:35:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C999EC59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:35:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617RLrU026854; Thu, 1 Jul 2021 09:35:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iaA/vW94Q3Iac7ZTIETLqcawD3EOC5N31+WzkZteOMQ=;
 b=mybHr3pXKh0zRT5yNQ+5E6gfUoBA+IrtrDpMpfalXs2+Ho+8LPnVR8xVpgQxChLwlkJi
 90wWIIyqXgOmtmIwsos4elj5omX28FPC7RbMx9Z4lekRQBYt0xhPoOt4hr2D4XWMhJkJ
 HCa9OYEBu6hzCHXz+qHEj9wIYZwvSEWhplLZwP92dMXFHioad9ANgHOvNoRS7I9XxsDf
 jDlCC4aHm7VIq0++NHcDyM2SQRkeOdA3iUZvflST8yHmAw3QneGWbTTXLDPO5lBU3x6A
 /AVW2zNU+qttnNL8/xUCvxYLgqiGZdZNYpgdPjshI5/t/6lmd94ccRd6kylP7eHQ9AU9 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj190h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:35:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B45FD10002A;
 Thu,  1 Jul 2021 09:35:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9D4B2138CE;
 Thu,  1 Jul 2021 09:35:55 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:35:55 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.4.I8410e2048aae4150e956478327751a71d8124024@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0a0851da-96bb-df4a-6b70-3686ecb15dc2@foss.st.com>
Date: Thu, 1 Jul 2021 09:35:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.4.I8410e2048aae4150e956478327751a71d8124024@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/7] stm32mp: cmd_stm32key: lock of PKH
	OTP after fuse
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

On 6/28/21 2:56 PM, Patrick Delaunay wrote:
> Lock the OTP value of key's hash after the command
> $> stm32key fuse <address>
> 
> This operation forbids a second update of these OTP as they are
> ECC protected in BSEC: any update of these OTP with a different value
> causes a BSEC disturb error and the closed chip will be bricked.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 2529139ebc..c4cb6342fa 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -39,8 +39,9 @@ static int fuse_hash_value(u32 addr, bool print)
>  		return ret;
>  	}
>  
> -	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
> -		word = STM32_OTP_HASH_KEY_START + i;
> +	for (i = 0, word = STM32_OTP_HASH_KEY_START;
> +	     i < STM32_OTP_HASH_KEY_SIZE;
> +	     i++, word++, addr += 4) {
>  		val = __be32_to_cpu(*(u32 *)addr);
>  		if (print)
>  			printf("Fuse OTP %i : %x\n", word, val);
> @@ -50,8 +51,13 @@ static int fuse_hash_value(u32 addr, bool print)
>  			log_err("Fuse OTP %i failed\n", word);
>  			return ret;
>  		}
> -
> -		addr += 4;
> +		/* on success, lock the OTP for HASH key */
> +		val = 1;
> +		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
> +		if (ret != 4) {
> +			log_err("Lock OTP %i failed\n", word);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
