Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C56E4D5C
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Apr 2023 17:35:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8CCBC65E70;
	Mon, 17 Apr 2023 15:35:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFF99C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 15:35:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HEIpKQ019719; Mon, 17 Apr 2023 17:35:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sfeekHgCnwoQB4pgARoYJuD3exz4czNbDHXRVeYwCgo=;
 b=uASTTpDmsuaTfc/Vr9BZwrn6m7Z3CcnX0FFklHu1Gk1DZtGP3CO1QAd7B8SQHfg2aVQ6
 NePF66g/BNAA3qaDHFuQzIhK3d0tnQ/XO7uMoMv5ehsDgrQev9RAg/GTDsAWdBmtL1d6
 1yINCK5T5II8EfetHYjZ4rLjlqlOyiqYkorT+pr/0RPS4sLZNLUBtSZWLgixOFvkZuEU
 r5TZl2wpRyZakpQwItxbepceDjXkxyiCchMcU+wDCadpI/dtDq1kXry+tOR9xVXHFIXj
 PI5uBYIOeWMDF7ksoByU9tcR4aeAxjDeiCxhm+1Qtte6BKyr6qAj+GxR9CbkPYRWdRPn Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1236tv4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 17:35:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 268ED10002A;
 Mon, 17 Apr 2023 17:35:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ED5F22A6C3;
 Mon, 17 Apr 2023 17:35:03 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 17 Apr
 2023 17:35:02 +0200
Message-ID: <385337ff-0b0b-d80e-1238-21a6a76d594b@foss.st.com>
Date: Mon, 17 Apr 2023 17:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_10,2023-04-17_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] configs: stm32mp15: Add
	usb_pgood_delay for ST boards
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 3/16/23 08:03, Patrice Chotard wrote:
> Add usb_pgood_delay to ensure a correct detection of USB devices.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   include/configs/stm32mp15_st_common.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index d0cd4130cec..866cd7a719f 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -9,6 +9,7 @@
>   #define __CONFIG_STM32MP15_ST_COMMON_H__
>   
>   #define STM32MP_BOARD_EXTRA_ENV \
> +	"usb_pgood_delay=2000\0" \
>   	"console=ttySTM0\0"
>   
>   #include <configs/stm32mp15_common.h>




Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
