Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 180045BC322
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 08:53:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D43A9C5E2C6;
	Mon, 19 Sep 2022 06:53:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6EA0C03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 06:53:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J5VqgT030169;
 Mon, 19 Sep 2022 08:53:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=04jhZ0PNqp9N296xiIPizVTaps9uyVQTlkF1BwgXGOs=;
 b=pOu4eELkoqJKB6pEInxJezmrfkCBX+us3Q7TsOh0RiezrCNFNdHYiWYiQgKzzTst0MOs
 I+g6WdjNsfjPxTSlnbWqjjWTIpVUrJe+Yyhol60rVhsPV8m8cYEfBEXfZFv0mJUVtfg8
 ngBgRMuDWmfAFrZGiTRL+nHrCXXndyYPs187KZS62BV9l9rOojqVMMiNN61KnNec4Y5q
 ekyber3cqCnoV7MKR4n90STSYzZxZGhBExTwRZwEUet4m/qnT78usUScvbSJHYvEbViv
 hOBVUsISyuZClYJSyEPSnCrRxAzbdDVbA6fZF1nUX/Mk1Eov6f4waljS+L/cXqnAbv60 Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6a0hhnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 08:53:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 68F5610002A;
 Mon, 19 Sep 2022 08:53:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63497212FA0;
 Mon, 19 Sep 2022 08:53:08 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 08:53:08 +0200
Message-ID: <1d7ae739-5f92-fc1d-c548-c76b37ed6532@foss.st.com>
Date: Mon, 19 Sep 2022 08:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
 <20220915181132.4.I1431827b62d294343069ff0aa7e59abaacb8bdd5@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220915181132.4.I1431827b62d294343069ff0aa7e59abaacb8bdd5@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] arm: stm32mp: adapt the command
 stm32key for STM32MP13x
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

HI Patrick

On 9/15/22 18:11, Patrick Delaunay wrote:
> Change the mask of OTP0 used to close the device on STM32MP
> - STM32MP15x: bit 6 of OPT0
> - STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
> 
> And support the 2 keys for STM32MP13x
> - PKHTH : Hash of the 8 ECC Public Keys Hashes Table
>           (ECDSA is the authentication algorithm)
> - EDMK : Encryption/Decryption Master Key
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 52 ++++++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 4eac56082db..278253e472f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -11,9 +11,14 @@
>  #include <dm/device.h>
>  #include <dm/uclass.h>
>  
> -/* Closed device : bit 6 of OPT0*/
> +/*
> + * Closed device: OTP0
> + * STM32MP15x: bit 6 of OPT0
> + * STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
> + */
>  #define STM32_OTP_CLOSE_ID		0
> -#define STM32_OTP_CLOSE_MASK		BIT(6)
> +#define STM32_OTP_STM32MP13x_CLOSE_MASK	0x3F
> +#define STM32_OTP_STM32MP15x_CLOSE_MASK	BIT(6)
>  
>  /* PKH is the first element of the key list */
>  #define STM32KEY_PKH 0
> @@ -25,6 +30,21 @@ struct stm32key {
>  	u8 size;
>  };
>  
> +const struct stm32key stm32mp13_list[] = {
> +	[STM32KEY_PKH] = {
> +		.name = "PKHTH",
> +		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm)",
> +		.start = 24,
> +		.size = 8,
> +	},
> +	{
> +		.name = "EDMK",
> +		.desc = "Encryption/Decryption Master Key",
> +		.start = 92,
> +		.size = 4,
> +	}
> +};
> +
>  const struct stm32key stm32mp15_list[] = {
>  	[STM32KEY_PKH] = {
>  		.name = "PKH",
> @@ -39,12 +59,29 @@ static u8 stm32key_index;
>  
>  static u8 get_key_nb(void)
>  {
> -	return ARRAY_SIZE(stm32mp15_list);
> +	if (IS_ENABLED(CONFIG_STM32MP13x))
> +		return ARRAY_SIZE(stm32mp13_list);
> +
> +	if (IS_ENABLED(CONFIG_STM32MP15x))
> +		return ARRAY_SIZE(stm32mp15_list);
>  }
>  
>  static const struct stm32key *get_key(u8 index)
>  {
> -	return &stm32mp15_list[index];
> +	if (IS_ENABLED(CONFIG_STM32MP13x))
> +		return &stm32mp13_list[index];
> +
> +	if (IS_ENABLED(CONFIG_STM32MP15x))
> +		return &stm32mp15_list[index];
> +}
> +
> +static u32 get_otp_close_mask(void)
> +{
> +	if (IS_ENABLED(CONFIG_STM32MP13x))
> +		return STM32_OTP_STM32MP13x_CLOSE_MASK;
> +
> +	if (IS_ENABLED(CONFIG_STM32MP15x))
> +		return STM32_OTP_STM32MP15x_CLOSE_MASK;
>  }
>  
>  #define BSEC_LOCK_ERROR			(-1)
> @@ -123,7 +160,7 @@ static int read_key_otp(struct udevice *dev, const struct stm32key *key, bool pr
>  static int read_close_status(struct udevice *dev, bool print, bool *closed)
>  {
>  	int word, ret, result;
> -	u32 val, lock;
> +	u32 val, lock, mask;
>  	bool status;
>  
>  	result = 0;
> @@ -140,7 +177,8 @@ static int read_close_status(struct udevice *dev, bool print, bool *closed)
>  	if (ret != 4)
>  		lock = BSEC_LOCK_ERROR;
>  
> -	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
> +	mask = get_otp_close_mask();
> +	status = (val & mask) == mask;
>  	if (closed)
>  		*closed = status;
>  	if (print)
> @@ -371,7 +409,7 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
>  	if (!yes && !confirm_prog())
>  		return CMD_RET_FAILURE;
>  
> -	val = STM32_OTP_CLOSE_MASK;
> +	val = get_otp_close_mask();
>  	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
>  	if (ret != 4) {
>  		printf("Error: can't update OTP %d\n", STM32_OTP_CLOSE_ID);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
