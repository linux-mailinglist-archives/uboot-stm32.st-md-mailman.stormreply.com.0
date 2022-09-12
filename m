Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 268095B54A3
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 08:43:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A010CC65042;
	Mon, 12 Sep 2022 06:43:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1EC8C65041
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 06:43:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C1BVis020782;
 Mon, 12 Sep 2022 08:43:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=idE1ibDQoDlwmFX1IYlMAO/IR+GI85Di2XZsxU6ObF8=;
 b=O9p9/mNsgfcalNTsfNlSEf+FhKmOrQfXgQeJrsBmFteMMeqikoHXZ+n2ZCUeabNrDrTS
 5Vb0L2dTNstTCz08qEl5S1A+7+U1+K7dxawymGfhy0/bXPkmZusjKohdJaqgHemGaiZL
 24ItSjPblsJKStjSslOPDGtwHgyvLSGr7xo3Lc9lHgdIxKw3gM47J9i5wkK+2YggSvC8
 Crv/XRQRML1VsYsmS0mi5oCzebXB4g9wvrx2jDsW2ZgLru8KITWv7duq+418ZvX9+Sgp
 iC23oc4ZIAv3MlhrCgW6AAjzhXwZa9SdTA/29y/U6pN7dfNOKyuTo2J8VmkvQZ/Vxg+F kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnqvmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 08:43:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9D046100045;
 Mon, 12 Sep 2022 08:43:25 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9A242128D6;
 Mon, 12 Sep 2022 08:43:25 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.49) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 08:43:25 +0200
Message-ID: <a1abf03c-d0a6-4161-09e2-c2c53359cc31@foss.st.com>
Date: Mon, 12 Sep 2022 08:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220909172212.1.I257345934e82f832c20e7c5792f7c0186949e93b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220909172212.1.I257345934e82f832c20e7c5792f7c0186949e93b@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: improve the
	partitioning trace
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

On 9/9/22 17:22, Patrick Delaunay wrote:
> Improve the partitioning trace done in command stm32prog:
> - remove the trace "partition: Done" when the GPT partitioning is not done
> - indicate the mmc instance used for each 'gpt write' command
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index c391b6c7abb..7ee4590ef26 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1090,7 +1090,6 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  	if (!buf)
>  		return -ENOMEM;
>  
> -	puts("partitions : ");
>  	/* initialize the selected device */
>  	for (i = 0; i < data->dev_nb; i++) {
>  		/* create gpt partition support only for full update on MMC */
> @@ -1098,6 +1097,7 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  		    !data->dev[i].full_update)
>  			continue;
>  
> +		printf("partitions on mmc%d: ", data->dev[i].dev_id);
>  		offset = 0;
>  		rootfs_found = false;
>  		memset(buf, 0, buflen);
> @@ -1197,8 +1197,8 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>  		sprintf(buf, "part list mmc %d", data->dev[i].dev_id);
>  		run_command(buf, 0);
>  #endif
> +		puts("done\n");
>  	}
> -	puts("done\n");
>  
>  #ifdef DEBUG
>  	run_command("mtd list", 0);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
