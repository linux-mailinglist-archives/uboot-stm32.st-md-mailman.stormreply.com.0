Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 605C265C07F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 14:13:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F70C64110;
	Tue,  3 Jan 2023 13:13:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA835C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 13:13:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303AaKYN020960; Tue, 3 Jan 2023 14:13:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sRb2Ps5UTfPvM9208usiZXKR84t8GHfaslJk+he1Y+0=;
 b=IE0aoUaJh9rgFOggb03LIWx625YRh5qjch7/1P4lpNEFI3Vbre45ybYy5yOzBRYOEhT/
 gaYCj5A7uCtFMvLfKP41kDKSTlt0vqvrPxRSISBBx29YA11Cu5d7CSX/PPbuDumsgojm
 Efjq0X7WmfB0eJUEIWGAhR8XI1OXWFVsyMX+dGmUBkrVhAJa3AbL7wczMGZPRxwaLSqk
 0QBGJgLrBtmAunEZV05Ed+JuSLE5KMlEnWUMNWHolPRky0JPYY15sQOXb+xr4YHXTrfU
 05VOD8fVLEV9OGFoQbyeqvJRUqFieFc9m5UoPCJoLSm5/9IkQRMzBUeFa6RgYQUP1/HD Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e59j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 14:13:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 405BC10002A;
 Tue,  3 Jan 2023 14:13:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AE6521ED34;
 Tue,  3 Jan 2023 14:13:30 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 14:13:29 +0100
Message-ID: <cd4a0f30-c38b-8c13-f026-0991a030243e@foss.st.com>
Date: Tue, 3 Jan 2023 14:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
 <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_04,2023-01-03_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] env: add failing trace in env_erase
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

On 12/14/22 16:51, Patrick Delaunay wrote:
> Add trace in env save to indicate any errors to end user and avoid
> silent output when the command 'env erase' is not executed as it is
> done in env_save with commit 8968288cb477 ("env: add failing trace in
> env_save")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/env.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/env/env.c b/env/env.c
> index 69848fb06080..06078c7f3744 100644
> --- a/env/env.c
> +++ b/env/env.c
> @@ -311,11 +311,15 @@ int env_erase(void)
>  	if (drv) {
>  		int ret;
>  
> -		if (!drv->erase)
> +		if (!drv->erase) {
> +			printf("not possible\n");
>  			return -ENODEV;
> +		}
>  
> -		if (!env_has_inited(drv->location))
> +		if (!env_has_inited(drv->location)) {
> +			printf("not initialized\n");
>  			return -ENODEV;
> +		}
>  
>  		printf("Erasing Environment on %s... ", drv->name);
>  		ret = drv->erase();
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
