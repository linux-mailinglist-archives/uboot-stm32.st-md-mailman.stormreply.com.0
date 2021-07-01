Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB953B8E38
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:35:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5141AC597AA;
	Thu,  1 Jul 2021 07:35:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F27C59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:35:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617QxYN018731; Thu, 1 Jul 2021 09:35:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZATA+ZQRJkdYZiTpa7i+OKIvgr7m30DTJJENDXkqcbI=;
 b=A4GFgIlZ8vjJPx41FU62+ruUCL8spxBzo8pHYyArk38PiHh5yIrcBjhGyG56OISDh95/
 TnxpOOVqzVWc/NNscXR054kTl00WtYmIo90PIwvoDUyN5TMhKNY+NJVwOWs2RVYYB8fC
 0pe54z/uMojD3/jCfP3HfkeEEhG2FY8aA7gD98PEx6JJmH4U0bfdBL/GIbQri4bpc4Kz
 WzxaQ3c5ng6dzFop3vXO9LeWCfoWTaepxnWwyr3G8yRqe1QUUIvOPq3dIrfAzv38inz9
 G14YFAxN5kU3DfVe7jWJ7GLqrazFsjeoFkIckbISHMAM5vWEmHKj9m0kIx2U33nXLXVt rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39gnbpu8n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:35:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FBB310002A;
 Thu,  1 Jul 2021 09:35:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 85DC62138CD;
 Thu,  1 Jul 2021 09:35:33 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:35:32 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.2.I55399cf019408c6f6d4f86aa8783c8187b090280@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <9266b9c2-b8c4-c526-acea-24a677953d52@foss.st.com>
Date: Thu, 1 Jul 2021 09:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.2.I55399cf019408c6f6d4f86aa8783c8187b090280@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/7] stm32mp: cmd_stm32key: use sub command
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

On 6/28/21 2:55 PM, Patrick Delaunay wrote:
> Simplify parsing the command argument by using
> the macro U_BOOT_CMD_WITH_SUBCMDS.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 55 ++++++++++++++++++----------
>  1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index 42fdc11238..d2045a5983 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -67,36 +67,53 @@ static int confirm_prog(void)
>  	return 0;
>  }
>  
> -static int do_stm32key(struct cmd_tbl *cmdtp, int flag, int argc,
> -		       char *const argv[])
> +static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
>  {
>  	u32 addr;
> -	const char *op = argc >= 2 ? argv[1] : NULL;
> -	int confirmed = argc > 3 && !strcmp(argv[2], "-y");
>  
> -	argc -= 2 + confirmed;
> -	argv += 2 + confirmed;
> -
> -	if (argc < 1)
> +	if (argc == 1)
>  		return CMD_RET_USAGE;
>  
> -	addr = simple_strtoul(argv[0], NULL, 16);
> +	addr = simple_strtoul(argv[1], NULL, 16);
>  	if (!addr)
>  		return CMD_RET_USAGE;
>  
> -	if (!strcmp(op, "read"))
> -		read_hash_value(addr);
> +	read_hash_value(addr);
> +
> +	return CMD_RET_SUCCESS;
> +}
> +
> +static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
> +{
> +	u32 addr;
> +	bool yes = false;
>  
> -	if (!strcmp(op, "fuse")) {
> -		if (!confirmed && !confirm_prog())
> -			return CMD_RET_FAILURE;
> -		fuse_hash_value(addr, !confirmed);
> +	if (argc < 2)
> +		return CMD_RET_USAGE;
> +
> +	if (argc == 3) {
> +		if (strcmp(argv[1], "-y"))
> +			return CMD_RET_USAGE;
> +		yes = true;
>  	}
>  
> +	addr = simple_strtoul(argv[argc - 1], NULL, 16);
> +	if (!addr)
> +		return CMD_RET_USAGE;
> +
> +	if (!yes && !confirm_prog())
> +		return CMD_RET_FAILURE;
> +
> +	fuse_hash_value(addr, !yes);
> +	printf("Hash key updated !\n");
> +
>  	return CMD_RET_SUCCESS;
>  }
>  
> -U_BOOT_CMD(stm32key, 4, 1, do_stm32key,
> -	   "Fuse ST Hash key",
> -	   "read <addr>: Read the hash store at addr in memory\n"
> -	   "stm32key fuse [-y] <addr> : Fuse hash store at addr in otp\n");
> +static char stm32key_help_text[] =
> +	"read <addr>: Read the hash stored at addr in memory\n"
> +	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n";
> +
> +U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text,
> +	U_BOOT_SUBCMD_MKENT(read, 2, 0, do_stm32key_read),
> +	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse));
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
