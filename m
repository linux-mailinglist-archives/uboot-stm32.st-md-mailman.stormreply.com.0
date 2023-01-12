Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D4667036
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 11:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CEC3C640EE;
	Thu, 12 Jan 2023 10:53:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6D1BC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 10:53:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30C80WZA003553; Thu, 12 Jan 2023 11:53:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RMRhbPVCWD1Egpfrk0uEStofVTXH1YvJgSL80DG0tYI=;
 b=cFaHV6j4dReE2176iqUar0khad4MPt3qjpt+6nRfG7ptaxpLBlviezDumrUFusczXf+Y
 eL7eAvRaKlY0V9dp0Dd75ng7O7u2lQFPsdDgni02HHVr032F+CE/7whz3f37BtZxrmoU
 eKX2Dht5ftq67o5dMtrJ5XvOFxscNCK5NYDSJJBPNhaycpyfWdP6OPloqk4nuxcQLHMY
 nn+AMP+bCphwnpr4O8ve7faT3lFZn2DwRrdtuSV0TAzPS4i+nUtVRgUkedR47uRvSeZ8
 +5B30BzzlJQXN9Pk3eVwc9y/5abp2xxaRyZIcM7P4y0yWoRIubmESzz8utOnD7Z1SUc1 qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n1k64j8n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 11:53:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10CC010002A;
 Thu, 12 Jan 2023 11:53:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B9E2214D06;
 Thu, 12 Jan 2023 11:53:24 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 12 Jan
 2023 11:53:23 +0100
Message-ID: <df4656d0-f129-e893-d247-104771fb9951@foss.st.com>
Date: Thu, 12 Jan 2023 11:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
 <20230106131952.1.Id87d79fb5d89d09c18a30daf4e27b1c78f2ea268@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230106131952.1.Id87d79fb5d89d09c18a30daf4e27b1c78f2ea268@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_06,2023-01-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/6] stm32mp: cosmetic: Update of bsec
	driver
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

On 1/6/23 13:20, Patrick Delaunay wrote:
> Remove unnecessary return in stm32mp_bsec_write_lock and replace tab
> by space for plat_auto opts.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index c00130b08b36..51ccff9aa560 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -468,8 +468,6 @@ static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
>  	plat = dev_get_plat(dev);
>  
>  	return bsec_permanent_lock_otp(dev, plat->base, otp);
> -
> -	return -EINVAL;
>  }
>  
>  static int stm32mp_bsec_read(struct udevice *dev, int offset,
> @@ -608,7 +606,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
>  	.id = UCLASS_MISC,
>  	.of_match = stm32mp_bsec_ids,
>  	.of_to_plat = stm32mp_bsec_of_to_plat,
> -	.plat_auto	= sizeof(struct stm32mp_bsec_plat),
> +	.plat_auto = sizeof(struct stm32mp_bsec_plat),
>  	.ops = &stm32mp_bsec_ops,
>  	.probe = stm32mp_bsec_probe,
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
