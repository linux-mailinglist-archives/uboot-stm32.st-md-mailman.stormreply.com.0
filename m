Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5E3B8E3F
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:36:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DE8FC597AA;
	Thu,  1 Jul 2021 07:36:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BDD1C59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:36:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617RLrg026854; Thu, 1 Jul 2021 09:36:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FxcA2rW5XMulKTHtpvuktHyOKwGwlSZmcIyNv622MmE=;
 b=OLRc2ZiHttTvJLKF0CtXV7VLaFvyY7vWLZj7plSaYHZT1R8cESH236i31kTVE+k1COsw
 6J7DNhhp1GuJuNspWrvftfAJzuzNIuKHpPbfC4N+GKOCn5lQC5cIE/0rT54ujFaEJlDy
 lFwbqSlqiqZAVATyEsxRDrrDj0HsdLAC8YKwedl8wZp7IO9qaNEryjiOCbkfekmtQC+o
 zU4g62i3+cYg0PM4vK9joJiMY7i52zxvpZMMihya+fn/mDJr04z+A2WIydlwcZKetUo7
 1ybOCJoicHvEJOboAFBGCJHuXzUFZ5csxDUxxX8MS1ER7MPa97rYE8gIiYDuIfpQlFVX tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj19e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:36:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 459C810002A;
 Thu,  1 Jul 2021 09:36:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3967C20FA40;
 Thu,  1 Jul 2021 09:36:30 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:36:29 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.7.Ice24ec3430539077cefa5a43cb6245847db3871e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <3c9a3447-ffcc-f066-d8ca-64a4760b884e@foss.st.com>
Date: Thu, 1 Jul 2021 09:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.7.Ice24ec3430539077cefa5a43cb6245847db3871e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 7/7] stm32mp: cmd_stm32key: add subcommand
	close
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
> The expected sequence to close the device
> 
> 1/ Load key in DDR with any supported load command
> 2/ Update OTP with key: STM32MP> stm32key read <addr>
> 
> At this point the device is able to perform image authentication but
> non-authenticated images can still be used and executed.
> So it is the last moment to test boot with signed binary and
> check that the ROM code accepts them.
> 
> 3/ Close the device: only signed binary will be accepted !!
>    STM32MP> stm32key close
> 
> Warning: Programming these OTP is an irreversible operation!
>          This may brick your system if the HASH of key is invalid
> 
> This command should be deactivated by default in real product.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 54 ++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 8c8d476b65..50840b0f38 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -210,10 +210,60 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
>  	return CMD_RET_SUCCESS;
>  }
>  
> +static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
> +{
> +	bool yes, lock, closed;
> +	struct udevice *dev;
> +	u32 val;
> +	int ret;
> +
> +	yes = false;
> +	if (argc == 2) {
> +		if (strcmp(argv[1], "-y"))
> +			return CMD_RET_USAGE;
> +		yes = true;
> +	}
> +
> +	ret = read_hash_otp(!yes, &lock, &closed);
> +	if (ret) {
> +		if (ret == -ENOENT)
> +			printf("Error: OTP not programmed!\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	if (closed) {
> +		printf("Error: already closed!\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	if (!lock)
> +		printf("Warning: OTP not locked!\n");
> +
> +	if (!yes && !confirm_prog())
> +		return CMD_RET_FAILURE;
> +
> +	ret = get_misc_dev(&dev);
> +	if (ret)
> +		return CMD_RET_FAILURE;
> +
> +	val = STM32_OTP_CLOSE_MASK;
> +	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
> +	if (ret != 4) {
> +		printf("Error: can't update OTP\n");
> +		return CMD_RET_FAILURE;
> +	}
> +
> +	printf("Device is closed !\n");
> +
> +	return CMD_RET_SUCCESS;
> +}
> +
>  static char stm32key_help_text[] =
>  	"read [<addr>]: Read the hash stored at addr in memory or in OTP\n"
> -	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n";
> +	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n"
> +	"stm32key close [-y] : Close the device, the hash stored in OTP\n";
>  
>  U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text,
>  	U_BOOT_SUBCMD_MKENT(read, 2, 0, do_stm32key_read),
> -	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse));
> +	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse),
> +	U_BOOT_SUBCMD_MKENT(close, 2, 0, do_stm32key_close));
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
