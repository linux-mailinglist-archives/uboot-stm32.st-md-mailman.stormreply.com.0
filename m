Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941F7B7B60
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Oct 2023 11:12:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFEF1C6C831;
	Wed,  4 Oct 2023 09:12:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76D87C6C821
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:12:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3945SsRs022722; Wed, 4 Oct 2023 11:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=4hWpjl9wpVIhXhG9BC1ygffrqze0ycWwQzJ5PXAWv5Y=; b=8D
 TurcFEwAkLoR7FQA1uC0NpO+s67rB5bdptWPnmUHb6BcP0e6t/cFgUSgwDosoWTk
 4nqVSIGn8kznDiWWTsiUgiG8IQNfq1Q+YUZkR/EAyKJhaAZSCn1fFTS6OBm4OW3L
 CtnasjZWaUAtkCKp5nJ0cho+UPZFg9drp/z5HcIKpavQqsquMbl0mVm/IwOuFwr0
 fdr99Za/4IGA6si2L51UVIpCNXPJdP6eT2gR1hv1zb/fYdRqeh86UEWuqPxGELut
 DEqNh2mj5Ueq/2mTcg7nir5bf5cHU4vW0rffl0YVPooIFwEcL0uJiKb5E0QHM53E
 Q0xQKLyFMsSdKE2kxJUQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tggx34khd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Oct 2023 11:12:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 162B610005C;
 Wed,  4 Oct 2023 11:12:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F262222A6D1;
 Wed,  4 Oct 2023 11:11:59 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:11:59 +0200
Message-ID: <e4619de5-27cd-d0d5-ec2d-2accde958dd3@foss.st.com>
Date: Wed, 4 Oct 2023 11:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Harald Seiler <hws@denx.de>, <u-boot@lists.denx.de>
References: <20230927124440.247726-1-hws@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230927124440.247726-1-hws@denx.de>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_01,2023-10-02_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ram: stm32mp1: Only print RAM config
 with CONFIG_SPL_DISPLAY_PRINT
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



On 9/27/23 14:44, Harald Seiler wrote:
> Ensure that the RAM configuration line is only printed when
> CONFIG_SPL_DISPLAY_PRINT is set.
> 
> Signed-off-by: Harald Seiler <hws@denx.de>
> ---
>  drivers/ram/stm32mp1/stm32mp1_ram.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index a6c19af9722..2808d07c3ae 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -126,7 +126,8 @@ static int stm32mp1_ddr_setup(struct udevice *dev)
>  		dev_dbg(dev, "no st,mem-name\n");
>  		return -EINVAL;
>  	}
> -	printf("RAM: %s\n", config.info.name);
> +	if (CONFIG_IS_ENABLED(DISPLAY_PRINT))
> +		printf("RAM: %s\n", config.info.name);
>  
>  	for (idx = 0; idx < ARRAY_SIZE(param); idx++) {
>  		ret = ofnode_read_u32_array(node, param[idx].name,

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
