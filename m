Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B45951A7BFD
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D44CDC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:11:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59DF6C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:11:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3u2W011468; Tue, 14 Apr 2020 15:11:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=K7R/nK1GQ1E4c8ZcTJ80nTs8WxR+HvMqU9vXCHt7JLo=;
 b=oc+xEgvyTWwV6PP2kJ0JDCM7e3dwSDrEEwR/R1WkL8BRYM+U2z+f2mvyiYdD6gR6Zz6z
 dDaqCzCRd4FzGfHXghK3XfkJ5LNMjvDiVALdHFwdlr0XH+S4YMVBk7p1VIhIT42NQB1V
 1xxZRU/dzCIeNVfVZC+sA2Yrc4U0Y24YTV8c0BlWA0FimZukJqVwGblJkdmLe9Hdw/Fn
 TarQZZsgI7rsfb2ae6trzzxqAVpdK1wfeKGxB1Ov+WSkgnXVK07S8/mbeYtbtSWMmK8p
 FIQ9BEJbjFC3iSb4HnYTLYIjrl+lFzIGvqzt/CoIvItTGDYJRA9sIGynKoDpwnuY1Rkc 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668dpyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:11:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 437DD10002A;
 Tue, 14 Apr 2020 15:11:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B1912BC7A9;
 Tue, 14 Apr 2020 15:11:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:11:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:11:06 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 16/18] stm32mp: stm32prog: enable videoconsole
Thread-Index: AQHV/P7Ej/lbPqOTnU+00etfuTTsyqh4oMsA
Date: Tue, 14 Apr 2020 13:11:06 +0000
Message-ID: <337c473c-45e1-2a20-fd6a-99920036a2f7@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
 <20200318082503.8025-17-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-17-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <D087E862445C69478312A048B249A913@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 16/18] stm32mp: stm32prog: enable
	videoconsole
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

Hi

On 3/18/20 9:25 AM, Patrick Delaunay wrote:
> Enable the videoconsole during the stm32prog command execution
> to have information without UART.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  .../cmd_stm32prog/cmd_stm32prog.c             | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 1769ba05f2..15bbdc2cb6 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -11,6 +11,32 @@
>  
>  struct stm32prog_data *stm32prog_data;
>  
> +static void enable_vidconsole(void)
> +{
> +#ifdef CONFIG_DM_VIDEO
> +	char *stdname;
> +	char buf[64];
> +
> +	stdname = env_get("stdout");
> +	if (!stdname || !strstr(stdname, "vidconsole")) {
> +		if (!stdname)
> +			snprintf(buf, sizeof(buf), "serial,vidconsole");
> +		else
> +			snprintf(buf, sizeof(buf), "%s,vidconsole", stdname);
> +		env_set("stdout", buf);
> +	}
> +
> +	stdname = env_get("stderr");
> +	if (!stdname || !strstr(stdname, "vidconsole")) {
> +		if (!stdname)
> +			snprintf(buf, sizeof(buf), "serial,vidconsole");
> +		else
> +			snprintf(buf, sizeof(buf), "%s,vidconsole", stdname);
> +		env_set("stderr", buf);
> +	}
> +#endif
> +}
> +
>  static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  			char * const argv[])
>  {
> @@ -45,6 +71,8 @@ static int do_stm32prog(cmd_tbl_t *cmdtp, int flag, int argc,
>  	if (argc > 4)
>  		size = simple_strtoul(argv[4], NULL, 16);
>  
> +	enable_vidconsole();
> +
>  	data = (struct stm32prog_data *)malloc(sizeof(*data));
>  
>  	if (!data) {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
