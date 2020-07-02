Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC41211CF7
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:28:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D73CC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:28:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D0CDC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:28:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627JIxb012520; Thu, 2 Jul 2020 09:28:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nuGLkcxw8LYymdfLw5khoZrp9LoUCbXNe1HqXUvfkFg=;
 b=VlRQyzmI9sA5XZW6l8tiVh7Uey0KO0xncrWQyreecLdBRSnZpisftfemDfx0g60P7LLH
 q/VOvMTdOCYx7Pvnhe9bba4Rlwl8EW+gxA0J5BgTOkfFryF+5mvIUkaBrfCEi4IvUuTh
 236FWBqklMXeVAp8FY9X3z5m1uzSFT1b3tfBy1iG53GVaBkFo57wS7/lO/Rh1h1jnb5C
 9NUe91t4ufnmEDJYmJgSsmde4sp+gyNFKOkDUga5gJwj0tiT6LrE8BVZ1qUh9Ph+mSap
 dgWPSzo8sV8y99NI1FNOcUilLpUbHa5RiLh69qX2L0JS5kyt/sVV1TYaQ25b6t6gqaxm Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89xwq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:28:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B71410002A;
 Thu,  2 Jul 2020 09:28:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F5A121E664;
 Thu,  2 Jul 2020 09:28:03 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:28:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:28:03 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] power: regulator: stm32: vrefbuf: fix a possible
 overshoot when re-enabling
Thread-Index: AQHWQJU0rIJpHME51kGCwKSEman8T6jz4fEA
Date: Thu, 2 Jul 2020 07:28:03 +0000
Message-ID: <aa5afa7c-b299-6e0d-25b5-5720f8c80d2a@st.com>
References: <20200612104052.1.Idb6dab984884f50e47f061ac36fa89da760babd4@changeid>
In-Reply-To: <20200612104052.1.Idb6dab984884f50e47f061ac36fa89da760babd4@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <360D5ABA496FF94B951E646821CB7B81@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] power: regulator: stm32: vrefbuf: fix a
 possible overshoot when re-enabling
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

On 6/12/20 10:40 AM, Patrick Delaunay wrote:
> From: Fabrice Gasnier <fabrice.gasnier@st.com>
>
> There maybe an overshoot:
> - when disabling, then re-enabling vrefbuf too quickly
> - or upon platform reset as external capacitor maybe slow
>   discharging (VREFBUF is HiZ at reset by default).
> VREFBUF is used by ADC/DAC on some boards. An overshoot on the reference
> voltage make the conversions inaccurate for a short period of time. So:
> - Don't put the VREFBUF in HiZ when disabling, to force an active
>   discharge.
> - Enforce a 1ms OFF/ON delay, also upon reset
>
> Penalty is a 1ms delay is applied (even for a cold boot), when enabling
> VREFBUF.
>
> Fixes: 93cf0ae7758d ("power: regulator: Add support for stm32-vrefbuf")
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/power/regulator/stm32-vrefbuf.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/power/regulator/stm32-vrefbuf.c b/drivers/power/regulator/stm32-vrefbuf.c
> index 250773514f..92136961c2 100644
> --- a/drivers/power/regulator/stm32-vrefbuf.c
> +++ b/drivers/power/regulator/stm32-vrefbuf.c
> @@ -43,8 +43,20 @@ static int stm32_vrefbuf_set_enable(struct udevice *dev, bool enable)
>  	u32 val;
>  	int ret;
>  
> -	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ | STM32_ENVR,
> -			enable ? STM32_ENVR : STM32_HIZ);
> +	if (enable && !(readl(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR)) {
> +		/*
> +		 * There maybe an overshoot:
> +		 * - when disabling, then re-enabling vrefbuf too quickly
> +		 * - or upon platform reset as external capacitor maybe slow
> +		 *   discharging (VREFBUF is HiZ at reset by default).
> +		 * So force active discharge (HiZ=0) for 1ms before enabling.
> +		 */
> +		clrbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ);
> +		udelay(1000);
> +	}
> +
> +	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_ENVR,
> +			enable ? STM32_ENVR : 0);
>  	if (!enable)
>  		return 0;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
