Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08886189907
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:15:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41E66C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:15:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78DC4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:15:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IADZIR032332; Wed, 18 Mar 2020 11:15:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UwjUMVUCwO0b2tQBMt8ekgkkI0vtpTT2hy5VIU2UJZQ=;
 b=q9g+48OIyJ8DdoMtT4yiH8fnol1/T9gIM2wHXgDjNe1XeeIbUzGURcELtom0mWOwmHOk
 Hvfzw5zyxQIRQkOAkDIX9aMyHL6SWk8faluuV6GgUzNo6hnnR0zxW8f1R8bNnc6lF9uS
 UjEkmbr37dKlnT2+0n0Gt8flsn8A6FwD1lKUELSy3eShrOgKnOZuhADPE/nzINHpdRZ5
 1IlvsGH7K/VbNnUTZR06NydlgNc8UX3W0ZCl3aZg+H6/8qE9Tf9IE6vPu9ajLk0Ija0s
 EcxMyabFksBMoV7OYRRJr/b5vmRry843s4PjqbsYVdNxPy3YOT7iDowdIEiGs+o1NzFB cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etax46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:15:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62909100034;
 Wed, 18 Mar 2020 11:15:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 477EE221009;
 Wed, 18 Mar 2020 11:15:12 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 11:15:11 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:15:11 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 08/10] board: stm32mp1: display reference
 only for STMicroelectronics board
Thread-Index: AQHV/Q4b3qNhMFwKQ0CN2Q7VZgGmAw==
Date: Wed, 18 Mar 2020 10:15:11 +0000
Message-ID: <f132af0b-834c-01e2-2003-8762508621b6@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-9-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-9-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <3084431312BEE94D84FF7A126312C10D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 08/10] board: stm32mp1: display reference
 only for STMicroelectronics board
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
> Display the reference MBxxxx found in OTP49
> only for STMicroelectronics boards when CONFIG_CMD_STBOARD
> is activated.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 76399e2d62..463248bcd7 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -101,20 +101,21 @@ int checkboard(void)
>  		printf(" (%s)", fdt_compat);
>  	puts("\n");
>  
> -	ret = uclass_get_device_by_driver(UCLASS_MISC,
> -					  DM_GET_DRIVER(stm32mp_bsec),
> -					  &dev);
> +	if (CONFIG_IS_ENABLED(CMD_STBOARD)) {
> +		ret = uclass_get_device_by_driver(UCLASS_MISC,
> +						  DM_GET_DRIVER(stm32mp_bsec),
> +						  &dev);
>  
> -	if (!ret)
> -		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
> -				&otp, sizeof(otp));
> -	if (ret > 0 && otp) {
> -		printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
> -		       otp >> 16,
> -		       (otp >> 12) & 0xF,
> -		       (otp >> 4) & 0xF,
> -		       ((otp >> 8) & 0xF) - 1 + 'A',
> -		       otp & 0xF);
> +		if (!ret)
> +			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
> +					&otp, sizeof(otp));
> +		if (ret > 0 && otp)
> +			printf("Board: MB%04x Var%d.%d Rev.%c-%02d\n",
> +			       otp >> 16,
> +			       (otp >> 12) & 0xF,
> +			       (otp >> 4) & 0xF,
> +			       ((otp >> 8) & 0xF) - 1 + 'A',
> +			       otp & 0xF);
>  	}
>  
>  	return 0;

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
