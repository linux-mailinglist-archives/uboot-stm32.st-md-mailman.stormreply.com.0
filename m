Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB750B1E4
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:43:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A498C60496;
	Fri, 22 Apr 2022 07:43:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C73EAC60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:43:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M2YGSq028917;
 Fri, 22 Apr 2022 09:43:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6ZSlV+3H2BJPIh2p/niAZ3U48d2JS271L/iEYB9z3sw=;
 b=BXxt69YpjfOkTOE2fYQRhUUpFxdvaWXYrt0FEJ91O3dL00Fpy1KeL7UuL28CwIfsB3jc
 xqqzYrHNHYEzVZMZOuJM568FQMPFytoCQpVr+8JpjvXDReVW2ZuMt4j8gqXzQqkZ/eM2
 Fc12gIY9mFJV6jP6wJG33tCM2ZAh8koq1VDa1sNEO7P/JRoLRfmRDmQLZ25UKgG6zaKf
 eaHitQOXRNqN/4L4yVo7BkRiIBayV2I+8hEreYyxJ2pgG2N8xSo7YahkCYg+0JuhGUhn
 JKaO0YuPU+tAPUIsgB1ErH7XmzhDaov/x0jNWT8dfqWUSw7j+GNbyNXQrrx1UexLji7s Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fk4fvd8fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:43:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A19CD10002A;
 Fri, 22 Apr 2022 09:43:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A66821683B;
 Fri, 22 Apr 2022 09:43:55 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:43:55 +0200
Message-ID: <95ae2bd2-b57d-b715-24c3-84cee3648777@foss.st.com>
Date: Fri, 22 Apr 2022 09:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220415114643.1.Id540e65885e62d3a51328b7f4205a137cd249537@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220415114643.1.Id540e65885e62d3a51328b7f4205a137cd249537@changeid>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: st: common: fix the error messages
 in stboard command
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

On 4/15/22 11:46, Patrick Delaunay wrote:
> Add missing \n at the end of the error trace
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/common/cmd_stboard.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/st/common/cmd_stboard.c b/board/st/common/cmd_stboard.c
> index c1ecd643b0..e12669b862 100644
> --- a/board/st/common/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -92,14 +92,14 @@ static int do_stboard(struct cmd_tbl *cmdtp, int flag, int argc,
>  			&otp, sizeof(otp));
>  
>  	if (ret != sizeof(otp)) {
> -		puts("OTP read error");
> +		puts("OTP read error\n");
>  		return CMD_RET_FAILURE;
>  	}
>  
>  	ret = misc_read(dev, STM32_BSEC_LOCK(BSEC_OTP_BOARD),
>  			&lock, sizeof(lock));
>  	if (ret != sizeof(lock)) {
> -		puts("LOCK read error");
> +		puts("LOCK read error\n");
>  		return CMD_RET_FAILURE;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
