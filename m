Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EA1A7B8F
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 14:59:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B626C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 12:59:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3764C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 12:59:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ECqtqR013836; Tue, 14 Apr 2020 14:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DzxMLW8kYCRyuTIarxmgDU0R/FjmSjHF9C1vhwRzj8c=;
 b=Y8I2NW8fDK4GTcHL7D61NyeiWld//pYgCvixNow7O3Xm44IdxvaVXOCt+WUpp4X1/syo
 C69mizFIwX5nhbIcasB4qZfE4JM4qBBisav4s0AIwUEOy2g5KC2M7x1sEtPdu2dsRH6u
 bffgCggwNyCEzvtlll/Lm1MM9+oR3Hz7Vyt/TLNDiwhm41kJhNOo7yjOU9LfXctQFB+r
 3RPwGbW//He1VXXACywXjujHxq+L6WVYM0rjfbd8ppyN7ACvjfNBtoHACzvf5Z3HuCyO
 RMRR7ohldryPfa1KV1U3ZykawR5JDDFg8lQvZNUZa0A11PpSp4XnKx0UZPSPi61gCuOy Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5n0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 14:59:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D950A10002A;
 Tue, 14 Apr 2020 14:59:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE2CA2B0FB0;
 Tue, 14 Apr 2020 14:59:45 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 14:59:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 14:59:45 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/18] stm32mp: add function get_cpu_dev
Thread-Index: AQHV/P68ZjJ/3s0XQkCz1jsoXWM8eqh4nZ4A
Date: Tue, 14 Apr 2020 12:59:45 +0000
Message-ID: <c744a150-8f11-341a-c825-c13ac246cd39@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-4-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <49A82F32A6D11B4BB0EBF73944F069CC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/18] stm32mp: add function get_cpu_dev
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

Hi

On 3/18/20 9:24 AM, Patrick Delaunay wrote:
> Add a function get_cpu_dev to get the DEV_ID present
> in DBGMCU_IDC register.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c                    | 11 ++++++-----
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h |  5 +++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index e14e3e47f2..36a9205819 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -236,6 +236,11 @@ static u32 read_idc(void)
>  	return readl(DBGMCU_IDC);
>  }
>  
> +u32 get_cpu_dev(void)
> +{
> +	return (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
> +}
> +
>  u32 get_cpu_rev(void)
>  {
>  	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
> @@ -266,11 +271,7 @@ static u32 get_cpu_rpn(void)
>  
>  u32 get_cpu_type(void)
>  {
> -	u32 id;
> -
> -	id = (read_idc() & DBGMCU_IDC_DEV_ID_MASK) >> DBGMCU_IDC_DEV_ID_SHIFT;
> -
> -	return (id << 16) | get_cpu_rpn();
> +	return (get_cpu_dev() << 16) | get_cpu_rpn();
>  }
>  
>  /* Get Package options from OTP */
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 1617126bea..4b6c7b8bdd 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -20,6 +20,11 @@
>  /* return CPU_STMP32MP...Xxx constants */
>  u32 get_cpu_type(void);
>  
> +#define CPU_DEV_STM32MP15	0x500
> +
> +/* return CPU_DEV constants */
> +u32 get_cpu_dev(void);
> +
>  #define CPU_REVA	0x1000
>  #define CPU_REVB	0x2000
>  #define CPU_REVZ	0x2001

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
