Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A04C0E3E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Feb 2022 09:28:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552DCC5C842;
	Wed, 23 Feb 2022 08:28:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64137C5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 08:28:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21N76BKe026473;
 Wed, 23 Feb 2022 09:28:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=609w7T0+0VhlXQW4E90GLUjPzqY+mYD02b0iPrtsrT4=;
 b=GYvVJnxuSXC3hAD/AZ0Tu4ZiUJbnL4jbg5qBIGBC+xXe2+iCn2oBXAFyrrctFmSRnerc
 v8Uqej+1TSngGJufrw/Oxk1AvTuG9Lzdm8YvKb6sncHFdJrBHnsnIFqfvedqmvKvWNXJ
 L7+oWe/csrXmL4RkeBM97bMEGfbiFGmX5LHxG7vuJ+a7YesVyenzngiG2Txyz8omb4Rw
 o5HSAXP2xuwvEQqVl0/Gbi0rnWlX6lxZGufdajrvcmtFoUcH9X3c1WwtBuDQoN9bpX96
 iBiuoojzNnBGzhxG+72/6xlM9BZwdINZvRQyBxMD1Ymxrg7xdNdbkJvBJ3mnSjwCpKGz Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3edg84gfyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 09:28:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40D61100034;
 Wed, 23 Feb 2022 09:28:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 377F4216ECE;
 Wed, 23 Feb 2022 09:28:48 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 23 Feb
 2022 09:28:47 +0100
Message-ID: <4e8e96a1-0d80-8213-4723-501112c10b89@foss.st.com>
Date: Wed, 23 Feb 2022 09:28:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
 <20220215160841.2.Ie699b8bb03dfaa3eb5b4e175c0cb5f80fe05a507@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220215160841.2.Ie699b8bb03dfaa3eb5b4e175c0cb5f80fe05a507@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_03,2022-02-21_02,2021-12-02_01
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

Hi Patrick

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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
