Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8801394304
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:54:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E5BCC5718D;
	Fri, 28 May 2021 12:54:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FF97C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:54:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqLq0013199; Fri, 28 May 2021 14:54:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=V6wMqNpfGOizvrl26wPq81ladopo/Zd1XUMOIrESHWA=;
 b=UPhKy3RIgZfh4d9kVavbo3Wgdb3UaFpGzMuNy76eraT0+SHqVG6yXPWjDbC22OytDJb0
 5YiCuX6HqPCn2+AIzfG/os5DhogclsvHWmfxShsHspbleC1Ys2ZPUL0I+syuTf8ZHlCZ
 G/Kw3YMzbHZ4TEUomZ6pwcPNk/wr6ZB/qQ9SrrMVD5b5mz9fPt528rM+uygnIzBWcFtn
 6y9BJ8CuUMijRIbj8t2woD9gxTGS9wmwyLTq5FUr6m1B0mK6XsxoZua5z/6sKz/juu+j
 IaLM0zzQ6l22J4ujOAzuM2mSXb3/kH6F2LUzQwhnlHYGMj9SkWnPnayaIoq/zCGiEnvI sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38tsq0jht8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:54:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 660F210002A;
 Fri, 28 May 2021 14:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A7242291B2;
 Fri, 28 May 2021 14:54:09 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:54:08 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.6.Id5ec1c084e307f296256a9764772f23492ee4766@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f3155f93-f2ba-de1f-da12-5cdb8926ff0c@foss.st.com>
Date: Fri, 28 May 2021 14:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.6.Id5ec1c084e307f296256a9764772f23492ee4766@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] stm32mp: stm32prog: correctly
	handle DM_PMIC
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

On 5/18/21 3:12 PM, Patrick Delaunay wrote:
> Correctly handle number of alternate when DM_PMIC is not activated.
> This patch remove the last UNKNOWN partition in this case.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index ea69d5dd16..ab687c272d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1150,7 +1150,10 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  	struct dfu_entity *dfu;
>  	int alt_nb;
>  
> -	alt_nb = 3; /* number of virtual = CMD, OTP, PMIC*/
> +	alt_nb = 2; /* number of virtual = CMD, OTP*/
> +	if (CONFIG_IS_ENABLED(DM_PMIC))
> +		alt_nb++; /* PMIC NVMEM*/
> +
>  	if (data->part_nb == 0)
>  		alt_nb++;  /* +1 for FlashLayout */
>  	else
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
