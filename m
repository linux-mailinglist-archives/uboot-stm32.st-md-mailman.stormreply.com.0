Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C9BB16E7C
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Jul 2025 11:23:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6A5CC3F938;
	Thu, 31 Jul 2025 09:23:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6278C3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 09:23:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V8aZ3Q015384;
 Thu, 31 Jul 2025 11:21:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zESnk2Wf1hFREQdddaxzlaE30PBSqBS9IFwb6YAknFk=; b=WxY9uGZPtQWc7YdT
 MxxNCl3Xjk0UGFzfMLKRU0sOUj9MMcLim5L2OEa4Rm9HoizdG5EQtRkKnO24ZQMn
 hp1qWalpOKtYF3QJo1FWt0FB/RNs2q1lLN8GPMpew31vApJzkYT+E2Zy4Cb8vRiJ
 vSFMBJyB0RGkCzfh2ZbN53Wp+ha7eZAxcfo2daKSpHX5nwaFBdwe/hHZLEollpnq
 LnKZBdXGiAktNSEW8qQIF+V6I00oSdoaP9O84boOlN3Aehah3dU85GII6LhcuGCZ
 u9XrN4ARRxAaVTJnRqUlzgi6rclBAKd3YQaiVro5xSh19a20VnUY6OVXiwqL5TIq
 BveB1w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4858k5btkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Jul 2025 11:21:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C4C5840050;
 Thu, 31 Jul 2025 11:21:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 743F65FD453;
 Thu, 31 Jul 2025 11:20:46 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 11:20:46 +0200
Message-ID: <35e447b8-46d0-468e-9681-b4df0c996812@foss.st.com>
Date: Thu, 31 Jul 2025 11:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250730125345.27273-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250730125345.27273-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] reset: stm32: Fix set_clr field
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



On 7/30/25 14:53, Patrice Chotard wrote:
> STM32F4/F7 and H7 series doesn't have a clear reset register, so
> set_clr field must be set to false.
> 
> Fixes: 0994a627c278 ("reset: stm32mp25: add stm32mp25 reset driver")
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/reset/stm32/stm32-reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/stm32/stm32-reset.c b/drivers/reset/stm32/stm32-reset.c
> index 918e81e588f..024f15cb25e 100644
> --- a/drivers/reset/stm32/stm32-reset.c
> +++ b/drivers/reset/stm32/stm32-reset.c
> @@ -19,7 +19,7 @@ static const struct stm32_reset_cfg *stm32_get_reset_line(struct reset_ctl *rese
>  
>  	ptr_line->offset = bank;
>  	ptr_line->bit_idx = offset;
> -	ptr_line->set_clr = true;
> +	ptr_line->set_clr = false;
>  
>  	return ptr_line;
>  }
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
