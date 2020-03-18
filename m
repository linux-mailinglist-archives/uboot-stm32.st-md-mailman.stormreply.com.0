Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68F18980E
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:40:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20B52C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:40:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17179C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:40:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9cQMr016699; Wed, 18 Mar 2020 10:40:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=QxYDXA9lzJtDoLlViJkwNZmFlu8ThMo/d7Yl10Wcp6Q=;
 b=lZclEnx/F1NVAbuaFnI4EY0PKiJfRg8uLQUKYLtFwoaGZWTD01ts7q4qLZ5qFK+3dKbk
 WmcD4YF4g9LrjMRknJAKYWSOsK6tNGHe2VaL69obgBrC8hcNFvWZSW0EcwOT1RAwsj55
 zXzS6h4LjapjmFaS7062HUYlAsA7XhXY6aSFWaaQv1PgesmGAHlbgWe1UoQU78xDXm4o
 FR5BkP0eLJaNAqrN+t/HumOIdTUtlBJT+B8/59OO1m5GxVZfG/5Q8QiSWBUsziEpoRr4
 KqGWnomukqqcu46djHwzx3y2ZimN2gEq5CenlsGNRY1smDfeAIzzec88k07X3WYSBdni 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujj2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:40:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DEAF10002A;
 Wed, 18 Mar 2020 10:40:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83B9021FE99;
 Wed, 18 Mar 2020 10:40:28 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:40:28 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:40:28 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/9] ram: stm32mp1: tuning: add timeout for polling
 BISTGSR.BDDONE
Thread-Index: AQHV86AIIcRMkcyLGkuEgEh/ELopdKhOGn+A
Date: Wed, 18 Mar 2020 09:40:27 +0000
Message-ID: <deeb3833-d212-844e-6a4d-b94885ae0c5a@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.4.If03eb32f9863bed008f5367b47116f667bb85099@changeid>
In-Reply-To: <20200306111355.4.If03eb32f9863bed008f5367b47116f667bb85099@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <19380297FEA97A4DA63D9B94CB00ABDA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ram: stm32mp1: tuning: add timeout
 for polling BISTGSR.BDDONE
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Avoid to block the tuning procedure on BIST error (not finished
> BIST procedure) by adding a 1000us timeout on the polling of
> BISTGSR.BDDONE executed to detect the end of BIST.
>
> The normal duration of the BIST test is around 5us.
>
> This patch also cleanup comments.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tuning.c | 45 ++++++++++++++------------
>  1 file changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> index e3e6f0f79c..cab6cf087a 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> @@ -8,6 +8,7 @@
>  #include <ram.h>
>  #include <reset.h>
>  #include <asm/io.h>
> +#include <linux/iopoll.h>
>  
>  #include "stm32mp1_ddr_regs.h"
>  #include "stm32mp1_ddr.h"
> @@ -246,6 +247,8 @@ static void BIST_test(struct stm32mp1_ddrphy *phy, u8 byte,
>  	bool result = true; /* BIST_SUCCESS */
>  	u32 cnt = 0;
>  	u32 error = 0;
> +	u32 val;
> +	int ret;
>  
>  	bist->test_result = true;
>  
> @@ -274,27 +277,29 @@ run:
>  			0x00000001);
>  	/* Write BISTRR.BINST = 3?b001; */
>  
> -	/* Wait for a number of CTL clocks before reading BIST register*/
> -	/* Wait 300 ctl_clk cycles;  ... IS it really needed?? */
> -	/* Perform BIST Instruction Stop*/
> -	/* Write BISTRR.BINST = 3?b010;*/
> -
> -	/* poll on BISTGSR.BDONE. If 0, wait.  ++TODO Add timeout */
> -	while (!(readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDDONE))
> -		;
> -
> -	/*Check if received correct number of words*/
> -	/* if (Read BISTWCSR.DXWCNT = Read BISTWCR.BWCNT) */
> -	if (((readl(&phy->bistwcsr)) >> DDRPHYC_BISTWCSR_DXWCNT_SHIFT) ==
> -	    readl(&phy->bistwcr)) {
> -		/*Determine if there is a data comparison error*/
> -		/* if (Read BISTGSR.BDXERR = 1?b0) */
> -		if (readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDXERR)
> -			result = false; /* BIST_FAIL; */
> -		else
> -			result = true; /* BIST_SUCCESS; */
> -	} else {
> +	/* poll on BISTGSR.BDONE and wait max 1000 us */
> +	ret = readl_poll_timeout(&phy->bistgsr, val,
> +				 val & DDRPHYC_BISTGSR_BDDONE, 1000);
> +
> +	if (ret < 0) {
> +		printf("warning: BIST timeout\n");
>  		result = false; /* BIST_FAIL; */
> +		/*Perform BIST Stop */
> +		clrsetbits_le32(&phy->bistrr, 0x00000007, 0x00000002);
> +	} else {
> +		/*Check if received correct number of words*/
> +		/* if (Read BISTWCSR.DXWCNT = Read BISTWCR.BWCNT) */
> +		if (((readl(&phy->bistwcsr)) >> DDRPHYC_BISTWCSR_DXWCNT_SHIFT)
> +		    == readl(&phy->bistwcr)) {
> +			/*Determine if there is a data comparison error*/
> +			/* if (Read BISTGSR.BDXERR = 1?b0) */
> +			if (readl(&phy->bistgsr) & DDRPHYC_BISTGSR_BDXERR)
> +				result = false; /* BIST_FAIL; */
> +			else
> +				result = true; /* BIST_SUCCESS; */
> +		} else {
> +			result = false; /* BIST_FAIL; */
> +		}
>  	}
>  
>  	/* loop while success */

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
