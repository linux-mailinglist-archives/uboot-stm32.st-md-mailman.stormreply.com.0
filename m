Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4B5497F1D
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Jan 2022 13:17:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AF0FC5F1D3;
	Mon, 24 Jan 2022 12:17:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78B71C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jan 2022 12:17:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20OBXBOi014327;
 Mon, 24 Jan 2022 13:17:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XRdX8jnI8ICg591DdY/FMfXIEBnrg9lcbPEcqcSTNFg=;
 b=RTMZ8R0roheIFVFOYX4N51IjaXvgbiQK21sxTETWnZeLwkw0Tr2byfOGrbpmGLrHHizP
 mDp2QVwMZUNJdfq8eyRMRvckZfUnYOIVZW+/QKj1pjA7nYTudCjZklOJ2/x157J/fY1U
 Jahuj4QHEY3WuaFfy/eUWRDxXDUt2x5Of4nwdhPnErD0Xa0ZNngwWnnX35OROA6WzQsl
 e9f7Hp0NGN67d1DXou/WtrzZOPy6OlsachmjYoiucbvTNSh+5bfRodofuQ8NHzXETggQ
 BXMsX6KQ9vja/kg4dqe+6yjyYueULViFUXZ9UYcK7XVsNKylLlkcxw2i3t9hjaoIJqsf Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ds9v1kuqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 13:17:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A49D100034;
 Mon, 24 Jan 2022 13:17:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3324F214D23;
 Mon, 24 Jan 2022 13:17:34 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 24 Jan
 2022 13:17:33 +0100
Message-ID: <4a5fe86e-8be5-ab97-ac19-1ce24eea03df@foss.st.com>
Date: Mon, 24 Jan 2022 13:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220111163714.1.Ied2e1c9b4790072658cbab4515ba8933878ce029@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220111163714.1.Ied2e1c9b4790072658cbab4515ba8933878ce029@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_06,2022-01-24_01,2021-12-02_01
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

On 1/11/22 16:37, Patrick Delaunay wrote:
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
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
