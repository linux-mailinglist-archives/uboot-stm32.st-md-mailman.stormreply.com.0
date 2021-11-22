Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08033458A19
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:49:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3F3DC5A4FD;
	Mon, 22 Nov 2021 07:48:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55852C597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:48:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM7jCn0008853;
 Mon, 22 Nov 2021 08:48:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i7da7YFLKsTTW05QHjacOY6Ei28Msmy057kkAMJfX/k=;
 b=UgDHmYmlDsM3d77MASX1OJ0lynESM4oDN916E6+GuymW3Pr8UbVg7cYg7t74IrqHbFeL
 mKHv6C1R5wN8QPc4sQj/hMLpKjHwgr65s3vDz6gw1yRO5ngwUeoNoRrClLIT83lfmuYL
 ZwcG9zoz3pjLbF+dOLWRW0b4pIlF4qXaaolGFRy7PV+/XswrBZo2dtwYU0VezLVLZbsl
 TWkV8ZvZ6ROM1uBwzFuErsJEfNUBOLoh3Utxb8ddRTnGM6sIIuNRZkpTPswBR1NxCNJ0
 3vIgvXQcU88aVLGtlESqD+gzPBR09b2aXDgV3NE81xddITW2CShcFKiuNS0bXSNJ22Bc Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cg73g00uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:48:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9011100038;
 Mon, 22 Nov 2021 08:48:56 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A155B217B92;
 Mon, 22 Nov 2021 08:48:56 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:48:56 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153214.1.I1a0a5850a0ac39ae33620ed14822892c394b1a98@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6e6b614b-e4dc-1b96-60b3-3b72a6c71a6e@foss.st.com>
Date: Mon, 22 Nov 2021 08:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115153214.1.I1a0a5850a0ac39ae33620ed14822892c394b1a98@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] stm32mp1: ram: add read valid
	training support
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

On 11/15/21 3:32 PM, Patrick Delaunay wrote:
> Add the read data eye training = training for optimal read valid placement
> (RVTRN) when the built-in calibration is executed for LPDDR2 and LPDDR3.
> 
> This training is supported on the PUBL integrated in the STM32MP15x
> DDR subsystem and it is not required for DDR3.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/ram/stm32mp1/stm32mp1_ddr.c      | 8 ++++++--
>  drivers/ram/stm32mp1/stm32mp1_ddr_regs.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> index 0457166b12..1f8422518b 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
> @@ -826,8 +826,12 @@ start:
>   */
>  
>  /* 10. configure PUBL PIR register to specify which training step to run */
> -	/* warning : RVTRN  is not supported by this PUBL */
> -		stm32mp1_ddrphy_init(priv->phy, DDRPHYC_PIR_QSTRN);
> +		/* RVTRN is excuted only on LPDDR2/LPDDR3 */
> +		if (config->c_reg.mstr & DDRCTRL_MSTR_DDR3)
> +			pir = DDRPHYC_PIR_QSTRN;
> +		else
> +			pir = DDRPHYC_PIR_QSTRN | DDRPHYC_PIR_RVTRN;
> +		stm32mp1_ddrphy_init(priv->phy, pir);
>  
>  /* 11. monitor PUB PGSR.IDONE to poll cpmpletion of training sequence */
>  		ddrphy_idone_wait(priv->phy);
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> index 3c8885a965..ada3087328 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
> @@ -309,6 +309,7 @@ struct stm32mp1_ddrphy {
>  #define DDRPHYC_PIR_DRAMRST			BIT(5)
>  #define DDRPHYC_PIR_DRAMINIT			BIT(6)
>  #define DDRPHYC_PIR_QSTRN			BIT(7)
> +#define DDRPHYC_PIR_RVTRN			BIT(8)
>  #define DDRPHYC_PIR_ICPC			BIT(16)
>  #define DDRPHYC_PIR_ZCALBYP			BIT(30)
>  #define DDRPHYC_PIR_INITSTEPS_MASK		GENMASK(31, 7)
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
