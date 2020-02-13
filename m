Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C93F15BE7C
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 13:34:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F2A5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 12:34:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53296C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 12:34:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DCT8Nu001014; Thu, 13 Feb 2020 13:34:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=okImDRzDR+3DcL+5wJIQePFoL5mk4PMz6VDbKjHb14w=;
 b=LGVdyWuvubYMndZs4GOcWGKzZVR6MDbo0lVI4x7O4NVMlvNOZbjB2KHB/u4wTqpCxUuL
 zj8+l+02NbDjXixiUI5WYzIOw4gqTa8qM/1YTdARwKyY9RDM9+/QC9PvZu0mTORye+36
 zi4dnD8/FzXpqmHpsInhNfQy6OJ7vRzOLJiOPkglTUqQIS7d2naIGlTpK58IbMegm3zo
 VlFUSo3vStutG2LQNcu1eSWP3iEymJ7I4BFeBIxXx4r/EMEghrghwbJUNWl6HpGZOZLA
 0Kc5SiCIyBy+KBK+j5kbZvItfuyZ7ClSoUg0Uoi5adv/PCWah+rTswLSxUbU/peTW4Zr 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhn0st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 13:34:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7782E100039;
 Thu, 13 Feb 2020 13:34:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65C382B468E;
 Thu, 13 Feb 2020 13:34:13 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 13:34:12 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Feb 2020 13:34:12 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 9/9] stm32mp1: support of STM32MP15x Rev.Z
Thread-Index: AQHV1brvtE6ofEclqEi8GJ2mD+YcCqgZF5AA
Date: Thu, 13 Feb 2020 12:34:12 +0000
Message-ID: <cf9e7852-b300-f103-f383-9a29f4b06c23@st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128091106.28552-6-patrick.delaunay@st.com>
In-Reply-To: <20200128091106.28552-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <AF2D46D9A8B94E44BC3F2673AA65B31E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_04:2020-02-12,
 2020-02-13 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 9/9] stm32mp1: support of STM32MP15x Rev.Z
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


On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> Add support for Rev.Z of STM32MP15x cpu.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c                    | 3 +++
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index de7891b5c4..ea0bd94605 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -342,6 +342,9 @@ int print_cpuinfo(void)
>  	case CPU_REVB:
>  		cpu_r = "B";
>  		break;
> +	case CPU_REVZ:
> +		cpu_r = "Z";
> +		break;
>  	default:
>  		cpu_r = "?";
>  		break;
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 47e57922d1..da46c11573 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -16,6 +16,7 @@ u32 get_cpu_type(void);
>  
>  #define CPU_REVA	0x1000
>  #define CPU_REVB	0x2000
> +#define CPU_REVZ	0x2001
>  
>  /* return CPU_REV constants */
>  u32 get_cpu_rev(void);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
