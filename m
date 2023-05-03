Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9693F6F501A
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 08:29:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6097AC6A60C;
	Wed,  3 May 2023 06:29:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06161C6A5FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 06:29:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3435npkA004640; Wed, 3 May 2023 08:29:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=TD70o7s0kyrb1K6nehvjEJzkAGVzs6kM9oo0+Fa+X6c=;
 b=HZCtToUjNx9TUADWayyqvwx9CerbVSSPk4AQc+q7pdJaygIpWNf9XCQX57OeAQkwXOUe
 gVu4/2bH28/F6rW4NZBz8Ei9BA6yxwZOI2D5xetD7jlaRWMD3xu9hLUMAIdgDQM4wACD
 d+eqKyu7gE5k9RoKWIzSEhP0a6hhRK7at6Dx4bcppsSPYNllOMmXHGZ2KJSJi0uxgYin
 zaBpOK2SdMS1Q8onnVFZdBKdSIBpuE/tVZj4WiO5F9+sBVbeeABnCa0tOeW39RRtTRcM
 SlfPtEG6Ij9NUAZDnmkc3Bm/v88nC6vOcc4q47MDShcpUxyScqwiAdfHVnly0i+Yylh4 Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qayunnmq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 08:29:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BC8E10002A;
 Wed,  3 May 2023 08:29:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1508C2122E1;
 Wed,  3 May 2023 08:29:16 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 3 May
 2023 08:29:15 +0200
Message-ID: <a6491b36-b63a-3a9e-f9bc-11aba5843369@foss.st.com>
Date: Wed, 3 May 2023 08:29:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
 <20230427153632.5.Icec632d485db8fb4f25d878dd3b90253a7b2c706@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230427153632.5.Icec632d485db8fb4f25d878dd3b90253a7b2c706@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 5/6] stm32mp: stm32prog: use the decimal
 format by default for offset parsing
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



On 4/27/23 15:36, Patrick Delaunay wrote:
> Change the default base for offset parsing with simple_strtoull(),
> so offset in flashlayout is coded in base 10 by default, even if string
> start with '0'. The Octal encoding is not supported. The base 16
> is still supported when the '0x' header is detected.
> 
> This patch solves an unexpected parsing result when the address,
> provided by decimal value is starting by 0, for example 0x4400 = 00017408
> is a invalid with current code.
> 
> ...
> P	0x04	fsbl1	Binary	mmc0	00017408	        tf-a.stm32
> ....
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index c85217f6d61e..90cf6c39b4a2 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -514,7 +514,7 @@ static int parse_offset(struct stm32prog_data *data,
>  			stm32prog_err("Layout line %d: invalid part '%s'",
>  				      i, p);
>  	} else {
> -		part->addr = simple_strtoull(p, &tail, 0);
> +		part->addr = simple_strtoull(p, &tail, 10);
>  		if (tail == p || *tail != '\0') {
>  			stm32prog_err("Layout line %d: invalid offset '%s'",
>  				      i, p);
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
