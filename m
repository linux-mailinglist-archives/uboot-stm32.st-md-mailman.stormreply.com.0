Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCD4D95D0
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Mar 2022 09:00:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C26C60467;
	Tue, 15 Mar 2022 08:00:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01BB0C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Mar 2022 08:00:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22F4Jc2G013011;
 Tue, 15 Mar 2022 09:00:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=my8LlJzQcDaBnLUpihNEo4K5xL2jHiwEimo616UFG6o=;
 b=I2F/tFHlqF7qaU+26db/dDJVsyK+4g8u8ueaisi0oYS2oPXgtBbOaKAkikaWAkZ14Kwo
 qQWJUCilpaC1DW1F3Swx6GfY2LwJWBucsTtB8PvrO/Oi83gYqc89OwBno/SFss22hF+q
 BX1kVflNYOEKwY+8kUG8+HHjN2sMxCehLxt5xj12imYw7eWhVPWAOSKaePWVmS9HNFEH
 r5mzHv6nHSatjh1k1cEkZ0SOu1MPOabV0hRdj0Fy5TvOifPXxLA6cQh52n//3RmAMQ3w
 pSQjIi5osbxVc9QiN4pLIyeM5oC9Ej6N7hNQn6p8kFz/4DkDnmH0DQOVcXjlCB4iXJhx wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3et63h4qy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 09:00:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B94C910002A;
 Tue, 15 Mar 2022 09:00:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2B7D2128AF;
 Tue, 15 Mar 2022 09:00:33 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 15 Mar
 2022 09:00:33 +0100
Message-ID: <b6cb7cac-66b0-9007-9a62-27a9327690dd@foss.st.com>
Date: Tue, 15 Mar 2022 09:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
 <20220215160841.2.Ie699b8bb03dfaa3eb5b4e175c0cb5f80fe05a507@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220215160841.2.Ie699b8bb03dfaa3eb5b4e175c0cb5f80fe05a507@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] stm32mp1: bsec: add missing dev in
	function comment
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

Hi PAtrick

On 2/15/22 16:08, Patrick Delaunay wrote:
> Add the missing @dev reference in some function description.
> 
> Fixes: b66bfdf238b9 ("arm: stm32mp: bsec: migrate trace to log macro")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/bsec.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index fd6e1a3957..506caa0a31 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -167,6 +167,7 @@ static int bsec_power_safmem(u32 base, bool power)
>  
>  /**
>   * bsec_shadow_register() - copy safmen otp to bsec data
> + * @dev: bsec IP device
>   * @base: base address of bsec IP
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
>   * Return: 0 if no error
> @@ -210,6 +211,7 @@ static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
>  
>  /**
>   * bsec_read_shadow() - read an otp data value from shadow
> + * @dev: bsec IP device
>   * @base: base address of bsec IP
>   * @val: read value
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
> @@ -224,6 +226,7 @@ static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
>  
>  /**
>   * bsec_write_shadow() - write value in BSEC data register in shadow
> + * @dev: bsec IP device
>   * @base: base address of bsec IP
>   * @val: value to write
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
> @@ -242,6 +245,7 @@ static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
>  
>  /**
>   * bsec_program_otp() - program a bit in SAFMEM
> + * @dev: bsec IP device
>   * @base: base address of bsec IP
>   * @val: value to program
>   * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
