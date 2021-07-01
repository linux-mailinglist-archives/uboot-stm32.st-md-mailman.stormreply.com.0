Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F183B8E3E
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:36:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D287C597AA;
	Thu,  1 Jul 2021 07:36:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45798C59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:36:16 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617Uhe2011572; Thu, 1 Jul 2021 09:36:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nvykeEIuweGUjnz3I6y9vENIbFjCXewRMAca72VvxMw=;
 b=CzG6Qn91205+7wWP5pqrZV2Ui33a9pja4/RTjDLpu09kc+r+EsbPZvnIRbDN3IIxZ6VE
 Cg7sGlF0rPCHJyrueeXVqoiTPUce6C/abIhOI8Ivab7g7Ex/pcYvkD1PIi/MXi3I2YAe
 7x5VMt3dCnmApY+4EpJLQb9TLPWPtd+e3gNA2xL3dVBKjG4O+CNPm2AjFKv7PFUNt/1E
 9+i/H7nilN45HgVAmYG8h+VkxXcmfeXdiwOu0SREv1C9sY0eAR7iBQtegLEAtQT77TKh
 1FGEN5/d19xWDFbzFmpsXf30FWmdqKOlpsuKZh55+oQRSjGh7RS9mcPMxMgJqg2jkytl 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h1xqa8vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:36:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC76B100038;
 Thu,  1 Jul 2021 09:36:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E44A12138D1;
 Thu,  1 Jul 2021 09:36:14 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:36:14 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.6.Ied9f79b7d73deaea9b2680449aac2a92b3dae465@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <71ce055a-1f8c-2a3b-47d2-eec00ae1d77e@foss.st.com>
Date: Thu, 1 Jul 2021 09:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.6.Ied9f79b7d73deaea9b2680449aac2a92b3dae465@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/7] stm32mp: cmd_stm32key: add read OTP
	subcommand
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

On 6/28/21 2:56 PM, Patrick Delaunay wrote:
> Allow to read the OTP value and lock status with the command
> $> stm32key read.
> 
> This patch also protects the stm32key fuse command.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 93 ++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 886c52794f..8c8d476b65 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -11,8 +11,13 @@
>  #include <dm/device.h>
>  #include <dm/uclass.h>
>  
> -#define STM32_OTP_HASH_KEY_START 24
> -#define STM32_OTP_HASH_KEY_SIZE 8
> +/* Closed device : bit 6 of OPT0*/
> +#define STM32_OTP_CLOSE_ID		0
> +#define STM32_OTP_CLOSE_MASK		BIT(6)
> +
> +/* HASH of key: 8 OTPs, starting with OTP24) */
> +#define STM32_OTP_HASH_KEY_START	24
> +#define STM32_OTP_HASH_KEY_SIZE		8
>  
>  static int get_misc_dev(struct udevice **dev)
>  {
> @@ -29,6 +34,7 @@ static void read_hash_value(u32 addr)
>  {
>  	int i;
>  
> +	printf("Read KEY at 0x%x\n", addr);
>  	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
>  		printf("OTP value %i: %x\n", STM32_OTP_HASH_KEY_START + i,
>  		       __be32_to_cpu(*(u32 *)addr));
> @@ -36,6 +42,69 @@ static void read_hash_value(u32 addr)
>  	}
>  }
>  
> +static int read_hash_otp(bool print, bool *locked, bool *closed)
> +{
> +	struct udevice *dev;
> +	int i, word, ret;
> +	int nb_invalid = 0, nb_zero = 0, nb_lock = 0;
> +	u32 val, lock;
> +	bool status;
> +
> +	ret = get_misc_dev(&dev);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0, word = STM32_OTP_HASH_KEY_START; i < STM32_OTP_HASH_KEY_SIZE; i++, word++) {
> +		ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
> +		if (ret != 4)
> +			val = ~0x0;
> +		ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
> +		if (ret != 4)
> +			lock = -1;
> +		if (print)
> +			printf("OTP HASH %i: %x lock : %d\n", word, val, lock);
> +		if (val == ~0x0)
> +			nb_invalid++;
> +		else if (val == 0x0)
> +			nb_zero++;
> +		if (lock == 1)
> +			nb_lock++;
> +	}
> +
> +	word = STM32_OTP_CLOSE_ID;
> +	ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
> +	if (ret != 4)
> +		val = 0x0;
> +	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
> +	if (ret != 4)
> +		lock = -1;
> +
> +	status = (val & STM32_OTP_CLOSE_MASK) == STM32_OTP_CLOSE_MASK;
> +	if (closed)
> +		*closed = status;
> +	if (print)
> +		printf("OTP %d: closed status: %d lock : %d\n", word, status, lock);
> +
> +	status = (nb_lock == STM32_OTP_HASH_KEY_SIZE);
> +	if (locked)
> +		*locked = status;
> +	if (!status && print)
> +		printf("Hash of key is not locked!\n");
> +
> +	if (nb_invalid == STM32_OTP_HASH_KEY_SIZE) {
> +		if (print)
> +			printf("Hash of key is invalid!\n");
> +		return -EINVAL;
> +	}
> +	if (nb_zero == STM32_OTP_HASH_KEY_SIZE) {
> +		if (print)
> +			printf("Hash of key is free!\n");
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int fuse_hash_value(u32 addr, bool print)
>  {
>  	struct udevice *dev;
> @@ -88,8 +157,10 @@ static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  {
>  	u32 addr;
>  
> -	if (argc == 1)
> -		return CMD_RET_USAGE;
> +	if (argc == 1) {
> +		read_hash_otp(true, NULL, NULL);
> +		return CMD_RET_SUCCESS;
> +	}
>  
>  	addr = simple_strtoul(argv[1], NULL, 16);
>  	if (!addr)
> @@ -103,7 +174,7 @@ static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
>  {
>  	u32 addr;
> -	bool yes = false;
> +	bool yes = false, lock, closed;
>  
>  	if (argc < 2)
>  		return CMD_RET_USAGE;
> @@ -118,6 +189,16 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  	if (!addr)
>  		return CMD_RET_USAGE;
>  
> +	if (read_hash_otp(!yes, &lock, &closed) != -ENOENT) {
> +		printf("Error: can't fuse again the OTP\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	if (lock || closed) {
> +		printf("Error: invalid OTP configuration (lock=%d, closed=%d)\n", lock, closed);
> +		return CMD_RET_FAILURE;
> +	}
> +
>  	if (!yes && !confirm_prog())
>  		return CMD_RET_FAILURE;
>  
> @@ -130,7 +211,7 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  }
>  
>  static char stm32key_help_text[] =
> -	"read <addr>: Read the hash stored at addr in memory\n"
> +	"read [<addr>]: Read the hash stored at addr in memory or in OTP\n"
>  	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n";
>  
>  U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text,
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
