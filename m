Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B832E1898FB
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:10:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835F0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:10:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F26CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:10:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA8X9u030088; Wed, 18 Mar 2020 11:10:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NKFJYRULegu6lm4chjQoSM0po11Aksx9hZbN9ImAXFw=;
 b=D5Oshq0UMY4v9ku8jhoOn9XSQ1Dqrpjp0iqHnZsWzcGUvBDji/ZhF4DuI4t6+aSa84N6
 Bm0ON2gX4nzET9KBYbQCWyBiFBnvbaUek9t20/y5ZvPdakzKP8wwR6b/cTHHp+x/jodU
 8Qkwmxh1774PF8pJiiawAU6/MP0doWqeoQoKB+435s5AGl875gfX5CzDCpGhqfg7EXbf
 3v92gOw0aBEOft04YqD34yuxLtCZ5uGJw9lGKVXrOeJiP8J3F+ZJKJFNyjsSCLo+vCc9
 +Kk63T8MJaa5whsXEjyQsJRNwJQurvg2BFR5oW1KVWcnno+y6SA8FnaP42eIwNZaFKUt bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujqrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:10:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32FB610002A;
 Wed, 18 Mar 2020 11:10:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2615A21F67F;
 Wed, 18 Mar 2020 11:10:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 11:10:48 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:10:48 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 06/10] arm: stm32mp: improve the error message for smc
Thread-Index: AQHV4dOIX5cD1dutVEaBZgUvJdegNahORpGA
Date: Wed, 18 Mar 2020 10:10:48 +0000
Message-ID: <570ea619-1466-dfab-df4f-eccb4a0fbb5d@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-7-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-7-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <01D84D49D3EF054EB5C59807E2627AD2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] arm: stm32mp: improve the error
	message for smc
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


On 2/12/20 7:37 PM, Patrick Delaunay wrote:
> Add the SMC code and operation for trace on errors.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
> index 7b9167c356..4ad14f963b 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
> @@ -46,8 +46,8 @@ static inline u32 stm32_smc(u32 svc, u8 op, u32 data1, u32 data2, u32 *result)
>  	arm_smccc_smc(svc, op, data1, data2, 0, 0, 0, 0, &res);
>  
>  	if (res.a0) {
> -		pr_err("%s: Failed to exec in secure mode (err = %ld)\n",
> -		       __func__, res.a0);
> +		pr_err("%s: Failed to exec svc=%x op=%x in secure mode (err = %ld)\n",
> +		       __func__, svc, op, res.a0);
>  		return -EINVAL;
>  	}
>  	if (result)

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
