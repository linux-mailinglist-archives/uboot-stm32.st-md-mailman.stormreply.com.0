Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F45BC31F
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 08:52:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5B4AC0D2C1;
	Mon, 19 Sep 2022 06:52:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F002CC03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 06:52:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J0FJsw020934;
 Mon, 19 Sep 2022 08:52:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=skbWH4iiO7fv39KSYXv0Bvv+vUBJatiBY+A85cVQM6k=;
 b=suvC1aTGNFAVfJWl4vOS1xbi7oEJVfm/evP/awGGM0Ue+YWf1CxfVCxJt2b+5crLBUEL
 GLu9qnx+rGspFk/x3fPpHAwmGVQP8RScTgnwowFYDkm6UVKh/Hw3hdYRjt1BtW13nN8o
 WvntxrKVlQVOTbnvhj2ek6/hgWEFB5MFx2qW/4aqKgq57ZZ3udyPuoLVZrdKzgfokMaF
 5kgpmc1yCa1xzkYngw3yBs1u6vPk67YthFtWvNuTg5HBFgpNjk9FDBSrdqQ8r0NxJF+u
 GgjWRV8Up3LsfIJl+vI+t0hECz6yg/kK/gPghEuCT3/ksj+ktmmmFDTmg0gcf1cq+8R2 Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6ck9h46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 08:52:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6AA01100034;
 Mon, 19 Sep 2022 08:52:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64D3A2128DC;
 Mon, 19 Sep 2022 08:52:44 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 08:52:43 +0200
