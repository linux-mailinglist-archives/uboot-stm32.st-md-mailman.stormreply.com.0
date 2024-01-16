Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C5682F1F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jan 2024 16:55:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D55C9C6B476;
	Tue, 16 Jan 2024 15:55:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7EA8C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 15:55:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GD6NSW024475
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jan 2024 16:55:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=yX5TZYItihUJPqwuitvXSlEBIr7Emvp6+LGUhdUPJLg=; b=7F
 iu+d9/t1F8E+/91O7GD7r7AnK8+/N3GfZQ544Lbn5LM6eDUcPAwq7Y0z+Yhxi5Kf
 Zt0zhkYKDH7mFp3L0y+xO/bXBvcxvvhlXRZ05uKTUgrKMRW/w8t/VCLUg/bzCqbN
 Oktz2E8VQnA5YYvHKLf865H8myyYXfC9tJSIJI7UKhtNBpnmfqwD5HesGQEuf34W
 2KmWPiWaDNUdj5SfVCP5Mav2WmoMHju2G+6Wt678qAVLAydtREdeeY1aLPd77WEX
 PmhWxSdvPkg2HMr+YF3DeAJ/SILMvgu3O0Zwbbk5nLEPXnmkgyQhv5mOsU83Y/ef
 y0G2eppFX+GmqitCQrkw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkma5y619-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:55:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B812210002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:55:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD6E52207DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 16:55:02 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 16 Jan
 2024 16:55:02 +0100
Message-ID: <2edd7430-3ce2-49ff-b764-08fe434e89f2@foss.st.com>
Date: Tue, 16 Jan 2024 16:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>
References: <20240116142622.608564-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240116142622.608564-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-BOOT internal][PATCH] common: console: Fix
 print complete stdio device list
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

-1

On 1/16/24 15:26, Patrice Chotard wrote:
> In case CONSOLE_MUX and SYS_CONSOLE_IS_IN_ENV are on and
> stdin or stdout or stderr are missing in environment, as fallback, get
> these either from stdio_devices[std] or stdio_devices[std]->name.
>
> Fixes: 6b343ab38d ("console: Print out complete stdio device list")
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   common/console.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/common/console.c b/common/console.c
> index cad65891fc9..7efd936ccc0 100644
> --- a/common/console.c
> +++ b/common/console.c
> @@ -1049,9 +1049,17 @@ int console_clear(void)
>   	return 0;
>   }
>   
> +static char *get_stdio(char *buf, const u8 std)
> +{
> +	snprintf(buf, sizeof(buf), "No %s devices available!", stdio_names[std]);
> +
> +	return stdio_devices[std] ? stdio_devices[std]->name : buf;
> +}
> +
>   static void stdio_print_current_devices(void)
>   {
>   	char *stdinname, *stdoutname, *stderrname;
> +	char buf[32];


=> same buffer used for the 3 sprintf = only the last only win.


Result

In: No stderr devices available!

Out: No stderrdevices available!

Err: No stderr devices available!


PS: no issue if const char is used / buf can be removed

+static char *get_stdio(const u8 std)
+{
+	return stdio_devices[std] ? stdio_devices[std]->name : "No devices available!"
;
+}
+



>   
>   	if (CONFIG_IS_ENABLED(CONSOLE_MUX) &&
>   	    CONFIG_IS_ENABLED(SYS_CONSOLE_IS_IN_ENV)) {
> @@ -1060,19 +1068,13 @@ static void stdio_print_current_devices(void)
>   		stdoutname = env_get("stdout");
>   		stderrname = env_get("stderr");
>   
> -		stdinname = stdinname ? : "No input devices available!";
> -		stdoutname = stdoutname ? : "No output devices available!";
> -		stderrname = stderrname ? : "No error devices available!";
> +		stdinname = stdinname ? : get_stdio(buf, stdin);
> +		stdoutname = stdoutname ? : get_stdio(buf, stdout);
> +		stderrname = stderrname ? : get_stdio(buf, stderr);
>   	} else {
> -		stdinname = stdio_devices[stdin] ?
> -			stdio_devices[stdin]->name :
> -			"No input devices available!";
> -		stdoutname = stdio_devices[stdout] ?
> -			stdio_devices[stdout]->name :
> -			"No output devices available!";
> -		stderrname = stdio_devices[stderr] ?
> -			stdio_devices[stderr]->name :
> -			"No error devices available!";
> +		stdinname = get_stdio(buf, stdin);
> +		stdoutname = get_stdio(buf, stdout);
> +		stderrname = get_stdio(buf, stderr);
>   	}
>   
>   	/* Print information */


Result

In: No devices available!

Out: No devices available!

Err: No devices available!



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
