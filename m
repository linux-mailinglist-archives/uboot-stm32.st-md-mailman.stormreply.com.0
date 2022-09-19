Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 144BD5BC31E
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 08:52:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8DEAC0D2C1;
	Mon, 19 Sep 2022 06:52:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EA58C03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 06:52:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J3A943025638;
 Mon, 19 Sep 2022 08:52:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eEAHXjzjGqgQVMAh3xpAXLkOTD9fKMO2tIK59g8gSMc=;
 b=ejvkWTJO9S1flDklvZfC2nqLRRrhOIz9Wldc2lgEPJRwycaZFF1iT6bPLYjjUT+jWevp
 dsC2a1QIrJwUX2Hf7GqBj7nY+27Twgti7T/WTyG5kfleIVqf0G+YCVptRx2TH8W475VS
 p8fptN8oICIr8CJ5xXRCuZxcG2xH1qFJYDTmK7J3R7vJL0XRrqq/Ryh4VKh1NI6ktfb1
 7p9T0y5kAoaesueNfuGE1AO8tmWZN4a0ZrzwtVzQnsrpEOxsatWnyL6itYcvhhOubNff
 3f1JL0ZCtmHB5fxpFNrrxsHwgL6AO4M46OsI4LARIq4anwAUG6jNvHdDadJzGCy1owDH mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6a0hhgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 08:52:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A92EE10002A;
 Mon, 19 Sep 2022 08:52:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93633212FA0;
 Mon, 19 Sep 2022 08:52:23 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 08:52:23 +0200
Message-ID: <045b95b3-f2a6-38f8-21dd-723c01184626@foss.st.com>
Date: Mon, 19 Sep 2022 08:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
 <20220915181132.1.I717164f1b092cbabb30dc2b1397e078027a69a65@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220915181132.1.I717164f1b092cbabb30dc2b1397e078027a69a65@changeid>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] arm: stm32mp: add defines for
 BSEC_LOCK status in stm32key command
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

On 9/15/22 18:11, Patrick Delaunay wrote:
> Add defines for value used in stm32key for BSEC permanent lock status
> and error.
> 
> This patch is a preliminary step to support more lock status in BSEC
> driver.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 68f28922d1e..1899d91ecb5 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -19,6 +19,9 @@
>  #define STM32_OTP_HASH_KEY_START	24
>  #define STM32_OTP_HASH_KEY_SIZE		8
>  
> +#define BSEC_LOCK_ERROR			(-1)
> +#define BSEC_LOCK_PERM			BIT(0)
> +
>  static int get_misc_dev(struct udevice **dev)
>  {
>  	int ret;
> @@ -60,14 +63,14 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
>  			val = ~0x0;
>  		ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
>  		if (ret != 4)
> -			lock = -1;
> +			lock = BSEC_LOCK_ERROR;
>  		if (print)
> -			printf("OTP HASH %i: %x lock : %d\n", word, val, lock);
> +			printf("OTP HASH %i: %x lock : %x\n", word, val, lock);
>  		if (val == ~0x0)
>  			nb_invalid++;
>  		else if (val == 0x0)
>  			nb_zero++;
> -		if (lock == 1)
> +		if (lock & BSEC_LOCK_PERM)
>  			nb_lock++;
>  	}
>  
> @@ -77,13 +80,13 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
>  		val = 0x0;
>  	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
>  	if (ret != 4)
> -		lock = -1;
> +		lock = BSEC_LOCK_ERROR;
>  
>  	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
>  	if (closed)
>  		*closed = status;
>  	if (print)
> -		printf("OTP %d: closed status: %d lock : %d\n", word, status, lock);
> +		printf("OTP %d: closed status: %d lock : %x\n", word, status, lock);
>  
>  	status = (nb_lock == STM32_OTP_HASH_KEY_SIZE);
>  	if (locked)
> @@ -128,7 +131,7 @@ static int fuse_hash_value(u32 addr, bool print)
>  			return ret;
>  		}
>  		/* on success, lock the OTP for HASH key */
> -		val = 1;
> +		val = BSEC_LOCK_PERM;
>  		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
>  		if (ret != 4) {
>  			log_err("Lock OTP %i failed\n", word);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
