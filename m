Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50E50B207
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:51:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AF5FC60496;
	Fri, 22 Apr 2022 07:51:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DB2FC60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:51:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M5Up9B031297;
 Fri, 22 Apr 2022 09:51:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Uj4cYgiC9A+TWVmnRAAP8q5EkN24ebH4GB3u6KsjwvE=;
 b=RWAYsjfmcsqAScgzpOvfxCF1FvW96wThAxGwN1gl+X7vcJucwUikBgB83JasQAliW7S+
 nhw+MKzJwtY/4wULKO/ZnqV1keyPFIk30L+pe1kw5S333Tpu7X5KFpkoLElnqwlozbDJ
 vMAQCIGaXYBx/TcqzzYDyWlNTQecfXJ0lejYH9L0kgMpjic1xdNFGoptwDBSEIL0TEBi
 5ITuIA3UUgUPBcAa9Rnsq4yqws3pxcgE3tEZ3aWeNU31A2Tr9GNQ/ldXegD2CktTOaD3
 M+5OpgwBZBo0Vf+yvi3z8rqfRiqpGoQnYmhDPqhiC1XW6aICWYVrHw0YRcymUm5x9iKG pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7jjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:51:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0C7710002A;
 Fri, 22 Apr 2022 09:51:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1C062128CF;
 Fri, 22 Apr 2022 09:51:10 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:51:10 +0200
Message-ID: <48d0500a-b740-c1ac-07a6-2e7c8d9959a7@foss.st.com>
Date: Fri, 22 Apr 2022 09:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Yannick FERTRE <yannick.fertre@foss.st.com>, <u-boot@lists.denx.de>
References: <20220406083742.291491-1-yannick.fertre@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220406083742.291491-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: fix data enable
	polarity
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

HI Yannick

On 4/6/22 10:37, Yannick FERTRE wrote:
> Wrong DISPLAY_FLAGS used to set the data enable polarity.
> 
> Signed-off-by: Yannick FERTRE <yannick.fertre@foss.st.com>
> ---
> 
>  drivers/video/stm32/stm32_ltdc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index e741e74739..9269d4bfb4 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -255,7 +255,7 @@ static void stm32_ltdc_set_mode(struct stm32_ltdc_priv *priv,
>  		val |= GCR_HSPOL;
>  	if (timings->flags & DISPLAY_FLAGS_VSYNC_HIGH)
>  		val |= GCR_VSPOL;
> -	if (timings->flags & DISPLAY_FLAGS_DE_HIGH)
> +	if (timings->flags & DISPLAY_FLAGS_DE_LOW)
>  		val |= GCR_DEPOL;
>  	if (timings->flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
>  		val |= GCR_PCPOL;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
