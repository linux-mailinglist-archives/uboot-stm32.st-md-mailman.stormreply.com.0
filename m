Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD848EBBC
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Jan 2022 15:35:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 602D0C5E2C1;
	Fri, 14 Jan 2022 14:35:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28ABEC5E2AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 14:35:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20EAup0P006860;
 Fri, 14 Jan 2022 15:35:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1NxdYwUbsCRG4skkaq2qntG9Jtn92A021AenWax1Lmg=;
 b=sRlgtyBYP/bn1XuVy+IldKy0XgyLg8ICwfAUn5qpARgHHxmKevPJfOuGBJKHuXDOpQVM
 KKLJwcAKTWbxmlZsFCUEwikX5CNCgy3EjPrlCznWCcbQSIxC44VPW8CsbEouZ6Wr/CXi
 N5Aa5dJQsqjOS0BcIFtD5gXUn3Q9LpDG7GdrBj9S2LeA2JffiYVUC9oVpOSxdzXqvuYm
 sg60Nzvhb6GdiA/yHmJvIIYd3th/UxKnwp+E6eB3lSRbJmInyySZZOBNL1qKiqYTRDUu
 mit1mkpsEtydfmE4ayXkh1djgOVLRVFXLEQC2fQ2IMu2bekWhrYU3Fl8vTloHN+oUmqr GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk3vyjm9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 15:35:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E459C10002A;
 Fri, 14 Jan 2022 15:35:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC33C216A6A;
 Fri, 14 Jan 2022 15:35:22 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 15:35:22 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220111163714.1.Ied2e1c9b4790072658cbab4515ba8933878ce029@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <63e0ac90-575b-c95b-8d17-0e1719791bf7@foss.st.com>
Date: Fri, 14 Jan 2022 15:35:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111163714.1.Ied2e1c9b4790072658cbab4515ba8933878ce029@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_05,2022-01-14_01,2021-12-02_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: solve compilation issue
 when ENV_IS_IN_MMC is deactivated
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

On 1/11/22 4:37 PM, Patrick Delaunay wrote:
> Solve compilation issue on undefined CONFIG_SYS_MMC_ENV_DEV when
> CONFIG_ENV_IS_IN_MMC is deactivated on STMicroelectronics boards
> defconfig
> 
> Fixes: 9f97193616f1 ("board: stm32mp1: use CONFIG_SYS_MMC_ENV_DEV when available")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 45f2ca81a6..fff1880e5b 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -890,8 +890,10 @@ const char *env_ext4_get_dev_part(void)
>  
>  int mmc_get_env_dev(void)
>  {
> -	if (CONFIG_SYS_MMC_ENV_DEV >= 0)
> -		return CONFIG_SYS_MMC_ENV_DEV;
> +	const int mmc_env_dev = CONFIG_IS_ENABLED(ENV_IS_IN_MMC, (CONFIG_SYS_MMC_ENV_DEV), (-1));
> +
> +	if (mmc_env_dev >= 0)
> +		return mmc_env_dev;
>  
>  	/* use boot instance to select the correct mmc device identifier */
>  	return mmc_get_boot();
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