Message-ID: <49cb41fe-8dd3-be90-b539-eb24da19038d@foss.st.com>
Date: Mon, 19 Sep 2022 08:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
 <20220915181132.2.Ibbcbcbc3b4bf97f9761600ec5ce36f8b40c3c161@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220915181132.2.Ibbcbcbc3b4bf97f9761600ec5ce36f8b40c3c161@changeid>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] arm: stm32mp: introduced
 read_close_status function in stm32key command
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
> Split the read_hash_otp function and introduce the helper function
> read_close_status to read the close status in OTP separately of the PKH.
> 
> This patch is a preliminary step for STM32MP13 support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 107 ++++++++++++++++-----------
>  1 file changed, 65 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 1899d91ecb5..68f9b1a9a59 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -45,18 +45,13 @@ static void read_hash_value(u32 addr)
>  	}
>  }
>  
> -static int read_hash_otp(bool print, bool *locked, bool *closed)
> +static int read_hash_otp(struct udevice *dev, bool print, bool *locked)
>  {
> -	struct udevice *dev;
>  	int i, word, ret;
>  	int nb_invalid = 0, nb_zero = 0, nb_lock = 0;
>  	u32 val, lock;
>  	bool status;
>  
> -	ret = get_misc_dev(&dev);
> -	if (ret)
> -		return ret;
> -
>  	for (i = 0, word = STM32_OTP_HASH_KEY_START; i < STM32_OTP_HASH_KEY_SIZE; i++, word++) {
>  		ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
>  		if (ret != 4)
> @@ -74,20 +69,6 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
>  			nb_lock++;
>  	}
>  
> -	word = STM32_OTP_CLOSE_ID;
> -	ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
> -	if (ret != 4)
> -		val = 0x0;
> -	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
> -	if (ret != 4)
> -		lock = BSEC_LOCK_ERROR;
> -
> -	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
> -	if (closed)
> -		*closed = status;
> -	if (print)
> -		printf("OTP %d: closed status: %d lock : %x\n", word, status, lock);
> -
>  	status = (nb_lock == STM32_OTP_HASH_KEY_SIZE);
>  	if (locked)
>  		*locked = status;
> @@ -108,16 +89,40 @@ static int read_hash_otp(bool print, bool *locked, bool *closed)
>  	return 0;
>  }
>  
> -static int fuse_hash_value(u32 addr, bool print)
> +static int read_close_status(struct udevice *dev, bool print, bool *closed)
> +{
> +	int word, ret, result;
> +	u32 val, lock;
> +	bool status;
> +
> +	result = 0;
> +	word = STM32_OTP_CLOSE_ID;
> +	ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
> +	if (ret < 0)
> +		result = ret;
> +	if (ret != 4)
> +		val = 0x0;
> +
> +	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
> +	if (ret < 0)
> +		result = ret;
> +	if (ret != 4)
> +		lock = BSEC_LOCK_ERROR;
> +
> +	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
> +	if (closed)
> +		*closed = status;
> +	if (print)
> +		printf("OTP %d: closed status: %d lock : %x\n", word, status, lock);
> +
> +	return result;
> +}
> +
> +static int fuse_hash_value(struct udevice *dev, u32 addr, bool print)
>  {
> -	struct udevice *dev;
>  	u32 word, val;
>  	int i, ret;
>  
> -	ret = get_misc_dev(&dev);
> -	if (ret)
> -		return ret;
> -
>  	for (i = 0, word = STM32_OTP_HASH_KEY_START;
>  	     i < STM32_OTP_HASH_KEY_SIZE;
>  	     i++, word++, addr += 4) {
> @@ -158,10 +163,20 @@ static int confirm_prog(void)
>  
>  static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
>  {
> +	struct udevice *dev;
>  	u32 addr;
> +	int ret;
> +
> +	ret = get_misc_dev(&dev);
>  
>  	if (argc == 1) {
> -		read_hash_otp(true, NULL, NULL);
> +		if (ret)
> +			return CMD_RET_FAILURE;
> +		read_hash_otp(dev, true, NULL);
> +		ret = read_close_status(dev, true, NULL);
> +		if (ret)
> +			return CMD_RET_FAILURE;
> +
>  		return CMD_RET_SUCCESS;
>  	}
>  
> @@ -176,8 +191,10 @@ static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  
>  static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
>  {
> +	struct udevice *dev;
>  	u32 addr;
> -	bool yes = false, lock, closed;
> +	int ret;
> +	bool yes = false, lock;
>  
>  	if (argc < 2)
>  		return CMD_RET_USAGE;
> @@ -192,20 +209,23 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  	if (!addr)
>  		return CMD_RET_USAGE;
>  
> -	if (read_hash_otp(!yes, &lock, &closed) != -ENOENT) {
> +	ret = get_misc_dev(&dev);
> +	if (ret)
> +		return CMD_RET_FAILURE;
> +
> +	if (read_hash_otp(dev, !yes, &lock) != -ENOENT) {
>  		printf("Error: can't fuse again the OTP\n");
>  		return CMD_RET_FAILURE;
>  	}
> -
> -	if (lock || closed) {
> -		printf("Error: invalid OTP configuration (lock=%d, closed=%d)\n", lock, closed);
> +	if (lock) {
> +		printf("Error: PKH is locked\n");
>  		return CMD_RET_FAILURE;
>  	}
>  
>  	if (!yes && !confirm_prog())
>  		return CMD_RET_FAILURE;
>  
> -	if (fuse_hash_value(addr, !yes))
> +	if (fuse_hash_value(dev, addr, !yes))
>  		return CMD_RET_FAILURE;
>  
>  	printf("Hash key updated !\n");
> @@ -227,28 +247,31 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
>  		yes = true;
>  	}
>  
> -	ret = read_hash_otp(!yes, &lock, &closed);
> -	if (ret) {
> -		if (ret == -ENOENT)
> -			printf("Error: OTP not programmed!\n");
> +	ret = get_misc_dev(&dev);
> +	if (ret)
> +		return CMD_RET_FAILURE;
> +
> +	if (read_close_status(dev, !yes, &closed))
>  		return CMD_RET_FAILURE;
> -	}
>  
>  	if (closed) {
>  		printf("Error: already closed!\n");
>  		return CMD_RET_FAILURE;
>  	}
>  
> +	/* check PKH status before to close */
> +	ret = read_hash_otp(dev, !yes, &lock);
> +	if (ret) {
> +		if (ret == -ENOENT)
> +			printf("Error: OTP not programmed!\n");
> +		return CMD_RET_FAILURE;
> +	}
>  	if (!lock)
>  		printf("Warning: OTP not locked!\n");
>  
>  	if (!yes && !confirm_prog())
>  		return CMD_RET_FAILURE;
>  
> -	ret = get_misc_dev(&dev);
> -	if (ret)
> -		return CMD_RET_FAILURE;
> -
>  	val = STM32_OTP_CLOSE_MASK;
>  	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
>  	if (ret != 4) {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
